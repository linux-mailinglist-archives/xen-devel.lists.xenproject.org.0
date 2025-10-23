Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DCC02293
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149345.1481009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxMQ-0000Uf-Hh; Thu, 23 Oct 2025 15:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149345.1481009; Thu, 23 Oct 2025 15:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxMQ-0000Sj-EX; Thu, 23 Oct 2025 15:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1149345;
 Thu, 23 Oct 2025 15:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxMO-0000Sb-V9
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:36:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 032f7f43-b026-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:36:15 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso5003825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:36:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f292sm41216065e9.5.2025.10.23.08.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:36:14 -0700 (PDT)
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
X-Inumbo-ID: 032f7f43-b026-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761233775; x=1761838575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qdJ4H98tRAS1gKh7YjwKN+5/C0yUxoA7rjs5WXIoDPw=;
        b=ZazIBsetwytqixS5UvjCKMTxCcxzoFr8BXjPKAFGxuLorpvSbYSnLeL9dyuxuhEyeI
         he9VSvM8rNU6JZhjV2E6zlsqdWuYONKSXoiDAgISXK2W7H2m0iaXyxSlwG5K4aku/6wl
         4JwrLyJPv9xV1x6Y2gr+p4CKYgghfWlFT769ATsCYrQLnm8IHXIFjgzqtqXzdtWR5BUR
         1jmDUQmc2EFL7kWvNl9L8rYpHMY2twMm9boSzd2/PHttHpfkD/cNCelIa2XvwCaVi09h
         FPxAXkLeEbmXhet8DyCfIzZP7S9zzJP3F99zloQivWZ2Hj8im9UhjHRRhTkGsCElfYQt
         1qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761233775; x=1761838575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdJ4H98tRAS1gKh7YjwKN+5/C0yUxoA7rjs5WXIoDPw=;
        b=V8GpbsGf+vcDFr/brKJKnjmfjtKpcivbT6NE9B/iCIoUllv9gCb1/a4WZKWs3nqzle
         E4TMWxgVLc+vx/2rTmU/dWDYCYgBtRW2cMTyHSyjuC2Y1xBSlU/ZtNSRpuHcX2ZkCSmZ
         cuA1lucQJg/BioEvYi+3j+l9NqNTU/UZVNR+VPTdlycvoJjm/NIGXCPNGYpDTegFa0aF
         toVH5goxdupqCL5lANPpI+Zq3hphe1NyWH7zX6QshHJBfpHcApXZpxKbXH8NLHbk32mh
         12SuGSLb16zPm29Lldu34rm1h91CC8uHfP0bswG3iVp6gaoeryxVgg1d2iOtG8Vp9aEv
         /e8g==
X-Gm-Message-State: AOJu0YxfnE4d6BYUVATk/tKtKL2NoWwbJ6J4sulUCSi8wVUVDQ/SgXrZ
	m9J8bYGz79nRJIYCgZeE7iloGG5QAxlNLf8GTtCxQF067fSjBNQixixZ8hqS8OmX4Q==
X-Gm-Gg: ASbGnctpIN+3NtqhsHMxM3BSg47RTJQ3IvGmIXNIc+cveIbpxn1amorEttqsXGzM6CO
	6Pmcerf+T4eiiZyUMDakmy40gYjuedKrqOliCNZFaGMIbi5JbQzoAPVvMy14VQGRHXeuRoWpkj6
	iiqPCAtjib2mDjfiZjHmL5CncuX2W5yFGhe4v7Q41QsBzqMNDogy3dBggOsoU2Y3Uar34GaGSdK
	gmAG6rInrDh5ii+TszKlx2mHw/xzQVV4BflYxFoHr0GmVxqKofEDc8xW31aOhRQGZdL5DS3jTSm
	bq/YzNKJ5t2+zrIhpe6MUZeABG7ZmNt4Zm43xFuKgoi5lmTyEB4Ipp5kWGHu2eZoXdXWp7WxBbb
	ppQSsgnpk3rh2X+9J6TCTGbRJa6w3q1k4lfdUMHZKq4DUcuh5hhgrUM2pt2UXUxdf7L18Cu1GXX
	vA69PpeaViyTYfZ60BS5BIgEIF8VtpTgJUlFOxfzbV9xtieXD2IZsKUp5O2wTo
X-Google-Smtp-Source: AGHT+IGSJ9Nt/Ox1DX3GkH1wVEcsggwmfZDAuxZ3BKf3RvjJfux9wFCgSUP+Ullpbv8GDps9nlvAdQ==
X-Received: by 2002:a05:600c:4f09:b0:471:a73:9c49 with SMTP id 5b1f17b1804b1-475caf930dfmr26068025e9.2.1761233775200;
        Thu, 23 Oct 2025 08:36:15 -0700 (PDT)
