Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667839B445D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827138.1241652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hlz-0001hK-DE; Tue, 29 Oct 2024 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827138.1241652; Tue, 29 Oct 2024 08:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hlz-0001fe-A5; Tue, 29 Oct 2024 08:40:19 +0000
Received: by outflank-mailman (input) for mailman id 827138;
 Tue, 29 Oct 2024 08:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hly-0001fY-Cm
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:40:18 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf16507-95d1-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:40:16 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so3748409f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:40:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b4e56csm11826601f8f.65.2024.10.29.01.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:40:15 -0700 (PDT)
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
X-Inumbo-ID: 6bf16507-95d1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730191216; x=1730796016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4+/nB4++t8erPsvFNoKBMfb5w/YZzJT/xvPwD0vjYYU=;
        b=DFdLZ+Qfjhl0S6A88oRbr5kIqRo8RfqQeFNBzMdtvhkj23OUksNe/sTvKey2WfAMZd
         P7xDopyKLyucHgO0zuOA/5qsMa9D0sfHB0ZG8oIXK0DiIySWSAutChmhNBiJaypX/HBp
         Mi96BGsAUCm31MgVoFkj3LduWLiiR/S0M/mIjuDGfAoll5yr8NGhw/V9h3zJbEjrZ3bk
         x2cttfGMpoYrLBxac3d9/6+3ZvKKYA6g6Hr9npJAPsh5wVJIuPSoVc8eyJ/eInSmNGqY
         h3pS+Vl0hvBK31S4ADfSIp21KlpRLZa2bjUOgQTkpSzS5rVEu4KikTppkXUIO9xYn7DR
         OwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191216; x=1730796016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+/nB4++t8erPsvFNoKBMfb5w/YZzJT/xvPwD0vjYYU=;
        b=wyg0UkcCz+ojn0/Hah8ZT1Mm/CCLbsvBjBkfeg9h/mkTO0rIk+XnImGF7NctT/plNC
         gfadYGSV2ba/YsEuCYrQKmLZ9Pq7xVno7wyW8yHlwGTXPn9ptM3Az/yZwZpnbCTuVeFF
         I0wB0F5DZjCP/Y9eih75deInlD6B9td8Ca5HQdPk3jlWOjwVZ0fpfsLpwWqz+wpnCrmW
         xMKsnaHVp5lcdk4vcRdod1oJDtcqzHStuee5jzbcrEoieoLZ9TC3kgDjpSn21G9U5MNE
         vGgrbV7bLl5aKg3+Id29QwvXFYrlXhnMANF2BvfRZ7vjODYR3sz5zS9eVfZJAPIzpGFi
         mu7A==
X-Forwarded-Encrypted: i=1; AJvYcCUb6EasNNoaw1UAa5kPsuK7uCY9g4toe3eWvdLqXpt3Efryp0r9iYLWGCNEOcGOL+IFyUa/7TK8NLs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXnM//LFk/JsDFJe15ZdoStQKDtXJk0Ho1meIoEwVtRYm5nAs4
	ClNWucfiAcDDk5QM7HrAdeNNN5A5I4MwD6T/1fskWy8Cp+0vSAcaWlU1LLOZ/w==
X-Google-Smtp-Source: AGHT+IE+kqCWxcudYz4QAS9hmxCQbeVhyIXFVtsl2/0hCjF25WHQ6pBXlepPazg8wnD+cbc3mOEKxw==
X-Received: by 2002:a5d:4f92:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-380611dc6e9mr8333811f8f.40.1730191215923;
        Tue, 29 Oct 2024 01:40:15 -0700 (PDT)
Message-ID: <fd9f55a2-4e47-478d-9f52-a3cd9edacac2@suse.com>
Date: Tue, 29 Oct 2024 09:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xrstor()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-14-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-14-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -374,11 +374,10 @@ void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
>          ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
>  }
>  
> -void xrstor(struct vcpu *v, uint64_t mask)
> +void xrstor(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
>  {
>      uint32_t hmask = mask >> 32;
>      uint32_t lmask = mask;
> -    struct xsave_struct *ptr = v->arch.xsave_area;
>      unsigned int faults, prev_faults;

Same remark here as on the previous patch as to constification of v.

Jan

