Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C342C1B1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208493.364636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeas-0007nf-Eb; Wed, 13 Oct 2021 13:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208493.364636; Wed, 13 Oct 2021 13:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeas-0007kg-BH; Wed, 13 Oct 2021 13:46:54 +0000
Received: by outflank-mailman (input) for mailman id 208493;
 Wed, 13 Oct 2021 13:46:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maeaq-0007ka-QA
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:46:52 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfcce0b3-80bc-4a72-9a77-61d18aa69cd2;
 Wed, 13 Oct 2021 13:46:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t9so12192791lfd.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 06:46:50 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k21sm1156943ljn.126.2021.10.13.06.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 06:46:47 -0700 (PDT)
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
X-Inumbo-ID: cfcce0b3-80bc-4a72-9a77-61d18aa69cd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Os35FbdnbdUgpTybXhUEC4erjKfVe6PfmHwS0DsZLmQ=;
        b=MpCA+eH4lw5wiU4p/WVZB0kehEnlW4BgYr6umCCBsrOaDhAfop5xWB9ISoa9Hh7X02
         tf5Ie+9enejl640aoLKoo9LKElKyleWkuuUqtyetffX+oi+kW5BIaCMO377QMhz90dE5
         2XYi/ThIDlQCFFkrDWrQdt6JjeekQVFjoPZSjZOyZq8q6K7LAiIcPv5vZwo6fl/Jmwc7
         dCxW8tpOu+W9rctszJK7+mmHR1lLy/CxjqnkUWx8D3dLP27uIgq51dyNKHGO5jOnHpxc
         ZnxklVuBZkfIptZuDLtsswLUU1LCAqhj/ZW+TNkI0JsiHRs1nlZnMdfEL1bmxoYhM3b9
         JAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Os35FbdnbdUgpTybXhUEC4erjKfVe6PfmHwS0DsZLmQ=;
        b=m8+DUEAeASLxyHZVsL9X9vzg4zJgf8U9f4OILyKKJGT/myXdvSdflEoMgZKXQoPa+I
         jt9O3bZctmZjugokzVuYkRUJ+5dL7G2l4furXcEtpuTKK5c1bZ7Q8MwKBja+J2pEqh4v
         VLpzGAoWIUS/A2vg4JsyMX5eff4eO//qq0CvIFrR0QoIJ6ottL27b+tcwqTfkZC8gfVS
         R7eanBrlDpa+ab+ABoSDBS3a5WMZKNgXYScXI3GmwfmB/rYEpn4cob1UrX5KosoUyKyF
         Mh33ztSBEkqH+i4JkWTUk4p1/ydWeMDi3oOCVKAP+YywEbSNm3yM/aAsNiAL1vaBJFxM
         kPUw==
X-Gm-Message-State: AOAM532oev/Sd0JyFqxbZ+nu3zZb1mylPFqBI3/DQWVNjiZdr1hLfVli
	bd1pRgEGf0aK4ArBqS34WbE=
X-Google-Smtp-Source: ABdhPJxeBZMlYDT1YAWM/iowRj1hPV7e9oTDwpjr8FYhPoIsvfzuRHA69swREjciyJZeVdUH2Jb5Dg==
X-Received: by 2002:ac2:518a:: with SMTP id u10mr8455677lfi.367.1634132808281;
        Wed, 13 Oct 2021 06:46:48 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <c98c1acd-86c0-f556-643e-e472b696644f@xen.org>
 <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com>
 <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
 <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
Message-ID: <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
Date: Wed, 13 Oct 2021 16:46:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Julien


On 13.10.21 00:43, Oleksandr wrote:
>
> On 13.10.21 00:22, Julien Grall wrote:
>> Hi Oleksandr,
>
> Hi Julien, Ian.
>
>
> Julien, thank you for the detailed answer, I will analyze it tomorrow.

Already analyzed, please see comments below.


