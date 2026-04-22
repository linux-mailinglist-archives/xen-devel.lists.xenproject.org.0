Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIyeGZrR6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:48:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5E446EB4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290607.1570165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXvI-0007JV-Kj; Wed, 22 Apr 2026 13:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290607.1570165; Wed, 22 Apr 2026 13:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXvI-0007Gp-HW; Wed, 22 Apr 2026 13:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1290607;
 Wed, 22 Apr 2026 13:47:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFXvG-0007Gg-GL
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXvF-00F0zt-TC
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:47:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8d169-2eae-0a2a0a5409dd-0a2a450589c8-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:47:21 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8d169-aaa8-0a2a45050019-d155a732ade0-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:47:21 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a4113ab355so5740036e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:47:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc297sm4405160e87.18.2026.04.22.06.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:47:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776865641; x=1777470441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Sh8JFYTv4GSVzJBxmzWjFaYvbu9BNzX7XqJOFt+qGI=;
        b=C3PyEj1t5Pxrl72D2Tb7Y0ZU+Cmk1siCMpp1cJ346O6mG4stR6BHAskv/AjLeJu39W
         bOC31skbpnI/GEVwcl4AFUauoGVxmHYlCaw+hDLTpLcIwMVGF6xSu8VITSIBlACtzvW1
         D4V4jC1/9lxXVoFRZ7vWcTHZ4i/qUwdNP1u0g6Kr4JCIiFEgbJaXC4ZVlKJDaNjjxZut
         dZfMx3A+2FNJb0qinoiZuu5EsRBMvjuGoNnaD5A4zQM7Um5vnvf/W2nL6cEJPa1hy7yI
         vI4tnTwTZ2OZ/CE9CWLEeYSO86vEfra/wBanu76VvtHsfw+FIRojNbsqzY5hwWPfF/4i
         cqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865641; x=1777470441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Sh8JFYTv4GSVzJBxmzWjFaYvbu9BNzX7XqJOFt+qGI=;
        b=iX225vrQiCnVmX83ApLuCUzVglVvA0v0c6CjyW7ortEuPr0g2idt8LmCk7jVRgMkeu
         xbHhMD0kNkw2ka4Mt1WzKo+5CEdqOb9Y9gHQ/hXRzt518r+xvoYgtPxBMfQztKqJ5xYO
         2lJ1jja41qUAgGpA36W2yjTnsSW262JmjoBKi/HdUkliqitHs4YMHSB1mMIm+1MN/TLZ
         7yD6CY8ynxMgTRSpR8BTR/2gKipqANukmujGxSnBeaRYRm7ChAjrW6hf8FkdEz7EVlNV
         e+I8ewztoef22wfC86df28QczVAfWv8k4MtMii/g5IOy7Riz30/KZkXIdwOAKKEQcmr5
         +9XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HkMUBDgd/jEIT6Dp/xIysJPPJpZmXjw7p5QkQnLNWUMehUj5J1rxOtpKFFukXLVPadXIButDtmUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj425ArSBULMctZc+tS1ifPp8Q0y7/icv4/W0lkZEJTD9eEhJT
	05aw43WMvRWP9LayyDDwCtNLQv1UaRHWlu/sHEkYX0bpbrVChVaIvryf
X-Gm-Gg: AeBDiesYRlswOIwO5rsBbN99tigNqCFzboh83ImnD+wWDctyzWjfADW+Qe2wwV41LO6
	Rgwr7QKlJ45DJ7aj6WOV72XAxS2l6Qx82/2Ngyt50LE/SAtBYtbYvaJbNfHJBBnUbjHf9e+pIyy
	Xdl4amz+uBhedy2MHQa0vXq2XvUAFt0Xxm2W5EMIgksvCxt2VGhnPo34bdu0Oore4NRrTUN421z
	Z6ISX2wY+Kn3DQdJFisJhI/83psIMp4IV0WngqVbQI+I8ouF5fvgn+bWxBwuR4VJMME6zXjWKfh
	cEd3SDxoJiHooUsqXAnrRwl4PW0xq4a3D+ZijlcbhgRMviBdRadbKvWoH1+ei8UisbBvEs1I9vo
	KWpJZyqf4xdDrLMdE0zcEUsdPCV2M0gGWgiqNhyaFQZ4eQQWskPbM6n+lJ9h1KcqudNNwbf17Fj
	m4mCTWgMq7ImTYH0fArKViI41uAMnvnvbOBnYHWyyCAk9i4E9sNNXjvZ+X9AWN05a7iQ4W8PFT0
	a03mAi+Cn/zvw==
X-Received: by 2002:a05:6512:3c8f:b0:5a2:c3e4:6c1 with SMTP id 2adb3069b0e04-5a4172e2556mr8658269e87.34.1776865640795;
        Wed, 22 Apr 2026 06:47:20 -0700 (PDT)
