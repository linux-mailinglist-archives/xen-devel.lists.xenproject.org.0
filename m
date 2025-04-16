Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F9A9096B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 18:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956503.1349903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u562m-0000FB-N5; Wed, 16 Apr 2025 16:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956503.1349903; Wed, 16 Apr 2025 16:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u562m-0000CJ-Ja; Wed, 16 Apr 2025 16:55:24 +0000
Received: by outflank-mailman (input) for mailman id 956503;
 Wed, 16 Apr 2025 16:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxVN=XC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u562l-0000C6-2G
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 16:55:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 957e23de-1ae3-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 18:55:21 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 46EDF4EE3C76;
 Wed, 16 Apr 2025 18:55:21 +0200 (CEST)
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
X-Inumbo-ID: 957e23de-1ae3-11f0-9eaf-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744822521;
	b=ySYO0dLSTK/7zR+i6eZJhWVN5rPbPw2MV7YD9NIDFWXabq75tifTmn1z4ekcJwVEk4vU
	 9WM/WSWeUfrU9s05EMywMfwS6Lv/Hwpg9PfDcL12A8NJ8o7M4XIA+72sXTNSm9F63/p8M
	 vMfuvvG0Q1/8u+eJ4VE8teoCNhNspsHLxEdIAhXZCMOFCzoDXH725tT6E0bMj1ex23g0m
	 wWgSTK14HML7QMEyDXI4UqkNKFDdHIV9zK0/wj2tyBm6N1RT2/9I8g/EgXabOUE1CWW9W
	 WromsSMahTWjH3z45sh/1oUc0gfCyt+Z4yX83iZ/oIuH8VyegUoeLsSKTTTojBUTrd90H
	 sLlPJkMZGpynkDWwdmRL29edxN5Pfr/1cjhFg8fDfjf28f6eedd6XANohIekstc4rUazI
	 6UyUWZdf7RbMGwYT1kg9Ag4DTE78mFY3pFEFOF1UwdmGdW4oMs3wiJskcPYDLI9eF59Lh
	 moPlgf13Ag7+zexTw4+8sru86aBy4jPlImDoG5JpytSaqdHflDC/FJj1PTpFUhY34qt99
	 NJseQR9+cj0nmgzi8esfNSOWycvVz29zX9PcEzEDlL4m06j8v6Zd2GPGxTUCG7sDNRhXQ
	 23sd/e29D3rVUp3PO0YXAYh9o6BVFU6pD33d5cAPqiQvSaYZBo3GPrHjJcV9uXs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744822521;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=6OYEbPrzp2MsfHEvmVSLrjad9OznZB26hLXRD/YJpeE=;
	b=5uhd9/6v1YLQZfjor7nsI+GUbfNcdSX6cWupa3b4B+HWlvu/YQc+XQsO0j1enTN4xnpG
	 Pvofa4+xYvVPRKltVb304As+xV2DFVn0HWqn0WqSaKwLa4Lhw2hFuvHvDQ1FtQCDctk78
	 jUIl6B1xwyss8DDKxOBXXQCeT9x5inAnH4N7mpy/DQnjvJRLr3CL6WDpxF1wdFUn6b3mD
	 EHaHN52Od4OoVp7mR6+YZOeFiYQ17YxX34IV0UckP+hLulcyzj56lx5rsar97UBsLSanr
	 R6ENIKwwPhql+4sh+RZ5t98FAxE+RrntMtu5LHQGE1jH9390gj9b+pjEw7ZEWJcL0d/IU
	 f5BJYolFUE1LpG71hT6heHThoS9LsIwQS+jjyif/0SSKGmFC5qDL5QoD2zwR4J7Vry3Wz
	 rjM+6lIPNJl5pmrW5GcuAHVS/6hDuk5szxLtGxJBXE3B5HjRq+eGzFZ49o5UV4WxnYEbu
	 +jPTxxecOtCNnmUiOtEIaxdvlO64n/s5ypUzSO/4zsJoqcc594JOtcJ0VTND6c69alfOx
	 +ZNDSICzve4OQaG6TBuwUDvp3Djllu0ABif80bAetrnFDdweQDghwifSXYwvcdiiPYsTD
	 rA3N8HMK6p/8neMHIz9/2TMLM6FU3bKB38mNCPAzo5juKFHPt0Ld+Nv4ZgdE7uw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744822521; bh=N4Sd2mfaZpKTRxxXCIgEF88ieTHpO9dpg5kC2gr1U08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dzy18pvJLTRccTI882Idoe4r1ykiBGwfsmTGj/fSX32WBL/htfUX1BI5fkR9vb5i8
	 ITZ0e+pyBDzboL5IWmen1FSa4E0kNZXbO0C0Dk1Q5/j81Nv2ijs94OoDvSdh9ZMZId
	 jg0T4CKZD0MmzSn0U8c0+i5utmlGQezEY0EyecKIFmc5VDwJEJk/pf5ufjpmUH21PW
	 OySf404rVg02KTQXWgAGlpkfCbVoE/75dKEdh4q+Ybu4RWjHX4K2EUpGBZofmDPOO9
	 ernPG4ZN3J52rrCV3/sSmDLDNtX3YjFVQel4Vlv53V12cYQ1eX/xTH2HB12urfMG17
	 02PH6cQbLlzIw==
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 18:55:21 +0200
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
In-Reply-To: <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
 <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
 <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
 <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
 <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
