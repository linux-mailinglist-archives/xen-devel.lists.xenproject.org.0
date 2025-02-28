Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA7A4A385
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899117.1307606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ek-0007VH-10; Fri, 28 Feb 2025 20:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899117.1307606; Fri, 28 Feb 2025 20:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ej-0007Pt-T1; Fri, 28 Feb 2025 20:08:21 +0000
Received: by outflank-mailman (input) for mailman id 899117;
 Fri, 28 Feb 2025 20:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6ei-0005OT-BL
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:20 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0006bce-f60f-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:08:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so487880566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:16 -0800 (PST)
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
X-Inumbo-ID: c0006bce-f60f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773297; x=1741378097; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0ad6jhwpwcRJBhT3VG+8OUVGsufT7ZaP0GbwgV+mRc=;
        b=YtQw6oqb7yZIvfpvBX/EzQtIfXo+w2dKNwXNW0CbOnrtHrr3qiiQAbU55rx5wkdKeY
         W+T09QGF+JGvoWKlZeAZC4DcWQUegmjO3cWZP41nkN1dzLwYRb21telMH8PIZ74eM3Ga
         Tl4Qa+TkODx+NuyOyBmBn+nVtV98Bfxihk6qLggMwfiMrtWpBrva2/HOSbLxbFIZMGPv
         3phcmfQX5XPB4kz7Aci+9jmov1ynihWPf86j4uwMPwHu0nqtV8MQ4xjfLUlrXYRahmD6
         xxjQ1uaN5C0Y2VLV/WgYh4I0vGJP0UXhrrXcDKOYj5J0unvOp1kVjuRETaXIhiBdX6Ab
         Mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773297; x=1741378097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0ad6jhwpwcRJBhT3VG+8OUVGsufT7ZaP0GbwgV+mRc=;
        b=XNWadI/unzg6rv37DosPTJojQOYLN2No7MY384fY8wTY0AhWY+ZbXXHh/8GbQU8iRW
         TqsXxuBJ4LcENsfmBGJdNcJtMcslqb5uZKSHlkqa10MNmtfWj2s0rAtmjvX3NlMgp/dR
         KQpaR/t08U+iNV4kwR4uvWYOzt2eVVf9EG1MtkA3TwEc0RcPmXZTyY74bsTIouihgJTR
         GjHY1M+7WBfU0gpzE46dEiJKH7NpxJCx+6aZZQo8JOKSGAtAAMrtFI2EFZu5XGzqVRBK
         UGfl5bL3dNXQ2LkB3zF5dCv2XOlEyD1TTd8UqLmpQEyaBQhcDeqj58Kz++UDgb/99xdi
         5Lcw==
X-Gm-Message-State: AOJu0YyDUvvtiXQ5+2MyyYeOgQ2SzhCbQcUyFNPe3UpFifBarmIRJPfV
	jSCK/3e+tlR2w8G4Dmdx88MCG7fQBXD5lSkyfLS8RhZDG4PU173Pf657XQ==
X-Gm-Gg: ASbGncu8W15xAvEJkkasiT0HBxD3d3pzewJeLaR0Z/vnLSaD0d71of02p3A2ADtfNjY
	OeJjP34FhCBnweaxOqkFl4qQxBAFMu7ryA96YywfK0IBb+C9f47dB5yzT6ovTHNIaBdxQhfUqeF
	Qkcn2Z2+AFQbF9owspVaxQD5dMLBP0OSW1j+DSl6Qu5RstQYpnbWdckxNsDgzOGtFjtIHrLProH
	LePFEjn9BUpsv+5LmeuQrEOUYitibmN4YvqWTjW0Z7FUgCb8xzwlzZ5FnfpZfOyAlzA9v7qlhvL
	9oyLgeTRkXKzyJZ4q+bhaXNxEy4=
X-Google-Smtp-Source: AGHT+IG8VtXzNLqpAWR0oV+hViXGiXfJTaKvGPZjehMEzBp7Le/PfQKujtcjTv9erG23UKg74tMnfA==
X-Received: by 2002:a17:907:988:b0:abe:f613:bd0b with SMTP id a640c23a62f3a-abf261d3bcamr554690966b.32.1740773296903;
        Fri, 28 Feb 2025 12:08:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 6/6] RISCV/bitops: Use Zbb to provide arch-optimised bitops
Date: Fri, 28 Feb 2025 21:07:44 +0100
Message-ID: <f9434e260e12fe1cdd8ae984b3aadc4678179549.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740764258.git.oleksii.kurochko@gmail.com>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v8:
- New patch. It was taken from https://lore.kernel.org/xen-devel/50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com/T/#t
  with applying the comments:
  - Introduce BITS_PER_INT.
  - s/arch_heightl/arch_hweightl
---
 xen/arch/riscv/include/asm/bitops.h | 7 +++++++
 xen/arch/riscv/include/asm/config.h | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
index d22eec1e87..72a4a8c155 100644
--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
 #undef NOT
 #undef __AMO
 
+#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
+#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
+#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
+
+#define arch_hweightl(x) __builtin_popcountl(x)
+
 #endif /* ASM__RISCV__BITOPS_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 826e5c7172..7141bd9e46 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -119,6 +119,7 @@
 #define HYPERVISOR_VIRT_START XEN_VIRT_START
 
 #if defined(CONFIG_RISCV_64)
+# define INT_BYTEORDER 2
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
 # define MAX_VIRT_CPUS 128u
@@ -126,6 +127,9 @@
 # error "Unsupported RISCV variant"
 #endif
 
+#define BYTES_PER_INT  (1 << INT_BYTEORDER)
+#define BITS_PER_INT  (BYTES_PER_INT << 3)
+
 #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
 #define BITS_PER_LONG  (BYTES_PER_LONG << 3)
 #define POINTER_ALIGN  BYTES_PER_LONG
-- 
2.48.1


