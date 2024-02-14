Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C9854B4F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680834.1058986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raG7S-0003Ey-P8; Wed, 14 Feb 2024 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680834.1058986; Wed, 14 Feb 2024 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raG7S-0003CL-M8; Wed, 14 Feb 2024 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 680834;
 Wed, 14 Feb 2024 14:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raG7R-0003CD-BB
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:20:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a22eb70-cb44-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 15:20:12 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d09bdddfc9so73769421fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:20:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jl24-20020a05600c6a9800b00410ac2d6b40sm2083113wmb.8.2024.02.14.06.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 06:20:11 -0800 (PST)
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
X-Inumbo-ID: 2a22eb70-cb44-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707920411; x=1708525211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBzfqUtIcuE9KowMDf8kv7FMyo2GLcIHsuFAzM9TdPw=;
        b=UkVI4WlLKH5jxHgfcB6wHHFPJIRaeoYRI1pneItK/YQpaZtYOxjc1HP0f4gGFWI69b
         8X3X8o83BTKGUXfAXe0RPUrHZiJrB9ODJgPhHEZikRCks2xeDVvYFko3N/Ja1cwZU1fX
         jgUUBjxu+XgQ12wsBIo2Z1LmL1KhEY03zfsGw/u3Brle8NuD4TAGaCX0mtAA5M9OuKd7
         f84Q2lCfjJdz5oLYa3FwXySvMp4YKpVaceBSuhXIYCIXTplFJgwG9hGBQYV2l0SVrhiN
         A3F3tGJqTlZDUfJmdU6RBWULBymhRtrrSZ1M8RaeuYIxVsl5I2S8Y3BYYKRIab/rjXpZ
         wl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707920411; x=1708525211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBzfqUtIcuE9KowMDf8kv7FMyo2GLcIHsuFAzM9TdPw=;
        b=FJFvstIH2soZCbOUiXwCdwndLVt1IHGOWemOjgcY/ecL4RuQOjwocNbwSNiS5m1dzL
         NEI5UZ5mTvJrBTB3KWV+pWqKyjYeyK/UL8EtlAc+uAJZh3yYk2al/SWUHmHyVVX7TJ74
         41NHh61n1UYuXqRL/thlk1HgEK0XlRC4wYFKT3MJTFmrORIcAH5lRAE5G15w18pYCL6a
         1RCCX5/JhVbLM1Vjj/sPOo1vug9bUnkTEHJLU1xVrhgUN+sAZdltW3u+Clq/A/jC+Wzm
         q4+FSLZALbtAK0jaM4Wjrqqvx9twK6rK3JlcMOX/oHIji8KIKUU52N4jn24yF22sHZmK
         PIyg==
X-Forwarded-Encrypted: i=1; AJvYcCUi8/4jLIez09HKkwGykbcjNaWDSduQ5DPtLLnln8g1OXTXyAMIlIspfDnUA5xt8c4BCm7UHZVZn1epTQVbuQJ5reHp/X+vrIlLQWraMOI=
X-Gm-Message-State: AOJu0YxSES91JiTWJDrL4fbcRSAfYd6zH2u6VNN7Cmw8ux1WUzlaBgR4
	2p+RU3GJMfXrjZUE7vwk2aPBjgqxaULebj85u0qdYGeh8/73cK4JMSvi/vQDPA==
X-Google-Smtp-Source: AGHT+IGER8DJUrbp5BpfnCNDkDghfV05beEkWFdp/Nbsh3e3IFfemTP5bMsizuHw/c7AvuA8jI5OEg==
X-Received: by 2002:a05:6512:32a2:b0:511:4c52:ff53 with SMTP id q2-20020a05651232a200b005114c52ff53mr1958684lfe.53.1707920411570;
        Wed, 14 Feb 2024 06:20:11 -0800 (PST)
Message-ID: <5e13d688-3cc3-48dc-ad7b-81f94734f5f3@suse.com>
Date: Wed, 14 Feb 2024 15:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240214103558.13655-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 11:35, Frediano Ziglio wrote:
> @@ -898,105 +898,105 @@ END(handle_exception)
>  FUNC(entry_DE)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_DE, 4(%rsp)
> +        movb  $X86_EXC_DE, 4(%rsp)

As we're trying to compact things: This writes 0 over the previously
pushed 0. The insn therefore could be replaced by
"BUILD_BUG_ON X86_EXC_DE".

Jan

