Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E3996F88
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814811.1228492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYW1-0006hx-0b; Wed, 09 Oct 2024 15:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814811.1228492; Wed, 09 Oct 2024 15:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYW0-0006e8-Rk; Wed, 09 Oct 2024 15:22:16 +0000
Received: by outflank-mailman (input) for mailman id 814811;
 Wed, 09 Oct 2024 15:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYVy-0006cn-LA
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:22:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 421d99ec-8652-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:22:12 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a99422c796eso644318766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:22:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9939e593f6sm627991266b.91.2024.10.09.08.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:22:11 -0700 (PDT)
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
X-Inumbo-ID: 421d99ec-8652-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728487332; x=1729092132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B0+GrzAztnrHSkXGnEdT/8/V/HpeD8meNPWQhJ1zyN4=;
        b=eFOjFLzR420QUdU1BKhBWS+q23LD3rR0maGL+gjPgvOlGK8U+VBlSwUeycSYInpZ/M
         iLuRSValgcKiWvsLvnxizOk4o9dXWaY8nuPUeOIr6rWgIytT+8x7wN9v4TVvoTYF3DZk
         i9c01gnVekovIBYbkVvwRGXLNSspZjNczYpQ3ayRNDC7997KG96joUmMsJphu5fcg9Ne
         I77cwsjmw/5UZ6JXRfMRaBhRa4KRTItOtHuTnKYz7h5oyIHslXD2YQOzi+95/rmrYRgf
         fWB5VGjD8wvWDUfupJCT2UtPZ9ySSZopl6rSkFCKUE5STLWW0h8WeMdBWFJnerHPIWeK
         a/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728487332; x=1729092132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0+GrzAztnrHSkXGnEdT/8/V/HpeD8meNPWQhJ1zyN4=;
        b=pWIn/ajtXYPlRgxsf1S99eRVhrvVDXYLDTnBCn7xGB5g067egaSdO5oaDvfDClcg0k
         v0+l5rx5LQzsZBQ0/W305v6ONZBZTmieOyG+lahK6m+2vUzQffmW253Eh+9tcYBn+7YV
         0PbyC1FJOiJQoTr9rGOGtR/1PmnOwSBASI2g4mPWxDI0u/qHFQovs9yktolaSrymd5jG
         dOHK8RknTcCQAzIpovUaNqnacoWdvge92VY0LFFsE1sr+UYP7a0QRyF9X3kPPb0KJy6r
         vAPseqAOBPjrK4A7cFfsCEPTHgRojTnXwPpEVpz20juyxjHWKapKgFjwhfelbwOFaOMY
         K1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUDPxXd0YL0A7+mg3ATZ/lJmXAk2nmjA7iMIC1tXK/s8PcoCf5Jdfp2ATFoGl+UdKGkXg/+pVXPf6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM++rso5VuXw1DfpZx2ay641+OmxObnsaGIIzI/FXshMps4Vq/
	mAdtanBD1SIqDNOSzSs4lA+9uMlNwHK77FsleEQU8pr2h3t7FGEriBXK0KAs2w==
X-Google-Smtp-Source: AGHT+IFvw/Kw2cTbIqUW3y4Ob1Fwm4Fk+U/nkrn2yQFBCrOv6PYqjAiPRnP7vdaK7mB4ET0VsTNlig==
X-Received: by 2002:a17:907:7204:b0:a99:4f5f:c9aa with SMTP id a640c23a62f3a-a999e8cb947mr45602366b.50.1728487332210;
        Wed, 09 Oct 2024 08:22:12 -0700 (PDT)
Message-ID: <aa040161-b7f6-4520-b3b7-55d7e8ee867f@suse.com>
Date: Wed, 9 Oct 2024 17:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/44] x86/boot: convert consider_modules to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-7-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> @@ -639,20 +639,20 @@ static uint64_t __init consider_modules(
>  
>      for ( i = 0; i < nr_mods ; ++i )
>      {
> -        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
> -        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
> +        uint64_t start = (uint64_t)pfn_to_paddr(mods[i].mod->mod_start);

With the switch to pfn_to_paddr() the cast isn't needed anymore.

Jan

