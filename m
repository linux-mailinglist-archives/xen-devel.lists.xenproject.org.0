Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2F81A3D5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 17:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658161.1027228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFz6z-0004eT-12; Wed, 20 Dec 2023 16:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658161.1027228; Wed, 20 Dec 2023 16:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFz6y-0004bg-Sn; Wed, 20 Dec 2023 16:07:56 +0000
Received: by outflank-mailman (input) for mailman id 658161;
 Wed, 20 Dec 2023 16:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFz6x-0004ba-3B
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 16:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFz6w-0000iq-DB; Wed, 20 Dec 2023 16:07:54 +0000
Received: from [15.248.2.151] (helo=[10.6.7.47])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFz6w-0006ML-82; Wed, 20 Dec 2023 16:07:54 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=i3wVNUzf1rd44mcYJMoLBI7/NCh85R3azBOPnPfADfw=; b=rIyvlGkhnRPndSLnBr2jV706iK
	SbrUL+9TxmhKZAFnREzCHteeoQty5BJMTfFijgc7jofhXZ/5RZE2tdkN8HoCjI/AnrcAT2Sh8pn0U
	ZaaED5zFlz0acf043erjB74kY2wp0quIC72Prz6XqIoQobF1mREjCrnm9KMlIeRSZPoE=;
Message-ID: <3962d466-b249-45e4-849f-40795c04333f@xen.org>
Date: Wed, 20 Dec 2023 16:07:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
 <4d5ebc23-f7f8-411f-8458-762a09bdf702@xen.org>
In-Reply-To: <4d5ebc23-f7f8-411f-8458-762a09bdf702@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Shawn,

On 20/12/2023 13:23, Julien Grall wrote:
> Hi,
> 
> On 15/12/2023 02:44, Shawn Anastasio wrote:
>> Move PPC off the asm-generic setup.h and enable usage of bootfdt for
>> populating the boot info struct from the firmware-provided device tree.
>> Also enable the Xen boot page allocator.
>>
>> Includes minor changes to bootfdt.c's boot_fdt_info() to tolerate the
>> scenario in which the FDT overlaps a reserved memory region, as is the
>> case on PPC when booted directly from skiboot. Also includes a minor
>> change to record Xen's correct position on PPC where Xen relocates
>> itself to at the entrypoint.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   xen/arch/ppc/include/asm/Makefile |   1 -
>>   xen/arch/ppc/include/asm/setup.h  | 123 +++++++++++++
>>   xen/arch/ppc/setup.c              | 289 +++++++++++++++++++++++++++++-
> 
> I might be missing something. But isn't most of the code you add is the 
> same as Arm? And if so, shouldn't this be consolidated?

So I have create a new file and move the PPC functions I think should be 
the same. Then I replace with the Arm code. Below the diff.

Looking through it, I can't see why the code cannot be shared in except 
part of populate_boot_allocator() (which could be split).

I forsee that some of the code you remove will be necessary (e.g. 
BOOTMOD_RAMDISK, BOOTMOD_XSM). And some of the style change doesn't 
match what we do in Xen (messages are not split).

If there are common bits with other architectures, then I would really 
like if they are shared rather than duplicated. I am more than happy to 
help finding a good split because it will reduce maintenance effort for 
everyone in the longer run.

Cheers,

diff --git a/xen/common/device-tree/setup.c b/xen/common/device-tree/setup.c
index 3f79b97e9036..9c376527d11b 100644
--- a/xen/common/device-tree/setup.c
+++ b/xen/common/device-tree/setup.c
@@ -70,6 +70,10 @@ const char * __init 
boot_module_kind_as_string(bootmodule_kind kind)
      case BOOTMOD_XEN:     return "Xen";
      case BOOTMOD_FDT:     return "Device Tree";
      case BOOTMOD_KERNEL:  return "Kernel";
+    case BOOTMOD_RAMDISK: return "Ramdisk";
+    case BOOTMOD_XSM:     return "XSM";
+    case BOOTMOD_GUEST_DTB:     return "DTB";
+    case BOOTMOD_UNKNOWN: return "Unknown";
      default: BUG();
      }
  }
@@ -95,9 +99,8 @@ static bool __init bootmodules_overlap_check(struct 
bootmodules *bootmodules,
              continue;
          else
          {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
-                   " mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", 
region_start,
-                   region_end, i, mod_start, mod_end);
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, mod_start, mod_end);
              return true;
          }
      }
@@ -126,9 +129,8 @@ static bool __init meminfo_overlap_check(struct 
meminfo *meminfo,
              continue;
          else
          {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
-                   " bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", 
region_start,
-                   region_end, i, bank_start, bank_end);
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping 
with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, bank_start, bank_end);
              return true;
          }
      }
