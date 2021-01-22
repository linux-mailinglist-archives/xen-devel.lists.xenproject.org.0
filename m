Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE903007E9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72901.131424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004ew-T4; Fri, 22 Jan 2021 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72901.131424; Fri, 22 Jan 2021 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004dp-J8; Fri, 22 Jan 2021 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 72901;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0004bE-DI
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0002OV-Bi
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0000Rr-Ai
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-Lf; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=LXz2SBk/tge0HrEhZ4XkureLZrztgn20+8xs7mXTcOo=; b=5SdFw+NmNwDqyrwk0WHsEfwEOC
	/we6ebyivbGdXtob6RxEI3helLxkswRcWjq1UH41lVvkeVkOV6N/d4wDltgRppIgvHd8gVxdr1a0k
	S7oyxlclfx719KSIAuWAPhVMJ/Q0XHSlyaMQ0FOjOcbqpE6/QOK1ut89rNeptDwyRVvQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/7] ts-xen-install: Honour xenstored target var
Date: Fri, 22 Jan 2021 15:56:01 +0000
Message-Id: <20210122155603.23402-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing sets this yet.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 1 +
 ts-xen-install         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 9e85303a..a0ca6943 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -179,6 +179,7 @@ our @accessible_runvar_pats =
       host_linux_boot_append         *_host_linux_boot_append
       host_ip                        *_host_ip
       host_power_install             *_host_power_install
+      host_xenstored                 *_host_xenstored
    );
 
 #---------- test script startup ----------
diff --git a/ts-xen-install b/ts-xen-install
index fc4bf423..47865eb6 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -142,6 +142,13 @@ sub adjustconfig () {
         (
 	   "XENCONSOLED_TRACE" => "guest",
 	);
+
+    my $xenstored = target_var($ho, 'xenstored');
+    if (defined $xenstored) {
+	$xenstored = "/usr/local/sbin/$xenstored" unless $xenstored =~ m{/};
+	push @commons_config, "XENSTORED", $xenstored;
+    }
+
     target_editfile_root($ho, $commons_config_file,
 	sub { target_editfile_kvp_replace(@commons_config) });
 
-- 
2.20.1


