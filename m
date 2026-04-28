Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGW5G8r/8GnubgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:43:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3948AC9D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296792.1573040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHnOb-000707-L1; Tue, 28 Apr 2026 18:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296792.1573040; Tue, 28 Apr 2026 18:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHnOb-0006yl-Hw; Tue, 28 Apr 2026 18:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1296792;
 Tue, 28 Apr 2026 18:42:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wHnOa-0006yf-Eg
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 18:42:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHnOZ-0016CI-Nt
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 20:42:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69f0ff91-e002-0a2a0a5209dd-0a2a4509b0de-46
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:42:55 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69f0ffaf-2497-0a2a45090019-d155802ba4dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:42:55 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4891f625344so1238975e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 11:42:55 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463f5b50c1sm7956944f8f.17.2026.04.28.11.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 11:42:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777401775; x=1778006575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tD82TwXrtGZ74IDr0qx9ZcfUGlPHwnEGUoJd7VCUs2U=;
        b=Up4TOyfAFSPwLAU/R57FEAYduFFYyzy3kWr3FepOKyJQN0lGXP+r4Siy0FyG6NRsiL
         gcOVr2V5x1SDapd3H7TPK0mK3ztGHH2m40BjyJ9LQfjffy/WJfZ2ggXBlsM2StAaJnHC
         ru7ZeRuhUTjyMlT8AR+ahDIOQpMOfSN/xTTRN6xMZRGR8yS7Y3wbCwGpMVPpJdUTMlU4
         xX8zCiz5tJnuMvt+7Obs6IMPH4TsBTwB0I74aZW6p7YzSr9c4i/auuV2a2bNfOTUkAKg
         V1KGn8TxHEmS8oBmRIxqY7C+Zj4Kkuha4WH4VexfjGf9DGCWnaafSUZ0t2Pn3UKNS7c/
         fStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401775; x=1778006575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD82TwXrtGZ74IDr0qx9ZcfUGlPHwnEGUoJd7VCUs2U=;
        b=MDLQhuY1yZSEWaEF3VOP17qy2C0gsvsf0T4UfwLypo6y+DyufMYM3I5/qUM7mcJFA/
         KSHO+XCFFFVDeiVagLrB9FT4O2oqBDNt1780b0BCGOPPcdL54gZ2bYlIcHBUAMhe390v
         9Qncw7JzthBZu9isFF0yA/fhdv96L62c9DZ1SGbPZ2DgxYkCDSxT9shMUi1Is51GNGcT
         CYTo4/hsu2SAD7JuD4X+gxGQZueViVmOfttI6EHdCwcnJPeQbfBgiVYBkHAo9iZvyiUk
         8Hxq0R2GhdWkrpQ3my1dAsQJHiAJdoH5Y2Z5//VCAUTL7WvD/66gFdLeDsTlPx+lyOMv
         /sHQ==
X-Gm-Message-State: AOJu0YxSydgDPUKjRp7PN/ZkUufONcPXluapilPC1olHFH+FyB9tAXNf
	75Q7cAh14v5L5oQZcLzOrTXpDL34vSC8CMFofHu1o5cue+/R2sDuoiNi
X-Gm-Gg: AeBDiev+5cLyjjjpxJAdC3lqydZsXpqtKp0irJ+JAx0oVh8V10UL7d6Xp447/z5e0IE
	/Moow5/3xc7FVrpYSYWZUrgMtrXckYF3KLSaqCmHikCKF94HrJLlTzSNtFcTyGhwyxk9njDxNDj
	3gi7R03FJGy9YmuxVDlOeZUanfRMm6wT07din7mOPrft49+C9WukY5G2EGXnEo36r4ltYyjmWpe
	P9psdnha7BeuUhmJlOeA4lZvnxlEG2VD0NwZ+yFYVfLFM8LbPaDRwktZG+vQEsbdPxIgE+fPb9m
	GaykDMUd+wMG/FBmSumnHAZLikpbblVXvXW5I/4m8tNPyodUgjB3WXq5po9vFfyDkk5+8PowmzE
	5lKZFcpcNM8pfBR6tEAr7IBRnYgo9nttJ4jEybKFuGvbNgmBs/MTN3JuLtdsjhGFK7D1a4ORXWs
	vcG2PcmXGvHxolqKHJpCcFGQnl4LBUKD4k7xP36pVRIkskp8zHVzTDvXcPfMvb5tkf/A==
