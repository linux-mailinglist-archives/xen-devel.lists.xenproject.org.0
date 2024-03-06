Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4D8735DF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689094.1074073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhplW-0004mf-3u; Wed, 06 Mar 2024 11:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689094.1074073; Wed, 06 Mar 2024 11:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhplW-0004kb-15; Wed, 06 Mar 2024 11:48:54 +0000
Received: by outflank-mailman (input) for mailman id 689094;
 Wed, 06 Mar 2024 11:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhplU-0004kT-OM
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:48:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8068285b-dbaf-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:48:51 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56781070f38so1309012a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:48:51 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056402358600b005645961ad39sm6764400edc.47.2024.03.06.03.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 03:48:50 -0800 (PST)
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
X-Inumbo-ID: 8068285b-dbaf-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709725731; x=1710330531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=np/f+KMAe5bM0QmR4knfzGRTCYdocIjIi5uetrq305w=;
        b=NUSh7FTB7d4EBBAYF0MSnpxHObL7QqNC4uIz7k9473zhnr4mNFugl7smf8kMWwBtVZ
         5ckxpeno/5hlVNEfWFxf7skQ09IVMa3qFw6Zz59Mkx6tNjAsknoHXkscgiHnxGaOcP5L
         k4CjFH9AkldB2lvjthM+aNBnC40mIpv20q7qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709725731; x=1710330531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np/f+KMAe5bM0QmR4knfzGRTCYdocIjIi5uetrq305w=;
        b=YJ1oULhhglD2B89m7xToNRmW+1XvrlaUGIKRL9a19zIPH6WaLFr4e9qP6InLjSEI8E
         gqCwnhLflqK6l51OJYt52/ogTBqj+aCvDStCAkVIcHuzlwi/46uu7bBe5k78FZCZZDof
         pnRfRuLGCFZMI5MP8c4ShADjIqT0pJbRV6lRkPEiblIsRRJh92u9piHoomhJ9NXgi54b
         Hl5jG5ld93SgsEidYBt9K+5LXSF+e7OaidM4gtaXwdCi86UW1ZLcjlRAO6eIkrjnq8Mp
         ms5cV5MJQJM2uWw5MdguPrGQmnIgEUwDcRDjZxvs+PQsz4aIYJA3KtHmOXmvtv1zflMg
         GBEg==
X-Gm-Message-State: AOJu0Ywe6x/sWpmZTJd3lhQ76JhMgaAuqMBThW/ITUFdPTY+jpeqfXTu
	x+naSVhrbuPkjvG+LWx0ZhlDJ9rDlqGXTbh6ZQVQeAQd9avoP2lBxIDoOPajTB21kxv7drJQbqJ
	N
X-Google-Smtp-Source: AGHT+IELCUNgE3HJxQg2M7mLQt4Z59m1BOk6kt3fV2Eh1Y7sm4SrtzE7To059GhDwRc5pkYQAzfiaA==
X-Received: by 2002:a17:906:e252:b0:a45:8b1d:696 with SMTP id gq18-20020a170906e25200b00a458b1d0696mr6079328ejb.8.1709725731002;
        Wed, 06 Mar 2024 03:48:51 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86 + drop dom0 i386
Date: Wed,  6 Mar 2024 11:47:41 +0000
Message-Id: <20240306114741.14564-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux-4.19 branch in xenbits is outdated, it haven't been updated and
tested since 2020 as it has been disabled in osstest. Also, this 4.19
branch doesn't build on Bookworm.

So we will start to use a newer version of Linux. We switch to 6.1 for
the Arm* tests recently, so will use that same version for x86.

