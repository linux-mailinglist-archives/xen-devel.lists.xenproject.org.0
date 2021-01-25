Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964C302320
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 10:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73932.132872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xtC-0000XK-DR; Mon, 25 Jan 2021 09:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73932.132872; Mon, 25 Jan 2021 09:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xtC-0000Wu-98; Mon, 25 Jan 2021 09:10:26 +0000
Received: by outflank-mailman (input) for mailman id 73932;
 Mon, 25 Jan 2021 09:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3xtA-0000Wp-8E
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 09:10:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3932e87b-b94c-40d9-8606-23db11b36836;
 Mon, 25 Jan 2021 09:10:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F84BAB9F;
 Mon, 25 Jan 2021 09:10:20 +0000 (UTC)
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
X-Inumbo-ID: 3932e87b-b94c-40d9-8606-23db11b36836
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611565820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TJgoVs/WzEQIWDeuxumMsM8gUlVDXVf4LeEwKWMXp4=;
	b=TiMRqMMaIarmeGog18mxpiD9k/3+53FfOJyZmWviCMFcg6QbJepNsKvIiSizZd9I2V4cra
	JWO8By94DXL51EoLnneKsTci4M5a7KCDrpEhzAVcRN/7r6xl0xYrfiDVJKyahDICELWZZu
	oQpaJmiAfZc9vSnluDDnotXoY3pkmPk=
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr <olekstysh@gmail.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
 <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
 <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
 <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
 <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
 <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
 <257224ea-4ba3-302e-e198-e92c8c1036b3@suse.com>
 <898d609c-8652-e43d-4400-27986cc37371@gmail.com>
 <9523a20e-0b26-51b4-a13a-5767584389cf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1871bc85-613a-5461-e428-d880c4fa95de@suse.com>
Date: Mon, 25 Jan 2021 10:10:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9523a20e-0b26-51b4-a13a-5767584389cf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.01.2021 14:22, Julien Grall wrote:
> On 13/01/2021 15:06, Oleksandr wrote:
>> On 12.01.21 13:58, Jan Beulich wrote:
>>> On 11.01.2021 09:23, Oleksandr wrote:
>>>> On 11.01.21 09:41, Jan Beulich wrote:
>>>>> If you could also provide your exact .config, I could see whether I
>>>>> can repro here with some of the gcc5 versions I have laying around.
>>>> Please see attached
>>> Builds perfectly fine with 5.4.0 here.
>>
>> Thank you for testing.
>>
>>
>> I wonder whether I indeed missed something. I have switched to 5.4.0 
>> again (from 9.3.0) and rechecked, a build issue was still present.
>> I even downloaded 5.4.0 sources and built them to try to build Xen, and 
>> got the same effect.  What I noticed is that for non-debug builds the 
>> build issue wasn't present.
>> Then I decided to build today's staging 
>> (414be7b66349e7dca42bc1fd47c2b2f5b2d27432 xen/memory: Fix compat 
>> XENMEM_acquire_resource for size requests) instead of 9-day's old one when
>> I had initially reported about that build issue 
>> (7ba2ab495be54f608cb47440e1497b2795bd301a x86/p2m: Fix 
>> paging_gva_to_gfn() for nested virt). Today's staging builds perfectly 
>> fine with 5.4.0.
>> It seems that commit in the middle 
>> (994f6478a48a60e3b407c7defc2d36a80f880b04 xsm/dummy: harden against 
>> speculative abuse) indirectly fixes that weird build issue with 5.4.0...
> 
> The gitlab CI reported a similar issue today (see [1]) when building 
> with randconfig ([2]). This is happening on Debian sid with GCC 9.3.
> 
> Note that the default compiler on sid is GCC 10.2.1. So you will have to 
> install the package gcc-9 and then use CC=gcc-9 make <...>.
> 
> 
>  From a local repro, I get the following message:
> 
> ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
> /root/xen/xen/common/memory.c:942: undefined reference to 
> `xenmem_add_to_physmap_one'
> /root/xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated 
> to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
> prelink-efi.o: in function `xenmem_add_to_physmap_batch':
> /root/xen/xen/common/memory.c:942: undefined reference to 
> `xenmem_add_to_physmap_one'
> make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
> make[2]: *** Waiting for unfinished jobs....
> ld: /root/xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' 
> isn't defined
> ld: final link failed: bad value
> 
> 
> This points to the call in xenmem_add_to_physmap_batch(). I have played 
> a bit with the .config options. I was able to get it built as soon as I 
> disabled CONFIG_COVERAGE=y.
> 
> So maybe the optimizer is not clever enough on GCC 9 when building with 
> coverage enabled?
> 
> With the diff below applied (borrowed from 
> xenmem_add_to_physmap_batch()), I can build without tweaking the .config 
> [1]:
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index ccb4d49fc6..5cfd36a53d 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -903,6 +903,12 @@ static int xenmem_add_to_physmap_batch(struct 
> domain *d,
>   {
>       union add_to_physmap_extra extra = {};
> 
> +    if ( !paging_mode_translate(d) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EACCES;
> +    }
> +
>       if ( unlikely(xatpb->size < extent) )
>           return -EILSEQ;

Interesting. So despite the function being static and
xatp_permission_check() already doing this check, the function
doesn't get squashed. Looking at my gcov build this might be
due to xatp_permission_check() not getting inlined in this
case, but I will need to try one with HVM=n to be certain. In
any event, I wouldn't mind the above as a workaround to the
issue, as long as its description makes clear this is a
workaround only.

Thanks for investigating!

Jan

