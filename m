Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C080BC15A9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 14:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138736.1474358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66hf-0007h1-7k; Tue, 07 Oct 2025 12:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138736.1474358; Tue, 07 Oct 2025 12:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66hf-0007fS-50; Tue, 07 Oct 2025 12:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1138736;
 Tue, 07 Oct 2025 12:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v66hc-0007fM-Tr
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 12:22:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38633656-a378-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 14:21:58 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63963066fb0so7824973a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 05:21:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63781c46688sm12307893a12.22.2025.10.07.05.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 05:21:57 -0700 (PDT)
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
X-Inumbo-ID: 38633656-a378-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759839718; x=1760444518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oE0b5Ni+AgqgirLdRaI+08rZqu+5uSZasCNd3jI3GJw=;
        b=e4GwGXPFKFt/8PYS5Zoih0Dp9LL7hXKVFy1mOmYb7D3xE0AZZoAdWHvZzv6IDs0ixK
         l4tD8YD6JtpStCyyfr9G0K3eRaCa3xV6enBPqutlUcbXmB0DkvTdZo6tGO8OKF2n9V8B
         oCBa8QN4bVv2efWIjxmA73DAKhbbu3Wj5yVpcz+jaLDYwH04h3JC5jU2Hs1HAzdZZn++
         DhfShgzjO4qR9B1QiM4oMf/aXuQADWkyyZAdbe4U8scbpJdhPvO850LWFMA5fM3fYLj6
         3M40ysp68Y8I03zPiWI8Z6GGMQcJlVHp+sNppegrb6NjewCDLU4f5in+N4uLtcjt0cny
         WsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839718; x=1760444518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE0b5Ni+AgqgirLdRaI+08rZqu+5uSZasCNd3jI3GJw=;
        b=IuqtEdFlChD4ds9ahmAP3TzXIGDrrT/20QKFG6+gar72vUteJr/Eg+56vb23D8jymw
         kcLGZeDZV6Cj7pCz3jxyu0m/G1+PGDksCJjj8doVwGoPTn8BGG8p+iJghvgf5rdUAZys
         oJy8iLFWhYR9nerwYSyDfISmehXVCGmdlP8Va65vW9L+jXa8ZbvYlI2cXbj+0cjujU3n
         jlbrnWNcKlA4nOFSVCdiBqRK8R+j3nt2PtrRnvmfnddbb+K/qYHvHYbGJAR47OkAzoL5
         MzdYniFKMoAiUMuOwQo9QalFkniDwOin+BEVoxLJ12k9rpVnaC1OalzoksVy5MRVY4O/
         wNpA==
X-Forwarded-Encrypted: i=1; AJvYcCUhXXk1Ul+Ebw55TV6XZeRgBCREZlk1ZghDQdFbM4MHCPc+XUWvczPm+dlSLm+TnfGfhRzqtYRutrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLcVEIgSm6GmWg5KbzzK1Caq8yL++8fEq2VM4EWVHhCJU2VI8c
	4lQGspskJ4DufmNPdF7Xy6iXSfBRrAC1dZSHxVcnX5tc6RDVHg+Kq/nZDdHy8l/TWQ==
X-Gm-Gg: ASbGncuCNWJqponPxT0lv6CeeM7SOtpesBALlPLsqpfPqaYStuqLVPHK/fJXMt2OzkX
	pd4i86uCYsGLu3P8wSeATJe64zzjPYflpiyr1NvdsmtH/e7t4PvOxfbNRLaEh/6FIDBs0IMTBeN
	yDavK9UK9rtuzK9Z9CYuN81mBdm9oFNyWyGyt8uflxOVpDmYFYtGukc77MnY/8kYmLwn4tT7PTN
	U0CQBeZMK/VdUrEQj+477BlG1fUKaiRkJRVH/AwEyrR/nQ7bsaAVwuwMU6ltYvGEqHeYWuIr7Ys
	gTpSye3IhWO7xTTWM8SOiNe93Tm6Jaqq760qzyVsjenLj3faBDni1mZXbuFEfdNlrIDBiKWfX7k
	w/ZLpeihLwrTV8nwmaRbO7QSkHG2d6qJn2ohljHo4pL1OXF1Una1+V/thfSOKi9j8EwOWjiFlXY
	4k5Bx9c7RY7SxyvjN/E0VK5USUDmP8d/w=
X-Google-Smtp-Source: AGHT+IGLRgOMwq0WQSFIw0XFDy7qMp7N15Q0CpbftpDs+9GfDDEgQv6IKDO2jSv3JNn/2cwF5WO2Uw==
X-Received: by 2002:a05:6402:50c8:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-63939c3d2d3mr16324411a12.33.1759839718150;
        Tue, 07 Oct 2025 05:21:58 -0700 (PDT)
Message-ID: <c9d04edf-4801-46c7-ae6d-8479ef985972@suse.com>
Date: Tue, 7 Oct 2025 14:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
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
In-Reply-To: <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2025 01:36, Jason Andryuk wrote:
> On 2025-09-25 06:48, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>   
>>       /* (ab)use alternative_input() to specify clobbers. */
>>       alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>> -                      : "rax", "rcx");
>> +                      "i" (0) : "rax", "rcx");
> 
> "i" (0) is to work around the trailing comma in alternative_input() and 
> does nothing?

Yes. If more such "uses" appeared, we may want to introduce some kind of
abstraction.

Jan

