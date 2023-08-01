Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16D76A589
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 02:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573534.898324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQdG2-0000oV-1Q; Tue, 01 Aug 2023 00:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573534.898324; Tue, 01 Aug 2023 00:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQdG1-0000lt-Uv; Tue, 01 Aug 2023 00:29:01 +0000
Received: by outflank-mailman (input) for mailman id 573534;
 Tue, 01 Aug 2023 00:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQdG0-0000ln-QZ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 00:29:00 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68160a1b-3002-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 02:29:00 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bb9e6c2a90so40601765ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 17:28:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902d50300b001b8a1a25e6asm9149965plg.128.2023.07.31.17.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 17:28:57 -0700 (PDT)
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
X-Inumbo-ID: 68160a1b-3002-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690849738; x=1691454538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=XIl6OORM6QViPbSsB8vdQHQ5jKGtvOvmtjAqv6s5n79Zs2LF6apiC/C3f7f7r548Us
         44vy2nLA3lZ/tEbKRfI4GWm8Xb65epwCKpQuhI+AVXtbxJnuQCxBuUBYT9Q2Q3E75OHL
         18E8rt1Vc/ElSO3g+Fgzx5H04gfalZ+JMCeHYB0gvyGFsrGkqNZBqYgAVIntM0cbnEHX
         k6VHo40qel93AK/0KaYX1V3nrs/Ti3aHtx6mzvZr31/Hm0XZVdLUVw9eHfg4v4LJO9X9
         QYLCLiKvRuZ5+2r1Q68DhQUBoBphtM/vI5WqMFpwn2U43Ju+JmGbaQckF1YrQLDMHegD
         H0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849738; x=1691454538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=YXifrjvRNHyokL9wShQDUWRENahaJNIW+XVigYCo3LgDNe94o0LYuod6pkNlT8xeRl
         zjiYndPUwmOYvNK55kacx4QulzmLbud1eUfH43EoNrkaRzSF3gUtgFuixlyAI64g1EMO
         j9M5xfmsSEK2sJ+RclS9XnfQOfgBs749/+hqj0/kw6YIlcA5aLzUIUQvG9x552LpCE33
         vRwnMjvIYsROBIghWn28uFpIGRxr9cl7XhBxXLd38WU03kQuISp9wZmTJ0Yh9BAUIiCG
         aTDC4azI1NSxo/Q0OqGKGFzDdTVG0uROhI7cfC+0grEL+95eOrVfnlB7IJd0qFUm1rjy
         o9Tw==
X-Gm-Message-State: ABy/qLZ6bUGXjMiAg7wd3S8n21I8HtuRv89llO6lNkBPyMtPD4btm023
	e3ABxqYZoD0p2qOsCoFUA6qPLpuMtB1KRQ==
X-Google-Smtp-Source: APBJJlH8mFsahdzWs1O/MKEG+Yb+4fpKs0mVP3E1LNzhodBuxy2d5/cW8hqdB5TDegC4n2TuUWn1xQ==
X-Received: by 2002:a17:903:228f:b0:1b9:be2e:2b40 with SMTP id b15-20020a170903228f00b001b9be2e2b40mr13912641plh.50.1690849738015;
        Mon, 31 Jul 2023 17:28:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
Date: Mon, 31 Jul 2023 17:28:53 -0700
Message-ID: <20230801002853.556437-1-raj.khem@gmail.com>
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


