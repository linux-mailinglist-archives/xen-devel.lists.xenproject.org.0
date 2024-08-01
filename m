Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16878944CBB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 15:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769736.1180631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVag-0005QX-8P; Thu, 01 Aug 2024 13:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769736.1180631; Thu, 01 Aug 2024 13:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVag-0005Np-5U; Thu, 01 Aug 2024 13:11:34 +0000
Received: by outflank-mailman (input) for mailman id 769736;
 Thu, 01 Aug 2024 13:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZVae-0005Nh-Se
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 13:11:32 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920dd306-5007-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 15:11:31 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52f01993090so10330401e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 06:11:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3a95sm10056078a12.61.2024.08.01.06.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 06:11:30 -0700 (PDT)
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
X-Inumbo-ID: 920dd306-5007-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722517891; x=1723122691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tPaGhsM7MflGvFGh6jb6p9SngIPeCMIN8hRaBgZRVEg=;
        b=KUcHXlep12RhqnJFQXaNoMC0UP4/jHeb9eWGVKbjBSe7B/udiTK7Kf0DSqIbgtixWW
         W+BjzN8fEpLHil2Ih6whksEjX4f03UQsk5W8SeE3FuS/znH1JP2AweB77Az9OT4lbxY8
         dgDgs56Mumo29NwUDj/PuP0JBYQRXfZAvLwZrEFbuiFh28O5IFgVnLRVa3UclOAcvYLQ
         RZvTyaEdstBlLD950bBvH7lm4KJWvbpccM1OWBYsXU/znEALND3FD+gw2mugqp/9+iIA
         z5X7QXQObAO3uG9DjMEF3TUQE9WbbpUDg+Cap40tin0Wb16fzh6HcSGdtsqnV/VrLpYk
         fs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517891; x=1723122691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPaGhsM7MflGvFGh6jb6p9SngIPeCMIN8hRaBgZRVEg=;
        b=ZPS+JlURozAjItFW33HrN8w5q5850DbHpiLvFamY0tv+lUsP8vqCAq/IZTeCyyxaN7
         vzyX/VXskEexwuPE3yJ21BeavhA50QId+F0lgEMEvJ0k5pcAZcECgrisFyBFCX8ALAJw
         YwaGWkaoUzEgRjw9oVcCCOpl1EBVKBDF/rAFG7q2rHZQ59m0wzOqviwb8arzvJ4DX9P5
         PSNQLVv4eCHQEiQyReO4thAzhkNUBE/TDaYRQNplsiDXSRqhPBWeDgDuXFLp9Y2nGTRv
         Yja2Zs682uVrFHEs7JHdEYArQN0LGyiayZ8jol9v2q6FlkW06YR9x1hzpxEw4BFSnpTy
         +UNw==
X-Forwarded-Encrypted: i=1; AJvYcCXjZCZveRp1BXgGSIHuHs03KwGoWE2T8Gpe278m6vkF5aBzK0DXevUagMTDCOpeSBWFnQe9jZoMi7u0v9KNzzySbqUeSVTUGrMFqBojobI=
X-Gm-Message-State: AOJu0YxS+99Bbiq3J/6EylRILF+oT4ErdTQdcniI9AeX14Lah3BnhV5v
	kmGYsuiAB0syfwuh/cdoZcEkMe4Qc7gK+sqSaqVlrmWZh/gpquNDHmbLy1adEQ==
X-Google-Smtp-Source: AGHT+IGki6ui5oE42OlBASHVAr0OyYh9s+++s79F/9t6E68LjnUvPzAaNhR3wvTRTnzsLW9RGKA1Qw==
X-Received: by 2002:ac2:434f:0:b0:52e:f77b:bb58 with SMTP id 2adb3069b0e04-530b61c8df8mr1509318e87.36.1722517891026;
        Thu, 01 Aug 2024 06:11:31 -0700 (PDT)
Message-ID: <d2b95ad1-fc61-4c86-b0d7-530720e1e483@suse.com>
Date: Thu, 1 Aug 2024 15:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqtsQwZNyFzflDQt@macbook>
 <ec95b413-519d-46a4-be41-ebb6a375612a@suse.com> <ZquCatoi50cNI3qR@macbook>
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
In-Reply-To: <ZquCatoi50cNI3qR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 14:41, Roger Pau Monné wrote:
> On Thu, Aug 01, 2024 at 01:36:16PM +0200, Jan Beulich wrote:
>> On 01.08.2024 13:06, Roger Pau Monné wrote:
>>> On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
>>>> Remaining comment @Daniel P . Smith:
>>>> +        ret = -EPERM;
>>>> +        if ( !irq_access_permitted(currd, irq) ||
>>>> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
>>>> +            goto gsi_permission_out;
>>>> Is it okay to issue the XSM check using the translated value, 
>>>> not the one that was originally passed into the hypercall?
>>>
>>> FWIW, I don't see the GSI -> IRQ translation much different from the
>>> pIRQ -> IRQ translation done by pirq_access_permitted(), which is also
>>> ahead of the xsm check.
>>
>> The question (which I raised originally) isn't an ordering one, but an
>> auditing one: Is it okay to pass the XSM hook a value that isn't what
>> was passed into the hypercall?
> 
> But that's also the case with the current XEN_DOMCTL_irq_permission
> implementation?  As the hypercall parameter is a pIRQ, and the XSM
> check is done against the translated IRQ obtained from the pIRQ
> parameter.

In a way you're right, but in a way there's also a meaningful difference:
There we translate between internal numbering spaces. Here we first
translate a quantity in a numbering space superimposed onto us to an
internal representation. Flask, otoh, in such a situation may prefer to
see the external representation of the resource.

Jan

