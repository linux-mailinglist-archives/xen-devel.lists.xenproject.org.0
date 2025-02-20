Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F4A3D308
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893597.1302467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1pU-00032E-Iw; Thu, 20 Feb 2025 08:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893597.1302467; Thu, 20 Feb 2025 08:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1pU-000304-Ft; Thu, 20 Feb 2025 08:22:44 +0000
Received: by outflank-mailman (input) for mailman id 893597;
 Thu, 20 Feb 2025 08:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl1pS-0002zf-Vm
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:22:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da55c820-ef63-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 09:22:41 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e04f2b1685so947707a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 00:22:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9bc1c667sm728742566b.131.2025.02.20.00.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 00:22:41 -0800 (PST)
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
X-Inumbo-ID: da55c820-ef63-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740039761; x=1740644561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fysTGy9a1x7nJr5pHJVQI9i2RjY5JgZjV5r3+UQUJvQ=;
        b=WK0O8YufAyopNgqfxzzhfSpsG2/mUtHn2f/AjQWebt/PeuMOumWSCZpYkK92FUpiNE
         L2eNAqVy5KRRqJm5ZktL1TVO14zscD7s7vhd8DYsxieNE7E9mWM0KVIgmxdV5f0i3ajD
         27bz00uJTzKhOv5Fy4mOhisC2jvo9cOug+Dio+eInrWwfdrOmjsBMxpTKgC9i5Tvmtg3
         hzz5LThWxgJ1ZidcK7HYba61+kiPgXzBI1af3Rm8k/jVvS6VOQ3KXKDvM2UuePjBPTkW
         hSlU34vjvz9gk920h7B9nnjoGsZwfyPNXdCSOzAxUA+Xy/qDcQpZMMFsqbxHj43ZC/2e
         Vv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740039761; x=1740644561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fysTGy9a1x7nJr5pHJVQI9i2RjY5JgZjV5r3+UQUJvQ=;
        b=tCJV1r3GkViAWSfyjxfm8nSZ9PcWkqDVfdltHyuYT90Ev9BK8kfrAYtH2aatVp/o/e
         XRxoKVFYcXs7pGm4riPiZTnzbpMBPbLdX8nBmo5AcJPz/SNiHuv9wRDbXkhOvVFwDbrB
         E5BKY3hSFEJlt8c7x0MJ+aNT0k51Enu7LIrLu54FunNUqHdz5+1Fz+1Q1FrPVG25hQ3k
         GatoNG2MLbgyAHQ4xu6Je10DakwS68aRQKsQfVqtheHbmm0zLfbcIgRIynCM1STZtyCd
         Apk9myqgzmvu+YuBT7zZ4EqJfJ5XLs0GyxEinvOs9Y9YpS1HL1Al3kvOPF48qpQ/Q8hi
         oNqg==
X-Forwarded-Encrypted: i=1; AJvYcCWbq9ACN3zoAuc63R3Qp9D9UgYlZOK3V328+SDz8x0xUg+jVLKtJfKos5dKTRS5lNEPkWFksH8jPbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlUTBdaaR697BmL0SJ4NjMSEIHcFy2tj2HqVzZNp5/sGxxCudD
	lmRqeb4y4fXpblSJHuKr6o8thIMcG9ibkYLMNUwJKgJm4XqbMY8G0W8a6FYVhg==
X-Gm-Gg: ASbGncuWRSTFAc0YH5kI/uzdMtDI3dwNYGpSWi3+PwJCevu8Cfp1XgM7ZmuIKe/rz/j
	lrQ9AsA8hugXUzRUJ8cW5mkECk3pCE+XoaQHrYb4o3B32x1ZjayrY4GvmT/U6j726g6ymamJdAt
	CLdG8b17GOheohnbiZ0cK2NNFOACT5GnLOX6z6l2TGaNNrhMJ3Z4ccemyRFQ4B7QQ0SZhNWU59L
	k3GjaqS6FZ5/Et+0mhxHIrUdZ11bCyKpEzgssbc+QNHS0XDY//s+G2Ab6UjXq2HYSIUBOtvGkRW
	etPWYm/oqMMYHbPwlFlSbv88uWFkguNxrmt0uYXEkZFrH1ZltlCLNSQsKJrUAkYYOdkYl0QEqgr
	S
X-Google-Smtp-Source: AGHT+IFxdKOdnlPbl4eIF45kBlGoLvrEZTfxs6GRORpkyRQnTd+TcmP3Y+T5K5fa/62jrhjgYPw/aw==
X-Received: by 2002:a05:6402:254a:b0:5de:b438:1fdb with SMTP id 4fb4d7f45d1cf-5e036174763mr50124806a12.30.1740039761391;
        Thu, 20 Feb 2025 00:22:41 -0800 (PST)
Message-ID: <6b0eb8ba-f42c-4a24-9dbd-3e6f78b818c1@suse.com>
Date: Thu, 20 Feb 2025 09:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/dom0: correctly set the maximum ->iomem_caps
 bound for PVH
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-2-roger.pau@citrix.com>
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
In-Reply-To: <20250219164840.94803-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 17:48, Roger Pau Monne wrote:
> The logic in dom0_setup_permissions() sets the maximum bound in
> ->iomem_caps unconditionally using paddr_bits, which is not correct for HVM
> based domains.  Instead use domain_max_paddr_bits() to get the correct
> maximum paddr bits for each possible domain type.
> 
> Switch to using PFN_DOWN() instead of PAGE_SHIFT, as that's shorter.
> 
> Fixes: 53de839fb409 ('x86: constrain MFN range Dom0 may access')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The fixes tag might be dubious, IIRC at that time we had PVHv1 dom0, which
> would likely also need such adjustment, but not the current PVHv2.

Probably better to omit it then. It would be one of the changes moving to
PVHv2 that missed making the adjustment.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -481,7 +481,8 @@ int __init dom0_setup_permissions(struct domain *d)
>  
>      /* The hardware domain is initially permitted full I/O capabilities. */
>      rc = ioports_permit_access(d, 0, 0xFFFF);
> -    rc |= iomem_permit_access(d, 0UL, (1UL << (paddr_bits - PAGE_SHIFT)) - 1);
> +    rc |= iomem_permit_access(d, 0UL,
> +                              PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);

Why PFN_DOWN() rather than subtracting PAGE_SHIFT? That's two shifts rather
than just one. Personally I'd prefer if we continued using the subtraction,
but either way:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

