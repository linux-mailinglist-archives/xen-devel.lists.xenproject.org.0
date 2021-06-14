Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671693A6F2D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 21:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141779.261780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lssLx-000317-4n; Mon, 14 Jun 2021 19:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141779.261780; Mon, 14 Jun 2021 19:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lssLx-0002xs-0h; Mon, 14 Jun 2021 19:34:33 +0000
Received: by outflank-mailman (input) for mailman id 141779;
 Mon, 14 Jun 2021 19:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l3uV=LI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lssLu-0002xm-Qk
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 19:34:30 +0000
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3acbf862-9a14-4495-a176-4102edb468cb;
 Mon, 14 Jun 2021 19:34:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ba2so46233318edb.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 12:34:29 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u13sm2732346ejt.23.2021.06.14.12.34.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:34:28 -0700 (PDT)
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
X-Inumbo-ID: 3acbf862-9a14-4495-a176-4102edb468cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wsl5VUiqlSvUCYkCQr89Ot4l2itto59SeHxgpirziTs=;
        b=fbT9uMs72X0hB9b5eaxO3o9uWNdjtW8iAW3bi4IFtN/JqtUFycvakCI0N7/xnb4H7W
         0OU4UQoiSvBKjzILJHnzTRYeNHrHip9bpOM45KmkePNT4rg0gxJGIOnJKKVFZNVqN6rJ
         M9mEdexG9UCdamYKLGOedlcXiEn/lYXRMS6HuGYy1RGurVAPeIZztWoIr6l2ilKDUbaZ
         yOiJtLqXGk1pGEmaafCO0dOdTApvH/pCz04AQGoRdxFBu0BOcqNsYYevaZpBGpFJkUjk
         ZYi+RjT64FJecAQhpvAAwkc1xxTmNo3yvnO+7C1iLK6IVCV59MfZzSFoLgBL0QwBy7jj
         bylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wsl5VUiqlSvUCYkCQr89Ot4l2itto59SeHxgpirziTs=;
        b=aLDJu5ll3VSEMRjUpaFXP9BMwdEY9FpA/ePq4kXHi5x03opTGhsHu9cEHjOATx5onM
         1EHMeW2/BL9R8YHP2jtPSIwoY4I/oUjgGYDPy3dJWy1A9652qYrEC7cfi+z1cAPFjBfN
         EWnbWSI3jE5J2QCscSPQ7mUsIk0cJP28cgwB3iMuXlFj8cHPvhOayMV8vN3RDItD7/xm
         fo1xQ3AzVasI95H/NT0X6qBMIuJdw1uVXb911ZU21n8Ybv4at6OvGs2A4tuGmDh0q7zA
         v5qFKkXVXGYI/SFVSEmfY7CSxKg4hsQ+avz9CT5kUeGmFHrZ4xph5E/MYBX5qytAWZJ/
         krVw==
X-Gm-Message-State: AOAM532zzzYOCZMG6k9kRCtAop84ZmXaFecTOZLgh7QJknBX7PeE7MF5
	zzSbEz4Z4osKhyHFnGLFr8FHk9pyuFsrVA==
X-Google-Smtp-Source: ABdhPJzgCXPW2QyPZrRK2TJIvjDCT1B4Xuvcbd9uzl93uM7fYr+R/g8Qh1TiyPuSX384R4rNsClqbg==
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr19303708edd.104.1623699268754;
        Mon, 14 Jun 2021 12:34:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: bootfdt: Always sort memory banks
Date: Mon, 14 Jun 2021 22:34:27 +0300
Message-Id: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

At the moment, Xen expects the memory banks to be ordered.
Unfortunately, there may be a case when updated by firmware
device tree contains unordered banks. This means Xen will panic
when setting xenheap mappings for the subsequent bank with start
address being less than xenheap_mfn_start (start address of
the first bank).

As there is no clear requirment regarding ordering in the device
tree, update code to be able to deal with by sorting memory
banks if we have more than one.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---

The proposed commit fixes the booting Xen on R-Car M3-W+ SoC:

Starting kernel ...
- UART enabled -
- Boot CPU booting -
- Current EL 00000008 -
- Initialize CPU -
- Turning on paging -
- Zero BSS -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) Initrd 0000000084000040-0000000085dbc32a
(XEN) RAM: 0000000480000000 - 00000004ffffffff
(XEN) RAM: 0000000048000000 - 00000000bfffffff
(XEN) RAM: 0000000600000000 - 00000006ffffffff

...

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) cannot add xenheap mapping at 48000 below heap start 480000
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
---
 xen/arch/arm/bootfdt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dcff512..3ef63b3 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -13,6 +13,7 @@
 #include <xen/init.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
@@ -395,6 +396,21 @@ static void __init early_print_info(void)
     printk("\n");
 }
 
+/* This function assumes that memory regions are not overlapped */
+static int __init cmp_memory_node(const void *key, const void *elem)
+{
+    const struct membank *handler0 = key;
+    const struct membank *handler1 = elem;
+
+    if ( handler0->start < handler1->start )
+        return -1;
+
+    if ( handler0->start >= (handler1->start + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
 /**
  * boot_fdt_info - initialize bootinfo from a DTB
  * @fdt: flattened device tree binary
@@ -412,6 +428,12 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
 
     device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+    if ( bootinfo.mem.nr_banks > 1 )
+    {
+        /* Some DT may describe unordered banks, sort them in ascending order */
+        sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
+             cmp_memory_node, NULL);
+    }
     early_print_info();
 
     return fdt_totalsize(fdt);
-- 
2.7.4


