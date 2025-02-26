Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCDA467F2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897117.1305837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL7Z-0002uL-9m; Wed, 26 Feb 2025 17:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897117.1305837; Wed, 26 Feb 2025 17:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL7Z-0002rn-6V; Wed, 26 Feb 2025 17:22:57 +0000
Received: by outflank-mailman (input) for mailman id 897117;
 Wed, 26 Feb 2025 17:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnL7Y-0002rh-IP
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:22:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50540708-f466-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 18:22:54 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso779f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:22:54 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390dd708d50sm2029699f8f.91.2025.02.26.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 09:22:53 -0800 (PST)
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
X-Inumbo-ID: 50540708-f466-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740590574; x=1741195374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FkWu2+ymDbeZcBFazIKeQy1Pjj72JGYQdi3IsIoxAg=;
        b=NctobUtWyS2IB1TcuGXmwuKMCZIwTgf3tRImh656y47sZWa7DcXq6PGU5phUXGs3nP
         Ij9z43jC7QpmnpIzro1HzFiBN3C96GJzPiksxV6qHET2hpdTPoa7TqoLnfTyWC2h128n
         4N5TotmMDnSu7dKiV5kpIMmn0JUyDKap1b1LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590574; x=1741195374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FkWu2+ymDbeZcBFazIKeQy1Pjj72JGYQdi3IsIoxAg=;
        b=wjuT9QBtT88h9mqzlf1mwox0lRbZNz2/YvgCuEN5QEOrlzdKr4at/aEFhhwoqgO+kD
         t8Q1SPoAA5h40IC6mVZdZ0a6+Pfvgf3ftYPvGWzhccJ1N4XCcb4Qy5jbQ7badRgvq3bv
         U8cBEZScSr4PEZCtTjh0rTxryM+eBKcO3zcdVPK+iiyN6vYg7ZiNsJATtnpzHAvGegNP
         rVsHQUbN/U9xjH9ZaXI0KY1fgFpHUndHDG+WtXk7t1z36LCjo0pNo71p2elaAsd1JI0h
         qb2zFo/clqxrj93GPxltQgL2nbDNslEh76EDJOdZ+RfJ7C02Yy9Hjr/I3+SiWleEtTZl
         P3hQ==
X-Gm-Message-State: AOJu0YyDhBnrEWPaIKQqaecdD4fFuTxbkUQEyud2jqrSvybsvWXQB/3S
	ZI2poaGsDK/6WGFMA96d0DP/wV+DXoZ73beFNPChp73KHJTI3P534303EAs+PXWtsAHDfBCgUDC
	c
X-Gm-Gg: ASbGncvrX7k3Xm85fDpuMp2k25NRIT6cH71QF4FtJAsmvurGDwlU7Hul3uzEzlDyemD
	dR4RUBNIMmfBizpE3o5bWx7V64lLsamxhA3b9pK5FxqUzZZhd+0vFatBQK7rTzT2wRely1xPVMR
	0D0DnnJp/n/Okd33Muf9bpx8YVfQ58ClR651n5PQrv6590UbZL4nceyoIi7UxNjOKIB2xKNTDZn
	HiehkZM4XVnng2s/32C8qkxQByolnJ5nhiEWrIqcS5B23+1+ONVtUtcx9i/bDDBVt+Hs1vfHoTj
	nx38QrvHQpz1CNpgEptGaFUww7HP7NQ5gDXJnwqIbLlpJF03Fo75/D6NkUlz7+wofwH79U05CEh
	SlCv4TA==
X-Google-Smtp-Source: AGHT+IE9x4TA5JTOA/4m9tpgiIdOXQsYcp8xdKY818jqpLdCCN0k7yCnEe1vpXuGHJ/lHc+xUTk9iQ==
X-Received: by 2002:a5d:494e:0:b0:38f:23f9:b367 with SMTP id ffacd0b85a97d-390d4f419e5mr3317615f8f.23.1740590573589;
        Wed, 26 Feb 2025 09:22:53 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
Date: Wed, 26 Feb 2025 17:20:50 +0000
Message-Id: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Depends on "xen/riscv: make zbb as mandatory"
---
 xen/arch/riscv/include/asm/bitops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
index d22eec1e87c7..df3df93520c5 100644
--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
 #undef NOT
 #undef __AMO
 
+#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
+#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
+
+#define arch_heightl(x) __builtin_popcountl(x)
+
 #endif /* ASM__RISCV__BITOPS_H */
 
 /*

base-commit: 7cf163879c5add0a4f7f9c987b61f04f8f7051b1
prerequisite-patch-id: 9ee1f7ebf5d34b1c565ee2d3d4fb319164bb8bcd
prerequisite-patch-id: 8a05c87c8d051a3ac0820887f676bbd318e4ae88
prerequisite-patch-id: 6b56e42d130d8b5ee39457b6760b05cc6e16b049
prerequisite-patch-id: c139f1f5741d695cd5e5aa6be904edcb61b73885
prerequisite-patch-id: 99f8b701000e9ee11060934e627a988ddf9aaaa7
-- 
2.39.5