Also, following commit 3a3089c94913 ("mfi-common: Drop Linux dom0 i386
tests for newer Linux branches"), 32bit dom0 isn't tested on newer
Linux, so we need to drop all dom0 i386 tests wherever the default
linux branch is used. That is, this changes in jobs will apply to
"xen-unstable" branch but also all xen stable branches, seabios, qemu,
osstest, libvirt, so every branch that aren't "linux-*".

Here is the list jobs that changes, and whether they are replace, or
have existing equivalents, on the "xen-unstable" branch. Changes
compared with:
    OSSTEST_CONFIG=standalone-config-example nice eatmydata ./standalone-generate-dump-flight-runvars

Gone, without exiting or new test-amd64-amd64-*:
- test-amd64-i386-freebsd10-amd64
- test-amd64-i386-freebsd10-i386
- test-amd64-i386-qemut-rhel6hvm-amd
- test-amd64-i386-qemut-rhel6hvm-intel
- test-amd64-i386-qemuu-rhel6hvm-amd
- test-amd64-i386-qemuu-rhel6hvm-intel

Gone, but with exiting test-amd64-amd64-* equivalent:
- test-amd64-coresched-i386-xl
- test-amd64-i386-examine
- test-amd64-i386-examine-bios
- test-amd64-i386-examine-uefi
- test-amd64-i386-libvirt
- test-amd64-i386-libvirt-pair
- test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
- test-amd64-i386-libvirt-xsm
- test-amd64-i386-livepatch
- test-amd64-i386-migrupgrade
- test-amd64-i386-pair
- test-amd64-i386-xl
- test-amd64-i386-xl-pvshim
- test-amd64-i386-xl-qemut-debianhvm-amd64
- test-amd64-i386-xl-qemut-debianhvm-i386-xsm
- test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
- test-amd64-i386-xl-qemut-win7-amd64
- test-amd64-i386-xl-qemut-ws16-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow
- test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
- test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
- test-amd64-i386-xl-qemuu-ovmf-amd64
- test-amd64-i386-xl-qemuu-win7-amd64
- test-amd64-i386-xl-qemuu-ws16-amd64
- test-amd64-i386-xl-shadow
- test-amd64-i386-xl-simplat-amd64-buster
- test-amd64-i386-xl-xsm

Gone, but replaced by a new test-amd64-amd64-*:
- test-amd64-i386-libvirt-raw
- test-amd64-i386-xl-vhd

Some test-amd64-amd64-* are also changed:
- test-amd64-amd64-libvirt-vhd
- test-amd64-amd64-qemuu-freebsd11-amd64
- test-amd64-amd64-qemuu-freebsd12-amd64
- test-amd64-amd64-xl-qcow2
+ test-amd64-amd64-freebsd11-amd64
+ test-amd64-amd64-freebsd12-amd64
+ test-amd64-amd64-libvirt-qcow2
+ test-amd64-amd64-libvirt-raw
+ test-amd64-amd64-xl-vhd

In any case, the list of test would be the same as for the existing
branch "linux-linus" or "linux-6.1" branches.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ap-common  | 2 +-
 mfi-common | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ap-common b/ap-common
index 48a95a22..5384891b 100644
--- a/ap-common
+++ b/ap-common
@@ -59,7 +59,7 @@
 
 : ${PUSH_TREE_LINUX:=$XENBITS:/home/xen/git/linux-pvops.git}
 : ${BASE_TREE_LINUX:=git://xenbits.xen.org/linux-pvops.git}
-: ${BASE_TAG_LINUX:=tested/linux-4.19}
+: ${BASE_TAG_LINUX:=tested/linux-6.1}
 : ${BASE_TAG_LINUX_ARM:=tested/linux-6.1}
 
 if [ "x${TREE_LINUX}" = x ]; then
diff --git a/mfi-common b/mfi-common
index d8d167fd..e3a91e24 100644
--- a/mfi-common
+++ b/mfi-common
@@ -662,7 +662,7 @@ test_matrix_iterate () {
 
         case "${branch}_${dom0arch}" in
           linux-5.4_i386 | linux-[2-4].*_i386) ;; # keep 32-bit for old linux
-          linux-*_i386) continue;;
+          *_i386) continue;;
         esac
 
         dom0arches+=" $dom0arch"
-- 
Anthony PERARD


