Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FB9DB5BE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845230.1260688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbnk-0006cc-KX; Thu, 28 Nov 2024 10:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845230.1260688; Thu, 28 Nov 2024 10:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbnk-0006Zm-Hr; Thu, 28 Nov 2024 10:31:12 +0000
Received: by outflank-mailman (input) for mailman id 845230;
 Thu, 28 Nov 2024 10:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGbnj-0006Zg-Fs
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:31:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df5bea29-ad73-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 11:31:05 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa52bb7beceso68314466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:31:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de557sm51996666b.69.2024.11.28.02.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 02:31:04 -0800 (PST)
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
X-Inumbo-ID: df5bea29-ad73-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRmNWJlYTI5LWFkNzMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzg5ODY1LjM2Mjk1NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732789865; x=1733394665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s751EXf7bym3JalMdbNhe/rOYNoBJ2urBaealeSoKz8=;
        b=McWf/b4A/kgNUyjPHrzho/I5byoBeean9PqstNBwPUezPd7cgRbO/v0XRCbdiJ0bJq
         b4121ZyQV7jbQfBQXDEXY6LejJ0LBav3qTI9FeXDlq/0Z7tijtZAUYJG8unM4KxCPfeN
         Fjp10nE1C5h8LhsJtFF2CaDFLTGrG7fr0R8GbzlmSolKbpPpb6uve+uWTTXJyG/Yv/wo
         yGjIs4Tvv6lnoTIJZNubxXvGR1IeWX/5v+cdHkLRecoVDg4sVgG7RgcTfcdQEE6/GknW
         /3IG5XaMSNUDeeA9CzH4mEI87ibeF9ePVon77PmvhPMiv4MZq2Q8nNfFpW6iAhD6mWAN
         xTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789865; x=1733394665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s751EXf7bym3JalMdbNhe/rOYNoBJ2urBaealeSoKz8=;
        b=PyMHlSc2+QxERPCznW1K4rarvW7watstJkMLBwE9G2nRrXwQwdjwwKsazOOvMRTGBO
         taed0PCM70o7S7qTb9ViJkPcxhxlBSq6L7ydpY5TMGXMpAYgtwFPKY6LMOmpxorAB7Qp
         snGd81B79+M3k8oql9BhvJe9/9za+k5pdasuKQRVNJSapvW99Ud78TubXJ/eZFBEUtP9
         R+YAfwr6jXpYuMv/Q9k1rABkp4sXv3QB+BcB+qcCBusGBWN5YJKuBNKjn98Bp7BRlXMW
         Cu+jI9l4QUnX6wK1D0ui+C3wEaQiK8ezxGTVnolOyy6qIEgjIciqrFXNTdGbbon97ezV
         oZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCUlTtXO51LUbzwm8tUY7JMWb2MQKsxlSbqeCJzySK1Cm3wkaOJ6WDgy66AluLIyrFq4cKdbADZAYec=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0qu5Mp26ecVPOuEYSIKI95VSva6xQznxNfeWIbMij1IF1idwB
	WzO8igv93L6ZB4JjJvatgfymIpmBuPpbkQj2PSfqzCk0G3ftxuf8erImt6UmXQ==
X-Gm-Gg: ASbGncvqZMUtukVF1eNnG61BceUJ31LdqF1BUSN2j5wXM/5EDKspzjk4g0WchVrIFir
	wtQgMaIs3ZqjfestR/Zsnyetc2kusabeoFRQZINNrqYuOShYoXxLFNFkz876R3/WEnrAFwmHKVw
	5E09pD8tnI97V52pqsQ7llImTXKGWxJ426F04IdDY72b1Ljv9zX0VgrLe5A2iGDFwZMHUF+zXQ1
	YgFD4/BzB9dmQ1VSf9cMdC6L9hAEPFTnsynIyyaevXFxXhkjqdZEJs61ymPCFRg7IUBitB2Wv1p
	qItFZeWj1MBgJrPSYBATBB6TFeN8L7bfhL4=
X-Google-Smtp-Source: AGHT+IESzM2IJFq7FiH8PI3XqcWcgRRPFihShAIJbc0Vc2w4/BGp0EwJt2dP4fI4Z//PjkKjQ5zzkA==
X-Received: by 2002:a17:906:1baa:b0:aa5:470d:c95d with SMTP id a640c23a62f3a-aa58102833fmr388907366b.37.1732789864803;
        Thu, 28 Nov 2024 02:31:04 -0800 (PST)
Message-ID: <e576e161-5054-40d2-af02-6f32ef636782@suse.com>
Date: Thu, 28 Nov 2024 11:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241128004737.283521-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2024 01:47, Andrew Cooper wrote:
> Xen currently presents APIC_ESR to guests as a simple read/write register.
> 
> This is incorrect.  The SDM states:
> 
>   The ESR is a write/read register. Before attempt to read from the ESR,
>   software should first write to it. (The value written does not affect the
>   values read subsequently; only zero may be written in x2APIC mode.) This
>   write clears any previously logged errors and updates the ESR with any
>   errors detected since the last write to the ESR. This write also rearms the
>   APIC error interrupt triggering mechanism.
> 
> Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
> accumulate errors here, and extend vlapic_reg_write() to discard the written
> value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
> before.
> 
> Importantly, this means that guests no longer destroys the ESR value it's
> looking for in the LVTERR handler when following the SDM instructions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

No Fixes: tag presumably because the issue had been there forever?

> ---
> Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
> field to hvm_hw_lapic too.  However, this is a far more obvious backport
> candidate.
> 
> lapic_check_hidden() might in principle want to audit this field, but it's not
> clear what to check.  While prior Xen will never have produced it in the
> migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
> Xen will currently emulate.

The ESR really is an 8-bit value (in a 32-bit register), so checking the
upper bits may be necessary. Plus ...

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -394,6 +394,7 @@ struct hvm_hw_lapic {
>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>      uint32_t             timer_divisor;
>      uint64_t             tdt_msr;
> +    uint32_t             pending_esr;
>  };

... I think you need to make padding explicit here, and then check that
to be zero.

Jan

