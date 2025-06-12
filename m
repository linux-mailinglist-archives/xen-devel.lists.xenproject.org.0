Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BAAD6D90
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012782.1391287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPf6e-0000Cs-Fz; Thu, 12 Jun 2025 10:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012782.1391287; Thu, 12 Jun 2025 10:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPf6e-0000AI-C3; Thu, 12 Jun 2025 10:24:24 +0000
Received: by outflank-mailman (input) for mailman id 1012782;
 Thu, 12 Jun 2025 10:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6bR=Y3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPf6c-00008a-4s
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:24:22 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66caeb9f-4777-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 12:24:20 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ade5b8aab41so170956366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:24:20 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6086a58f08csm977967a12.21.2025.06.12.03.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
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
X-Inumbo-ID: 66caeb9f-4777-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749723859; x=1750328659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UdVJFrxjHJKFfacS1TeLALqEa8kEbmNvmZtmUfINTM=;
        b=UbzXpjNW0NcWoazJd0tDA0M2nX63qsmC3JOVgj2aWxT1MbPJQPfpclVXfr0J/EKRN8
         WjUzVYMnHUw9p/FAS5GF3T0U7OQt7wdrXLx8UxTyed68AQ76zxXvj8bSKBLAlLjuShsS
         mMAZtyCHvwdZOUKwLvHjlrV0JHR3PPA0O/d4ZsMV72eECIbuDTogx5bYMzqV8rDn8jad
         l5txB2FG0KLrwb7WMh3fG8qci2Pji7e0yapqcgP1bYRXBKDgsEkhWkLyONf0+vXjeecV
         I3dseNBMi3D0PTq6UQKC11tVsjUFoECHqOYWvqt5XL/kfKsRCAoaeHskC0nigkGAPcR/
         UICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723859; x=1750328659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UdVJFrxjHJKFfacS1TeLALqEa8kEbmNvmZtmUfINTM=;
        b=dgZG3w+omlLmqGv6vAtOP8wdhGPQlERZFZvmK3Mhq3dIkoKuw+GULEHxlONj8qw45A
         0J40WL79AgjPVQUvJvfzsiY6ixhn15G3W3S2WKSP77MyTvw/x8traaeF6ASjuGcjEztp
         V0B+dHILkyCNuuL8BMRz3u2N30L7y1BszxX0K3GUOc5zazh1tnb1OXHfFvcBUUkhdmzC
         pg++aPQYf3SD7zgvxIvc9kCPTmiYloEJezKj+WX6Ee2DywnGJMB/E6+pt1ebVh6PHcQM
         sHV5xY1ea86occ/rcmb40reSkxW1gpq7KoXpxk1vryd/a60qtmEPmbzevXF6wv98vP6C
         aHzA==
X-Gm-Message-State: AOJu0Ywrltzb5lRPxRwR3ZSS1q+mbVkYR5aAkhCr+7vemfE0SUzNcbwF
	Aj5BGTV0u2/uO4WTksZ0Vl+Gez7KNM+x/nlZVZVG2xNs0bKojNxuDt3GKN4eTA==
X-Gm-Gg: ASbGncsGZBT2LVL+2G4R5gahZKqZs1YaOn9j14zVt37ycVCYWIwzol3L/RCtz453zTu
	bX8UXxM9FauEPK/iK+ex4uCfn/2RZYf2SwMqfGKFUBUnd0Ppf1yPyfNOVphi6V447uDYJJf4pEX
	tqromGp1yCeEzPNnHQ4WkF6y0QVWOnbI0us/j/GL6tDcXgRZzjTb3gG3CFYEPDX+hNaq39IR9xX
	PMfhQ9FKApr7TUh3+ap9vBbVHj6bv8ROKk56+d56wA4ovWKgvPbKCPC7PJoOa90W/oBW0DPzIRd
	jSlTgX9aQ0rlQFoBb5dpShbROALI1e/6DS6SYbFWwaGVFgSVa0nPJ/YkM5ClVDjWV8xQ/IHTGV4
	ApAMhOS+Ige7m800FSvG3aNy9YPOB
X-Google-Smtp-Source: AGHT+IH0JchigwQ8+ZY0LMinpF7PXANOo5GP/CgCmtRn6+c+7SJtcPipORpXfagUFAV4CmvPbF5SkA==
X-Received: by 2002:a17:907:9728:b0:ad2:4fa0:88cd with SMTP id a640c23a62f3a-adea927a0ecmr194139566b.9.1749723859090;
        Thu, 12 Jun 2025 03:24:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen: move declarations of device_tree_get_{reg,u32}() to xen/device_tree.h
Date: Thu, 12 Jun 2025 12:24:12 +0200
Message-ID: <df9a07fe958c8830f453eff162be448c5afe7765.1749723802.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definitions of device_tree_get_reg() and device_tree_get_u32() are already
in common code, so move their prototypes there as well.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - Update the commit message.
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
 xen/arch/arm/include/asm/setup.h | 6 ------
 xen/include/xen/device_tree.h    | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cf272c160..2b58549c1a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -53,12 +53,6 @@ void setup_mm(void);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
-void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                         uint32_t size_cells, paddr_t *start, paddr_t *size);
-
-u32 device_tree_get_u32(const void *fdt, int node,
-                        const char *prop_name, u32 dflt);
-
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 6dc1fb5159..75017e4266 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -949,6 +949,12 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
+
+u32 device_tree_get_u32(const void *fdt, int node,
+                        const char *prop_name, u32 dflt);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.49.0


