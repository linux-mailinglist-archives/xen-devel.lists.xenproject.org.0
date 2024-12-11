Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A899ED368
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855077.1268117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVF-0007SD-4G; Wed, 11 Dec 2024 17:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855077.1268117; Wed, 11 Dec 2024 17:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVE-0007Kx-VC; Wed, 11 Dec 2024 17:28:00 +0000
Received: by outflank-mailman (input) for mailman id 855077;
 Wed, 11 Dec 2024 17:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVD-0007J6-AS
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:27:59 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 436c2f1d-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:27:58 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa696d3901bso596135366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:27:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:27:56 -0800 (PST)
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
X-Inumbo-ID: 436c2f1d-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938077; x=1734542877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWBao4XqsmB8/UXiyyZSgIeWD9mc9NwUxRoYjmq47fU=;
        b=Z3sUBgl5Y0NBzVknFqZBALu00u6ImGBTzQarU8aWwG+JzA6qCo289cWNhFExYce+rn
         gKJxal/yXrpOEfG1EW7D+FqrhVzBaGKSsSjpMbVPdhQV/W2Dh9fzd9ER5HhdMmaIP5uk
         sXpuqqwUuyd8AMo8ldDbQRvhGTw4PeRQo+qB2JRbAeCrfbLcZuGtntu7CwRb2kblubse
         NTxbZah0KQbLfEJLuJvhb3C8J7sH98gZ0h1BiPkAbKNiIhuYkSLCR1q6HwUOO15a2uqz
         YpJzy67wEzxLAqVmddJWO7gdTbqiQqWZqWwwy0g+e3CFXgobAXaPbhzD3xS44u2Y31Hd
         9UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938077; x=1734542877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWBao4XqsmB8/UXiyyZSgIeWD9mc9NwUxRoYjmq47fU=;
        b=T+E+0EVE1h/w8WnF+/hq3rCUOv8GqJo1Z2x0w/cdhvmIKBdbQx/xrJplzxUkppXoft
         T7mzXUM4jJj+x9Y8BfXR2pIFr0Bujv8Qnm7GpuAROmMgRxXy8UOZtLFA/9MbMqCGUcTF
         Bsb8z5mcDbpN/bgm3RIyIdPKgs384Fz7MtDYjpboN9WidI4MeP7gETqqZYqMNPTpO1fR
         UU+V/5ML7LCdAsJNULOidu8GM+8VgGEy2yzsx9eUQHmcIuEDCnrqnUsBjgl90ypcrfkH
         hJBFk8C0eD+seQi2yxD5vRNPg0TzNcNQcsShqPkffnxgTHw7YUAtuml21kzD8XIOqQWL
         W4Lw==
X-Gm-Message-State: AOJu0YzgpLbIF+RiXQiK6km0vn4+S42oLYWMWLkeAd8uZqReQSGIjoYT
	dNBHDwPd+LZE8v0pd5R0PYf1octVpWW0KIniePGNtTrkM65+xUW95HWNiLOg
X-Gm-Gg: ASbGncv36Iu8a8HZnRD0GMX82atwoPsz8K7Crc9tj1BLMtOdiiLjPGMWrRO/6DO6TWE
	2iQKx4sgWhzK1PiAR7OsiHnZbBv41IZfWTRRf2FgPn+CgwCJ+JIZvnjirawIMZsVA27f7VfmiHn
	Vb0YDGwe726B9XP7tro+bxutI4f4mKsBBVAIE9O3hW+g7CsrrkYla1xZH6rctr/rvjHK+JJ5M3m
	/fPrei5DnkCuTISTLuxu5zz1GBp01bpdlqiuKxMYqZZ98T4vbSdkN4=
X-Google-Smtp-Source: AGHT+IEnjYQPlyyOFaaSm0cIXgB3hbmyPLyJZAeXB6K1RN5O+yRnA+Ihrj0qpAB/P8+c5QuvlfYlKA==
X-Received: by 2002:a17:907:9145:b0:aa6:966d:3f93 with SMTP id a640c23a62f3a-aa6c1b0a214mr57357066b.23.1733938076730;
        Wed, 11 Dec 2024 09:27:56 -0800 (PST)
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
Subject: [PATCH v2 2/7] xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page tables
Date: Wed, 11 Dec 2024 18:27:46 +0100
Message-ID: <d52c84417ae4aedb8ce9f73dfa2340fceea137a4.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the destroy_xen_mappings() function, which removes page
mappings in Xen's page tables between a start address s and an end
address e.
The function ensures that both s and e are page-aligned
and verifies that the start address is less than or equal to the end
address before calling pt_update() to invalidate the mappings.
The pt_update() function is called with INVALID_MFN and PTE_VALID=0
in the flags, which tell pt_update() to remove mapping. No additional
ASSERT() is required to check these arguments, as they are hardcoded in
the call to pt_update() within destroy_xen_mappings().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Drop ASSERT(s <= e).
 - Update implementation of destroy_xen_mappings() to avoid calling of
   pt_update() when start_addr >= end_addr and return -EINVAL.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/mm.c | 6 ------
 xen/arch/riscv/pt.c | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 9359dc7f33..f2bf279bac 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -360,12 +360,6 @@ int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
     return 0;
 }
 
-int destroy_xen_mappings(unsigned long s, unsigned long e)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
                                enum XENSHARE_flags flags)
 {
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index d62aceb36c..86bd9ea613 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
     return pt_update(virt, mfn, nr_mfns, flags);
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+
+    return ( s < e ) ? pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0) : -EINVAL;
+}
+
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
-- 
2.47.1


