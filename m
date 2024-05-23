Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EA8CD81B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728726.1133760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB0I-00040K-Pu; Thu, 23 May 2024 16:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728726.1133760; Thu, 23 May 2024 16:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB0I-0003x8-Mj; Thu, 23 May 2024 16:09:18 +0000
Received: by outflank-mailman (input) for mailman id 728726;
 Thu, 23 May 2024 16:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAB0H-0003x2-JD
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 16:09:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8eb929-191e-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 18:09:16 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so1029600466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:09:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cde6f8c89sm1104579766b.70.2024.05.23.09.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 09:09:15 -0700 (PDT)
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
X-Inumbo-ID: cd8eb929-191e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716480555; x=1717085355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxSEiwn+dUJxSbRC+Me5htjo8uhksvt5o8XNMC4y8zg=;
        b=bEqP0NItQPQI7DrPy8VJJZ+bpKpBqAgqtOu9nGmMpctWMHFcothqB5kq/qJBdIJB47
         4yuo6uRdYiZlWtDRAz/UZgF1DJc6Ik1VXwyuST1Q17j2PtsFc3AyQIj7d5lQBUnvjmlF
         0iC+2r6/6ix9S6DxwglTEdP4H/ecgmNS3F04EvkJMIdA9ukKfbuMRH57zYTOxFuD8xTR
         xXJ0C+8SOCXnCoLdjqwwm3SqSLc+MwVT4hXOpEuZYVOxPOaxiFeJLHv/rdDhKbucLQAd
         e6nklIFMmIGutbZspCyF+zB8kpdUwKp7mEmulcq9U0MGtwto5RFYmNF7PZASnrWuvv3j
         WwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716480555; x=1717085355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxSEiwn+dUJxSbRC+Me5htjo8uhksvt5o8XNMC4y8zg=;
        b=dNxJAvcokdGxhF3K0z2mcIjw7juWKl7GLyvYpM+0l5BCdAYD9oMaVy+wVCVg6Pozcs
         CIR+EiwCqjphmP/hWGIhI7OkMdbpQKB4X7LWW6KrKkEGtf0qbO+O0dYAsZDYzs28cXFX
         AYt6yQhtkaHQy5o/sML5+kdM8HBshAlvWZxQzeVmTiMgY+Vt8yUHDiXWqEJSTJwkov11
         0opP8AD5YBdNDrwlLiZK1tD8Rha7TcipDugzsyhu4Gfca84/3ReogJ1RqnrFVTHMBB31
         4FwS8YS1bL+KEgCookQW6KGFvRa11TJE2F3dfLAg4gH+BNx7bEO38lfYiFMgu0ZCIwXy
         WQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXBKFSQciCrXUHMZ7N9THKlyfgGLe2ov50vH6+Z81EMVQ4wpd9pgspVBgBr3ISaqkIFJ+UnDOeolSzdggYiDQTh4azosDyELB332XmoiU=
X-Gm-Message-State: AOJu0YwFX7fEYbRc6VtBVo3nKsaX6mBWcWx6iw032qDhSGLsuRkYlYj4
	mFMZ3D26xHGO0Wu4EwRndfKdxRiigNTj6QdfcU7MCmeNvpXuHkM62JfJ+61wmw==
X-Google-Smtp-Source: AGHT+IH5QYdFAFKYtS8rnBO7d0q/aDRAStpjo92pUN+YQYwlrsck/y9mNADOTpuxwNdaLHUHrlyD0A==
X-Received: by 2002:a17:906:298a:b0:a62:47d7:247d with SMTP id a640c23a62f3a-a6247d72788mr138494766b.56.1716480555465;
        Thu, 23 May 2024 09:09:15 -0700 (PDT)
Message-ID: <b0d92d89-5ca7-4870-8118-139a47057a88@suse.com>
Date: Thu, 23 May 2024 18:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> @@ -611,6 +587,40 @@ static bool valid_xcr0(uint64_t xcr0)
>      return true;
>  }
>  
> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
> +{
> +    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
> +
> +    ASSERT((xcr0 & ~X86_XCR0_STATES) == 0);

I'm puzzled by the combination of this assertion and ...

> +    if ( xcr0 == xfeature_mask )
> +        return xsave_cntxt_size;

... this conditional return. Yes, right now we don't support/use any XSS
components, but without any comment the assertion looks overly restrictive
to me.

> @@ -818,14 +834,14 @@ void xstate_init(struct cpuinfo_x86 *c)
>           * xsave_cntxt_size is the max size required by enabled features.
>           * We know FP/SSE and YMM about eax, and nothing about edx at present.
>           */
> -        xsave_cntxt_size = hw_uncompressed_size(feature_mask);
> +        xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
>          printk("xstate: size: %#x and states: %#"PRIx64"\n",
>                 xsave_cntxt_size, xfeature_mask);
>      }
>      else
>      {
>          BUG_ON(xfeature_mask != feature_mask);
> -        BUG_ON(xsave_cntxt_size != hw_uncompressed_size(feature_mask));
> +        BUG_ON(xsave_cntxt_size != cpuid_count_ebx(0xd, 0));
>      }

Hmm, this may make re-basing of said earlier patch touching this code yet
more interesting. Or maybe it actually simplifies things, will need to see
... The overall comment remains though: Patches pending for so long should
really take priority over creating yet more new ones. But what do I do - I
can't enforce this, unless I was now going to block your work the same way.
Which I don't mean to do.

Jan

