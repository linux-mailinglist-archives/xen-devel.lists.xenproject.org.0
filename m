Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E913007EA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72899.131403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004dN-1O; Fri, 22 Jan 2021 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72899.131403; Fri, 22 Jan 2021 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004cS-N1; Fri, 22 Jan 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 72899;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0004b3-VA
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0002OP-UO
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0000RT-SX
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-5W; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=GOOGnmdC7TmDzuok1J8HYpZTYLuCXs1wW2s99KsC2o0=; b=vGLpEwIan930QL9r1fU+09arom
	P3LSIqX1WHN4/3GPDetIo8Zac/Fk0AnDu4RUS94sumU/jjshPfozq1U54Et1+miPzvS/fyfp61dqy
	15h5zy6wKLacmOdSH/DIBPRL4l9MR7D72lxAFaiPVZSXt12+CxaQcZc8rDBSl3doPBy8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/7] ts-xen-install: Rename $commons_config_file
Date: Fri, 22 Jan 2021 15:55:59 +0000
Message-Id: <20210122155603.23402-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the shell script config for xencommons.  We are going to set
other things here too.

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ts-xen-install b/ts-xen-install
index 5d4f8b0d..feb98951 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -127,18 +127,18 @@ sub adjustconfig () {
 	print EO $extra or die $!;
     }) if toolstack($ho)->{Name} eq "xend";
 
-    my $trace_config_file;
+    my $commons_config_file;
     foreach my $try (qw(/etc/default/xencommons
                         /etc/sysconfig/xencommons
                         /etc/default/xend
                         /etc/sysconfig/xend)) {
         next unless target_file_exists($ho, $try);
-        $trace_config_file= $try;
+        $commons_config_file= $try;
         last;
     }
-    die unless defined $trace_config_file;
+    die unless defined $commons_config_file;
 
-    target_editfile_root($ho, $trace_config_file,
+    target_editfile_root($ho, $commons_config_file,
 	sub { target_editfile_kvp_replace("XENCONSOLED_TRACE", "guest") });
 
     target_editfile_root($ho, '/etc/libvirt/libvirtd.conf',
-- 
2.20.1


