Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C2C573F0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161079.1489095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJViu-0008EY-Pp; Thu, 13 Nov 2025 11:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161079.1489095; Thu, 13 Nov 2025 11:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJViu-0008Bf-Mp; Thu, 13 Nov 2025 11:42:44 +0000
Received: by outflank-mailman (input) for mailman id 1161079;
 Thu, 13 Nov 2025 11:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVit-0008A3-Oh
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:42:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcdf7a7b-c085-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:42:41 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b7272012d30so105799366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:42:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41f1sm148215466b.23.2025.11.13.03.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:42:40 -0800 (PST)
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
X-Inumbo-ID: dcdf7a7b-c085-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763034161; x=1763638961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0JsZdpK/1Z+0O/oXuUGPHfNJlMFWbGPTk9aOGow34/8=;
        b=SwBtFCm9ISv4AjGognYCaO/ao3MS64zbG9k679666AWNLIcZwfnBn/IddySvaPcFrl
         YCVb+AzT0oh4hJDtjvvTJbpN8nFfo6eZi+yU3AXuT7+/3AvPK/7yywf+1yfFuuGI3ysa
         VhZ60LzaMCEf60QD7i2pi2As8JZ8SHMSM04fVzLYCl776ziRIurfPKXgb3M+ZYMgVPx6
         fSKGIMqrao0TMvCAvYu0O1sDFt4HlCtcwlwGFTkoyRDB+e7bX5zEEUHcvJccWoi/4+nD
         av/OMO9rxIC6bYzfd1IaE1xNmSyNiL/3xPuyHz3NQIxoWgP3foyyK2OLjZfZyiFXaIG9
         m1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763034161; x=1763638961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JsZdpK/1Z+0O/oXuUGPHfNJlMFWbGPTk9aOGow34/8=;
        b=Lxns1MvY3jQVcOFCUTarhpLPX5d3EQDWzjxeqsUxaH1z30mQt4lV7u9t3C0N++ywbT
         93ABEDVomlhOSinwxvZf5Xd3fH3OoGMPK1NsXVRvrpuCrPeZ6DW6uPzDsiEHVX592/0W
         pLoj9gyMo3DyHYu6vxvgbS+B5q+bIAjRgnzp812uYWFoizYG4xKKAmTe/tuVUArS6z5M
         2rywzRnjngEhdUVx/NbHDo5Fp+LIKjeVdM/BzxpkpTFSpCHu2+4/qdxlRDE6k8JrGvMY
         ot4OdnazFjfzLkHc2+cHDZqVf3ANjzXCSTS51Gf830dvIQeAeCrLY/lugJW5KskMXzK9
         rfeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZO293sBnfS6015vihrjHNRGRSqDSkJdKL+B9HHDxV7KyyxpQ8PJ1E6DREtXQbWv+i+wigeHwkU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQZMWac5QE11WLdmFoubGeW2aSZvMyWabsnLiDEFmx5uWFCWWf
	kTxQ5K/9TbsqagwwkeIAlqjQ9dVs4MwTMjBL1h3pJXXV6LpxPDnba3me2Nnplfp1sw==
X-Gm-Gg: ASbGncvws+frpguFRgfVLqUv9Xy7nJ+mePEQkgNE24HkN+g1kXdwzoeDaUlP/0ghXVV
	LhSaMzPmb2KhLETsoCgooXqkrYyAljXygtjcolmV4GgDyrBjubIPMQfCg2YlsKr0botxntOUEqP
	BXoKP4BXRH1yuLw3MlB1GedonaZZtL+nwPegqT0CvUORoaEG86rj7c0cgh4rOQSLbgQ5bp3X5ld
	+VRaNRyLFq4/Tlb8FkmG9LXOCaVY35YrSF/JQmj2D5941aidQ+uHvjevDIQuZGljSH66oRc9UwH
	9Ngi+h3QSbBc14nVx2dzl/7UYIhr1h6ZSCfCwKXPjE5X+HZO/xRw0yY+jme0C7A8Q7T1WCb8bN+
	55UoGhCh68vUv18zAChRNO0TcisSD4SP99YQkILv3rDWH3dIkZDuLoDAKxSReP0McdJnUo+/dfc
	HGQa36OsLbJuZpfjLY+KUAFaJ8vYts8DdEeuVQ6uzawUhpShmmniIgygRE2fu5M/2t
X-Google-Smtp-Source: AGHT+IESisLcBx5UZ8r08HujXcYEYCIXKuGRkiHNaBtyJl7Pzlb3eJs1LkIkqHvZtKGRAA2VSUT55g==
X-Received: by 2002:a17:907:6e8a:b0:b72:c261:3ad4 with SMTP id a640c23a62f3a-b7331a7078dmr653785066b.34.1763034161339;
        Thu, 13 Nov 2025 03:42:41 -0800 (PST)
Message-ID: <730c6001-58a2-46db-95fa-c8ec2081d3b0@suse.com>
Date: Thu, 13 Nov 2025 12:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: Conditionalise PV-only fallback branches on
 CONFIG_PV
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 16:22, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -297,7 +297,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>              if ( v->arch.hvm.guest_cr[4] & X86_CR4_OSXSAVE )
>                  res->c |= cpufeat_mask(X86_FEATURE_OSXSAVE);
>          }
> -        else /* PV domain */
> +        else if ( IS_ENABLED(CONFIG_PV) )
>          {
>              regs = guest_cpu_user_regs();
>  
> @@ -509,7 +509,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>              if ( !hap_enabled(d) && !hvm_pae_enabled(v) )
>                  res->d &= ~cpufeat_mask(X86_FEATURE_PSE36);
>          }
> -        else /* PV domain */
> +        else if ( IS_ENABLED(CONFIG_PV) )

Maybe better leave the "else"-s as is and, ahead of them, insert

        else if ( !IS_ENABLED(CONFIG_PV) )
            ASSERT_UNREACHABLE();

Happy to make the adjustment while committing, provided you'd be happy with me
doing so.

Jan

