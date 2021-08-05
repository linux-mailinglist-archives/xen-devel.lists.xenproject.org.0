Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64BC3E1755
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164378.300660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeji-0005ay-Ic; Thu, 05 Aug 2021 14:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164378.300660; Thu, 05 Aug 2021 14:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeji-0005Z6-FS; Thu, 05 Aug 2021 14:52:42 +0000
Received: by outflank-mailman (input) for mailman id 164378;
 Thu, 05 Aug 2021 14:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHI=M4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBejg-0005Z0-A3
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:52:40 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 227a63f6-441a-4712-94cc-7f7637200a0c;
 Thu, 05 Aug 2021 14:52:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c16so11678640lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 07:52:38 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o11sm419049ljg.29.2021.08.05.07.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 07:52:36 -0700 (PDT)
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
X-Inumbo-ID: 227a63f6-441a-4712-94cc-7f7637200a0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VQeYmU1R4NiEv+Bi/6EGfhzbkdkljiCF/SkB4GfI47I=;
        b=MWif2ToeR33t1Vtieb9KQCNmOLZpV/WdgfF7kSrBLpx4x16NDDyLOt5vCuNqU0iS3R
         MglaPG/V+6y6ZSLGvMmV1agzG5wec17qWEqjz64NPwYI12H3eCeSVkgCYHoxKh8PrnJU
         CqPsms376z1w/yCdC/4Fg03HcUxXkz65U8OTzJi2gJ/blB5Y5wqUXQ8YgczKeZBRe3T4
         hLmBDRHKXXUw/ZSmdxfSc8VV/R1QU2iXWCrKRA5d2rUELEu0n+FKUr9cgSUsvNtDWwYO
         64cpjr/bFamC+mt4b7OHihjaTfkCbAETCstkpuwlYbyPu9bXJ/DJfBQRS0MEZu++ASyI
         gVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VQeYmU1R4NiEv+Bi/6EGfhzbkdkljiCF/SkB4GfI47I=;
        b=Kqhw/dLBWDPUnKrkIFr7crjkS/N//dDgPVva3x5DuSiQJAmsCsOoiQAaL83BoDi7IK
         RGTVkGuLTcQ8TGIh9u7VgwABGtOoNMfOAtFPPyCABG+HakcFV34NtLnvh6I4IhxfczfM
         i86biabImNARVHTYR6ILYUNwRyY4gr/UYw0e/ikcbsmbuGL03D95FJuh2JWWNcx4Vn1Q
         9U0Jq841o6bqQMXW2jv0KAlSTp6riMtCk53c6Dk3hU1NoxIwiTebtaszuQ9apk0YKFDE
         Yc4o5vchwrPf6ZSUihLNn11kDvzzGRFxbiOv2tKhS/F7oKSPZiF/lfbxwyzd9L3zalEW
         cDgA==
X-Gm-Message-State: AOAM5327uzqfTLL02j7u6mJjgQlXguQSAzuFBpRg6o2DfGB7x//CEk6q
	ZrGOOo6/MGWxJbvp+QWT7MM=
X-Google-Smtp-Source: ABdhPJzGhi8oSmXpizn8le35Gulosx4Lxv5kgn6vfksQqQslLpIEHTTQL9vzv/q4XRyq+6qN4Qz5XA==
X-Received: by 2002:ac2:58f0:: with SMTP id v16mr4038192lfo.149.1628175156939;
        Thu, 05 Aug 2021 07:52:36 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <775a2c0b-fbcc-db6d-c2a1-4ad350448c92@gmail.com>
Date: Thu, 5 Aug 2021 17:52:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 05.08.21 01:00, Julien Grall wrote:
>
>
> On 04/08/2021 21:56, Oleksandr wrote:
>>
>> Hi Julien, Stefano.
>
> Hi Oleksandr,


Hi, Julien


Thank you for the prompt reply and explanations.


>
>>
>> On 02.08.21 22:12, Oleksandr wrote:
>> I have done some experiments with Xen and toolstack according to the 
>> discussion above. So, I re-used DTB to pass a safe range to the 
>> domain. For the range I borrowed some space from the second RAM bank.
>>
>> -#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of 
>> RAM @ 8GB */
>> -#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
>> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 888GB of 
>> RAM @ 8GB */
>> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xDE00000000)
>> +
>
> I am a bit split with reducing the amount of RAM. On one hand large 
> guest is not unheard on the server side (at least in the x86 world). 
> On the other hand, I am not aware of anyone using Xen on Arm in such 
> setup.
>
> So technically this will be a regression, but it may be OK.

I got it.


>
>
> Regarding the range, this will be a problem as Xen configure the 
> number of the IPA bits based on the PA bits. The lowest possible 
> address space ize on 64-bit is 4GB.
>
> From my understanding, this is because the number of IPA bits 
> supported is contrained by the PA bits. So the position and the size 
> of the region
> would need to depend on the P2M configuration.

Indeed, I missed these bits that IPA bits on Arm64 might be < 40 bit, I 
remember, we select p2m_ipa_bits in setup_virt_paging() depending on 
pabits, moreover the p2m_ipa_bits might be even restricted by some 
external entity (IOMMU, if P2M is shared).


