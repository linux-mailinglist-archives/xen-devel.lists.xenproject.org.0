Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B944CA7E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 21:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224442.387706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mku6L-0008Ta-Pf; Wed, 10 Nov 2021 20:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224442.387706; Wed, 10 Nov 2021 20:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mku6L-0008RL-MF; Wed, 10 Nov 2021 20:21:45 +0000
Received: by outflank-mailman (input) for mailman id 224442;
 Wed, 10 Nov 2021 20:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8kS=P5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mku6K-0008RF-JJ
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 20:21:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d192859f-4263-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 21:21:43 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id f8so15476527edy.4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 12:21:42 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d3sm441711edr.0.2021.11.10.12.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 12:21:41 -0800 (PST)
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
X-Inumbo-ID: d192859f-4263-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ePDj+E5Fo0UgxeIg0zOPRAn8/70iDOz7sGUrTy/s0/0=;
        b=OR6BJt2P8UEsZR9oLq2OAeuIEcvPeHhej0r7UGYkDaMeGwGn01izRPUCAMss5VBsXw
         yCsVY6MopXZfRQI3ogoDTNL4dpiTAgttcFm4iUWY02qLLY//WynggQZeC7Y95rH88k/g
         cNdLO+djQhV3bn6vXrPMQTQ6bxPPZJ4lE7mOifOpXVXS2Mb5sN4G+5nLf1R5Hv2sD//l
         O6tnp1QzJL5Ik4hKZHClbGgYCoy1s+n1NG4bM0VZk1JAVWaoD2KFzMmqGdzR9r8MnNLF
         /cna1pycJ2qpVRcbdrK1CDsbrtMZJOygv2x+ptGHpzRU1QtAWeH667dwhH2s23eFu+h2
         Garg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ePDj+E5Fo0UgxeIg0zOPRAn8/70iDOz7sGUrTy/s0/0=;
        b=L7PCkfP2zOMPJinogMOggsyH5zu7qlPxsGAjwYMQX3od+ezfxEdZjo0grDidC8f/7p
         lLIrrqLRQgjBGxFpOSdLgzrVkcoJNHfPGYV/GNdS5FRerTSAkyy5pgHK63SWvD/bsVcP
         0Tem8OZ60OZLaw+GiA5C5D9Acmh0eRXtTvPv1dm4p6Y90sKzYbj+lO70MOPlqpyvV0Zh
         JxTGS7mZ1FPm933oHyI8dVGFNIZPEAcp0al2z86bbwVxUMa/AV+hN9XQwVrGDBSUmuXq
         yNW8amNRzsDkcGiIIh3KrhAftsom+8eeX251W+9IM/5Gom/fUogOTSU6YInjCn8b/Yn7
         JaWw==
X-Gm-Message-State: AOAM532yxK91kDi60yvdZUiZhTz7bw0Bh4xM/vqvTQkH5gK8XuEcrZW1
	HuUrtkErGvwP+j64IfTElxs=
X-Google-Smtp-Source: ABdhPJzaVT7G2RyDKp26etrOSTUOugc4YeFt2NKR0Vt0fjDA2dG7ngZ+iS/VdPUu927jJDx/P8RFGA==
X-Received: by 2002:a17:907:216e:: with SMTP id rl14mr2387234ejb.368.1636575702193;
        Wed, 10 Nov 2021 12:21:42 -0800 (PST)
Subject: Re: [PATCH V2 4/4] arm/xen: Read extended regions from DT and init
 Xen resource
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110271803060.20134@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <237f832d-5175-5653-18ee-058a7d7fa7a6@gmail.com>
Date: Wed, 10 Nov 2021 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110271803060.20134@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.10.21 04:40, Stefano Stabellini wrote:

Hi Stefano

I am sorry for the late response.

