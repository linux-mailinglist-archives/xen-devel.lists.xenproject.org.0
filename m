Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMzCLWRU/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB434E55CA
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302328.1576298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZZ-0002dT-GA; Thu, 07 May 2026 08:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302328.1576298; Thu, 07 May 2026 08:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZZ-0002ba-CL; Thu, 07 May 2026 08:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1302328;
 Thu, 07 May 2026 08:59:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZX-0002MR-63
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZW-002y5h-Ip
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc544d-2eae-0a2a0a5409dd-0a2a450ab862-48
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:06 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545a-56b3-0a2a450a0019-d155d02ce413-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:06 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67c3cb1433cso892144a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:06 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144346; x=1778749146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc+/+WleWFSSpgrbZyRd8P0UB3Xb83BOo+6OlRzrn70=;
        b=CC8UBS6Zy2QL7cIqe6RcQJfEPkAYFSy+Fv6UxgljNiHPOhhCJNK4T0vmxMF1l+X8xX
         51wgz9qCpj2WOwxlBvrlflDS3O9dObR46KUU/d7mnM4se/uLQ0T4JUhG6JU+Kukry+d3
         AuYPKugzTGdIIx678ZstFSXTQn0NF4o7SZs6rfIhqvUFl86W7T5/GlgMFzDZEG2yqG8N
         /MsBtjn6Xb8VL4PAuJhyzOCRzTflz6Aj4fxnL5iZFEl26WwlUIZEbmCq48l7c6KnXvZU
         LBYescws0h1vhoySPVZaIR7Shdb9PpYk8Ad5/FhIs0pbzVL+I0l8c17pjX3/5jTvK+xd
         rRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144346; x=1778749146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zc+/+WleWFSSpgrbZyRd8P0UB3Xb83BOo+6OlRzrn70=;
        b=hnTDetYd3KowvrYeV5HQiQAyx3oEPIybVB9BacPbiuqpNcH0ZOp85jcvtBOnLtL8vc
         HZMaqzSRJzUGjvMcnILfz47PZJtTb/ut7e0by82E3Pk+8ygDHMUMLeT2NKEgIPyJHFEY
         N7soqYcy2QHsmgajrKYmy/vQQrZwma3LmOQjSuWRFQhZIgi5H/owigdVDUD2wKYEFFWI
         ptEM5JQsf4tlITNEWfrOCDXqrr2wFnDlohjpDSo/IAJ/latB1arFpAJG49e80Y0oqHgS
         +5mhfkF02Gp5w14omL6Pjyb1xWtNDSlkAyXbTAvwu5nyvml8rgAvF0LYfNcyjEY8GWtH
         Od8A==
X-Gm-Message-State: AOJu0Yxxg0CJb1c4k6HbXBs8DD7fLzfUk6WFiG7S87b8DJbcFp0vk9RB
	08ZP5nMZ59Yts+AGeZ3+CH1f+EBNQ5dCujkAkZ02kuHsepymNXJ9TioqhSKalQ==
X-Gm-Gg: AeBDietuIs20j1if5GSAcribvIpTRDssi/MUvP6mRDoXSbvAgttv/3hynMTJ9cx87bG
	lPaUAxNTd2S+mSei0DleJ5neKjf63qK6bbce4ZHXZuA7U4z3gnMHFdUzQukxUGOz0XgCVJLpz/M
	6oCwjXzjKyZkuxdxw0FaZR7cBsxdQ07LxcARYW2xptXOeOba7Im/dKFMBcMTc2KkJPGnJbgBles
	UpQuQ1Zm/eAUb8FwS2MxCY8EDSQl4529nKSQojHbB4EQ1jJvyIgJgMtPc0Gb2PkHT4+KryB8tl9
	0vzPvTD5MhBKXr7ww7htBQd9zMXhrkZOP3U6VGkJcRmH88379g1F9I8VhPv+ZLu/J0X1TStr70d
	1QSR7d86G6KEA7V0m63x9LTeR2ghX5LlgQ3R1F4xWylJV9bdirsgj1PPxOddRFDQRxlw4HFAEOx
	1qcO6M/lIdr2PHbS+ZRO9x3bt+Lb2x5cAV8SwyMnq4kIht3xze4qUV3x6gtbQ3nxGjS9ji68lMa
	BZs
