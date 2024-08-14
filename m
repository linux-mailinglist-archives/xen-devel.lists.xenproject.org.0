Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EB951873
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 12:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777057.1187253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAy4-00036y-4t; Wed, 14 Aug 2024 10:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777057.1187253; Wed, 14 Aug 2024 10:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAy4-00034t-18; Wed, 14 Aug 2024 10:11:00 +0000
Received: by outflank-mailman (input) for mailman id 777057;
 Wed, 14 Aug 2024 10:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seAy3-00034n-C5
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 10:10:59 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 802eec8b-5a25-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 12:10:58 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f16d2f2b68so90807951fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 03:10:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411b456sm153539966b.110.2024.08.14.03.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 03:10:57 -0700 (PDT)
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
X-Inumbo-ID: 802eec8b-5a25-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723630258; x=1724235058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+FH+YWHbPk3t/NqchlDj/yfYjS42TFfSK9xdeXyxDY=;
        b=IJJ2n4Z7vcZKXgatqIc+U+/Xzxjb2vv3eJBQ9GTZ7u0TmDsXkEzRKIf/fIJuwCKIiO
         XpgcAbtFf8M8VhMmvC4k+S7wMwRdXQL+z9W3miVJPU0bya9E70CVfFadik1IPWulUJef
         8QATD/UvZbc2rRaS8CPnquanh2X+i7x89MpN4Np9eIDQgG1Bw45CHg5e2tGBr9H2K2hp
         F25bPHqttw/0bwTbJNuK26lpgHNFq5oj7fOCkuy8F8luJaK09VUQb0Qm91eQu8Azo7NU
         XwhL1k6OFJdR6Tq5S1oIvplM82ED6nUwDJYyfGM86cO5VIelNiXlyJR+daFyZtolKjmH
         v6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630258; x=1724235058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+FH+YWHbPk3t/NqchlDj/yfYjS42TFfSK9xdeXyxDY=;
        b=feFHCPd6uOJOPLP7a4ZXB86b/DubW5pAKAj+HmVTCJBC/N+nUW19wBdh2M9MwLAkAR
         alwWYbTeSZRelynrj5t+04i67yPDaAKVUHYfEWId1wTu0Rulk8lYV2vbHAI2OZ8fg2KU
         8hy73hIMN9mJLLZXgFhEx+NsSRK721u1gQxqCN23p+JWqsqi2T0jF+vokpYQN3erOYL7
         0RKeT1bFAVVutm8NeDBHC4dyb/TzBLzittJuEMedZ/ULKDxtUPKc6FQXdv14r/UlK2zn
         DIi4YGcIlmV6iVXcbHhYcz+D6htlhF88vZ+jfso2s0djyGrttHDn/SSIgTbVeqnNuwjX
         Gsqw==
X-Forwarded-Encrypted: i=1; AJvYcCVQdkjeRZpy81wHI6ufqM7E1wARuC7drlLXCWnVAHXRTAtHAHSWr01eKSSoWfCPFB08gqSlNoDXDg/NL2bmcqA9MldBAkUgclR3QXiqCrY=
X-Gm-Message-State: AOJu0Yw3QoSgbJJ2AbY487Y/c15RLPIAhKutz5s3XJA5I7KPVJ0csTir
	UcYv13IZVKFcLXjmHhBYfhAhrLTIUzVqIY1p6N1U8vHdcJqpBX/ReIryzc9CV2yd56vj1m5xSsI
	=
X-Google-Smtp-Source: AGHT+IGz94GaoyjhQ0pPklHMoDjde16ZqwINZ/t3wanl65xBFh/ZjSD1shNTfZwR1Y/QUBRTRJ4KLA==
X-Received: by 2002:a2e:f1a:0:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f3aa1d8149mr17552051fa.7.1723630257470;
        Wed, 14 Aug 2024 03:10:57 -0700 (PDT)
Message-ID: <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>
Date: Wed, 14 Aug 2024 12:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-13-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-13-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>  
>  ### spec-ctrl (x86)
>  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
> ->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
> +>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,

Is it really appropriate to hide this underneath an x86-only option? Even
of other architectures won't support it right away, they surely will want
to down the road? In which case making as much of this common right away
is probably the best we can do. This goes along with the question whether,
like e.g. "xpti", this should be a top-level option.

