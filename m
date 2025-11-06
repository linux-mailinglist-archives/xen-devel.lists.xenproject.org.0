Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BCC3ABFB
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 13:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156830.1485805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyfc-0004YU-9f; Thu, 06 Nov 2025 12:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156830.1485805; Thu, 06 Nov 2025 12:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyfc-0004VZ-6p; Thu, 06 Nov 2025 12:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1156830;
 Thu, 06 Nov 2025 12:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGyfa-0004VK-P4
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 12:00:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38611bcb-bb08-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 13:00:43 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so144311466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 04:00:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937dd8csm195360866b.22.2025.11.06.04.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 04:00:42 -0800 (PST)
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
X-Inumbo-ID: 38611bcb-bb08-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762430442; x=1763035242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pz+yiaTdfoXoaJ4V9CeDHJFxA1Eb2ygwXtAa0EEBqpQ=;
        b=QGm8OMQBOfI/s577EBqysyWkEqKxZcIJ1E1GtgRh2wIk8pS00XcHNee1RtbH3XHw+G
         c9qDaxm31hGm6YfCCJ+J5A5rBmw/b/dkSlEZAEuC30XhYrun1YlwBjxElouZajTpb+cM
         peLGKT+pkROBtUVoHUPU5kQmEfGtg9JtZfzifLEUmfOTVBscksPl/XZ1osRU1VSTJL8L
         z8F09bY8QJ1ONqlnSfC8IjiqWQxvN/gqmU7IJ6tHOd1hm0N8ISdje/AUUBdZjnGu50F0
         tk8XqDMPTTZO1zaNSj6rIybCCgY5+tnihqkI1T3r3JwWqnBlzBupAMcYv1TtFBZnkQ81
         zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430442; x=1763035242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pz+yiaTdfoXoaJ4V9CeDHJFxA1Eb2ygwXtAa0EEBqpQ=;
        b=txGx9hf9UY+x3mAGpwV4no6IFQlWcK+xcWELmfV4nKisVd+OKRU7xCd3ONPQW+YbAo
         Vk/UwBgKHrVmRRzJPsgDBUfD4HUgu+TKs7WACY1HPbFwQR1UZeZ9biM23iFvVnvRD3jn
         3Ivn/oxuyicD1G+fCyMnnGrFa5y9+oeMrVWJMel2gENJFZsaHy/GDUvBb/WfW00ZmM7u
         qOA5t84CGeDx/Wmzvfw2jcVHzNzZvAGhSXrvQY53PdYX1DGcPoyv+eFvZtd7NgAl4A8W
         jwXsvmcmCrXRKybdm5g/HbOTFeK0Dybbi3AqcrWJY0DrGt+Wwu/gWyWRKovVRMYx6M+I
         cFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWshhGmgAdmHKMhBRnAflylDh2peLW9GdMAZ3+aE9kc8pK731S35M+B5A6EcEJd+DdP6jSktXqRDw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIaK3KQRuy/TOoSWqytiqh2ITZyTgycb7rgK9JbqnXgPuxlAyv
	oWjhANmDXdWPiFKo8CReadqG1rq47Z7QV0+JuTE9KclHV90hAw1o3dPdB4rpPDjmeA==
X-Gm-Gg: ASbGncs9rK0RVZugEukqmu3YtP2azkkvtLi78W/TluSetO3vW1v5z9PjSUhXnZGbO/p
	7zztbqiB+jmNv/y0h8M71Ya/KERfmYoFufG75Upyw/Igau1Kn/mrFcfJLX8mO55opZKuC7xe1/2
	q3SxX65kHTjYclZOSV9slhD7jQNijjeLfxcEW4YYiaQSlWEauId1+nIZhWgiZoFwEyWmoGZI8Xa
	ZFiSDfhK3ucjOPBvLXgaqjmKMJ52/c/miVVICZTOvi/8iE+3b2t8FO2DLyZHNqXyikqr7IBICHW
	/wMvjO91mcUfRO/BjskwzHqg7H232P7aoxIkzqtMk4qDVF7lSZdMqPsC48Ni7K+LlANRN5AbynQ
	PnlbACA7O7T34MsQbViav2Ejh8NK/5FPjSI/PqHEIiFpXWH3MQV1+o4zOh4et+u2gSS9R+zWi2T
	wHpBIdqbijcUifTDOL3fxvbOb0NuXdSwmizL5/QDHoDr1u4UWCWDb29Kf9acYMrakLFNmysEI=
