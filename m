Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617507D5413
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622033.969121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRd-0005mb-RY; Tue, 24 Oct 2023 14:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622033.969121; Tue, 24 Oct 2023 14:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRd-0005ks-Nz; Tue, 24 Oct 2023 14:31:45 +0000
Received: by outflank-mailman (input) for mailman id 622033;
 Tue, 24 Oct 2023 14:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIRc-0005kh-D9
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d584cb5-727a-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:31:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9E3B54EE0739;
 Tue, 24 Oct 2023 16:31:41 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0d584cb5-727a-11ee-98d5-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 0/4] address violations of MISRA C Rule 9.3
Date: Tue, 24 Oct 2023 16:31:34 +0200
Message-Id: <cover.1698155925.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses some of the violations of Rule 9.3, which is about
partially initialized arrays. The resolution strategy proposed in these patches
uses designated initializers, except in patch 4, allowed by MISRA for
sparse initialization. The reason why I chose this method is that, given that
most of the violations are about the 'matches' field of struct
'struct dmi_system_id', which is a sized array of structs:

struct dmi_strmatch matches[4];

Since the initialization is already partially implicit, using designated
initalizers is convenient because, if the lenght of the matches array changes,
no adjustment is needed

Another, stricter, resolution strategy is the following:

             .matches  = {
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B7"),
+                DMI_MATCH(DMI_BOARD_NAME,   "30B7"),
+                {}, {}
             }

Note that Rule 9.3 is not about array elements that may be uninitialized, but
the fact of having some explicitly initialized elements and some implicitly
initialized elements.

Nicola Vetrini (4):
  x86/ioemul: address MISRA C:2012 Rule 9.3
  x86/shutdown: address MISRA C:2012 Rule 9.3
  x86/hvm: quirks: address MISRA C:2012 Rule 9.3
  amd/iommu: fully initialize array in 'flush_command_buffer'

 xen/arch/x86/hvm/quirks.c               |  20 ++--
 xen/arch/x86/ioport_emulate.c           |  32 ++---
 xen/arch/x86/shutdown.c                 | 152 ++++++++++++------------
 xen/drivers/passthrough/amd/iommu_cmd.c |   3 +-
 4 files changed, 104 insertions(+), 103 deletions(-)

--
2.34.1

