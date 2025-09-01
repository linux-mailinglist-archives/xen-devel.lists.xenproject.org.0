Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA0B3E635
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104883.1455922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut508-0001Ta-9G; Mon, 01 Sep 2025 13:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104883.1455922; Mon, 01 Sep 2025 13:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut508-0001RT-6S; Mon, 01 Sep 2025 13:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1104883;
 Mon, 01 Sep 2025 13:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut506-0001RN-Ea
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:55:14 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c4b394-873b-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:55:12 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso253091366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:55:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042523ee7bsm306417466b.109.2025.09.01.06.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:55:11 -0700 (PDT)
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
X-Inumbo-ID: 47c4b394-873b-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756734912; x=1757339712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cn5mtr8lg8zIS/w3Ymeb58ZYdKxBWGGjPDpLEOsUKmw=;
        b=GcGzZd0Zyb+UwF/yrSRhFJmp1QpPSTQ83tyAJdO2lzIQGXrWED+4iKvAuLRgRNp8vL
         RdPsuPoVeGJW5YTkCSjPcgVVgzIBgmkCBrHih5F1Gf+njWLJHb3oKNclLNBXPIpd9reP
         VGU4YuCl2Z3gp6wOBEnCd6GyU2TZNT14ej1c7BHNehgOabOamyuqbmfNVCgGAhem3yyP
         /J0vXhwy1xjunFnuA+IYlH/OAl2vumsvBOpqsYysJ5lTWN1wBM4GaywJW3Kwqnjq0Ps1
         8+qF8NWGEzZoFjn1NcB6lrTZ0u/W4vveGJvocPcvJAwuE+0CreiDNEHzODTwjEI1j5et
         U1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734912; x=1757339712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn5mtr8lg8zIS/w3Ymeb58ZYdKxBWGGjPDpLEOsUKmw=;
        b=P/FevrefK7tJOEiWm5FRUOxoSeI1l1qnGW7C3SCMqrveNw/eGymz5+yqZWhU+Satr7
         zLgyu3R0XQVfL9pEtnj/i9f7FNluBfW+x2A0r5ghByfGK0uEixpglJUkyvSmDpOJDXV5
         6oB67CltjU/3PBuyXDOSj8quRLkt6LTQbURrgLr/LsJKjZ9QI+wsP2yJyagVZFA8oyZ0
         Vxhc0bYMgviBUE1ZaNY6m25EghBN5K6kTzYqYo1A4kzYCsiJYMke7R29MREHNXhy/CLF
         8idBM4MiKhxnhssZtXBuWR1EjJ+D2ZJvw1PSf+X5F8+Q8nVJxzNrJTODXh4mrQoIh7o+
         4ZEg==
X-Forwarded-Encrypted: i=1; AJvYcCXHgEDTy42nHMRSilARICfS6oq6HAld9m8TGVoRCoLG0K2wpplgQhjP16hEfg6Dm9siQ4jfqdk2FCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzjJxBiCqsS4Ua7vPeZDAYLzmVvSoqXqRwvBLGDPqDbQ7k/n/1
	K3G+0jOsenmOK8qGDrP4xFU68k0pXKzMkWHDVhXZ4MrAzOFEcnVrcy4aifYcYBa7zreonN2wA0s
	mu5s=
X-Gm-Gg: ASbGncuLlWnNDkGLYSuxyx+nAi0vZMWt3usx1v0AWpxdZl4iv6quDt7g/JGLNapcDIG
	Zh1FXamLUhUZYJPSB/+7PpWfulqTk6CccaNec0FwJPH5noT9KTaqQmxCimm1rY6p4PqRTnIE0bJ
	OIrifnrhqClvk8p9qrAOAn0Doygwj3crNwb0cuuu57cH/Ijdbf+HFFqaDMosvJFil3r5rGV4nAr
	N4sCgSEBKTl8e+0leL82jyiCx2JEVCQ3ixsLHhmOfX+hYVIiprqtKixPsAd2S2sP1b191oSMPME
	UC9qvdWOaXxafA0vTliYsi5B7s2efJhmT0/lIQ30t6QNVFcs9cLGaWFlU+4JOxpPQlw9aPSPhVY
	2rUP4YgExLj4h4ZQr3rccNa/vJeM0NoNTisxifuaV0yqR4Sk5JCp+148Mw3EZ+7x5hXWBXcfQsq
	QoWt4jzgg=
X-Google-Smtp-Source: AGHT+IEu0tpd2qKYcgcGJVmUGcEgddc9UlUpu90Ol2F0i3IsBuXEUKtDcFeAFf/spw5ALDA7nrLlhw==
X-Received: by 2002:a17:906:f59d:b0:afe:ae99:9d23 with SMTP id a640c23a62f3a-b01ec52d58dmr734253266b.61.1756734912123;
        Mon, 01 Sep 2025 06:55:12 -0700 (PDT)
Message-ID: <4f9ae860-ca4e-479e-be87-85326c89d9e6@suse.com>
Date: Mon, 1 Sep 2025 15:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/23] x86/pv: Exception handling in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-21-andrew.cooper3@citrix.com>
 <1800ea68-eee1-4433-aa22-954dcd226fe5@suse.com>
 <cd69d25d-0b0a-4436-a1b2-61695329a86d@citrix.com>
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
In-Reply-To: <cd69d25d-0b0a-4436-a1b2-61695329a86d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 15:27, Andrew Cooper wrote:
> On 01/09/2025 1:57 pm, Jan Beulich wrote:
>> On 28.08.2025 17:04, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -2265,9 +2265,83 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>>>  
>>>  void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>>>  {
>>> +    struct fred_info *fi = cpu_regs_fred_info(regs);
>>> +    uint8_t type = regs->fred_ss.type;
>>> +    uint8_t vec = regs->fred_ss.vector;
>>> +
>>>      /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
>>> -    regs->entry_vector = regs->fred_ss.vector;
>>> +    regs->entry_vector = vec;
>>> +
>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>> +        goto fatal;
>>> +
>>> +    /*
>>> +     * First, handle the asynchronous or fatal events.  These are either
>>> +     * unrelated to the interrupted context, or may not have valid context
>>> +     * recorded, and all have special rules on how/whether to re-enable IRQs.
>>> +     */
>>> +    switch ( type )
>>> +    {
>>> +    case X86_ET_EXT_INTR:
>>> +        return do_IRQ(regs);
>>>  
>>> +    case X86_ET_NMI:
>>> +        return do_nmi(regs);
>>> +
>>> +    case X86_ET_HW_EXC:
>>> +        switch ( vec )
>>> +        {
>>> +        case X86_EXC_DF: return do_double_fault(regs);
>>> +        case X86_EXC_MC: return do_machine_check(regs);
>> Looking at patch 21, I came to wonder where it is that we're moving back to
>> SL0 in the #MC case (which may not be fatal), for ERETU to not fault.
> 
> (Almost) any event taken in Ring3 enters Ring0 at SL0, even those with
> custom STK_LVLS configuration.
> 
> See 5.1.2 Determining the New Values for Stack Level, RSP, and SSP

Oh, right - that's something I still need to properly settle in a corner of
my brain.

Jan