>
> For simplicity, this could be the last few X bytes of the supported 
> address space.
ok, agree. To summarize, so it sounds like we can't use the fixed safe 
range as in my example, it must be variable. Well, I hope, we will be 
able to achieve this without reducing the total amount of domain RAM in 
front (GUEST_RAM1_SIZE). After all, we know the IPA size and the domain 
RAM in advance, so we certainly can choose the start and size of the 
range. In case, we won't be able to find a suitable large chunk (for 
example, when IPA bits = 32, and domain has a lot of RAM assigned and as 
the result - almost all address space below 4GB is in use), we won't 
expose a safe range to a domain at all, and domain will just fall back 
to use real pages instead (actually, how it currently behaves on Arm).

A side note: we would likely need the toolstack (that generates 
device-tree for guests) to query IPA size, or similar.


>
>
> For 32-bit domain, we also need to make sure the address is usable for 
> domain short page tables (not too long ago Debian was shipping the 
> kernel with them rather than LPAE). I haven't yet checked what's the 
> limit here.

Hmm, I didn't take this use-case into the account. So, I assume we need 
the safe range to be located below 4GB if is_32bit_domain() returns true.


>
>
>> +#define GUEST_SAFE_RANGE_BASE xen_mk_ullong(0xDE00000000) /* 128GB */
>> +#define GUEST_SAFE_RANGE_SIZE   xen_mk_ullong(0x0200000000)
>>
>> While the possible new DT bindings has not been agreed yet, I re-used 
>> existing "reg" property under the hypervisor node to pass safe range 
>> as a second region,
>> https://elixir.bootlin.com/linux/v5.14-rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10: 
>
>
> So a single region works for a guest today, but for dom0 we will need 
> multiple regions because it is may be difficult to find enough 
> contiguous space for a single region.
>
> That said, as dom0 is mapped 1:1 (including some guest mapping), there 
> is also the question where to allocate the safe region. For grant 
> table, we so far re-use the Xen address space because it is assumed it 
> will space will always be bigger than the grant table.

Oh, I see. Indeed, it is unclear at the moment. Agree, the possibility 
to provide multiple ranges should be envisaged.


>
>
> I am not sure yet where we could allocate the safe regions. Stefano, 
> do you have any ideas?
>
>>
>>
>>
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -735,9 +735,11 @@ static int make_hypervisor_node(libxl__gc *gc, 
>> void *fdt,
>>                                 "xen,xen");
>>       if (res) return res;
>>
>> -    /* reg 0 is grant table space */milat
>> +    /* reg 0 is grant table space, reg 1 is safe range */
>>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>> GUEST_ROOT_SIZE_CELLS,
>> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>> +                            2,
>> +                            GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE,
>> +                            GUEST_SAFE_RANGE_BASE, 
>> GUEST_SAFE_RANGE_SIZE);
>>       if (res) return res;
>>
>>       /*
>>
>>
>> /* Resulting hypervisor node */
>>
>>   hypervisor {
>>                  interrupts = <0x01 0x0f 0xf08>;
>>                  interrupt-parent = <0xfde8>;
>>                  compatible = "xen,xen-4.16\0xen,xen";
>>                  reg = <0x00 0x38000000 0x00 0x1000000 0xde 0x00 0x02 
>> 0x00>;
>>   };
>>
>>
>> Near the same I did for the Xen itself to insert a range for Dom0. 
>> The Linux side change is just to retrieve a range from DTB instead of 
>> issuing a hypercall.
>>
>> Sorry, I might miss some important bits here, but from what I wrote 
>> about the "reg" purpose, it seems it could be suitable for us, why 
>> actually not? Why do we need yet another binding?
>> I noticed, Linux on Arm doesn't use it at all, probably it is used by 
>> other OSes, I don't know.
>
> Linux used the range until 4.7. This was dropped by commit 
> 3cf4095d7446efde28b48c26050b9db6f0bcb004 so the same code can be used 
> by ACPI and DT. However, looking at this now, I think this was a bad 
> decision because it means we are shattering superpages.

Yes, the another benefit of this enabling work (besides avoid wasting 
real domain pages) would be avoid shattering superpages, and as the 
result the I/O performance for the DMA devices behind the IOMMU would be 
slightly better, I hope.


>
>
> So ideally we should switch back the region to use the safe address 
> space once this is in place.

Yes.


>
>
>>
>> Now, I am wondering, would it be possible to update/clarify the 
>> current "reg" purpose and use it to pass a safe unallocated space for 
>> any Xen specific mappings (grant, foreign, whatever) instead of just 
>> for the grant table region. In case, it is not allowed for any reason 
>> (compatibility PoV, etc), would it be possible to extend a property 
>> by passing an extra range separately, something similar to how I 
>> described above?
>
> I think it should be fine to re-use the same region so long the size 
> of the first bank is at least the size of the original region.

ok


>
> I also think we should be able to add extra regions as OSes are 
> unlikely to enforce that the "reg" contains a single region.
>
> That said, we need to be careful about new guests as the region may be 
> quite small on older Xen. 

Agree.


> So we would need some heuristic to decide whether to stole some RAM or 
> use the safe space.
> Another possibility would be to add a new compatible in the DT that 
> indicates the region is "big" enough.
I like the last idea, did you perhaps mean new property (optional) 
rather than new compatible? Let's say "xen, safe-range" or "xen, 
extended-regions"  ...
That sign would suggest us how to operate: either pick up safe range(s) 
or behave as usual (stole real pages) as existing region is indeed small 
- 16MB (if I am not mistaken), this would work with old and new Xen.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


