Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B28C73F7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722946.1127352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xa3-0002gK-O3; Thu, 16 May 2024 09:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722946.1127352; Thu, 16 May 2024 09:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xa3-0002dL-KW; Thu, 16 May 2024 09:39:19 +0000
Received: by outflank-mailman (input) for mailman id 722946;
 Thu, 16 May 2024 09:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Xa1-0002dF-T7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:39:17 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29388c6a-1368-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 11:39:16 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so277307466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cd7asm972793666b.10.2024.05.16.02.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:39:15 -0700 (PDT)
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
X-Inumbo-ID: 29388c6a-1368-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715852355; x=1716457155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUx+ikfbzMlTBtMQjf1KJcraRogTi1XwyFjuggwj9xY=;
        b=g1LYsC5sKiAS975IdxQRfQatRaNcMgbxelC1/+mg+WtDzeEqaQVoREx16aySR7SYk6
         Qq0CuNI6BO78jiRGEV4bJMrVk/pLTV07kP7lQ+o2F0lTNuwy1xS5k9I1FaIqg7zuTNYI
         gVocE6ew6a+0dEd72wG3+SzmwyHuAPBbDrdjCV1wt0FA3YLKRoc8Z901bAOw7AzsDlhL
         TQUU7DhXTfiWt4xHPL1DRem+02iyD2hyzclSqgHnN5bDld2SxH+Z/8g3DoDA+JG3ZVbZ
         hIA7r0oRW/9EUGgzeRqaoqib/z7IvZd4Bth7rce1rBMBKOjQavLmKaxYC+ISrbt7tLYQ
         V+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715852355; x=1716457155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUx+ikfbzMlTBtMQjf1KJcraRogTi1XwyFjuggwj9xY=;
        b=JAyfu2SurwyK4h5wzGa99vwKbqgjaMAaytZWRfGulU3Q8g7siElNx2WwIf47j/CcSg
         wMpsRIWiFjaAdekk0LZv8NqCRT4zrqs4FK6pOKNZ4Kgj3yCKsIJITvtCXIrRMu8c2JKW
         sClFGtxOfNQjsr2lwgegMnPFachUE/7Sx7B6iSoMlDuKYKZQ7EicYSVTOHuh7kBJ8S1/
         oj7Cdz8BqhnoT5si/34zAcEZbHwd6uXdjS3JtSSUiGPa84nBL9uJdtGvKlISkYVGr+c+
         GQp3tAmqtDSBA2iHpUsLwpBiX6V/Dcpnhju4x+h8QzbwSOl1dJ/f3e6g6nHNqs2xcDpi
         4lZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlMb/lsuPr8V+QK52VXOwRRoCQfgAjzyqEhqKqNxTIKUNcZtqrMdgcWPiK0SZyPeW7P9D7aA0QUTnrcF5QUuWKMOuuQ7J9sxYHXh9sjlI=
X-Gm-Message-State: AOJu0Yw30z+Rheln3W+zLSz3tRnLr7s7g22VgwMrTUrLDSAoHdOKCpxi
	qIrZFmqQ86O5ZsfhSFVaAmEr8aWF1mEv2m2JjkK6BW2BseGnO78mRqSTA4Tiow==
X-Google-Smtp-Source: AGHT+IE0hBWNFw6r3ZpPo8koa8LM790YzWePh8QsCap2vy3StnrXZQhFtOW554SowyxUbjOB4tV6pA==
X-Received: by 2002:a17:907:3601:b0:a55:9195:362c with SMTP id a640c23a62f3a-a5a2d66a3ffmr1404933866b.49.1715852355676;
        Thu, 16 May 2024 02:39:15 -0700 (PDT)
Message-ID: <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
Date: Thu, 16 May 2024 11:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/6] x86/intel: move vmce_has_lmce() routine to
 header
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 10:20, Sergiy Kibrik wrote:
> Moving this function out of mce_intel.c would make it possible to disable
> build of Intel MCE code later on, because the function gets called from
> common x86 code.

Why "would"? "Will" or "is going to" would seem more to the point to me.
But anyway.

> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -170,6 +170,11 @@ static inline int mce_bank_msr(const struct vcpu *v, uint32_t msr)
>      return 0;
>  }
>  
> +static inline bool vmce_has_lmce(const struct vcpu *v)
> +{
> +    return v->arch.vmce.mcg_cap & MCG_LMCE_P;
> +}

Is there a particular reason this is placed here, rather than ...

> --- a/xen/arch/x86/include/asm/mce.h
> +++ b/xen/arch/x86/include/asm/mce.h
> @@ -41,7 +41,6 @@ extern void vmce_init_vcpu(struct vcpu *v);
>  extern int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt);
>  extern int vmce_wrmsr(uint32_t msr, uint64_t val);
>  extern int vmce_rdmsr(uint32_t msr, uint64_t *val);
> -extern bool vmce_has_lmce(const struct vcpu *v);
>  extern int vmce_enable_mca_cap(struct domain *d, uint64_t cap);

... in the file the declaration was in, thus avoiding ...

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -24,6 +24,8 @@
>  
>  #include <public/hvm/params.h>
>  
> +#include "cpu/mcheck/mce.h"

... the need for such a non-standard, cross-directory #include?

Jan

