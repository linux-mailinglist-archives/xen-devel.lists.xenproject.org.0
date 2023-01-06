Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B92660103
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472546.732849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYc-0004eU-J7; Fri, 06 Jan 2023 13:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472546.732849; Fri, 06 Jan 2023 13:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYc-0004ZS-Be; Fri, 06 Jan 2023 13:14:50 +0000
Received: by outflank-mailman (input) for mailman id 472546;
 Fri, 06 Jan 2023 13:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYa-0002z5-5I
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:48 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 180c2e86-8dc4-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 14:14:47 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so1914091lfb.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:47 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:46 -0800 (PST)
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
X-Inumbo-ID: 180c2e86-8dc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qi8VnEIuZ7tu3k7g7nrwofraJgO1NpoRR5W+cQW214=;
        b=IUO9MIUCR9uzevVnoE6Q5BoLbKRfVemQHPUHAEoYTQT3tphPo6e4/4rUj/rYQLAvQX
         5iqss+xdYJai0JXiu5wZ8CbZrItkTyIG0h28Xdz/rgcuE4tUCZxm9SKAcs6jjj31yu68
         AUm0+UBq8a3vRf90sO+kGhFnD6ZCthJqi5ifsGvZpMomyC4JBhCISalm6Tmcs49jMoE3
         Z0kSgzSdSlTeV//BPmlZIOl5GMM7wXL5GC/Avh7rhY4HXo3xbWF3sAGJuWH0yu4ipGUH
         VyyDRfok7u/KqekTkgoRn2mNY6Fx2E4YnoHWhOQXyg86MbWAgijpBqtre+bLF+hpV2dT
         trGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qi8VnEIuZ7tu3k7g7nrwofraJgO1NpoRR5W+cQW214=;
        b=z1goe7/QVe31MFZFwXDra6gie3EfYvBWLMPL6THzaQTzWLM4jE7AL1dxRRNOpRFCpH
         aEME83JKovQfiioOdQyBwoVg+NH02PejfiAOCzP4+sNHZdkkUy48XR/8ZKAZWVhDVND1
         R0RLBczI+Iwm5lclOmrQPDgBygJ70J1W76ek0nrKrr19L0VoyeuU3DY/2B8FFLyiq0vl
         Y+RMgMEgF7eblVV+jBvIbGuxOLV/CqboBcD+MCdglt+UEagPyQFl1peAJUSqc6bNhRz7
         wxE3p6ewQnHFtFotb4F/zvzloinckwlPaZxGy7VKr7boW8N2dM2ZKn9HxQ6tPAzTPL88
         MwAg==
X-Gm-Message-State: AFqh2kr7+gd46GFlM1LUT1c1U/rP5EYIJ/cUK8sApLKMGtivicz3cLHM
	u1C8aFv9sDkUKpBO7AmLFrntlEnnMeXCWTnZ
X-Google-Smtp-Source: AMrXdXsxlHbO2bPPbcGhGWP/ZxA8JWr/SwPBqT0WRMNphDupmhWfQ7F9toeww1dIfqqiphwz81zoYA==
X-Received: by 2002:a05:6512:308f:b0:4cb:1645:7259 with SMTP id z15-20020a056512308f00b004cb16457259mr11225608lfd.61.1673010886967;
        Fri, 06 Jan 2023 05:14:46 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 7/8] xen/riscv: print hello message from C env
Date: Fri,  6 Jan 2023 15:14:28 +0200
Message-Id: <21fb02aa340fe3a7a95dfbb950b33ae7a363496e.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S |  4 +---
 xen/arch/riscv/setup.c        | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index ddc7104701..4e399016e9 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -5,6 +5,4 @@ ENTRY(start)
         li      t0, PAGE_SIZE
         add     sp, sp, t0
 
-_start_hang:
-        wfi
-        j  _start_hang
+        tail    start_xen
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 2c7dca1daa..785566103b 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,18 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 
+#include <asm/early_printk.h>
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[PAGE_SIZE]
     __aligned(PAGE_SIZE);
+
+void __init noreturn start_xen(void)
+{
+    early_printk("Hello from C env\n");
+
+    for ( ;; )
+        asm volatile ("wfi");
+
+    unreachable();
+}
-- 
2.38.1


