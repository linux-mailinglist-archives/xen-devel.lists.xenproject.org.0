Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0E801794
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 00:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645796.1008159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Cr5-0002Ul-Vc; Fri, 01 Dec 2023 23:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645796.1008159; Fri, 01 Dec 2023 23:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Cr5-0002Sx-RQ; Fri, 01 Dec 2023 23:23:31 +0000
Received: by outflank-mailman (input) for mailman id 645796;
 Fri, 01 Dec 2023 23:23:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r9Cr4-0002Sr-74
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 23:23:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9Cr3-00032J-4T; Fri, 01 Dec 2023 23:23:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9Cr2-0004tP-RB; Fri, 01 Dec 2023 23:23:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=GDj1avht0w4HfBlVmADhv/jZTV+adPqS60hFif+I7I4=; b=WU9th68OdFuiUFwadAJnEqeFV4
	TZrA7dBUuMTgKEImXtsiBIyHhi3Zh7Sv7tWcxgw9/xL9jRP4dftU6I/pbWmAQehCZUwy9aE2A/Gy2
	Z50kBd/IVC8mOt5EqPgWGpnFJUFLhzBn9F89MkZsF11LjTuUIt44Q9osYAZjYIcS1M8c=;
Message-ID: <4ce0f52f-8a63-4d10-8cea-5c3b905477ec@xen.org>
Date: Fri, 1 Dec 2023 23:23:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
Content-Language: en-GB
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
 <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
 <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
 <536439989.51518893.1701471704571.JavaMail.zimbra@raptorengineeringinc.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <536439989.51518893.1701471704571.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2023 00:01, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Julien Grall" <julien@xen.org>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "Shawn Anastasio" <sanastasio@raptorengineering.com>, "xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
>> <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
>> "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Oleksii"
>> <oleksii.kurochko@gmail.com>
>> Sent: Friday, December 1, 2023 4:35:55 PM
>> Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
> 
>> Hi,
>>
>> On 01/12/2023 22:10, tpearson@raptorengineering.com wrote:
>>>> (+ Arm and RISC-V folks)
>>>>
>>>> Hi Shawn,
>>>>
>>>> On 01/12/2023 20:59, Shawn Anastasio wrote:
>>>>> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
>>>>> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
>>>>> multiboot) were excluded, reducing the overall footprint of code that
>>>>> was copied.
>>>>
>>>> I expect RISC-V to want similar code. I am not really thrilled in the
>>>> idea of having 3 similar copy of the parsing. So can we extract the
>>>> common bits (or harmonize it) so it can be shared?
>>>>
>>>> Maybe Oleksii has already a version doing that.
>>>
>>> Just my $0.02, but wouldn't it make more sense to have the RISC-V port
>>> handle the deduplication, seeing as the POWER support came first here?  We
>>> don't know if/when the RISC-V port will be ready for submission, so I'm
>>> not sure why we should be on the hook for this particular work.
>>
>> That would have been a valid point if you were writing a brand new
>> implementation. But this was *copied* from Arm.
>>
>> Looking at the diff between arm/bootfdt.c and ppc/bootfdt.c, you seem to
>> have:
>>     - As well copied some code from arm/setup.c
>>     - Re-order some statement (not clear why)
>>     - Remove some code which you say are Arm specific. Yet some is part
>> of the Device-Tree spec and I would expect to be used in the future.
>>
>> So my question here stands. Why are you mainly copying verbatimly the
>> Arm code rather than consolidating in one place?
> 
> That's fair, with the future RISC-V port removed from the discussion and good reasons still being put forth it makes more sense to deduplicate now.  Thank you for clarifying the objection! :)

I have had a brief look at the differences. I moved some of the 
functions to bootfdt.c in order to match PPC. Below the diff after that.

