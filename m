Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C3867870
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685570.1066490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebyX-0000u3-E8; Mon, 26 Feb 2024 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685570.1066490; Mon, 26 Feb 2024 14:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebyX-0000sL-BX; Mon, 26 Feb 2024 14:29:01 +0000
Received: by outflank-mailman (input) for mailman id 685570;
 Mon, 26 Feb 2024 14:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rebyV-0000sF-VT
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:28:59 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6090f8bf-d4b3-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:28:58 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so3653648e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:28:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b00a3d99dc3f3asm2448125ejc.67.2024.02.26.06.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:28:57 -0800 (PST)
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
X-Inumbo-ID: 6090f8bf-d4b3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708957737; x=1709562537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hECOQ2WXFS3Fb52EbsfN7R5bLqN4kYrXVtDndGZWRPc=;
        b=LyQAP1unyJ0OSCWGQkObugiodjxAyJMRKKvfq+vLNJN2c0Hp9MAXygHrQaqt1qw1as
         vltnqzNnq36UQr7hbLUtxxs/KxCajvNf6Wo+Y2LQJhfNXd6bz4qwqvwKu235hB9dV+J8
         KoenS6XZe+MYF75L0P9ED6wFoKO3251IzBzYL+NRqq25gAw5mnjgtXkgSGFPiB5EchnN
         yxAPISrXqIae/1aFECkLsHuGscSRXOhrZZs3d1rPkj6W15kgy542spGyNHSuQGkUvepD
         yQx9bj/AIrgLj3I9ys9ZUesMXU4xLGvhtuqjW6ZJfUjPXNW7V9eQJGXieizQspPiPOp6
         mHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957737; x=1709562537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hECOQ2WXFS3Fb52EbsfN7R5bLqN4kYrXVtDndGZWRPc=;
        b=PESfMjNwkUVEj0mQqI4UpVMWgE8mZdwmjFQ6x7zGDz3xTznWV10JUZ+BWGLnQV1yv/
         akjlPGmPSjAxlKzzmawQl8JPKECmzx4C1xbZOps5lEKXxXKrEwtxpQWSAl2GfU4+GFVD
         ORqipako7OoINl0f0rkBfRavGkJA/JFDQBjP0+qGlCj6BYPZJOzRNxAtkCqZMENyJHjr
         dnNJVSabJiKN8Mbb1EMTpR61mOGtRWDxjrqM5cc1652dFVIkmb+M6Y5vLtUSRPLQBmVt
         KthDXALogzmBLL2TPnKwRqxavuBeYhBRSzBAl3MvidhuyZHb1PALQFD9RPvk28ZmhVJh
         C1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkINoycJa9Nt9nfcsiSQqc0jEgWg7JbeY7IVW/c8lOkBOO50ZgyqtDgbsIeyygZkZbo7mTm53G4OW781CipYVXlefXcm+kpLJCj8+JVk4=
X-Gm-Message-State: AOJu0Yw+dmQAqh8VACUh2Qa4X0sG4eWYbqTiLcuaVPmjEYAGX8slgw6c
	2z0c5M3Upaf2FofyVJEScc3dmrIy0jiO2A1PkH8vfTTmaMsJrT0bpYsfyPlS8Q==
X-Google-Smtp-Source: AGHT+IGVpA4wJgqZn2yHrblWc5YuDqP6tbXe4V3StP7xiq9EMS5ZuLPDGPiKNla3bn9RAhTBFyF3IA==
X-Received: by 2002:ac2:4d87:0:b0:512:b04a:aa56 with SMTP id g7-20020ac24d87000000b00512b04aaa56mr4553891lfe.24.1708957737606;
        Mon, 26 Feb 2024 06:28:57 -0800 (PST)
Message-ID: <d68cc5ad-6dec-464c-a171-f3259a8fb70b@suse.com>
Date: Mon, 26 Feb 2024 15:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/entry: Adjustments to "reduce assembly code size
 of entry points"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
 <20240226125501.1233599-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240226125501.1233599-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 13:54, Andrew Cooper wrote:
> Some retroactive review, for if I'd got to the patch in time.
> 
>  * The new ASM-friendly BUILD_BUG_ON() should be in a header file.
>  * entry_int82() wants the movl->movb treatment too.
> 
> Fixes: c144b9e32427 ("x86: Reduce assembly code size of entry points")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Fixes just to link the two patches.

Hmm, I see.

> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -56,6 +56,18 @@ register unsigned long current_stack_pointer asm("rsp");
>  #define ASSERT_INTERRUPTS_DISABLED \
>      ASSERT_INTERRUPT_STATUS(z, "INTERRUPTS DISABLED")
>  
> +#ifdef __ASSEMBLY__
> +
> +.macro BUILD_BUG_ON condstr cond:vararg
> +        .if \cond
> +        .error "Condition \"\condstr\" not satisfied"
> +        .endif
> +.endm
> +/* preprocessor macro to make error message more user friendly */
> +#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond cond
> +
> +#endif /* __ASSEMBLY__ */
> +
>  #ifdef __ASSEMBLY__

Minor remark: Seeing these back to back is slightly odd. A little
higher up there's an "#ifndef __ASSEMBLY__" (producing e.g.
ASM_CALL_CONSTRAINT) in an #else of which this would imo be a
pretty good fit. Further down where SUBSECTION_LBL() is defined would
also look to be more suitable than adding yet another #ifdef.

Jan

