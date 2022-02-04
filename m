Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07154A9409
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265007.458302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBZ-0000dp-23; Fri, 04 Feb 2022 06:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265007.458302; Fri, 04 Feb 2022 06:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBY-0000Xs-Ok; Fri, 04 Feb 2022 06:35:08 +0000
Received: by outflank-mailman (input) for mailman id 265007;
 Fri, 04 Feb 2022 06:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBX-0008DX-0q
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973fa44c-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:06 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id z4so10781574lft.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:06 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:05 -0800 (PST)
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
X-Inumbo-ID: 973fa44c-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lOljSwfVLv7O1Qu1kbWEhEP6CpP7dXjj0XKQulfe6E=;
        b=Ck6BoSlnQgRISD6huKxphsjKoG7Euj2TC16HbLrf+oVTvsu+WKBI1c3kt8icPCERIB
         tkkWe/KesrqTP/q7HDoal4nGgy9m/6Ew9lCh7TrJWuYslrgjYmgtc6Ea5jRCMjJNj4LC
         kg7zdt2/kaKGbAzTDzeW0NoyYPbUHwutKjT6erIRJQAcUqAXsOSafT3+eODU1ugAQHtz
         Zgn5ZYMrhi45XL/tNMKmf75EiXt2FD+8gRN2p/FUE/n+37KE3I7BSLgLtjIB4Cz6vru+
         uXnAwU2XEzrjw0ZZYFZ7eJC2wBKSU2sap05DLurc4bQbHXDNegwVdVDrrSHmvXwPuWv7
         4RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lOljSwfVLv7O1Qu1kbWEhEP6CpP7dXjj0XKQulfe6E=;
        b=HBEiXgxoYa/kRj88N8yBGQgrz1YZXomxYTsTsW6YrvaVSI+DeYCHx6Um8vQuQp8BaB
         AN5IixKLuTiuC++5veHVRQQCPOxiW+cnl+26EXl+RHBSznp9gZuLs+HNLtG7PWoPlMSh
         QL72+Aq90rnz68+Sj2FR8oB/gRIbnV3g5qNCkTIZ/JfqPc5yidUqeZ/Z6JYQkTu37SiG
         93rKPSDtgcpUdZbvS8fHRjVuYYEwXpW9h8ZlI76fTJNs0zTJWCtgQQPcC2AgVHvzhReU
         9HuoIYdOmXdP5izkbAEkL3mDKPeZadBoh4RyP5Kwp1yex3zGpOl8mm89n7J6Ui+y1c3i
         WQeg==
X-Gm-Message-State: AOAM532NeogFBNrBMnfGXjBRheB1JCTN9TYaYGl1vEmpIKCUFE3GXMbH
	YQfzxkilMjbejVimjC/GsMVWnoVXSM8=
X-Google-Smtp-Source: ABdhPJyB6MQ7eonV8Yqfxf8f3gGfIt7kmJS1oIR+juotmd4GDOq+j/gxIoib7IA3nxTTvs39ppLLBg==
X-Received: by 2002:ac2:5186:: with SMTP id u6mr1392098lfi.519.1643956505619;
        Thu, 03 Feb 2022 22:35:05 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 04/13] vpci: restrict unhandled read/write operations for guests
Date: Fri,  4 Feb 2022 08:34:50 +0200
Message-Id: <20220204063459.680961-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

A guest can read and write those registers which are not emulated and
have no respective vPCI handlers, so it can access the HW directly.
In order to prevent a guest from reads and writes from/to the unhandled
registers make sure only hardware domain can access HW directly and restrict
guests from doing so.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v6
---
 xen/drivers/vpci/vpci.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cb2ababa28e3..f8a93e61c08f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -215,11 +215,15 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
 }
 
 /* Wrappers for performing reads/writes to the underlying hardware. */
-static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
+static uint32_t vpci_read_hw(bool is_hwdom, pci_sbdf_t sbdf, unsigned int reg,
                              unsigned int size)
 {
     uint32_t data;
 
+    /* Guest domains are not allowed to read real hardware. */
+    if ( !is_hwdom )
+        return ~(uint32_t)0;
+
     switch ( size )
     {
     case 4:
@@ -260,9 +264,13 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
     return data;
 }
 
-static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
-                          uint32_t data)
+static void vpci_write_hw(bool is_hwdom, pci_sbdf_t sbdf, unsigned int reg,
+                          unsigned int size, uint32_t data)
 {
+    /* Guest domains are not allowed to write real hardware. */
+    if ( !is_hwdom )
+        return;
+
     switch ( size )
     {
     case 4:
@@ -322,6 +330,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     uint32_t data = ~(uint32_t)0;
+    bool is_hwdom = is_hardware_domain(d);
 
     if ( !size )
     {
@@ -332,13 +341,13 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     /* Find the PCI dev matching the address. */
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
     if ( !pdev )
-        return vpci_read_hw(sbdf, reg, size);
+        return vpci_read_hw(is_hwdom, sbdf, reg, size);
 
     spin_lock(&pdev->vpci_lock);
     if ( !pdev->vpci )
     {
         spin_unlock(&pdev->vpci_lock);
-        return vpci_read_hw(sbdf, reg, size);
+        return vpci_read_hw(is_hwdom, sbdf, reg, size);
     }
 
     /* Read from the hardware or the emulated register handlers. */
@@ -361,7 +370,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         {
             /* Heading gap, read partial content from hardware. */
             read_size = r->offset - emu.offset;
-            val = vpci_read_hw(sbdf, emu.offset, read_size);
+            val = vpci_read_hw(is_hwdom, sbdf, emu.offset, read_size);
             data = merge_result(data, val, read_size, data_offset);
             data_offset += read_size;
         }
@@ -387,7 +396,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     if ( data_offset < size )
     {
         /* Tailing gap, read the remaining. */
-        uint32_t tmp_data = vpci_read_hw(sbdf, reg + data_offset,
+        uint32_t tmp_data = vpci_read_hw(is_hwdom, sbdf, reg + data_offset,
                                          size - data_offset);
 
         data = merge_result(data, tmp_data, size - data_offset, data_offset);
@@ -430,6 +439,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
+    bool is_hwdom = is_hardware_domain(d);
 
     if ( !size )
     {
@@ -448,7 +458,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
     if ( !pdev )
     {
-        vpci_write_hw(sbdf, reg, size, data);
+        vpci_write_hw(is_hwdom, sbdf, reg, size, data);
         return;
     }
 
@@ -456,7 +466,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     if ( !pdev->vpci )
     {
         spin_unlock(&pdev->vpci_lock);
-        vpci_write_hw(sbdf, reg, size, data);
+        vpci_write_hw(is_hwdom, sbdf, reg, size, data);
         return;
     }
 
@@ -479,7 +489,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         if ( emu.offset < r->offset )
         {
             /* Heading gap, write partial content to hardware. */
-            vpci_write_hw(sbdf, emu.offset, r->offset - emu.offset,
+            vpci_write_hw(is_hwdom, sbdf, emu.offset, r->offset - emu.offset,
                           data >> (data_offset * 8));
             data_offset += r->offset - emu.offset;
         }
@@ -498,7 +508,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
-        vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
+        vpci_write_hw(is_hwdom, sbdf, reg + data_offset, size - data_offset,
                       data >> (data_offset * 8));
 }
 
-- 
2.25.1


