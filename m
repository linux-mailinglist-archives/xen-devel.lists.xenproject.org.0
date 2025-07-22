Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DCB0E0F7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 17:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052885.1421655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFHe-0008C5-2V; Tue, 22 Jul 2025 15:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052885.1421655; Tue, 22 Jul 2025 15:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFHd-0008AS-Tt; Tue, 22 Jul 2025 15:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1052885;
 Tue, 22 Jul 2025 15:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueFHc-0008AM-C4
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 15:52:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccb4df57-6713-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 17:51:58 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a522224582so2797745f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 08:51:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3f2e1fesm8446465a91.31.2025.07.22.08.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 08:51:57 -0700 (PDT)
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
X-Inumbo-ID: ccb4df57-6713-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753199518; x=1753804318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KXKshVbtG6VK1bFKIwwR7I+g25+XvP2uBmnNaQpDoZ0=;
        b=blayK1Cnyqt8gwaCinHKeQX+Ut6rgf+8w1PrDvz6HsCJhW15cR78N2qkN2D/CWdDZ2
         gnaTRFRvQTo1lIM7fDpvOOMR2AuP9AmY2M+84JDksnp/BoZAXql+rsL0oFJVq8IyUZ06
         fdQU3c4l6oPjI8QVpB0J3eCPyXXzRsyi8wZM7CXQVLFyKYbfOywqhqXryU7eoxP/7QBv
         +xOsBIvKlxI5yKB8auFuds3BU+kqUgS/sJZMfM0t0KLQQlzzbtuaNCYUnzlI4qDU5Hnu
         NM+/IqA976PziJlwhIa7wagsNTRj6mdpqVu1eiSLsQ1cl++XLgWyifiEUuRR744BMWyo
         ohNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753199518; x=1753804318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXKshVbtG6VK1bFKIwwR7I+g25+XvP2uBmnNaQpDoZ0=;
        b=v8vc0ArpOqMTAMYPkmI7kVWXJcMSjV/GUhhHf+GX0KEBXRy1KDu2X4sYpVLxS2Jy+R
         UUws35S9Ma9udj5O776bB0XrFtoUJMd8qLr9s6OFCo1Jk0B6q0+oM1c+J4hxMj5D0P52
         sO8bXqRe0+VwmTJSPQqZ8DxtAS+YP84ZCFo5UtRVNZiPhiktazQHpa+AyYdDInvLXtFa
         9eN3gv232klMS94nMlzRUGj3c4fBswXRdgckSE1/7Gu2nkdnPCJWZAaW5emhJtaIrTuT
         vvJnkjC8cTB7RnuReFoT497HKHsGX4GalRXhIZrd318F1dy0p4fa5eEMr9gqPLWb8BNT
         hGJw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ylio2Nl7T0TfOK1iwpDAaP7AIB8qZmXhyNEjXYyMcl0rsnKGowthrAT+JGi6QAgkMeRo0+YAH0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTvbnJii28pxkiOxD65FFBy5/ToD31xPAjtT5dXaR3+dLvmJm5
	14l3qFsKTL24fj6xiIt9gGkOjfjXNHD+KycfFTWqhqjwrpxO3hSVR+w6pKzD2DrRAw==
X-Gm-Gg: ASbGnctWTyH8Lob8VwQy4xjy9KL0uBHZbp1IZ+92pbzY5OsHXPv/JrfP5+SZNYySX/A
	2HQadsgHL7M12JhdIzbPupxv4wTR1Cl5FoWu04DsZexJ/xGyVsZ/0lsRkj76seqAwJK7MxdJ4Z2
	0IqPylxkAlgqmpaZnFC3bVAr0XPwkTGhYdV5F8IHTmNa+6pnI3rmrvH4K4vPTlzurbOrOFi+AxH
	Vrjmcaml1h9o6/Argf7lxbLK0lcJofXUzmf9VWByFnvGQmIdIgsGWoY6zUeK1pm93XdU9Fu3HHo
	kuuNgAr5da2zsv5pP7F0e84DoyHi5hnFvbEktDDdD3Yy2wuI0MOA/TkgDgEOKs8Y6amixrZ6LI0
	oN3CUR/Sbiwx7BTIvvkF7Ikw5lVfaMqyAP+VyMSlXpB6tIHpfq2a/sEoqWoTwvqLh2FM7vAbvSV
	uTiz18/Cs=