> On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch implements arch_xen_unpopulated_init() on Arm where
>> the extended regions (if any) are gathered from DT and inserted
>> into passed Xen resource to be used as unused address space
>> for Xen scratch pages by unpopulated-alloc code.
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen by the hypervisor at the domain
>> creation time and advertised to it via "reg" property under
>> hypervisor node in the guest device-tree. As region 0 is reserved
>> for grant table space (always present), the indexes for extended
>> regions are 1...N.
>>
>> If arch_xen_unpopulated_init() fails for some reason the default
>> behaviour will be restored (allocate xenballooned pages).
>>
>> This patch also removes XEN_UNPOPULATED_ALLOC dependency on x86.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes RFC -> V2:
>>     - new patch, instead of
>>      "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"
>> ---
>>   arch/arm/xen/enlighten.c | 112 +++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/xen/Kconfig      |   2 +-
>>   2 files changed, 113 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>> index dea46ec..1a1e0d3 100644
>> --- a/arch/arm/xen/enlighten.c
>> +++ b/arch/arm/xen/enlighten.c
>> @@ -62,6 +62,7 @@ static __read_mostly unsigned int xen_events_irq;
>>   static phys_addr_t xen_grant_frames;
>>   
>>   #define GRANT_TABLE_INDEX   0
>> +#define EXT_REGION_INDEX    1
>>   
>>   uint32_t xen_start_flags;
>>   EXPORT_SYMBOL(xen_start_flags);
>> @@ -303,6 +304,117 @@ static void __init xen_acpi_guest_init(void)
>>   #endif
>>   }
>>   
>> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>> +int arch_xen_unpopulated_init(struct resource *res)
>> +{
>> +	struct device_node *np;
>> +	struct resource *regs, *tmp_res;
>> +	uint64_t min_gpaddr = -1, max_gpaddr = 0;
>> +	unsigned int i, nr_reg = 0;
>> +	struct range mhp_range;
>> +	int rc;
>> +
>> +	if (!xen_domain())
>> +		return -ENODEV;
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "xen,xen");
>> +	if (WARN_ON(!np))
>> +		return -ENODEV;
>> +
>> +	/* Skip region 0 which is reserved for grant table space */
>> +	while (of_get_address(np, nr_reg + EXT_REGION_INDEX, NULL, NULL))
>> +		nr_reg++;
>> +	if (!nr_reg) {
>> +		pr_err("No extended regions are found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
>> +	if (!regs)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * Create resource from extended regions provided by the hypervisor to be
>> +	 * used as unused address space for Xen scratch pages.
>> +	 */
>> +	for (i = 0; i < nr_reg; i++) {
>> +		rc = of_address_to_resource(np, i + EXT_REGION_INDEX, &regs[i]);
>> +		if (rc)
>> +			goto err;
>> +
>> +		if (max_gpaddr < regs[i].end)
>> +			max_gpaddr = regs[i].end;
>> +		if (min_gpaddr > regs[i].start)
>> +			min_gpaddr = regs[i].start;
>> +	}
>> +
>> +	/* Check whether the resource range is within the hotpluggable range */
>> +	mhp_range = mhp_get_pluggable_range(true);
>> +	if (min_gpaddr < mhp_range.start)
>> +		min_gpaddr = mhp_range.start;
>> +	if (max_gpaddr > mhp_range.end)
>> +		max_gpaddr = mhp_range.end;
>> +
>> +	res->start = min_gpaddr;
>> +	res->end = max_gpaddr;
>> +
>> +	/*
>> +	 * Mark holes between extended regions as unavailable. The rest of that
>> +	 * address space will be available for the allocation.
>> +	 */
>> +	for (i = 1; i < nr_reg; i++) {
>> +		resource_size_t start, end;
>> +
>> +		start = regs[i - 1].end + 1;
>> +		end = regs[i].start - 1;
>> +
>> +		if (start > (end + 1)) {
> Should this be:
>
> if (start >= end)
>
> ?

Yes, we can do this here (since the checks are equivalent) but ...


>
>
>> +			rc = -EINVAL;
>> +			goto err;
>> +		}
>> +
>> +		/* There is no hole between regions */
>> +		if (start == (end + 1))
> Also here, shouldn't it be:
>
> if (start == end)
>
> ?

    ... not here.

As

"(start == (end + 1))" is equal to "(regs[i - 1].end + 1 == regs[i].start)"

but

"(start == end)" is equal to "(regs[i - 1].end + 1 == regs[i].start - 1)"


>
> I think I am missing again something in termination accounting :-)

If I understand correctly, we need to follow "end = start + size - 1" 
rule, so the "end" is the last address inside a range, but not the 
"first" address outside of a range))


