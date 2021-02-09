Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C431557A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83375.155029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XID-0007hH-Gg; Tue, 09 Feb 2021 17:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83375.155029; Tue, 09 Feb 2021 17:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XID-0007g1-6R; Tue, 09 Feb 2021 17:59:17 +0000
Received: by outflank-mailman (input) for mailman id 83375;
 Tue, 09 Feb 2021 17:59:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0007e5-6G
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0003yy-5Z
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0004di-4W
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XI9-00065Y-8X; Tue, 09 Feb 2021 17:59:13 +0000
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
	bh=ZGibySREmlkdtxh1B3xdTGiAPnSGGHBkgH+xeUe0jfg=; b=ZXghKaLkqZMGrYekheqY7qwBmD
	6SbZ629tQKFK7kN0tFA5MEbVOXnOhSdxyaK5G92Bm4f8gMECaSQJGcH04JYRoB+GJLeO9ZA30OeoI
	W7MfzLxXgPaZ0Vd8bY/HX/wlSUC7GDuxkCNpn5gJm+MGfWMlBuUXMJfIaDPORooZajRw=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/7] mg-debian-installer-update: Use Debian mirror selection
Date: Tue,  9 Feb 2021 17:59:01 +0000
Message-Id: <20210209175904.28282-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209175904.28282-1-iwj@xenproject.org>
References: <20210209175904.28282-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NFC with existing config.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-debian-installer-update | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mg-debian-installer-update b/mg-debian-installer-update
index 5e890d34..4fb4bc21 100755
--- a/mg-debian-installer-update
+++ b/mg-debian-installer-update
@@ -28,7 +28,13 @@ suite=$1
 arch=$2
 packages="$3"
 
-site=http://ftp.debian.org/debian/
+site=$(perl -we '
+    use Osstest;
+    use Osstest::Debian;
+    readglobalconfig();
+    print debian_mirror_url_suite_arch($ARGV[0], $ARGV[1]) or die $!;
+' "$suite" "$arch")
+
 sbase=$site/dists/$suite
 
 src=$sbase/main/installer-$arch/current/images/netboot/
-- 
2.20.1


