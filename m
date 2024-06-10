Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA79020A2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737213.1143414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdUE-0003Ic-Si; Mon, 10 Jun 2024 11:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737213.1143414; Mon, 10 Jun 2024 11:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdUE-0003Fg-Nh; Mon, 10 Jun 2024 11:46:54 +0000
Received: by outflank-mailman (input) for mailman id 737213;
 Mon, 10 Jun 2024 11:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdUD-0003FZ-7C
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:46:53 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f9fc5ce-271f-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 13:46:50 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so221960666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:46:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm348309366b.20.2024.06.10.04.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:46:49 -0700 (PDT)
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
X-Inumbo-ID: 1f9fc5ce-271f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718020009; x=1718624809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7EGkeVwdFSfeDMmh69UV5bstx3D2U4/JgPiOn88t3rg=;
        b=IPSjWBF4/U/mAADgvlItfVRCteXvyZJTamr9KGdFDQPSGNHTszQbnVX/DoYucYPfva
         Yd0qfQQuiA+uWc0uUsCqtNGJY7bS5DC3Nole/RG3lAauhqDSuIBT2bBDcTvtNAHAhkj8
         QpnYIhptVDDR/mlQEPbQkiIvkP+4if8zHmqfBMQ2tzRUsI5dLBSY2La6C5ZQJEAnbu9r
         8OcUrhfZmbEMGYViQa9FGGpaSXWVqAbdw8vEECcJIHdgMl6xvR9RuiscL0whQE8lr8Bv
         2l07cxA+K+jnlCBCyguoGEDWAY8TNSubou7BWgiPp84ioZiW4DbkwETx7J9psrxMQCP0
         RBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020009; x=1718624809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EGkeVwdFSfeDMmh69UV5bstx3D2U4/JgPiOn88t3rg=;
        b=IObisdGwnkTE1LGNlxRy+4/Yr5CTsviYxgp9tVmOklZ3Zm3lLZcg/meiLfa4dLlTK/
         +b6w4BeHWHo9zLkukntoXRS5wB3OZIIXmJu8eT185wlHn1wbCafbKVCQtEAeCRGMKzpY
         A4+aTnZzRrBaA/tL7Yw3AsCRpnmzL9PedCk44wY9eUyP8SLgu9uWi2Bs630moUc1rh0q
         k5DPwunvJLGdQenz0ELmeRvrg5RwagPomcNpAiwwMK2rf2N68gn9n/SV0IDgmco7htR7
         XlgKkoZAjWGqulhaxwdTOOgbh7QkNdsAb+KkuPk69oiTWywMabfZyLqQQQyxkxXweW+C
         m7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb3O8zXeOsD08NYglwVbDct6CytMaoNcO+xQekrfviBQKWFQO8urSnJGH2HBNLmKJO1mow7r4sHumdkSsfmq2nrpEw3W9Mzb/vfGjxNnw=
X-Gm-Message-State: AOJu0YzYVn8zSIrGi3zwMD1WF0TdmOUsQreJFon/8PhpT8FdUSlAsLpz
	n4C7vH7fIslI1u3rjc9KsLsIISyFyk2xLs1K/MijSGFdp8Q+m43gLGB4MAOzN4RbDxjRZPMtpQs
	=
X-Google-Smtp-Source: AGHT+IGJYEwI85FbXJPs34RJV7jLkCs3aMVxuWieFYT1JDMYNlQCcoAatbZK8ybHnIQA1SLl6H01dA==
X-Received: by 2002:a17:907:2da7:b0:a6f:1378:1325 with SMTP id a640c23a62f3a-a6f1378150amr324147266b.9.1718020009456;
        Mon, 10 Jun 2024 04:46:49 -0700 (PDT)
Message-ID: <8a2b4ac5-d725-46d4-92ac-8e06258b3776@suse.com>
Date: Mon, 10 Jun 2024 13:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 08/16] x86/p2m: guard EPT functions with using_vmx
 macro
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <52c64ffd589f289fda271422fee1e957f94aac6e.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <52c64ffd589f289fda271422fee1e957f94aac6e.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:22, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Replace cpu_has_vmx check with using_vmx, so that presence of functions
> ept_p2m_init() and ept_p2m_uninit() in the build gets checked.
> Since currently Intel EPT implementation depends on CONFIG_VMX config option,
> when VMX is off these functions are unavailable.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

The actual code change is okay, so
Acked-by: Jan Beulich <jbeulich@suse.com>
I don't, however, understand what "gets checked" in the description is meant
to mean. Elsewhere the wording was more towards the actual goal, I think.

Jan

> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
>      p2m_pod_init(p2m);
>      p2m_nestedp2m_init(p2m);
>  
> -    if ( hap_enabled(d) && cpu_has_vmx )
> +    if ( hap_enabled(d) && using_vmx )
>          ret = ept_p2m_init(p2m);
>      else
>          p2m_pt_init(p2m);
> @@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
>  void p2m_free_one(struct p2m_domain *p2m)
>  {
>      p2m_free_logdirty(p2m);
> -    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
> +    if ( hap_enabled(p2m->domain) && using_vmx )
>          ept_p2m_uninit(p2m);
>      free_cpumask_var(p2m->dirty_cpumask);
>      xfree(p2m);


