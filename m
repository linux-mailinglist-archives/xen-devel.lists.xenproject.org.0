Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04365FEF6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472396.732597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDjxL-0002A4-No; Fri, 06 Jan 2023 10:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472396.732597; Fri, 06 Jan 2023 10:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDjxL-00026q-K6; Fri, 06 Jan 2023 10:28:11 +0000
Received: by outflank-mailman (input) for mailman id 472396;
 Fri, 06 Jan 2023 10:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDjxK-00026k-2A
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:28:10 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb701eb-8dac-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 11:28:06 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id g13so1387619lfv.7
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 02:28:06 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056512118100b004b5732080d1sm107093lfr.150.2023.01.06.02.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 02:28:04 -0800 (PST)
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
X-Inumbo-ID: ceb701eb-8dac-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NweUbldW38duLDKXCcl5QGEb3HNDCi1J7bPtOMrCqec=;
        b=OeezEwoj7ine/gcxcZW1zzNRA7i8wpct49Nd4JgA4zr1yDpClhm9WNCrqzM+fTYpY5
         BNSu6Kxo2+EK2QAdtoYNG9S7uYhtQTa+FChFBfW/ikhXKZK7DB9NzjEOG+fBFMYeowIS
         78l5EXV1QmB4iNaKD+2AwQq88rk1Tjfn+ukOiSq7yLDzoXehu1CTssFu5qt6n6WjrGqS
         q6YQAt2rG7SzZIM31jJQnsQtxnUru8UqJ+IOpNsLGzc2eABHlB0lta1ErjcbrVQ2769x
         VDJYDI6ntRFKLBWzhN8MzmhsK3HD99AEsHDMAUi/gvOKx++8NABafbb+xqAEgjw1Sn36
         3U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NweUbldW38duLDKXCcl5QGEb3HNDCi1J7bPtOMrCqec=;
        b=CpZwv2Cp8/WwXSceqgLKEqeB2mXXtn2tQ3a9Z5lqv20LrolI41YHLzFPzn9PU25Hnd
         jscpR84ei4S0sD+XOH6rHiElrvySZFhoEYkuVxshSXLw6yRBVoWlg+K/VN8RGCfRGv1F
         j1QolQ8op++fP4u+eKNe72p/SJES2+A7pv3QJprk2k0hLl6BwvHICSpt1KO4CFZhIWhb
         pG4Wr3u2PCXxawb/U75LBzQMi1JagupsP3AAo0SVAkBmS3ps7JGc+GXb8V9SXv/gx1pa
         dqYxDnQfESTRi3HvWn+1ED9IQNyHxiaep2cBynWMUdE6X5nELf1Qyj8wHKVg4V/pbYF6
         JMyQ==
X-Gm-Message-State: AFqh2ko2LySfzEZy8rirIwxAMy+Hazpi0NGamnFdJPY+gjFZ9GgbVm+v
	ygfQ2Erm7ypVMr469JWy0k4clDIYsPokdjLG
X-Google-Smtp-Source: AMrXdXs2EFiit5RARTsnthGpvKYH7U73IESbrbaV/NAHQICGUs6kEHu9To4eM5uoRA4Tco6rDK5GBA==
X-Received: by 2002:ac2:558f:0:b0:4cc:597b:583e with SMTP id v15-20020ac2558f000000b004cc597b583emr1634692lfg.55.1673000885346;
        Fri, 06 Jan 2023 02:28:05 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] automation: temporarily disable CONFIG_COVERAGE for RISC-V randconfig jobs
Date: Fri,  6 Jan 2023 12:28:01 +0200
Message-Id: <5f47cd290a5f173655d7dace7f61384e1f32c8c1.1673000881.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As common isn't built for RISC-V architecture now, accordingly,
common/coverage (where __gconv_* function are defined) isn't built either
but randconfig may decide to enable CONFIG_COVERAGE which will lead to
the following compilation error:

riscv64-linux-gnu-ld: prelink.o: in function `.L0 ':
arch/riscv/early_printk.c:(.text+0x18):
    undefined reference to `__gcov_init'
riscv64-linux-gnu-ld: arch/riscv/early_printk.c:(.text+0x40):
    undefined reference to `__gcov_exit'

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/build.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6784974619..a292f0fb18 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -667,6 +667,8 @@ riscv64-cross-gcc-randconfig:
     CONTAINER: archlinux:riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
 
 riscv64-cross-gcc-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -674,6 +676,8 @@ riscv64-cross-gcc-debug-randconfig:
     CONTAINER: archlinux:riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
 
 ## Test artifacts common
 
-- 
2.38.1


