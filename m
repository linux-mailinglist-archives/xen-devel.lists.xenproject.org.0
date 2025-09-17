Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327DB820B4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125588.1467546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08D-0000jl-4x; Wed, 17 Sep 2025 21:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125588.1467546; Wed, 17 Sep 2025 21:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08C-0000eV-T7; Wed, 17 Sep 2025 21:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1125588;
 Wed, 17 Sep 2025 21:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08B-0007Lt-Gs
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:03 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19608110-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:01 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4cb3367d87so212305a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:01 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:59 -0700 (PDT)
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
X-Inumbo-ID: 19608110-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146160; x=1758750960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcLmNQkVQOLKgrTuI68wuQc9H659mDMILoNkE3vd5o=;
        b=Noln9XBpYP+9HGHlbEUySgHK4rUMu9nwiVdXhn1bBDjNjLGCHi8znj8bYNe7/p4DgA
         pC18TYGZn7fBYE2Xtgu1GwT9Iek+akIbKVAIT4KqdL4fkZjtEViTF74eNbGX3U4tolun
         gnni4gtbDT9Inw5HyM9uRb0YH096id6vp3MDURx9MPBbVJ8DmRdYk6dV2fktb4Wovaq3
         mFaJjwZ1G0i+qP0vCMxWJr4iszE9ejR9VNtsCGy3t382D+RCJhqGlaOt2lg7SfIG2oMZ
         MjJ44S4ISoNPvdy1sFrkT0Aeg+UGxPzP8Z5/PR7Blj7SZarS1U5FqSgGJeeOt08RElG2
         OOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146160; x=1758750960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZcLmNQkVQOLKgrTuI68wuQc9H659mDMILoNkE3vd5o=;
        b=fLN+gOCXj24Z5dEnEwzCCUGbXki1zleNs0gvo2LW5QZW+r431QwzWEdBtP4c/38APM
         EnQlRNXGvX3MkuAE8H8qz2efh4b7Ho0JNXrZvcOyI20r2GyVEmKDyDRm9xo8FcjvTs4V
         1oYucmyVBhnvX4sONhaMQZUUcXtqNvzYKOitclvZkLw+kZ+ciXrKjcOUYw+VlanxY9oG
         3kHIoRj6Kg1IpXz3nFttFZJXUemizEUWnGiTTyA4+9PVQ7Z4uGp1w3v48BE8Ll7LrQCy
         qb5ghXj6sXh0KztEzV3lgWyjhGV7aBBivB8LrbxFqyswCYFCtsccKJKzQh09rE73rKW9
         zWZw==
X-Gm-Message-State: AOJu0YxLiWVnLPK9k2rweQWtnUWegckTSfgjg8Of2eVTihU7y/DUnp2K
	kftIg7H7ej0Mztm2R931uZIMaGFgX3ER0TPLeGnP3224m5qIQJBczJCwC5XnDl9nR3g=
X-Gm-Gg: ASbGnctxmOZH419O8jDD/lGLew1l+ccPo1cN3RM1NYqN9XySV4W7ofJZmdW+qfGL8i2
	Szs9UFuWzGFOmnXbwpNJ8Bf5RVQMFVtVT+ntlepEbvKR4Tgidj5miinwzlf3AFyXx3zSrpN6y0Y
	NMIktwrguv8d1VEs1a0VKC2FwedCljGzrpvVMBZosRvib4lXGkagWRlR4nIP1iRpGF1TWBsj5XR
	qHzlG9G5T6cg2fP0LvYC5ejeOHXkteFi65CDFo2pI0z71zfCuqLMtWCFd8O3A2wwOex8l7HaRrb
	mbilpbGdrOyFWJAiCJvULqN/NY1pgdpyEXIvzBkUu1DvrvJ90kgXPZBgCqCbUJRN0Aavb5sQQjm
	E9AePJGf7PxdWAJ7XBlSYHua+amBc3fYuVOEZ8mWEKf0Z
X-Google-Smtp-Source: AGHT+IH8uiEcadEbIByO4YCuV4gqgC1K71GPzV6LiXaIFZ9r0h1xrpWNBIpY9saoXckBlG1bA29qmQ==
X-Received: by 2002:a17:903:2acd:b0:25d:d848:1cca with SMTP id d9443c01a7336-268136f9cccmr41990305ad.35.1758146159902;
        Wed, 17 Sep 2025 14:55:59 -0700 (PDT)
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
Subject: [PATCH v4 07/18] xen/riscv: add new p2m types and helper macros for type classification
Date: Wed, 17 Sep 2025 23:55:27 +0200
Message-ID: <f73aac6730819132923e0ccf57eec87f4c9955f8.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_ext_storage.
- Added macros to classify memory types: P2M_RAM_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Introduce arch_dt_passthrough() to tell handle_passthrough_prop()
  from common code how to map device memory.
- Introduce p2m_first_external for detection for relational operations
  with p2m type which is stored outside P2M's PTE bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Drop underscode in p2m_to_mask()'s argument and for other similar helpers.
 - Introduce arch_dt_passthrough_p2m_type() instead of p2m_mmio_direct.
 - Drop for the moment grant tables related stuff as it isn't going to be used in the nearest future.
---
Changes in V3:
 - Drop p2m_ram_ro.
 - Rename p2m_mmio_direct_dev to p2m_mmio_direct_io to make it more RISC-V specicific.
 - s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
---
Changes in V2:
 - Drop stuff connected to foreign mapping as it isn't necessary for RISC-V
   right now.
---
 xen/arch/riscv/include/asm/p2m.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 7b263cb354..8a6f5f3092 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -64,8 +64,29 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+
+    /* Sentinel — not a real type, just a marker for comparison */
+    p2m_first_external = p2m_ext_storage,
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_io;
+}
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t) BIT(t, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
+
+/* Useful predicates */
+#define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.51.0


