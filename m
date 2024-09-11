Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B59752E0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796613.1206338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMnO-0000hH-8J; Wed, 11 Sep 2024 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796613.1206338; Wed, 11 Sep 2024 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMnO-0000eF-55; Wed, 11 Sep 2024 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 796613;
 Wed, 11 Sep 2024 12:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMnM-0007kY-OR
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:50:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d722f96-703c-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:50:04 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so160039466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:50:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258317d6sm608897966b.29.2024.09.11.05.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:50:03 -0700 (PDT)
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
X-Inumbo-ID: 5d722f96-703c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726059003; x=1726663803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o1YP6FX3pd5wjkXzo95XBjPE83zqP/ozPgovKExwvMQ=;
        b=ccW8YM8yjEUMbotsmAZotsRZRrGVcITNRwu99cA9KepF1GbEzxcqhCU+yLD2QpCsKq
         Df/xCFFeBdTZEQtM5Nu8G7wsnWvskRFhSAgV8Dy6pLn5eUgwIA6ZEueLkDvzCtu6/tAh
         gi4Fn3WfmcVCPxCqPyAE9ARQpr+C+vCp6qS3ZvsRT4KiCKMNV78YwKBOjjJ2rGE8R5TQ
         1wUu7ZGU+TQ/KRp1tJdw26w6ebyRWhoWRlozmjTe+Q07zRNtdWn9uRnU52sY7T5c21HU
         8i6w1FQucpakm0l83tgybyap1QaItrMFijYdun2t8w2E/aAQBDSHGxmMrOSlqma7Y4dG
         mKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726059003; x=1726663803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1YP6FX3pd5wjkXzo95XBjPE83zqP/ozPgovKExwvMQ=;
        b=XKuLQQ0SNs2WQlLuYHkDBdG3qQYz6C5a83Kf0N7hGbHpaCdr5NZrajYKYHjuc7v0MG
         sU9/82l2MZR3UxW5pZi1ereZ9yNmjCsJKWEyG7czCaftEix+9qxQ9qMAEFyyhIDjl/Cp
         pE177E6q5U9ZzvINEgYK8sWFiybvZU2KLAZJXroQvuj2qGatDr7Ur2ckTl19AHHEqRwu
         YqDZvnL9U1cEdbPhahEXkiOvxwT7d4tZPboZifzym448NHgm9Z2xx4T5/Jw30WUiZmRD
         XA5rdHjJX++3utGS94glj/hAy9AW6RnRArxoPq8o+U4hhbWkMG20XwtistDTi/bRdKcO
         GRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9xLuaHGeisUWeD6TGD7yTA+UqBbClwNVyQYmQv2xpYSY1GS0MrsOBQZvy0MLokYXxbSfrDWa+8gY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOH11rojrGZ2GXDY6g2+erngjWtVcrJuUr/2Y4PCdc1B3dBZYr
	TP54yKeEtgGLil9hJp2PZl382AlmJUNZncjmIAwIhYa0k18zqq7sPfZnWsdPUA==
X-Google-Smtp-Source: AGHT+IGZno2wLujlG6URpS934szQO/Aq9xs/4FtWa5DEe9mE/p/ZYSK4oBqRtZ7z6Gj9v3bbGydAaw==
X-Received: by 2002:a17:906:dc92:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a8ffaaa54d0mr386553266b.13.1726059003432;
        Wed, 11 Sep 2024 05:50:03 -0700 (PDT)
Message-ID: <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com>
Date: Wed, 11 Sep 2024 14:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
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
In-Reply-To: <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 21:06, Federico Serafini wrote:
> Refactor the code to improve readability

I question this aspect. I'm not the maintainer of this code anymore, so
my view probably doesn't matter much here.

> and address violations of
> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
> not contain any expression which has potential side effect").

Where's the potential side effect? Since you move ...

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>          info->cfg.addr = __pa(efi_ct);
>          info->cfg.nent = efi_num_ct;
>          break;
> +
>      case XEN_FW_EFI_VENDOR:
> +    {
> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
> +            guest_handle_cast(info->vendor.name, CHAR16);

.. this out, it must be the one. I've looked at it, yet I can't spot
anything:

#define guest_handle_cast(hnd, type) ({         \
    type *_x = (hnd).p;                         \
    (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
})

As a rule of thumb, when things aren't obvious, please call out the
specific aspect / property in descriptions of such patches.

Jan

