Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D4C39F5A
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 10:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156637.1485664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwkh-0006pW-Bf; Thu, 06 Nov 2025 09:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156637.1485664; Thu, 06 Nov 2025 09:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwkh-0006o5-8o; Thu, 06 Nov 2025 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1156637;
 Thu, 06 Nov 2025 09:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGwkg-0006nz-1i
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 09:57:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ba5f10-baf7-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 10:57:55 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640b2a51750so1305564a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 01:57:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7289682544sm174583366b.53.2025.11.06.01.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 01:57:53 -0800 (PST)
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
X-Inumbo-ID: 10ba5f10-baf7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762423074; x=1763027874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2pV8SBOsPTBHMSriyI7Vv4bb6edPP5QubO2Uijno1hM=;
        b=JUYgtLenxlMaasCiBjiiAfz9A2ARXxw7Y+OGu5DufzAJzFqKbUcHmVOttdIVBvtk5B
         cnIIplAU6qiQRXwF9+t4SfQnmUcvX+BYrG/fBhEMlFrbVmlFfUpTK0XdgdmCat7Cd9XW
         dS6Z3NQxLXNsuUda1Uj67xhn+WHacXykka6jrxCrYRrK8hGA0xEb5kacTGQZiC4boc5W
         vE0X5n18M+f+bHTJ/k51X0lf9xsa/JAtnMA/ahPosI2gIEMfhnAQn6LYhLSKcqOoDE27
         uu/6fkYGHTZtS9DZj1b6nDNzDJTbBjO+iJJT1CSt4WxODNE4Xhu7966uMmFS8Su9JBQU
         uVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423074; x=1763027874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pV8SBOsPTBHMSriyI7Vv4bb6edPP5QubO2Uijno1hM=;
        b=uHeVGYuY+ApXcTgBfUkTa6+wcJH5vLzibITqRnIc41TUiyR7QQIZbJT+on8hDHRKW1
         f03eHQiLmSWo88lqDybeHKMPesPNtfblitUuBUNqY0NOM+bnNqT4f2UA71EACWPhFTnk
         tg87VDruHx3+4AdxQWPS8DvDMro8bn9NQLykyj3aZVKhLb9NpnBsZQkUFKVPXSSzE39n
         aECnzSqmB7nUBMxSsPRD/UhU3V6EhfAvX+RIUWVajz7dMl/TLvD0/ieqaVfwm0YI4OC0
         zVoeiZOVDgd5wo6TdBY9T0hViZaIrW2/COydd46zypLHrGCJN/5dSMd2bdp6OUNt0RXl
         yLog==
X-Forwarded-Encrypted: i=1; AJvYcCUKftHiFsFZG/ybelbJHQ7jT26ph8g4nvK7HrTWEdntGODLOy9EANvvtV1L3oP+ARXUBps+37gWtFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVdiWjgxv4kLFGYQRWKbMj09HVqPRG/OrD2egWjCJVAGGmHbNi
	2Xn3CaKPBpN6obps1OAYaraGP0U+zTwI+U89n4O4rzPIQqS68IuYXW+BiaJgsdNslw==
X-Gm-Gg: ASbGncuF0FA8IY3Fq0MbdGVYuffwZl8SJhlMygKwowABwiCyY3k3Bn3D5Jo6FTkySsW
	qmNWx1P1x3GXLeMk3pYAFLX9GOLbyHfBWez+QxbVFEYR3lCcYF8SASFHMNWdh3aBvseY9m0JS2Q
	/m3JdDEWm3eeMVRatU+9LCSn8VLRTIBQi+T5f/RmjlXV3ahLh3lC7w0cs74NnIBfIzPDbJeSNK8
	HKL3RIr7EYrC2e9c/9wSiGOXkJB4lZ9N29+bRpeCGZK2OhWnkN+EWV/V4zVG8yw5tD29McJhv+R
	djWe/yBn1FGqZQ8sag7XHsiycXpnCGu1Lwc+omDptSn6DC5vV6klskcEd2FmowzH00SovNaJO/+
	dnp54lg8BOIiPQDmo3agEeJrfpqJE6tLExhyFFGdVqSX9Imwb5wgoKma8byGrV/ndXdC1iIDOQK
	+VvMwHR0g7JLZEPu1ouM6jlq4/Ku3V1jbEPOB+xZTQyFKbAJihUQMkcwUtT/60
