Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E38CC251
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727674.1132269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mD8-0001Ub-JR; Wed, 22 May 2024 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727674.1132269; Wed, 22 May 2024 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mD8-0001T4-Gg; Wed, 22 May 2024 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 727674;
 Wed, 22 May 2024 13:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mD7-0001Rk-GP
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:40:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78fe5d5-1840-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:40:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so7170000e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:40:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdd7f8ea1sm939739066b.109.2024.05.22.06.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:40:50 -0700 (PDT)
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
X-Inumbo-ID: e78fe5d5-1840-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716385251; x=1716990051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pev6S84hbabPRG5sK0VuSlB/JOoBHk5GMSJ0GUMmO64=;
        b=P+hGP9nyuC/YWzmE7+nCkL+mDUgud/jJu01Mm4t/1wFauF5nw88Xsba3HSS4N+toqj
         2oxEVznbsMi+y8g7nnayjDGfv7O+9J8iMerEbyJrqoqsxQMqqBHSRMrGAju3Kiy8XNKI
         oEj8MeCifg+AsYU9GCg9+7ERQjh33ruR+WmRn6OS3pephlKTrYEsaHhN29FnS3lQmyBR
         fjp7D7ib33rs/CCnA+C/iHJVm7SotaNhWXT7xeAzZ7f/DbhakheJ4IscF9/YlSy/80eD
         djJPstBs9TeSxGZ4DWeKbD1cSnGSFUCTMcyoyAGnl9GYdGY8DAaomAgOJHgNL3y8ine8
         ZMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385251; x=1716990051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pev6S84hbabPRG5sK0VuSlB/JOoBHk5GMSJ0GUMmO64=;
        b=k5wATlNiUgXyjAnm5BMYyqcC+6lSTztGh2EPrFaeUSawrECK2QGM4bJ67KRbn7EiJr
         ngng3JRyY+TLxQonHAT1jYKyfceHul6LbVRYpFqjEtL+kqKnmhrejJ1s5M1wCfrc8hUm
         8AFe59j36w6mYRUWIOzp5fapd6zNx5AoXJCZnr/qzePP3iQkD7YtgET8kmAy5LeWe//z
         BSjKybe2bgQZCQn7Vc5ZjNuHfpUznTnfUJm01nbHktObtq/4AuA4/sryfdhmjKs5BBr3
         N341AeuUKVMLM4J/W9uALS4zEhdqTl+BQzMBv2hFj5e1peJU+V/RDbhYbQEruS+hTqbc
         Z5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTA+zMb4dxQygEFBiyDlWzugyeYL1Ow9aL7M7n9+reKkpuFqdZwDJZlAEVQ/Gxz+VMP/KBHANVvYMh/SBnBRwi/4eJCiRqJBQ7sY/ykTA=
X-Gm-Message-State: AOJu0YwmjiLtJs8sepdeHZHUNxlu5+gOW0ABYC1IjEmoWEKwzJqcORum
	RMkgDNvZmmFUsxdjnrojM8Wi6zPbsb1rl9x+lYp7zzTt7XPBdmbJcMKXvoDiRw==
X-Google-Smtp-Source: AGHT+IH/CVoPvduXRkd20bv5YoPTQ4G0HM5cNIh/wHlEbtSq5olm9UtJFaG717pRgYhv5vn8ofSAHA==
X-Received: by 2002:a05:6512:1042:b0:51d:44a3:6cc9 with SMTP id 2adb3069b0e04-526c130a249mr1302533e87.58.1716385250912;
        Wed, 22 May 2024 06:40:50 -0700 (PDT)
Message-ID: <1140d40f-2f5c-402d-a0fc-1c6598a7a424@suse.com>
Date: Wed, 22 May 2024 15:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/shadow: Rework trace_shadow_gen() into
 sh_trace_va()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240522131703.30839-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 15:17, Andrew Cooper wrote:
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -1974,13 +1974,17 @@ typedef u32 guest_va_t;
>  typedef u32 guest_pa_t;
>  #endif
>  
> -static inline void trace_shadow_gen(u32 event, guest_va_t va)
> +/* Shadow trace event with GUEST_PAGING_LEVELS folded into the event field. */
> +static void sh_trace(uint32_t event, unsigned int extra, const void *extra_data)
> +{
> +    trace(event | ((GUEST_PAGING_LEVELS - 2) << 8), extra, extra_data);
> +}
> +
> +/* Shadow trace event with the guest's linear address. */
> +static void sh_trace_va(uint32_t event, guest_va_t va)
>  {
>      if ( tb_init_done )
> -    {
> -        event |= (GUEST_PAGING_LEVELS-2)<<8;
> -        trace(event, sizeof(va), &va);
> -    }
> +        sh_trace(event, sizeof(va), &va);
>  }

If any tb_init_done check, then perhaps rather in sh_trace()? With that
(and provided you agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

