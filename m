Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15606878F5B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 09:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691681.1077906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjx3A-0005sa-05; Tue, 12 Mar 2024 07:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691681.1077906; Tue, 12 Mar 2024 07:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjx39-0005pd-Sq; Tue, 12 Mar 2024 07:59:51 +0000
Received: by outflank-mailman (input) for mailman id 691681;
 Tue, 12 Mar 2024 07:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjx38-0005pW-9m
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 07:59:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb87237-e046-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 08:59:49 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56878bb1abdso197156a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 00:59:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wy4-20020a170906fe0400b00a4354b9893csm3584697ejb.74.2024.03.12.00.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 00:59:48 -0700 (PDT)
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
X-Inumbo-ID: 7fb87237-e046-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710230388; x=1710835188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5n7+IfRMpREeyf0dMDh/LNDToXH/s8vE+3L1Q1VXHo=;
        b=ZLXjXuXURt9OHDWaVFbcxQq1tX2Pp2Q3yEY/bYBF1Ve0L730N85q53aaWM41OknwCp
         VoBYnC79hq6jRnhVlkR80O9/rub8iyf+Bc34t7NQudpHbfnXpFbIYYr9vs4aKUzqIBFb
         +ITYZebUcP9K/AIqr+LIAJfwlBDAh3egm+2WFjaaYVGB7nWXbVex3o0dJ79JWvurwppC
         7Evg07spJeEweNG5Crc7Yckdm8BzSGjIuxI+floqUbhpbjd+1mM5WE0xfI+WTmuv0jlP
         T7wTPU7jEafQpJS9/PJ0j+1S+h4Xiqv0krEGtaaycwwT6R/TzhrkDuiauISCs0pEsTzq
         FKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230388; x=1710835188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5n7+IfRMpREeyf0dMDh/LNDToXH/s8vE+3L1Q1VXHo=;
        b=i2tUp22B4AvfvarMcLDaU4RPp4jtWRtOA82g2x0eEzMjjmY5GOjHHb98qhsEQ0aeqz
         wsqyxmtt7Z203lQS7uKXjduaPpID6Gr4lOaUAD8qjmXlQ8rdw0VQ1qIwx+TJAxkbomC6
         YcHfbEwUcYk+BnaqU1EAAN7HtsaSMZ9CRk9nx3oAEHaSY9Epzn2/y4nt0FrCa7hrXdin
         U9ak4wJp5ad45BhsMWticGS94e5ZDfyTfSWzQqlXxynSa+Azr6rcKzBhY9fAte8M7OuX
         UKIwxYILH1qYNSYkcX56CCqfS1N0P06G5nGeyZ12z/pFwANjCX0QZi6T8bghKDLa1IeR
         5Zwg==
X-Forwarded-Encrypted: i=1; AJvYcCUOS6Hm/GdkL2/wXeQvH00vNtF/hB3WGSr9i765HPT9XItpNsfug7qKVH8caC1wnVsIXi+nzolJXR/EmnjwJl79/3ExlXygWeQYi2nHiPU=
X-Gm-Message-State: AOJu0YxnrzGWBzT5/RunQF9h6Pz43RwnmyHaxRgSDxCCcXR667dhiyym
	kKWpKnedQkt4H3Ec+XVcMdpsWaV0n8HRwVwoxw9nv3Po5njl5i6rmNVMza+iVw==
X-Google-Smtp-Source: AGHT+IFytpSheQwets1rd/gMDava4tzLwMZ/l3ojTiD458htyxLn16p5WYaVi2/zb1BELGiYED7qWg==
X-Received: by 2002:a17:906:3e52:b0:a46:196d:d678 with SMTP id t18-20020a1709063e5200b00a46196dd678mr664732eji.36.1710230388545;
        Tue, 12 Mar 2024 00:59:48 -0700 (PDT)
Message-ID: <d2830e8e-6cf5-4266-a7ac-c5103fcae233@suse.com>
Date: Tue, 12 Mar 2024 08:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/svm: Drop the suffix _guest from vmcb bit
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <b0e5dde517599e8af5aadbaff7dd4410e83fcf86.1710149462.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <b0e5dde517599e8af5aadbaff7dd4410e83fcf86.1710149462.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 13:40, Vaishali Thakkar wrote:
> @@ -698,11 +698,11 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      /* Convert explicitely to boolean. Deals with l1 guests
>       * that use flush-by-asid w/o checking the cpuid bits */
>      nv->nv_flushp2m = !!ns_vmcb->tlb_control;
> -    if ( svm->ns_guest_asid != ns_vmcb->_guest_asid )
> +    if ( svm->ns_asid != ns_vmcb->_asid )
>      {
>          nv->nv_flushp2m = 1;
>          hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
> -        svm->ns_guest_asid = ns_vmcb->_guest_asid;
> +        svm->ns_asid = ns_vmcb->_asid;
>      }
>  
>      /* nested paging for the guest */
> @@ -1046,7 +1046,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      /* Keep it. It's maintainted by the l1 guest. */
>  
>      /* ASID */
> -    /* ns_vmcb->_guest_asid = n2vmcb->_guest_asid; */
> +    /* ns_vmcb->_asid = n2vmcb->_asid; */

Unlike in the earlier patch, where I could accept the request to switch
to using accessor functions as scope-creep-ish, here I'm pretty firm
with my request to stop their open-coding at the same time. Unless of
course there's a technical reason the accessors cannot be used here.

Jan

