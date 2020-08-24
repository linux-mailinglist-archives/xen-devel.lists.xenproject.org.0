Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8A24FDEB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABgv-00056j-LE; Mon, 24 Aug 2020 12:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABgu-00055q-Ci
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:35:12 +0000
X-Inumbo-ID: 91e24169-e43b-4cfc-987f-fee30dc35534
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e24169-e43b-4cfc-987f-fee30dc35534;
 Mon, 24 Aug 2020 12:35:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8794AFCD;
 Mon, 24 Aug 2020 12:35:40 +0000 (UTC)
Subject: [PATCH v2 4/5] x86/PV: also check kernel endianness when building Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Message-ID: <b3d55826-a4f2-dc87-e573-8e7215db29de@suse.com>
Date: Mon, 24 Aug 2020 14:35:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While big endian x86 images are pretty unlikely to appear, merely
logging endianness isn't of much use.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -288,7 +288,8 @@ int __init dom0_construct_pv(struct doma
                              module_t *initrd,
                              char *cmdline)
 {
-    int i, rc, compatible, order, machine;
+    int i, rc, order, machine;
+    bool compatible;
     struct cpu_user_regs *regs;
     unsigned long pfn, mfn;
     unsigned long nr_pages;
@@ -358,7 +359,7 @@ int __init dom0_construct_pv(struct doma
     /* compatibility check */
     printk(" Xen  kernel: 64-bit, lsb%s\n",
            IS_ENABLED(CONFIG_PV32) ? ", compat32" : "");
-    compatible = 0;
+    compatible = false;
     machine = elf_uval(&elf, elf.ehdr, e_machine);
 
 #ifdef CONFIG_PV32
@@ -374,13 +375,16 @@ int __init dom0_construct_pv(struct doma
                 return rc;
             }
 
-            compatible = 1;
+            compatible = true;
         }
     }
 #endif
 
     if ( elf_64bit(&elf) && machine == EM_X86_64 )
-        compatible = 1;
+        compatible = true;
+
+    if ( elf_msb(&elf) )
+        compatible = false;
 
     printk(" Dom0 kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
            elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",


