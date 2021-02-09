Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C367F31557E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83372.154995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIC-0007ed-2D; Tue, 09 Feb 2021 17:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83372.154995; Tue, 09 Feb 2021 17:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIB-0007eF-V5; Tue, 09 Feb 2021 17:59:15 +0000
Received: by outflank-mailman (input) for mailman id 83372;
 Tue, 09 Feb 2021 17:59:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XI9-0007dX-S8
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XI9-0003yp-OO
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XI9-0004cv-MB
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XI7-00065Y-NK; Tue, 09 Feb 2021 17:59:11 +0000
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
	bh=DeylNrZYYK3wMWxKS9RPXvprA8fskbcUy3SMB2/3gZ8=; b=YY4Hz0YJpc+VgI5f4qu8w1f9vh
	2B9/AgT9Mod3ed28iSgZMackaFGtssgGVMKlehZ8sX7NEuezlyZnEicsF6yaKmpLAXyS+csxe1nbO
	eNt/TS4wz2TKzqRYuEfTzLc/WWsKkms6edoaGMYIA4/+6eAYXxRKuHy16LmTqTGmPeCs=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/7] mg-debian-installer-update: Honour redirect for dtbs
Date: Tue,  9 Feb 2021 17:58:58 +0000
Message-Id: <20210209175904.28282-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using snapshots, we can get a redirect and then we don't
recurse.  There doesn't seem to be a suitable option for wget, so do
this by hand before we call wget -m.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-debian-installer-update | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mg-debian-installer-update b/mg-debian-installer-update
index fb4fe2ab..5e890d34 100755
--- a/mg-debian-installer-update
+++ b/mg-debian-installer-update
@@ -89,7 +89,12 @@ if [ "x$dtbs" != "x" ] ; then
     # Can't seem to get curl to globs.
     rm -rf dtbs
     mkdir dtbs
-    ( cd dtbs && wget -nv -A README,\*.dtb -nd -nH -np -m  $dtbs )
+    dtbs_redir="$(curl -sSI -o /dev/null -w '%{redirect_url}' $dtbs)"
+    if [ "x$dtbs_redir" != x ]; then
+        dtbs=$dtbs_redir
+        echo "Redirected for dtbs, to $dtbs"
+    fi
+    ( cd dtbs && wget -nv -A README,\*.dtb -nd -nH -np -m  "$dtbs" )
     tar --mtime=./dtbs/README -cf dtbs.tar dtbs
     gzip -9nf dtbs.tar
 fi
-- 
2.20.1


