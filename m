Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D187D09C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693916.1082606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nn-0007IY-Fh; Fri, 15 Mar 2024 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693916.1082606; Fri, 15 Mar 2024 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nn-0007G8-Cl; Fri, 15 Mar 2024 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 693916;
 Fri, 15 Mar 2024 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ka1=KV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rl9nl-0006nS-Mo
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 15:48:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87ceb89e-e2e3-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 16:48:56 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e9ba0eadcso1737201f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 08:48:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 bw29-20020a0560001f9d00b0033ecaf7a2adsm3394689wrb.23.2024.03.15.08.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 08:48:53 -0700 (PDT)
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
X-Inumbo-ID: 87ceb89e-e2e3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710517735; x=1711122535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cff+tBKrHygNjFy5WuxJ/QQ3GCTm7QZWRNHRxDD+f0Y=;
        b=qu1d5hb+4s8N3YWQ5eJoYhoguaQaj08LUSi1GH149/ZC++jYG6eIfvdJfhtL/5Kst8
         1DHW1qlwWodEBJTkr2BPvFwuAk+1vkrm6jNXdNJFvOBj0lOqvF/SC80e7+QGAGqTqMKr
         HVp6SGHcLD4rD3kWyw9LF5PggDeBvqlo4m9GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710517735; x=1711122535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cff+tBKrHygNjFy5WuxJ/QQ3GCTm7QZWRNHRxDD+f0Y=;
        b=qTIxg2dTj9n/nixrtAKRh+LKofEsE/KxlTU1Dsxxy2o4+N0EiTdmZlxT/Db4oSaM1t
         0qUBWaZVGWeqxjwsDaaRZwKRMLNeaCnTEHaghwfjhofVTYfPXFJn2nMIQ6gjn4vPdMig
         cvYOLbmXx/UW6s8UnuddThF81CWv6WAemSWIe7zKD6xNq5HQrhnBHbP7XMtMRIfiakCh
         ekoKoXdz7R1YOZg29rGlHySH4Jdr2jZE+3b13lkl8Z7LQdA44FdgR9oVrlhj16goBwiD
         lGLIQ8elsz+iyWQl9No8RVoDdANMxLnhnmKSrrhYT4HiKYb8HD/qWTpGI3TkZE8vrUaK
         Tulw==
X-Gm-Message-State: AOJu0YwvHzh2njAtn8rpIYTkyDClDkbRU+FmATOirxckMfa16FjVKrYf
	tVpDzLkJOEmViSyUQi+ZtiP15qDb/o7+WT0oW8LoS0ZlCUzXMIzWqMZcWKR+PTKfP90IdfZ3vNT
	K
X-Google-Smtp-Source: AGHT+IE+Q3XFie4743wbkm+Cs8yfcDEkexgkNESoNnzxOrsUwhfQSsm5hBauDDfM7Dkh3oVC0kKRhA==
X-Received: by 2002:a5d:428c:0:b0:33e:774f:e3ca with SMTP id k12-20020a5d428c000000b0033e774fe3camr4246024wrq.64.1710517735190;
        Fri, 15 Mar 2024 08:48:55 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH v2 2/3] mfi-common: Rework toolstack-disk_format test matrix
Date: Fri, 15 Mar 2024 15:48:48 +0000
Message-Id: <20240315154849.28819-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315154849.28819-1-anthony.perard@citrix.com>
References: <20240315154849.28819-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is 6 potenteil test of toolstack disk_format combination:
{xl,libvirt}-{raw,vhd,qcow2}. Commit f536e834f673 ("make-flight: Trim
the matrix of disk format flights") introduced a way to avoid testing
on every architecture and actually do only 6 tests accross all
arches, 3 on x86, 3 on armhf (no arm64 at the time).

But, commit 5c70735f177f ("fmtarches: Use dom0arches, not hardcoded
arch list") broke that. There's an extra space ' ' added at the
begining of the string in variable $fmtarches_outer which break the
algorithm. This mean that the combination of xl+raw is never tested
and both armhf and amd64 are testing the same combination of
toolstack+disk_format.

We could just remove the extra ' ', but that would mean 3 extra tests
on armhf and 3 extra tests on arm64. At least x86 would have a test
for each combination.

I'd like to avoid adding more arm* tests due to limited capacity, so
the new goal is to have the 6 combination of toolstack-disk_format
spread on both arm*, where each get to test all possible disk_format.
On x86, we are also going to tests all 6 combinations, which might all
happen on dom0=amd64 if we don't test dom0=i386, or they will be
spread on both kind of dom0.

To avoid too many changes in jobs on x86 with the current list of
jobs, we reverse the order of "i386" and "amd64".

Jobs changes on xen-unstable and most branches:
x86:
+ test-amd64-amd64-xl-raw
+ test-amd64-i386-libvirt-qcow2
arm*:
- test-armhf-armhf-libvirt-qcow2
- test-armhf-armhf-libvirt-raw
- test-armhf-armhf-xl-vhd
+ test-armhf-armhf-libvirt-vhd
+ test-armhf-armhf-xl-qcow2
+ test-armhf-armhf-xl-raw

Jobs changes on linux-{linus,next,6.1}:
x86:
+ test-amd64-amd64-libvirt-vhd
+ test-amd64-amd64-xl-qcow2
+ test-amd64-amd64-xl-raw
arm*:
- test-armhf-armhf-libvirt-qcow2
- test-armhf-armhf-libvirt-raw
- test-armhf-armhf-xl-vhd
+ test-armhf-armhf-libvirt-vhd
+ test-armhf-armhf-xl-qcow2
+ test-armhf-armhf-xl-raw

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Putting i386 in second or later in dom0arches mean that the freebsd10
    jobs on i386 are been renamed to have -qemuu... but those will
    disappear with a follow-up change to use linux 6.1, as will stop i386
    dom0 tests.

 mfi-common | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mfi-common b/mfi-common
index d8d167fd..00669677 100644
--- a/mfi-common
+++ b/mfi-common
@@ -649,7 +649,7 @@ test_matrix_iterate () {
       esac
 
       dom0arches=''
-      for dom0arch in i386 armhf amd64 arm64; do
+      for dom0arch in amd64 i386 armhf arm64; do
 
         case ${xenarch}_${dom0arch} in
             amd64_amd64) ;;
@@ -667,9 +667,15 @@ test_matrix_iterate () {
 
         dom0arches+=" $dom0arch"
       done
+      dom0arches=${dom0arches# }
 
       for dom0arch in $dom0arches; do
 
+        # For disk format tests, in do_pv_debian_tests()
+        case $xenarch in
+            arm*) dom0arches="armhf arm64" ;;
+        esac
+
         eval "
             arch_runvars=\"\$ARCH_RUNVARS_$dom0arch\"
         "
-- 
Anthony PERARD