Message-ID: <14562fd3-a29c-4a53-8778-79818467695f@gmail.com>
Date: Wed, 22 Apr 2026 15:47:19 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d493eee4-bc83-4a44-8568-3a18ddc90d4c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776865641-E97A6443-16740444/10/73395122804
X-purgate-type: spam
X-purgate-size: 5595
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: CDC5E446EB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 1:57 PM, Jan Beulich wrote:
> On 22.04.2026 13:45, Oleksii Kurochko wrote:
>> On 4/21/26 10:57 AM, Jan Beulich wrote:
>>> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>>>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>>>> +{
>>>> +    paddr_t load_addr = INVALID_PADDR;
>>>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>>> +    unsigned int nr_banks = banks->nr_banks;
>>>> +    unsigned int bi;
>>>> +
>>>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
>>>> +
>>>> +    /*
>>>> +     * At the moment, RISC-V's Linux kernel should be always position
>>>> +     * independent based on "Per-MMU execution" of boot.rst:
>>>> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
>>>> +     *
>>>> +     * But just for the case when RISC-V's Linux kernel isn't position
>>>> +     * independent it is needed to take load address from
>>>> +     * info->image.start.
>>>> +     *
>>>> +     * If `start` is zero, the Image is position independent.
>>>> +     */
>>>> +    if ( likely(!info->image.start) )
>>>> +    {
>>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>>> +        {
>>>> +            const struct membank *bank = &banks->bank[bi];
>>>> +            paddr_t bank_start = bank->start;
>>>> +            /*
>>>> +             * According to boot.rst kernel load address should be properly
>>>> +             * aligned:
>>>> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>>>> +             *
>>>> +             * As Image in this case is PIC we can ignore
>>>> +             * info->image.text_offset.
>>>> +             */
>>>> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>> +            paddr_t bank_end = bank_start + bank->size;
>>>> +            paddr_t bank_size;
>>>> +
>>>> +            if ( aligned_start > bank_end )
>>>> +                continue;
>>>> +
>>>> +            bank_size = bank_end - aligned_start;
>>>> +
>>>> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
>>>> +
>>>> +            if ( image_size <= bank_size )
>>>> +            {
>>>> +                load_addr = aligned_start;
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        load_addr = info->image.start + info->image.text_offset;
>>>
>>> Why does stuff ahead of text_offset not need loading?
>>
>> Here we just calculating only a place where kernel will be loaded. The
>> full kernel image will be loaded in kernel_image_load().
> 
> Okay, but if you calculate an address where the full image won't fit,
> how are things going to work?

If the full image won't fit than the necessary bank won't be found in 
for() loop below and so this kernel will be rejected.

I expect that in the case when info->image.start is not 0 (so isn't 
Image isn't PIC) Image want to be specifically load to info->image.start 
+ info->image.text_offset. Is it wrong statement?

~ Oleksii

> 
>>>> +        WARN_ON(!IS_ALIGNED(load_addr, KERNEL_LOAD_ADDR_ALIGNMENT));
>>>> +
>>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>>> +        {
>>>> +            const struct membank *bank = &banks->bank[bi];
>>>> +            paddr_t bank_start = bank->start;
>>>> +            paddr_t bank_end = bank_start + bank->size;
>>>> +
>>>> +            if ( (load_addr >= bank_start) && (load_addr < bank_end) &&
>>>> +                 (bank_end - load_addr) >= image_size )
>>>
>>> Do we have to fear overflow? (If so, shouldn't such an image be rejected
>>> rather than an attempt being made to place it?) If not, simply:
>>
>> Just for a case. As a user may control load_addr and image_size it could
>> be some combination which will lead to overflow here.
>>
>>>
>>>               if ( (load_addr >= bank_start) &&
>>>                    (load_addr + image_size <= bank_end) )
>>
>> I will add the following:
>>           /*
>>            * Reject a malformed image before the loop to avoid wrapping
>>            * load_addr + image_size in the per-bank check below.
>>            *
>>            * image_size covers the kernel from _start (placed at load_addr =
>>            * start + text_offset) through _end.  The alignment gap
>>            * [start, load_addr) is padding and need not lie within a bank.
>>            */
>>           if ( image_size > (paddr_t)-1 - load_addr )
>>               bi = nr_banks;
>>           else
>>               for ( bi = 0; bi != nr_banks; bi++ )
>>               {
>>                   const struct membank *bank = &banks->bank[bi];
>>                   paddr_t bank_start = bank->start;
>>                   paddr_t bank_end = bank_start + bank->size;
>>
>>                   if ( (load_addr >= bank_start) &&
>>                        (load_addr + image_size <= bank_end) )
>>                       break;
>>               }
> 
> Please consider getting away without "else" (and hence with one level
> less of indentation):
> 
>           bi = image_size <= (paddr_t)-1 - load_addr ? 0 : nr_banks;
>           for ( ; bi != nr_banks; bi++ )
>           ...
> 
>>> Also, does image_size really only cover space starting from .text_offset,
>>> rather than from .start?
>>
>> image_size covers total memory the kernel occupies at runtime.
> 
> Which emphasizes the remark further up.
> 
> Jan


