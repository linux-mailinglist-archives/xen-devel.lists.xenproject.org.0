Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11746AB1982
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980134.1366644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6s-0007Hu-D5; Fri, 09 May 2025 15:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980134.1366644; Fri, 09 May 2025 15:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6s-0007G5-5s; Fri, 09 May 2025 15:58:02 +0000
Received: by outflank-mailman (input) for mailman id 980134;
 Fri, 09 May 2025 15:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6q-0006Kr-FZ
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:58:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60f862b0-2cee-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 17:57:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad21c5d9db2so186701566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:57:59 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:57 -0700 (PDT)
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
X-Inumbo-ID: 60f862b0-2cee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806278; x=1747411078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfyWuQ4iu9CwNTdoqFztyN900xmaX3FB22gI8y2dLpQ=;
        b=NiOfBa6ya945tQhqCGIBJB6IqwftdZdmJi5VAYOeU/52mmZSqtNqYGB1YmrZ6FIgxT
         XQIw7gEIpJOUaCClpx+kkbzu1y8XlYUabNU3mq6lz4y6FPBcu8vjdVbG4YdnIxnW1yyi
         DpH5a9n15LWOlVLhj7XlTQQYdx/+9uF+5Qgohbe0JWWBAVYtmd7GBMJSlswm73pb9/bb
         19Lrh+DThFk4DnMCtIVfsagC5dK1q9N3x1Iz+LDSPxljggJchnXvLIGWi67Z1ZPr+niy
         n6khDvTgzv9qcWTx+1dqftmRL1TyDPoCA9feS6iJauYTc6HdXXr2T8bbbXjTP9f53uit
         DfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806278; x=1747411078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfyWuQ4iu9CwNTdoqFztyN900xmaX3FB22gI8y2dLpQ=;
        b=rKikHooUpa0WVQnc2zV2FK8JDLlJxqsKrwXe88+934Pz6s6vDLdsXwv8srmrcNUFHe
         BXsMIHKQsNkMyFXQHjz0Pgcp2bdhCK/23cZSJYf6Uj+4hBXNmMoxCaL3fd6LNe2QkQZ1
         tgrHA8w+zK7thXcHg9jpyJ4YeI/j3BzP5NeXzS2zcVrS4bp9q1YgUVCbF4N9HhPKWL5b
         UHxmkzaj7L/nu/YwFprE6VnCGzNS89Gv2CK3uBQnpDg9fN9vJ9FsRkTCpHEDjSRppaKW
         is2suZLbfWKuHTH5jRZfF9p6KbjkTOZIlTSt2ZX/Bx9WOVHf2biHM418KGiZa4vze2Do
         Gmcg==
X-Gm-Message-State: AOJu0Ywo8FfL62how0fq9wD2NQXZ2nG5AjbNfJv4xthp8XM75tmZR338
	yLN9N4J8qLZSLmK4I2/WvCSab96qi/ngkyuj+T/696LBorboaueJPxS0Xg==
X-Gm-Gg: ASbGncu1MsdzZAw1xwVi1GBsCKg/nvl0INLKX6JCQyigqW5KMjw/LeXI6KH0P0/KhI5
	fAPNdUmMPg7VIsq2aERsSrsW+DfZVltyOJsPj580HNOZcHvvPAiJ3Lixd3uE/eckA9bmvQHCMF6
	sDyqWJdSUNpnLmvWtc1rsdK78J32rZrtnqE/npnMZKXRTEU+DXgSOv2DE/B0Ps3zmamLp5petn5
	he6XhjzMj1ZwjtmrRUOohMQEaLQD8hJxSl9np+KJr8ic/Yy/TEBEgbdX0dy7PaWbUnKDFpB8Nuz
	+oEk+kY6Wjmc9flPGsPwBnVprKGC9a/oAAyBnpDYEz21rmWX92IoadLR1mZZ0e10Fc7gSa2ygrO
	6o4YcSQE8xA==
X-Google-Smtp-Source: AGHT+IEfeVBVYJzYmzNbx/z6SpZCUL6U5Os43OZl7uaC4Z8CqbdCnxdjXNSDtKwUey0Mt4UBCkT09A==
X-Received: by 2002:a17:907:6e92:b0:aca:e2d9:41f with SMTP id a640c23a62f3a-ad21934e52fmr342928466b.60.1746806278167;
        Fri, 09 May 2025 08:57:58 -0700 (PDT)
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
Subject: [PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures
Date: Fri,  9 May 2025 17:57:49 +0200
Message-ID: <9f822cfaa058167982c85b3ca3f722881552a75e.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor pte_t to be a union which hold page table entry plus
pt_t and pt_walk_t structures to simpilfy p2m functions.

Also, introduce some helpers which are using pt_walk_t.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/page.h | 54 ++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 2af4823170..cb3dea309c 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -99,15 +99,67 @@
 
 #endif
 
-/* Page Table entry */
 typedef struct {
+    unsigned long v:1;
+    unsigned long r:1;
+    unsigned long w:1;
+    unsigned long x:1;
+    unsigned long u:1;
+    unsigned long g:1;
+    unsigned long a:1;
+    unsigned long d:1;
+    unsigned long rsw:2;
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:26;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:9;
+    unsigned long ppn3:17;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#else
+#error "Add proper bits for SATP_MODE"
+#endif
+} pt_t;
+
+typedef struct {
+    unsigned long rsw:10;
+#if RV_STAGE1_MODE == SATP_MODE_SV39 || RV_STAGE1_MODE == SATP_MODE_SV48
+    unsigned long ppn: 44;
+#else
+#error "Add proper bits for SATP_MODE"
+#endif
+    unsigned long rsw2:10;
+} pt_walk_t;
+
+/* Page Table entry */
+typedef union {
 #ifdef CONFIG_RISCV_64
     uint64_t pte;
 #else
     uint32_t pte;
 #endif
+    pt_t bits;
+    pt_walk_t walk;
 } pte_t;
 
+static inline void pte_set_mfn(pte_t *pte, mfn_t mfn)
+{
+    pte->walk.ppn = mfn_x(mfn);
+}
+
+static inline mfn_t pte_get_mfn(pte_t pte)
+{
+    return _mfn(pte.walk.ppn);
+}
+
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
-- 
2.49.0