>
> Ian, I think, there is no reason in providing git branch with the acks 
> folded in + my minor fix for the debug message as it was discussed 
> before, it sounds like there is more work to do, so it is going to be 
> a new version anyway.
>
>
>
>
>>
>> On 12/10/2021 18:42, Oleksandr wrote:
>>> On 12.10.21 19:05, Julien Grall wrote:
>>>> On 11/10/2021 18:48, Oleksandr Tyshchenko wrote:
>>>>> ---
>>>>>   tools/libs/light/libxl_arm.c  | 76 
>>>>> ++++++++++++++++++++++++++++++++++++++++---
>>>>>   xen/include/public/arch-arm.h |  2 ++
>>>>>   2 files changed, 73 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/tools/libs/light/libxl_arm.c 
>>>>> b/tools/libs/light/libxl_arm.c
>>>>> index e3140a6..c0e8415 100644
>>>>> --- a/tools/libs/light/libxl_arm.c
>>>>> +++ b/tools/libs/light/libxl_arm.c
>>>>> @@ -598,9 +598,20 @@ static int make_timer_node(libxl__gc *gc, 
>>>>> void *fdt,
>>>>>       return 0;
>>>>>   }
>>>>>   +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
>>>>> +
>>>>>   static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>>>> -                                const libxl_version_info *vers)
>>>>> +                                const libxl_version_info *vers,
>>>>> +                                const libxl_domain_build_info 
>>>>> *b_info,
>>>>> +                                const struct xc_dom_image *dom)
>>>>>   {
>>>>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
>>>>> region_base[GUEST_RAM_BANKS],
>>>>> +        bank1end, ramsize;
>>>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + 
>>>>> GUEST_ROOT_SIZE_CELLS) *
>>>>> +                  (GUEST_RAM_BANKS + 1)];
>>>>> +    be32 *cells = &regs[0];
>>>>> +    unsigned int i, len, nr_regions = 0;
>>>>> +    libxl_dominfo info;
>>>>>       int res;
>>>>>       gic_interrupt intr;
>>>>>   @@ -615,9 +626,64 @@ static int make_hypervisor_node(libxl__gc 
>>>>> *gc, void *fdt,
>>>>>                                 "xen,xen");
>>>>>       if (res) return res;
>>>>>   -    /* reg 0 is grant table space */
>>>>> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>>>>> GUEST_ROOT_SIZE_CELLS,
>>>>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>>>> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
>>>>> +        LOG(WARN, "The extended regions are only supported for 
>>>>> 64-bit guest currently");
>>>>> +        goto out;
>>>>> +    }
>>>>
>>>> I understand why we want to limit to 64-bit domain for dom0. But I 
>>>> am not sure this is warrant for 32-bit domain. At worse, the guest 
>>>> will ignore the bank because it is not usable. So could we drop the 
>>>> check?
>>>
>>> Yes.
>>>
>>>
>>>>
>>>>
>>>>> +
>>>>> +    res = libxl_domain_info(CTX, &info, dom->guest_domid);
>>>>> +    if (res) return res;
>>>>> +
>>>>> +    assert(info.gpaddr_bits >= 32 && info.gpaddr_bits <= 48);
>>>> What could go wrong below if gpaddr_bits is not within this range?
>>>
>>> if info.gpaddr_bits is less than 64, then nothing bad, otherwise, I 
>>> assume we will get shift count overflow.
>>
>> So I think the assert() is not suitable here because even if the 
>> gpaddr_bits is provided by the hypervisor (and therefore should be 
>> trusted), this is a different component so hardening the code is a 
>> good practice.
>>
>> In this case, I would check that info.gpaddr_bits <= 64 and return an 
>> error. The reason I am suggesting <= 64 and not 48 is because Arm 
>> already supports 52 bits address space. Yet, I still like to avoid 
>> this assumption in the code. Something like below should work:
>>
>> bank1end = GUEST_RAM1_BASE + GUEST_RAM1_SIZE - 1;
>> bank1end = min(bank1end, ~(0ULL) >> (64 - info.gpaddr_bits);

ok, makes sense.


>>
>>
>>>>> +
>>>>> +    /*
>>>>> +     * Try to allocate separate 2MB-aligned extended regions from 
>>>>> the first
>>>>> +     * (below 4GB) and second (above 4GB) RAM banks taking into 
>>>>> the account
>>>>> +     * the maximum supported guest physical address space size 
>>>>> and the amount
>>>>> +     * of memory assigned to the guest.
>>>>> +     * As the guest memory layout is not populated yet we cannot 
>>>>> rely on
>>>>> +     * dom->rambank_size[], so calculate the actual size of both 
>>>>> banks using
>>>>> +     * "max_memkb" value.
>>>>> +     */
>>>>
>>>> At the moment, libxl doesn't know how libxc will allocate the 
>>>> memory. We may decide in the future to have only a small amount of 
>>>> memory below 4GB and then the rest above 4GB. With this approach it 
>>>> would be more difficult to modify the memory layout. Instead, I 
>>>> think we should create a placeholder that is updated once we know 
>>>> the banks in libxl__arch_domain_finalise_hw_description.
>>>
>>> If I got your point correctly, this is close to how it was done from 
>>> the beginning. Yes, we can create placeholder(s) here and then 
>>> update them once the memory layout is populated. The problem is that 
>>> we won't be able to remove the placeholder(s) if we fail to allocate 
>>> region(s) for some reasons. So, we should know for sure in advance 
>>> how many region(s) we will be able to allocate later on in order to 
>>> create the required number of placeholders right now... Please, look 
>>> at the TODO I wrote in finalise_ext_region() [1]. Or I misread your 
>>> point?
>>
>> You read correctly my point. However, I disagree that it is a problem 
>> to remove the placeholder if we fail to allocate the amount of 
>> regions expected.
>>
>> Looking at libfdt, I can see two ways to deal with it:
>>   1) Use fdt_setprop()
>>   2) Delete the property using fdt_delprop() and then recreate it 
>> with fdt_appendprop()
>>
>> The first solution is ideal and I think can work here to downsize the 
>> property. At worse, the second solution should work as the FDT blob 
>> will not increase.

