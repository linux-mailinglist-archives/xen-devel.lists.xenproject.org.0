Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1D90208F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737208.1143403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdRb-0002iZ-D1; Mon, 10 Jun 2024 11:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737208.1143403; Mon, 10 Jun 2024 11:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdRb-0002gY-A0; Mon, 10 Jun 2024 11:44:11 +0000
Received: by outflank-mailman (input) for mailman id 737208;
 Mon, 10 Jun 2024 11:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdRa-0002gS-0v
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:44:10 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf731d62-271e-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:44:08 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so208771466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:44:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f188a5162sm188434866b.81.2024.06.10.04.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:44:07 -0700 (PDT)
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
X-Inumbo-ID: bf731d62-271e-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718019848; x=1718624648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nabna8pHSgnlv31SaIuDo73RdgCTyIgBJ3uEhhULGYE=;
        b=FgohtixbkooMR4EdiOVRR7GYz75OQ+mWDCkjLVFY+4VMfuthjcsa0Rcpk3E42lptrO
         XpWb2dRUwUrNeNnBRVx4agB6k7McuBW5FKn0jigkgmP28CgKkgXJ31I6j2dfIVgRDBZb
         TwD7z+AdJgCzVqbcwWi3jTsYz2sFFrc4BDOtWJbczHBrYXCxVWqvyCb0uavbLzeurN5I
         TKfOxfY3aV1hql9t5IX12oJS85hxnCVRoN7mTEWpPMUZaSspf/j1svu173ktgG0+ixYo
         JrwTJCNku/tUhmbiFaXadWBqhDODfWjx6NfJGxQ9kX5za0YT4jhLiCnr542gSAZl0nSm
         uKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718019848; x=1718624648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nabna8pHSgnlv31SaIuDo73RdgCTyIgBJ3uEhhULGYE=;
        b=njCrmqeaGtVtOXolfSvtlVhrJeSDRUe13B0mAtiGHKdwgAOTwWE7YUePpRBEVQbCwB
         wINbCHYSIT8qCi5DUQ57D1/Jd3R6pgZbCKzI9iRxYgYnaEa6M4hOgPznjoDs/29CUh9N
         hNHSquutOQ4QzwBIjzEfeoc5ECfxTgTkZZsqaDkUaQ03NmRccHyXEFXMQD0r9ff8loPI
         rkUESw0drAUOWFZfhudaMVOTUWzkXWoNm99Wt0CMIkvuZCkM3WnFoXe1jfcswm7kAO/1
         GYA0JN4x900T6FQgeG02IC8sk6c9Urq4X33+0q5Pxji0P00asHOcAI+YlYh5wj+pRG9K
         1LYw==
X-Forwarded-Encrypted: i=1; AJvYcCXuvGPbcjL/g9ym52/cyxQbnmchUHMH9eFi6+CCB4r9YS4u68jJcGWlIQrr4NurrBxZysbDEBsBWLmmpPztxsO0Y7H0yMkI7+f7elv5qJY=
X-Gm-Message-State: AOJu0Yx7qund0jkWssVvujXrDQx1EwZICpaWjKDBUtp30Vw+4DMOEvMv
	BYvbHy3K9r16IpHY955CYl05DBIXpyjCHzxWNRHBZQUud4IqQw+5QYbuk1VJUQ==
X-Google-Smtp-Source: AGHT+IHNDj6qcYxui4p4BtTAc/gqUvGli4rMnqkhvVE5nw4PvIpGHKgqh67hxaFbSnI1BtI3WWTswQ==
X-Received: by 2002:a17:906:f5a0:b0:a6f:1702:e131 with SMTP id a640c23a62f3a-a6f1702e8fbmr223693666b.49.1718019848188;
        Mon, 10 Jun 2024 04:44:08 -0700 (PDT)
Message-ID: <9cf06291-3389-4241-9d20-4b5411fb3d2e@suse.com>
Date: Mon, 10 Jun 2024 13:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vcpumask_to_pcpumask() case study
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
 <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
 <1745d84b-59b7-4f90-a0a8-5d459b83b0bc@citrix.com>
 <afc347c0-ca2f-4972-b895-71184b1074ea@suse.com>
 <e56a4519-9d4e-4267-a189-e8e2fec1518b@citrix.com>
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
In-Reply-To: <e56a4519-9d4e-4267-a189-e8e2fec1518b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 12:12, Andrew Cooper wrote:
> On 10/06/2024 8:15 am, Jan Beulich wrote:
>> On 07.06.2024 14:35, Andrew Cooper wrote:
>>> On 03/06/2024 10:19 pm, Jan Beulich wrote:
>>>> On 01.06.2024 20:50, Andrew Cooper wrote:
>>>>> One of the followon items I had from the bitops clean-up is this:
>>>>>
>>>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>>>> index 648d6dd475ba..9c3a017606ed 100644
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
>>>>>              unsigned int cpu;
>>>>>  
>>>>>              vcpu_id = ffsl(vmask) - 1;
>>>>> -            vmask &= ~(1UL << vcpu_id);
>>>>> +            vmask &= vmask - 1;
>>>>>              vcpu_id += vcpu_bias;
>>>>>              if ( (vcpu_id >= d->max_vcpus) )
>>>>>                  return 0;
>>>>>
>>>>> which yields the following improvement:
>>>>>
>>>>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
>>>>>   Function                                     old     new   delta
>>>>>   vcpumask_to_pcpumask                         519     485     -34
>>>> Nice. At the risk of getting flamed again for raising dumb questions:
>>>> Considering that elsewhere "trickery" like the &= mask - 1 here were
>>>> deemed not nice to have (at least wanting to be hidden behind a
>>>> suitably named macro; see e.g. ISOLATE_LSB()), wouldn't __clear_bit()
>>>> be suitable here too, and less at risk of being considered "trickery"?
>>> __clear_bit() is even worse, because it forces the bitmap to be spilled
>>> to memory.  It hopefully wont when I've given the test/set helpers the
>>> same treatment as ffs/fls.
>> Sorry, not directly related here: When you're saying "when I've given"
>> does that mean you'd like Oleksii's "xen: introduce generic non-atomic
>> test_*bit()" to not go in once at least an Arm ack has arrived?
> 
> If we weren't deep in a code freeze, I'd be insisting on some changes in
> that patch.
> 
> For now, I'll settle for not introducing regressions, so it needs at
> least one more spin (there's a MISRA and UB regression I spotted, but I
> haven't reviewed it in detail yet).

Did you point this[1] out to him? I've just checked, and I can't seem to be
able to find any reply of yours on any of the respective sub-threads, which
formally still means the patch would be fine to go in as is once an Arm ack
arrives (taking the same approach as you did elsewhere wrt a PPC one). It's
just that informally at least I now know to wait ...

Jan

[1] It'll likely be embarrassing to learn what I've overlooked during the
many rounds of review.

> But yes - they're going to end up rather different when I've applied all
> the compile time optimisations which are available.
> 
> ~Andre


