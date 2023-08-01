Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FAD76A584
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 02:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573530.898315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQdC5-0000AO-HT; Tue, 01 Aug 2023 00:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573530.898315; Tue, 01 Aug 2023 00:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQdC5-00007Q-EM; Tue, 01 Aug 2023 00:24:57 +0000
Received: by outflank-mailman (input) for mailman id 573530;
 Tue, 01 Aug 2023 00:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQdC4-00007K-6a
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 00:24:56 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6344847-3001-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 02:24:55 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56c4c4e822eso3159783eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 17:24:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a633752000000b00563deb296bbsm8405429pgn.22.2023.07.31.17.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 17:24:52 -0700 (PDT)
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
X-Inumbo-ID: d6344847-3001-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690849493; x=1691454293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=V3mp+yZ23mxHLzJZfI0khV2lyi/pSoOfm/QpJXA/ZAOw6SLdOzbUUGPS4DAWRKRLDD
         +9tpLW57KyeDnJYwX1o+rkuDu8lPWWkpLmwR+ZCdoiL/W7epQS5D+vJjp9RCDkwZDYq1
         fb40x8oX4g9ZGoPEEWlWdRu6pHFlsLhgd9CMd7YSc1VLjQqmuaZbCGcutPxS5ZA0m2mr
         VZz6EyvGz/8d1295RSl0brz0qrfMZ4HSoknuOySsYoLlsxx/ahAeJHWhf/N8O4Yjn6GR
         ULDblPHxHTmS9SLUy6ScJ16fcIhqJcsgSdi+W4GQePXS1ufWeKvRfq+tav1QHZE4Q+2h
         fvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849493; x=1691454293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=MIQ4bgrUy6qRU/AtSFMzFpf8EBB2F1X7zINivSyHdND6+3x1NRaHcAOWU1N/mOAGKc
         hOCpDFBuIWogm0Zjb/W9bc8VDroGEb4+8rK7NgJLWk76O5Hs71nk22d1M+barch9/z4H
         TrtGZstyPe780Ma3PTutVSmIVb3FMNpDpSEPMclL8wkE72DdqC165UPGlUKvqOjzn+LI
         cQcoNf8OBfcc70PXvaqN7pl1sM23IOp5EKubWy+H/H/gxZFIVfUBVO8a3p/mzMACnwxf
         RcskkgB9DQjmiYSEmJIJZTU1lBl4cmEemOhtyO1jCEGXvzIabD3UVK8USRow9wr21WmC
         P0NA==
X-Gm-Message-State: ABy/qLaOiNK0EFXfY/Q8N637hkZ5fnusedh4siz8UBf0jVivgsemqKhe
	FyNOFB03V1BwOFSSNI2CNd/yFqO6x0PMxQ==
X-Google-Smtp-Source: APBJJlESpaVMSjR1L1NDQvrwbeftg7QTy835b9tNz4N/aGTI0/uZhCm5qMkgJpvkRrosl++aRhHuMg==
X-Received: by 2002:a05:6808:2090:b0:3a7:4462:59a4 with SMTP id s16-20020a056808209000b003a7446259a4mr2728290oiw.3.1690849493375;
        Mon, 31 Jul 2023 17:24:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
Date: Mon, 31 Jul 2023 17:24:50 -0700
Message-ID: <20230801002450.556213-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assembler from binutils 2.41 rejects this syntax

.section "name"[, flags...]

where flags could be #alloc, #write, #execstr
Switch to using ELF syntax

.section name[, "flags"[, @type]]

[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 xen/arch/arm/arm32/proc-v7.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.41.0


