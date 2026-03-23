Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKhhIMtqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079AD2F838C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259452.1552773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iB8-0006H9-F5; Mon, 23 Mar 2026 16:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259452.1552773; Mon, 23 Mar 2026 16:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iB8-0006Ew-BX; Mon, 23 Mar 2026 16:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1259452;
 Mon, 23 Mar 2026 16:30:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iB6-0006Dc-HE
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:30:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iB5-007jD4-TT
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:30:55 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16a97-bab6-0a2a0a5309dd-0a2a4503b4ec-44
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:55 +0100
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16abf-1947-0a2a45030019-d155d031c542-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:55 +0100
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-668d70fabc4so918391a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:30:55 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283455; x=1774888255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFYQihohLvdN+/ExvCQUaHnRoG/WzCRUsmGA2ZwH768=;
        b=BygPlh7JyaB2oqV1Hw5pK5nqh+z3d2fFq/BfAmHqSaQxb55iWBvP5JrKi9JlsfR035
         DBFumNI0vVYr8ylPJXfEK/QCMrGIlLGbms1VVnntq91ciHT/q8v9zkbPfRPOglML9fjd
         EkZ7KTMtXyPr9YRbDDCn6wC5Raf4CDkZO5fWpDGbqrGVQ40c/b3fxXuZljNoFk6mJt76
         G4oVasqOURMGSOuw+3GrynBhtIE4jvQfO+fdK2q+JGC51qfFH3uUC1WIGNX1Dpfrk7Go
         vF4igWtIo7OvwOGwf+pWVOQyGUKKOP7INkYS/g4wk59P9uE8H1ZpLWF+D4jUP6fGWWgQ
         TpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283455; x=1774888255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFYQihohLvdN+/ExvCQUaHnRoG/WzCRUsmGA2ZwH768=;
        b=Gtv2zOWG5bfqsNTlNwUKVtEG974cUpMck18pNgIGdxybz6x4BIsPfpe5a1HcW5DHre
         DiF2L31WQ6HFbXs9AxvHWhNpHZ6Zeg5sOqXvXZ0/FuXnBJ7Ps3IBaBG66PTNFe4g2ETb
         UdAREwpja5uuJPVlpofh3kIRSFJzMw9Yo9+PqQOVn75Cyi8C2HZbmHSRHRGxyAL8ZApU
         npGHxehtq9QJX4XwzQRDLtXTz0r3C5dkntbI1G0B+PQ3tJWZ/olps7gXNHWOa9tk+iwR
         KFwdOq/g3OPouE038TVFW/zeOQJTMoMzF9hih3Qt+exLWnF4L8hpRbTsxteS5FmD89CB
         Io6g==
X-Gm-Message-State: AOJu0YzdSnPNfyrw4iqQpRGdP1C6ugL3F1w5XI6jv19rs8rQWb1O3tfi
	OZUR66KsO5dD5NtNeMkk3aEkj2uptHpVyfjPCx8xQkOVCKSiOuMF6QC+LGFxtA==
X-Gm-Gg: ATEYQzxUrCEKriWaeZCFeGGJNoE69PlHZtEZDZx8tyXpI0oH+s/5aZ936JHcfLTZDIG
	hln0cBlXiVsvA3ZfdIRuX+gc/IUb/Lk37LZvWPBS2Hwvc3d6ra7KQE3D/F0UGv2BxSzPD6iNgrf
	QXs8rus8M1HhwoAuNJx74fZVcnYs1feBR7gxmfKmZdSokF4vWD00g1gxj40vKN6wZWkztOFrFB9
	pssaB9YYWeQTgAZEqOSrk7FKdsNdn2auYpYGjsGNQ2htx7Bj+UgqmDOCw2M7zrUykYoN5/J6Kym
	APmeHonTfVNnTmi16ZSGuZKjzl6ug9lAEndn04EdtMyFDoY9jqvXiGSJd+aeqbsTA2DpmvIe+mt
	BFb45maQ7Z1KM8o+BM6x+5LjdooC8uF/bmHBPTNm5rC6bIxCIitIJV8vUXisBisBHrUgC9Fsumq
	4ItzwPESx48GqQKA/VHKK20aluqxx6caTZXfmKZHXpF0VBF7tE0ZhlM9MfddTIG+t0pw==
X-Received: by 2002:a17:906:5985:b0:b98:5b2:77fe with SMTP id a640c23a62f3a-b982f21d401mr575939166b.3.1774283454732;
        Mon, 23 Mar 2026 09:30:54 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/11] xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
Date: Mon, 23 Mar 2026 17:29:45 +0100
Message-ID: <0fc8039cce1d8bcce1539e7c9ced71f2d1e85b6c.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774283455-4905472C-809ABE1F/0/0
X-purgate-type: clean
X-purgate-size: 7643
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 079AD2F838C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2:
 - new patch.
---
 xen/arch/arm/kernel.c           | 48 ++++++++++++++++-----------------
 xen/common/device-tree/kernel.c |  2 +-
 xen/include/xen/fdt-kernel.h    |  4 +--
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 7544fd50a20f..3c613cdb233f 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -101,8 +101,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( (info->arch.type == DOMAIN_64BIT) && (info->zimage.start == 0) )
-        return mem->bank[0].start + info->zimage.text_offset;
+    if ( (info->arch.type == DOMAIN_64BIT) && (info->image.start == 0) )
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
@@ -289,7 +289,7 @@ int __init kernel_uimage_probe(struct kernel_info *info,
      * Thus, Xen uses uimage.load attribute to determine the load address and
      * zimage.text_offset is ignored.
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
index 33a60597bb4d..2af3bd5f0722 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -56,7 +56,7 @@ struct kernel_info {
             paddr_t text_offset; /* 64-bit Image only */
 #endif
             paddr_t start; /* Must be 0 for 64-bit Image */
-        } zimage;
+        } image;
     };
 
 #if __has_include(<asm/kernel.h>)
@@ -122,7 +122,7 @@ void kernel_load(struct kernel_info *info);
 
 int kernel_decompress(struct boot_module *mod, uint32_t offset);
 
-int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
+int kernel_image_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
 
 /*
  * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
-- 
2.53.0


