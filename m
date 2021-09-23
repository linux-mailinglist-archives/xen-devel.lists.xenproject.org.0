Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8738E415BCB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193613.344874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLhO-0005Ln-Cy; Thu, 23 Sep 2021 10:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193613.344874; Thu, 23 Sep 2021 10:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLhO-0005K2-9o; Thu, 23 Sep 2021 10:11:26 +0000
Received: by outflank-mailman (input) for mailman id 193613;
 Thu, 23 Sep 2021 10:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTLhN-0005Jw-Ef
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:11:25 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 708c158c-bf1e-4faa-986c-5c2c35e1d155;
 Thu, 23 Sep 2021 10:11:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e15so24433785lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 03:11:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f9sm415449lfp.273.2021.09.23.03.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:11:22 -0700 (PDT)
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
X-Inumbo-ID: 708c158c-bf1e-4faa-986c-5c2c35e1d155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=58SO+4woagQ86uv4XxkGyEU8aiY2WBIAciBZUmjfyug=;
        b=qcVcAJQL15o6NrXEqJPmGIba+258GyoDtWJwDuXzHlwzhyQo9a+q59/KZ2RYGMl68L
         gSPF0TxZf3FcXHk5DXmz6wmsXD9dg57PGg4USFKFrKxqupkL9YNl+AfpxVCbIUtfu/kg
         h7G4vJD4H7ptsUreuZUassCcJTo3lxD3opkim0ljpJNsFhncGGnqtMS6ydUsOvPgxHi8
         brMAYsK3q8KM52fA+5S7MR+0PGX+EUHOnv+vI/vKuNw5KBrT2YGM0Xh4hHX6+7NVkuAB
         Th/vhcsbp2BjiJ9KGiCMDFmZYP29cZIVIVBJyglrAL0l4twEkRJTIoQzCz9PgALDEmoV
         cWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=58SO+4woagQ86uv4XxkGyEU8aiY2WBIAciBZUmjfyug=;
        b=P0ZHWWb201Z4NcoVz76qcneWuqUNKoID8SIOEPtjlwJyvAUcIKlCdBbYYXfvr8GBpk
         rUR6ENAs+UFUXypF4buZ4Mja+ZpbD5yCljNky/hz+kAt03n9CVS3GMzKfUDUt2z8D0QD
         gwYiqopXWG33TLPEXTj+52xkqY/kNVr9yBB3gO5Chx1l8IOXff1SKF9zxcrx9UUWJJeS
         4dkLIssNxC1E+tqXXPybdHT5834ku3hHlh/JbAlyzuvvRUpBRTpkzZ6zG/jKW5mppgbl
         ELVFz7BKixfyrgnLRMTKF2Cc69apU/JBZ6rPFkH4MboBdYLlqA5CEeEIhLlNqHMJspgc
         6deQ==
X-Gm-Message-State: AOAM532460+g6qZVmamvs1hMvureNbyV+cmK9Yh4wiIu5jt8cp39tzt0
	zElBeRY+IUG7ZQ2KMI4MqlGvBa733WU=
X-Google-Smtp-Source: ABdhPJxSevTTO33/ebEkxxR+OtI6fwGm4CN/VcYyiJHTl8C3q5NnS33dWI/AHtiHCqQjdjlcLRzqXg==
X-Received: by 2002:a2e:80ca:: with SMTP id r10mr4213837ljg.347.1632391883160;
        Thu, 23 Sep 2021 03:11:23 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <a993466f-1b7d-ceb3-aa3b-16f5f145b2fb@gmail.com>
 <a3f5707b-b161-1c94-ebe1-d6b8bbe11081@gmail.com>
 <alpine.DEB.2.21.2109221402420.17979@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <90071fcd-e7d8-3075-e235-44580d1434e1@gmail.com>
Date: Thu, 23 Sep 2021 13:11:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109221402420.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.09.21 00:05, Stefano Stabellini wrote:

Hi Stefano

