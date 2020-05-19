Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4291D9E5E
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 20:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb6XI-0007p6-9W; Tue, 19 May 2020 18:00:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb6XG-0007oF-U0
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 18:00:14 +0000
X-Inumbo-ID: 96aa549e-99fa-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96aa549e-99fa-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 18:00:14 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: K5fX4F3VQg+Ua+ggxX2n0/rQf6qXrRkr2HvTisQ9WAYwW3I2M+xI5OUTrVBGc5x7w8tIYlNjm5
 gw57uLtW0UF3HAIAbYCYidUTG1h/p+fih1kReNqXPSoWcHmT1+nh0j29KBj01sLZGVHojOEUCL
 s8dJhzgXwTQGVz5RRvBygDWRoWQVyumhFfgIsk2mXoZhvLhg2k7BMwvepK/K4gIY5AGbGQSx6o
 laFcNYksRRVWm2DhkIm7PsDEAd88+P/BULF/wqc0MIdQPiTa1HfsFHiT96GKkCJv9alhB6E4CY
 FZ8=
X-SBRS: 2.7
X-MesageID: 17907427
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="17907427"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
 <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
 <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1808df24-ecde-97c6-c296-ecf385260395@citrix.com>
Date: Tue, 19 May 2020 19:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 17:09, Jan Beulich wrote:
> On 19.05.2020 17:33, Andrew Cooper wrote:
>> On 19/05/2020 15:48, Jan Beulich wrote:
>>> On 19.05.2020 16:11, Andrew Cooper wrote:
>>>> Given that shadow frames are limited to 44 bits anyway (and not yet
>>>> levelled safely in the migration stream), my suggestion for fixing this
>>>> was just to use one extra nibble for the extra 4 bits and call it done.
>>> Would you remind(?) me of where this 44-bit restriction is coming
>>> from?
>> From paging_max_paddr_bits(),
>>
>> /* Shadowed superpages store GFNs in 32-bit page_info fields. */
> Ah, that's an abuse of the backlink field. After some looking
> around I first thought the up field could be used to store the
> GFN instead, as it's supposedly used for single-page shadows
> only. Then however I found
>
> static inline int sh_type_has_up_pointer(struct domain *d, unsigned int t)
> {
>     /* Multi-page shadows don't have up-pointers */
>     if ( t == SH_type_l1_32_shadow
>          || t == SH_type_fl1_32_shadow
>          || t == SH_type_l2_32_shadow )
>         return 0;
>     /* Pinnable shadows don't have up-pointers either */
>     return !sh_type_is_pinnable(d, t);
> }
>
> It's unclear to me in which way SH_type_l1_32_shadow and
> SH_type_l2_32_shadow are "multi-page" shadows; I'd rather have
> expected all three SH_type_fl1_*_shadow to be. Tim?

I suspect the comment is incomplete, and should include "4k shadows
don't have up-pointers".

>
> In any event there would be 12 bits to reclaim from the up
> pointer - it being a physical address, there'll not be more
> than 52 significant bits.

Right, but for L1TF safety, the address bits in the PTE must not be
cacheable.

Currently, on fully populated multi-socket servers, the MMIO fastpath
relies on the top 4G of address space not being cacheable, which is the
safest we can reasonably manage.  Extending this by a nibble takes us to
16G which is not meaningfully less safe.

~Andrew