X-Received: by 2002:a05:600d:644e:20b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-48a7becf70cmr2362635e9.2.1777401774698;
        Tue, 28 Apr 2026 11:42:54 -0700 (PDT)
Message-ID: <20eaa31d-a105-440e-9add-968fc9786180@gmail.com>
Date: Tue, 28 Apr 2026 21:42:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/arm: its: collect quirk flags and honor
 dma-noncoherent
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <Mykola_Kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
 <5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
 <87bjgcvul6.fsf@epam.com>
 <CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777401775-93175A53-AA775135/0/0
X-purgate-type: clean
X-purgate-size: 6634
X-Rspamd-Queue-Id: F1D3948AC9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,epam.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.923];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]



On 3/25/26 17:47, Mykola Kvach wrote:
> Hi Volodymyr,

Hello Mykola and Volodymyr


> 
> Thank you for the review.
> 
> On Wed, Mar 25, 2026 at 4:42 PM Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com> wrote:
>>
>> Hi Mykola,
>>
>> Mykola Kvach <xakep.amatop@gmail.com> writes:
>>
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Replace the per-quirk init callback with declarative flags in
>>> struct its_quirk, and introduce gicv3_its_collect_quirks() to gather
>>> the effective workaround flags from both the IIDR-matched quirk entry
>>> and the "dma-noncoherent" device-tree property.
>>>
>>> This lets non-coherent platforms force non-cacheable ITS table
>>> attributes even when no IIDR quirk entry matches.
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>>   xen/arch/arm/gic-v3-its.c | 70 ++++++++++++++++++++++++---------------
>>>   1 file changed, 43 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
>>> index 9ba068c46f..00524b43a3 100644
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -57,71 +57,87 @@ struct its_device {
>>>    */
>>>   struct its_quirk {
>>>       const char *desc;
>>> -    bool (*init)(struct host_its *hw_its);
>>>       uint32_t iidr;
>>>       uint32_t mask;
>>> +    uint32_t flags;
>>>   };
>>>
>>>   static uint32_t __ro_after_init its_quirk_flags;
>>>
>>> -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
>>> -{
>>> -    its_quirk_flags |= HOST_ITS_WORKAROUND_NC_NS |
>>> -        HOST_ITS_WORKAROUND_32BIT_ADDR;
>>> -
>>> -    return true;
>>> -}
>>> -
>>>   static const struct its_quirk its_quirks[] = {
>>>       {
>>> -        .desc        = "R-Car Gen4",
>>> -        .iidr        = 0x0201743b,
>>> -        .mask        = 0xffffffffU,
>>> -        .init        = gicv3_its_enable_quirk_gen4,
>>> +        .desc  = "R-Car Gen4",
>>> +        .iidr  = 0x0201743b,
>>> +        .mask  = 0xffffffffU,
>>> +        .flags = HOST_ITS_WORKAROUND_NC_NS |
>>> +                 HOST_ITS_WORKAROUND_32BIT_ADDR,
>>>       },
>>>       {
>>>           /* Sentinel. */
>>>       }
>>>   };
>>>
>>> -static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
>>> +static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
>>>   {
>>> -    const struct its_quirk *quirks = its_quirks;
>>> +    const struct its_quirk *quirk = its_quirks;
>>>
>>> -    for ( ; quirks->desc; quirks++ )
>>> +    for ( ; quirk->desc; quirk++ )
>>>       {
>>> -        if ( quirks->iidr == (quirks->mask & iidr) )
>>> -            return (struct its_quirk *)quirks;
>>> +        if ( quirk->iidr != (quirk->mask & iidr) )
>>> +            continue;
>>> +
>>> +        return quirk;
>>>       }
>>>
>>>       return NULL;
>>>   }
>>>
>>> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
>>> +static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
>>> +                                         const struct its_quirk **matched_quirk)
>>>   {
>>> +    const struct its_quirk *quirk;
>>> +    uint32_t flags = 0;
>>>       uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
>>> -    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
>>>
>>> -    if ( quirk && quirk->init(hw_its) )
>>> +    quirk = gicv3_its_find_quirk(iidr);
>>> +    if ( quirk )
>>> +        flags |= quirk->flags;
>>> +
>>> +    if ( hw_its->dt_node &&
>>> +         dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
>>> +        flags |= HOST_ITS_WORKAROUND_NC_NS;
>>> +
>>> +    if ( matched_quirk )
>>> +        *matched_quirk = quirk;
>>> +
>>> +    return flags;
>>> +}
>>> +
>>> +static void gicv3_its_enable_quirks(struct host_its *hw_its)
>>> +{
>>> +    const struct its_quirk *quirk;
>>> +
>>> +    its_quirk_flags = gicv3_its_collect_quirks(hw_its, &quirk);
>>> +
>>> +    if ( quirk )
>>>           printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>>>   }
>>>
>>>   static void gicv3_its_validate_quirks(void)
>>>   {
>>> -    const struct its_quirk *quirk = NULL, *prev = NULL;
>>> +    uint32_t quirks, prev_quirks;
>>>       const struct host_its *hw_its;
>>>
>>>       if ( list_empty(&host_its_list) )
>>>           return;
>>>
>>>       hw_its = list_first_entry(&host_its_list, struct host_its, entry);
>>> -    prev = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
>>> +    prev_quirks = gicv3_its_collect_quirks(hw_its, NULL);
>>>
>>> -    list_for_each_entry(hw_its, &host_its_list, entry)
>>> +    list_for_each_entry_continue(hw_its, &host_its_list, entry)
>>>       {
>>> -        quirk = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
>>> -        BUG_ON(quirk != prev);
>>> -        prev = quirk;
>>> +        quirks = gicv3_its_collect_quirks(hw_its, NULL);
>>> +        BUG_ON(quirks != prev_quirks);
>>
>> I know it was in the previous version, but as you are already touching
>> this... This is not Xen BUG(). This is a platform problem. So you need
>> to panic here. Something like
>>
>>   if (quirks != prev_quirks)
>>          panic("Different ITS instances has different quirks")
> 
> Ack.
> 
> 

I agree that a quirk mismatch is a platform problem. Yes, the current 
design uses global flags, making it unable to handle mixed quirks, 
leading to the failure on mismatch.

Please note, I am not saying a panic() is wrong here and I am not 
requesting any changes here; I was just wondering why this is handled 
differently than the SMMUv3 driver. I am just thinking out loud.

SMMUv3 driver handles feature mismatches by gracefully degrading. When 
it finds an SMMU device that does not support ARM_SMMU_FEAT_COHERENCY, 
it disables that feature for the entire platform (so the P2M code has to 
clean the cache when updating ptes). It does not panic. How the ITS and 
SMMUv3 drivers are different in that regard? Why could not we apply the 
same "worst-case" logic here?
For example:
- if any ITS device requires non-cacheable memory, then all ITS memory 
allocations should use non-cacheable memory.
- if any ITS device requires 32-bit addresses, then all ITS memory 
allocations should be constrained to 32-bits.

This would be consistent with the SMMU precedent and would allow the 
system to boot and function correctly, but with the performance 
characteristics of the worst ITS device in the system.

Or I really missed something?











[snip]

