Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3F9DBFF7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 08:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845731.1261075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvtO-00005m-LP; Fri, 29 Nov 2024 07:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845731.1261075; Fri, 29 Nov 2024 07:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvtO-0008Ub-IM; Fri, 29 Nov 2024 07:58:22 +0000
Received: by outflank-mailman (input) for mailman id 845731;
 Fri, 29 Nov 2024 07:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGvtN-0008UV-1V
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 07:58:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06e9e54-ae27-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 08:57:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385dfb168cbso101705f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 23:57:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd3a405sm3743890f8f.45.2024.11.28.23.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 23:57:48 -0800 (PST)
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
X-Inumbo-ID: a06e9e54-ae27-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEwNmU5ZTU0LWFlMjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODY3MDY5LjIyNjMwOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732867068; x=1733471868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EhUxUsXlYTOPIuI/9Wjr+HtLnFZVyckeVjHXp63PFxk=;
        b=PZIJfWJY4bO01e3uAUjkOFdjBUbWUOy5T5kTxb2E9D//q/+xyRUuSG7yzPpPOd3r/S
         XAfrk2iqzmT9rTSWPCHtqyJn7muS2hSOzk+jN4Ity0cA+HSAiIzwejWt29cl4dbdPa+I
         H0dCxoGze0zUO/35PzfmmKpQWMUk63uXws0BflW7SAP+idx9xzu4UVyGQbhhR77SgNMV
         lP1DYInJ+qLedmxHUF152ZwbSt4FpGhhmc6WU5W0i500YE8k4NlvVqRRNK5Hx8XO/Phb
         uubk7HP+DizHQV17Tqp3CG9U3jtt6+zWtevufUdueB76EDHzddt37ztOqjtnrDWJK0oV
         hDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732867068; x=1733471868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhUxUsXlYTOPIuI/9Wjr+HtLnFZVyckeVjHXp63PFxk=;
        b=KcI9Pct6OH5C1cj2rsV52eIGYhyCXRdc1YLZftsswLcXrJeicu1iOA2DclH4I6sm/q
         hXkH+7UTuXVIqrkyAfjPYSY2o472fSpXP2L1+WbrTVxx1I4eGPjNMFlxcLFd1L0AhmL5
         0jvOFdDoV0anJOljmlKXmkJ9jaCl98oThrvRAimeTd/CQ8+gtyVmrwWVGRO87ezu2qXg
         Ue7oZBfwtUR8ydU1OLvNvRz9cesEG3o3cVBssVnMxQUeAWlGVHsBcOd/2swKlPAcAzwL
         4Ilkv8/zkJ48fldL1yFpqFAdTR+VeJO6zoBfU5Rb5xzucv1tA8X/XyLjH+Fwvxms8OCT
         nosA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ef8shYz/UjGVeQ/jmt8dD8EquUgPM1glc0YZYSrYNxqTyzoqxZ2B9RRx2pwqxmdm5zZZtOaoxhA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeTkmfT8CrSM9BW/qWW5IP3SU2JE/A4ichFOCQKrDmPAMb17S8
	dfr5q3oT+dHfoPphoA6W0NbAqeACpqGyaBFgHFljLh9iQ853dALmN2MiZW04mw==
X-Gm-Gg: ASbGncsRxVEPxztMotrbp1UlhSqY0pezrHQt2Xgl0EFmTdYpayMPIgjTjtonVCQ232x
	Q6uP56PlwmctFoTJSZA80DTgyRfNg2t0KnftZIYF8JxdehpOoqJO+Igfg2tjXlnQcD2GEThDqSk
	9EFeFuvygR8+/EJvqCnGGDFISy89CKLCWSHhp1lOoU0Kotp6D0zOyXFh5Q9c+A4g2RjmjZAyS+p
	A/HAUZEFw7TmuwQ6UCZPNE4CR4QWxRwl5jhIy5iiibSlga9OdyICv9n82B9ibBJ6GA8CvVWRTHq
	b+DtANVRtdNnUAPfd9w1cu7s8LuEQvFtyUI=
X-Google-Smtp-Source: AGHT+IGuyjtl9V1UZBbRtUli2zHnDJ1sD+IrNwVVwXm7drOdNZXo8InlvWxeLoSek2j5l281KHDiaQ==
X-Received: by 2002:a05:6000:178c:b0:385:d7f9:f168 with SMTP id ffacd0b85a97d-385d7f9f2c9mr2944334f8f.17.1732867068577;
        Thu, 28 Nov 2024 23:57:48 -0800 (PST)
Message-ID: <57291d0d-fe7e-4410-8cc5-a2bed0de108e@suse.com>
Date: Fri, 29 Nov 2024 08:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] build: add possibility to use LLVM tools
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241129014850.2852844-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> Currently, even if we are using clang as a C compiler, we still use
> GNU binutils. This patch adds new option "llvm" that allows to use
> linker, objcopy and all other tools from LLVM project. As LLVM tools
> use different approach for cross-compilation, we don't need
> CROSS_COMPILE prefix in this case.

This new option is meant to control both toolstack and hypervisor builds?
As to the latter, I assume you're aware we're trying to move away from
this kind of command line control of the build.

How is this intended to interact with the existing $(clang) that we have?
In the cover letter you appear to only care about the clang=y llvm=y case,
while ...

> --- a/config/StdGNU.mk
> +++ b/config/StdGNU.mk
> @@ -19,20 +19,4 @@ OBJCOPY    = $(CROSS_COMPILE)objcopy
>  OBJDUMP    = $(CROSS_COMPILE)objdump
>  SIZEUTIL   = $(CROSS_COMPILE)size

... even up from here there are uses of $(clang).

Also please Cc Anthony on build system changes.

Jan

