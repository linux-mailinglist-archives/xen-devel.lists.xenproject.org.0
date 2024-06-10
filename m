Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CE902573
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737380.1143653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgr3-0007qh-VR; Mon, 10 Jun 2024 15:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737380.1143653; Mon, 10 Jun 2024 15:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgr3-0007oc-Sd; Mon, 10 Jun 2024 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 737380;
 Mon, 10 Jun 2024 15:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgr2-0007oW-6V
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:22:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ab1514-273d-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:22:38 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57a677d3d79so10240539a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:22:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0dfb73c0sm310472366b.180.2024.06.10.08.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:22:38 -0700 (PDT)
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
X-Inumbo-ID: 45ab1514-273d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718032958; x=1718637758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hT1c3yKG2C3ot1gvkoNSLJnU1soOSOzEvlqE6vLPc+o=;
        b=GqCbBRXKGboiDWWMNmDkCfWbrVOUYy3fL/2BQaEp6n015cXb7upyvfkYMJIYZ+S97t
         h3oQsicemCFCI5eEXo7HQMD2odzdSm9OYptl1F/nm+Uub8ogGhBkpfKGI9pXmLwKuGYj
         3G2K+JqYjLpw8Gx7BrEUvsCmplcgvmNAnn8Tido882wlzjeC3+ALCKfhbCvuQ6RA3WTV
         XCiqHPQTCd7Gyl2rK00a2YOjKZh30uBJ67zu1fo3P+3qwtSgPrCDWq/Zwtlk0c6NvVsq
         ViJmzLItnxe07pFxgyRCpxYkvUaHlUQetOExRVMjmKFxbPTIjW5IdBPcwgeyqdsFnKH4
         SGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718032958; x=1718637758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT1c3yKG2C3ot1gvkoNSLJnU1soOSOzEvlqE6vLPc+o=;
        b=kBTZkJzgKr5FnJV7+ujpPaRh4JsnvmXlFjZvLJsbWh+tvafmg0XLbHSG9sqb5Oexa1
         g6GLl3wBFiLkdQqTDSruj/fIT0v6I+gr1d7qM0QeUYA691+8+EVeNTtpHFD3IsNUA4ny
         cTi13E78H1cVmt+egESwKIG0qnYvpxx8RmD3GtB8Ugf8R+7kNNs2VvWtMETbjfXMGTX9
         ZIXgqMq2R6JfvIHNVPKwe+o3LahVn/c/TlXv14u942qnhqPicChaeQbGnAYY1hyZ12HC
         SrLW5IUV4SJkV64+6/A3FlRKOz2W0VeGlf3pLlDG5/i9Tio0oQ6C2YHZ/GkT3ixg0/0v
         s4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUSc9p/nBGOhTvHv5+EOF3S8cLjwUbNwkLdhrsJiV2oYqB64Fg3kFLVQ7efSv7C92oOHNfzuahLuehufJXbhFN3cw8srWGPDBPMFihNo=
X-Gm-Message-State: AOJu0Yz83bd3Yj7sS+SgvTKmSyzQBnuIRquknpUYnhVt3pDqE1YbCvP2
	XS6zAtg13+Bx+D35UZIFBUb6XOreT1HTwFd+yYToKRvHF0x0aw0ExxgZpERSew==
X-Google-Smtp-Source: AGHT+IEdQ4HotAWzHu4hb8IhHt0h83vEfEAgPxyq7C3dAwH5akP0l9tHc3E6NaVlbAYFsi0+DugxWQ==
X-Received: by 2002:a17:906:d157:b0:a6f:1f67:9816 with SMTP id a640c23a62f3a-a6f1f67988cmr198391666b.22.1718032958200;
        Mon, 10 Jun 2024 08:22:38 -0700 (PDT)
Message-ID: <c3fcf89d-4f6a-4f7d-a49a-4e50e4978bc0@suse.com>
Date: Mon, 10 Jun 2024 17:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 13/16] x86/vpmu: guard calls to vmx/svm functions
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <b7f68e09ccc54782410d65173e490f477364a5f0.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <b7f68e09ccc54782410d65173e490f477364a5f0.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:32, Sergiy Kibrik wrote:
> If VMX/SVM disabled in the build, we may still want to have vPMU drivers for
> PV guests. Yet in such case before using VMX/SVM features and functions we have
> to explicitly check if they're available in the build. For this puspose

Nit: It's not the first time that I see this apparent typo - I assume here
and elsewhere "purpose" is meant?

> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -27,6 +27,7 @@
>  #define is_pmu_enabled(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_EN_SHIFT))
>  #define set_guest_mode(msr) ((msr) |= (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
>  #define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH - 1))))
> +#define is_svm_vcpu(v) (using_svm && is_hvm_vcpu(v))

Like for the earlier patch the implicit cpu_has_svm check you add here is
redundant with us knowing we're dealing with AMD hardware here. Please
consider switching to IS_ENABLED().

> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -54,6 +54,8 @@
>  #define MSR_PMC_ALIAS_MASK       (~(MSR_IA32_PERFCTR0 ^ MSR_IA32_A_PERFCTR0))
>  static bool __read_mostly full_width_write;
>  
> +#define is_vmx_vcpu(v) ( using_vmx && is_hvm_vcpu(v) )

Nit (style): Unlike above, but like iirc you had it elsewhere, you have
stray blanks here immediately inside the parentheses. Beyond that the
comment above applies here, too (with s/AMD/Intel).

Jan

