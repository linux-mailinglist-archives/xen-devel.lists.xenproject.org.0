Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zdCeKm3F8GkzYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498D4870ED
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296329.1572763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVa-0005gu-Rg; Tue, 28 Apr 2026 14:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296329.1572763; Tue, 28 Apr 2026 14:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVa-0005fc-NQ; Tue, 28 Apr 2026 14:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1296329;
 Tue, 28 Apr 2026 14:33:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVZ-0005Yo-0t
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVY-002Kdm-D9
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c54a-bab6-0a2a0a5309dd-0a2a450cd3a8-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:52 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c550-62f1-0a2a450c0019-d1558032e53e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:52 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso120333005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:52 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386831; x=1777991631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct8Vr7tZTUAd+DiLlXb8sJtqUfUbJzJOW+ZP26uy5x0=;
        b=giWN2XcMhnQksCOt+DLn7Lx0aMlT84S0Ff13f1m3vj7IV17uzMvy6ElhgGBzleMWgt
         z41zuZs4gBgKe2T4YRZrQSjTLOO4lFHoIq6txluLzE69DBDC/gXxVpXaEO9srYqE7jGv
         WV+XjmYc67mTXjyhlXf/l9juDx4jM83IMOzV93vzQLF57+YjsrybUYbaHZ8hMAwa+cVR
         QhRxMq3cT9Exjf0ROkxqZXPggx2R5d63fougEu2xy0notL3deF9mi2V4zudb9gfXBpS8
         mynDIY8Gkr+kQ/wR6tZV0qicjD1XRMlEpuJO9+aTpFmjhCdQeV9gVMv/Rv0XUW6NGjXI
         NApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386831; x=1777991631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ct8Vr7tZTUAd+DiLlXb8sJtqUfUbJzJOW+ZP26uy5x0=;
        b=BjRIuM8JjOhquu+YLbDdoaVuivSI7m7Lf8dzusdXljvQZCVBvmczNjDM/+KoaT+2yR
         DPAO5oBak0URKXoRbEAfQnjE/SZ1IIA+czlnEfZzVijZsXoRVIBwUvZYx64yo8T0Cz7J
         MYDE7FlQTsTGxX20gud/Ey7kJBnYdYVKfkLilzfmE00zI2knJ8RIpSzf1yunLM+o0EXq
         /bD5/DojnH3XAbFW761pObM4n3CIFotFyS4RE7y8mkTAt6HQAkRNK47u6YW+JYRRSHst
         p6xi3LwRg9TPPZ4JDndazcWD2tqLfHyqOFQMX3pXjPQ88ABPUn+nnDmYukTDFPpvoGhF
         8owg==
X-Gm-Message-State: AOJu0Yxla/+oZOPdJ3Y3VKm0FHmvd2XUoVFhreYm+nH6CL3N7I8bmune
	b0R6HMddiRdybZhqfBC5mXwczl8OlPLlZLfVQwP8bM+HLZ6yftlMUU+c8RI7fQ==
X-Gm-Gg: AeBDiet3Lb/fNxBMOwkZzGaNi021sDBRBjFpW25ROdD2FohMNlxkRAD+OAeqb029aDL
	P0IlX++bPzfCIJ5iBV6PkNwRD20FlwzMc1Tn6AYBwZUSNAuzR6HK96FYZL8+lxa+nt8Y/W2UzDI
	BYt+4Q1OveJpa+r9Pwjd+znzmJj2ccZUk9w3Bj7+dwkDPfLd8vJipaoEk2xeAYmx1yoA7A1mz8n
	tYmMT/NnpLyr3OKbOyk3Fh7JUFD9y20e0rQqc1qOYDB/hI4JuUkfKCLbSR9LMWtVgVfseAkg7Pv
	Z9KirIOPYE0M/S6WNyFCD9IDmibA+XYVAHt1k376OZQMDw6EAUa4gY8KosStEyB4mEjAXvFnXgg
	p3/3q8QZDuPjOuHdYI/3OaVAYEwUwCFadM/vMFj0jYcjrL2lctGQagL54yvGnxU8zeSNfiypxQY
	eSC8Jff6sD6MqMkK2CIdH0IeEv63l60xgzlQOTPfvEul8O2Gc3R/PgYLHDyVeNcThgSgMZmYwig
	9B7ng2038zYQPs=
X-Received: by 2002:a05:600c:81ca:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a77b24e5emr53261145e9.27.1777386831127;
        Tue, 28 Apr 2026 07:33:51 -0700 (PDT)
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
Subject: [PATCH v4 02/11] xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
Date: Tue, 28 Apr 2026 16:33:31 +0200
Message-ID: <d87dd4f04e3f0d421485091cf434a088f6693641.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777386832-6E577CF5-E38FC2B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 7700
X-Rspamd-Queue-Id: 5498D4870ED
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.332];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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
Changes in v3-4:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - new patch.
---
---
 xen/arch/arm/kernel.c           | 48 ++++++++++++++++-----------------
 xen/common/device-tree/kernel.c |  2 +-
 xen/include/xen/fdt-kernel.h    |  4 +--
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 9395b5af8745..a5554714cd7b 100644
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
index 86a37a13048b..54be77aa191e 100644
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
@@ -133,7 +133,7 @@ void kernel_load(struct kernel_info *info);
 
 int kernel_decompress(struct boot_module *mod, uint32_t offset);
 
-int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
+int kernel_image_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
 
 /*
  * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
-- 
2.53.0