Message-ID: <528772c4-1cc1-4f2b-a8fd-cf085a910ee6@suse.com>
Date: Thu, 23 Oct 2025 17:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com> <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com> <aPePepQk3t6gxMR1@Mac.lan>
 <16d62ac6-6666-4bad-be59-324cec634a20@suse.com> <aPnpvtXOoYSXXsT-@Mac.lan>
 <47c1fb5e-abd5-40a8-b581-be8494be3861@suse.com> <aPokVBHr760Zixcs@Mac.lan>
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
In-Reply-To: <aPokVBHr760Zixcs@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 14:49, Roger Pau Monné wrote:
> On Thu, Oct 23, 2025 at 12:37:22PM +0200, Jan Beulich wrote:
>> On 23.10.2025 10:39, Roger Pau Monné wrote:
>>> On Wed, Oct 22, 2025 at 11:21:15AM +0200, Jan Beulich wrote:
>>>> On 21.10.2025 15:49, Roger Pau Monné wrote:
>>>>> On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
>>>>>> On 20.10.2025 18:22, Roger Pau Monné wrote:
>>>>>>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
>>>>>>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>>>>>>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>>>>>>>  {
>>>>>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>>>>>>> +    struct msi_msg msg = ch->msi.msg;
>>>>>>>>  
>>>>>>>>      ASSERT(!local_irq_is_enabled());
>>>>>>>>      spin_lock(&desc->lock);
>>>>>>>> -    hpet_msi_mask(desc);
>>>>>>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>>>>>> -    hpet_msi_unmask(desc);
>>>>>>>> +
>>>>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>>>>>> +
>>>>>>>> +    /*
>>>>>>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>>>>>>>> +     * actual update below (either of the IRTE or of [just] message address;
>>>>>>>> +     * with interrupt remapping message address/data don't change) now being
>>>>>>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>>>>>>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>>>>>>>> +     * keeps setting the new deadline only afterwards).
>>>>>>>> +     */
>>>>>>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>>>>>>>> +
>>>>>>>>      spin_unlock(&desc->lock);
>>>>>>>>  
>>>>>>>> -    spin_unlock(&ch->lock);
>>>>>>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>>>>>>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>>>>>>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>>>>>>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>>>>>>>> +    {
>>>>>>>> +        ch->msi.msg = msg;
>>>>>>>> +
>>>>>>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>>>>>> +        {
>>>>>>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>>>>>>>>  
>>>>>>>> -    /* We may have missed an interrupt due to the temporary masking. */
>>>>>>>> -    if ( ch->event_handler && ch->next_event < NOW() )
>>>>>>>> -        ch->event_handler(ch);
>>>>>>>> +            ASSERT(rc <= 0);
>>>>>>>> +            if ( rc > 0 )
>>>>>>>> +            {
>>>>>>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>>>>>>> +                ASSERT(msg.address_lo ==
>>>>>>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>>>>>>> +            }
>>>>>>>
>>>>>>> The sequence of asserts seem wrong here, the asserts inside of the rc
>>>>>>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
>>>>>>> ahead of them?
>>>>>>
>>>>>> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
>>>>>> we ought to check (and presumably fail on) data or address having changed.
>>>>>
>>>>> Right, but the ASSERT(rc <= 0) will prevent reaching any of the
>>>>> followup ASSERTs if rc == 1?
>>>>
>>>> Which is no problem, as we'd be dead already anyway if the first assertion
>>>> triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
>>>> out a necessary change in AMD IOMMU code).
>>>
>>> Right, so and adjusted if condition plus an ASSERT_UNREACHABLE() at
>>> the end of the if code block?
>>
>> That is, instead of
>>
>>             ASSERT(rc <= 0);
>>             if ( rc >= 0 )
>>             {
>>                 ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>                 ASSERT(msg.address_lo ==
>>                        hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>             }
>>
>> you'd prefer
>>
>>             if ( rc >= 0 )
>>             {
>>                 ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>                 ASSERT(msg.address_lo ==
>>                        hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>                 ASSERT_UNREACHABLE();
>>             }
>>
>> ? That's wrong though (for rc == 0), i.e. I fear I don't see what you mean.
> 
> Oh, I see, sorry for the suggestions, it's indeed wrong.  FTAOD, what
> do you plan to use then here?

The earlier of the two code fragments presented above.

> You could replace the ASSERT_UNREACHABLE() for ASSERT(rc == 0) in my
> suggestion I think?
> 
> Or maybe just do:
> 
> ASSERT(rc <= 0);
> if ( !rc )
> {
>     ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>     ASSERT(msg.address_lo ==
>            hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> }
> 
> Was your original intention with those checks to ensure that for the
> rc == 0 case the message fields remained unchanged?

Well, originally the condition was "rc > 0", mainly to document the expectations.
Now that I changed it to "rc >= 0" (helping to find an issue in AMD IOMMU code
that needed addressing), I'm indeed (also) after checking for "no change" in the
"rc == 0" case. Hence why I've ended up with the code fragment above.

I guess it might be best if I post v3 before leaving today, and we take it from
there.

Jan