> On Wed, 22 Sep 2021, Oleksandr wrote:
>>>>>> You will also need to cover "ranges" that will describe the BARs for
>>>>>> the PCI
>>>>>> devices.
>>>>> Good point.
>>>> Yes, very good point!
>>>>
>>>>
>>>>> Could you please clarify how to recognize whether it is a PCI
>>>>> device as long as PCI support is not merged? Or just to find any device
>>>>> nodes
>>>>> with non-empty "ranges" property
>>>>> and retrieve addresses?
>>>> Normally any bus can have a ranges property with the aperture and
>>>> possible address translations, including /amba (compatible =
>>>> "simple-bus"). However, in these cases dt_device_get_address already
>>>> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
>>>>
>>>> The PCI bus is special for 2 reasons:
>>>> - the ranges property has a different format
>>>> - the bus is hot-pluggable
>>>>
>>>> So I think the only one that we need to treat specially is PCI.
>>>>
>>>> As far as I am aware PCI is the only bus (or maybe just the only bus
>>>> that we support?) where ranges means the aperture.
>>> Thank you for the clarification. I need to find device node with non-empty
>>> ranges property
>>> (and make sure that device_type property is "pci"), after that I need to
>>> read the context of ranges property and translate it.
>>>
>>>
>> OK, I experimented with that and managed to parse ranges property for PCI host
>> bridge node.
>>
>> I tested on my setup where the host device tree contains two PCI host bridge
>> nodes with the following:
>>
>> pcie@fe000000 {
>> ...
>>              ranges = <0x1000000 0x0 0x0 0x0 0xfe100000 0x0 0x100000 0x2000000
>> 0x0 0xfe200000 0x0 0xfe200000 0x0 0x200000 0x2000000 0x0 0x30000000 0x0
>> 0x30000000 0x0 0x8000000 0x42000000 0x0 0x38000000 0x0 0x38000000 0x0
>> 0x8000000>;
>> ...
>> };
>>
>> pcie@ee800000 {
>> ...
>>              ranges = <0x1000000 0x0 0x0 0x0 0xee900000 0x0 0x100000 0x2000000
>> 0x0 0xeea00000 0x0 0xeea00000 0x0 0x200000 0x2000000 0x0 0xc0000000 0x0
>> 0xc0000000 0x0 0x8000000 0x42000000 0x0 0xc8000000 0x0 0xc8000000 0x0
>> 0x8000000>;
>> ...
>> };
>>
>> So Xen retrieves the *CPU addresses* from the ranges:
>>
>> (XEN) dev /soc/pcie@fe000000 range_size 7 nr_ranges 4
>> (XEN) 0: addr=fe100000, size=100000
>> (XEN) 1: addr=fe200000, size=200000
>> (XEN) 2: addr=30000000, size=8000000
>> (XEN) 3: addr=38000000, size=8000000
>> (XEN) dev /soc/pcie@ee800000 range_size 7 nr_ranges 4
>> (XEN) 0: addr=ee900000, size=100000
>> (XEN) 1: addr=eea00000, size=200000
>> (XEN) 2: addr=c0000000, size=8000000
>> (XEN) 3: addr=c8000000, size=8000000
>>
>> The code below covers ranges property in the context of finding memory holes
>> (to be squashed with current patch):
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index d37156a..7d20c10 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -834,6 +834,8 @@ static int __init find_memory_holes(struct meminfo
>> *ext_regions)
>>       {
>>           unsigned int naddr;
>>           u64 addr, size;
>> +        const __be32 *ranges;
>> +        u32 len;
>>
>>           naddr = dt_number_of_address(np);
>>
>> @@ -857,6 +859,41 @@ static int __init find_memory_holes(struct meminfo
>> *ext_regions)
>>                   goto out;
>>               }
>>           }
>> +
>> +        /*
>> +         * Also looking for non-empty ranges property which would likely mean
>> +         * that we deal with PCI host bridge device and the property here
>> +         * describes the BARs for the PCI devices.
>> +         */
> One thing to be careful is that ranges with a valid parameter is not
> only present in PCI busses. It can be present in amba and other
> simple-busses too. In that case the format for ranges in simpler as it
> doesn't have a "memory type" like PCI.
>
> When you get addresses from reg, bus ranges properties are automatically
> handled for you.
>
> All of this to say that a check on "ranges" is not enough because it
> might capture other non-PCI busses that have a different, simpler,
> ranges format. You want to check for "ranges" under a device_type =
> "pci"; node.

ok, will do.


>
>
>> +        ranges = dt_get_property(np, "ranges", &len);
>> +        if ( ranges && len )
>> +        {
>> +            unsigned int range_size, nr_ranges;
>> +            int na, ns, pna;
>> +
>> +            pna = dt_n_addr_cells(np);
>> +            na = dt_child_n_addr_cells(np);
>> +            ns = dt_child_n_size_cells(np);
>> +            range_size = pna + na + ns;
>> +            nr_ranges = len / sizeof(__be32) / range_size;
>> +
>> +            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
>> +            {
>> +                /* Skip the child address and get the parent (CPU) address */
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
>> +                           start, end);
>> +                    goto out;
>> +                }
>> +            }
>> +        }
>>       }

-- 
Regards,

Oleksandr Tyshchenko


