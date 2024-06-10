Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081899025C9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737397.1143683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGh73-0003W8-Mz; Mon, 10 Jun 2024 15:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737397.1143683; Mon, 10 Jun 2024 15:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGh73-0003Uc-KI; Mon, 10 Jun 2024 15:39:13 +0000
Received: by outflank-mailman (input) for mailman id 737397;
 Mon, 10 Jun 2024 15:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGh72-0003UW-AY
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:39:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94adb3a3-273f-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:39:10 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a44c2ce80so5271511a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:39:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c82a5e0f9sm1847534a12.12.2024.06.10.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:39:09 -0700 (PDT)
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
X-Inumbo-ID: 94adb3a3-273f-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718033950; x=1718638750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L699gjE9dnfl5DrdeNkMwQqNupwDuxbteRalIAJif1A=;
        b=EOLYVFtiTdm7leC1EcUENaqs7pyyDqpI5gt5v8YVBDgTPxDeRsy8fj2HE6m1giEI3c
         oPm4rIvvlc+BK5SzAho+uvGxWoO2hZ+akrUPg6gDfrlnHIqyp7zaqmqL+6BL/TQtqukr
         IE5UHzhuNGNK9LUKmSUfqhzgsp68uEC7Lc6k5/2AK9Nk/cf1B5MGsWK0oVJs2grPm/gr
         8EPMfEAxZMbKlq9K1f7J958L/VT/0Hhk98TN7n6vxod5Yo3vH982Svp7RZkELjxjAEtR
         ccB2Ks1iT24YY8P2cv1wgSeYaEERiFWkuF26VpJb7upeEkXzT/c9l06voelBeN5l2yHW
         qF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718033950; x=1718638750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L699gjE9dnfl5DrdeNkMwQqNupwDuxbteRalIAJif1A=;
        b=AysHPF2oAbKrkCoSMjhSetDlbk807ohCY4dN/qOWqrpM9kFuZYbIh85cCG+gM8n/Gg
         UYGi0J2/e8TDDivPfwGWbiPxVg+mfNO9OuR5LHaqke3b8euVCL/MpnuBPewy7GlswsFY
         xSSiNMxdyIXZQ3eTPJ1GdEgBLThUFg5um9sxA66sGpHGdhCneydY1pH1bZugGRf+04C2
         yUPb52jtKCpekhtgvedWjtgI+uPtTpGy23w9IC8N4g5cgP0tolIBGq7ZAIMiuJCe9vLQ
         we2DJkpr/VV35NKKktOSn2FR8Zdo/0eknA77NCOOADN3v1hQtHBjF29eiqf/P3ltoo/U
         qqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCdA6ANKu8hRhoGJhKf+DPFPCyB671MpcJAKn9i1ZlrvPZUIvoOHRE59fcbeCndaBw2k/oAuVh0fs/tW3nlii1gRzq93G5lJ/5L0dfcZk=
X-Gm-Message-State: AOJu0YwgEuSyPKS94MT92Q9LQ0AnkeerPSCM32A6X5Pz7YqkSolZ2F2V
	TXGOgcrJtSGk07vcysRKHbrobG25DCWZFGs9hM/AcmjEkot5lyapMp7KIEGkEg==
X-Google-Smtp-Source: AGHT+IHHhohiPHKv7y4w0IAS2V0Vbc3EC3Jj7Q91xOYqOmch+BmkKbhVRm9WayctOFOK+BxPSkPTHw==
X-Received: by 2002:a50:c355:0:b0:57c:8339:6dcc with SMTP id 4fb4d7f45d1cf-57c83396e44mr1643099a12.33.1718033949808;
        Mon, 10 Jun 2024 08:39:09 -0700 (PDT)
Message-ID: <3398ea60-4562-454d-858f-9a5906ad2792@suse.com>
Date: Mon, 10 Jun 2024 17:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/intel: optional build of PSR support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240606083908.2510396-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240606083908.2510396-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2024 10:39, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1160,6 +1160,7 @@ long arch_do_domctl(
>          break;
>      }
>  
> +#ifdef CONFIG_INTEL
>      case XEN_DOMCTL_psr_cmt_op:
>          if ( !psr_cmt_enabled() )
>          {
> @@ -1262,6 +1263,7 @@ long arch_do_domctl(
>          }
>  
>          break;
> +#endif

Imo the result thereof shouldn't be -ENOSYS, but -EOPNOTSUPP (at least
for XEN_DOMCTL_psr_alloc; for XEN_DOMCTL_psr_cmt_op it shouldn't change,
even if I consider this wrong, but that's a separate topic). Wouldn't it
be possible here to reduce the #ifdef scope a little to just most of the
inner switch()es (i.e. requiring it to be split into two regions), whose
"default" case is already (kind of) doing what we want?

> --- a/xen/arch/x86/include/asm/psr.h
> +++ b/xen/arch/x86/include/asm/psr.h
> @@ -72,6 +72,8 @@ static inline bool psr_cmt_enabled(void)
>      return !!psr_cmt;
>  }
>  
> +#ifdef CONFIG_INTEL
> +
>  int psr_alloc_rmid(struct domain *d);
>  void psr_free_rmid(struct domain *d);
>  void psr_ctxt_switch_to(struct domain *d);
> @@ -86,6 +88,19 @@ int psr_set_val(struct domain *d, unsigned int socket,
>  void psr_domain_init(struct domain *d);
>  void psr_domain_free(struct domain *d);
>  
> +#else
> +
> +static inline void psr_ctxt_switch_to(struct domain *d)
> +{
> +}
> +static inline void psr_domain_init(struct domain *d)
> +{
> +}
> +static inline void psr_domain_free(struct domain *d)
> +{
> +}
> +#endif /* CONFIG_INTEL */

As I think I did mention elsewhere, such stubs can have the braces on the
same line the the function specifier.

> @@ -169,6 +171,7 @@ long arch_do_sysctl(
>      }
>      break;
>  
> +#ifdef CONFIG_INTEL
>      case XEN_SYSCTL_psr_cmt_op:
>          if ( !psr_cmt_enabled() )
>              return -ENODEV;
> @@ -286,6 +289,7 @@ long arch_do_sysctl(
>          }
>          break;
>      }
> +#endif

Like for domctl I think you want to reduce the #ifdef scope some, even if
for XEN_SYSCTL_psr_cmt_op that'll still result in -ENOSYS. At least we'll
then be consistent in clearing sysctl->u.psr_cmt_op.u.data there.

Jan

