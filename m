Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A933007E8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72897.131385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004bp-8t; Fri, 22 Jan 2021 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72897.131385; Fri, 22 Jan 2021 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004bO-0l; Fri, 22 Jan 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 72897;
 Fri, 22 Jan 2021 15:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0004at-HF
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0002OJ-DH
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0000R1-CF
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynC-0004Ar-FM; Fri, 22 Jan 2021 15:56:10 +0000
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
	bh=uruu1brBPF9CVtq5ECLiA2WZSJ/C5nDctUOD+ZVBmXU=; b=Duuglm/o8nqen2vKVN1Ni6L2aU
	wEW0ekrTR/+HNo26L0mLodfx3ucdIJAc3NhDZib25DBFG0rbKS0uf2hmRNV9IravzSO8yca7Eg7Wz
	F9Ch+jxTL+T5uXcB3Ri4KwLZNoEXkTbPX6phA/gmarx/W1PmpZ3rbs+Wt35sl69E5qHQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/7] target_editfile_kvp_replace: Support changing multiple keys
Date: Fri, 22 Jan 2021 15:55:57 +0000
Message-Id: <20210122155603.23402-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change with existing callers.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 9362a865..d2558f31 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -769,25 +769,32 @@ sub teditfileex {
 	if $install;
 }
 
-# Replace a Key=Value style line in a config file.
+# Replace Key=Value style line(s) in a config file.
 #
 # To be used as 3rd argument to target_editfile(_root) as:
 #    target_editfile_root($ho, "/path/to/a/file",
 #			 sub { target_editfile_kvp_replace($key, $value) });
-sub target_editfile_kvp_replace ($$)
+sub target_editfile_kvp_replace
 {
-    my ($key,$value) = @_;
-    my $prnow;
-    $prnow= sub {
+    my (%kv) = @_;
+    my $prnow= sub {
+	my ($key) = @_;
+	my $value = $kv{$key};
+	return unless defined $value;
 	print ::EO "$key=$value\n" or die $!;
-	$prnow= sub { };
+	delete $kv{$key};
     };
     while (<::EI>) {
-	print ::EO or die $! unless m/^$key\b/;
-	$prnow->() if m/^#$key/;
+	if (m/^\S+\b/ && exists $kv{$&}) {
+	    $prnow->($&);
+	} else {
+	    print ::EO or die $!;
+	}
     }
     print ::EO "\n" or die $!;
-    $prnow->();
+    foreach my $key (sort keys %kv) {
+	$prnow->($key);
+    }
 };
 
 sub target_editfile_root ($$$;$$) { teditfileex('root',@_); }
-- 
2.20.1


