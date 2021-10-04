Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B430D420AA1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 14:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201413.355905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMll-0002J0-O5; Mon, 04 Oct 2021 12:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201413.355905; Mon, 04 Oct 2021 12:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMll-0002G0-Jj; Mon, 04 Oct 2021 12:08:33 +0000
Received: by outflank-mailman (input) for mailman id 201413;
 Mon, 04 Oct 2021 12:08:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61te=OY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mXMlj-0002E4-VW
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 12:08:32 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24f4cb74-99fd-41c8-ab81-0ff4b6c7b14b;
 Mon, 04 Oct 2021 12:08:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i24so22146933lfj.13
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 05:08:29 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y11sm1589986ljn.138.2021.10.04.05.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 05:08:24 -0700 (PDT)
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
X-Inumbo-ID: 24f4cb74-99fd-41c8-ab81-0ff4b6c7b14b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vYA2zzrCCOf293yZPTn09v4CFZYyOayDZz1LTSvf8VE=;
        b=S9f6LfDF3zdZCstfgNEW569lzCzz5LcWSGNrwM7L/E3HZ6a4+2ouww+FqdRq3uNxcg
         Uqs9WOuptL9fmgwYQ1RQNOucU1Ddn71Kt1Yz1iO/PQC7EpR6d8QnRVYa8+2SYvvQmLpf
         JHqUzazBDtwVsR4opVsQw28nHy2Rhkl60rzaSYmu6ljuwLAzbJOddpWXN3YgSafCeeZH
         UlFvxTEKVNZ591ur+N+0VTfYW5jQ0q+JBnIJEkUB58wujM5mhSYBPI1qS1wBXUg9cGyE
         CjfrQDeW5fHFFHbVirQICSIYoK0PHlfA2pB4YiO/iZzdTHxPBr9loPnB/2Gc2CB45lAU
         u9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vYA2zzrCCOf293yZPTn09v4CFZYyOayDZz1LTSvf8VE=;
        b=uJd5aYbN5J/ETzLoT1olf3l7s6/vC5QBRIibYqpAA56CvHSYk8Tv3k/93Tb/TMsPyH
         K6AoiJyiKt9WOXFpM6A0VYWZBgltpEbJsLYYsFOskS2xMKrQp7CR2bLOwytj7udpBbPf
         S54KcXUKiphnOByOQQEeq27OL1QKU33/Otk2eRanleh1G/wrTl5n2juRrZdCBEtw0v+F
         inx/MiBIk4H515xhAGawOm/L8rhLcrLGHw+MLSCJFVCxIHOcJ2XnXK1Tp4wwsq9Umcts
         WP2BqwvR4oHfWI7TvfOPIe96JYsScc+b72FI8X5ODubCUcYIF0TV2BLoQZ6O92IgDpZU
         E2rQ==
X-Gm-Message-State: AOAM532lAouKyBUxCw9U+Ikb0f994WdnP2/Nbd6+4jdqh8djO924AURP
	L73xbuZUOeNSttPqzgXEjZY=
X-Google-Smtp-Source: ABdhPJxBqqjlvlI4/LORc5JeNdERztQ6JNvixI+BWhb7j8bPeD0Na5zThQDMnpNV3BTixvHtTLVHCA==
X-Received: by 2002:a2e:974b:: with SMTP id f11mr15259025ljj.385.1633349305244;
        Mon, 04 Oct 2021 05:08:25 -0700 (PDT)
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
 <8318a7b0-80fa-ccd6-75c5-c3135b82235d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <20f00d52-76c8-2afe-6544-6f1396e121e9@gmail.com>
Date: Mon, 4 Oct 2021 15:08:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8318a7b0-80fa-ccd6-75c5-c3135b82235d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 04.10.21 09:59, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> I saw Stefano committed this patch on Friday. However, I didn't have a 
> chance go to through a second time and would like to request some 
> follow-up changes.