Indeed, fdt_setprop() will work in our case, thank you. When I looked at 
it, I only experimented with two high-level functions: 
fdt_setprop_inplace() and fdt_nop_node() used in libxl_arm.c and no one 
wasn't suitable.


>>
>>
>>>> We also probably want to mention in the memory layout in 
>>>> public/arch-arm.h this decision as the suggested way to find 
>>>> extended regions will definitely impact our decision to re-order 
>>>> the memory layout or shrink some regions in the future (I have in 
>>>> mind the PCI Passthrough work).
>>>
>>> Sorry, I couldn't parse.
>>
>> So this patch is relying on the fact that the regions reserved for 
>> the RAM are big enough to also accommodate the extended regions.
>>
>> I am happy with this approach. However, I would like the approach to 
>> be documented in arch-arm.h because this is the first place one would 
>> look to understand the memory layout. This will be helpful if/when we 
>> need to modify the guest memory layout.

Thank you for the clarification, it is clear now.


>>
>>
>>>
>>>
>>>>
>>>>
>>>>> +    ramsize = b_info->max_memkb * 1024;
>>>>> +    if (ramsize <= GUEST_RAM0_SIZE) {
>>>>> +        region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>>>>> +        region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>>>>> +        region_base[1] = GUEST_RAM1_BASE;
>>>>> +    } else
>>>>> +        region_base[1] = GUEST_RAM1_BASE +
>>>>> +            ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
>>>>> +
>>>>> +    bank1end = min(1ULL << info.gpaddr_bits, GUEST_RAM1_BASE + 
>>>>> GUEST_RAM1_SIZE);
>>>>> +    if (bank1end > region_base[1])
>>>>> +        region_size[1] = bank1end - region_base[1];
>>>>
>>>> It would be best to not rely on the fact that Bank on is always 
>>>> below 4GB. If the code is too complex then we should look to add a 
>>>> BUILD_BUG_ON() to avoid any surprise.
>>>
>>> Yes, I can add:
>>>
>>> BUILD_BUG_ON((GUEST_RAM0_BASE + GUEST_RAM0_SIZE) > GB(4));
>>
>> I am OK with that. But I wonder if we could simply use min(..., ) to 
>> avoid the BUILD_BUG_ON().