X-Google-Smtp-Source: AGHT+IFFv1ffgrjJKNtPJAdyvFl5xCjZQiO4z1cuFHZGt8M3czYzNtf5xANe88rcjLQAIaVaFRCmOw==
X-Received: by 2002:a05:6000:4606:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3b60dd9988amr18831376f8f.47.1753199517974;
        Tue, 22 Jul 2025 08:51:57 -0700 (PDT)
Message-ID: <ba64b28d-1db8-47a2-a26f-9862dd9994cd@suse.com>
Date: Tue, 22 Jul 2025 17:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/9] x86/altp2m: Wrap altp2m-specific code in #ifdef
 CONFIG_ALTP2M
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1752691429.git.w1benny@gmail.com>
 <35028b36429edbff5f6bf1af6a8168ac055089bd.1752691429.git.w1benny@gmail.com>
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
In-Reply-To: <35028b36429edbff5f6bf1af6a8168ac055089bd.1752691429.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 22:15, Petr Beneš wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2686,8 +2686,8 @@ static int cf_check hvmemul_tlb_op(
>      return rc;
>  }
>  
> -static int cf_check hvmemul_vmfunc(
> -    struct x86_emulate_ctxt *ctxt)
> +#ifdef CONFIG_ALTP2M
> +static int cf_check hvmemul_vmfunc(struct x86_emulate_ctxt *ctxt)

Please don't needlessly alter formatting, and ...

>  {
>      int rc;
>  
> @@ -2699,6 +2699,12 @@ static int cf_check hvmemul_vmfunc(
>  
>      return rc;
>  }
> +#else
> +static int cf_check hvmemul_vmfunc(struct x86_emulate_ctxt *ctxt)
> +{
> +    return X86EMUL_UNHANDLEABLE;
> +}
> +#endif

... please don't duplicate function headers when such #ifdef-s can easily
be put inside the function body. Much like you do ...

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4608,6 +4608,7 @@ static int hvmop_get_param(
>  static int do_altp2m_op(
>      XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
> +#ifdef CONFIG_ALTP2M
>      struct xen_hvm_altp2m_op a;
>      struct domain *d = NULL;
>      int rc = 0;
> @@ -4944,6 +4945,9 @@ static int do_altp2m_op(
>      rcu_unlock_domain(d);
>  
>      return rc;
> +#else /* !CONFIG_ALTP2M */
> +    return -EOPNOTSUPP;
> +#endif /* CONFIG_ALTP2M */
>  }

... here.

> @@ -5261,6 +5269,7 @@ void hvm_toggle_singlestep(struct vcpu *v)
>  
>  void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
>  {
> +#ifdef CONFIG_ALTP2M
>      ASSERT(atomic_read(&v->pause_count));
>  
>      if ( !hvm_is_singlestep_supported() )
> @@ -5272,6 +5281,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
>      v->arch.hvm.single_step = true;
>      v->arch.hvm.fast_single_step.enabled = true;
>      v->arch.hvm.fast_single_step.p2midx = p2midx;
> +#endif
>  }

This function would better be unreachable when ALTP2M=n, imo. Putting an #ifdef
in vm_event_toggle_singlestep() would be the simple solution, but maybe we could
to better.

> @@ -707,6 +709,7 @@ static inline bool hvm_nested_virt_supported(void)
>      return hvm_funcs.caps.nested_virt;
>  }
>  
> +#ifdef CONFIG_ALTP2M
>  /* updates the current hardware p2m */
>  static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
>  {
> @@ -731,6 +734,11 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>      }
>      return false;
>  }
> +#else /* !CONFIG_ALTP2M */
> +void altp2m_vcpu_update_p2m(struct vcpu *v);
> +void altp2m_vcpu_update_vmfunc_ve(struct vcpu *v);
> +bool altp2m_vcpu_emulate_ve(struct vcpu *v);
> +#endif /* CONFIG_ALTP2M */

Why would the altp2m_vcpu_update_{p2m,vmfunc_ve}() declarations be needed? All
uses are from altp2m.c.

Jan