ok, do you prefer the follow-up patch to be pushed separately or within 
the rest patches of this series (#1 and #3)?  If the former, I will try 
to push it today to close this question.


>
>
> On 30/09/2021 00:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen at the domain creation time and
>> advertised to it via "reg" property under hypervisor node in
>> the guest device-tree. As region 0 is reserved for grant table
>> space (always present), the indexes for extended regions are 1...N.
>> If extended regions could not be allocated for some reason,
>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>
>> Please note the following limitations:
>> - The extended region feature is only supported for 64-bit domain
>>    currently.
>> - The ACPI case is not covered.
>>
>> ***
>>
>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
>> the algorithm to choose extended regions for it is different
>> in comparison with the algorithm for non-direct mapped DomU.
>> What is more, that extended regions should be chosen differently
>> whether IOMMU is enabled or not.
>>
>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
>> holes found in host device-tree if otherwise. Make sure that
>> extended regions are 2MB-aligned and located within maximum possible
>> addressable physical memory range. The minimum size of extended
>> region is 64MB. 
>
> You explained below why the 128 limits, but I don't see any 
> explanation on why 2MB and 64MB.
>
> IIRC, 2MB was to potentally allow superpage mapping. I am not entirely 
> sure for 64MB.
>
> Could you add an in-code comment explaining the two limits?

Yes. There was a discussion at [1]. 64MB was chosen as a reasonable 
value to deal with between initial 2MB (we might end up having a lot of 
small ranges which are not quite useful but increase bookkeeping) and 
suggested 1GB (we might not be able find a suitable regions at all).


>
>
>> The maximum number of extended regions is 128,
>> which is an artificial limit to minimize code changes (we reuse
>> struct meminfo to describe extended regions, so there are an array
>> field for 128 elements).
>>
>> It worth mentioning that unallocated memory solution (when the IOMMU
>> is disabled) will work safely until Dom0 is able to allocate memory
>> outside of the original range.
>>
>> Also introduce command line option to be able to globally enable or
>> disable support for extended regions for Dom0 (enabled by default).
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Please note, we need to decide which approach to use in 
>> find_unallocated_memory(),
>> you can find details at:
>> https://lore.kernel.org/xen-devel/28503e09-44c3-f623-bb8d-8778bb94225f@gmail.com/ 
>>
>>
>> Changes RFC -> V2:
>>     - update patch description
>>     - drop uneeded "extended-region" DT property
>>
>> Changes V2 -> V3:
>>     - update patch description
>>     - add comment for "size" calculation in add_ext_regions()
>>     - clarify "end" calculation in find_unallocated_memory() and
>>       find_memory_holes()
>>     - only pick up regions with size >= 64MB
>>     - allocate reg dynamically instead of keeping on the stack in
>>       make_hypervisor_node()
>>     - do not show warning for 32-bit domain
>>     - drop Linux specific limits EXT_REGION_*
>>     - also cover "ranges" property in find_memory_holes()
>>     - add command line arg to enable/disable extended region support
>>
>> Changes V3 -> V4:
>>    - update opt_ext_regions purpose and comment in code
>>    - reorganize make_hypervisor_node() to move allocations after initial
>>      checks, allocate only required amount of elements instead of 
>> maximum
>>      possible
>> ---
>>   docs/misc/xen-command-line.pandoc |  11 ++
>>   xen/arch/arm/domain_build.c       | 286 
>> +++++++++++++++++++++++++++++++++++++-
>
> The document in docs/misc/arm/device-tree/guest.txt needs to be 
> updated to reflect the change in the binding.

Good point. Will update.


>
>>   2 files changed, 294 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc 
>> b/docs/misc/xen-command-line.pandoc
>> index 177e656..5cae4ad 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1081,6 +1081,17 @@ hardware domain is architecture dependent.
>>   Note that specifying zero as domU value means zero, while for dom0 
>> it means
>>   to use the default.
>>   +### ext_regions (Arm)
>> +> `= <boolean>`
>> +
>> +> Default : `true`
>> +
>> +Flag to enable or disable support for extended regions for Dom0.
>> +
>> +Extended regions are ranges of unused address space exposed to Dom0 as
>> +"safe to use" for special memory mappings. Disable if your board device
>> +tree is incomplete.
>> +
>>   ### flask
>>   > `= permissive | enforcing | late | disabled`
>>   diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index d233d63..c5afbe2 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -34,6 +34,10 @@
>>   static unsigned int __initdata opt_dom0_max_vcpus;
>>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>>   +/* If true, the extended regions support is enabled for dom0 */
>> +static bool __initdata opt_ext_regions = true;
>> +boolean_param("ext_regions", opt_ext_regions);
>> +
>>   static u64 __initdata dom0_mem;
>>   static bool __initdata dom0_mem_set;
>>   @@ -886,6 +890,232 @@ static int __init make_memory_node(const 
>> struct domain *d,
>>       return res;
>>   }
>>   +static int __init add_ext_regions(unsigned long s, unsigned long 
>> e, void *data)
>> +{
>> +    struct meminfo *ext_regions = data;
>> +    paddr_t start, size;
>> +
>> +    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
>> +        return 0;
>> +
>> +    /* Both start and size of the extended region should be 2MB 
>> aligned */
>> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
>> +    if ( start > e )
>> +        return 0;
>> +
>> +    /*
>> +     * e is actually "end-1" because it is called by rangeset functions
>> +     * which are inclusive of the last address.
>> +     */
>> +    e += 1;
>> +    size = (e - start) & ~(SZ_2M - 1);
>> +    if ( size < MB(64) )
>> +        return 0;
>> +
>> +    ext_regions->bank[ext_regions->nr_banks].start = start;
>> +    ext_regions->bank[ext_regions->nr_banks].size = size;
>> +    ext_regions->nr_banks++;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init find_unallocated_memory(const struct kernel_info 
>> *kinfo,
>> +                                          struct meminfo *ext_regions)
>
> It would be good to have a comment on top of this function summarizing 
> how this is meant to work.

Will add.


>
>
>> +{
>> +    const struct meminfo *assign_mem = &kinfo->mem;
>> +    struct rangeset *unalloc_mem;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>> +
>> +    dt_dprintk("Find unallocated memory for extended regions\n");
>> +
>> +    unalloc_mem = rangeset_new(NULL, NULL, 0);
>> +    if ( !unalloc_mem )
>> +        return -ENOMEM;
>> +
>> +    /* Start with all available RAM */
>> +    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.mem.bank[i].start;
>> +        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
>> +        res = rangeset_add_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to add: 
>> %#"PRIx64"->%#"PRIx64"\n",
>
> start and end are paddr_t. So you want to use PRIpaddr rather than PRIx64.

ok for this and the similar comments below.


>
>
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove RAM assigned to Dom0 */
>> +    for ( i = 0; i < assign_mem->nr_banks; i++ )
>> +    {
>> +        start = assign_mem->bank[i].start;
>> +        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
>> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>
> Ditto.
>
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove reserved-memory regions */
>> +    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>> +    {
>> +        start = bootinfo.reserved_mem.bank[i].start;
>> +        end = bootinfo.reserved_mem.bank[i].start +
>> +            bootinfo.reserved_mem.bank[i].size;
>> +        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>
> Ditto.
>
>> +                   start, end);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /* Remove grant table region */
>> +    start = kinfo->gnttab_start;
>> +    end = kinfo->gnttab_start + kinfo->gnttab_size;
>> +    res = rangeset_remove_range(unalloc_mem, start, end - 1);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>
> ditto.
>
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_report_ranges(unalloc_mem, start, end,
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(unalloc_mem);
>> +
>> +    return res;
>> +}
>> +
>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>> +                                    struct meminfo *ext_regions)
>
> I think it would be good to have a comment on top of the function how 
> this is meant to work.

Will add.


>
>
>> +{
>> +    struct dt_device_node *np;
>> +    struct rangeset *mem_holes;
>> +    paddr_t start, end;
>> +    unsigned int i;
>> +    int res;
>> +
>> +    dt_dprintk("Find memory holes for extended regions\n");
>> +
>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>> +    if ( !mem_holes )
>> +        return -ENOMEM;
>> +
>> +    /* Start with maximum possible addressable physical memory range */
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_add_range(mem_holes, start, end);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>
> Please use PRIpaddr.
>
>> +               start, end);
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * Remove regions described by "reg" and "ranges" properties where
>> +     * the memory is addressable (MMIO, RAM, PCI BAR, etc).
>> +     */
>> +    dt_for_each_device_node( dt_host, np )
>> +    {
>> +        unsigned int naddr;
>> +        u64 addr, size;
>> +
>> +        naddr = dt_number_of_address(np);
>> +
>> +        for ( i = 0; i < naddr; i++ )
>> +        {
>> +            res = dt_device_get_address(np, i, &addr, &size);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Unable to retrieve address %u for 
>> %s\n",
>> +                       i, dt_node_full_name(np));
>> +                goto out;
>> +            }
>> +
>> +            start = addr & PAGE_MASK;
>> +            end = PAGE_ALIGN(addr + size);
>> +            res = rangeset_remove_range(mem_holes, start, end - 1);
>> +            if ( res )
>> +            {
>> +                printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>> +                       start, end);
>> +                goto out;
>> +            }
>> +        }
>> +
>> +        if ( dt_device_type_is_equal(np, "pci" ) )
>> +        {
>
> The code below looks like an open-coding version of 
> dt_for_each_range(). Can you try to re-use it please? This will help 
> to reduce the complexity of this function.

You are right, it makes sense, will definitely reuse. If I was aware of 
that function before I would safe some time I spent on the investigation 
how to parse that)


diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ef2a177..8820b9c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1003,6 +1003,26 @@ out:
      return res;
  }

