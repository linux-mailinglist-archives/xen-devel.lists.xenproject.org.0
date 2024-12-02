Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711809E01F4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846672.1261822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5P5-0004Vs-Ja; Mon, 02 Dec 2024 12:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846672.1261822; Mon, 02 Dec 2024 12:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5P5-0004Tk-Gx; Mon, 02 Dec 2024 12:19:51 +0000
Received: by outflank-mailman (input) for mailman id 846672;
 Mon, 02 Dec 2024 12:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI5P3-0004TL-CP
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:19:49 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7687e26-b0a7-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 13:19:45 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so3616561a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:19:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e63a2sm502177566b.113.2024.12.02.04.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:19:44 -0800 (PST)
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
X-Inumbo-ID: b7687e26-b0a7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI3Njg3ZTI2LWIwYTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTQxOTg1LjY3MTY4Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733141985; x=1733746785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DbhVsuh4+pHZtocjf52LXiC3wejoUyITarBkXiQXtT0=;
        b=LKOtc+gCwFDNtId8AVvVFT2OY/OnUnIeifJ4bWlK/n3SR4Z0gZsGev6rOVuKgs1fCv
         DjCIPkGSUAZIHKAKNsbZ1A87griWKwMGeRhvYxxiLLHLUTf66+c1tqw5jRBjwkd0cHW7
         +Vg2mJs/PFlML7t68yxWLykL+UIKuD5e81XaoK4xhd0/5ACGdtpkgDPg6PIlp3IhELCG
         wkBnBUL6Cw4AQWtprYcvRD6J/CKvMkSwpHdYXDHteIBuk4KZZ/6CzJnmx+iXuBCLEg9o
         IAr0XjqaDMO6RFYCtoQ0bezZQCA3jHxrXNt5B9jfQwe7rLyBtB3vmhJExmV+GbvKjRvY
         jTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141985; x=1733746785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbhVsuh4+pHZtocjf52LXiC3wejoUyITarBkXiQXtT0=;
        b=R/mJJqcvJKPabH9EgymK/P1FBMP94E3HQN9oxd5NWw1/LT7hgCI0/IFr01PsFCH6L0
         mKusSyIiNyt3vkrdFQ1s5Gd5hULO6mQcSdllJ6fuxCXOLv1ze/qZRheDSeUszDUqb501
         DY2JgPOlV+d/RlhkYZpP4fpYsIICgwjULqqY/EiQya753AoNogefuAigVr5ahgzuq3Y4
         KBJX5xBbVFJkrY7SJsX7iXF+Sk5s2OaHgftgun1uT5/E655ELgqg8dMRXTAfSjuZF6nK
         goPI4eL+YsZ/VMjMU7k++Oh+0K7/j5TEYK5PrQLudjnXQU7JComNPJfuVgtNTJ1W8OQu
         8rWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvkYOAf33qKBC2cMqyoHs8hJvDlWnT9zqbncRatWJfS6ZfawL31YchVjCtbgF13tJ01Z4l5LYeUSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxzkwT94zz1fwe1WrJmjH00Owx0ZSXuv/SLJPUvGyvL6PPnJqP
	B1PZu9sakoGX6sKMhlvQnMChE3Cr0ylvbw6V7d5pAisqmt5uBL9sYCiwwxAH4Q==
X-Gm-Gg: ASbGnctKhU8LlK74wOg5HmBIvEFe1dydMvA3ij8LloC8k5xnx3EPfPBrl7+MquywBZY
	rB+XMSZktAYfvhVciDy0VKs2XYFW/J4DspFwnk9wIjNpTkXA0d9/c0okuUjMOm+bDdT9bx0otpR
	AUFoY6GFelEcSonHWgNaIATTvLoAn8xay9mEYLNYCqtGaN0Up4AJ8vjfyF8QABBaUNqAH8jbm+9
	BbHhmlguIqFeXwK09r52slod+yp8cvGcBT+xLcl5JT3bdhifxYOOGoqdmBWy+5OkNteWCtdzlv3
	pxTbJe7v9mhle308q6F6Pez6YHvhxIegsbw=
X-Google-Smtp-Source: AGHT+IHn+EXbWerfVcZvo0IWgtk/ZHUn+nk0l2dfFf5jn9LnMp9mftIDlqaDn1kIWzEN0YOrA/n9qw==
X-Received: by 2002:a17:906:3152:b0:aa5:3663:64bf with SMTP id a640c23a62f3a-aa580edf9cdmr1991918566b.12.1733141985043;
        Mon, 02 Dec 2024 04:19:45 -0800 (PST)
Message-ID: <88126e8c-96f8-4cb2-a899-eec2b800cf66@suse.com>
Date: Mon, 2 Dec 2024 13:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-15-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -617,6 +617,9 @@ int __init construct_dom0(struct boot_domain *bd)
>      if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>          dom0_size.nr_pages = bd->max_pages;
>  
> +    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
> +        opt_dom0_max_vcpus_max = bd->max_vcpus;

Isn't this kind of backwards? I.e. aren't you meaning to move us towards
boot-domains?

Also, what about the counterpart opt_dom0_max_vcpus_min? That wants to be
controllable from DT too, I would think?

Jan

