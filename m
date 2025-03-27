Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5923A72AF7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928580.1331263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiDJ-0002qf-Kc; Thu, 27 Mar 2025 08:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928580.1331263; Thu, 27 Mar 2025 08:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiDJ-0002oK-HV; Thu, 27 Mar 2025 08:03:45 +0000
Received: by outflank-mailman (input) for mailman id 928580;
 Thu, 27 Mar 2025 08:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiDI-0002oE-3t
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:03:44 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb8b03e-0ae1-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:03:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso6943045e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:03:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6a63esm28932825e9.11.2025.03.27.01.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:03:41 -0700 (PDT)
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
X-Inumbo-ID: ffb8b03e-0ae1-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743062622; x=1743667422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ7r74ntUJHQbXnatsLzeK60kFnWTcDXBLe3i3Ug9xM=;
        b=KY532JfGosrWLpb4oRkFr0hku1GJdsalNKtppIo6zJajgj186F55TyfjWJYcoHgrKk
         Wd3O1D6vk8lN7RzZ3sNdvTYCSQ+CsjVt7jm3rYMJW970L2SS2Xpr0ui4lT1Jpp9qFYcd
         dQUhztLt/CGMEPBVqyekj3GLBvGovifJEiMJqqL2lfGlAS7OLa6boRzmJAIvlLvoMcSb
         sDoS9VfEtuXN9DYelBepni8eyHkbvFF+dtmlZiDshmQfpvmtAZe9wONUVcoMD00AwoUw
         3RHrTutaTXSOYczWJmDNLz8DNMe3W47s6Kzm6jkITHTonp1ltZyLHkGxJNom1plhe0Tq
         z8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062622; x=1743667422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ7r74ntUJHQbXnatsLzeK60kFnWTcDXBLe3i3Ug9xM=;
        b=adcORoZT9eeCUNwI/6B9u/PvlxV2pgGgPnMEW+LOPZQslDRMYp9KoHuZeuJyNhVKrG
         W0I+eQgNxhoQMOg1aE2c7Z6hqFEdBpf91dIb2WQV5pc1yWfA10fd9cuBoz3zKBiGgDl6
         gQJAQDXHbxD5qXTrUhIVQQb8xebdD6/xzTD86I6rcs/e7oP/2NuYzVlHgUJULjPF4UZP
         0Zgex9WuPl8uR1v+v5Mz1HclMfotobIfYBWsN42B2ehAhcdDzw9iCsgQScVXUxxqNb/c
         NfDlDQmY6m4ikjyw+SI1XoDIChR3e0VjNdXwfyNNnRGNeInxjyH3vPR0ibKd53jvwFIi
         6Vng==
X-Forwarded-Encrypted: i=1; AJvYcCWTFZkxIYutEF7Eq9Lc2/eRaEbs1wCY/89T++JRw/LD2L/uEq5VmoQpJ41+Ok27T1REseLCthWCDFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdoVahiJvYqw+t+SCIW0t58lzq+D2fQfxAtTaIqAiSZb9ulQOv
	1pBQ22MOUAjTNMGLd7neE4Mtsp0946XyywkxBpIZIUTWD8yoyhR/YLAPuktFyQ==
X-Gm-Gg: ASbGncv+BRgD2MH4TlQFxlqwBZYTt4otFpRr+4LpgQTKpbx0Pz+KqEY6NC+sRUJVh4+
	sh7032Kz5E5/Fd0eVFGasQxUV35QUeOTUyYbtiNC3lA8kHsTke96mrjRKu/JKdhLB4PUx48ieIq
	30bkZn+/FMZt0arQJ1V0hWBBGVkObq3USS0LfSy/iZ04BslRHQ9Nx3wfPtSYcIdgJYQjYGyyK+M
	xcgTpMmrGry4ZPj0qicfrSv+0b93AVbcdrJ+NmiT87etMsRXZDzbaI7mcrvIPBZD9nvhMRMc8iZ
	e7APYL5eIWaQkCMnW21H5nTWZ5qW4mx5St4hGtdkR7yf5Cxac85QYV3FFfZF8LvNKhUuL7mYZcT
	uk0NFFmBD4wCCIjQ8BbogCoB4RA/UGA==
X-Google-Smtp-Source: AGHT+IFGyIRF85WYLvoobIvV3nTIimptwzQ1+dW05DzHfD4Hmc0uIY78nU0/YRmvKcJzGae1AByxdA==
X-Received: by 2002:a05:600c:35d1:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-43d84f5e757mr17247095e9.1.1743062621781;
        Thu, 27 Mar 2025 01:03:41 -0700 (PDT)
Message-ID: <84903e47-038c-46f5-862a-a0c9623c8125@suse.com>
Date: Thu, 27 Mar 2025 09:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in create_irq()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 01:40, Volodymyr Babchuk wrote:
> While building xen with GCC 14.2.1 with "-fcondition-coverage" option,
> the compiler produces a false positive warning:
> 
>   arch/x86/irq.c: In function ‘create_irq’:
>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>     281 |     ret = init_one_irq_desc(desc);
>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>     269 |     struct irq_desc *desc;
>         |                      ^~~~
>   cc1: all warnings being treated as errors
>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
> 
> While we have signed/unsigned comparison both in "for" loop and in
> "if" statement, this still can't lead to use of uninitialized "desc",
> as either loop will be executed at least once, or the function will
> return early. So this is a clearly false positive warning. Anyways,
> initialize "desc" with NULL to make GCC happy.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Hmm, this puts us in an interesting conflict, I think. Misra, aiui, will ...

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -265,7 +265,7 @@ void __init clear_irq_vector(int irq)
>  int create_irq(nodeid_t node, bool grant_access)
>  {
>      int irq, ret;
> -    struct irq_desc *desc;
> +    struct irq_desc *desc = NULL;

... consider such an assignment useless (and hence potentially confusing)
code. I'm curious what BugsEng folks are going to say here.

Irrespective of that I think such a seemingly unnecessary initializer wants
to come with a justifying comment, e.g.

    struct irq_desc *desc = NULL /* gcc14 with -fcondition-coverage */;

here.

Finally, did you report this to upstream gcc? It's probably too late to
fix in gcc15 (if still present), but it would be nice to have it fixed in
later versions (maybe including a late 14.x).

Jan

