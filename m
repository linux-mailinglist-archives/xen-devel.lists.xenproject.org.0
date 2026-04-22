Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PCWLivT6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:54:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31817446F87
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290618.1570174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFY29-00018G-9n; Wed, 22 Apr 2026 13:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290618.1570174; Wed, 22 Apr 2026 13:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFY29-00016n-6v; Wed, 22 Apr 2026 13:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1290618;
 Wed, 22 Apr 2026 13:54:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFY27-00016h-Fw
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:54:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFY26-007oGY-Ss
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:54:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8d30f-bab6-0a2a0a5309dd-0a2a4507dea8-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:54:26 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8d312-229c-0a2a45070019-d1558036c96e-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:54:26 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so38983125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:54:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a557412eesm59464975e9.9.2026.04.22.06.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:54:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776866066; x=1777470866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnzmWXdA1VAvCrRIpc+AigSt1tAvsWFN1DqzKa5v82I=;
        b=ULN75vtnXv5o9sR0VBzdO0y+/Jhtufm/U7B+dlPBrUuUmJy+zga/4H1Xhewg+PB3nf
         EdBiOsOmR8wIIZOHW2z7wsWoPn7kpTYg+SoePcoZaHrYUbb/epXYINRb68PTzSxWATGa
         5CZqPEvdofwdYkFwwcOLPueb4F3RUD27hes14wglOIVA+XOFyFudZ6LTzpS6U1lLdoHh
         ZiobwBfXV3JXk2Mwi2A1mDu7J30b9s4jqqRq81RFBaGeItBitYq9daHgh6J7iJxFCXpb
         35PfgRcD76cP+recfBXXI8mp4H+LIBo/WmX0G0Fd4CPuGjg7t9wALnIH1UVkH24P6FFs
         qd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776866066; x=1777470866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnzmWXdA1VAvCrRIpc+AigSt1tAvsWFN1DqzKa5v82I=;
        b=mQADuRkjWbU2TFTGRX07qLA90/GKHfUPw/PRRKd/HFcjoMmO2JGGRbOPbv3YBeCEKT
         AGqJuys+Hym/+QICTNrrYtSqfW+TWWqawbO9AGfDhdemT4KEkL0cdiEOK2+hpAcYPLmw
         tCMnTra8jMF0GFFAJB6DVad9XzFUZrCpJBLb5g/xlblcy0ioRHXYsy1z1mdeLktypcE6
         pvHS53rUL0ULTeiE9S0uWdRkBCW3fjwNtTJXzJIv7ss6XMkrglTC+Ge9RM0eRYug9WFp
         4sjvSANVXTjseXHal5i1v5HGW0j25I7+gcv7WVe9WVOqTg4l7EUSUTmFDeWQklSPIu9m
         atNA==
X-Forwarded-Encrypted: i=1; AFNElJ/FQTA44lnpzHYsbNs5w1Q+6JdUeISYjv+FQEL9122AixuE8zf66IPYcUCdy4xJdIToqkCHsHinh1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGELXW9+CwoAm04UHdN0QLDrlH6+NRMQX9VxAUtDzP5DMeE6+2
	pHyAwqf5tvdi0JsSp2vRucTUb2FInWBdg+mSVQTkdJDkmICOSO3/tOlBM614D8ya4g==
X-Gm-Gg: AeBDieug4eTae8mE25WbmN9BoiNnrBuQAt1Q0l337agLwaoLGJh3r2bjKUm9axmFa9J
	lvxSxZQ+8D5ZeUfn347e/C9r3uIcbUC7fDAp1f+EB/m/0AlTxx1sDLsON8dSDk8Z6INQrfLbwxG
	1T0+g4UpGl6XHwlZ2Z5WxsT9t4PNRSb0oJhucLZCO8eatnKrhln156rXYpue71W2MFIUesNCuFt
	3ay5WkdppU48jD+LrX71TgtTYDw3/GM1mPu8DWhuntebelJHX6+uKHUxH9QzsXQZhZx2RIDPSk2
	vUlWcjiWc3Ay9zRcnpHInrBwfytGAXWC+2t9yc50R22X+VVTKVWAzbpJN1Z4M98YtBZuIoNN8Z/
	DSY2BhfEjlcpf/xf0V24zJ/8oIKH44+zI0UA+0JFZ0ast2hUe76xeL6C0hZkslMzJkixMSbRhVi
	4qX3zydE+Utk/NrIb/SqhctG+gONmAGM4pA0WsyDwv+oM3sVjn9b57B4ilodkF1rRelAeA97rf3
	IuHQiCCSABRbCBfqFhgkM7Kg1qfgugnTfeB
