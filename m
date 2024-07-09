Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E292B0F6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755923.1164455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR58T-0002Lw-0c; Tue, 09 Jul 2024 07:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755923.1164455; Tue, 09 Jul 2024 07:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR58S-0002JJ-Td; Tue, 09 Jul 2024 07:19:36 +0000
Received: by outflank-mailman (input) for mailman id 755923;
 Tue, 09 Jul 2024 07:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR58R-0002JD-N9
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:19:35 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97195975-3dc3-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:19:33 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso13124581fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:19:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99aa61e30sm9276845a91.45.2024.07.09.00.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:19:32 -0700 (PDT)
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
X-Inumbo-ID: 97195975-3dc3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720509573; x=1721114373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4H9wGFIuYR7jB8hkzA3fInmn8enjWh99zCNGhiek+wU=;
        b=GDy+mME9jfXKdkz2IUu6WKc43gVRo1tplC24rmIkfzp55IVLww4fJ0yzWlGJ3CIBya
         kD4mYmrEzuiWaCYHNv2yVjgjC89NeGxBi34hC9qBSC2eUHcVAZwTfu2zKAf/OHKzN9J7
         ymd4kNV3CfpJWXm0/a3AcvYf1oIX85+yB0uu+22I5fiU5MzcyOuT5exI3sjOIlhxYzvE
         rrsCIwWdLRjq1QvmFGSU3hlpKfmchoTHpiWHdaKhmhT8rnB4X12sBKPINtkIrbdtiGzC
         vn/LZ8X+OW9x58Bbfm5kCey92hrM3FBje6ktbqmNIfyZfqo9sSBsc1v4vEoXEB3lXHtC
         5xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509573; x=1721114373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H9wGFIuYR7jB8hkzA3fInmn8enjWh99zCNGhiek+wU=;
        b=whuzloiAQru0h7hw3bZii19TI7l/SWOR0ohERuw2vAgzP0h+MqtEubprBzuIKaMdS0
         wjRur4k5NpjizVQKc+UGZ4lXuQqiOSz6oMx/16e+A8U0hgVECNpfL+7xbUJPdsH0q1Kn
         4IGQIPKQxvlHIwwunCiotDx5HtzhodZF1DpdP3sttnVXxN/cIvW/2qlrdxRKCzVDNEfO
         dfbNQMRA8oNKlEIpBfabt1/lUqWobZ89b9wBF+Q+01szR8GmPYX9XCO5Q0Per3C4pSN5
         xK+xztGuMzdWQA0CgRFaKVRdZ9fbE44QS6M/1m8W1+zXObD970n7s/Cd28IZhVhR4vks
         jJaA==
X-Forwarded-Encrypted: i=1; AJvYcCWnb26TnuZoK6++h/rZ4caGPxKckhr+O+IpdCYkqnwjjrmG//M0kV8nFSZPuytWuwcPB9033A15HOUWslJyYuRzobfxUn2aFlPsFo4DhVM=
X-Gm-Message-State: AOJu0Yyc1pL1mBrwyC/Kqwo1GxK4fK4reWsezqKTRHZ28oUzLHVBh0+r
	mrmLtdPPkHnz1lEV95QxsaxTtLC4sPynnjufD6ljihvpYwVZlk6qEgnOJDGhxQ==
X-Google-Smtp-Source: AGHT+IFf7w3BWNp+P9IhAYXBr2dnemB6ko9eDe+AUeiin2hJ95y8qgQpO+E+E8y/hcxw8WvaZbxl8Q==
X-Received: by 2002:a2e:8086:0:b0:2eb:fc08:5d83 with SMTP id 38308e7fff4ca-2eeb31972f0mr11118281fa.44.1720509573070;
        Tue, 09 Jul 2024 00:19:33 -0700 (PDT)
Message-ID: <c2dbe72d-130e-4bdc-8331-d87ce1588a85@suse.com>
Date: Tue, 9 Jul 2024 09:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 06/14] x86/p2m: guard EPT functions with
 using_vmx() check
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <d51ae897890ec01de70c44d15450e888f84d34c4.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d51ae897890ec01de70c44d15450e888f84d34c4.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:56, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Replace cpu_has_vmx check with using_vmx(), so that we do check if functions
> ept_p2m_init() and ept_p2m_uninit() can be called.

I still find this an odd way of putting it. Source code ...

> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
>      p2m_pod_init(p2m);
>      p2m_nestedp2m_init(p2m);
>  
> -    if ( hap_enabled(d) && cpu_has_vmx )
> +    if ( hap_enabled(d) && using_vmx() )
>          ret = ept_p2m_init(p2m);
>      else
>          p2m_pt_init(p2m);
> @@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
>  void p2m_free_one(struct p2m_domain *p2m)
>  {
>      p2m_free_logdirty(p2m);
> -    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
> +    if ( hap_enabled(p2m->domain) && using_vmx() )
>          ept_p2m_uninit(p2m);
>      free_cpumask_var(p2m->dirty_cpumask);
>      xfree(p2m);

... is very clear about them being called. What you're after is the compiler
DCEing the calls in generated code.

Jan

