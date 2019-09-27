Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C341C0CC3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 22:43:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDx1u-0003Q3-Jb; Fri, 27 Sep 2019 20:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZXP=XW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDx1t-0003Pu-5O
 for xen-devel@lists.xen.org; Fri, 27 Sep 2019 20:39:53 +0000
X-Inumbo-ID: f4cbd5a4-e166-11e9-9681-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id f4cbd5a4-e166-11e9-9681-12813bfff9fa;
 Fri, 27 Sep 2019 20:39:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CC3F205F4;
 Fri, 27 Sep 2019 20:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569616791;
 bh=TLZbimZxiESo2Xu2UFreUmoXXIwD3yd+mnVZS4THqpU=;
 h=Date:From:To:cc:Subject:From;
 b=bP+zNtYiLPGS1s2f02jhUJM7+GFgJHNTlHBnRjaOdvlWR0SR5ChsITAToOaqksfD4
 ZVqo1NY0HNEdOKrEMGL6w7g3rqRp0BoNxfbdhRc4XLC9H6g0K5BSGJBLIcw0KC/cmH
 DSZdsQFzr+2/NR/9WLKcHqP2phYJpxCceFuWBy+8=
Date: Fri, 27 Sep 2019 13:39:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com
Message-ID: <alpine.DEB.2.21.1909271333400.2594@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1866556690-1569616428=:2594"
Content-ID: <alpine.DEB.2.21.1909271333530.2594@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains (fwd)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien.Grall@arm.com, sstabellini@kernel.org, xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1866556690-1569616428=:2594
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1909271333531.2594@sstabellini-ThinkPad-T480s>

Hi Juergen,

This email is about the dom0less device assignment patch series. It is
very close to ready. I sent v6 yesterday addressing the remaining
comments from Julien. We are down to smaller details.

Oleksandr's iommu series got merged today. That requires a small changes
to the patch below.

I plan to send a v7 addressing the "merge conflict" and also addressing
any remaining points from Julien (Julien plans to give it a look before
Monday my time.)

I hope that's OK for you if we merge this series early next week.

Cheers,

Stefano

---------- Forwarded message ----------
Date: Fri, 27 Sep 2019 20:02:56 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
    "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
    Achin Gupta <Achin.Gupta@arm.com>,
    "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot domains

Hi,