Leaving aside some of the clean-up, it sounds like you:
* removed BOOTMOD_{RAMDISK, XSM...}. So how do you plan to pass XSM blob 
and ramdisk in the future?
* split long prink-messages. For Xen, we keep them in one line even if 
it is over 80 characters to facilite grepping.
* Remove device_tree_node_is_available(), I believe you still need it 
because the property is not Arm specific.
* Remove process_multiboot(), how do you plan to handle dom0less domain 
in the future?
* Likewise for xen,static-mem and boot_fdt_cmdline()?
* fdt_get_mem_rsv_paddr(), this is part of the DT is used to reserve 
memory. This was superseed to /reserved-memory, but I wonder how 
widespread this is on PPC?
* You are removing the sorting of the memory bank. We had to do the 
sorting on Arm because some DT didn't have the banks sorted and this 
helped will the logic memory subystem logic. I can understand if you 
don't need it, but it would not hurt.
* If am not mistaken you are adding the Xen module as BOOTMOD_KERNEL, 
however this is meant to be used for the domain kernel. Xen should be 
BOOTMOD_XEN.

Overall, it feels to me that nearly (if not all) bootfdt.c can be moved 
to common (maybe under a new directory common/device-tree?) and #ifdef 
bits that are dom0less specific (we now have a Kconfig for that). You 
can do the clean-up as well, but they would belong to separate patches.

I hope that helps.

Cheers,

--- ../arm/bootfdt.c	2023-12-01 23:02:43.501050219 +0000
+++ bootfdt.c	2023-12-01 22:26:47.719734253 +0000
@@ -1,9 +1,12 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
  /*
- * Early Device Tree
+ * Early Device Tree and boot info bookkeeping.
+ * Derived from arch/arm/bootfdt.c and setup.c.
   *
   * Copyright (C) 2012-2014 Citrix Systems, Inc.
+ * Copyright (C) Raptor Engineering LLC
   */
+
  #include <xen/types.h>
  #include <xen/lib.h>
  #include <xen/kernel.h>
@@ -15,7 +18,8 @@
  #include <xen/sort.h>
  #include <xsm/xsm.h>
  #include <asm/setup.h>
-#include <asm/static-shmem.h>
+
+struct bootinfo __initdata bootinfo;

  struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                                            paddr_t start, paddr_t size,
@@ -62,10 +66,6 @@
      case BOOTMOD_XEN:     return "Xen";
      case BOOTMOD_FDT:     return "Device Tree";
      case BOOTMOD_KERNEL:  return "Kernel";
-    case BOOTMOD_RAMDISK: return "Ramdisk";
-    case BOOTMOD_XSM:     return "XSM";
-    case BOOTMOD_GUEST_DTB:     return "DTB";
-    case BOOTMOD_UNKNOWN: return "Unknown";
      default: BUG();
      }
  }
@@ -91,8 +91,9 @@
              continue;
          else
          {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, mod_start, mod_end);
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
+                   " mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", 
region_start,
+                   region_end, i, mod_start, mod_end);
              return true;
          }
      }
@@ -121,8 +122,9 @@
              continue;
          else
          {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, bank_start, bank_end);
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
+                   " bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", 
region_start,
+                   region_end, i, bank_start, bank_end);
              return true;
          }
      }
@@ -149,30 +151,6 @@
                                     region_start, region_size) )
          return true;

-#ifdef CONFIG_ACPI
-    /* Check if input region is overlapping with ACPI 
EfiACPIReclaimMemory */
-    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_size) )
-        return true;
-#endif
-
-    return false;
-}
-
-static bool __init device_tree_node_is_available(const void *fdt, int node)
-{
-    const char *status;
-    int len;
-
-    status = fdt_getprop(fdt, node, "status", &len);
-    if ( !status )
-        return true;
-
-    if ( len > 0 )
-    {
-        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
-            return true;
-    }
-
      return false;
  }

@@ -185,33 +163,14 @@
      name = fdt_get_name(fdt, node, NULL);
      match_len = strlen(match);

