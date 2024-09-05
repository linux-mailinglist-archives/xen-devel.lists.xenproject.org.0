Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B596D57A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 12:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790990.1200752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9NN-00041F-NJ; Thu, 05 Sep 2024 10:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790990.1200752; Thu, 05 Sep 2024 10:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9NN-0003y3-K8; Thu, 05 Sep 2024 10:06:05 +0000
Received: by outflank-mailman (input) for mailman id 790990;
 Thu, 05 Sep 2024 10:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sm9NL-0003xw-SS
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 10:06:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74635391-6b6e-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 12:06:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so63354066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 03:06:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038d8bsm113906766b.64.2024.09.05.03.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 03:06:00 -0700 (PDT)
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
X-Inumbo-ID: 74635391-6b6e-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725530761; x=1726135561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KQi8FufrFwKjK3qZwC1toUd8MxtMT7YRCp62OH8+hZw=;
        b=Wcy0Y9VS+tZMXVHkU2Z2GRflU6EAs4DJ2ltahVGkJPivxXwFG5hxKIoqRAMV52tvr5
         LZWuaCh9Yx8KVkQ+X+yXq+awYWHvtO7n83zOPVYvWcUuJLXvPYe8mQvYoY2Rg7VJaBU5
         xSBj+vLq4dre1QRNtodHDojskYSDSSm4+zW5uL1whpLl3aH1j3oCku16WfsXTOnEwD4m
         I35k815ziu5+eOz4Zr8H5JaI686FMlpDx0yASRbdrCJS6y6tcSzEcRsuD3woLaJSFgHZ
         8Z9YSJoZeIUlhGkc+mjMcH64V/7XF6NQ/uKJIjsq11trpDiG2l+eeeh7BV9EKkiyRBYK
         bvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530761; x=1726135561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQi8FufrFwKjK3qZwC1toUd8MxtMT7YRCp62OH8+hZw=;
        b=MbZMBNuxzuHewBXOZCD7i4dJT1Bzvw8IqlIu55gEl1dXETeHHh0nVpNVXj2sEjkG0P
         Au9ZNPstP9b/0QAQyNXX3i4WDWOcSjWrh2SKNBNR2MHYNwNkWFvVrisxHlyz/b90zD/K
         sIoYkLL0GZcqZyw0nU507ILNxL8RSiB/Lligfosc9rvVPk4vjZ7rI/oqLwVl9s3Nae9o
         oUyfl7WfiNbwLp+rhTlBEqNcHJUaSyQQa56gvjouUYDhUt6wp2g2km/vX8S1q+YsMn3o
         kgh6/Gp6C7mdSWBAPTUaRBS1HJXm3ZlnZqWuRpQSnOzgFeIyRJgReQJXeBgB9sCM/xk2
         +oRw==
X-Forwarded-Encrypted: i=1; AJvYcCUu28xn++Egj9XKjau3YwM5Hhm6uyKHHNXRtHiA0MWweeGdHSywyQ5+UWYkNiSl4IPNfzoLy4Tsgt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydEJNRddL1iM2lpda9+aBB6wkB8B3ccUe8nU+WfvvGZNhIMkJh
	WWUFgQWHH89kEwzEDMSpQrkytAQDiurHfYN2r/4C1OcjQYtiHgh0GU5CzZ3oCA==
X-Google-Smtp-Source: AGHT+IFMHbychKWnsiI2mGz/piR4DM33aWt5nI4OKn60BLL7QSpUKvSCBsYfWizoTf1KK4ePmqGcvg==
X-Received: by 2002:a17:906:6a1e:b0:a86:83f8:f5a2 with SMTP id a640c23a62f3a-a89b94cef24mr1523553766b.19.1725530760897;
        Thu, 05 Sep 2024 03:06:00 -0700 (PDT)
Message-ID: <2712db86-b9c5-4bce-b4d1-422c46e70959@suse.com>
Date: Thu, 5 Sep 2024 12:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/bitops: Reinstate the please tidy message
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240904225530.3888315-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 00:55, Andrew Cooper wrote:
> Recent additions have undone prior tidying at the top of the file.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Looks like despite not getting any ack (nor comments) for this in earlier
rounds, you still want to keep it and you don't want to re-base subsequent
changes ahead. Which is a pity; I hoped I'd get around opening up another
controversy here. I'm afraid I disagree with the underlying thinking in
this particular case, or perhaps better with what I assume the underlying
thinking is. First: What is it that was undone? I can't spot it.

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -210,6 +210,8 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
>      test_bit(nr, addr);                                 \
>  })
>  
> +/* --------------------- Please tidy above here --------------------- */
> +
>  static always_inline attr_const unsigned int ffs(unsigned int x)
>  {
>      if ( __builtin_constant_p(x) )

Second: How is the code above that marker any better or worse than the code
below the marker? (There are differences, yet that alone doesn't make the
earlier code untidy.)

Taken together: If you really think we need such markers, I'm afraid they
need to come with at least an outline of what wants tidying in which way.
Unless that's (sufficiently) obvious, like imo it is with the somewhat
similar (in intentions) marker in msr-index.h.

Without it being clear what wants doing, I think such markers would better
be omitted.

Jan

