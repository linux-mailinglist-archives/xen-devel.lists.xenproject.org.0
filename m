Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BAA87EE5D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695013.1084529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQf-0002mv-8i; Mon, 18 Mar 2024 17:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695013.1084529; Mon, 18 Mar 2024 17:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQf-0002lD-5a; Mon, 18 Mar 2024 17:05:41 +0000
Received: by outflank-mailman (input) for mailman id 695013;
 Mon, 18 Mar 2024 17:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHi-0002f9-WF
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:27 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716cf32a-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:19 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-513d599dbabso5033435e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:18 -0700 (PDT)
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
X-Inumbo-ID: 716cf32a-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780979; x=1711385779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3vLBOSxqrdW1ZRlzp2JKO4obw5qcJjbVid5cQeTQ14=;
        b=WXwQLoXK73ObfQXEhFAIknmDFXH5xMhZQ+qxUDfEsWdGBnxHXhXvJ0+QMc3Qyry4XI
         67iD0PAx1iOreXMZOfkM2lfBct/PUYKGiwcBXtBM71bkMDUz0BhCGT4M41aCraoXTHbX
         MqcWM96h/+Fh19iU0Sb4cSZ7qzy7jtzwZpqbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780979; x=1711385779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3vLBOSxqrdW1ZRlzp2JKO4obw5qcJjbVid5cQeTQ14=;
        b=Go/pet0TA196x3hRyekhz2kXJFSWkdYqjL82nwqqYx/CzsV8L/oR/aagzh2ueOMwdb
         pUTj0HU80m0fkfUOAI3vYCKCL838wUFXDyfL85bukwqXOadq0boANrfrGpCE4cZiCVcN
         5PAMo4Kw12cu96oYSu2htdEUn6G+iH9K7K1ubcEFTuUNOZd79w2BZHES5ZP4E1GnQ9YC
         5fb74P2kG7YlyPSxVBKElq7Bz1qoyv3gP5lPRsGTtCYRZOCqRynGMZt9zyPDqa9uda1h
         OzOeQ2TqOrMMG3w45646vqPTys5g2FviigB6dviZjoWDepTiSUAtTndaTqbALVKhWcwI
         Ik8g==
X-Gm-Message-State: AOJu0YzwfadnqXIr5X0znizP1yqFLK/6BCKO4Eu12z8UBDy39MZyE4wi
	fo/asEZkXkAPcU+xOT84R8PXqIxR/aPazEaGcjBh5rziM7+xfRkYDtDdQJfucmek1M0zAqZXGQA
	j
X-Google-Smtp-Source: AGHT+IHTjDi3PCaX5GpW4hpbi7vkp6ckj5GyoCXCDwO2h82tEGArbcK7PZeZoQUmIY5Nf4BfEIhO+Q==
X-Received: by 2002:a19:2d5c:0:b0:513:c757:33d9 with SMTP id t28-20020a192d5c000000b00513c75733d9mr44876lft.53.1710780979365;
        Mon, 18 Mar 2024 09:56:19 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 33/36] make-flight: Keep using buster for L2 guest in nested tests
Date: Mon, 18 Mar 2024 16:55:42 +0000
Message-Id: <20240318165545.3898-34-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When starting the installation of the L2 guest, L0 kills L1. Switching
the L2 guest back to Debian Buster works fine, so do that to prevent
regression in the test.

Part of the logs from the host L0:

> domain_crash called from arch/x86/hvm/vmx/vvmx.c:2770
> Domain 3 (vcpu#0) crashed on cpu#4:
> d3v0 vmentry failure (reason 0x80000021): Invalid guest state (2)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 make-flight | 15 ++++++++++++++-
 mfi-common  |  5 +++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/make-flight b/make-flight
index 155a0c1f..d0c950bc 100755
--- a/make-flight
+++ b/make-flight
@@ -360,6 +360,19 @@ do_hvm_debian_nested_tests () {
     xen-4.3-testing)      return;;
   esac
 
+  local l2_runvar
+  case $guestsuite in
+      bookworm)
+          # Bookworm install image lead to a crash of l1, so keep using
+          # Buster's image.
+          l2_runvar=(l2_suite=buster)
+          l2_runvar+=(l2_image=$(usual_debianhvm_image amd64 buster))
+          ;;
+      *)
+          l2_runvar=(l2_image=$(usual_debianhvm_image amd64))
+          ;;
+  esac
+
   for cpuvendor in amd intel; do
 
     job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-nested-$cpuvendor \
@@ -368,7 +381,7 @@ do_hvm_debian_nested_tests () {
             l1_vifmodel='e1000'                                    \
             l1_memsize='3072'                                      \
             l1_enable_nestedhvm='true'                             \
-            l2_image=$(usual_debianhvm_image amd64)                \
+            ${l2_runvar[@]}                                        \
             bios=$bios                                             \
             all_hostflags=$most_hostflags,hvm-$cpuvendor
 
diff --git a/mfi-common b/mfi-common
index 6dc39422..bbe714bf 100644
--- a/mfi-common
+++ b/mfi-common
@@ -547,18 +547,19 @@ job_create_test () {
 
 usual_debianhvm_image () {
   local arch=$1; shift
+  local suite=${1:-$guestsuite}
   if [ -n "$DEBIAN_IMAGE_FILE" ]; then
       echo $DEBIAN_IMAGE_FILE
       return
   fi
-  local file=`getconfig DebianImageFile_${guestsuite}_${arch}`
+  local file=`getconfig DebianImageFile_${suite}_${arch}`
   if [ -n "$file" ]; then
       echo $file
       return
   fi
   local ver=$DEBIAN_IMAGE_VERSION
   if [ -z "$ver" ] ; then
-      ver=`getconfig DebianImageVersion_$guestsuite`
+      ver=`getconfig DebianImageVersion_$suite`
   fi
   echo debian-$ver-$arch-CD-1.iso
 }
-- 
Anthony PERARD


