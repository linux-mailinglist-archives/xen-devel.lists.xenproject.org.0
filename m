Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2880866B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 12:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649777.1014667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCHs-0005LZ-Tx; Thu, 07 Dec 2023 11:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649777.1014667; Thu, 07 Dec 2023 11:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCHs-0005Iw-Po; Thu, 07 Dec 2023 11:11:24 +0000
Received: by outflank-mailman (input) for mailman id 649777;
 Thu, 07 Dec 2023 11:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZpn=HS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rBCHr-0005Ik-6p
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 11:11:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a5609df-94f1-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 12:11:22 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 17E9F4EE073A;
 Thu,  7 Dec 2023 12:11:21 +0100 (CET)
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
X-Inumbo-ID: 5a5609df-94f1-11ee-98e7-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/3] address some violations of MISRA C Rule 8.4
Date: Thu,  7 Dec 2023 12:11:15 +0100
Message-Id: <cover.1701947290.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 8.4 states:
"A compatible declaration shall be visible when an object or function with
external linkage is defined".

Changes from v1:
- Patch 1/7 has been committed;
- Patch 2/7 has been dropped, as the fix is already part of [1];
- Patch 3/7 drops the addition of asmlinkage on variables. Discussion on how to
  handle the existing uses can be part of a separate patch;
- Patch 4/7 is unchanged;
- Patch 5/7 has been committed;
- Patch 6/7 has been dropped
- Patch 7/7 has been revised to have a declaration for first_valid_mfn, rather
  than a deviation for the absence of a declaration

[1] https://lore.kernel.org/xen-devel/27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com/

Nicola Vetrini (3):
  xen/x86: add missing instances of asmlinkage attributes
  x86/viridian: make build_assertions static
  xen/mm: add declaration for first_valid_mfn

 xen/arch/x86/efi/efi-boot.h       | 5 +++--
 xen/arch/x86/hvm/viridian/synic.c | 2 +-
 xen/arch/x86/smpboot.c            | 2 +-
 xen/include/xen/mm.h              | 2 ++
 4 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1

