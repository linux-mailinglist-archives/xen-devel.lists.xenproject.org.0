Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74B818651
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656728.1025133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYGz-00068X-2w; Tue, 19 Dec 2023 11:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656728.1025133; Tue, 19 Dec 2023 11:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYGz-00066E-06; Tue, 19 Dec 2023 11:28:29 +0000
Received: by outflank-mailman (input) for mailman id 656728;
 Tue, 19 Dec 2023 11:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFYGx-000668-FI
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:28:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b953abf1-9e61-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 12:28:25 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so55603705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 03:28:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc2b2000000b0040c6b667dccsm2246433wmk.25.2023.12.19.03.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 03:28:24 -0800 (PST)
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
X-Inumbo-ID: b953abf1-9e61-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702985305; x=1703590105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4vkev5ePDjJ3sP0GYjEAbyknHJR5uF/0E3wpKOXc3o=;
        b=OThY2M+yHiyhA/XtU+YODDcrypX0LndFdWh9pkXsDiq86sEcU59tdCF/vxXfkxNAzS
         A5urt4dUnQCsnNKu60BkgkZNLvxHrBeJ/WKMHIQIHcKUaYipoNsdFXB7JgaJqlkJzG6v
         NTP/GiEfOl9hI1B0ThLbygJ7gt2BphRiqqlHQkkenEl9Yt2VSVIxr9+udGrqH17rBMcb
         CwTSKZAxw8V18GQA+k36xRwifRhp2IBKxgDtlzBXQq7fdYfB6rBM1RrLRQ8FZvAWe2dh
         EZ3ZbCMY4BFmhVpKLkno+s7QMrcKtwInjFcW9+lYOkAh5q8F2FTtKeFnXFJYnFVZKmzx
         NZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702985305; x=1703590105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4vkev5ePDjJ3sP0GYjEAbyknHJR5uF/0E3wpKOXc3o=;
        b=G8wsZq9D2hM92DQv3S8Qh4yf8hVQRlUtF0NGqUGl6Lzj9ieThRcx34o64dGsGd2zDQ
         +wkqxE1vdV4B5I0DyodBXLy961pPGDdhhEP3oPt20OIn6KcFvjsGwANPL4d4JfSKfZ9Q
         w70nOFwn9c+2x0K9qWFPBCOZmBo+emB+kS01Ot3CLiWj5KFaTo2WCGqet09s8g3U3OF0
         iEfF0VXIP3S6dnrq2o82v2N09GdAlED66UfhvPJk2ePmK/vSSOKuWejMDuDGFTIohK/U
         equakfBha1zHiG/Kw9iwUYlBvQhe4B5/pbs8sGrLLyLWto60HnLggpURh6lsMp824ZFB
         Uv6Q==
X-Gm-Message-State: AOJu0Ywk7kfiaVywut7ZiUGOtf553C9L2ExmroM/xcOQY7yvaqDU7Ak1
	7ltRiwi0t37btpRfh5TFmMMq
X-Google-Smtp-Source: AGHT+IEZc1VWB47AqbyIet+by6LHvXIvsaqMWiovOOQ7QBLajSfQj2z2Dc1g8PPcSTD45wYXhoueaA==
X-Received: by 2002:a05:600c:502a:b0:40d:2df9:cf9f with SMTP id n42-20020a05600c502a00b0040d2df9cf9fmr85058wmr.219.1702985304983;
        Tue, 19 Dec 2023 03:28:24 -0800 (PST)
Message-ID: <7dfb364e-e144-4a92-825a-71394610b931@suse.com>
Date: Tue, 19 Dec 2023 12:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen: add SAF deviation for safe cast removal
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <dff9e788e04aa04970cfbb70d09f4d1baf725506.1702982442.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <dff9e788e04aa04970cfbb70d09f4d1baf725506.1702982442.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 12:05, Simone Ballarin wrote:
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -109,6 +109,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>  
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>  {
> +    /* SAF-3-safe COPY_to_guest doesn't modify from */
>      return copy_guest((void *)from, (vaddr_t)to, len,
>                        GVA_INFO(current), COPY_to_guest | COPY_linear);
>  }
> @@ -116,6 +117,7 @@ unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>  unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>                                               unsigned int len)
>  {
> +    /* SAF-3-safe COPY_to_guest doesn't modify from */
>      return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>                        COPY_to_guest | COPY_flush_dcache | COPY_linear);
>  }

Unlike below for x86, here in both cases the comment cover more than
just the one function argument they are intended to cover. I think we
want to limit the scope of such comments as much as possible (and
hence have as little as possible on the immediately following line).

Jan

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3413,7 +3413,8 @@ static enum hvm_translation_result __hvm_copy(
>  enum hvm_translation_result hvm_copy_to_guest_phys(
>      paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
>  {
> -    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
> +    /* SAF-3-safe HVMCOPY_to_guest doesn't modify buf */
> +    return __hvm_copy((void *)buf,
>                        paddr, size, v,
>                        HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
>  }
> @@ -3429,7 +3430,8 @@ enum hvm_translation_result hvm_copy_to_guest_linear(
>      unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
>      pagefault_info_t *pfinfo)
>  {
> -    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
> +    /* SAF-3-safe HVMCOPY_to_guest doesn't modify buf */
> +    return __hvm_copy((void *)buf,
>                        addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
>                        PFEC_page_present | PFEC_write_access | pfec, pfinfo);
>  }


