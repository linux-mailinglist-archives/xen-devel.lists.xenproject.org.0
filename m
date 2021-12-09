Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9C46E9F1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 15:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243090.420407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKOA-0001au-I0; Thu, 09 Dec 2021 14:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243090.420407; Thu, 09 Dec 2021 14:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKOA-0001YS-Dm; Thu, 09 Dec 2021 14:27:14 +0000
Received: by outflank-mailman (input) for mailman id 243090;
 Thu, 09 Dec 2021 14:27:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mvKO9-0001YM-CM
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 14:27:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mvKO9-0002ts-AV
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 14:27:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mvKO9-0002uA-9N
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 14:27:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mvKNj-0004px-MZ; Thu, 09 Dec 2021 14:26:47 +0000
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=7H/vJlCkyRKlmrzk69NkyyOL/b3gdIPsGGusOthjk3E=; b=Xp/S78I75Mke21soVCLWjw9tHq
	eeZGqssot5xwSltVNxA5h1Z5X6tyFY08Gy1d9drNk8fsm0SRnxr5XOF/80JyMaZtPq83Yjkscc/ym
	zcoTRWlzqP+XtUQOmPGDSSGH8jHnAJTDgLJpaJuyLfEnjLBo05yGlxw3vg0e/fjO5hIY=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md, MAINTAINERS: De-support qemu-xen-traditional
Date: Thu,  9 Dec 2021 14:26:40 +0000
Message-Id: <20211209142640.24437-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 4.16 we changed to not build this by default.  I think it is now
time to explicitly desupport it, completely, in favour of Linux dm
stub domains.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 MAINTAINERS |  2 +-
 SUPPORT.md  | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e43dc0edce..933579541f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -455,7 +455,7 @@ S:	Supported
 F:	tools/python
 
 QEMU-DM
-S:	Supported
+S:	Obsolete
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
 QEMU UPSTREAM
diff --git a/SUPPORT.md b/SUPPORT.md
index 3a34933c89..b64ebee93b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -802,17 +802,17 @@ See the section **Blkback** for image formats supported by QEMU.
 ### qemu-xen-traditional ###
 
 The Xen Project provides an old version of qemu with modifications
-which enable use as a device model stub domain.  The old version is
-normally selected by default only in a stub dm configuration, but it
-can be requested explicitly in other configurations, for example in
-`xl` with `device_model_version="QEMU_XEN_TRADITIONAL"`.
+which enable use as a device model stub domain.  This old version is
+not built by default.  Even if it is build, it is normally selected by
+default only in a stub dm configuration, but it can be requested
+explicitly in other configurations, for example in `xl` with
+`device_model_version="QEMU_XEN_TRADITIONAL"`.
 
-    Status, Device Model Stub Domains: Supported, with caveats
-    Status, as host process device model: No security support, not recommended
+When device model stub domains are desired for the additional
+security, we recommend using a device model stub domain consisting of
+a modern qemu and a Linux kernel.
 
-qemu-xen-traditional is security supported only for those available
-devices which are supported for mainstream QEMU (see above), with
-trusted driver domains (see Device Model Stub Domains).
+    Status: Obsolete
 
 ## Virtual Firmware
 
-- 
2.20.1


