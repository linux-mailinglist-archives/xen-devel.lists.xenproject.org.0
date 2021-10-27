Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6B43CF65
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 19:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217118.376982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKd-0004dP-HJ; Wed, 27 Oct 2021 17:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217118.376982; Wed, 27 Oct 2021 17:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKd-0004XK-8y; Wed, 27 Oct 2021 17:03:19 +0000
Received: by outflank-mailman (input) for mailman id 217118;
 Wed, 27 Oct 2021 17:03:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-0004Tv-Fd
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00007K-Eq
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00008d-DO
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mfmKP-0007y4-MO; Wed, 27 Oct 2021 18:03:05 +0100
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
	bh=aV0xoRJrzvDBM4vBQY4k8X980Lt0ARIHFyS24ypIT/o=; b=gbtSh3DWra8q9KhmBva49ms8mw
	UcCVBcn717j3sVsIheBdSAaUDC00u9qtBU1RIOyGtPq4EzJZI92XOvBITlaZAekvkCZ/5IC57gx09
	eRDP7R3Dtyd8JZzcHymytuAaBHWPWwcSpKpmb/1j/2mGFtMzJW7UWFHWaJtZLNugGljc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH 1/2] ts-xen-build: Refactor enable/disable configure options
Date: Wed, 27 Oct 2021 18:02:55 +0100
Message-Id: <20211027170256.18223-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027170256.18223-1-iwj@xenproject.org>
References: <20211027170256.18223-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the repeated pattern with a function to generate that code.
No significant functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
---
 ts-xen-build | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/ts-xen-build b/ts-xen-build
index ccb2aba23..d6f6bfacb 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -142,9 +142,21 @@ END
 }
 
 sub build () {
-    my $xend_opt= $r{enable_xend} =~ m/true/ ? "--enable-xend" : "--disable-xend";
-    my $ovmf_opt= $r{enable_ovmf} =~ m/true/ ? "--enable-ovmf" : "--disable-ovmf";
-    my $qemutrad_opt = $r{arch} =~ m/amd64|i386/ ? "--enable-qemu-traditional" : "--disable-qemu-traditional";
+    my $enable_opts = ''; # shell script to set "enable_opts" shell var
+    my $enable_disable = sub {
+	my ($subdir, $feat, $enable) = @_;
+	my $opt = "--".($enable ? 'enable' : 'disable')."-$feat";
+	$enable_opts .= <<END;
+                if grep -q -- $opt \\
+                               ${subdir}configure ; then
+		    enable_opts="\$enable_opts $opt"
+                fi
+END
+    };
+    
+    $enable_disable->("tools/", "xend", $r{enable_xend} =~ m/true/);
+    $enable_disable->("tools/", "ovmf", $r{enable_ovmf} =~ m/true/);
+    $enable_disable->("tools/", "qemu-traditional", $r{arch} =~ m/amd64|i386/);
 
     my $configure_prefix = $r{cmdprefix_configure} // '';
     my $configure_suffix = $r{cmdsuffix_configure} // '';
@@ -152,17 +164,9 @@ sub build () {
 
     buildcmd_stamped_logged(600, 'xen', 'configure', <<END,<<END,<<END);
             if test -f configure; then
-                if grep -q -- $xend_opt tools/configure ; then
-		    xend=$xend_opt
-                fi
-                if grep -q -- $ovmf_opt tools/configure ; then
-                    ovmf=$ovmf_opt
-                fi
-                if grep -q -- $qemutrad_opt tools/configure ; then
-                    qemutrad=$qemutrad_opt
-                fi
+$enable_opts
 END
-               $configure_prefix ./configure --sysconfdir=/etc \$xend \$ovmf \$qemutrad $configure_suffix @configure_args
+               $configure_prefix ./configure --sysconfdir=/etc \$enable_opts $configure_suffix @configure_args
 END
             fi
 END
-- 
2.20.1