X-Received: by 2002:a05:600c:a103:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48a58e16ee0mr57065135e9.20.1776866066111;
        Wed, 22 Apr 2026 06:54:26 -0700 (PDT)
Message-ID: <51ac0fb6-6111-4364-9781-bf8dde3df979@suse.com>
Date: Wed, 22 Apr 2026 15:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <14562fd3-a29c-4a53-8778-79818467695f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776866066-16E67C48-D2063E84/0/0
X-purgate-type: clean
X-purgate-size: 3450
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 31817446F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 15:47, Oleksii Kurochko wrote:
> On 4/22/26 1:57 PM, Jan Beulich wrote:
>> On 22.04.2026 13:45, Oleksii Kurochko wrote:
>>> On 4/21/26 10:57 AM, Jan Beulich wrote:
>>>> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>>>>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>>>>> +{
>>>>> +    paddr_t load_addr = INVALID_PADDR;
>>>>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>>>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>>>> +    unsigned int nr_banks = banks->nr_banks;
>>>>> +    unsigned int bi;
>>>>> +
>>>>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
>>>>> +
>>>>> +    /*
>>>>> +     * At the moment, RISC-V's Linux kernel should be always position
>>>>> +     * independent based on "Per-MMU execution" of boot.rst:
>>>>> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
>>>>> +     *
>>>>> +     * But just for the case when RISC-V's Linux kernel isn't position
>>>>> +     * independent it is needed to take load address from
>>>>> +     * info->image.start.
>>>>> +     *
>>>>> +     * If `start` is zero, the Image is position independent.
>>>>> +     */
>>>>> +    if ( likely(!info->image.start) )
>>>>> +    {
>>>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>>>> +        {
>>>>> +            const struct membank *bank = &banks->bank[bi];
>>>>> +            paddr_t bank_start = bank->start;
>>>>> +            /*
>>>>> +             * According to boot.rst kernel load address should be properly
>>>>> +             * aligned:
>>>>> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>>>>> +             *
>>>>> +             * As Image in this case is PIC we can ignore
>>>>> +             * info->image.text_offset.
>>>>> +             */
>>>>> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>> +            paddr_t bank_end = bank_start + bank->size;
>>>>> +            paddr_t bank_size;
>>>>> +
>>>>> +            if ( aligned_start > bank_end )
>>>>> +                continue;
>>>>> +
>>>>> +            bank_size = bank_end - aligned_start;
>>>>> +
>>>>> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
>>>>> +
>>>>> +            if ( image_size <= bank_size )
>>>>> +            {
>>>>> +                load_addr = aligned_start;
>>>>> +                break;
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +    else
>>>>> +    {
>>>>> +        load_addr = info->image.start + info->image.text_offset;
>>>>
>>>> Why does stuff ahead of text_offset not need loading?
>>>
>>> Here we just calculating only a place where kernel will be loaded. The
>>> full kernel image will be loaded in kernel_image_load().
>>
>> Okay, but if you calculate an address where the full image won't fit,
>> how are things going to work?
> 
> If the full image won't fit than the necessary bank won't be found in 
> for() loop below and so this kernel will be rejected.
> 
> I expect that in the case when info->image.start is not 0 (so isn't 
> Image isn't PIC) Image want to be specifically load to info->image.start 
> + info->image.text_offset. Is it wrong statement?

I don't know, but the adding in of .text_offset looks questionable to me.
I simply don't know why such offsetting would be wanted / needed.

Jan

