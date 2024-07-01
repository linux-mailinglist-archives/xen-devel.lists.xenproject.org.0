Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660B91D9E2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751328.1159248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCJs-0005oC-Pf; Mon, 01 Jul 2024 08:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751328.1159248; Mon, 01 Jul 2024 08:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCJs-0005lN-Md; Mon, 01 Jul 2024 08:23:28 +0000
Received: by outflank-mailman (input) for mailman id 751328;
 Mon, 01 Jul 2024 08:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCJr-0004nC-2k
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:23:27 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30759591-3783-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:23:26 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee4ae13aabso27884841fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:23:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a96a7asm5873436b3a.218.2024.07.01.01.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:23:25 -0700 (PDT)
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
X-Inumbo-ID: 30759591-3783-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719822206; x=1720427006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BGu0AV2x54mCK1wCYLxNLB8J9YcYsMIfFMDz0uvBAKc=;
        b=HiT5o8SPiBjoi7kc3pU56mltrgJm9VB77SkgXEeKg8PDOY5mlThEoEN41CCXxZb8qc
         p+nQX2YzBJrcaEsBAifzp10r0bpXITDrgOGJyAbljCLmsETtJJPYLJQYP29JnN3tSppQ
         UVmPSuHqgFVAewV/07yokP3UZFNwWjZKF+6PxqJAcgLT3yYdYw5cvVEGlLIPA97WKmCQ
         8w1WSFQaj280grmS+9vnP18f68mJsFDodypV8AWqzlcpLhn7URWRcqtw1GgOj1v9Gs78
         quYEfh6GsW6i6Uh2Y2kMuSb3kV9uDGfNElGt+k4PBHl4AGkcjqr8+pQ9ZMf79z01UkJE
         Pi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822206; x=1720427006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGu0AV2x54mCK1wCYLxNLB8J9YcYsMIfFMDz0uvBAKc=;
        b=IGMXZT+pYfezv5TBlePHUacxihlSHoEAE5jeopxY0aMuAZBcBHLiJmSbrm67lAd5ot
         RBn6BSJWgKglBk+MHFvqojuahNSYkDgqSzDOabNxtg1NJyZsf5iqPLLocjWDfDzIjz8C
         sp5QBp+vjQ102nGiyMsdIDYPXz5PuLtc/xh8ssVJi3pv+7EH0m6ZvA6C2xwYtM7sKUdU
         a/877AAw/rrOxRfrWHxzqf1f3XYEqXi7zwcYUVOK6HfPgbsdjS0lt9qgk8wf+VEYireA
         PxcxmqQC920LvzkJpp1mLsK+9ezUPXsZjA3ZpKbCbef9kG3PKbau2kvI0IudNjb6nUkK
         p8vg==
X-Forwarded-Encrypted: i=1; AJvYcCVRsJDZjkGLRpkI6Sdn0CrPwT4nKKpXUlIfszkPxIwu6atfPtdqBgoMQM44cvkuHJe1ZhxL1JiZHB2o9bIapafvKlRV9fEaBQhpzp+tPGE=
X-Gm-Message-State: AOJu0YweD8xyA6pJUCnNmqg6hhsoDWWY/RPo9Fwl7qWsGUsTGA2D/jm8
	9ulAjKrn9O+VKopIUn4rNCnXXZce9pTUGraJHTOlqLxkINqfMKuNiKWgXUrIpQ==
X-Google-Smtp-Source: AGHT+IGE4ql/li6qInGXUqm8YaBYhHyxoQcvfAGIB3Ri0tOr5ZVtad+eZoJ5yNKW277tVQgHoFYvdg==
X-Received: by 2002:a05:651c:1509:b0:2ec:5603:41a with SMTP id 38308e7fff4ca-2ee5e345927mr32460501fa.2.1719822206047;
        Mon, 01 Jul 2024 01:23:26 -0700 (PDT)
Message-ID: <9e629240-dd9e-476c-93ea-81086bb73f91@suse.com>
Date: Mon, 1 Jul 2024 10:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] common/softirq: address violation of MISRA C Rule
 13.6
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
 <ab8b527c775fbb7681a4658828d53e7e3419be10.1719308599.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <ab8b527c775fbb7681a4658828d53e7e3419be10.1719308599.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 12:14, Alessandro Zucchelli wrote:
> In the file common/softirq macro set_bit is called with argument
> smp_processor_id.
> Once expanded this set_bit's argument is used in sizeof operations
> and thus 'smp_processor_id', being a macro that expands to a
> function call with potential side effects, generates a violation.

Noticing only now, but applicable also to patch 2: "expands" isn't quite
right, is it? That's true for x86, but apparently not for Arm. Unless I
managed to overlook something there. So perhaps "may expand" instead?

> --- a/xen/common/softirq.c
> +++ b/xen/common/softirq.c
> @@ -139,7 +139,8 @@ void cpu_raise_softirq_batch_finish(void)
>  
>  void raise_softirq(unsigned int nr)
>  {
> -    set_bit(nr, &softirq_pending(smp_processor_id()));
> +    unsigned int cpu = smp_processor_id();
> +    set_bit(nr, &softirq_pending(cpu));
>  }

Nit (style): Blank line between declaration(s) and statement(s) please.

I guess both aspects could be taken care of while committing.

Jan