>
>
>> +			continue;
>> +
>> +		/* Check whether the hole range is within the resource range */
>> +		if (start < res->start || end > res->end) {
> By definition I don't think this check is necessary as either condition
> is impossible?


This is a good question, let me please explain.
Not all extended regions provided by the hypervisor can be used here. 
This is because the addressable physical memory range for which the 
linear mapping
could be created has limits on Arm, and maximum addressable range 
depends on the VA space size (CONFIG_ARM64_VA_BITS_XXX). So we decided 
to not filter them in hypervisor as this logic could be quite complex as 
different OS may have different requirement, etc. This means that we 
need to make sure that regions are within the hotpluggable range to 
avoid a failure later on when a region is pre-validated by the memory 
hotplug path.

The following code limits the resource range based on that:

+    /* Check whether the resource range is within the hotpluggable range */
+    mhp_range = mhp_get_pluggable_range(true);
+    if (min_gpaddr < mhp_range.start)
+        min_gpaddr = mhp_range.start;
+    if (max_gpaddr > mhp_range.end)
+        max_gpaddr = mhp_range.end;
+
+    res->start = min_gpaddr;
+    res->end = max_gpaddr;

In current loop (when calculating and inserting holes) we also need to 
make sure that resulting hole range is within the resource range (and 
adjust/skip it if not true) as regs[] used for the calculations contains 
raw regions as they described in DT so not updated. Otherwise 
insert_resource() down the function will return an error for the 
conflicting operations. Yes, I could took a different route and update 
regs[] in advance to adjust/skip non-suitable regions in front, but I 
decided to do it on the fly in the loop here, I thought doing it in 
advance would add some overhead/complexity. What do you think?

So I am afraid this check is necessary here.

For example in my environment the extended regions are:

(XEN) Extended region 0: 0->0x8000000
(XEN) Extended region 1: 0xc000000->0x30000000
(XEN) Extended region 2: 0x40000000->0x47e00000
(XEN) Extended region 3: 0xd0000000->0xe6000000
(XEN) Extended region 4: 0xe7800000->0xec000000
(XEN) Extended region 5: 0xf1200000->0xfd000000
(XEN) Extended region 6: 0x100000000->0x500000000
(XEN) Extended region 7: 0x580000000->0x600000000
(XEN) Extended region 8: 0x680000000->0x700000000
(XEN) Extended region 9: 0x780000000->0x10000000000

*With* the check the holes are:

holes [47e00000 - cfffffff]
holes [e6000000 - e77fffff]
holes [ec000000 - f11fffff]
holes [fd000000 - ffffffff]
holes [500000000 - 57fffffff]
holes [600000000 - 67fffffff]
holes [700000000 - 77fffffff]

And they seem to look correct, you can see that two possible holes 
between extended regions 0-1 (8000000-bffffff) and 1-2 
(30000000-3fffffff) were skipped as they entirely located below res->start
which is 0x40000000 in my case (48-bit VA: 0x40000000 - 0x80003fffffff).

*Without* the check these two holes won't be skipped and as the result 
insert_resource() will fail.


**********


I have one idea how we can simplify filter logic, we can drop all checks 
here (including confusing one) in Arm code and update common code a bit:

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 1a1e0d3..ed5b855 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -311,7 +311,6 @@ int arch_xen_unpopulated_init(struct resource *res)
         struct resource *regs, *tmp_res;
         uint64_t min_gpaddr = -1, max_gpaddr = 0;
         unsigned int i, nr_reg = 0;
-       struct range mhp_range;
         int rc;

         if (!xen_domain())
@@ -349,13 +348,6 @@ int arch_xen_unpopulated_init(struct resource *res)
                         min_gpaddr = regs[i].start;
         }

-       /* Check whether the resource range is within the hotpluggable 
range */
-       mhp_range = mhp_get_pluggable_range(true);
-       if (min_gpaddr < mhp_range.start)
-               min_gpaddr = mhp_range.start;
-       if (max_gpaddr > mhp_range.end)
-               max_gpaddr = mhp_range.end;
-
         res->start = min_gpaddr;
         res->end = max_gpaddr;

@@ -378,17 +370,6 @@ int arch_xen_unpopulated_init(struct resource *res)
                 if (start == (end + 1))
                         continue;

