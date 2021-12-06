Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1846A3E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239721.415638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZx-000263-MT; Mon, 06 Dec 2021 18:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239721.415638; Mon, 06 Dec 2021 18:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZx-00024C-Ia; Mon, 06 Dec 2021 18:19:09 +0000
Received: by outflank-mailman (input) for mailman id 239721;
 Mon, 06 Dec 2021 18:19:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-00023n-V0
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-00041S-Tf
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-0004SP-Sd
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZa-0001ab-95; Mon, 06 Dec 2021 18:18:46 +0000
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
	bh=lEtnuJt+WSxztv0gI+YXz7Qx8X+A2HNxfMWZD6HRtIs=; b=wvUjxe2uF+XeLWkd/xfRulO+8V
	8UAuscO2uAeMnsQl+7jCkp8Vocvq3vOUto4kgsCx02mkuVJPknsyGFi4OHrf2v7DGy+iqAwbb3Pf9
	L9LFNeG5/VDQURq9Vx10fe2cOna0j8MtVzRfGM5Q4HS7jI4p2L5OvrQsvzDMpMUjGftk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 01/13] make-flight: do_examine_one: add firmware argument
Date: Mon,  6 Dec 2021 18:18:27 +0000
Message-Id: <20211206181839.23463-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing sets this yet.

No functional change (checked with standalone-generate-dump-flight-runvars)

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
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