Message-ID: <173f7129e82958a9737627129ac3c5be@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-15 08:05, Jan Beulich wrote:
> On 14.04.2025 20:01, Alejandro Vallejo wrote:
>> On Mon Apr 14, 2025 at 4:05 PM BST, Jan Beulich wrote:
>>> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>>>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>>> +/*
>>>>>> + * Locate a multiboot module given its node offset in the FDT.
>>>>>> + *
>>>>>> + * The module location may be given via either FDT property:
>>>>>> + *     * reg = <address, size>
>>>>>> + *         * Mutates `bi` to append the module.
>>>>>> + *     * module-index = <idx>
>>>>>> + *         * Leaves `bi` unchanged.
>>>>>> + *
>>>>>> + * @param fdt           Pointer to the full FDT.
>>>>>> + * @param node          Offset for the module node.
>>>>>> + * @param address_cells Number of 4-octet cells that make up an 
>>>>>> "address".
>>>>>> + * @param size_cells    Number of 4-octet cells that make up a 
>>>>>> "size".
>>>>>> + * @param bi[inout]     Xen's representation of the boot 
>>>>>> parameters.
>>>>>> + * @return              -EINVAL on malformed nodes, otherwise
>>>>>> + *                      index inside `bi->mods`
>>>>>> + */
>>>>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>>>> +                                     int address_cells, int 
>>>>>> size_cells,
>>>>>> +                                     struct boot_info *bi)
>>>>> 
>>>>> Functions without callers and non-static ones without declarations 
>>>>> are
>>>>> disliked by Misra.
>>>> 
>>>> Can't do much about it if I want them to stand alone in a single 
>>>> patch.
>>>> Otherwise the following ones become quite unwieldy to look at. All I 
>>>> can
>>>> say is that this function becomes static and with a caller on the 
>>>> next
>>>> patch.
>>> 
>>> Which means you need to touch this again anyway. Perhaps we need a 
>>> Misra
>>> deviation for __maybe_unused functions / data, in which case you 
>>> could
>>> use that here and strip it along with making the function static. 
>>> Cc-ing
>>> Bugseng folks.
>> 
>> It's a transient violation, sure. Do we care about transient MISRA
>> violations though? I understand the importance of bisectability, but
>> AUIU MISRA compliance matters to the extent that that the tip is
>> compliant rather than the intermediate steps?
> 
> Thing is that quite a few rules are blocking now. I haven't checked 
> whether
> the one here (already) is; if it isn't, we can't exclude it will be by 
> the
> time this patch is committed. If then the next patch isn't committed
> together with it, we'd face a CI failure.
> 

It's Rule 8.4, and it is indeed blocking. To double check, a scan on a 
push containing this patch should trigger the failure.
You may transitively add an inline deviation comment or just a deviation 
with a configuration (I can help if needed), justified by the subsequent 
addition of static.

>> Another option would be to fold them this patch and the next together
>> after both get their R-by. As I said, I assumed you'd rather see them 
>> in
>> isolation for purposes of review.
> 
> As it looks it's all plain code additions, so reviewability would 
> merely
> mildly suffer from patch size. But afaict there would be no loss of 
> clarity.
> 
>>>>>> +    /* Otherwise location given as a `reg` property. */
>>>>>> +    prop = fdt_get_property(fdt, node, "reg", NULL);
>>>>>> +
>>>>>> +    if ( !prop )
>>>>>> +    {
>>>>>> +        printk("  No location for multiboot,module\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>>>>> +    {
>>>>>> +        printk("  Location of multiboot,module defined multiple 
>>>>>> times\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, 
>>>>>> &addr, &size);
>>>>>> +
>>>>>> +    if ( ret < 0 )
>>>>>> +    {
>>>>>> +        printk("  Failed reading reg for multiboot,module\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    idx = bi->nr_modules + 1;
>>>>> 
>>>>> This at least looks like an off-by-one. If the addition of 1 is 
>>>>> really
>>>>> intended, I think it needs commenting on.
>>>> 
>>>> Seems to be, yes. The underlying array is a bit bizarre. It's sizes 
>>>> as
>>>> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I 
>>>> guess
>>>> the intent was to take it into account, but bi->nr_modules is
>>>> initialised to the number of multiboot modules, so it SHOULD be 
>>>> already
>>>> taking it into account.
>>>> 
>>>> Also, the logic for bounds checking seems... off (because of the + 1 
>>>> I
>>>> mentioned before). Or at least confusing, so I've moved to using
>>>> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
>>>> MAX_NR_BOOTMODS.
>>>> 
>>>> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more 
>>>> cognitive
>>>> load than I'm comfortable with.
>>> 
>>> If I'm not mistaken the +1 is inherited from the modules array we had 
>>> in
>>> the past, where we wanted 1 extra slot for Xen itself. Hence before 
>>> you
>>> move to using ARRAY_SIZE() everywhere it needs to really be clear 
>>> what
>>> the +1 here is used for.
>> 
>> Ew.  Ok, just looked at the code in multiboot_fill_boot_info and 
>> indeed
>> the arrangement is for all multiboot modules to be in front, and Xen 
>> to
>> be appended. But bi->nr_modules only lists multiboot modules, so
>> increasing that value is therefore not enough (or
>> next_boot_module_index() would fail).
>> 
>> I need to have a proper read on how this is all stitched together.  I
>> may simply swap BOOTMOD_XEN with the next entry on append. Though my
>> preference would be to _not_ have Xen as part of the module list to
>> begin with. Before boot_info that was probably a place as good as any,
>> but this would be much better off in a dedicated field.
>> 
>> I don't see much in terms of usage though. Why is it being added at 
>> all?
> 
> For hyperlaunch I fear it's you who needs to answer this question. For
> pre-hyperlaunch it's (primarily?) for consider_modules(), iirc. See two
> of the three comments ahead of its non-recursive invocations.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