X-Google-Smtp-Source: AGHT+IG4Ga2Y+kRTTpa+vJu85Z8eL56sORslqu3z4jl8lynpnaO9C0DFVQP+GkLLUDDdLaXTPJMrDg==
X-Received: by 2002:a17:907:9484:b0:b50:52a4:8f9a with SMTP id a640c23a62f3a-b7265539e48mr658671966b.45.1762430442312;
        Thu, 06 Nov 2025 04:00:42 -0800 (PST)
Message-ID: <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
Date: Thu, 6 Nov 2025 13:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251031212005.1338212-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 22:20, Grygorii Strashko wrote:
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -155,4 +155,19 @@ config DEBUG_INFO
>  	  "make install-xen" for installing xen.efi, stripping needs to be
>  	  done outside the Xen build environment).
>  
> +config HAS_VMTRACE
> +    bool
> +
> +config VMTRACE
> +    bool "HW VM tracing support"
> +    depends on HAS_VMTRACE
> +    default y
> +    help
> +      Enables HW VM tracing support which allows to configure HW processor
> +      features (vmtrace_op) to enable capturing information about software
> +      execution using dedicated hardware facilities with minimal interference
> +      to the software being traced. The trace date can be retrieved using buffer

Nit: s/date/data/

> +      shared between Xen and domain
> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
> +

I was actually meaning to ask that "VMX only" should somehow be mentioned here,
but then I noticed this is an arch-independent location. I'm not quite sure we
want it like this (just yet).

> @@ -2940,11 +2948,13 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
>  #endif
> +#ifdef CONFIG_VMTRACE
>      .vmtrace_control = vmtrace_control,
>      .vmtrace_output_position = vmtrace_output_position,
>      .vmtrace_set_option = vmtrace_set_option,
>      .vmtrace_get_option = vmtrace_get_option,
>      .vmtrace_reset = vmtrace_reset,
> +#endif
>  
>      .get_reg = vmx_get_reg,
>      .set_reg = vmx_set_reg,

Blank line ahead of the new #ifdef?

> @@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>  bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>  #endif /* CONFIG_ALTP2M */
>  
> +#ifdef CONFIG_VMTRACE
>  static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>  {
>      if ( hvm_funcs.vmtrace_control )
> @@ -780,6 +783,12 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>  
>      return -EOPNOTSUPP;
>  }
> +#else
> +static inline int hvm_vmtrace_reset(struct vcpu *v)
> +{
> +    return 0;
> +}
> +#endif

#ifdef inside the function body please, to reduce redundancy and to reduce the
risk of overlooking multiple places which need editing (when e.g. function
parameters change).

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -155,7 +155,9 @@ struct vmx_vcpu {
>      bool                 ept_spurious_misconfig;
>  
>      /* Processor Trace configured and enabled for the vcpu. */
> +#ifdef CONFIG_VMTRACE
>      bool                 ipt_active;
> +#endif

Imo such an #ifdef would better enclose the comment as well.

> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>      req->data.regs.x86.dr6 = ctxt.dr6;
>  
> +#ifdef CONFIG_VMTRACE
>      if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
> +#endif
>          req->data.regs.x86.vmtrace_pos = ~0;
>  #endif
>  }

Use IS_ENABLED() together with a function declaration (but no definition) in the
VMTRACE=n case?

Jan