-    /* Match both "match" and "match@..." patterns but not
-       "match-foo". */
+    /*
+     * Match both "match" and "match@..." patterns but not
+     * "match-foo".
+     */
      return strncmp(name, match, match_len) == 0
          && (name[match_len] == '@' || name[match_len] == '\0');
  }

-static bool __init device_tree_node_compatible(const void *fdt, int node,
-                                               const char *match)
-{
-    int len, l;
-    const void *prop;
-
-    prop = fdt_getprop(fdt, node, "compatible", &len);
-    if ( prop == NULL )
-        return false;
-
-    while ( len > 0 ) {
-        if ( !dt_compat_cmp(prop, match) )
-            return true;
-        l = strlen(prop) + 1;
-        prop += l;
-        len -= l;
-    }
-
-    return false;
-}
-
  void __init device_tree_get_reg(const __be32 **cell, uint32_t 
address_cells,
                                  uint32_t size_cells, paddr_t *start,
                                  paddr_t *size)
@@ -247,19 +206,16 @@

  static int __init device_tree_get_meminfo(const void *fdt, int node,
                                            const char *prop_name,
-                                          u32 address_cells, u32 
size_cells,
+                                          uint32_t address_cells, 
uint32_t size_cells,
                                            void *data, enum 
membank_type type)
  {
      const struct fdt_property *prop;
      unsigned int i, banks;
      const __be32 *cell;
-    u32 reg_cells = address_cells + size_cells;
+    uint32_t reg_cells = address_cells + size_cells;
      paddr_t start, size;
      struct meminfo *mem = data;

-    if ( !device_tree_node_is_available(fdt, node) )
-        return 0;
-
      if ( address_cells < 1 || size_cells < 1 )
      {
          printk("fdt: property `%s': invalid #address-cells or 
#size-cells",
@@ -272,7 +228,7 @@
          return -ENOENT;

      cell = (const __be32 *)prop->data;
-    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof(uint32_t));

      for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
      {
@@ -298,13 +254,13 @@
      return 0;
  }

-u32 __init device_tree_get_u32(const void *fdt, int node,
-                               const char *prop_name, u32 dflt)
+uint32_t __init device_tree_get_uint32_t(const void *fdt, int node,
+                               const char *prop_name, uint32_t dflt)
  {
      const struct fdt_property *prop;

      prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(u32) )
+    if ( !prop || prop->len < sizeof(uint32_t) )
          return dflt;

      return fdt32_to_cpu(*(uint32_t*)prop->data);
@@ -332,13 +288,13 @@
       */
      int depth = 0;
      const int first_node = node;
-    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
-    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
+    uint32_t address_cells[DEVICE_TREE_MAX_DEPTH];
+    uint32_t size_cells[DEVICE_TREE_MAX_DEPTH];
      int ret;

      do {
          const char *name = fdt_get_name(fdt, node, NULL);
-        u32 as, ss;
+        uint32_t as, ss;

          if ( depth >= DEVICE_TREE_MAX_DEPTH )
          {
@@ -350,9 +306,9 @@
          as = depth > 0 ? address_cells[depth-1] : 
DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
          ss = depth > 0 ? size_cells[depth-1] : 
DT_ROOT_NODE_SIZE_CELLS_DEFAULT;

-        address_cells[depth] = device_tree_get_u32(fdt, node,
+        address_cells[depth] = device_tree_get_uint32_t(fdt, node,
                                                     "#address-cells", as);
-        size_cells[depth] = device_tree_get_u32(fdt, node,
+        size_cells[depth] = device_tree_get_uint32_t(fdt, node,
                                                  "#size-cells", ss);

          /* skip the first node */
@@ -371,7 +327,7 @@

  static int __init process_memory_node(const void *fdt, int node,
                                        const char *name, int depth,
-                                      u32 address_cells, u32 size_cells,
+                                      uint32_t address_cells, uint32_t 
size_cells,
                                        void *data)
  {
      return device_tree_get_meminfo(fdt, node, "reg", address_cells, 
size_cells,
@@ -380,13 +336,16 @@

  static int __init process_reserved_memory_node(const void *fdt, int node,
                                                 const char *name, int 
depth,
-                                               u32 address_cells,
-                                               u32 size_cells,
+                                               uint32_t address_cells,
+                                               uint32_t size_cells,
                                                 void *data)
  {
-    int rc = process_memory_node(fdt, node, name, depth, address_cells,
+    int rc;
+
+    rc = process_memory_node(fdt, node, name, depth, address_cells,
                                   size_cells, data);

+
      if ( rc == -ENOSPC )
          panic("Max number of supported reserved-memory regions 
reached.\n");
      else if ( rc != -ENOENT )
@@ -396,124 +355,28 @@

  static int __init process_reserved_memory(const void *fdt, int node,
                                            const char *name, int depth,
-                                          u32 address_cells, u32 
size_cells)
+                                          uint32_t address_cells, 
uint32_t size_cells)
  {
      return device_tree_for_each_node(fdt, node,
                                       process_reserved_memory_node,
                                       &bootinfo.reserved_mem);
  }

-static void __init process_multiboot_node(const void *fdt, int node,
-                                          const char *name,
-                                          u32 address_cells, u32 
size_cells)
-{
-    static int __initdata kind_guess = 0;
-    const struct fdt_property *prop;
-    const __be32 *cell;
-    bootmodule_kind kind;
-    paddr_t start, size;
-    int len;
-    /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
-    char path[92];
-    int parent_node, ret;
-    bool domU;
-
-    parent_node = fdt_parent_offset(fdt, node);
-    ASSERT(parent_node >= 0);
-
-    /* Check that the node is under "/chosen" (first 7 chars of path) */
-    ret = fdt_get_path(fdt, node, path, sizeof (path));
-    if ( ret != 0 || strncmp(path, "/chosen", 7) )
-        return;
-
-    prop = fdt_get_property(fdt, node, "reg", &len);
-    if ( !prop )
-        panic("node %s missing `reg' property\n", name);
-
-    if ( len < dt_cells_to_size(address_cells + size_cells) )
-        panic("fdt: node `%s': `reg` property length is too short\n",
-                    name);
-
-    cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-
-    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
-         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
-        kind = BOOTMOD_KERNEL;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") 
== 0 ||
-              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") 
== 0 )
-        kind = BOOTMOD_RAMDISK;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
-    else if ( fdt_node_check_compatible(fdt, node, 
"multiboot,device-tree") == 0 )
-        kind = BOOTMOD_GUEST_DTB;
-    else
-        kind = BOOTMOD_UNKNOWN;
-
-    /**
-     * Guess the kind of these first two unknowns respectively:
-     * (1) The first unknown must be kernel.
-     * (2) Detect the XSM Magic from the 2nd unknown:
-     *     a. If it's XSM, set the kind as XSM, and that also means we
-     *     won't load ramdisk;
-     *     b. if it's not XSM, set the kind as ramdisk.
-     *     So if user want to load ramdisk, it must be the 2nd unknown.
-     * We also detect the XSM Magic for the following unknowns,
-     * then set its kind according to the return value of has_xsm_magic.
-     */
-    if ( kind == BOOTMOD_UNKNOWN )
-    {
-        switch ( kind_guess++ )
-        {
-        case 0: kind = BOOTMOD_KERNEL; break;
-        case 1: kind = BOOTMOD_RAMDISK; break;
-        default: break;
-        }
-        if ( kind_guess > 1 && has_xsm_magic(start) )
-            kind = BOOTMOD_XSM;
-    }
-
-    domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
-    add_boot_module(kind, start, size, domU);
-
-    prop = fdt_get_property(fdt, node, "bootargs", &len);
-    if ( !prop )
-        return;
-    add_boot_cmdline(fdt_get_name(fdt, parent_node, &len), prop->data,
-                     kind, start, domU);
-}
-
  static int __init process_chosen_node(const void *fdt, int node,
                                        const char *name,
-                                      u32 address_cells, u32 size_cells)
+                                      uint32_t address_cells, uint32_t 
size_cells)
  {
      const struct fdt_property *prop;
      paddr_t start, end;
      int len;

-    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
-    {
-        int rc;
-
-        printk("Checking for static heap in /chosen\n");
-
-        rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
-                                     address_cells, size_cells,
-                                     &bootinfo.reserved_mem,
-                                     MEMBANK_STATIC_HEAP);
-        if ( rc )
-            return rc;
-
-        bootinfo.static_heap = true;
-    }
-
      printk("Checking for initrd in /chosen\n");

      prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
      if ( !prop )
          /* No initrd present. */
          return 0;
-    if ( len != sizeof(u32) && len != sizeof(u64) )
+    if ( len != sizeof(uint32_t) && len != sizeof(uint64_t) )
      {
          printk("linux,initrd-start property has invalid length %d\n", 
len);
          return -EINVAL;
@@ -526,7 +389,7 @@
          printk("linux,initrd-end not present but -start was\n");
          return -EINVAL;
      }
-    if ( len != sizeof(u32) && len != sizeof(u64) )
+    if ( len != sizeof(uint32_t) && len != sizeof(uint64_t) )
      {
          printk("linux,initrd-end property has invalid length %d\n", len);
          return -EINVAL;
@@ -547,51 +410,21 @@
      return 0;
  }

-static int __init process_domain_node(const void *fdt, int node,
-                                      const char *name,
-                                      u32 address_cells, u32 size_cells)
-{
-    const struct fdt_property *prop;
-
-    printk("Checking for \"xen,static-mem\" in domain node\n");
-
-    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
-    if ( !prop )
-        /* No "xen,static-mem" present. */
-        return 0;
-
-    return device_tree_get_meminfo(fdt, node, "xen,static-mem", 
address_cells,
-                                   size_cells, &bootinfo.reserved_mem,
-                                   MEMBANK_STATIC_DOMAIN);
-}
-
  static int __init early_scan_node(const void *fdt,
                                    int node, const char *name, int depth,
-                                  u32 address_cells, u32 size_cells,
+                                  uint32_t address_cells, uint32_t 
size_cells,
                                    void *data)
  {
      int rc = 0;

-    /*
-     * If Xen has been booted via UEFI, the memory banks are
-     * populated. So we should skip the parsing.
-     */
-    if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_node_matches(fdt, node, "memory") )
+    if( device_tree_node_matches(fdt, node, "memory") )
          rc = process_memory_node(fdt, node, name, depth,
                                   address_cells, size_cells, 
&bootinfo.mem);
      else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
          rc = process_reserved_memory(fdt, node, name, depth,
                                       address_cells, size_cells);
-    else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, 
"xen,multiboot-module" ) ||
-              device_tree_node_compatible(fdt, node, "multiboot,module" )))
-        process_multiboot_node(fdt, node, name, address_cells, size_cells);
      else if ( depth == 1 && device_tree_node_matches(fdt, node, 
"chosen") )
          rc = process_chosen_node(fdt, node, name, address_cells, 
size_cells);
-    else if ( depth == 2 && device_tree_node_compatible(fdt, node, 
"xen,domain") )
-        rc = process_domain_node(fdt, node, name, address_cells, 
size_cells);
-    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, 
"xen,domain-shared-memory-v1") )
-        rc = process_shm_node(fdt, node, address_cells, size_cells);

      if ( rc < 0 )
          printk("fdt: node `%s': parsing failed\n", name);
@@ -604,7 +437,7 @@
      struct meminfo *mem_resv = &bootinfo.reserved_mem;
      struct bootmodules *mods = &bootinfo.modules;
      struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i, j, nr_rsvd;
+    unsigned int i, j;

      for ( i = 0; i < mi->nr_banks; i++ )
          printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
@@ -618,21 +451,9 @@
                  mods->module[i].start + mods->module[i].size,
                  boot_module_kind_as_string(mods->module[i].kind));

-    nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
-    for ( i = 0; i < nr_rsvd; i++ )
-    {
-        paddr_t s, e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
-            continue;
-
-        /* fdt_get_mem_rsv_paddr returns length */
-        e += s;
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
-    }
      for ( j = 0; j < mem_resv->nr_banks; j++, i++ )
      {
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
+        printk(" RESVD_[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
                 mem_resv->bank[j].start,
                 mem_resv->bank[j].start + mem_resv->bank[j].size - 1);
      }
@@ -644,89 +465,43 @@
      printk("\n");
  }

-/* This function assumes that memory regions are not overlapped */
-static int __init cmp_memory_node(const void *key, const void *elem)
-{
-    const struct membank *handler0 = key;
-    const struct membank *handler1 = elem;
-
-    if ( handler0->start < handler1->start )
-        return -1;
-
-    if ( handler0->start >= (handler1->start + handler1->size) )
-        return 1;
-
-    return 0;
-}
-
-static void __init swap_memory_node(void *_a, void *_b, size_t size)
-{
-    struct membank *a = _a, *b = _b;
-
-    SWAP(*a, *b);
-}
-
  /**
- * boot_fdt_info - initialize bootinfo from a DTB
+ * boot_fdt_init - initialize bootinfo from a DTB
   * @fdt: flattened device tree binary
+ * @paddr: physical address of device tree binary
   *
   * Returns the size of the DTB.
   */
-size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
+size_t __init boot_fdt_init(const void *fdt, paddr_t paddr)
  {
      int ret;
+    paddr_t xen_start, xen_end;

      ret = fdt_check_header(fdt);
      if ( ret < 0 )
          panic("No valid device tree\n");

-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
      device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);

      /*
-     * On Arm64 setup_directmap_mappings() expects to be called with 
the lowest
-     * bank in memory first. There is no requirement that the DT will 
provide
-     * the banks sorted in ascending order. So sort them through.
+     * The device tree passed to us may have been allocated by skiboot, 
in which
+     * case it will exist within a reserved region and this call will 
fail. This
+     * is fine, however, since either way the allocator will know not 
to step on
+     * the device tree.
       */
-    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
-         cmp_memory_node, swap_memory_node);
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
+    /*
+     * Xen relocates itself at the ppc64 entrypoint, so we need to 
manually mark
+     * the kernel module.
+     */
+    xen_start = __pa(_start);
+    xen_end = PAGE_ALIGN(__pa(_end));
+    if ( !add_boot_module(BOOTMOD_KERNEL, xen_start, xen_end, false) )
+        panic("Xen overlaps reserved memory! %016lx - %016lx\n", xen_start,
+              xen_end);

      early_print_info();

      return fdt_totalsize(fdt);
  }
-
-const __init char *boot_fdt_cmdline(const void *fdt)
-{
-    int node;
-    const struct fdt_property *prop;
-
-    node = fdt_path_offset(fdt, "/chosen");
-    if ( node < 0 )
-        return NULL;
-
-    prop = fdt_get_property(fdt, node, "xen,xen-bootargs", NULL);
-    if ( prop == NULL )
-    {
-        struct bootcmdline *dom0_cmdline =
-            boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
-
-        if (fdt_get_property(fdt, node, "xen,dom0-bootargs", NULL) ||
-            ( dom0_cmdline && dom0_cmdline->cmdline[0] ) )
-            prop = fdt_get_property(fdt, node, "bootargs", NULL);
-    }
-    if ( prop == NULL )
-        return NULL;
-
-    return prop->data;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */


-- 
Julien Grall