-               /* Check whether the hole range is within the resource 
range */
-               if (start < res->start || end > res->end) {
-                       if (start < res->start)
-                               start = res->start;
-                       if (end > res->end)
-                               end = res->end;
-
-                       if (start >= (end + 1))
-                               continue;
-               }
-
                 tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
                 if (!tmp_res) {
                         rc = -ENOMEM;
diff --git a/drivers/xen/unpopulated-alloc.c 
b/drivers/xen/unpopulated-alloc.c
index 1f1d8d8..a5d3ebb 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -39,6 +39,7 @@ static int fill_list(unsigned int nr_pages)
         void *vaddr;
         unsigned int i, alloc_pages = round_up(nr_pages, 
PAGES_PER_SECTION);
         int ret;
+       struct range mhp_range;

         res = kzalloc(sizeof(*res), GFP_KERNEL);
         if (!res)
@@ -47,8 +48,10 @@ static int fill_list(unsigned int nr_pages)
         res->name = "Xen scratch";
         res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;

+       mhp_range = mhp_get_pluggable_range(true);
+
         ret = allocate_resource(target_resource, res,
-                               alloc_pages * PAGE_SIZE, 0, -1,
+                               alloc_pages * PAGE_SIZE, 
mhp_range.start, mhp_range.end,
                                 PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
         if (ret < 0) {
                 pr_err("Cannot allocate new IOMEM resource\n");
(END)

I believe, this will work on x86 as arch_get_mappable_range() is not 
implemented there,
and the default option contains exactly what being used currently (0, -1).

struct range __weak arch_get_mappable_range(void)
{
     struct range mhp_range = {
         .start = 0UL,
         .end = -1ULL,
     };
     return mhp_range;
}

And this is going to be more generic and clear, what do you think?


>
>> +			if (start < res->start)
>> +				start = res->start;
>> +			if (end > res->end)
>> +				end = res->end;
>> +
>> +			if (start >= (end + 1))
>> +				continue;
>> +		}
>> +
>> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>> +		if (!tmp_res) {
>> +			rc = -ENOMEM;
>> +			goto err;
>> +		}
>> +
>> +		tmp_res->name = "Unavailable space";
>> +		tmp_res->start = start;
>> +		tmp_res->end = end;
> Do we need to set any flags so that the system can reuse the memory in
> the hole, e.g. IORESOURCE_MEM? Or is it not necessary?


I might be wrong, but I don't think it is necessary. I don't see how the 
system can reuse memory in the holes as
the Xen resource we are constructing here will be exclusively used by 
the unpopulated-alloc code only. I would leave type-less
resource here. Or I missed something?


>
>
>> +		rc = insert_resource(res, tmp_res);
>> +		if (rc) {
>> +			pr_err("Cannot insert resource [%llx - %llx] %d\n",
>> +					tmp_res->start, tmp_res->end, rc);
> Although it is impossible to enable XEN_UNPOPULATED_ALLOC on arm32 due
> to unmet dependencies, I would like to keep the implementation of
> arch_xen_unpopulated_init 32bit clean.
>
> I am getting build errors like (by forcing arch_xen_unpopulated_init to
> compile on arm32):
>
> ./include/linux/kern_levels.h:5:18: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘resource_size_t {aka unsigned int}’ [-Wformat=]

Thank you for pointing this out. I will use %pR specifier here and in 
the common code where I print the same message.


>
>
>> +			kfree(tmp_res);
>> +			goto err;
>> +		}
>> +	}
>> +
>> +err:
>> +	kfree(regs);
>> +
>> +	return rc;
>> +}
>> +#endif
>> +
>>   static void __init xen_dt_guest_init(void)
>>   {
>>   	struct device_node *xen_node;
>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>> index 1b2c3ac..e6031fc 100644
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -297,7 +297,7 @@ config XEN_FRONT_PGDIR_SHBUF
>>   
>>   config XEN_UNPOPULATED_ALLOC
>>   	bool "Use unpopulated memory ranges for guest mappings"
>> -	depends on X86 && ZONE_DEVICE
>> +	depends on ZONE_DEVICE
>>   	default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0
>>   	help
>>   	  Use unpopulated memory ranges in order to create mappings for guest

-- 
Regards,

Oleksandr Tyshchenko


