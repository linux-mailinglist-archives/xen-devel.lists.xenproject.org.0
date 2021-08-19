Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A263F1A57
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168798.308219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi3y-0004Al-Fn; Thu, 19 Aug 2021 13:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168798.308219; Thu, 19 Aug 2021 13:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi3y-00048d-CO; Thu, 19 Aug 2021 13:26:30 +0000
Received: by outflank-mailman (input) for mailman id 168798;
 Thu, 19 Aug 2021 13:26:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mGi3w-00048V-N3
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:26:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mGi3w-0008S2-ME
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:26:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mGi3w-0000MZ-LB
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:26:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mGi3u-0001nu-Qf; Thu, 19 Aug 2021 14:26:26 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GcxC7/3dIN2Vj70gFAN7rQms4ylJOMsnZCWakSsBSig=; b=jMP3zsdBspCjjvt7B3bJCXtpVp
	kOcuMqb9TZos0QTzf/QpMOs0S+fFV2esWxl6iLxW/5gR/Gp+JDtGAX/wB84fuV/R82tvc7n8DcKhZ
	/IhEkVKr9u+VWlY7C9ubfVMXHZx8rXB4YyXp1FbM73JoxFcEIt194Zu5At89YlwgLSSM=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md: Explicitly desupport pvgrub1; and support grub-pv
Date: Thu, 19 Aug 2021 14:26:17 +0100
Message-Id: <20210819132617.10668-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <24862.23463.360542.801702@mariner.uk.xensource.com>
References: <24862.23463.360542.801702@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can no longer conveniently even test pv-grub1; osstest tests for
this have just been dropped from all Xen branches
(by osstest.git#8dee6e333622).

This is without prejudice to its eventual removal.  We should perhaps
proceed cautiously with that since it may be helpful for some old
guests.

Under the circumstances, I think this patch has to be a backport
candidate to all still-supported trees.

CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>,
CC: Wei Liu <wl@xen.org>
Backport-requested-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 SUPPORT.md | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 317392d8f3..9db027a85f 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -832,6 +832,28 @@ OVMF firmware implements the UEFI boot protocol.
 
     Status, qemu-xen: Supported
 
+### grub-pv aka pvgrub2 (guest bootloader)
+
+    Status: Supported
+
+Support in upstream GRUB2 for running in Xen PV, to booting Xen PV
+guests.
+
+Collaboration (and security coordination) and fixes will be provided
+by the Xen Project, as needed.
+
+### x86/HVM pvgrub1 (aka stubdom pv-grub)
+
+    Status: Obsolescent, limited support
+
+GRUB1 compiled with minios and Xen stubdom, to run in guest context.
+This is provided in the Xen source distribution for the benefit of
+very old guests; it is no longer tested, but build and functionality
+fixes are welcome.
+
+pvgrub1 is not security-supported.  However, it runs in guest context,
+so there should be no implications for host security.
+
 # Format and definitions
 
 This file contains prose, and machine-readable fragments.
-- 
2.20.1


