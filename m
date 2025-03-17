Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039CEA651D8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916917.1321921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAtn-00012O-5U; Mon, 17 Mar 2025 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916917.1321921; Mon, 17 Mar 2025 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAtn-0000zy-2u; Mon, 17 Mar 2025 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 916917;
 Mon, 17 Mar 2025 13:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuAtm-0000zr-Gd
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:52:58 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21a72cb5-0337-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 14:52:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so4181917f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:52:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe29386sm105743075e9.17.2025.03.17.06.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:52:56 -0700 (PDT)
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
X-Inumbo-ID: 21a72cb5-0337-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742219577; x=1742824377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OI/sNQPGpE5axWZw6pXz8ry29y/MzA8Ef8wvSkNtpG8=;
        b=FYor/CsyCoJbtaZGnej94iDwjE6pNTTBDb6hxrPFb5hGyJv9SYPf+YJOrsGfB9s6S2
         JtGBuTBi1mDYAdf45Bda3tK01XZjgPS8aGJzN1cBe7vSS+2jfHBZzxXG8cPChZVyd2g/
         dB0xsgAKKsp1Ox/SCGGE8Tewzu1klXgltevTKpBNaV54ZnSinprztev8Y5xPEwUE3lc4
         2swsUG7/M3itH711B3tsnimI5zmQb/2WphJWe38J+/m8VL0WdhxpbzIp8+oCFqWU5sb0
         B5VxNRP87u3JqpyVPLHqTaTPvxUxNqkTBASfXIVwnBm3/N/VRLomMFooD/vJyJgFxi6J
         vDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742219577; x=1742824377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI/sNQPGpE5axWZw6pXz8ry29y/MzA8Ef8wvSkNtpG8=;
        b=iDdgZMiAZd+aPxmmEU9skJjMfM5REb3IZ+wQndBoLdUCpx1Oa9NMGPWb3QSAmvl0iG
         kGPj4c6AO3HoXws1AyMDbuMXKt2c61hva3tGfwq+sODeQk/kX4IQbh+gwp+NB60Tl42X
         6nUzsL1/+9K4WfypnhLO2r4hkZufEZ/8lOun7b7AbmI2AqnCtUN8FL1EIpJSpJtxWncT
         zUTi8NG5xImZhfIniyqpAJeFYfpIl7YMf/apMLJJkkgm2ha69t4qGXzjsXk3y91pzIoX
         yyAq4QbrDPQMfxqSQVIIfj0eK7UQJOf6TSX950/WfUnJPOPy6eoz+mg4xgjwfQdTPE/v
         2Cgg==
X-Forwarded-Encrypted: i=1; AJvYcCWTBLphKMa5Z6Ob6N8bteEDN9psoMv5X0JGcfmaf88qSN1wP2D0sF7R9UyRaN2R+fiV40J+wBaMpZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMEgRDP3KLLVglCh1mzpBHDbufW5SQxXcKpVMEAEVQgpkuO8pb
	Rwd2aSILHnxUxS5HSLahLLaR8rFU9s8854126J8QjrpCR7agpLb3xdqksUM3Dg==
X-Gm-Gg: ASbGncuNEeLm2peVpt7wJNIwwaQeVc9z6ay/BilAk/Vs/75cXuT8NUFSVVklmbBLzsg
	LQzs6D0ZMzdjms7bqNl8gSvoToigd00omAczCA00hTlIZw7MMjlgrqzYYMctC/uOOiTY4F89Hex
	BjhVV8U3yimRvU4Ulwx33zcV+71UiWaPQ37M5zDhEns990UvMC6lPS7OdA73yk2ufFJ7StD+hMz
	Sf29zr+GqXeqqkC8rghXO5eUliS5aNrp15dEaQfpxF2rjjywxBKeJs3MSeo2SLFApa1B00B7AyS
	Mxh6PVJdYObam5TlRzjr+voWjT1yCP3D9XmVSe1hs9TdYBKUNSvEmgJFk8Rffka3joSbxLqT/Uv
	5UrxLEEKARjB17974xQargwcHPKz331xe+SItyenU
X-Google-Smtp-Source: AGHT+IHj6I5l6w3kQkxdJAzipZCHtKcl21AZctscgUcP5B3SiIzLB1kg0HOJeb8unkcX10i5/uaJnQ==
X-Received: by 2002:a05:6000:1567:b0:391:2f2f:828 with SMTP id ffacd0b85a97d-3971ee443f8mr14426278f8f.29.1742219576650;
        Mon, 17 Mar 2025 06:52:56 -0700 (PDT)
Message-ID: <5b6364ef-53b0-4d59-acee-4df778eacbd5@suse.com>
Date: Mon, 17 Mar 2025 14:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314204920.118065-1-andrew.cooper3@citrix.com>
 <781a020c-351d-4211-ae51-8057646c28e2@suse.com>
 <6f0aa9e8-4176-4360-8031-625d99096452@citrix.com>
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
In-Reply-To: <6f0aa9e8-4176-4360-8031-625d99096452@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 14:34, Andrew Cooper wrote:
> On 17/03/2025 9:09 am, Jan Beulich wrote:
>> On 14.03.2025 21:49, Andrew Cooper wrote:
>>> ... which is more consise than the opencoded form, and more efficient when
>>> compiled.
>>>
>>> For production VMs, ~100% of emulations are simple MOVs, so it is likely that
>>> there are no segments to write back.
>>>
>>> Furthermore, now that find_{first,next}_bit() are no longer in use, the
>>> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
>>> they do need to remain unsigned int because of __set_bit() elsewhere.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> I still can't persuade GCC to do the early exit prior to establishing the
>>> stack frame, and unlike do_livepatch_work(), it's not critical enough to
>>> require noinline games.
>> Then is ...
>>
>>> --- a/xen/arch/x86/hvm/emulate.c
>>> +++ b/xen/arch/x86/hvm/emulate.c
>>> @@ -3022,18 +3022,16 @@ void hvm_emulate_init_per_insn(
>>>  void hvm_emulate_writeback(
>>>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>>>  {
>>> -    enum x86_segment seg;
>>> +    struct vcpu *curr;
>>> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
>>>  
>>> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
>>> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
>>> +    if ( likely(!dirty) )
>>> +        return;
>> ... this worthwhile at all? I'm surprised anyway that I see you use likely()
>> here, when generally you argue against its use.
> 
> No, it's not worth it.  In fact, simplifying makes the function smaller.
> 
> void hvm_emulate_writeback(
>     struct hvm_emulate_ctxt *hvmemul_ctxt)
> {
>     struct vcpu *curr = current;
>     unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
> 
>     for_each_set_bit ( seg, dirty )
>         hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
> }
> 
> gets a bloat-o-meter score of 131 down to 72 (-59).

That's surprisingly much.

> Are you happy for your R-by to stand, given this adjustment?

Certainly.

Jan

