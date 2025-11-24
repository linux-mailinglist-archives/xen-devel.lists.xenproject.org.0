Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B1C807BD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170571.1495695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlu-0003Vp-MH; Mon, 24 Nov 2025 12:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170571.1495695; Mon, 24 Nov 2025 12:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlu-0003KV-HP; Mon, 24 Nov 2025 12:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1170571;
 Mon, 24 Nov 2025 12:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlr-0001Xp-UG
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:19 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e51abee8-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:18 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b71397df721so742146866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:18 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:17 -0800 (PST)
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
X-Inumbo-ID: e51abee8-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987658; x=1764592458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SItIn9iAPuEifulaIPELDUvKH+Qft6y+4ycnMWjcAb8=;
        b=i6NtHxBoMIJaNI14TXIpd1CtP3+NLLYbwERE2Xpp9UW1zoA7j2Zb2qalUynRk0A7Jp
         k8z2maHAvaI13RYf8ZZ0PxoTvtzKy8IUf9Maw5X3y/o16AYU9no+gAoVQs/DtqhPSkps
         2fLEikehBEqpVNSjCNg8w6GYbLaJXGpdlovwc3ZjQvuiHwMxeYjYH/DjDYSBwvaBGklK
         xN7e/EY93E4iB24iWEnn/FlTf65rJGf7qcITNECpiqzYtU13B5yzxIpKbSoDk/yBC9FS
         RYJ+ewo4/1hCxOwBvgiy1WgAVdVosSNihKA+YHOYzUFEr8szF3u2y2C1A+NSSBH4VnrI
         tsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987658; x=1764592458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SItIn9iAPuEifulaIPELDUvKH+Qft6y+4ycnMWjcAb8=;
        b=uJ0wYbPykJh1LPATmtD8GPXxojveVT7wWOI+6dq5pS6d1DaJ7Qv0dvkh8JDd0exrTv
         AT+cIP0epnBbnuunHzkKtIjnaoZwN6JJZzKt19uSLVso8Tp6QXf+l3ZbbpLw9C2Pt5yT
         pQYLInqrAKaeT4G8UDhm4Ehj9kd3gyRLiECxazkwEIRbxV5XeRifgZs9xrA2QaHL8+vv
         glub7VgCe49zD1MW9UNOtaV6La/JPG+LT5tnXCTV7fsOBwYTTVg03VT31gYZuUFH3yUh
         GRjdvP97xCsB64EjMLch68co2KZdRWGReX+KuTmU2w8nfTbKAORuJkDkLJCagehXZjbi
         0Erg==
X-Gm-Message-State: AOJu0YyirtCx9akZWlHIxNDqS79Pz9WRHBTG8MCUQ/tEbLrzwa8ANIay
	zro7c+H8LEHGvrQq/L86GvC1h6UiOwVUPi1B3UN3H+QsECVZTFS4H7K4ZzUSn2WJ
X-Gm-Gg: ASbGncs9zQ98JuxbhhOaQlrMTKSa2MBLkGjEVaS0hR2A2VlebTZ7owVIG75XEunt6sk
	lxp4BIXOC1HNWojjCPqfsw6920l8FdQHtR+KleyTZV4HRfwXBSiDl31pvQYPiqM3L1WTrxE69Vq
	odVhDiSg2wKQQYBB97f9x3HoJuk9YRZz1McLgqo4PRTnWOtPJzpuVJ0c4hV7E9AYlJgYFiLkouS
	7p565w9RKuiolMVPm09+6NBoqoDlM3DhhgHrS7uYaiJrj/tqHtjALE+qcVdp/vUHrZCryU3XNhd
	vBsPhxwGmiaNjEztAC6Q/dT8Wr1UZp5zdYLeeXqI+OanoSzhJ0e12mBk+l5eJ3icp5JS4FllIjh
	HUJoj4o26SfuUTsC2Wy9gzebB1x/Z8Hh36uqmY7qOrwzd1qUFP8/l68cYxreUuUIEwidlAtXkp8
	76Xnrcfh79XcAmGHWm/tCEnDiT2cR1AeODEnH5w5Fj2gTttAD2lY99WeM=
X-Google-Smtp-Source: AGHT+IGvcLw9e5Dq25DjgRirv6P4NejYsNChqzhMYw6pGdjHqwXBeATk9F8SVHU+N+ib4UG0f6GyvA==
X-Received: by 2002:a17:907:7287:b0:b70:b661:cfcb with SMTP id a640c23a62f3a-b767170acbfmr1356195866b.31.1763987657530;
        Mon, 24 Nov 2025 04:34:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 09/19] xen/dom0less: abstract Arm-specific p2m type name for device MMIO mappings
Date: Mon, 24 Nov 2025 13:33:42 +0100
Message-ID: <abba4c6fc6a04968333a3602db8384804c126b0d.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce arch_dt_passthrough_p2m_type() and use it instead of
`p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
common Xen code, such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a static inline
function for Arm.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-6:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - Introduce arch_dt_passthrough_p2m_type() instead of re-defining of
   p2m_mmio_direct.
---
Changes in V3:
 - New patch.
---

 xen/arch/arm/include/asm/p2m.h          | 5 +++++
 xen/common/device-tree/dom0less-build.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index ef98bc5f4d..010ce8c9eb 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,11 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_dev;
+}
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(_t) (1UL << (_t))
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2600350a3c..495ef7b16a 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               arch_dt_passthrough_p2m_type());
         if ( res < 0 )
         {
             printk(XENLOG_ERR
-- 
2.51.1


