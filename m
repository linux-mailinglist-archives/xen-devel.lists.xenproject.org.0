Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E8A8B0457
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711273.1111104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzY1k-0007Yi-Ns; Wed, 24 Apr 2024 08:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711273.1111104; Wed, 24 Apr 2024 08:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzY1k-0007Wf-L4; Wed, 24 Apr 2024 08:30:52 +0000
Received: by outflank-mailman (input) for mailman id 711273;
 Wed, 24 Apr 2024 08:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzY1i-0007WZ-MR
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:30:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4430117-0214-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 10:30:49 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso1557503f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:30:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056000195200b003462fec9f5asm16471098wry.62.2024.04.24.01.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 01:30:48 -0700 (PDT)
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
X-Inumbo-ID: f4430117-0214-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713947449; x=1714552249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yALFlN0lnYc4Oa8S6w+Yss8st2VUPp9acwoJPT0LKUk=;
        b=GPOxhfkmrMrQZfiC7uX0MFKe6akcepb9U9uiMtnxPCaLAIQ5KL7JlRJzipVaR227S8
         oYtwgct31zh5HGhrZfeQY8qM4hm+8TOQFcqbSRh0BK36N0qJMIgFVW6mzyzQYoX9kn3X
         jowjnrgGYkMQOjMIMsFpgRQIhdJQYCxg9UjKzxsgv2RHnoIYzbdo7TCJiqC5DxzbSzxk
         pRpL1hHee2gakfyCH4kjxlmL22Uj/Ej3YxhGV7llIs+xWANDRTL56imqEOE7RKkOn1ui
         1AOMdpP7R3wVLUItEmmRKQu81Ont2u6UHzQdyqnn826av/QyqRfdobXho5Mq0WJdRH7y
         Fbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947449; x=1714552249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yALFlN0lnYc4Oa8S6w+Yss8st2VUPp9acwoJPT0LKUk=;
        b=P2c/Wiabtkz958mJ1jTBpJUKLzwq0OYK447iNZyHcG6RmyWXjHARyIS4SQaPzmkUn6
         EGoZvIpPUem41iUpG8GOpgP9f2oOLmTRm9IJwRVTrkXQ9wr5/qLZ+GDCj3HqwvI5Lm8O
         n8xd15m2/Rx2+AQ0/eek+PY25EroFdwXGFVajPo3wLgGA5ZTpBKQ6MQ44paoHakW/FvF
         Pq3onHAcwFyFZN89E4mS1Dv6eal/jss6wNlPTRfqaQTolHvwFUaFqqHq3EedzA7MzfxV
         AAWQxnDwK5bFytQU+3CeMZ1Y7rJoSo+g3t898uHm/D0kcS5nBgZ/gdDz8kgwvQoF506k
         Dv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsv/9BCMlpa5kU7z0BdlUUw6qdvAKboTRLGnwOCzowy0/vNdC5KpFYkZ3I5msQSHGxTmhZFMuzVp4UIaEIIFAdzLYpQryHup8vLjr7kSM=
X-Gm-Message-State: AOJu0Yye9MyhOn2oqPEfNU5zjw4v6F2MayNSQLGLBHZ1a45pY0DJ0MBA
	a+g0162wf9U3imQmjr6yB5zEJtjy1hQ9uGfoWVu8VOaqkc14dp0w+u8FiUHCZQ==
X-Google-Smtp-Source: AGHT+IH58ot+ywu5JRc8bDr1prg37z3jTvTQUznvYbC6AdBi0W9EB/QAzaHjQVGJf+eataor7Dk1Mw==
X-Received: by 2002:a05:6000:1205:b0:346:c0f6:8b6 with SMTP id e5-20020a056000120500b00346c0f608b6mr1056508wrx.32.1713947448819;
        Wed, 24 Apr 2024 01:30:48 -0700 (PDT)
Message-ID: <891c21cf-695a-4b1d-b10b-53f23199380f@suse.com>
Date: Wed, 24 Apr 2024 10:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <310e1dac8ecf2a85f1c552dbdad9093b1cfdcb98.1713946892.git.federico.serafini@bugseng.com>
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
In-Reply-To: <310e1dac8ecf2a85f1c552dbdad9093b1cfdcb98.1713946892.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 10:25, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings for Rule 16.4.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>  docs/misra/deviations.rst                        | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
> 

So what has changed here from v1? It looks all the same to me, with it still
remaining unclear what exactly ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -334,6 +334,19 @@ Deviations related to MISRA C:2012 Rules:
>           - /\* Fallthrough \*/
>           - /\* Fallthrough. \*/
>  
> +   * - R16.4
> +     - Switch statements having a controlling expression of enum type
> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
> +       which warns (and breaks the build as we use -Werror) if one of the enum
> +       labels is missing from the switch.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R16.4
> +     - A switch statement with a single switch clause and no default label may
> +       be used in place of an equivalent if statement if it is considered to
> +       improve readability.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R16.6
>       - A switch statement with a single switch clause and no default label may
>         be used in place of an equivalent if statement if it is considered to

... a "switch clause" is.

Jan

