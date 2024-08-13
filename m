Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BDA94FE93
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776003.1186156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlpV-0007ev-22; Tue, 13 Aug 2024 07:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776003.1186156; Tue, 13 Aug 2024 07:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlpU-0007bl-VI; Tue, 13 Aug 2024 07:20:28 +0000
Received: by outflank-mailman (input) for mailman id 776003;
 Tue, 13 Aug 2024 07:20:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdlpU-0007bf-5q
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:20:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82f3ef34-5944-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 09:20:26 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so9022968e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:20:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fb0692sm44737766b.76.2024.08.13.00.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:20:24 -0700 (PDT)
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
X-Inumbo-ID: 82f3ef34-5944-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723533625; x=1724138425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvjhYcFx2EC+2Kc5gul4JEuzdc6rcRyxzA6o+cUaad8=;
        b=TjNhFY1SEt3iyQsW6/+R+vKGr3sw0h2LruzR5CKTZi/F2CmuX0znkpuB3/raQ9OTTF
         /rRDQTpQBpt9Cqy3pjPTrCbX2+MQghSIsKr5UO+S5/lukqL89i7pDpr5ysqBgR7gFtDo
         tR+tY1bIN24z8LW2NEd14uNuTpNN4W6babgwnYEb9NAsD9J/nqrbJ0YV+n0azxXFZj+3
         AYl1LitO/XpY2ShCpMMpxf1N7Zc9LNYNu5de8d9z2GiX17NJdWvOaIn/0lBgf4YrRNYa
         n2FI3gK5R1GOVIYeNCH6ruBp6SnLnJ+O/yIj07kwNJgpGlXEcLD7/89144cwbrWl7T+w
         FMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723533625; x=1724138425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvjhYcFx2EC+2Kc5gul4JEuzdc6rcRyxzA6o+cUaad8=;
        b=fMAJCaUWzKRb9mQYYFkEMYOQ9K5aFqdUlOamvglAKeX0dpCOCIMA1zBE7lasEF5Go1
         BPk+V63tXoyT1cJU3ZdM73czkGaaY/NXQAKYWv/B8Ok5gG64E2P2noDcsV2aFIfD86KU
         vQq3uJG1bv5oSFuRjXv1i8I5K4jN0mtVl/0xVwq4WLGb518UVm3esM4/MpowoqhywUSR
         NriKlFkeTt0yBpt6RfWQKB3wViFU9WxQf3oCKEHXH+pip+fRnf1Onz/xGIjborsoVtKk
         epJr59EIoZMLeJlJfkzQe0RkebdLQO2Ha7zXKLsBufedE85t1P9NxT/VEE6npSF6U8Ro
         6j5A==
X-Forwarded-Encrypted: i=1; AJvYcCUJJizphboKUtcuyfEnhHcpiLUmq5mnxHN70wrCt+rz9dqtxRl75MIAPE3dtxtmhCb8KHLRqfG2SrcmDkTBE8+JMKqJd1XuNIYvrD7JSzc=
X-Gm-Message-State: AOJu0YxJmlYVuOAqjntX85Sc29IuzGTCGXLEYTZPD2ypBYQDSORPwdaP
	BIg4sVlUEotyk5LxuYP/zgjdjMAXJXMq9GU2vKBrBWLDvCvjMK1V01hfsYORtw==
X-Google-Smtp-Source: AGHT+IFGZ2kT+65QVQSLPNYWh342bovHTyn7P+R+YGqoXEpgSnn48jjsdgR4jstmxYKpxz/fS0PNIQ==
X-Received: by 2002:a05:6512:687:b0:52e:716a:1898 with SMTP id 2adb3069b0e04-5321369aaf5mr2053975e87.58.1723533625310;
        Tue, 13 Aug 2024 00:20:25 -0700 (PDT)
Message-ID: <771870c8-375c-41be-91fd-998dad4befb5@suse.com>
Date: Tue, 13 Aug 2024 09:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 1/3] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
 <6486b627fd3bdcca3ad877ed6c97ca5cbc51d8e3.1723110344.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <6486b627fd3bdcca3ad877ed6c97ca5cbc51d8e3.1723110344.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 12:08, Sergiy Kibrik wrote:
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

I can accept this is being kind of complete, so
Acked-by: Jan Beulich <jbeulich@suse.com>
Howver, ...

> ---
> changes in v6:
>  - guard all of cpu_has_vmx_* macros

... this clearly isn't the case. For one ...
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -298,69 +298,99 @@ extern u64 vmx_ept_vpid_cap;
>  #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
>  
>  #define cpu_has_wbinvd_exiting \
> -    (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
> +    (IS_ENABLED(CONFIG_INTEL_VMX) && \
> +     vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)

... a few lines up from here there is cpu_has_vmx_virt_spec_ctrl. And
there are quite a few more in vmx.h (don't ask me why things are split
like this). Yet on the grounds that at least this one block of code
now is consistent, I think we can leave further adjustments to possible
later commits.

Jan