I think, we could. And probably we could avoid relying on the fact that 
Bank 0 is always below 4GB.

Below, the changes based on my understanding of the whole request. Would 
you be OK with them?


diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..53ae0f3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, void 
*fdt,
                                "xen,xen");
      if (res) return res;

-    /* reg 0 is grant table space */
+    /*
+     * reg 0 is a placeholder for grant table space, reg 1...N are
+     * the placeholders for extended regions.
+     */
      res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
GUEST_ROOT_SIZE_CELLS,
-                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 0);
      if (res) return res;

      /*
@@ -1069,6 +1072,74 @@ static void finalise_one_node(libxl__gc *gc, void 
*fdt, const char *uname,
      }
  }

+#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
+
+static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image *dom)
+{
+    void *fdt = dom->devicetree_blob;
+    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
region_base[GUEST_RAM_BANKS],
+        bankend[GUEST_RAM_BANKS];
+    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+                  (GUEST_RAM_BANKS + 1)];
+    be32 *cells = &regs[0];
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+    unsigned int i, len, nr_regions = 0;
+    libxl_dominfo info;
+    int offset, rc;
+
+    offset = fdt_path_offset(fdt, "/hypervisor");
+    assert(offset > 0);
+
+    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
+    assert(!rc);
+
+    assert(info.gpaddr_bits <= 64);
+
+    /*
+     * Try to allocate separate 2MB-aligned extended regions from the first
+     * and second RAM banks taking into the account the maximum supported
+     * guest physical address space size and the amount of memory assigned
+     * to the guest.
+     */
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        region_base[i] = bankbase[i] +
+            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << 
XC_PAGE_SHIFT);
+
+        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
+        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
+        if (bankend[i] > region_base[i])
+            region_size[i] = bankend[i] - region_base[i] + 1;
+    }
+
+    /*
+     * The region 0 for grant table space must be always present. If we 
managed
+     * to allocate the extended regions then insert them as regions 1...N.
+     */
+    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
+            continue;
+
+        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
+            nr_regions, region_base[i], region_base[i] + region_size[i]);
+
+        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  region_base[i], region_size[i]);
+        nr_regions++;
+    }
+
+    if (!nr_regions)
+        LOG(WARN, "The extended regions cannot be allocated, not enough 
space");
+
+    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + 
GUEST_ROOT_SIZE_CELLS) *
+        (nr_regions + 1);
+    rc = fdt_setprop(fdt, offset, "reg", regs, len);
+    assert(!rc);
+}
+
  int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
                                                 uint32_t domid,
libxl_domain_config *d_config,
@@ -1109,6 +1180,8 @@ int 
libxl__arch_domain_finalise_hw_description(libxl__gc *gc,

      }

+    finalise_ext_region(gc, dom);
+
      for (i = 0; i < GUEST_RAM_BANKS; i++) {
          const uint64_t size = (uint64_t)dom->rambank_size[i] << 
XC_PAGE_SHIFT;

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d46c61f..7425a78 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;

  #define GUEST_RAM_BANKS   2

+/*
+ * The way to find the extended regions (to be exposed to the guest as 
unused
+ * address space) relies on the fact that the regions reserved for the RAM
+ * below are big enough to also accommodate such regions.
+ */
  #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM 
@ 1GB */
  #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)

@@ -451,6 +456,8 @@ typedef uint64_t xen_callback_t;
  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }

+#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
+
  /* Current supported guest VCPUs */
  #define GUEST_MAX_VCPUS 128

(END)





-- 
Regards,

Oleksandr Tyshchenko