X-Google-Smtp-Source: AGHT+IEuTn/BnleDYIkzdv8wOmSTxYhlItq1EppSz24bYdRDHlxDQxF3/TOz6/pHi+cS+Suvxnfazw==
X-Received: by 2002:a17:907:944a:b0:b6d:8d8d:3010 with SMTP id a640c23a62f3a-b72655b7411mr510969166b.56.1762423073633;
        Thu, 06 Nov 2025 01:57:53 -0800 (PST)
Message-ID: <45031a9f-1072-4a41-9b46-35bf6437880b@suse.com>
Date: Thu, 6 Nov 2025 10:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251031212058.1338332-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 22:20, Grygorii Strashko wrote:
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,6 +13,7 @@
>  #include <asm/hvm/guest_access.h>
>  
>  /* Raw access functions: no type checking. */
> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
>  #define raw_copy_to_guest(dst, src, len)        \
>      (is_hvm_vcpu(current) ?                     \
>       copy_to_user_hvm((dst), (src), (len)) :    \
> @@ -34,6 +35,43 @@
>       copy_from_user_hvm((dst), (src), (len)) :  \
>       __copy_from_guest_pv(dst, src, len))
>  
> +#elif defined(CONFIG_HVM)
> +#define raw_copy_to_guest(dst, src, len)        \
> +     copy_to_user_hvm((dst), (src), (len))
> +#define raw_copy_from_guest(dst, src, len)      \
> +     copy_from_user_hvm((dst), (src), (len))
> +#define raw_clear_guest(dst,  len)              \
> +     clear_user_hvm((dst), (len))
> +#define __raw_copy_to_guest(dst, src, len)      \
> +     copy_to_user_hvm((dst), (src), (len))
> +#define __raw_copy_from_guest(dst, src, len)    \
> +     copy_from_user_hvm((dst), (src), (len))
> +
> +#elif defined(CONFIG_PV)
> +#define raw_copy_to_guest(dst, src, len)        \
> +     copy_to_guest_pv(dst, src, len)
> +#define raw_copy_from_guest(dst, src, len)      \
> +     copy_from_guest_pv(dst, src, len)
> +#define raw_clear_guest(dst,  len)              \
> +     clear_guest_pv(dst, len)
> +#define __raw_copy_to_guest(dst, src, len)      \
> +     __copy_to_guest_pv(dst, src, len)
> +#define __raw_copy_from_guest(dst, src, len)    \
> +     __copy_from_guest_pv(dst, src, len)
> +
> +#else
> +#define raw_copy_to_guest(dst, src, len)        \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define raw_copy_from_guest(dst, src, len)      \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define raw_clear_guest(dst, len)               \
> +        ((void)(dst), (void)(len), 1)
> +#define __raw_copy_to_guest(dst, src, len)      \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define __raw_copy_from_guest(dst, src, len)    \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#endif

I have to admit that I don't really like the repetition.

Style-wise you want to be consistent with the adding of blank lines around the
preprocessor directives: Imo here there want to be ones on both sides of each
of the directives.

For the last block, I'd further prefer if "len" was returned. That's properly
representing that nothing was copied. And if these were all using a single
inline stub function, ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1985,8 +1985,9 @@ bool update_runstate_area(struct vcpu *v)
>  #endif
>          guest_handle--;
>          runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        (void)__raw_copy_to_guest(guest_handle,
> +                                  (void *)(&runstate.state_entry_time + 1) - 1,
> +                                  1);
>          smp_wmb();
>      }
>  
> @@ -2008,8 +2009,9 @@ bool update_runstate_area(struct vcpu *v)
>      {
>          runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>          smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        (void)__raw_copy_to_guest(guest_handle,
> +                                  (void *)(&runstate.state_entry_time + 1) - 1,
> +                                  1);
>      }
>  
>      update_guest_memory_policy(v, &policy);

... these changes would become unnecessary (I dislike such unnecessary - as per
the C spec - casts, even if I understand that for Misra we may need to gain quite
a few of them).

Jan

