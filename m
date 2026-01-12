Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B42D143BE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 18:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200826.1516656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLM3-0007l6-Cb; Mon, 12 Jan 2026 17:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200826.1516656; Mon, 12 Jan 2026 17:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLM3-0007jK-9b; Mon, 12 Jan 2026 17:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1200826;
 Mon, 12 Jan 2026 17:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfLM1-0007jE-Hp
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 17:05:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5ce4f5-efd8-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 18:05:19 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-432dc56951eso1988353f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 09:05:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe67csm39547094f8f.40.2026.01.12.09.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 09:05:17 -0800 (PST)
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
X-Inumbo-ID: df5ce4f5-efd8-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768237518; x=1768842318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wTtmBTU4kNH1IWb+Xjd+xM8qXCkvXEN9Ou6kdUhR6ZE=;
        b=Ky6ktDt/FtQHZjXx7hve8l8ZAA8v0K72bFC53eZdc10tAC0pqQQP62I/nUVq7iNElz
         RVqWMIZUcvR3qkICFkPvSgpUefBc1CokupMOcBfyfyCt81y6SVu/nKx8hQTdiGE5y4ZO
         AHV/+steWBfnUh3+omfEitusuJfkmoSsvakyL6VGOIj6vOfJkCVN53njmpEUmRSzwiNm
         5sGqEHhIWX5Tes5VnxpeS0/x93MvnYWuwDYHAy/djgFVlHv2FZamUDtyANatxCXqrIzk
         JWpyEXWQ4rhVbzuyw0spaCM4BfwTsKReMxYLnqtP9hqZZ/8f4PSgxub0z4JSAM72ok+n
         oB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768237518; x=1768842318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTtmBTU4kNH1IWb+Xjd+xM8qXCkvXEN9Ou6kdUhR6ZE=;
        b=En2PDIISwiItZ+XRiCiFkQpS3ybaZ/1yGT4zSJAHdRGf/Ojx3XzJeH5kayU2v5z4ny
         x/yfoX0ycJ4B+ZkWyTF77uN4wZZc9HAT2yyzcjUJz8sW675wEwtX0tjQnH+P0evIQZPk
         XH0f7b5JcSiiwyzA2+QDAqtA4UdX3Ua8vKW8VwqrmBP3XqqFtEUAMgnQ5P91W4+YadPs
         X0Dl/pp1s8IjXegWLYnVosnNl8yVt1vqwLjMkO2L1Ph5LJ717HImMXEFIVobQMPq1hMl
         jwNvhFT8bY9DvD6qKjqf0Fr4pYoCSt4vkFGsJH3Cf+InfDYGP3+fkW2twfUUPp1a4zg3
         SxNg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Uflqpfk20RQdIRfggE/hGHMTxa5k12lUQ1ut0V+osXuT4yb63Rwgt7n9sXfQ/c/Y0y9tOEqj3Wc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6m3LQWmYBjQNM4sRU15US0gzCAFN3Kr1GWXlEPUyv4CYLCKuJ
	tqel84coL/T/QZ5XPDLGeX+ep+yevK66jYOXohx2et0G1q/Jy3+l86Z60zWqTtaRew==
X-Gm-Gg: AY/fxX4igsK8Hh39nkKIXZZq0Rq9IWq6eP25GED0IP0x1Oq0mUymJk8asubK26vV9L2
	X/2S99Lk7KoSep/vb0/pNQsdb51H5+iyBrKvwW0LOHwcWU4ait5pikUxwCA+gJmVpCRGanPrpN4
	2vFLk0zf9ShYZvLmYQM1GltoG7ulFoBBzuJ0f9FGhSuzQMh66gxgUS00w9teliakez6yEw8atgj
	6DOYsZASKMvShKKY/nmAhR2iIFUqIBNLFxpS0RdY4ncngg92hLeXcZnxUb9Mo7AzwxkFsTDh99h
	2zVeZrL98QznA6Qsx2laofr3o3NkCPfzpvrrjNt6kjG213Cu3o7tFIsU6snrU3Lv5/EzJBc7F4d
	HkWeQvCmno304Q4+jI9Lm5IQhdL7YsCplzo0xSEizRkJOc7GzfwiaBqkX7IZv4QVOea4AIrZDZv
	tujOWJy/cTh7JqVskWQI6iEW5P2CLEQhIiDaf42IcQduy4MTUZQDEE2nEMT3j3lRlJap/HqOlrv
	ZI=
X-Google-Smtp-Source: AGHT+IETQYhU7EnTreROmbs2yYrYabD3sprTvXoeMXy+d1jgNmAZUaXONIeprSoTjqIFlnSx/NSKSg==
X-Received: by 2002:a05:6000:2508:b0:432:b951:ea00 with SMTP id ffacd0b85a97d-432c37d2f37mr21534861f8f.51.1768237518243;
        Mon, 12 Jan 2026 09:05:18 -0800 (PST)
Message-ID: <b08265c6-6c19-4935-be34-face486bf994@suse.com>
Date: Mon, 12 Jan 2026 18:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] xen/riscv: implement stub for
 smp_send_event_check_mask()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
 <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
 <94c0cd09-7aaa-4ae1-913e-57d883916682@gmail.com>
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
In-Reply-To: <94c0cd09-7aaa-4ae1-913e-57d883916682@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2026 17:53, Oleksii Kurochko wrote:
> On 1/7/26 4:47 PM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> @@ -13,3 +14,10 @@
>>>   struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>>       .processor_id = NR_CPUS,
>>>   }};
>>> +
>>> +void smp_send_event_check_mask(const cpumask_t *mask)
>>> +{
>>> +#if CONFIG_NR_CPUS > 1
>>> +# error "smp_send_event_check_mask() unimplemented"
>>> +#endif
>>> +}
>> CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
>> for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
>> going to work in CI? Then again I must be overlooking something, as the config
>> used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.
> 
> It is 1 because of the defintion of NR_CPUS in KConfig:
> config NR_CPUS
> 	int "Maximum number of CPUs"
> 	range 1 1 if ARM && MPU
> 	range 1 16383
>          .... ( all other range props are condtional and there is no RISC-V in dependency)
> so for RISC-V "range 1 16383" used and CONFIG_NR_CPUS is set to the minimal of this range,
> so it is 1.

I fear I don't follow: Why would the lowest value be picked, rather than the
specified default (which would be 64 for RV64)? That's what I thought the
default values are there (among other purposes).

Jan

