Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BD3E0A34
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 00:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164051.300250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBOwh-00029V-88; Wed, 04 Aug 2021 22:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164051.300250; Wed, 04 Aug 2021 22:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBOwh-00027h-44; Wed, 04 Aug 2021 22:01:03 +0000
Received: by outflank-mailman (input) for mailman id 164051;
 Wed, 04 Aug 2021 22:01:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mBOwg-00027b-21
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 22:01:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBOwZ-0000Om-Ol; Wed, 04 Aug 2021 22:00:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBOwZ-0002XY-HX; Wed, 04 Aug 2021 22:00:55 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PhtHb0fH5uzPHc+G1BN+2TRpQFSqDERkSeqyM7kkAjI=; b=OSWJc/bCUhnJcI9Q+/Xe3YKYQy
	pKswQnB8T/e4ss0yCxkKQJKhqNuSrlMYNJ21L3DheQOX1SUOGi8J+OsY029l3T8vVorrw1c6z12oz
	bplSumIv5zFMVpfBLOSlH23x3TIVstZgZfGtO0+o6D184Hh4tR7Bo5bpXDPlpGJELmJ4=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
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
From: Julien Grall <julien@xen.org>
Message-ID: <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
Date: Wed, 4 Aug 2021 23:00:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 04/08/2021 21:56, Oleksandr wrote:
> 
> Hi Julien, Stefano.

Hi Oleksandr,

> 
> On 02.08.21 22:12, Oleksandr wrote:
> I have done some experiments with Xen and toolstack according to the 
> discussion above. So, I re-used DTB to pass a safe range to the domain. 
> For the range I borrowed some space from the second RAM bank.
> 
> -#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM 
> @ 8GB */
> -#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 888GB of RAM @ 
> 8GB */
> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xDE00000000)
> +

I am a bit split with reducing the amount of RAM. On one hand large 
guest is not unheard on the server side (at least in the x86 world). On 
the other hand, I am not aware of anyone using Xen on Arm in such setup.

So technically this will be a regression, but it may be OK.

Regarding the range, this will be a problem as Xen configure the number 
of the IPA bits based on the PA bits. The lowest possible address space 
ize on 64-bit is 4GB.

 From my understanding, this is because the number of IPA bits supported 
is contrained by the PA bits. So the position and the size of the region
would need to depend on the P2M configuration.

For simplicity, this could be the last few X bytes of the supported 
address space.

For 32-bit domain, we also need to make sure the address is usable for 
domain short page tables (not too long ago Debian was shipping the 
kernel with them rather than LPAE). I haven't yet checked what's the 
limit here.

> +#define GUEST_SAFE_RANGE_BASE   xen_mk_ullong(0xDE00000000) /* 128GB */
> +#define GUEST_SAFE_RANGE_SIZE   xen_mk_ullong(0x0200000000)
> 
> While the possible new DT bindings has not been agreed yet, I re-used 
> existing "reg" property under the hypervisor node to pass safe range as 
> a second region,
> https://elixir.bootlin.com/linux/v5.14-rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10: 

So a single region works for a guest today, but for dom0 we will need 
multiple regions because it is may be difficult to find enough 
contiguous space for a single region.

That said, as dom0 is mapped 1:1 (including some guest mapping), there 
is also the question where to allocate the safe region. For grant table, 
we so far re-use the Xen address space because it is assumed it will 
space will always be bigger than the grant table.

I am not sure yet where we could allocate the safe regions. Stefano, do 
you have any ideas?

> 
> 
> 
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -735,9 +735,11 @@ static int make_hypervisor_node(libxl__gc *gc, void 
> *fdt,
>                                 "xen,xen");
>       if (res) return res;
> 
> -    /* reg 0 is grant table space */milat
> +    /* reg 0 is grant table space, reg 1 is safe range */
>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
> GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +                            2,
> +                            GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE,
> +                            GUEST_SAFE_RANGE_BASE, GUEST_SAFE_RANGE_SIZE);
>       if (res) return res;
> 
>       /*
> 
> 
> /* Resulting hypervisor node */
> 
>   hypervisor {
>                  interrupts = <0x01 0x0f 0xf08>;
>                  interrupt-parent = <0xfde8>;
>                  compatible = "xen,xen-4.16\0xen,xen";
>                  reg = <0x00 0x38000000 0x00 0x1000000 0xde 0x00 0x02 
> 0x00>;
>   };
> 
> 
> Near the same I did for the Xen itself to insert a range for Dom0. The 
> Linux side change is just to retrieve a range from DTB instead of 
> issuing a hypercall.
> 
> Sorry, I might miss some important bits here, but from what I wrote 
> about the "reg" purpose, it seems it could be suitable for us, why 
> actually not? Why do we need yet another binding?
> I noticed, Linux on Arm doesn't use it at all, probably it is used by 
> other OSes, I don't know.

Linux used the range until 4.7. This was dropped by commit 
3cf4095d7446efde28b48c26050b9db6f0bcb004 so the same code can be used by 
ACPI and DT. However, looking at this now, I think this was a bad 
decision because it means we are shattering superpages.

So ideally we should switch back the region to use the safe address 
space once this is in place.

> 
> Now, I am wondering, would it be possible to update/clarify the current 
> "reg" purpose and use it to pass a safe unallocated space for any Xen 
> specific mappings (grant, foreign, whatever) instead of just for the 
> grant table region. In case, it is not allowed for any reason 
> (compatibility PoV, etc), would it be possible to extend a property by 
> passing an extra range separately, something similar to how I described 
> above?

I think it should be fine to re-use the same region so long the size of 
the first bank is at least the size of the original region.

I also think we should be able to add extra regions as OSes are unlikely 
to enforce that the "reg" contains a single region.

That said, we need to be careful about new guests as the region may be 
quite small on older Xen. So we would need some heuristic to decide 
whether to stole some RAM or use the safe space.

Another possibility would be to add a new compatible in the DT that 
indicates the region is "big" enough.

Cheers,

-- 
Julien Grall

