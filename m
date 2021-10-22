Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA5437AB2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215162.374184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBH-0007Tr-3A; Fri, 22 Oct 2021 16:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215162.374184; Fri, 22 Oct 2021 16:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBG-0007O0-S6; Fri, 22 Oct 2021 16:14:06 +0000
Received: by outflank-mailman (input) for mailman id 215162;
 Fri, 22 Oct 2021 16:14:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0007Ll-J7
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0008Ib-IR
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0005pZ-HJ
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mdxBB-00021I-TW; Fri, 22 Oct 2021 17:14:02 +0100
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
	bh=7IUjLruFSXIBQC2SZQbBsA+xVWNefGvveU/I4eJ4VMw=; b=n3T7JFz5UR+KrQAIkiy8yxlqdX
	CdoatbDWJY6mp0Fj8Bd6cLd1nWGBB0nFHWqaaqvHeXapL8e6FxotpHX+C7qAnuYdUCbpQRjkhOLb6
	UtASnRkwfdhtgIkfHJJx2V4S4kMA6LLk+Pu/W+Nmur8YGZEKU2wdVz0WXfyHtbMLcuR8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/5] make-flight: do_examine_one: add firmware argument
Date: Fri, 22 Oct 2021 17:13:47 +0100
Message-Id: <20211022161351.23091-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211022161351.23091-1-iwj@xenproject.org>
References: <20211022161351.23091-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing sets this yet.

No functional change (checked with standalone-generate-dump-flight-runvars)

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 make-flight | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/make-flight b/make-flight
index ecbb195bc..acb19b113 100755
--- a/make-flight
+++ b/make-flight
@@ -687,20 +687,31 @@ do_pv_debian_tests () {
 }
 
 do_examine_one () {
+  local firmware="$1"
+
   case "$branch" in
     xen-unstable)		;; # only likely to regress on -unstable
     osstest)			;; # very likely to regress
     linux-*)			;; # often seems to regress
     *)			return	;; # stuff used for guests is irrelevant
   esac
+
+  local firmware_suffix
+  local firmware_hostflag
+  if [ "$firmware" ]; then
+    firmware_suffix=-$firmware
+    firmware_hostflag=,PropEq:Firmware:bios:$firmware
+  fi
+
   local freebsd_runvars
   # set_freebsd_runvars expects $arch to be set to the desired FreeBSD arch.
   local arch=$dom0arch
   # Pass true to not append any hostflags when creating the FreeBSD runvars.
   set_freebsd_runvars true
-  job_create_test test-$xenarch$kern-$dom0arch-examine \
+  job_create_test test-$xenarch$kern-$dom0arch-examine${firmware_suffix} \
                   host-examine-xen xl $xenarch $dom0arch \
-                  all_hostflags=$most_hostflags $freebsd_runvars
+                  all_hostflags=$most_hostflags$firmware_hostflag \
+                  $freebsd_runvars
 }
 
 test_matrix_do_one () {
-- 
2.20.1


