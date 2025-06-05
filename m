Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C7ACEE62
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006666.1385910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8as-0003HP-00; Thu, 05 Jun 2025 11:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006666.1385910; Thu, 05 Jun 2025 11:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8ar-0003FV-RL; Thu, 05 Jun 2025 11:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1006666;
 Thu, 05 Jun 2025 11:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN8aq-0001e1-IK
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:17:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e0e11c5-41fe-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 13:17:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so631841f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:17:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc85b8sm117866975ad.52.2025.06.05.04.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 04:17:06 -0700 (PDT)
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
X-Inumbo-ID: 9e0e11c5-41fe-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749122227; x=1749727027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P74eEXvJTUvSHXcD9lJwchHDajfQ9apm7tVl2xTy/kI=;
        b=GtfcMCn93bT6gOZhh0F0zc0l44cIO8D+2Q0zc1I4pFzm3zui4H6cmxMPWI/9+Qyf8T
         INeEkp/OMC9/GinrIm+u7KbbaY9nlWJannh/a29qYLuRapA46MoL10NDpBw39TNPi99F
         zNGu8Ws/FqM0DZnt36RpjgVWzrBo+3p2vMARdoc+/2fI9R59J6/AFFKN3Rer//zQxCca
         pJIZzD6dDH2+BMBbgV1lMztxo2xw+tUq7J5esODa975PBPyomYuU3JiEE8kGMMI3Q59Z
         hI7+HkbSWZ3ThYAByhozHed5V3c2AL4lil/UmKuIPBAfXhfGADZUGdyKOwvS1wZtTNcM
         rUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122227; x=1749727027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P74eEXvJTUvSHXcD9lJwchHDajfQ9apm7tVl2xTy/kI=;
        b=g/Q4qqdyxw/FaXr678Ut8Sw5QcTS2wwUigpGq84H9alXlHXilk6OuLJg8XMxlWQrW8
         kW249+GKsMw9xgICNJMJdngvv+9nXzXIgKrgToenvvaxUlPTiFAXsv7U9t73xj8usFNV
         9co1l2hqHVfT+fTfkiKAsrA/hOIvzKuSagFnCP4JbPGJakNqcOfZv9xE4F21qkH7AMq8
         QI30go6pX3apvR/b/tXC53dN+P3H0ICkYgu4I6oOQYsHQd8xwPKGxv/s/ODjo6QYodL0
         ZOXAn9mQV8F/uJojr+O5N8BqfB0rfNoD8G37WMpqvhB5UHHelI2D7FZhpYIkEejw/zUj
         EX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFuyI//XEef5ryC5RxvVWpZqwOkhM/27r5gqgOJPnpQcKJIui7GNQC7KcZsxNVG70ikHJ9s2Tj1VY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBkZQ+MEmeV2bRgOWn8QuMa4PXWJ6qlBsqwA/RZCBKWscVpobE
	ouI8Zq8i4ISVrhSO8Hj/SEn4j76Qnb2U+q9TRc2et8j5Erb5YZfYLFcQif08ky782Q==
X-Gm-Gg: ASbGncsfrqaiIB5IjmI3hlDvEcGJXawLQhHoUtDfStNLjOqgEwnRXDodumsqxcuNXDF
	aRt7iEo0mn16DxnL8USVyJ+k2HvZp/TpjvQUGKgVezIjlSGyXh81f9pPrD6o6rLQxmkjxEEkBsu
	Dq/CiZDZ+3BssaUs+k9pgQK3ftXMdiHNW8x4B8YsK0cLpWYdl6YQqQkFR1W/iRQ1bsQRCrbTcLz
	oJ/7mcjoiYVGXULRwTJ4iDNyK6KphAF/k2xZ343NfERT7Hh0cv1ITTWBKbTX7cjvUf6u471NvI5
	nUw82Fj71zXGmNOr3kLPN6DFDPvGR7EFwhuiUX7lRBxWDUzH9LvvyOByjpuqMBKa5FIAtxaZ6Wv
	NG7awWrwCCtw28OwZK1XGbu76URoVWXSgQ5qVZjuIyr8ZfeA=
X-Google-Smtp-Source: AGHT+IG+UDivQEqMWKfN2mqZSkF+NW93yKD1+5CIqdEEP9gTl9IEuLRWTD9u/7kvit0MT28mfX/uIw==
X-Received: by 2002:a05:6000:1a85:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a51d923b56mr5606104f8f.22.1749122227354;
        Thu, 05 Jun 2025 04:17:07 -0700 (PDT)
Message-ID: <4deb4b15-71ce-40d4-8d6c-3ed04beb172e@suse.com>
Date: Thu, 5 Jun 2025 13:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] livepatch: Load built-in key during boot
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-5-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250602133639.2871212-5-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:36, Ross Lagerwall wrote:
> Parse the raw data of the embedded RSA key into a form that can be later
> used for verifying live patch signatures.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> * Fix endianness of builtin key lengths
> * Set builtin key to __ro_after_init
> 
>  xen/common/livepatch.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 9a0df5363b59..92d1d342d872 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -11,6 +11,8 @@
>  #include <xen/lib.h>
>  #include <xen/list.h>
>  #include <xen/mm.h>
> +#include <xen/mpi.h>
> +#include <xen/rsa.h>
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> @@ -73,6 +75,10 @@ static struct livepatch_work livepatch_work;
>  static DEFINE_PER_CPU(bool, work_to_do);
>  static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +static struct rsa_public_key __ro_after_init builtin_payload_key;
> +#endif
> +
>  static int get_name(const struct xen_livepatch_name *name, char *n)
>  {
>      if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
> @@ -2300,6 +2306,31 @@ static void cf_check livepatch_printall(unsigned char key)
>      spin_unlock(&payload_lock);
>  }
>  
> +static int load_builtin_payload_key(void)

__init

> +{
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +    const uint8_t *ptr;
> +    uint32_t len;
> +
> +    rsa_public_key_init(&builtin_payload_key);
> +
> +    ptr = xen_livepatch_key_data;
> +
> +    memcpy(&len, ptr, sizeof(len));

How do you know enough data is available?

> +    ptr += sizeof(len);
> +    builtin_payload_key.n = mpi_read_raw_data(ptr, le32_to_cpu(len));

Even more so here. And then again below.

> +    ptr += len;
> +
> +    memcpy(&len, ptr, sizeof(len));
> +    ptr += sizeof(len);
> +    builtin_payload_key.e = mpi_read_raw_data(ptr, le32_to_cpu(len));
> +
> +    return rsa_public_key_prepare(&builtin_payload_key);
> +#else
> +    return 0;
> +#endif
> +}
> +
>  static int cf_check cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> @@ -2318,6 +2349,11 @@ static struct notifier_block cpu_nfb = {
>  static int __init cf_check livepatch_init(void)
>  {
>      unsigned int cpu;
> +    int err;
> +
> +    err = load_builtin_payload_key();
> +    if ( err )
> +        return err;
>  
>      for_each_online_cpu ( cpu )
>      {

So far this function can't fail. Therefore it makes sense that I can't find any
provisions for this case elsewhere in the file. Such provisions will need
adding as a prereq, I expect. Or alternatively it would want clarifying
explicitly that (why) none are required.

Jan

