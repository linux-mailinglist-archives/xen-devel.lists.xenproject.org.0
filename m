Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE32B3DF3B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104331.1455412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut1II-0006Xw-Ki; Mon, 01 Sep 2025 09:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104331.1455412; Mon, 01 Sep 2025 09:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut1II-0006V1-HW; Mon, 01 Sep 2025 09:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1104331;
 Mon, 01 Sep 2025 09:57:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut1IH-0006Uv-6j
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:57:45 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19b821ae-871a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 11:57:42 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61d7b2ec241so1429836a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:57:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042523ee7bsm258182866b.109.2025.09.01.02.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:57:41 -0700 (PDT)
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
X-Inumbo-ID: 19b821ae-871a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756720661; x=1757325461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pU65rmAaobHA8x69X+0kKwQR+vRAMw8j3gzJNvgCIdQ=;
        b=PUSWLrt2QAmMR6GUZhngzNpgI5xXb1vuyFqWaGxM5K/M07zVMfewmPMoCcriT6riZU
         I5NMisOj865NF3pOi6u9T3Q3n8MTpqj+sLUe9ExTYJnp0KiZI8fEKlF2mMps6tyy4KDn
         eBVJRt1fIR0755oA0PuPGaCNF2f6wgdPxwFFQGTFMXAJyJ7zLMJNhOvrwIqIRivfKHAW
         HsIgADKOXuiIC5/ULrR1mdp06XVGGYmHjHDuM1xKbIXb/G9ZvGa1PSl+rOqxcrsFGIGj
         VvCAndFYeaULnJyVnTE498a6zrg4yEVtZ/CYhCDcx+nNnk1rxRX+T1T3A/w4SGQ56U++
         k8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720661; x=1757325461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pU65rmAaobHA8x69X+0kKwQR+vRAMw8j3gzJNvgCIdQ=;
        b=WbX5jkBCBOuHV/NjTRetpMELORe+FpA2zOkjWOFU7GtgM0OWCi0lw0MMCNp5Yph66k
         hjoKv5onQ0CzLf5HsrZIDX43lcTiLwFrg78E6AoLcrqZMpvEFrpwxoW6FcU0+LVnHa2i
         W0JEVIWfosHery1AAKGbi7BXvN3/rt07V1KFuM921zic7cnw26UOBpVwf6NevzQ9uHz2
         l+ipqRkFT8yrsUc2m6i6RZmPsQCHVedLcmKGKVUQUQHmxaez3GdKUJsnGax1dCOI4MlA
         zygMaBYmBb3Ia6FJ5xRTxFL4LvdfNkczbEIk+IhjpgfEBuealfPMdjylPljxkIzUk4Gt
         +GoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0Ek0qpZHwcZhuFnzqe43kbgIH3NxvkGV0uJOEVl/9gqigIeXx/GyvhLHABIvppq7i10Ie5/hFHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypQbccqu4juHUMQHGQ2MSu3dxZx9Ztvn6ITAKCCp7lUzm15HrS
	fvqcPy+9ExP69l66H5zU8Np+5TlsHSmVVSf3uEWY426fgnk73S4fXxVeksBf8TSChg==
X-Gm-Gg: ASbGncvjakvUumyH6LTlbcx19TaP58Z3mLsuakE/uU8w2OikG8W0OGzsAqU2SGoWCw+
	DEWal2Z53ejB42DjDcy5o0EqJs01my2gG+IQui2MsB/LxVL+7Q8N/yNX3jkq1lK3SFJa8hvWHmu
	fnzffMK4dp7RcflYhCkOpCwOEQqclWrJwDG+NoDAmlcHMK115A3XVCy6AGWp5UefrWCOyJFTR6A
	m9wLr2ftx3ncezwk3L+DDUg/0yzne7yjwBaLuuQ9IkJ+lNNIOPQs6eZ8GsF0sr0PaN6fTg/9yd0
	elCp/COi9vqSB84b4v5TOrSqtzKE+dhSmbh12olChw8Yb77MB9gvQLVs8SDdyqg74FcYVffGLt/
	mk+bgZCtdSlkxcMGG2gUn9BKb/laEoCIyXrvxz31hrNzjeSY30zzxjykPbkUy7xCHJPdeQLFN31
	PE6IoY/Bs=
X-Google-Smtp-Source: AGHT+IH9y266uEc0OQSIklQ1ZdCiFKtfc1GGMGPzcTpVt/My/pk0tjiMMdeUQYFQgDodt6cyHKwuCw==
X-Received: by 2002:a17:907:7250:b0:b04:35c3:40b3 with SMTP id a640c23a62f3a-b0435c3438amr168607166b.15.1756720661409;
        Mon, 01 Sep 2025 02:57:41 -0700 (PDT)
Message-ID: <705a9429-4266-41a1-a5a7-0e3a58bf895d@suse.com>
Date: Mon, 1 Sep 2025 11:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/23] x86/fsgsbase: Make gskern accesses safe under
 FRED
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> In principle, the following can also be used for read_registers()
> 
>     diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>     index 5799770a2f71..0b0fdf2c5ac4 100644
>     --- a/xen/arch/x86/traps.c
>     +++ b/xen/arch/x86/traps.c
>     @@ -125,16 +125,21 @@ static void read_registers(struct extra_state *state)
>          state->cr3 = read_cr3();
>          state->cr4 = read_cr4();
> 
>     -    if ( !(state->cr4 & X86_CR4_FRED) && (state->cr4 & X86_CR4_FSGSBASE) )
>     +    if ( state->cr4 & X86_CR4_FSGSBASE )
>          {
>              state->fsb = __rdfsbase();
>              state->gsb = __rdgsbase();
>     +
>     +        if ( state->cr4 & X86_CR4_FRED )
>     +            goto gskern_fred;
>     +
>              state->gss = __rdgskern();

I'm irritated by this patch context here vs ...

> --- a/xen/arch/x86/include/asm/fsgsbase.h
> +++ b/xen/arch/x86/include/asm/fsgsbase.h
> @@ -79,7 +79,9 @@ static inline unsigned long read_gs_base(void)
>  
>  static inline unsigned long read_gs_shadow(void)
>  {
> -    if ( read_cr4() & X86_CR4_FSGSBASE )
> +    unsigned long cr4 = read_cr4();
> +
> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>          return __rdgs_shadow();

... the one here. Was the former (and the subject of the patch) not updated
yet (kern => shadow)? On the assumption that that's what has happened, and
hence preferably with the subject also adjusted
Reviewed-by: Jan Beulich <jbeulich@suse.com>

As to the alternative, I in particular don't overly like the goto there. I
would consider that an option only if in turn a simplification elsewhere
resulted.

Jan

