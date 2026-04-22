Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEsmGSTc6GnOQwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:33:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4550447489
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290699.1570229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYdE-0002st-9E; Wed, 22 Apr 2026 14:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290699.1570229; Wed, 22 Apr 2026 14:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYdE-0002qW-5y; Wed, 22 Apr 2026 14:32:48 +0000
Received: by outflank-mailman (input) for mailman id 1290699;
 Wed, 22 Apr 2026 14:32:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFYdC-0002qQ-Dd
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYdB-007w62-Qk
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:32:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8dc06-5cb7-0a2a0a5109dd-0a2a4506c60c-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:32:45 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8dc0d-7371-0a2a45060019-d155a730bcd7-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:32:45 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a0ff30b240so8404494e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:32:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ebe31sm4407228e87.75.2026.04.22.07.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 07:32:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776868365; x=1777473165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxjfFnFK9MBmCcc1oDKSqlhMdh6CfSW9PMPDhk2kGIQ=;
        b=mCs5D8cvk6qmYuRuYolkc0/p/KapTmue+irCWvtnL1/3Fhrq4VCqMs4nf+IbBoZhNa
         FYzwhcR3vkU5amE7mBOjFvNklEPARUy/k0g4dTPTnBA8gbTyTOsDc9scSCGDjMvhZxId
         zXNQOVd9cjbLVGLWBLPkSJen5TrPduJklqbJ6lQMs9quVti2EuMz9UcfhSt86GXU+Gzk
         huxQ2oAWysp1b7yiSsaJOmcrdP8SAexNb79yLC5OAQ+kc8kjEQQ4cgY0jx0A/Zk6SqQT
         ov9QFuMKFHf8Aegyb31KOjqQ5+aJLT5jkGIE+JOEWiEE6EMiu4Tv40AEVkhfvkaH5Dof
         JLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868365; x=1777473165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxjfFnFK9MBmCcc1oDKSqlhMdh6CfSW9PMPDhk2kGIQ=;
        b=maolOOUZkFIakIasSOUwW3rUBsbyVWTuDdpz2qy8DD5/BF37u+T/H8CUx5zt8GWwYM
         9kcXCsfszK0myU6HdJHSBs5T5p3zKG0O3zfimrZOfvSLfKZANFYFbSgB44XnCQRPOVfL
         Z7ii/RnIrh2sEbfFs91U1BJNSTig0hHWZh1MhJYu7gqbdv6rybtL+nzgrtj8WVdH+OYd
         R1hjUENK0dezPGxX4uFSijQhWEb7DJxN5Cyg/0scdzU52H+5sjkdp5TWP3pgZ31eKKFf
         kwTf6ErtavOnVqYuRYNloYvtUfFL5umL8xh4oYR+J3rHh4i8Xi0sfVlObMsejklXVnrB
         8o5w==
X-Forwarded-Encrypted: i=1; AFNElJ9zy0BZJyIp7Ut0sc4dQTxZGrYmtAGszD3wOd0MDlamb08QF8yebVDcFrlJDY30pfSXmkHNjl4fCb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxazzd6q0gp1mrP94MgBanDFhvvV4CH43gix3oBIIgx6x4vRgOO
	65xqHMRtGyQ826NU3wWbw/fmfs58Bl9OuYoIYsRX+WqdkweIaqULWmJ6
X-Gm-Gg: AeBDietZqzdFHy9m/TJEyj5pW6TpU8TA23A6QWS0abdH8BKQqvphTV6TzQOHI+n9XUR
	oSysK0PU5qPf+PLRwHBUjhrfpnUkk/+oIiUbp0fA0J7g0rzC2wEc4MJghPlieJSnlu4iHPDs0xB
	O18PeXAJrO5pjSFrPCDGB5v9N/BTSHQO2dHkFmWzcFIFZJWAYr9nqrEsG2teGeaDqRqtu8be/1W
	vSeQip9QRhC5LxtvrFM/+t9iOKhiRsRcCzU5XNKxqboa1pXR9jJHQJ0/pIdyA8/lVqmIsqOa2/f
	sbAaMAas8taTbxsbnYkkRiXTgrPQp12SYHn8WU9s54hoxpuzA+HTEI1WbdZhFgWMcpm8BygecVQ
	BzGfhXeh7JSs3hAlc9caHkgKf3CVOeMfmIw6i3/JLojfCuX6uSuWgjBo91BnWuN+KLoY64fgiju
	WIE6NoYQdiZ18eAZDrG8L6/25YVT+gO/EYBEzT0RsIR/ZbC6bI5hy/dRpMOzTuIeksqpi2JLmau
	n/stDt2Bse2TA==
X-Received: by 2002:a05:6512:33c8:b0:5a4:2b2:75e3 with SMTP id 2adb3069b0e04-5a4172cd812mr7204146e87.18.1776868364683;
        Wed, 22 Apr 2026 07:32:44 -0700 (PDT)