+static int __init handle_pci_range(const struct dt_device_node *dev,
+                                   u64 addr, u64 len, void *data)
+{
+    struct rangeset *mem_holes = data;
+    paddr_t start, end;
+    int res;
+
+    start = addr & PAGE_MASK;
+    end = PAGE_ALIGN(addr + len);
+    res = rangeset_remove_range(mem_holes, start, end - 1);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+               start, end);
+        return res;
+    }
+
+    return 0;
+}
+
  static int __init find_memory_holes(const struct kernel_info *kinfo,
                                      struct meminfo *ext_regions)
  {
@@ -1061,43 +1081,19 @@ static int __init find_memory_holes(const struct 
kernel_info *kinfo,
              }
          }

-        if ( dt_device_type_is_equal(np, "pci" ) )
+        if ( dt_device_type_is_equal(np, "pci") )
          {
-            unsigned int range_size, nr_ranges;
-            int na, ns, pna;
-            const __be32 *ranges;
-            u32 len;
-
              /*
-             * Looking for non-empty ranges property which in this context
-             * describes the PCI host bridge aperture.
+             * The ranges property in this context describes the PCI host
+             * bridge aperture. It shall be absent if no addresses are 
mapped
+             * through the bridge.
               */
-            ranges = dt_get_property(np, "ranges", &len);
-            if ( !ranges || !len )
+            if ( !dt_get_property(np, "ranges", NULL) )
                  continue;

-            pna = dt_n_addr_cells(np);
-            na = dt_child_n_addr_cells(np);
-            ns = dt_child_n_size_cells(np);
-            range_size = pna + na + ns;
-            nr_ranges = len / sizeof(__be32) / range_size;
-
-            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
-            {
-                /* Skip the child address and get the parent (CPU) 
address */
-                addr = dt_read_number(ranges + na, pna);
-                size = dt_read_number(ranges + na + pna, ns);
-
-                start = addr & PAGE_MASK;
-                end = PAGE_ALIGN(addr + size);
-                res = rangeset_remove_range(mem_holes, start, end - 1);
-                if ( res )
-                {
-                    printk(XENLOG_ERR "Failed to remove: 
%#"PRIx64"->%#"PRIx64"\n",
-                           start, end);
-                    goto out;
-                }
-            }
+            res = dt_for_each_range(np, &handle_pci_range, mem_holes);
+            if ( res )
+                goto out;
          }
      }

