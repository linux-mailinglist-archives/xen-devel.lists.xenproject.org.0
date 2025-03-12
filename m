Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61632A5D837
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910049.1316833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHV8-0006w7-AI; Wed, 12 Mar 2025 08:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910049.1316833; Wed, 12 Mar 2025 08:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHV8-0006tu-7c; Wed, 12 Mar 2025 08:31:42 +0000
Received: by outflank-mailman (input) for mailman id 910049;
 Wed, 12 Mar 2025 08:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHV7-0006to-1V
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:31:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa83d55-ff1c-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 09:31:38 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so23770645e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:31:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d1666sm13841975e9.40.2025.03.12.01.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:31:37 -0700 (PDT)
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
X-Inumbo-ID: 6aa83d55-ff1c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741768298; x=1742373098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTnd/gKQCKWCasnzsOQs105SOTin9YnfxhFLcOkSEyA=;
        b=JAEs3Rv68o4+g5sl0Ms0X2UQVmBH9zsfxFf7X85zopkt/3aqC+XT5QgB5Vl8OIl30l
         /829+SSgU+d1H+c+lwOZvYhCqyVvIE482Xpp/CBD1aJijPqjM4OKc+gl7OIXvPagMi2Y
         slG5R+VmsJ5oMOGpj/ZGht4S90Dk4x0NHcLgxXWzUnE00RnRh8NtPGSzdHkjfPr93mcb
         803J4hNq+fTwHzWa5vguBEym5iCOfsYfmajK+kRjCdlCvY6WWL/UtuFm/TYOkvTrY330
         RujRC8ELHwPaQiD6VtPsN6HC0V5vG+1pmkSTy4uFmvzm6cWC33fbBgtZTdc/fkTasW/R
         MgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768298; x=1742373098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTnd/gKQCKWCasnzsOQs105SOTin9YnfxhFLcOkSEyA=;
        b=T/UAKqYNE4+s0y+8Wl9So1vevGzp0lh3MJ1R4ms7KaIJpymO9gU/NT0cC/OKl/rDr5
         enzIzzJpC0y/Zn3mVPDXX9Wuheshddf7/GQGrXGmYRb4Ou1qGAOBlckiKL4gqrpMXP8K
         OSZYYmw6/hvXi4MMW7uhd0DSjn8Jt2DmPx6GlGC4KF4GVgtXPgYJrMtcJXWmMvz9kMrR
         YSqwk3O1x0QYBqaP97O+cp3k4ysncX5Ei0GOMhafTP/TPLPQpFo6es4GAIxCTp4L+0i9
         rCRno1YrSeWtWmMB83ePSXsQ1s9wqDCRZZOrZpBmxHG1Q/6FnStzMYcCGEWJ6EIb/rZX
         sDSg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ueHF7HkcoxiDTRBe9KWvFWu47D26ZF/Ir4WXg1aH09KfObUjTx4IhskCZj7oG/tVRELzqxIRxBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd696moTHbQzw6VDdI8/tsmLxH3knNAoZISd+llcZMzGAgk6mS
	jxkXxu5JtnAwmdM/odneuY5f3Lmork27XlaoeRXzn3jNtyQJ/XWvdiUyTtMU4w==
X-Gm-Gg: ASbGncvksbI/O4Gf9Ol4r3YfB377QSu1enI0dE9AKcJpaykmoO7YNZvyXH23/xnDX29
	4+MijEl6T5a6Pj9ISSbwlUMUWZoKz8+YCcDNA175VJFmrVsYY02El5FJqdyG6c098IN/1MZOsCg
	dRojczjMxvkcaDyzLrw/mJNPfTNhpGvArf0hAAmMjtQ2m6lM1CpQNq9w+nYDucLS8dtUk/bY18+
	ehMwUa+5sW5JGrO4kvrs7IFUTPQ77o6VekEa8xuo/6T0YQ2cGY/OW+rZCRJABnsKIqlG7u5Df7x
	FsdZVtRmVMLxilk60UYDCNOKe0RqFfbmEsAxogFtFqfB/Lz/+v4fa6DSEmKXR1T//JPu2UVZlib
	Z4AgXDzrt+isU/r4Ey+FZGAaZ1G5aIQ==
X-Google-Smtp-Source: AGHT+IHrHh/TaluzVfs1MS/hF3+autYRKYmqDqYwuSNPPRhScIN5XdBu9TC0tii0nr3RIzDiuGf0CQ==
X-Received: by 2002:a05:600c:b95:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43cec97779fmr149475225e9.11.1741768298077;
        Wed, 12 Mar 2025 01:31:38 -0700 (PDT)
Message-ID: <0565db90-5734-4795-8988-efd3e72cc770@suse.com>
Date: Wed, 12 Mar 2025 09:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
 <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
 <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
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
In-Reply-To: <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 21:47, Andrew Cooper wrote:
> On 06/01/2025 11:54 am, Jan Beulich wrote:
>> On 06.01.2025 12:26, Andrew Cooper wrote:
>>> Regular data access into the trampoline is via the directmap.
>>>
>>> As now discussed quite extensively in asm/trampoline.h, the trampoline is
>>> arranged so that only the AP and S3 paths need an identity mapping, and that
>>> they fit within a single page.
>>>
>>> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
>>> expected of the trampoline to be mapped.  Cut it down just the single page it
>>> ought to be.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.  However,
> 
>> on the basis that this improves things. However, ...
>>
>>> --- a/xen/arch/x86/x86_64/mm.c
>>> +++ b/xen/arch/x86/x86_64/mm.c
>>> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
>>>  {
>>>      BUG_ON(num_online_cpus() != 1);
>>>  
>>> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
>>> +    /* Stop using l?_bootmap[] mappings. */
>>>      l4e_write(&idle_pg_table[0], l4e_empty());
>>>      flush_local(FLUSH_TLB_GLOBAL);
>>>  
>>> -    /* Replace with mapping of the boot trampoline only. */
>>> +    /*
>>> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
>>> +     * is arranged to fit in a single page.
>>> +     */
>>>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
>>> -                     PFN_UP(trampoline_end - trampoline_start),
>>> -                     __PAGE_HYPERVISOR_RX);
>>> +                     1, __PAGE_HYPERVISOR_RX);
>> ... literal numbers like this - however well they are commented - are
>> potentially problematic to locate in case something changes significantly.
>> The 1 here really would want connecting with the .equ establishing
>> wakeup_stack.
> 
> how do you propose doing this?
> 
> PFN_UP(wakeup_stack - trampoline_start) doesn't have the same obvious
> connection, and it would involve partly undoing 7d73c6f196a5 which hid
> the symbol recently.
> 
> While 1 isn't ideal, it is next to a comment explaining what's going on,
> and it's not going to go stale in a silent way...  (It's also not liable
> to go stale either.)

If in

        .equ    wakeup_stack, trampoline_start + PAGE_SIZE

PAGE_SIZE was replaced by a new (in asm/trampoline.h) TRAMPOLINE_PERM_SIZE,
you could use PFN_UP(TRAMPOLINE_PERM_SIZE) here to establish a connection.

I have to admit I also don't really see why things going stale here would
(a) be unlikely and (b) be guaranteed to not go silently. We just don't
know what we may need to add to the trampoline, sooner or later.

Jan

