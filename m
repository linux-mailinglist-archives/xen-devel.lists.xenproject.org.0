Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB4C56F46
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160944.1488983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUoC-00024E-5u; Thu, 13 Nov 2025 10:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160944.1488983; Thu, 13 Nov 2025 10:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUoC-00021W-2n; Thu, 13 Nov 2025 10:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1160944;
 Thu, 13 Nov 2025 10:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJUoB-00021Q-0z
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:44:07 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acad15ee-c07d-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:44:05 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so63485066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:44:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8da2sm133547566b.55.2025.11.13.02.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:44:04 -0800 (PST)
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
X-Inumbo-ID: acad15ee-c07d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763030644; x=1763635444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JImBlaVHtIbdMKfPNgP2nMGlhSt+jCNCdhLCnCDqYec=;
        b=F99u2VYEX4ZypybP2Yl8i2r0Fh/535MAm8Hrj7Gf7gABQYmLPjPa5cSam/GykKOQSU
         mTl4syVFOxEwz8x0jWJecdb63iYTorRVN9q6dxJNuy3StnlPiPVkH4jMQq5COy6Wcmae
         JXafNCaucGzc3TSDmrM2tsiFLUJJckrQ1Il+iScxbx2ell3YQ5pCG9cCNn56r42xoQWw
         6kA9OQoYQ0xtKTrUjYPFi7s1zOIg8XF1rMf6+0uhBrF5oDmjZrP9VrLmKLj/CC3Eq3et
         OfQSgAFRofFbbyezRb4UH9kFv6oufcADXr5ebMCY5eROPkdOwdacKg33JVx8MjY6Gd08
         KBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030644; x=1763635444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JImBlaVHtIbdMKfPNgP2nMGlhSt+jCNCdhLCnCDqYec=;
        b=Hyp4aP6ZdrpSCnct9xxWS2Niq1/yqS7o/mkBlJpnwmgVzFnSCdqGTYFFfC27EElNjH
         m1cbcAqlWGCTFLbq+LOwmmmF/AnyH8cPIe4bI009YjF1AqZM8obLhSh9o86AMuncUVW+
         1cXz1yhCLW4HNxM+UPJvGM5UgOivXCkfibz8G5G3NQqxhhwfpUe/IuIWkV1dh5x9Udh5
         29T5fYiRI+tB3G1JYt2jDo/6HVdoeC+3NOQUe7HOcN7VAPUUSj2voe30uxNLX0gop0PG
         WM0yWV1tiVRwABITPeRUYbyeVI/OBzBJApjXQGo9Be/uBO2aTfdSSk1zLSR5Uwjcyl+c
         Ooiw==
X-Forwarded-Encrypted: i=1; AJvYcCWnD3EFwem3xryxAzdl5cUiRNsEhqsxP63jaRXiZh4u6Qz5QzrNcCSTnrXZeoiQhzI1INGjw4VCJCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOtdaDCW4mWu1CmiqD4YE1QMfYRw3QCGoRaiydWvih04vOpwl/
	xL/5D44GQJCUJ8zBONpFSJh48CbT4sE93i3swDIUcegrOwEws6/u9MGcLs4gj9+txg==
X-Gm-Gg: ASbGnctHAqJkSmR47w3MdN2OvUK++62XcZ0QHZDnjZxySseYZClsVjS8vY//xT/uFc0
	17yjtiUmmxqAXRAuZWZi8BEDfWTF9C4J3UtkwfTTDCP9ejV8k8cLKxs4kbE+JM259FZ/DFOg8bx
	hYFE1Z+cvSizBJglyp+Uav3w0OBYFo3I5Ke2QUuNKoBH6HeL51FUC3W6xC3KtEAtm0DczVvaaQ5
	y8z0hCdnmeW9omXNrozOcBfMSwidquKuXUqreMMm5VP9Vn5wDy+baX7g03n24iGm2l1KzHwm3N3
	t6xCbue4mLuuQi956tF8JQuUB20TAlIMVg/CClyyaN/wz0H1+pz9hZZBU1HXAXCvWQbr6S/NQS/
	6xyfx7zEEYpG9y/FLsa6COKM7FLwK28oxS/DN8OmRYZdJLcVqMTTgxIJLDkt0othGSl5U9YUX4G
	6kzY8/wST7KHgtMXVwYjG7I7Y6jtRO3I2oCcXcvN7cJTq0Lrwxws5Ey6HJOLblyOmF
X-Google-Smtp-Source: AGHT+IFmhnr5BLkO44xAA+T0S96KFYNdA6bY+1/A9MTOSoeX4pbKNNUXQlTIUwVLWhrRtsLebmM92Q==
X-Received: by 2002:a17:907:3e12:b0:b70:af3d:e97b with SMTP id a640c23a62f3a-b7331997c12mr732607966b.17.1763030644453;
        Thu, 13 Nov 2025 02:44:04 -0800 (PST)
Message-ID: <25ec2731-e629-4cc7-b374-5e48fba4c814@suse.com>
Date: Thu, 13 Nov 2025 11:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
 <20251111200958.3576341-2-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111200958.3576341-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 21:10, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Functions:
>  hvm_shadow_handle_cd()
>  hvm_set_uc_mode()
>  domain_exit_uc_mode()
> are used only by Intel VMX code, so move them to VMX code.
> 
> While here:
> - minor format change in domain_exit_uc_mode()
> - s/(0/1)/(false/true) for bool types
> - use "struct domain *" as parameter in hvm_set_uc_mode()
> - use "struct domain *d" as local var in hvm_shadow_handle_cd()

One more please:

> @@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>      return 1;
>  }
>  
> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
> +static bool domain_exit_uc_mode(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct vcpu *vs;

const on all three pointer target types. Then, together with the function
prefix adjustment discussed on the other sub-thread,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

