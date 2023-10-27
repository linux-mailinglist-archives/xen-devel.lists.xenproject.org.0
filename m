Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52567D9A21
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624409.973000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1M-0005Wo-4p; Fri, 27 Oct 2023 13:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624409.973000; Fri, 27 Oct 2023 13:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1M-0005Tr-1x; Fri, 27 Oct 2023 13:37:04 +0000
Received: by outflank-mailman (input) for mailman id 624409;
 Fri, 27 Oct 2023 13:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwN1L-0005Th-26
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:37:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e857fd20-74cd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 15:37:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 49DA34EE073E;
 Fri, 27 Oct 2023 15:36:59 +0200 (CEST)
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
X-Inumbo-ID: e857fd20-74cd-11ee-9b0e-b553b5be7939
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH][for-4.19 v2 0/2] use the macro ISOLATE_LOW_BIT where appropriate
Date: Fri, 27 Oct 2023 15:36:54 +0200
Message-Id: <cover.1698413073.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces two instances of the pattern (x & -x) with the
macro ISOLATE_LOW_BIT, introduced by the series [1]. Therefore, these patches should
be applied on top of that series.

[1] https://marc.info/?l=xen-devel&m=169841347803987&w=2

Changes in v2:
- s/LOWEST_BIT/ISOLATE_LOW_BIT/

Nicola Vetrini (2):
  xen/vmap: use ISOLATE_LOW_BIT to wrap a violation of Rule 10.1
  xen/iommu: use ISOLATE_LOW_BIT to wrap a violation of Rule 10.1

 xen/common/vmap.c               | 2 +-
 xen/drivers/passthrough/iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

