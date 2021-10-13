Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E442C645
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 18:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208732.364967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mah3E-0006wo-PV; Wed, 13 Oct 2021 16:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208732.364967; Wed, 13 Oct 2021 16:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mah3E-0006u4-MH; Wed, 13 Oct 2021 16:24:20 +0000
Received: by outflank-mailman (input) for mailman id 208732;
 Wed, 13 Oct 2021 16:24:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mah3C-0006ty-Ph
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 16:24:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mah3B-00011H-G2; Wed, 13 Oct 2021 16:24:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mah3B-0006Fn-9T; Wed, 13 Oct 2021 16:24:17 +0000
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
	bh=FIghc/byeRq6nh2ely+xot5BXxzU5yD8Ffz37IcjTVc=; b=ITScO1pR94kD7fl+SD7tjRpS2e
	dc9LMVyVigPUf5oBjtlJ5YPUOYK+DnAP2k6I3NC+uDn0Y1av1v3VugdVSA2cWzCGHv30ScCn7IbOf
	tSz4u1K3V4RpIoZKvwSIV9BPpB2jIHev2dyeKY7MNkBt8ACXzKvj3bww+DQp4Cz14fUo=;
Message-ID: <2faf58fa-2e06-635f-27fe-9ba642db27b0@xen.org>
Date: Wed, 13 Oct 2021 17:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Oleksandr <olekstysh@gmail.com>
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
 <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
 <d076afcc-5fde-e83e-1632-371406bdd387@xen.org>
 <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 13/10/2021 16:49, Oleksandr wrote:
> 
> On 13.10.21 18:15, Julien Grall wrote:
>> On 13/10/2021 14:46, Oleksandr wrote:
>>>
>>> Hi Julien
>>
>> Hi Oleksandr,
> 
> Hi Julien
> 
> 
> Thank you for the prompt response.
> 
> 
>>
>>> On 13.10.21 00:43, Oleksandr wrote:
>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>> index e3140a6..53ae0f3 100644
>>> --- a/tools/libs/light/libxl_arm.c
>>> +++ b/tools/libs/light/libxl_arm.c
>>> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, 
>>> void *fdt,
>>>                                 "xen,xen");
>>>       if (res) return res;
>>>
>>> -    /* reg 0 is grant table space */
>>> +    /*
>>> +     * reg 0 is a placeholder for grant table space, reg 1...N are
>>> +     * the placeholders for extended regions.
>>> +     */
>>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>>> GUEST_ROOT_SIZE_CELLS,
>>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>> +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 0);
>>
>> Here you are relying on GUEST_RAM_BANKS == 2. I think this is pretty 
>> fragile as this may change in the future.
>>
>> fdt_property_regs() is not really suitable for here. I would suggest 
>> to create a new helper fdt_property_placeholder() which takes the 
>> address cells, size cells and the number of ranges. The function will 
>> then create N range that are zeroed.
> 
> You are right. Probably, we could add an assert here for now to be 
> triggered if "GUEST_RAM_BANKS != 2"?
> But, if you still think we need to make it with the helper right now, I 
> will. However, I don't know how long this will take.

I would prefer if we introduce the helper now. Below a potential version 
(not compiled):

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6e0039..df59a0521412 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -269,6 +269,20 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
      return fdt_property(fdt, "reg", regs, sizeof(regs));
  }

+static int fdt_property_reg_placeholder(libxl__gc *gc, void *fdt,
+                                        unsigned int addr_cells,
+                                        unsigned int size_cells,
+                                        unsigned int num_regs)
+{
+    uint32_t regs[num_regs * (addr_cells + size_cells)];
+
+    for (i = 0 ; i < num_regs; i++) {
+        set_range(&cells, addr_cells, size_cells, 0, 0);
+    }
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
  static int make_root_properties(libxl__gc *gc,
                                  const libxl_version_info *vers,

>>> +{
>>> +    void *fdt = dom->devicetree_blob;
>>> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
>>> region_base[GUEST_RAM_BANKS],
>>> +        bankend[GUEST_RAM_BANKS];
>>> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>>> +                  (GUEST_RAM_BANKS + 1)];
>>> +    be32 *cells = &regs[0];
>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>> +    unsigned int i, len, nr_regions = 0;
>>> +    libxl_dominfo info;
>>> +    int offset, rc;
>>> +
>>> +    offset = fdt_path_offset(fdt, "/hypervisor");
>>> +    assert(offset > 0);
>>> +
>>> +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
>>> +    assert(!rc);
>>> +
>>> +    assert(info.gpaddr_bits <= 64);
>>
>> Neither of the two should be assert(). They should be proper check so 
>> we don't end up with a disaster (in particularly for the former) if 
>> there is a problem.
> 
> I looked at the similar finalise_*(), and it looks like no one bothers 
> with returning an error. Of course, this is not an excuse, will add a 
> proper check.

This is a bit unfortunate. I would prefer if this can be avoided for new 
code (the more libxl__arch_domain_finalise_hw_description() can already 
propagate the error).

Cheers,

-- 
Julien Grall

