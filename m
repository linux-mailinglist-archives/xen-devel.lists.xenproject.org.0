Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKByFtK36GmgPAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:58:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05BD445A16
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290407.1570013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWDE-0005aP-8t; Wed, 22 Apr 2026 11:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290407.1570013; Wed, 22 Apr 2026 11:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWDE-0005WG-5E; Wed, 22 Apr 2026 11:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1290407;
 Wed, 22 Apr 2026 11:57:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFWDC-0005Vw-Ns
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:57:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFWDB-00Fegp-Q1
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:57:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b7b3-e002-0a2a0a5209dd-0a2a4506e848-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:57:45 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b7b9-7371-0a2a45060019-d155dd36c8e4-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:57:45 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso3683383f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:57:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1405sm44837387f8f.4.2026.04.22.04.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 04:57:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1776859065; x=1777463865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GSk8rVEDKF8QMfakJ7DVBlI1SofoX5vaDroyYmD281Y=;
        b=PnA3Bj3ctghUnKh2xQcGnbzl1IJN3wrz7xbcDlM5kmo77X+oI7eioRwZfDoUf0DFHC
         fKpJHcX4bSGUWX+DvxdTf9Q/9dRo+a0DNGBPBWeXqN+5kRD/1g9NXGnT0WKHwI/tk1rH
         uyKk3F6ONmOv2yFrmEDvYymrMtqpLrUOcopx8nHmR4uj3Y2VDWqZIEkLxo+2037jGRGn
         PMi5cizfvyeJ2WaMisLldWtI7l4+iEj7Z0jFIEqaJHUm2IHTjFoIm03/z3dAFxu/zPj/
         NYXXk/Q9zqM5vWwkKy7c7YTH/F7XIlSb3o+xe4vy/deL15+M/Ok63T/XpHIN+0RUxTm9
         gWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859065; x=1777463865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSk8rVEDKF8QMfakJ7DVBlI1SofoX5vaDroyYmD281Y=;
        b=Zsw/D8wl+g2wWIZcEaGKT3bHbCG1h8XOKSfp7/feuwTYUPFYlf+ZxLkhKo4TbKRPbT
         8R3ML27Jk5i06lZI8KzUUARLFAZTmh5bP0oxCGd5Nx2Yu9bRORLrB51GXf01HLY3SbLz
         fL++VzC9iMAammIZxGYHrqF9oaLI4ypmiAchxSypzNYz3DK3mIIkjeIxAIu7ddFUGaQc
         WLcczggT1AO2r5CWPR4LsGsq1Dd3r6QI4TKcqTn/0dUHlK2oQ4Vbmq9UgsFliHeB/Db1
         ZPDOTibUHPTP/Tl9eOpSXKgzqb+9NtLUKTAtdP24672SwlDpwMaFxu+IbjUtoIvk4TTl
         Lj1g==
X-Forwarded-Encrypted: i=1; AFNElJ9ui6yDK2yyP0iBZtfn9bKQdCNv5RJQnMl34hbWxwuAbByHsi63K+0OVha8/gcJrNyAv54Rytv0HCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6EX3laOKyofOUDuyiL5r6UIc3aH2dTwOIzVlcAKVXreOFUZIf
	vWSxXGsshukusntjtFZsX3+RDgtAwkwv3Ey5Le/uNdeThFWdj5UD+Qmv013azxsp2g==
X-Gm-Gg: AeBDietqBByMF2QUCkbc/zYfzMUZ9wTqWNaJDc7gMMKx1iYInW9/0Tb62tF28HKj0Rl
	GBlT4+VpcHEGRi85wyJ/cFGkKCBlacQH8zGjEz4Vp2AlCPRUEE+G4CWu67s4eYh882j3xzU26rj
	2954qgFeut7mVTj757E/MOY+v7bww+IyrU8SnUKjrmeQxpeab/P6lDJ1vwb88/MXLpsOqbjP/xf
	7TR6jNX3bF37MZzTW3OU9OdxbOSiCOEgZFl6OWQkUAJEPtsql0VRSGwOq3gkn4YLpqfFok8CqMp
	gF0kCEOkMT++4qNYkPAdutLgs0smRgCeZg2ubfJsATyiYjU0aC8EUN3/7HErH/WvvNZpEltvu15
	NtRz/PdRJlhhIDx9AuKijC9gwt1NHlh/FBRUmh27aVuYSIabznxW3EVqKGNGjIj/kYIe8Tg3uwM
	hgzeLZLrCZLQW4FIG4vO2uG/qDYAAM7MEWxFz6ghuUG9NMNB2ZoTcJQNfs70NJasZe2NEN1Kc/w
	kpODNSzUtdd/R72hljfNobDww==
