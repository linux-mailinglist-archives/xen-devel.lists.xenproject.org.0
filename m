Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA297942E50
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768538.1179369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8N8-00035N-2W; Wed, 31 Jul 2024 12:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768538.1179369; Wed, 31 Jul 2024 12:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8N7-00032s-Vq; Wed, 31 Jul 2024 12:24:01 +0000
Received: by outflank-mailman (input) for mailman id 768538;
 Wed, 31 Jul 2024 12:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ8N6-00032m-96
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:24:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03a5755-4f37-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 14:23:54 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a15c2dc569so4934197a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3146sm8641705a12.66.2024.07.31.05.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 05:23:57 -0700 (PDT)
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
X-Inumbo-ID: c03a5755-4f37-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722428638; x=1723033438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B27pjRdnhyBOcqpeMg3qCW584FZBVzYWW63ojgafWRc=;
        b=NO53XN4dQsm2Bhij61PBj1GbD+PX5c3vAf4xkLXpwd5qlEF2muqTAdA2HRhSaT29b6
         cygOj+xG97yY+cCPf3Bbc+korDdCx7OyCY+wuVwt2NfbnNEwQuH5nlqSsLlNnN8mDeQJ
         yqS/pVYrroQOdtUl33jEKK3Ng2Qm6dkh7z8vKyzLpTKqVu68tUw1G4IDcPOCSTEEXiKy
         bBwfhk7C7n3IDKNRrLWL1iVkes9mTGXRU13pRNwKupp0ZWdPvHvuX4/vNeQmqCTgOp6c
         HhmNNjjDE8QNYJe4RYuJnfy884wsRxtxVBg9X/pPbRDGmo44aojOHfDtAALhgdzMy1JG
         iGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428638; x=1723033438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B27pjRdnhyBOcqpeMg3qCW584FZBVzYWW63ojgafWRc=;
        b=Vs2DhvzM3/eQDWYYpZdd432RsvjOYPDIr2B6/N/J5WDoVovBoVTcT8IelKI4afD8xn
         4g1mTKhKt0ogw8/d8PSMeXCMtKdEYHJ6+gJwh7/AWD8Mu6BSbxEtLfubi1Y8kCyUY4on
         3E7AzXxfLVYl4cxUvZ9VYinQ4WcEAAJJtFFMKkL6PiKE5nZLK+TonEfdIK6qTtpwEDQM
         IwTe3E/Nk34v/sT76pAUNzj5jdqF+wzam7pGNsm/uiDH4j4OjpZdVOBY3F/bl5FrvVBr
         QJ8Gqh7FhFGUJef25E5ACCs9b35Owui+u46twl/NdC73oYa1G2HY4SguRDhw150lHzT5
         37wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsWORWJrVY3Rge8KC6IZkXrDG37vQyeysx7ecAor8miZ0Fa9f7f9YeQ1x3BQmNIbT2ndr54eYB6AAlMqvf5/CLzUnh9SCU5ABIOLyghvk=
X-Gm-Message-State: AOJu0YxvC9DaO1HiyQj1MbLJ9YwftFlmk2Ggqzw6hkGWUtsRJcHKCpcW
	fcoBIeI33h9EdhKofDheFfeYYMv5ayvCjhwM22Y+3imTZ1ojGmvT1Gz1zUNekg==
X-Google-Smtp-Source: AGHT+IFjp9VYsbonbw0qpeyzwQawhNsXpu87dYyAY9QyRmNs1wLikLNvEdYY/RXm83Bd3F2Mm7fI0A==
X-Received: by 2002:a50:9ee6:0:b0:5a7:464a:abf with SMTP id 4fb4d7f45d1cf-5b02317d025mr11413672a12.24.1722428637734;
        Wed, 31 Jul 2024 05:23:57 -0700 (PDT)
Message-ID: <cc92ed50-89f7-48c9-b0e1-cd61a020001c@suse.com>
Date: Wed, 31 Jul 2024 14:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 09/13] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <c2961c8b67041883ce5a5f6d0511a31dc7fbe22d.1722333634.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <c2961c8b67041883ce5a5f6d0511a31dc7fbe22d.1722333634.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 12:33, Sergiy Kibrik wrote:
> There're several places in common code, outside of arch/x86/hvm/vmx,
> where cpu_has_vmx_* get accessed without checking whether VMX supported first.
> These macros rely on global variables defined in vmx code, so when VMX support
> is disabled accesses to these variables turn into build failures.
> 
> To overcome these failures, build-time check is done before accessing global
> variables, so that DCE would remove these variables.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Acked-by: Paul Durrant <paul@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v5:
>  - change kconfig option name VMX -> INTEL_VMX
>  - do not change .c files, only modify macros in vmcs.h

Better, yet still not going far enough, as indicated earlier:

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -300,13 +300,15 @@ extern u64 vmx_ept_vpid_cap;
>  #define cpu_has_wbinvd_exiting \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
>  #define cpu_has_vmx_virtualize_apic_accesses \
> -    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
> +    (IS_ENABLED(CONFIG_INTEL_VMX) && \
> +     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)

Why does this change but the earlier cpu_has_wbinvd_exiting or ...

>  #define cpu_has_vmx_tpr_shadow \
>      (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
>  #define cpu_has_vmx_vnmi \
>      (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)

... these two (and several more elsewhere) don't?

Jan

