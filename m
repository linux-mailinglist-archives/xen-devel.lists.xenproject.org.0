Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BD1D9B57
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4FB-0001NB-AP; Tue, 19 May 2020 15:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb4FA-0001N3-5t
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:33:24 +0000
X-Inumbo-ID: 131064de-99e6-11ea-b07b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 131064de-99e6-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:33:23 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bhOoR8XA0PDJ8HCZobthv2CoaFFacnY5R6GzLR3CPfpHfNOt3VWEsRZk/AWHaZIQxiZfu8bjcu
 fysGA41uJTaL2vZs1h62pDb6h2iGMchgtgEBKwlQ67wD7xk559ysTh5BrYvwZ+JUopWFm9UnKF
 8W+6nP3BPgIeJp6H8iHRVPkzhFZZPYE1R2Akff1Gl2z33zOiZ6gLvU1KPKzHKN8w5jQiALCB4B
 ciN9ahghIGRSOmc3KWvoDTrlCCvWPp5dpuBP8L/6WDxIUMN/Ip9/bnKVUI5cJ4fRewJ8NQEneH
 pkM=
X-SBRS: 2.7
X-MesageID: 18176037
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18176037"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
Date: Tue, 19 May 2020 16:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3088e420-a72a-1b2d-144f-115610488418@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 19/05/2020 15:48, Jan Beulich wrote:
> On 19.05.2020 16:11, Andrew Cooper wrote:
>> On 19/05/2020 09:34, Jan Beulich wrote:
>>> On 18.05.2020 17:38, Andrew Cooper wrote:
>>>> @@ -1439,6 +1418,18 @@ void do_page_fault(struct cpu_user_regs *regs)
>>>>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>>>>          return;
>>>>  
>>>> +    /*
>>>> +     * Xen have reserved bits in its pagetables, nor do we permit PV guests to
>>>> +     * write any.  Such entries would be vulnerable to the L1TF sidechannel.
>>>> +     *
>>>> +     * The only logic which intentionally sets reserved bits is the shadow
>>>> +     * MMIO fastpath (SH_L1E_MMIO_*), which is careful not to be
>>>> +     * L1TF-vulnerable, and handled via the VMExit #PF intercept path, rather
>>>> +     * than here.
>>> What about SH_L1E_MAGIC and sh_l1e_gnp()? The latter gets used by
>>> _sh_propagate() without visible restriction to HVM.
>> SH_L1E_MAGIC looks to be redundant with SH_L1E_MMIO_MAGIC. 
>> sh_l1e_mmio() is the only path which ever creates an entry like that.
>>
>> sh_l1e_gnp() is a very well hidden use of reserved bits, but surely
>> can't be used for PV guests, as there doesn't appear to be anything to
>> turn the resulting fault back into a plain not-present.
> Well, in this case the implied question remains: How does this fit
> with what _sh_propagate() does?

I'm in the process of investigating.

>>> And of course every time I look at this code I wonder how we can
>>> get away with (quoting a comment) "We store 28 bits of GFN in
>>> bits 4:32 of the entry." Do we have a hidden restriction
>>> somewhere guaranteeing that guests won't have (emulated MMIO)
>>> GFNs above 1Tb when run in shadow mode?
>> I've raised that several times before.  Its broken.
>>
>> Given that shadow frames are limited to 44 bits anyway (and not yet
>> levelled safely in the migration stream), my suggestion for fixing this
>> was just to use one extra nibble for the extra 4 bits and call it done.
> Would you remind(?) me of where this 44-bit restriction is coming
> from?

From paging_max_paddr_bits(),

/* Shadowed superpages store GFNs in 32-bit page_info fields. */

~Andrew

