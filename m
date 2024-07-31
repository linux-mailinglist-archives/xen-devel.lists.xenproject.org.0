Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E6942E6E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768547.1179379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8Ss-0004Au-NA; Wed, 31 Jul 2024 12:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768547.1179379; Wed, 31 Jul 2024 12:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8Ss-00048M-Jh; Wed, 31 Jul 2024 12:29:58 +0000
Received: by outflank-mailman (input) for mailman id 768547;
 Wed, 31 Jul 2024 12:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ8Sq-00048G-UH
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:29:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93b2127a-4f38-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 14:29:48 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso751612266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:29:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8356sm757962266b.206.2024.07.31.05.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 05:29:52 -0700 (PDT)
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
X-Inumbo-ID: 93b2127a-4f38-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722428992; x=1723033792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DpP4bzy/tFgSNC6PJ1fGRQr9x7zr6c4o4Hjki5lXEJk=;
        b=epsWy2rBrOc6peOdhzlhgwCpM5Wl8gzxIEzlCryqWIZtZehNjx8C/bfwlLuae0+8Ee
         Rpq6LZxhn+unXPld5S3veacHvGSgFfgkaz4g/xAQ1l0enGMbHb8J0CIrSvggsMLeuiyV
         LQs/dH5z+nIGTzWFXgDfxGhuwvu3LSk1deF+MhR/Ppc2kU/Ku7SX+8cuIbPVOoypr570
         IhCsBDxpspvu9ob/CXnAwfVz03b9yA0SAiDOEvGGBhovDUIZY2Pdxa5oMtZwiIk4+uWL
         l5mpwp4DK1zGuPBwxkqgCr1XNSd/6Hv0wB6quGWBO9TxpPfDc0OjKk9ixnTDVT+kkDCO
         3UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428992; x=1723033792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpP4bzy/tFgSNC6PJ1fGRQr9x7zr6c4o4Hjki5lXEJk=;
        b=q84HbktP3AW3KKb8qUNrVGmGSlkC9nloz6ud2JhP395nJZdSoX5a7gB16AmPyYsVQJ
         494be2FVdFGMJ6tf7n+JQyP+xmdsU+qj2/eRtiSB+pGqAJ0BhBhl9aJpOL6opVJH4wWJ
         ynLYR/lz69zg8qw+Wvs+laL01OOdEEjt4vyzqii3hMJ6GvX8elSdsuglrEyXZyfmktuJ
         8JhOKw67jA6/SHkRhOjhHkOoc3qswrRfurolSRftIaA7h+Y3/H+fmn8cD5JZ2g+A8ylB
         6PC7/n/ZWVISR1vvZsDOynD78zFp9fbCM65ci9fjYVOS+BfMYz0ZZ5KgsIa1HVSig/Uc
         a3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUB0X1YZuA0LEiEa9144S3w4e8iOk8VyojGFXNbR0tyQDI9jbcaFKwt08mDPNBlpnLtYUjYWhhw2RwWudHk/+vEkGDgbTtZOkp6ZDd8eu8=
X-Gm-Message-State: AOJu0Ywr7J+/ciTLDJRmBBl5ywjlf+DnxSO5emoe8QHsDZ5PAMMGrzxn
	qjWLs7VAGBnDIa55w5HLJE5F79tEIhxnSiN9iDU1syJ/lA/cBlJbkrX/H0myug==
X-Google-Smtp-Source: AGHT+IFs+mCSVRmgLdtjvq8X7A4P0gvmr1q0/2GwlHQs/X6R2HHGutF9mWFLFRoDs2BZASrHFgblEw==
X-Received: by 2002:a17:906:f58c:b0:a7a:9144:e254 with SMTP id a640c23a62f3a-a7d3ffdbe12mr975966466b.10.1722428992441;
        Wed, 31 Jul 2024 05:29:52 -0700 (PDT)
Message-ID: <1494c80d-9056-4922-a5e1-33cfdb1e41cf@suse.com>
Date: Wed, 31 Jul 2024 14:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 10/13] x86/vpmu: guard calls to vmx/svm functions
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <fda81012adec8c4993acd83076f1a46f2d71d668.1722333634.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <fda81012adec8c4993acd83076f1a46f2d71d668.1722333634.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 12:35, Sergiy Kibrik wrote:
> @@ -266,10 +268,10 @@ static inline void __core2_vpmu_save(struct vcpu *v)
>          rdmsrl(MSR_P6_EVNTSEL(i), xen_pmu_cntr_pair[i].control);
>      }
>  
> -    if ( !is_hvm_vcpu(v) )
> +    if ( !is_vmx_vcpu(v) )

With this ...

>          rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
>      /* Save MSR to private context to make it fork-friendly */
> -    else if ( mem_sharing_enabled(v->domain) )
> +    else if ( is_vmx_vcpu(v) && mem_sharing_enabled(v->domain) )

... why this further change?

> @@ -326,14 +328,14 @@ static inline void __core2_vpmu_load(struct vcpu *v)
>      if ( vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_DS) )
>          wrmsrl(MSR_IA32_DS_AREA, core2_vpmu_cxt->ds_area);
>  
> -    if ( !is_hvm_vcpu(v) )
> +    if ( !is_vmx_vcpu(v) )
>      {
>          wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, core2_vpmu_cxt->global_ovf_ctrl);
>          core2_vpmu_cxt->global_ovf_ctrl = 0;
>          wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
>      }
>      /* Restore MSR from context when used with a fork */
> -    else if ( mem_sharing_is_fork(v->domain) )
> +    else if ( is_vmx_vcpu(v) && mem_sharing_is_fork(v->domain) )
>          vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                              core2_vpmu_cxt->global_ctrl);
>  }

Same here. With those dropped (I could do so while committing, as long as you
agree):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

