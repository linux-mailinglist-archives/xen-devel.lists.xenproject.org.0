Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6431C564D6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 09:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160716.1488763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJSpB-0000Km-7N; Thu, 13 Nov 2025 08:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160716.1488763; Thu, 13 Nov 2025 08:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJSpB-0000IB-4Z; Thu, 13 Nov 2025 08:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1160716;
 Thu, 13 Nov 2025 08:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJSpA-0000I2-6Q
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 08:37:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea67370d-c06b-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 09:36:57 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b72dad1b713so74686866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 00:36:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda92c5sm113316166b.53.2025.11.13.00.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 00:36:56 -0800 (PST)
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
X-Inumbo-ID: ea67370d-c06b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763023017; x=1763627817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KKRt9vZHD+sKgNrjDwmHcf8CKsr8hx5uNNH8e7WqOzA=;
        b=crJSM6jaH7XdKgQr8CNDlFyDmWShkO2V97DRB1BYOHIJgFAolF5BSRnnR2v5kOqVZr
         jYTXUnpB/0lW9BHyk9nF/20Wv8gM6jWSaIUuwIVBro0UznRTOYRsNTjIbotJaGeNqUlP
         u3Ne4ZCIYh92SeKoUEbp6Gy2hC5iB2xslQ2fMDAOj3e7wGU5SjXhvLccVwS5io0vKXnk
         5z9cKGzxP+mkJXuwIbArLo4/RbzEcRsaQ2cFfxO57LOyzl16sbdAvyUCIAwTlzJXy77O
         YgqnjfoTnzkkeEO507FLv4QZ0qn21gZ97bITiJczAdFHapZqwMF0+JZJMyXtvqW1YKLj
         iOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023017; x=1763627817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKRt9vZHD+sKgNrjDwmHcf8CKsr8hx5uNNH8e7WqOzA=;
        b=jUwFqpTOH5sHOxeFjenDH7J2ZBt3vwKTJoafDgWntin5QDNdmP3otwIs2dRDurBkg8
         LZVuBXAdejKudMymiItft+nh0xMUp7rEeERpW543UIjksUhFuMZUwvYWLm2VyMmF8bFY
         vd59H+uQiw5TbL6nMgTGHaQM30/sZy5VMp8M8pt9pifyIrv+vTZXITKNFNsgeJidPEJ/
         cPLHaIZFcJCdeU33DBu2UjyXyEfGDEwlNoIICdLBi+2k9gavLvyBsAhhW6YOdSfxRlWw
         yAfhreWIs40q3hBdLpQ7XwUOCYQNt3Lpw0V5BbAO220hV6MHSsxBcLfShs5DlExZigw4
         0EVw==
X-Forwarded-Encrypted: i=1; AJvYcCUuGJ1NITXi3T22xmwXOQhkggwQ2qpa3zS3BncsaObUw4/ZXBp9KDclkqpan6WytabQZiWtSDBEJlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBVGbrh2SX1HD3359ggc7Zn3ORQBQicXgY3ISBR0GHkbqE7Zqu
	MCI2l+EXQnvycGjAVYTOUUhwZwQcqRCw0ibXHnHNq6d4b5booYDZftVL67r+QBZ5LA==
X-Gm-Gg: ASbGncsXh/dIzV6uH3NnmLfi2UaQVHshoYQbv+L3muIJUmiopgbK5I/lkeucZGJp+XG
	y+unzB+IFeBWM6V5R/SSqGCLIIqvxaxUC3BPWDe48M+fWUTRHwKiGQlR9Bl60EhfVUCUOEoc4wu
	VkjZSmzgeCu0Z2LfUPgy/Acctgz2/bWlge134b6cME/+nRjpOGXsbizeGW1fh+bBx/ZDH7vODAn
	CWdDFoL1VbUtNN3K5XsSxVy7HR7OOQPTmqhM7agmpYX7VM5/JttHmVfJXaMCFS4XFJdSlUUfjWX
	bvqDjyQD8N1Z9fWwrDKutzMbYSkBbh4I7p5Ul8ctHDrnr02pD5UYE+3qoAO1wQvmryh4/mB6Ngn
	E3JBXCcBfaRZ9eH/4E8iJ2gS0uAj9Db4LiJqtoeGAWs/eHwDQlew4GBGsGDmjDUt8UJGIG3lrtn
	P2YyO9TiICGBQ0xPEJfxWs+uGM3GXo1tsaNwnKiyVTcyOQ1Vq7ZA==