(END)


>
>
>> +            unsigned int range_size, nr_ranges;
>> +            int na, ns, pna;
>> +            const __be32 *ranges;
>> +            u32 len;
>> +
>> +            /*
>> +             * Looking for non-empty ranges property which in this 
>> context
>> +             * describes the PCI host bridge aperture.
>> +             */
>> +            ranges = dt_get_property(np, "ranges", &len);
>> +            if ( !ranges || !len )
>> +                continue;
>> +
>> +            pna = dt_n_addr_cells(np);
>> +            na = dt_child_n_addr_cells(np);
>> +            ns = dt_child_n_size_cells(np);
>> +            range_size = pna + na + ns;
>> +            nr_ranges = len / sizeof(__be32) / range_size;
>> +
>> +            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
>> +            {
>> +                /* Skip the child address and get the parent (CPU) 
>> address */
>> +                addr = dt_read_number(ranges + na, pna);
>> +                size = dt_read_number(ranges + na + pna, ns);
>> +
>> +                start = addr & PAGE_MASK;
>> +                end = PAGE_ALIGN(addr + size);
>> +                res = rangeset_remove_range(mem_holes, start, end - 1);
>> +                if ( res )
>> +                {
>> +                    printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIx64"->%#"PRIx64"\n",
>
> This should be PRIpaddr.
>
>> +                           start, end);
>> +                    goto out;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    start = 0;
>> +    end = (1ULL << p2m_ipa_bits) - 1;
>> +    res = rangeset_report_ranges(mem_holes, start, end,
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks = 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res = -ENOENT;
>> +
>> +out:
>> +    rangeset_destroy(mem_holes);
>> +
>> +    return res;
>> +}
>> +
>>   static int __init make_hypervisor_node(struct domain *d,
>>                                          const struct kernel_info 
>> *kinfo,
>>                                          int addrcells, int sizecells)
>> @@ -893,11 +1123,12 @@ static int __init make_hypervisor_node(struct 
>> domain *d,
>>       const char compat[] =
>> "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
>>           "xen,xen";
>> -    __be32 reg[4];
>> +    __be32 *reg, *cells;
>>       gic_interrupt_t intr;
>> -    __be32 *cells;
>>       int res;
>>       void *fdt = kinfo->fdt;
>> +    struct meminfo *ext_regions = NULL;
>> +    unsigned int i, nr_ext_regions;
>>         dt_dprintk("Create hypervisor node\n");
>>   @@ -919,12 +1150,61 @@ static int __init 
>> make_hypervisor_node(struct domain *d,
>>       if ( res )
>>           return res;
>>   +    if ( !opt_ext_regions )
>> +    {
>> +        printk(XENLOG_DEBUG "The extended regions support is 
>> disabled\n");
>
> The extended regions is going to be critical for the performance in 
> dom0. So I think this at least want to be a XENLOG_INFO.

ok


>
>
>> +        nr_ext_regions = 0;
>> +    }
>> +    else if ( is_32bit_domain(d) )
>> +    {
>> +        printk(XENLOG_DEBUG "The extended regions are only supported 
>> for 64-bit guest currently\n");
>
> This would want to be use XENLOG_WARN.

ok, it seems this was in my initial version.


>
>
>> +        nr_ext_regions = 0;
>> +    }
>> +    else
>> +    {
>> +        ext_regions = xzalloc(struct meminfo);
>> +        if ( !ext_regions )
>> +            return -ENOMEM;
>> +
>> +        if ( !is_iommu_enabled(d) )
>> +            res = find_unallocated_memory(kinfo, ext_regions);
>> +        else
>> +            res = find_memory_holes(kinfo, ext_regions);
>> +
>> +        if ( res )
>> +            printk(XENLOG_WARNING "Failed to allocate extended 
>> regions\n");
>> +        nr_ext_regions = ext_regions->nr_banks;
>> +    }
>> +
>> +    reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + 
>> sizecells));
>> +    if ( !reg )
>> +    {
>> +        xfree(ext_regions);
>> +        return -ENOMEM;
>> +    }
>> +
>>       /* reg 0 is grant table space */
>>       cells = &reg[0];
>>       dt_child_set_range(&cells, addrcells, sizecells,
>>                          kinfo->gnttab_start, kinfo->gnttab_size);
>> +    /* reg 1...N are extended regions */
>> +    for ( i = 0; i < nr_ext_regions; i++ )
>> +    {
>> +        u64 start = ext_regions->bank[i].start;
>> +        u64 size = ext_regions->bank[i].size;
>> +
>> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>> +                   i, start, start + size);
>
> I would prefer if this is a printk() so we get the extended region 
> listed from the beginning.

ok


>
>
>> +
>> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
>> +    }
>> +
>>       res = fdt_property(fdt, "reg", reg,
>> -                       dt_cells_to_size(addrcells + sizecells));
>> +                       dt_cells_to_size(addrcells + sizecells) *
>> +                       (nr_ext_regions + 1));
>> +    xfree(ext_regions);
>> +    xfree(reg);
>> +
>>       if ( res )
>>           return res;
>>
>
[1] 
https://lore.kernel.org/xen-devel/b349e43a-91d9-16ba-57c6-34e790b8b31c@gmail.com/


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


