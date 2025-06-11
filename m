Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B28AD5463
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011625.1390070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJsW-0000dA-K4; Wed, 11 Jun 2025 11:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011625.1390070; Wed, 11 Jun 2025 11:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJsW-0000bG-HH; Wed, 11 Jun 2025 11:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1011625;
 Wed, 11 Jun 2025 11:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mXZ=Y2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPJsU-0000Zd-Oa
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:44:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d67a98-46b9-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 13:44:20 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60768f080d8so10030430a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:44:20 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc78b30sm864222566b.155.2025.06.11.04.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:44:19 -0700 (PDT)
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
X-Inumbo-ID: 69d67a98-46b9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749642260; x=1750247060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zrGz7vabRrqhZi8qJuCSsXTE3pK4LKCYUP1zEiLNUE=;
        b=ao3zxjl9JD1Fk/JEMjcOYpzmSnM9cJCbEaY7ohProSWZFSDX7f6xtcb2JuUZ4BM5GW
         8PywZiTGQM4MTppokWhuYP8XJrbzUemGiM7cnwz60Oj75OEOYzDh4G81rQXO8OZM6o4J
         6NKwQ6R3vSm0y5ZQxZ8iN7DN1w3cUOn1fJpQjmJm0WN/qIRzgVnqPIsrpSWpmjTTKnnq
         eGNgV8v2mnTWXtrRVrqX3ZlZB5oSRju1FbNGsQaf9+W3IjvOC8GGmyAl2pFrb3SEfFNn
         vNLNCe7jOzwg/JwtWqz9LNdL3LpcJQInlDGN7L1SdfjGVU9j6b++yvdnUYueybvboMsn
         X2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642260; x=1750247060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zrGz7vabRrqhZi8qJuCSsXTE3pK4LKCYUP1zEiLNUE=;
        b=M0Rl+jqOXfm+Ax5anbtHgqoBPWOi8fKbsYLAn4FbIpS9SW2pxi7LsNoeewpz+PKmRu
         4vmGWwfXRxTl7hy5L3uCPxiyRZR9hRhhlK56jrX2D5E1A3X5Qxq95CudbQc4AFO5gZkI
         o2VgjzRYCp/tZJSP23jTrpddPVd2EwZum+9eBP3UTWgegrtmts74BFdLqYJecUNxcY58
         7E4ikJYRxOQlVWdyk1hO7uh69QfX6qmP0vDnxSbJ9qChm1YFJsh81tlJcPEI6er8t+s6
         Z762fCQkR3q8XYZJ3g/mXX8uL6MIQ/utAOK0/Xl0Z+ptuv67jnuaEP1ZFUBw+LRsRrLB
         qTqg==
X-Gm-Message-State: AOJu0Yw3ZR1Lo2Jae554pnmSU/iGL8I0ymQz+EuL8RpuCtiNn7Da+g5J
	5mZOn4gShwZYgyD4Ckvps5PE4wNY0Ay9QyZDNSIYLQtsHlM/ZYQWYLmsvb1zmQ==
X-Gm-Gg: ASbGncsclFNOyCaEPo9fZkrI6XSM1z65f9ORR1uKYUqPNFxBNu4lb68JQswgxhevOon
	3eEZntSucOBCQvZIF/IjXcEYu2XV16SqiYXRCPeAuI2B/pGwySXe8Wz4J3XA7iTPoS1UqkYHIDg
	iwoDlUqgqjxYk48gsklxeZFsfgQ4lI070A2M1o/N4QXoJS8nSGnG7x6t7IzFTF1wLAfcTYwOQTU
	2JycJQAs/8sVLLYVq2Gazy/LSgatJhR2v8LlGnEZjh1Rc4a5T4UqTCP2POT3w/2qKeX0jc1Gh7+
	47hz5fF3x4JBrUOktiFsfV0NT5gPag16oKE6SKaXIT1dvV2fTruqsUwQ962htIHBx1nyfxwXrPy
	tLhRnxdlalPcxDgVhoG7T3m2CFXjv
X-Google-Smtp-Source: AGHT+IG47uhql+aAwV5zCtMf8GbeovXhTBMwIRjf+/h6sBNXAW/mmreWQ8PD33WAIgV8Ip0eQ0pqxw==
X-Received: by 2002:a17:907:3c8d:b0:ad9:db54:ba47 with SMTP id a640c23a62f3a-ade8c9111e1mr243374066b.43.1749642259824;
        Wed, 11 Jun 2025 04:44:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen: move declarations of device_tree_get_{reg,u32}() to xen/device_tree.h
Date: Wed, 11 Jun 2025 13:44:15 +0200
Message-ID: <20250611114415.64480-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is nothing Arm specific for these functions thereby it makes sense
to move their declarations to common header: xen/device_tree.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


