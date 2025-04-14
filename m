Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A35A88BF7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951228.1347339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PBE-0002tb-2x; Mon, 14 Apr 2025 19:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951228.1347339; Mon, 14 Apr 2025 19:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PBD-0002rs-Ut; Mon, 14 Apr 2025 19:09:15 +0000
Received: by outflank-mailman (input) for mailman id 951228;
 Mon, 14 Apr 2025 19:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=32Qc=XA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u4PBC-0002ZC-1O
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:09:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f363b820-1963-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 21:09:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id ADCD34EE3C14;
 Mon, 14 Apr 2025 21:09:11 +0200 (CEST)
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
X-Inumbo-ID: f363b820-1963-11f0-9eae-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744657751;
	b=DEEUJizZ1LpqiHDWEfCdkn5b0ma6TCTmdB37RV/7MSwV1pOWwgt0G7RDQzfsx97k4niF
	 r42KqYPz9/IXVNh5rW0cLRQPI52eu7yzfr2qo6fM5GDVEs1paGx1mWz2zYLmlbhF5CQSv
	 yul9heuL8pJOrrBqwnDn6VbXtOzypobTATBy0H19EML+UCf8s8CkbVM9EVORdhYZp0UiQ
	 JyMpEtUcYS71ncHakg6x9/chjQ4OHu1lW6Tmb9PckasfeYrCSj6j389jgCtzu4Qa9PE73
	 7nnSFkF07ycUjFg7AIXyN4fsUBA3d4UkAanIOK3mY9q/GNNTefNGtpIOtdjigdh1DSSQv
	 Ehteim3bxcPH8Rx/pnddPV8G3+o3y8MHtXWeRY8vcTU/exNmCI/fDmGqrty1p1o6aZPuJ
	 3R6f99vwBqXLPC0fVuyq6eTIYklUgF0OG/5+JLPAeyqar1vWh06vvnicq7I5DB/dGtznP
	 wmGsjgK6J3jKCrFgqrD6Qbf3xraBCu/lbw9dFMmCY5AKwPFZSVLAT8QE2HlLl4nzyCdjh
	 MbEQx1TKz1aL46hZ1mFWmWCDMKfFVMKtMrR0mG/jWYnFcajs1ceZqeovvuPN4rUw3Rc57
	 2OCMPTImaoJTYLdQC6s/Pa5FTwYY4+Nh8IkuWtj11Va9iRO1hLJjzgO1SRsKZck=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744657751;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=obLVzBishn44rrIqlR8qQtY8ZY5QviDNYe9TAS8H07I=;
	b=m0BrZGig+SDdWgV3E92xSsUvdWzWzfxaT6AIuFG9G2N8IdJNpMQ862aisCI3sd5eIeNa
	 TXIg2gjQG6voaWpspPA17PquO4bj6I/DJaRZx6S/f7kY8fN4vbaYSSw1mJj8D4yDkVq7d
	 r9ClE9eUOIPj7/08wgd3xRvRO9mb3+0BOguCePo8/qP2016lAzP7z5nGtrU39iiyTEt9R
	 V4Ud1jyau7zmoMaPgaWFo6mXYo/WCJBspuQXL+y2dQ1c+P/MshtH8+EL2rtVdhHHBanod
	 Q85k4DT2SU/g1VRwCsHnOeBJZHmvy3QTcsErbzYOcIkcvPEfzVDfOoi4x4SilJ4K1rQhE
	 phSNsRDBFy2Z/xTrYlZXeKHwelTSmVbx6YUwiJ0LnWbiDcdW32OZoPEFAU9vCYq5S4S1P
	 nQvGrY1eKmUVPHDfQ78gd2MgYh6zc2L/Gc8f7eIAyUD7fEFIp9qj8KT1HART9+H86aTWM
	 PBDiVBDGvyr6QSJYX1YSUoDfJP1hqhF3iqVE/8erHtM3kArrAXyJ6DdOrPZ3V1MidMhR1
	 H6pIhia6di1XszUO/LTUfcHNChLyfZUnbQHWXxASm/bbWRhFYE+6rM/BuNFJB2zVDDoMA
	 Xi83y4ozjv0AaGeMG56e0nZT00Nn1JHv0KSwlEYrqYaIZEOospFY51vQVUXhIwI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744657751; bh=zHqx5XqrXub69fFu0ibfCDExIyovSoUMYjXFUxNl16I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cRujBOvsy3cciOgpyK8AlbzlGICNjiwm+O+d+MOrut/XY0DpDg+dNpn9xYndBx0JN
	 vltcR5EP3NmQ5ENc1M51OFdLVfkUvMSkb8Rupwbpfn/tM582GbUYKUuVlNgbFnRjoj
	 eW1AJTN6FZD2DtkWNbuUjfo/S8Kz/vSFnuviooG/BR7O/SzbPXkz6M99YJpBaPOKvG
	 JIcRP8FXJ5SEOAlup/HbuOvCkk27mXpthu5wqdfE2NwKmUEftnYc+kwetvHJYx+/Xt
	 NqrsKUEc1eRrb6bBqwBfj9wLLtbTfsTmZKX4OuH41pugKGiPHMsOct6Zy6vAaeQrPY
	 AL1emHux+RAqg==
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 21:09:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <agarciav@amd.com>, Jason Andryuk
 <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
 <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate multiboot
 modules