X-Received: by 2002:a05:6000:22c5:b0:43d:4b00:9ee7 with SMTP id ffacd0b85a97d-43fe3e10b0dmr33929492f8f.33.1776859064953;
        Wed, 22 Apr 2026 04:57:44 -0700 (PDT)
Message-ID: <d493eee4-bc83-4a44-8568-3a18ddc90d4c@suse.com>
Date: Wed, 22 Apr 2026 13:57:43 +0200
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
In-Reply-To: <b6c4a111-6c37-4850-962a-5b401a4a5655@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776859065-51361D75-6307B915/0/0
X-purgate-type: clean
X-purgate-size: 5046
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: C05BD445A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 13:45, Oleksii Kurochko wrote:
> On 4/21/26 10:57 AM, Jan Beulich wrote:
>> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>>> +{
>>> +    paddr_t load_addr = INVALID_PADDR;
>>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>> +    unsigned int nr_banks = banks->nr_banks;
>>> +    unsigned int bi;
>>> +
>>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
>>> +
>>> +    /*
>>> +     * At the moment, RISC-V's Linux kernel should be always position
>>> +     * independent based on "Per-MMU execution" of boot.rst:
>>> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
>>> +     *
>>> +     * But just for the case when RISC-V's Linux kernel isn't position
>>> +     * independent it is needed to take load address from
>>> +     * info->image.start.
>>> +     *
>>> +     * If `start` is zero, the Image is position independent.
>>> +     */
>>> +    if ( likely(!info->image.start) )
>>> +    {
>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>> +        {
>>> +            const struct membank *bank = &banks->bank[bi];
>>> +            paddr_t bank_start = bank->start;
>>> +            /*
>>> +             * According to boot.rst kernel load address should be properly
>>> +             * aligned:
>>> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>>> +             *
>>> +             * As Image in this case is PIC we can ignore
>>> +             * info->image.text_offset.
>>> +             */
>>> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
>>> +            paddr_t bank_end = bank_start + bank->size;
>>> +            paddr_t bank_size;
>>> +
>>> +            if ( aligned_start > bank_end )
>>> +                continue;
>>> +
>>> +            bank_size = bank_end - aligned_start;
>>> +
>>> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
>>> +
>>> +            if ( image_size <= bank_size )
>>> +            {
>>> +                load_addr = aligned_start;
>>> +                break;
>>> +            }
>>> +        }
>>> +    }
>>> +    else
>>> +    {
>>> +        load_addr = info->image.start + info->image.text_offset;
>>
>> Why does stuff ahead of text_offset not need loading?
> 
> Here we just calculating only a place where kernel will be loaded. The 
> full kernel image will be loaded in kernel_image_load().

Okay, but if you calculate an address where the full image won't fit,
how are things going to work?

>>> +        WARN_ON(!IS_ALIGNED(load_addr, KERNEL_LOAD_ADDR_ALIGNMENT));
>>> +
>>> +        for ( bi = 0; bi != nr_banks; bi++ )
>>> +        {
>>> +            const struct membank *bank = &banks->bank[bi];
>>> +            paddr_t bank_start = bank->start;
>>> +            paddr_t bank_end = bank_start + bank->size;
>>> +
>>> +            if ( (load_addr >= bank_start) && (load_addr < bank_end) &&
>>> +                 (bank_end - load_addr) >= image_size )
>>
>> Do we have to fear overflow? (If so, shouldn't such an image be rejected
>> rather than an attempt being made to place it?) If not, simply:
> 
> Just for a case. As a user may control load_addr and image_size it could 
> be some combination which will lead to overflow here.
> 
>>
>>              if ( (load_addr >= bank_start) &&
>>                   (load_addr + image_size <= bank_end) )
> 
> I will add the following:
>          /*
>           * Reject a malformed image before the loop to avoid wrapping
>           * load_addr + image_size in the per-bank check below.
>           *
>           * image_size covers the kernel from _start (placed at load_addr =
>           * start + text_offset) through _end.  The alignment gap
>           * [start, load_addr) is padding and need not lie within a bank.
>           */
>          if ( image_size > (paddr_t)-1 - load_addr )
>              bi = nr_banks;
>          else
>              for ( bi = 0; bi != nr_banks; bi++ )
>              {
>                  const struct membank *bank = &banks->bank[bi];
>                  paddr_t bank_start = bank->start;
>                  paddr_t bank_end = bank_start + bank->size;
> 
>                  if ( (load_addr >= bank_start) &&
>                       (load_addr + image_size <= bank_end) )
>                      break;
>              }

Please consider getting away without "else" (and hence with one level
less of indentation):

         bi = image_size <= (paddr_t)-1 - load_addr ? 0 : nr_banks;
         for ( ; bi != nr_banks; bi++ )
         ...

>> Also, does image_size really only cover space starting from .text_offset,
>> rather than from .start?
> 
> image_size covers total memory the kernel occupies at runtime.

Which emphasizes the remark further up.

Jan

