Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6E2748AD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnWD-0004BD-Dg; Tue, 22 Sep 2020 19:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKnWC-0004B8-Gg
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:00:00 +0000
X-Inumbo-ID: ff84ae08-30b6-4be0-9b35-14965431f702
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff84ae08-30b6-4be0-9b35-14965431f702;
 Tue, 22 Sep 2020 18:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600801199;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VqJvCtvjwAIbOsWBY40ViEpf7SaIpkjBAdj2j0J8D64=;
 b=Hdo6XJwPhhDdj9rAsJGHpTDP8ZauwCEY1vQBSwN2eyZyR3opU5KC6DH0
 E8rcn48nhA0vSfBknDfzzjwvys5NfmML1G9rQi8VXT2mChnya/V5hZayB
 GYq6DXE/7NADPgcuw1yxo4skqxfMH3sTeU3uZJv4An4iLgj3bkkvkV7gH k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FrOaFUoFnH7sH/qyNWiCdZoRBHPDC01sGmNfy2ztX0mAMgJdmiAKjCVysF1Q21DUQZ8l5bX638
 qClajq0E6hft7EKwqbflb4rAJMqk+MofFEGeqenIv3ZbHhbGItcgtsf9Bk60D+Q+sJ5sSiEtZj
 D1lzZTmByngUV539AkB94WimBbXYVhS5EUsxbRejDcak+9mV13xUnTuVmZ5NEMcnH6qHoVSKxl
 4ghymkmq13DhgfmzKImhbGDpxTLh7z1Av5+DeiaXOJNWf1uDmyX2q8eC2zoUAFMV+WdPm15TVs
 Cgs=
X-SBRS: 2.7
X-MesageID: 27402629
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27402629"
Subject: Re: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas.lengyel@intel.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-5-julien@xen.org>
 <26387b5d-97f7-3c6a-ad40-94b144a3b0ae@suse.com>
 <e0a73d9b-5c68-9b57-dfe4-34e91b0972bd@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3778eaa1-c1cc-d458-407f-e5ca3ca028ab@citrix.com>
Date: Tue, 22 Sep 2020 19:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0a73d9b-5c68-9b57-dfe4-34e91b0972bd@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/09/2020 19:39, Julien Grall wrote:
> Hi Jan,
>
> On 22/09/2020 09:02, Jan Beulich wrote:
>> On 21.09.2020 20:02, Julien Grall wrote:
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -685,4 +685,17 @@ static inline void put_page_alloc_ref(struct
>>> page_info *page)
>>>       }
>>>   }
>>>   +/*
>>> + * Dummy implementation of M2P-related helpers for common code when
>>> + * the architecture doesn't have an M2P.
>>> + */
>>> +#ifndef CONFIG_HAS_M2P
>>> +
>>> +#define INVALID_M2P_ENTRY        (~0UL)
>>> +#define SHARED_M2P(_e)           false
>>> +
>>> +static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned
>>> long pfn) {}
>>
>> While I think this would better BUG() or at least ASSERT_UNREACHABLE(),
>> I realize its use in page_alloc.c prevents this. However, if this was a
>> macro, I think the need for having INVALID_P2M_ENTRY would vanish, as
>> long as the stub macro didn't evaluate its 2nd argument.
> This is not very future proof... The cost of defining
> INVALID_M2P_ENTRY is very minimal compare to the damage that may
> result from this choice.
>
>> I'm feeling somewhat uneasy with the SHARED_M2P() definition: This
>> would seem to better be tied to CONFIG_MEM_SHARING rather than M2P
>> existence.
>
> I can see pros and cons in both solution. To me it contains the word
> "M2P" so it makes sense to be protected by HAS_M2P.
>
> If someone else think that it should be protected by
> CONFIG_MEM_SHARING, then I will do the change.
>
> I have added Tamas to give him an opportunity to share his view.

This is clearly guarded by HAS_M2P first first and foremost.

However, the work to actually let MEM_SHARING be turned off in this
regard is rather larger, and not appropriate to delay this series with.

~Andrew

