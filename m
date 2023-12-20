Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D3819E6A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657727.1026775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv3h-0008GY-Jm; Wed, 20 Dec 2023 11:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657727.1026775; Wed, 20 Dec 2023 11:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv3h-0008Dj-GG; Wed, 20 Dec 2023 11:48:17 +0000
Received: by outflank-mailman (input) for mailman id 657727;
 Wed, 20 Dec 2023 11:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFv3g-0008Dd-9A
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:48:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8f6d805-9f2d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:48:15 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1268867f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:48:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfe4d0000000b0033672cfca96sm4028529wrm.89.2023.12.20.03.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:48:14 -0800 (PST)
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
X-Inumbo-ID: a8f6d805-9f2d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703072895; x=1703677695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLs4UbTIIcuMMSSsC1n2hJNQp8t7X0M+7asw5mv30xU=;
        b=V0WByl6Cz26DHBxYv6xVVWBYxwjbFzF/3K7i4kwi5AezFmBLBaNsK8op3Uf7WjASBi
         RTRwqXV0QQIYpW/rC8K4gP6GiElRFCEvNt0jB72zNCaxdi9rvit+jlVTNj6i3NAnjs8P
         0R/MoPG0x44Ud6ZEMEK+rwlPnet2TdmoQaiyZmmD36XeLQ/CXsQWn0xNuH6dumgUSrux
         ixtjukZvTquAjB4qRWu80acEbdKJxPc1uaH44uIsfLUaNGgawfY9CKOoFqG8cBjwQbk2
         kA58uAvDXVvS+Ek4p5vudpJTVlwXdkEesa5vSBHvdkoUMwz9AjLm2ElLcCGeBZjVm38K
         Q53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703072895; x=1703677695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLs4UbTIIcuMMSSsC1n2hJNQp8t7X0M+7asw5mv30xU=;
        b=avI+MX0WWkSTE7xocmbwmjlvKL4SgR6bOZgatzV6S1ReC87XXzBxOLJ0vDI2WiHoJb
         qJtWzHc51vaQshzzMS1E0ZwdB8NDyoLz9Piu1TrhsGQ4HfoQStBenZZ1Y92M2mVrgc6l
         RCaPwVmFRit4i0xyKM4cE4ZZ1ROnKt2VYFrZAKv7NWbbxmOirqM6avhsL7YawpSqSws4
         m+xNPZpZRg4z5wLkmnvo84ZFQDEzsgkhqEE6Lcj3j/at2JFZ8DWKzEGOhV5J+xkhhg6y
         8hZQ0bCM4cyIWCZI9XipBOGB7nQOd5LfVrJXYoDTloTqQCugOdrS0JSY2hEJ2EAisyNv
         ax6w==
X-Gm-Message-State: AOJu0Yw4umnoB0ANlLkTzkcs2d3yrMvhVh99CAL1dLgx7TCEreX/v/qF
	tS1qq96ppGRx4kZf7A230aCUGMOLzmtiRvjleRUc
X-Google-Smtp-Source: AGHT+IE6cYKTdxMcfTC2wwDw8VyA2tKqlxihN5hzLzbyRryFFEMC3VTrvhK6uqMatm9ACcJingioRA==
X-Received: by 2002:a5d:63d2:0:b0:336:5a95:8f4 with SMTP id c18-20020a5d63d2000000b003365a9508f4mr1657417wrw.37.1703072894896;
        Wed, 20 Dec 2023 03:48:14 -0800 (PST)
Message-ID: <002559fc-e57c-48e2-b99d-db352c2fdf60@suse.com>
Date: Wed, 20 Dec 2023 12:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/ppc: mm-radix: Replace debug printing code
 with printk
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <a45e841068ef66cc8c1d836a2452910fd3effd50.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <a45e841068ef66cc8c1d836a2452910fd3effd50.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:44, Shawn Anastasio wrote:
> Now that we have common code building, there's no need to keep the old
> itoa64+debug print function in mm-radix.c
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Looks okay, just one question:

> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -15,6 +15,12 @@
>  
>  void enable_mmu(void);
>  
> +#ifdef NDEBUG
> +#define radix_dprintk(...)
> +#else
> +#define radix_dprintk(msg, ...) printk(XENLOG_DEBUG msg, ## __VA_ARGS__)
> +#endif

Do you really mean NDEBUG here, and not CONFIG_DEBUG? NDEBUG is generally
supposed to only control ASSERT() behavior.

Jan

