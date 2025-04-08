Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A0A810E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942500.1341641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKJ-0004gr-HZ; Tue, 08 Apr 2025 15:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942500.1341641; Tue, 08 Apr 2025 15:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKJ-0004aL-C8; Tue, 08 Apr 2025 15:57:27 +0000
Received: by outflank-mailman (input) for mailman id 942500;
 Tue, 08 Apr 2025 15:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKI-0004Yr-10
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f74199-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:25 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso965133466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:25 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:23 -0700 (PDT)
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
X-Inumbo-ID: 29f74199-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127844; x=1744732644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxQGWHEM+QfdsaiRIn7A5cNuL3TVRKaUV1dE+oe0W8=;
        b=hLyNXFHAYk2NRfs7U4v169PJ8uQNK6E2DqKcphkiI/dKvPDdtIq0gY4XXFXJeHPve1
         eUJKFOrY/w6hpne25c/SLfnqOzM+dFXhrLDs8QrQYGxV68a0VONqc4upofHg+36t0EGX
         +n6TENJEWsoMSECcNhdilCjHmdjAQbCZEUXyqbNOYT+Ibrf643LLlRREW24B9My2QjEd
         0aolf2G3aRT6iU8Zp51DnAfQU7NZ2/nGiUA/2/vBf+RpfEIpcLbMfvsavCmvnYKgeKDq
         IozUfFk4BxSbPyooixk7EJENncetyXCxqBSPAXFO0N4kogxiK3P0iZixlOxLNyQGtRKT
         W7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127844; x=1744732644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwxQGWHEM+QfdsaiRIn7A5cNuL3TVRKaUV1dE+oe0W8=;
        b=bula6kch2l9Z8ZTUno0z3VejFtJ7XEFq6Nd75eg6ylAlq84Z0ndCPeAkDmaE5xucUT
         wETPODxBaLQu764Dxz0ICz8PfMbt9kjmVpjPQmmrI4gQnrce6pU5Fw0vAOoRVfYf/LF2
         k2PukfuWS5484AXajYELTRBsRZKjr87wqcZxI1YjVX30OWQaKo9WdokhhJEwkiaHNYEv
         uHQNJ70hSL/byda02j/URSNkX+JUmv5tKVXTuwKnUyWoX563DKCOVRoRvATH12EQaG4E
         fFOIkkk163g/w5lNnnBiPznJE/VuYHtcmMGpdthwo8WyQUlCe2Oxkvy3dWbdFEJPGAEx
         6Wsg==
X-Gm-Message-State: AOJu0Yz6y7CvOtnqOKrFyUESFAfFlGkg8Lc875TdrI8vMQXH8qELQwBU
	btAZ0yvqGDIi5172F3OUrSqqUPDLVh12z5H9BYu9vTpgBYJ9NSgLt8M4ZA==
X-Gm-Gg: ASbGncuo/x/5bXpGuZbNL7DTeqRPw96isxVgeodSXc93sYRnbm2IivkW5190gLqtd4x
	6X6a4dhVUtutaJj5wBNOcVkG+S+/+BRIXKQLQdPwYS+zT9fJSKt8t+MF0PbR/F1FQ72+ZnYs4bd
	4o2cRSwzpCJfcyIhymInGfb/6kWlUyMKVfpzZhJRmi8X60C7feFEBMPzdO8tb7TuFkOpdZUQhbd
	xHQj3cS59bRYZ1wfXgGhliG3cD+il8i4NW5Yp19Aa3B1R2FmoWq9cND13zsEiMxga3PLiZXBCrR
	IN7suZoWYKZyhQl0du7M7OXYruBSzlMpM9H9blRJMC0Urxp6kXfhsN6cFT9guEf0O2uXMexKWxJ
	KYmGaev6HIFByaQ==
X-Google-Smtp-Source: AGHT+IEEQAhjs0pOCo5cH3hLmcyKGWubIIOEQAGdOwENOq4dkreblFI+yNvCn6/KETHcnWiQ0AZMzw==
X-Received: by 2002:a17:907:7251:b0:ac7:3918:50f4 with SMTP id a640c23a62f3a-ac7e77c7a5emr1091619766b.59.1744127844088;
        Tue, 08 Apr 2025 08:57:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 01/14] xen/riscv: implement get_s_time()
Date: Tue,  8 Apr 2025 17:57:05 +0200
Message-ID: <e503aee3ef743210a8188a7da9e70a169dec1287.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also tick_to_ns() is implemeted as it is used in get_s_time().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/time.h | 6 ++++++
 xen/arch/riscv/stubs.c            | 5 -----
 xen/arch/riscv/time.c             | 7 +++++++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index e8d9ffec57..0f6aa99ab1 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -3,6 +3,7 @@
 #define ASM__RISCV__TIME_H
 
 #include <xen/bug.h>
+#include <xen/lib.h>
 #include <xen/types.h>
 #include <asm/csr.h>
 
@@ -23,6 +24,11 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
+static inline s_time_t ticks_to_ns(uint64_t ticks)
+{
+    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
+}
+
 void preinit_xen_time(void);
 
 #endif /* ASM__RISCV__TIME_H */
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index a1d64534cd..83416d3350 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -27,11 +27,6 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* time.c */
 
-s_time_t get_s_time(void)
-{
-    BUG_ON("unimplemented");
-}
-
 int reprogram_timer(s_time_t timeout)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 905bb13eb4..81e06781f8 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -4,10 +4,17 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/sections.h>
+#include <xen/types.h>
 
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
+s_time_t get_s_time(void)
+{
+    uint64_t ticks = get_cycles() - boot_clock_cycles;
+    return ticks_to_ns(ticks);
+}
+
 /* Set up the timer on the boot CPU (early init function) */
 static void __init preinit_dt_xen_time(void)
 {
-- 
2.49.0


