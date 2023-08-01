Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8E76BBA5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 19:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574460.899739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQtV5-0005R9-Pz; Tue, 01 Aug 2023 17:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574460.899739; Tue, 01 Aug 2023 17:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQtV5-0005P0-N5; Tue, 01 Aug 2023 17:49:39 +0000
Received: by outflank-mailman (input) for mailman id 574460;
 Tue, 01 Aug 2023 17:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQtV4-0005Ou-HJ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 17:49:38 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6df2ccf-3093-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 19:49:35 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bb81809ca8so46969665ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 10:49:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b001b85a4821f8sm5012699plc.276.2023.08.01.10.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:49:33 -0700 (PDT)
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
X-Inumbo-ID: c6df2ccf-3093-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690912175; x=1691516975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HD89QJtBs0B8JZHVQe5+HG6SdeeQku6GpLIOjBFTcZg=;
        b=FIezstmcY3HMWQdOQPd1AuBW9Iyn2ARm4WhVc602oO/wNpI0MrNjQp4zuaM94Xhm7p
         d/hIQsmzsLHvKFnLwlTTL/R3olmENOAwzeOgTlQSl2HLMmHbFFsJ2b7q6kXPmzP1LEWQ
         SYa1pL3jC3/Beal0bs2hayYQOTjd2GIjF3RLJ21HW2lQwo9vacEG0UPk7CegBjzQIaM7
         7iOxjIM5+ZV68XjBgj9uOEzFJ5Lw4ZX2PKQ+5caTlMmbFsRCy3a3cjqAVUU2gd76NVHG
         vQ9DGao+ZA2eVGVaEbdynMmvjwelkQRW0uBWqZWy05vUh7v58gop6uFEHxSm8e1IJ9Qo
         HKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690912175; x=1691516975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD89QJtBs0B8JZHVQe5+HG6SdeeQku6GpLIOjBFTcZg=;
        b=SLU3ELDxE6Ua5wO+yIXCAPQYn0tA0Z7MVqi4uCRDdnpBqDmlQj8fDGljNb2ttwu5Nn
         V9v0EExVKczzMgGRgQh3pfMWeDcSOPgMZJ0IJlMy5xopNOkpuA9/seK/ycfm4JRYIfxx
         pmWMVldStGxUsRZq/z18AySi6BLC7vxGFtfsNcCA4NBEuHDVie6ACOim0xMcgTnwhlSY
         nwU3JMtuJIB/9od/M7TMgYAot8JRW8NDiNjUIZ5uGC4T6Bgry52zMTIJ5cJy+Mjx+bqU
         tbHCx+820wpfVE0lRsRRFt07t1xEId2WOVNrrjzC+XGb0GtX+SKOnf8UAsCJLmb9cftH
         LclA==
X-Gm-Message-State: ABy/qLYsVDjFUtEej+yW+xc1T3Viv9HvIJ4DmJ+wLYAMvStli2cL4Bu3
	WZGYKMrF1MBSicJ8QJ//7Vq3FGfSGGQk8g==
X-Google-Smtp-Source: APBJJlGm7gIbbgr3MmRCHl5ITFMri5K7SK1TIt3OY5+nDlwX6uOT0xTOzP7+TH3raQZyU8537vnafw==
X-Received: by 2002:a17:902:c947:b0:1bb:ab0d:4f76 with SMTP id i7-20020a170902c94700b001bbab0d4f76mr17561709pla.58.1690912174564;
        Tue, 01 Aug 2023 10:49:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] arm32: Avoid using solaris syntax for .section directive
Date: Tue,  1 Aug 2023 10:49:30 -0700
Message-ID: <20230801174930.2995947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assembler from binutils 2.41 rejects [1] this syntax

.section "name"[, flags...]

where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]

It is almost like a regression compared to 2.40 or older release,
It likely went unnoticed so far because Linux kernel changed
to GNU syntax already in 5.5, to allow building with Clang's
integrated assembler.

Switch to using GNU syntax

.section name[, "flags"[, @type]]

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
[2] https://sourceware.org/binutils/docs-2.41/as.html#Section

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
 - Improvise on commit message
 - Make similar change in xen/arch/arm/dtb.S

 xen/arch/arm/arm32/proc-v7.S | 6 +++---
 xen/arch/arm/dtb.S           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
index c90a31d80f..6d3d19b873 100644
--- a/xen/arch/arm/arm32/proc-v7.S
+++ b/xen/arch/arm/arm32/proc-v7.S
@@ -29,7 +29,7 @@ brahma15mp_init:
         mcr   CP32(r0, ACTLR)
         mov   pc, lr
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_ca15mp_proc_info, #object
 __v7_ca15mp_proc_info:
         .long 0x410FC0F0             /* Cortex-A15 */
@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
         .long caxx_processor
         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_ca7mp_proc_info, #object
 __v7_ca7mp_proc_info:
         .long 0x410FC070             /* Cortex-A7 */
@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
         .long caxx_processor
         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_brahma15mp_proc_info, #object
 __v7_brahma15mp_proc_info:
         .long 0x420F00F0             /* Broadcom Brahma-B15 */
diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
index c39f3a095c..386f83ba64 100644
--- a/xen/arch/arm/dtb.S
+++ b/xen/arch/arm/dtb.S
@@ -1,3 +1,3 @@
-        .section .dtb,#alloc
+        .section .dtb, "a"
         GLOBAL(_sdtb)
         .incbin CONFIG_DTB_FILE
-- 
2.41.0


