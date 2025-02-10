Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82BA2E945
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884548.1294266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQyR-0002nN-Bm; Mon, 10 Feb 2025 10:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884548.1294266; Mon, 10 Feb 2025 10:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQyR-0002li-8Y; Mon, 10 Feb 2025 10:25:07 +0000
Received: by outflank-mailman (input) for mailman id 884548;
 Mon, 10 Feb 2025 10:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQyQ-0002lc-67
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:25:06 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4686f25e-e799-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:24:57 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5de4d4adac9so5343868a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:24:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78ec15421sm661110566b.157.2025.02.10.02.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:24:56 -0800 (PST)
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
X-Inumbo-ID: 4686f25e-e799-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739183097; x=1739787897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6RKCv706QRdR4uletmJ03lxNjhbDw2gSqGU2FA6qPcg=;
        b=DnY1gAw2b6f425Btf1gd9zuCSa4pL7DvQpvjxGcPgP7DV12kC/zH3FNo4u01eT8Y2h
         K99GTw67AmHlUUqEeq+M5y2pk/grirm1rys7GdfGijZqPxdqWIvFbv+PlIromzjRDYSm
         Sr2ClLKxZ0/5/y96j4EZr2hCgbiAlHF/7Kd5+vJvmqO843d3GE4huVu+Iv618Yjhn/wU
         lL8Hc4jhl6zYZNTpBoklNcmopKJVc7RrGcax9G5twOBwvgbP5SKwADcjHdzP6b8Deppo
         YCGoMp8WjvLNPcIQEsZ/YaXm0/zM9H756DIxDL8kedd+3bTlroUs8ZfUgCsUxvbsftw2
         0ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183097; x=1739787897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RKCv706QRdR4uletmJ03lxNjhbDw2gSqGU2FA6qPcg=;
        b=qVgdpJ+VARFAsRTKvzuW7Q1OThaV/yTgWNj/4ZQFgwkKNUr111pQ2vD9E4pJe9xUQw
         VArKER7sh7k3uNqaLmg0132IV03IX58q+HgmKuwjim8M9jsp+LVZ0QEgJirLS2LFXLSW
         71yP5FB1BiBaCz7OnLl8NS6atZpKtGVAZ9Td2ozawzaw+Y/2u/uoKmKLRsjqy+W+Mv7n
         sOT0qm4mFtwUVwfK2g46z93XItmZjHT7/aVoBCtlqlnt2+T5Y35n/zzYJBzqkgGMO12K
         Nlk4mh0GidjwdBrIYQDOGC8bJsiTGIJMENi9sUBqFS3qX3ZP064xbFdtaSd1CzXODUDQ
         psow==
X-Forwarded-Encrypted: i=1; AJvYcCWRElnGXvE/IXAz/CuRC8zklp5gLzkpVDY4EM+4M2v5NEFz0TVMx1tUyDw7RyY10LlQoCvhWO09AFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkgGfiRDQN/c+XuXiqDfCFotTNPJL/Zi64twYrWzb4hVvrvEhW
	GP7dteUEclh7WLjugl7spKhkIEQ36prfLcn5nkbqTlWcRFcsQRxq1Hy0NBgnKuXzBV8WWiJ6Xes
	=
X-Gm-Gg: ASbGncsIe4MvR8OlpLfc4FY1+mnrqSAz1a+E/RqZGPsjn0oK1T6WQgcpPnhykGznuIZ
	HWl7vXPeg+g9I2BmHHs16reHgfnFY3EbpwWWIrxCF/Dc4/mlJL02+rIXBp99l7kO09VUZocQg4l
	yBJed8YV30dGF/utTCTyjhMz1BVvPeVrAJt1MqUGmKxzP87VVG9RPEDEDKufulf2tCfU832hyfz
	Z0RWwM/TG36u9SWAVH6t8NWrBiyiCjjiuHmwV4u/3vAh1ImsHCQM3Ex7ETIVLXtV2Zi+0FfQwtd
	aGah5NY5woxgbNphiMouraPqwZjscVAhO8h3IdbTTGXFZPeUlHL9MzfDWw2PQ+D9ejpYw9IH5xw
	9
X-Google-Smtp-Source: AGHT+IEA9o0xjKQQHW5VCjTLUt6l2vS9WKWCY8zWr5tflL8jM4LZYyy8SLq32iRWKSFMcqEfwKX81g==
X-Received: by 2002:a17:907:9624:b0:ab7:98e6:3c03 with SMTP id a640c23a62f3a-ab798e63d28mr1175463366b.37.1739183096810;
        Mon, 10 Feb 2025 02:24:56 -0800 (PST)
Message-ID: <72b7a783-3895-439e-aaa5-0422198e5cbb@suse.com>
Date: Mon, 10 Feb 2025 11:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/smp: perform disabling on interrupts ahead of
 AP shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-4-roger.pau@citrix.com>
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
In-Reply-To: <20250206150615.52052-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 16:06, Roger Pau Monne wrote:
> Move the disabling of interrupt sources so it's done ahead of the offlining
> of APs.  This is to prevent AMD systems triggering "Receive accept error"
> when interrupts target CPUs that are no longer online.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.

Ah, you decided to effectively split the original patch.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a question:

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -374,6 +374,8 @@ void smp_send_stop(void)
>          smp_call_function(stop_this_cpu, &stop_aps, 0);
>  
>      local_irq_disable();
> +    disable_IO_APIC();
> +    hpet_disable();

Is this then taking care of the bogus error interrupt observing ESR=0x00?

Jan