X-Received: by 2002:a17:907:c18:b0:bb8:b536:55dd with SMTP id a640c23a62f3a-bc56d713f3bmr418780266b.41.1778144345375;
        Thu, 07 May 2026 01:59:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v5 02/11] xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
Date: Thu,  7 May 2026 10:58:41 +0200
Message-ID: <ceddcb0daabf3e58b1811e3499265dc6588ea4b4.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778144346-72B778B7-8E0966E5/10/73395122804
X-purgate-type: spam
X-purgate-size: 8345
X-Rspamd-Queue-Id: 6FB434E55CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The helper kernel_zimage_probe() is referenced from common code
(xen/common/device-tree/kernel.c), but its name is tied to the zImage
format which is specific to Arm (from architectures supported by Xen).

Other architectures supported by Xen, such as RISC-V, do not use the
zImage format and instead rely on other kernel image types (e.g. Image
or compressed Image variants: Image.gz, etc). Using "zimage" in the
name is therefore misleading in architecture-independent code.

Rename kernel_zimage_probe() to kernel_image_probe() and update the
associated structure field from "zimage" to "image" to reflect that the
code handles generic kernel images rather than the zImage format
specifically.

No functional change intended.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - s/zimage/image in some comments.
---
Changes in v3-4:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - new patch.
---
---
 xen/arch/arm/kernel.c           | 50 ++++++++++++++++-----------------
 xen/common/device-tree/kernel.c |  2 +-
 xen/include/xen/fdt-kernel.h    |  6 ++--
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 9395b5af8745..b72585b7fed3 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -101,8 +101,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_HAS_DOMAIN_TYPE
-    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
-        return mem->bank[0].start + info->zimage.text_offset;
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
+        return mem->bank[0].start + info->image.text_offset;
 #endif
 
     /*
@@ -111,19 +111,19 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
      * and above 32MiB. Load it as high as possible within these
      * constraints, while also avoiding the DTB.
      */
-    if ( info->zimage.start == 0 )
+    if ( info->image.start == 0 )
     {
         paddr_t load_end;
 
         load_end = mem->bank[0].start + mem->bank[0].size;
         load_end = MIN(mem->bank[0].start + MB(128), load_end);
 
-        load_addr = load_end - info->zimage.len;
+        load_addr = load_end - info->image.len;
         /* Align to 2MB */
         load_addr &= ~((2 << 20) - 1);
     }
     else
-        load_addr = info->zimage.start;
+        load_addr = info->image.start;
 
     return load_addr;
 }
@@ -131,8 +131,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
 static void __init kernel_zimage_load(struct kernel_info *info)
 {
     paddr_t load_addr = kernel_zimage_place(info);
-    paddr_t paddr = info->zimage.kernel_addr;
-    paddr_t len = info->zimage.len;
+    paddr_t paddr = info->image.kernel_addr;
+    paddr_t len = info->image.len;
     void *kernel;
     int rc;
 
@@ -215,7 +215,7 @@ int __init kernel_uimage_probe(struct kernel_info *info,
         return -EOPNOTSUPP;
     }
 
-    info->zimage.start = be32_to_cpu(uimage.load);
+    info->image.start = be32_to_cpu(uimage.load);
     info->entry = be32_to_cpu(uimage.ep);
 
     /*
@@ -224,20 +224,20 @@ int __init kernel_uimage_probe(struct kernel_info *info,
      * independent image. That means Xen is free to load such an image at
      * any valid address.
      */
-    if ( info->zimage.start == 0 )
+    if ( info->image.start == 0 )
         printk(XENLOG_INFO
                "No load address provided. Xen will decide where to load it.\n");
     else
         printk(XENLOG_INFO
                "Provided load address: %"PRIpaddr" and entry address: %"PRIpaddr"\n",
-               info->zimage.start, info->entry);
+               info->image.start, info->entry);
 
     /*
      * If the image supports position independent execution, then user cannot
      * provide an entry point as Xen will load such an image at any appropriate
      * memory address. Thus, we need to return error.
      */