> @@ -2414,10 +2414,10 @@ in place for guests to use.
>  
>  Use of a positive boolean value for either of these options is invalid.
>  
> -The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=` and `bhb-entry=`
> -options offer fine grained control over the primitives by Xen.  These impact
> -Xen's ability to protect itself, and/or Xen's ability to virtualise support
> -for guests to use.
> +The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=`, `bhb-entry=` and
> +`asi=` options offer fine grained control over the primitives by Xen.  These

Here, ahead of "by Xen", it looks like "used" was missing. Maybe a good
opportunity to add it?

> @@ -2449,6 +2449,11 @@ for guests to use.
>    is not available (see `bhi-dis-s`).  The choice of scrubbing sequence can be
>    selected using the `bhb-seq=` option.  If it is necessary to protect dom0
>    too, boot with `spec-ctrl=bhb-entry`.
> +* `asi=` offers control over whether the hypervisor will engage in Address
> +  Space Isolation, by not having sensitive information mapped in the VMM
> +  page-tables.  Not having sensitive information on the page-tables avoids
> +  having to perform some mitigations for speculative attacks when
> +  context-switching to the hypervisor.

Is "not having" and ...

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -458,6 +458,9 @@ struct arch_domain
>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>      bool msr_relaxed;
>  
> +    /* Run the guest without sensitive information in the VMM page-tables. */
> +    bool asi;

... "without" really going to be fully true? Wouldn't we better say "as little
as possible" or alike?

> @@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>              opt_unpriv_mmio = false;
>              opt_gds_mit = 0;
>              opt_div_scrub = 0;
> +
> +            opt_asi_pv = 0;
> +            opt_asi_hwdom = 0;
> +            opt_asi_hvm = 0;
>          }
>          else if ( val > 0 )
>              rc = -EINVAL;

I'm frequently in trouble when deciding where the split between "=no" and
"=xen" should be. opt_xpti_* are cleared ahead of the disable_common label;
considering the similarity I wonder whether the same should be true for ASI
(as this is also or even mainly about protecting guests from one another),
or whether the XPTI placement is actually wrong.

> @@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
>  
>  static __init void xpti_init_default(void)
>  {
> +    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
> +    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )

There is a separate opt_asi_hwdom which isn't used here, but only ...

> +    {
> +        printk(XENLOG_ERR
> +               "XPTI is incompatible with Address Space Isolation - disabling ASI\n");
> +        opt_asi_pv = 0;
> +    }
>      if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
>           cpu_has_rdcl_no )
>      {
> @@ -389,9 +428,9 @@ static __init void xpti_init_default(void)
>      else
>      {
>          if ( opt_xpti_hwdom < 0 )
> -            opt_xpti_hwdom = 1;
> +            opt_xpti_hwdom = !opt_asi_hwdom;
>          if ( opt_xpti_domu < 0 )
> -            opt_xpti_domu = 1;
> +            opt_xpti_domu = !opt_asi_pv;
>      }

... here?

It would further seem desirable to me if opt_asi_hwdom had its default set
later, when we know the kind of Dom0, such that it could be defaulted to
what opt_asi_{hvm,pv} are set to. This, however, wouldn't be compatible
with the use here. Perhaps the invocation of xpti_init_default() would
need deferring, too.

> @@ -643,22 +683,24 @@ static void __init print_details(enum ind_thunk thunk)
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_verw_hvm                              ? " VERW"          : "",
>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
> -           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
> +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "",
> +           opt_asi_hvm                               ? " ASI"           : "");
>  
>  #endif
>  #ifdef CONFIG_PV
> -    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
> +    printk("  Support for PV VMs:%s%s%s%s%s%s%s%s\n",
>             (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
>              boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
> -            opt_bhb_entry_pv ||
> +            opt_bhb_entry_pv || opt_asi_pv ||
>              opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
>             boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
>             boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_verw_pv                               ? " VERW"          : "",
>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> -           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
> +           opt_bhb_entry_pv                          ? " BHB-entry"     : "",
> +           opt_asi_pv                                ? " ASI"           : "");
>  
>      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
>             opt_xpti_hwdom ? "enabled" : "disabled",

Should this printk() perhaps be suppressed when ASI is in use?

Jan

