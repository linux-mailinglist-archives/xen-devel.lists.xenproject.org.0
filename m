Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757E76A7D0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 06:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573528.898511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgqd-00027Y-2s; Tue, 01 Aug 2023 04:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573528.898511; Tue, 01 Aug 2023 04:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgqd-0001zc-09; Tue, 01 Aug 2023 04:19:03 +0000
Received: by outflank-mailman (input) for mailman id 573528;
 Tue, 01 Aug 2023 00:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQd4c-0007cZ-OL
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 00:17:14 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c254d0b3-3000-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 02:17:12 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so31646695ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 17:17:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b001b03842ab78sm9116656pll.89.2023.07.31.17.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 17:17:10 -0700 (PDT)
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
X-Inumbo-ID: c254d0b3-3000-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690849030; x=1691453830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=gnQHITvmAqheMxwdIdbSevZa/UKreSmE0N3u9RwQPyLUzc/4qCPfbLDsYKknGqC/Vz
         O41VPUl2G9yQplzzLsCYaeC5okwzF63JaLtIfUyxB14zOibJk3x0I1B9+dIPIj9388NX
         CFhTl9G9VXeHg/l+CnixMyMnxZMceEl2vpBhVG6VuEUvmVvnv3Lf7ojk4jL10jj8ylHM
         8lHJQHgaGyAv5R7W/tU0p1Nlr3t1sXlQOEaF88h7a5q+Wwg7NP2GWIkrvQNj4814HAZb
         Re86dIqp9XBqfiymMK7kFSnHaISKO8tSQdOspM28iXlcBREf2MDilHB45dxvLZNnamOq
         eDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849030; x=1691453830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=Fhrif++vlq3n9pW1mGM3w2vnh36WwQLbpx5IZa+mBkxFiMYO1bo0CZkNtWqc64c6Iz
         9PfmzDexzAGzqACVCzUL7xYBUujrXIE45IaA1Tbf1zcU05r7XVE5O2hQnQThDfdBTgpA
         HmLFWPLAhf9sCi5LeGhqpBdZP0URXQVRLHTU5R+WNDsiaINPeJdEftGXVI8mKxYrem82
         XNO9/bDUfX6pR4AOWhh7/tDCfNbsUmWkK9CcnSXZNJ2gSfJ+aMG8DQNFe4eXaKbm6u2r
         yqnTTmlWJBWbLHlTurvIOp0Tv4r1pLYpKpOwn8ZxhPoUrZ+8wjJs7vpSo1Dtfrz5uarD
         0Xbw==
X-Gm-Message-State: ABy/qLazvfwjVH2Wq+rds8cTQtmO7NcPuQULhbIn+TnFEaKY6VjZUbW2
	S+spEd0/JrvcwUXbhM3BEX2v0Vu93ESYXg==
X-Google-Smtp-Source: APBJJlGRyDXLqmBGFHOVTybceq4cX5Va+EF/1UdvEwMhbjtfzQKCjrKh38g1Hyg6juqQRfEiMlApbw==
X-Received: by 2002:a17:902:a40d:b0:1bb:20ee:e29e with SMTP id p13-20020a170902a40d00b001bb20eee29emr10646642plq.1.1690849030465;
        Mon, 31 Jul 2023 17:17:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
Date: Mon, 31 Jul 2023 17:17:07 -0700
Message-ID: <20230801001707.556040-1-raj.khem@gmail.com>
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


