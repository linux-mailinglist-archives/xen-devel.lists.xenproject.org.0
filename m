Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911999B5BD3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 07:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827898.1242661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t62L3-0000XA-O2; Wed, 30 Oct 2024 06:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827898.1242661; Wed, 30 Oct 2024 06:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t62L3-0000US-IN; Wed, 30 Oct 2024 06:37:53 +0000
Received: by outflank-mailman (input) for mailman id 827898;
 Wed, 30 Oct 2024 06:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t62L2-0000UM-PU
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 06:37:52 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 794110ea-9689-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 07:37:46 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so987916266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 23:37:46 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c816:25ef:94da:68a4:e7f?
 (p200300cab721c81625ef94da68a40e7f.dip0.t-ipconnect.de.
 [2003:ca:b721:c816:25ef:94da:68a4:e7f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298ddbsm545229366b.142.2024.10.29.23.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 23:37:45 -0700 (PDT)
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
X-Inumbo-ID: 794110ea-9689-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5NDExMGVhLTk2ODktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjcwMjY2LjI0MzMyNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730270266; x=1730875066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EiMr7waJ8Y2vD1jForMjqRGAE5NffveGXuOE/1vAqLE=;
        b=Alpe/kUyl+pJO4PGd9sks2C2ViPH2Q4AaEf+mLmSy2or62wNvnxOrptYyteyEzJoLW
         UWKQlvUURWfw+ge2A8k4kts0Qw08gp6gHonbmcWHm1hY2NwSs+HFtoVA3z7xiiXq9SYT
         tys2q2lwONQJojZloPnIZaphwzUo7qQHCRYQQTpqJB4fsQn854c9NGxuzMzhbpYZdblQ
         TQlNiTQvPCC3TiJ1I/xC7H2Ev+xdEChFVpKqILq3Qgey1sRjyPkJlzgrtes8+PyHWdak
         lSAtU/KAFz0N5sJmyfTCwZwpfynmjGrlaxThZ+i6aukz1olkDeZrMjdDmnpMt/6+a462
         i2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270266; x=1730875066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiMr7waJ8Y2vD1jForMjqRGAE5NffveGXuOE/1vAqLE=;
        b=V9J9EFIVZkX502bs5gZS+h6Z/6F2Sz8rhqXuAL7XFlGGqX+0yyIFYL3gW6aRAUARe/
         d6yYm4TLQdKAeRq1tLhiRxKXxfLN7OOqcEzEpFq8usDGZHD4SpFjikpc6ek87LCQA8j9
         LqKheJSItgC/b/C4PuC7kLGWulG0jH/EwkZZiYdvhmGI+I/579VqGRYxgO8v5nswos4I
         pBr4ZwZ4Rs+KNuIpJN7Yd2w8yHwYOxSOcLsGUpBt+O2iUs3lRL0ArMlcTqtzy3WnkOeJ
         bw8SKYQoiq5vgmkBQNWJFD/Qf/4hEiHCMZ8V+pB0lEGjTAT1BK4kbAcTarbdlZvnz0q3
         dTAA==
X-Forwarded-Encrypted: i=1; AJvYcCUeELWRAHgDcTgbuZgUnILJPpJFPdpJvrQgqOcPcBtMjJ6Gixz+9l3tNWjUdeImAFrG0iIwrLdv7Sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxloBB+sINCeIQJwUXXnQoe18Ce3cgOzXcgEIqeG09hjlJStJDL
	BQE7iUUAxieCBnF2lyvnk56weq5bDtEz8Hx+bJhnF1FuMqoaeIZL2g2ol+5SmQ==
X-Google-Smtp-Source: AGHT+IHqa3LEgIMK+9ylqqqpjk+N7I91lnnQwH5dZeGmPgmbAXUSjGvxnIZxBf8gbEZY+HTvO8MgWg==
X-Received: by 2002:a17:907:a07:b0:a99:4ebc:82d4 with SMTP id a640c23a62f3a-a9de6192c15mr1566193566b.55.1730270265565;
        Tue, 29 Oct 2024 23:37:45 -0700 (PDT)
Message-ID: <b143ada2-9719-4701-9a03-36ee8607958f@suse.com>
Date: Wed, 30 Oct 2024 07:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-3-alejandro.vallejo@cloud.com>
 <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>
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
In-Reply-To: <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 21:30, Andrew Cooper wrote:
> On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
>> @@ -310,19 +309,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>          break;
>>  
>>      case 0xb:
>> -        /*
>> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
>> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
>> -         * to guests on AMD hardware as well.
>> -         *
>> -         * TODO: Rework topology logic.
>> -         */
>>          if ( p->basic.x2apic )
>>          {
>>              *(uint8_t *)&res->c = subleaf;
>>  
>> -            /* Fix the x2APIC identifier. */
>> -            res->d = v->vcpu_id * 2;
>> +            /*
>> +             * Fix the x2APIC identifier. The PV side is nonsensical, but
>> +             * we've always shown it like this so it's kept for compat.
>> +             */
> 
> In hindsight I should changed "Fix the x2APIC identifier." when I
> reworked this logic, but oh well - better late than never.
> 
> /* The x2APIC_ID is per-vCPU, and fixed irrespective of the requested
> subleaf. */

Can we perhaps avoid "fix" in this comment? "Adjusted", "overwritten", or
some such ought to do, without carrying a hint towards some bug somewhere.

>> --- a/xen/include/public/arch-x86/hvm/save.h
>> +++ b/xen/include/public/arch-x86/hvm/save.h
>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>      uint32_t             timer_divisor;
>>      uint64_t             tdt_msr;
>> +    uint32_t             x2apic_id;
>> +    uint32_t             rsvd_zero;
> 
> ... we do normally spell it _rsvd; to make it extra extra clear that
> people shouldn't be doing anything with it.

Alternatively, to carry the "zero" in the name, how about _mbz?

Jan