On 27/09/2019 15:40, Oleksandr wrote:
> 
> On 26.09.19 00:12, Julien Grall wrote:
>> On 25/09/2019 19:49, Stefano Stabellini wrote:
>>> Scan the user provided dtb fragment at boot. For each device node, map
>>> memory to guests, and route interrupts and setup the iommu.
>>>
>>> The memory region to remap is specified by the "xen,reg" property.
>>>
>>> The iommu is setup by passing the node of the device to assign on the
>>> host device tree. The path is specified in the device tree fragment as
>>> the "xen,path" string property.
>>>
>>> The interrupts are remapped based on the information from the
>>> corresponding node on the host device tree. Call
>>> handle_device_interrupts to remap interrupts. Interrupts related device
>>> tree properties are copied from the device tree fragment, same as all
>>> the other properties.
>>>
>>> Also add the new flag XEN_DOMCTL_CDF_iommu to that dom0less domU can use
>>> the IOMMU.
>>>
>>> Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
>>> ---
>>> Changes in v5:
>>> - use local variable for name
>>> - use map_regions_p2mt
>>> - add warning for not page aligned addresses/sizes
>>> - introduce handle_passthrough_prop
>>>
>>> Changes in v4:
>>> - use unsigned
>>> - improve commit message
>>> - code style
>>> - use dt_prop_cmp
>>> - use device_tree_get_reg
>>> - don't copy over xen,reg and xen,path
>>> - don't create special interrupt properties for domU: copy them from the
>>>     fragment
>>> - in-code comment
>>>
>>> Changes in v3:
>>> - improve commit message
>>> - remove superfluous cast
>>> - merge code with the copy code
>>> - add interrup-parent
>>> - demove depth > 2 check
>>> - reuse code from handle_device_interrupts
>>> - copy interrupts from host dt
>>>
>>> Changes in v2:
>>> - rename "path" to "xen,path"
>>> - grammar fix
>>> - use gaddr_to_gfn and maddr_to_mfn
>>> - remove depth <= 2 limitation in scanning the dtb fragment
>>> - introduce and parse xen,reg
>>> - code style
>>> - support more than one interrupt per device
>>> - specify only the GIC is supported
>>> ---
>>>    xen/arch/arm/domain_build.c | 101 
>>> ++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 97 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 9d985d3bbe..414893bc24 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1701,6 +1701,85 @@ static int __init make_vpl011_uart_node(struct 
>>> kernel_info *kinfo)
>>>    }
>>>    #endif
>>> +/*
>>> + * Scan device tree properties for passthrough specific information.
>>> + * Returns -ENOENT when no passthrough properties are found
>>> + *         < 0 on error
>>> + *         0 on success
>>> + */
>>> +static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>> +                                          const struct fdt_property 
>>> *prop,
>>> +                                          const char *name,
>>> +                                          uint32_t address_cells, 
>>> uint32_t size_cells)
>>> +{
>>> +    const __be32 *cell;
>>> +    unsigned int i, len;
>>> +    struct dt_device_node *node;
>>> +    int res;
>>> +
>>> +    /* xen,reg specifies where to map the MMIO region */
>>> +    if ( dt_prop_cmp("xen,reg", name) == 0 )
>>> +    {
>>> +        paddr_t mstart, size, gstart;
>>> +        cell = (const __be32 *)prop->data;
>>> +        len = fdt32_to_cpu(prop->len) /
>>> +            ((address_cells * 2 + size_cells) * sizeof(uint32_t));
>>> +
>>> +        for ( i = 0; i < len; i++ )
>>> +        {
>>> +            device_tree_get_reg(&cell, address_cells, size_cells,
>>> +                    &mstart, &size);
>>> +            gstart = dt_next_cell(address_cells, &cell);
>>> +
>>> +            if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size 
>>> & ~PAGE_MASK )
>>> +                dprintk(XENLOG_WARNING,
>>> +                        "DomU passthrough config has not page 
>>> aligned addresses/sizes\n");
>> I don't think this is wise to continue, the more this is a printk that
>> can only happen in debug build. So someone using a release build may not
>> notice the error.
>>
>> So I think this wants to be a printk(XENLOG_ERR,...) and also return an
>> error.
>>
>>> +
>>> +            res = map_regions_p2mt(kinfo->d,
>>> +                    gaddr_to_gfn(gstart),
>>> +                    PFN_DOWN(size),
>>> +                    maddr_to_mfn(mstart),
>>> +                    p2m_mmio_direct_dev);
>> Coding style.
>>
>>> +            if ( res < 0 )
>>> +            {
>>> +                dprintk(XENLOG_ERR,
>>> +                        "Failed to map %"PRIpaddr" to the guest 
>>> at%"PRIpaddr"\n",
>>> +                        mstart, gstart);
>> Similarly, this wants to be a printk.
>>
>>> +                return -EFAULT;
>>> +            }
>>> +        }
>>> +
>>> +        return 0;
>>> +    }
>>> +    /*
>>> +     * xen,path specifies the corresponding node in the host DT.
>>> +     * Both interrupt mappings and IOMMU settings are based on it,
>>> +     * as they are done based on the corresponding host DT node.
>>> +     */
>>> +    else if ( dt_prop_cmp("xen,path", name) == 0 )
>>> +    {
>>> +        node = dt_find_node_by_path(prop->data);
>>> +        if ( node == NULL )
>>> +        {
>>> +            dprintk(XENLOG_ERR, "Couldn't find node %s in host_dt!\n",
>>> +                    (char *)prop->data);
>> Same here.
>>
>>> +            return -EINVAL;
>>> +        }
> 
> I have to admit that I don't know about dom0less feature enough ...
> 
> 
> But, shouldn't we check if the device is behind the IOMMU and try to add 
> it (iommu_add_dt_device) before assigning it (this is needed for drivers 
> which support generic IOMMU DT bindings in the first place).
> 
> [please take a look at 
> https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02714.html 
> if so]
> 
> Julien, what do you think?

Yes you are right.

@Stefano, this is a recently merged feature. Without it, you will not be 
able to use passthrough with dom0less guest when the IOMMU (such as 
IPMMU) is using the generic DT bindings.

Cheers,

-- 
Julien Grall
--8323329-1866556690-1569616428=:2594
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1866556690-1569616428=:2594--