@@ -155,6 +157,12 @@ bool __init check_reserved_regions_overlap(paddr_t 
region_start,
                                     region_start, region_size) )
          return true;

+#ifdef CONFIG_ACPI
+    /* Check if input region is overlapping with ACPI 
EfiACPIReclaimMemory */
+    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_size) )
+        return true;
+#endif
+
      return false;
  }

@@ -196,12 +204,47 @@ static void __init dt_unreserved_regions(paddr_t 
s, paddr_t e,
                                           void (*cb)(paddr_t ps, 
paddr_t pe),
                                           unsigned int first)
  {
-    unsigned int i;
+    unsigned int i, nr;
+    int rc;
+
+    rc = fdt_num_mem_rsv(device_tree_flattened);
+    if ( rc < 0 )
+        panic("Unable to retrieve the number of reserved regions 
(rc=%d)\n",
+              rc);

-    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+    nr = rc;
+
+    for ( i = first; i < nr ; i++ )
      {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i].size;
+        paddr_t r_s, r_e;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e 
) < 0 )
+            /* If we can't read it, pretend it doesn't exist... */
+            continue;
+
+        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i+1);
+            dt_unreserved_regions(s, r_s, cb, i+1);
+            return;
+        }
+    }
+
+    /*
+     * i is the current bootmodule we are evaluating across all possible
+     * kinds.
+     *
+     * When retrieving the corresponding reserved-memory addresses
+     * below, we need to index the bootinfo.reserved_mem bank starting
+     * from 0, and only counting the reserved-memory modules. Hence,
+     * we need to use i - nr.
+     */
+    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;

          if ( s < r_e && r_s < e )
          {
@@ -214,6 +257,16 @@ static void __init dt_unreserved_regions(paddr_t s, 
paddr_t e,
      cb(s, e);
  }

+void __init fw_unreserved_regions(paddr_t s, paddr_t e,
+                                  void (*cb)(paddr_t ps, paddr_t pe),
+                                  unsigned int first)
+{
+    if ( acpi_disabled )
+        dt_unreserved_regions(s, e, cb, first);
+    else
+        cb(s, e);
+}
+
  /*
   * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
   * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
@@ -235,18 +288,47 @@ struct bootcmdline * __init 
boot_cmdline_find_by_kind(bootmodule_kind kind)
  }

  /*
- * Populate the boot allocator. Based on arch/arm/setup.c's
- * populate_boot_allocator.
- * All RAM but the following regions will be added to the boot allocator:
+ * Populate the boot allocator.
+ * If a static heap was not provided by the admin, all the RAM but the
+ * following regions will be added:
   *  - Modules (e.g., Xen, Kernel)
   *  - Reserved regions
+ *  - Xenheap (arm32 only)
+ * If a static heap was provided by the admin, populate the boot
+ * allocator with the corresponding regions only, but with Xenheap excluded
+ * on arm32.
   */
-static void __init populate_boot_allocator(void)
+void __init populate_boot_allocator(void)
  {
      unsigned int i;
      const struct meminfo *banks = &bootinfo.mem;
      paddr_t s, e;

+    if ( bootinfo.static_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type != 
MEMBANK_STATIC_HEAP )
+                continue;
+
+            s = bootinfo.reserved_mem.bank[i].start;
+            e = s + bootinfo.reserved_mem.bank[i].size;
+#ifdef CONFIG_ARM_32
+            /* Avoid the xenheap, note that the xenheap cannot across a 
bank */
+            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
+                 e >= mfn_to_maddr(directmap_mfn_end) )
+            {
+                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
+                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
+            }
+            else
+#endif
+                init_boot_pages(s, e);
+        }
+
+        return;
+    }
+
      for ( i = 0; i < banks->nr_banks; i++ )
      {
          const struct membank *bank = &banks->bank[i];
@@ -269,11 +351,18 @@ static void __init populate_boot_allocator(void)
              if ( e > bank_end )
                  e = bank_end;

-            dt_unreserved_regions(s, e, init_boot_pages, 0);
-
+#ifdef CONFIG_ARM_32
+            /* Avoid the xenheap */
+            if ( s < mfn_to_maddr(directmap_mfn_end) &&
+                 mfn_to_maddr(directmap_mfn_start) < e )
+            {
+                e = mfn_to_maddr(directmap_mfn_start);
+                n = mfn_to_maddr(directmap_mfn_end);
+            }
+#endif
+
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
              s = n;
          }
      }
  }
-
-


> 
> I would also expect RISC-V to need the same.
> 
> Cheers,
> 

-- 
Julien Grall