Message-ID: <8415009c-9b4b-46f3-8aec-17313c19df0e@gmail.com>
Date: Wed, 22 Apr 2026 16:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] xen/riscv: add kernel loading support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
 <6af89a34-3bf1-40cb-a4c5-e9a16ee31295@suse.com>
 <b6c4a111-6c37-4850-962a-5b401a4a5655@gmail.com>
 <d493eee4-bc83-4a44-8568-3a18ddc90d4c@suse.com>
 <14562fd3-a29c-4a53-8778-79818467695f@gmail.com>
 <51ac0fb6-6111-4364-9781-bf8dde3df979@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <51ac0fb6-6111-4364-9781-bf8dde3df979@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776868365-90071D75-C9B08113/10/73395122804
X-purgate-type: spam
X-purgate-size: 4634
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A4550447489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 3:54 PM, Jan Beulich wrote:
> On 22.04.2026 15:47, Oleksii Kurochko wrote:
>> On 4/22/26 1:57 PM, Jan Beulich wrote:
>>> On 22.04.2026 13:45, Oleksii Kurochko wrote:
>>>> On 4/21/26 10:57 AM, Jan Beulich wrote:
>>>>> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>>>>>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>>>>>> +{
>>>>>> +    paddr_t load_addr = INVALID_PADDR;
>>>>>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>>>>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>>>>> +    unsigned int nr_banks = banks->nr_banks;
>>>>>> +    unsigned int bi;
>>>>>> +
>>>>>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * At the moment, RISC-V's Linux kernel should be always position
>>>>>> +     * independent based on "Per-MMU execution" of boot.rst:
>>>>>> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
>>>>>> +     *
>>>>>> +     * But just for the case when RISC-V's Linux kernel isn't position
>>>>>> +     * independent it is needed to take load address from
>>>>>> +     * info->image.start.
>>>>>> +     *
>>>>>> +     * If `start` is zero, the Image is position independent.
>>>>>> +     */
>>>>>> +    if ( likely(!info->image.start) )
>>>>>> +    {
>>>>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>>>>> +        {
>>>>>> +            const struct membank *bank = &banks->bank[bi];
>>>>>> +            paddr_t bank_start = bank->start;
>>>>>> +            /*
>>>>>> +             * According to boot.rst kernel load address should be properly
>>>>>> +             * aligned:
>>>>>> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>>>>>> +             *
>>>>>> +             * As Image in this case is PIC we can ignore
>>>>>> +             * info->image.text_offset.
>>>>>> +             */
>>>>>> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>>> +            paddr_t bank_end = bank_start + bank->size;
>>>>>> +            paddr_t bank_size;
>>>>>> +
>>>>>> +            if ( aligned_start > bank_end )
>>>>>> +                continue;
>>>>>> +
>>>>>> +            bank_size = bank_end - aligned_start;
>>>>>> +
>>>>>> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
>>>>>> +
>>>>>> +            if ( image_size <= bank_size )
>>>>>> +            {
>>>>>> +                load_addr = aligned_start;
>>>>>> +                break;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +    else
>>>>>> +    {
>>>>>> +        load_addr = info->image.start + info->image.text_offset;
>>>>>
>>>>> Why does stuff ahead of text_offset not need loading?
>>>>
>>>> Here we just calculating only a place where kernel will be loaded. The
>>>> full kernel image will be loaded in kernel_image_load().
>>>
>>> Okay, but if you calculate an address where the full image won't fit,
>>> how are things going to work?
>>
>> If the full image won't fit than the necessary bank won't be found in
>> for() loop below and so this kernel will be rejected.
>>
>> I expect that in the case when info->image.start is not 0 (so isn't
>> Image isn't PIC) Image want to be specifically load to info->image.start
>> + info->image.text_offset. Is it wrong statement?
> 
> I don't know, but the adding in of .text_offset looks questionable to me.
> I simply don't know why such offsetting would be wanted / needed.

In the <linux>/Documentation/arch/riscv/boot-image-header.rst:

This header format is compliant with PE/COFF header and largely inspired 
from ARM64 header. Thus, both ARM64 & RISC-V header can be combined into 
one common header in future.

Than if to look at the comment near text_offset it is mentioned that:
/* Image load offset, little endian */

So it is basically Image load offset and that is why I expect it should 
be added to calculation of load_addr.

Considering that boot image header is based on Arm64 I assume that an 
explanation regarding text_offset for Arm64 
(<linux>/Documentation/arch/arm64/booting.rst:) should be true for RISC-V:
```
The Image must be placed text_offset bytes from a 2MB aligned base
address anywhere in usable system RAM and called there. The region
between the 2 MB aligned base address and the start of the image has no
special significance to the kernel, and may be used for other purposes.
At least image_size bytes from the start of the image must be free for
use by the kernel.
```

~ Oleksii