In-Reply-To: <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
 <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
 <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
Message-ID: <a9bc6ee3736774558301dda06fb959a0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-14 17:05, Jan Beulich wrote:
> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> +/*
>>>> + * Locate a multiboot module given its node offset in the FDT.
>>>> + *
>>>> + * The module location may be given via either FDT property:
>>>> + *     * reg = <address, size>
>>>> + *         * Mutates `bi` to append the module.
>>>> + *     * module-index = <idx>
>>>> + *         * Leaves `bi` unchanged.
>>>> + *
>>>> + * @param fdt           Pointer to the full FDT.
>>>> + * @param node          Offset for the module node.
>>>> + * @param address_cells Number of 4-octet cells that make up an 
>>>> "address".
>>>> + * @param size_cells    Number of 4-octet cells that make up a 
>>>> "size".
>>>> + * @param bi[inout]     Xen's representation of the boot 
>>>> parameters.
>>>> + * @return              -EINVAL on malformed nodes, otherwise
>>>> + *                      index inside `bi->mods`
>>>> + */
>>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>> +                                     int address_cells, int 
>>>> size_cells,
>>>> +                                     struct boot_info *bi)
>>> 
>>> Functions without callers and non-static ones without declarations 
>>> are
>>> disliked by Misra.
>> 
>> Can't do much about it if I want them to stand alone in a single 
>> patch.
>> Otherwise the following ones become quite unwieldy to look at. All I 
>> can
>> say is that this function becomes static and with a caller on the next
>> patch.
> 
> Which means you need to touch this again anyway. Perhaps we need a 
> Misra
> deviation for __maybe_unused functions / data, in which case you could
> use that here and strip it along with making the function static. 
> Cc-ing
> Bugseng folks.
> 

There is already an exception for __maybe_unused on labels (Rule 2.6). 
In principle it could be easily extended to encompass unused functions 
(which are verified by another rule), with a suitable rationale.

>>>> +    /* Otherwise location given as a `reg` property. */
>>>> +    prop = fdt_get_property(fdt, node, "reg", NULL);
>>>> +
>>>> +    if ( !prop )
>>>> +    {
>>>> +        printk("  No location for multiboot,module\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>>> +    {
>>>> +        printk("  Location of multiboot,module defined multiple 
>>>> times\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, 
>>>> &addr, &size);
>>>> +
>>>> +    if ( ret < 0 )
>>>> +    {
>>>> +        printk("  Failed reading reg for multiboot,module\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    idx = bi->nr_modules + 1;
>>> 
>>> This at least looks like an off-by-one. If the addition of 1 is 
>>> really
>>> intended, I think it needs commenting on.
>> 
>> Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
>> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
>> the intent was to take it into account, but bi->nr_modules is
>> initialised to the number of multiboot modules, so it SHOULD be 
>> already
>> taking it into account.
>> 
>> Also, the logic for bounds checking seems... off (because of the + 1 I
>> mentioned before). Or at least confusing, so I've moved to using
>> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
>> MAX_NR_BOOTMODS.
>> 
>> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more 
>> cognitive
>> load than I'm comfortable with.
> 
> If I'm not mistaken the +1 is inherited from the modules array we had 
> in
> the past, where we wanted 1 extra slot for Xen itself. Hence before you
> move to using ARRAY_SIZE() everywhere it needs to really be clear what
> the +1 here is used for.
> 
>>>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>>>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>>>> @@ -13,6 +13,63 @@kkk
>>>> 
>>>>  #include <xen/libfdt/libfdt.h>
>>>> 
>>>> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
>>> 
>>> Why plain int here, but ...
>>> 
>>>> +{
>>>> +    return fdt32_to_cpu(*cell);
>>>> +}
>>>> +
>>>> +static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
>>> 
>>> ... a fixed-width and unsigned type here? Question is whether the 
>>> former
>>> helper is really warranted.
>>> 
>>> Also nit: Stray double blank.
>>> 
>>>> +{
>>>> +    return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | 
>>>> fdt32_to_cpu(cell[1]);
>>> 
>>> That is - uniformly big endian?
>> 
>> These helpers are disappearing, so it doesn't matter. This is 
>> basically
>> an open coded:
>> 
>>   fdt64_to_cpu(*(const fdt64_t *)fdt32)
>> 
>> And, yes. DTBs are standardised as having big-endian properties, for
>> better or worse :/
>> 
>>> 
>>>> +}
>>> 
>>> Marking such relatively generic inline functions __init is also 
>>> somewhat
>>> risky.
>> 
>> They were originally in domain-builder/fdt.c and moved here as a 
>> result
>> of a request to have them on libfdt. libfdt proved to be somewhat
>> annoying because it would be hard to distinguish accessors for the
>> flattened and the unflattened tree.
>> 
>> I'd personally have them in domain-builder instead, where they are 
>> used.
>> Should they be needed somewhere else, we can always fator them out
>> somewhere else.
>> 
>> Thoughts?
> 
> As long as they're needed only by domain-builder, it's probably fine to 
> have
> them just there.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