X-Google-Smtp-Source: AGHT+IGUmdm1aQ6L3W2GeoEolsNtMxYsw+ekEzR+jcR/4fH5iMIA+/HfOwU+/OHVqgaqaNGyqjNNPw==
X-Received: by 2002:a17:907:80e:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b73319ba692mr699660466b.27.1763023016757;
        Thu, 13 Nov 2025 00:36:56 -0800 (PST)
Message-ID: <a634c192-9ea3-46d9-a087-f0f48a5c2494@suse.com>
Date: Thu, 13 Nov 2025 09:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251112202442.3879997-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251112202442.3879997-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 21:24, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>      rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>  
>      /* Check whether IPT is supported in VMX operation. */
> +#ifdef CONFIG_VMTRACE
>      if ( bsp )
>          vmtrace_available = cpu_has_proc_trace &&
>                              (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>                 smp_processor_id());
>          return -EINVAL;
>      }
> +#endif

Initially I was inclined to ask for use of IS_ENABLED() here, but that wouldn't
work since vmtrace_available isn't an lvalue when VMTRACE=n. Hence why generally
I think it is better to check the particular identifier in such cases, rather
than the original CONFIG_* (i.e. "#ifndef vmtrace_available" here). I'm not
going to insist though, as I expect opinions may differ on this matter.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -234,12 +234,14 @@ struct hvm_function_table {
>      int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
>  #endif
>  
> +#ifdef CONFIG_VMTRACE
>      /* vmtrace */
>      int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
>      int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
>      int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
>      int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
>      int (*vmtrace_reset)(struct vcpu *v);
> +#endif
>  
>      uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
>      void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
> @@ -735,6 +737,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>  bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>  #endif /* CONFIG_ALTP2M */
>  
> +#ifdef CONFIG_VMTRACE
>  static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>  {
>      if ( hvm_funcs.vmtrace_control )
> @@ -769,13 +772,20 @@ static inline int hvm_vmtrace_get_option(
>  
>      return -EOPNOTSUPP;
>  }
> +#else
> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
> +#endif

There not being any definition for this declaration (regardless of configuration),
a comment might have been warranted here. Furthermore, can't the stub further down
in the file now go away (addressing a Misra concern of it now being unused, as
HVM=n implies VMTRACE=n)? Possibly this applies to a few other stubs there as
well?

>  static inline int hvm_vmtrace_reset(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      if ( hvm_funcs.vmtrace_reset )
>          return alternative_call(hvm_funcs.vmtrace_reset, v);
>  
>      return -EOPNOTSUPP;
> +#else
> +    return 0;
> +#endif
>  }

This doesn't look right - if absence of a hook results in -EOPNOTSUPP, so should
VMTRACE=n do. (There's no practical effect from this though, as - perhaps wrongly -
neither caller checks the return value.)

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct domain *d,
>      case XENMEM_resource_ioreq_server:
>          return ioreq_server_max_frames(d);
>  
> +#ifdef CONFIG_VMTRACE
>      case XENMEM_resource_vmtrace_buf:
>          return d->vmtrace_size >> PAGE_SHIFT;
> +#endif
>  
>      default:
>          return 0;
> @@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
>  #endif
>  }
>  
> +#ifdef CONFIG_VMTRACE
>  static int acquire_vmtrace_buf(
>      struct domain *d, unsigned int id, unsigned int frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> @@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
>  
>      return nr_frames;
>  }
> +#endif
>  
>  /*
>   * Returns -errno on error, or positive in the range [1, nr_frames] on
> @@ -1238,8 +1242,10 @@ static int _acquire_resource(
>      case XENMEM_resource_ioreq_server:
>          return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
>  
> +#ifdef CONFIG_VMTRACE
>      case XENMEM_resource_vmtrace_buf:
>          return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
> +#endif
>  
>      default:
>          ASSERT_UNREACHABLE();

Without the intention to ask for a change right in this patch, this is a little
awkward: resource_max_frames() returning 0 results in acquire_resource() to
return -EINVAL, when with VMTRACE=n for XENMEM_resource_vmtrace_buf it imo
better would be -EOPNOTSUPP.

Jan