-    if ( (info->zimage.start == 0) && (info->entry != 0) )
+    if ( (info->image.start == 0) && (info->entry != 0) )
     {
         printk(XENLOG_ERR
                "Entry point cannot be non zero for PIE image.\n");
@@ -257,13 +257,13 @@ int __init kernel_uimage_probe(struct kernel_info *info,
         if ( rc )
             return rc;
 
-        info->zimage.kernel_addr = mod->start;
-        info->zimage.len = mod->size;
+        info->image.kernel_addr = mod->start;
+        info->image.len = mod->size;
     }
     else
     {
-        info->zimage.kernel_addr = addr + sizeof(uimage);
-        info->zimage.len = len;
+        info->image.kernel_addr = addr + sizeof(uimage);
+        info->image.len = len;
     }
 
     info->load = kernel_zimage_load;
@@ -287,9 +287,9 @@ int __init kernel_uimage_probe(struct kernel_info *info,
      * header. In other words if the user provides a uImage header on top of
      * zImage or zImage64 header, Xen uses the attributes of uImage header only.
      * Thus, Xen uses uimage.load attribute to determine the load address and
-     * zimage.text_offset is ignored.
+     * image.text_offset is ignored.
      */
-    info->zimage.text_offset = 0;
+    info->image.text_offset = 0;
 #endif
 
     return 0;
@@ -338,10 +338,10 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
     if ( (end - start) > size )
         return -EINVAL;
 
-    info->zimage.kernel_addr = addr;
-    info->zimage.len = end - start;
-    info->zimage.text_offset = zimage.text_offset;
-    info->zimage.start = 0;
+    info->image.kernel_addr = addr;
+    info->image.len = end - start;
+    info->image.text_offset = zimage.text_offset;
+    info->image.start = 0;
 
     info->load = kernel_zimage_load;
 
@@ -389,10 +389,10 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
         }
     }
 
-    info->zimage.kernel_addr = addr;
+    info->image.kernel_addr = addr;
 
-    info->zimage.start = start;
-    info->zimage.len = end - start;
+    info->image.start = start;
+    info->image.len = end - start;
 
     info->load = kernel_zimage_load;
 
@@ -403,7 +403,7 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
     return 0;
 }
 
-int __init kernel_zimage_probe(struct kernel_info *info, paddr_t addr,
+int __init kernel_image_probe(struct kernel_info *info, paddr_t addr,
                                paddr_t size)
 {
     int rc;
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index 28096121a52d..cfa27464f0fc 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -235,7 +235,7 @@ int __init kernel_probe(struct kernel_info *info,
     if ( rc && rc != -EINVAL )
         return rc;
 
-    rc = kernel_zimage_probe(info, mod->start, mod->size);
+    rc = kernel_image_probe(info, mod->start, mod->size);
 
     return rc;
 }
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 86a37a13048b..8cd1670c2c6f 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -63,7 +63,7 @@ struct kernel_info {
             paddr_t text_offset; /* 64-bit Image only */
 #endif
             paddr_t start; /* Must be 0 for 64-bit Image */
-        } zimage;
+        } image;
     };
 
 #ifdef CONFIG_HAS_DOMAIN_TYPE
@@ -113,7 +113,7 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
  * Probe the kernel to detemine its type and select a loader.
  *
  * Sets in info:
- *  ->load hook, and sets loader specific variables ->zimage
+ *  ->load hook, and sets loader specific variables ->image
  */
 int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
 
@@ -133,7 +133,7 @@ void kernel_load(struct kernel_info *info);
 
 int kernel_decompress(struct boot_module *mod, uint32_t offset);
 
-int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
+int kernel_image_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
 
 /*
  * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
-- 
2.54.0


