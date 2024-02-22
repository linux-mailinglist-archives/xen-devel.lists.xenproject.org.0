Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241185FBDF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 16:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684466.1064333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAfr-0003r0-2d; Thu, 22 Feb 2024 15:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684466.1064333; Thu, 22 Feb 2024 15:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAfq-0003pM-Vq; Thu, 22 Feb 2024 15:07:46 +0000
Received: by outflank-mailman (input) for mailman id 684466;
 Thu, 22 Feb 2024 15:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdAfq-0003pE-Bc
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 15:07:46 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217aa545-d194-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 16:07:44 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso194634966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 07:07:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hu20-20020a170907a09400b00a3fa3411416sm226522ejc.64.2024.02.22.07.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 07:07:43 -0800 (PST)
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
X-Inumbo-ID: 217aa545-d194-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708614464; x=1709219264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pi53rr+pvqYkR7hrdATKlyfk1Nk3hEqdGpA+XlwjUfU=;
        b=STgB73I/vG5QObMSnnhcsMOQa9ik07PpXtPu6C2wyqi8SHn6dIVbq6UlD/+O2AOQFN
         +Rbk2/7Y7uUHqtpbabZ5QT++b+FcbyEXxXmreseZ/42x3ggFbU6BSml8u6duzh3LBIOe
         wvQafitlL6A3B55RATYjPlgsNvKt4j04EkREqdYLA3vHX8tctBL8KdyinHMKMgghL9bM
         bpq/upqyQD1AtUL44InHYnGYrHfezxUyouES3zsCtkGHXoGX03jIoBQDt2+gWtdiNUdf
         yO18AAKOB/La5CWll+CisobZe0wKhCGEpXev8iJJcZ+repkOmae8ug43nXHCugpNdZGW
         kqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614464; x=1709219264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi53rr+pvqYkR7hrdATKlyfk1Nk3hEqdGpA+XlwjUfU=;
        b=fgfE0iTJx7XvxkJ/MPVofGpQvpSQdrJf8NnMKdKRMWN0hQl8Xqmj/sa4FyQWg6btKV
         /WQd7vVDFOXUWvHXjoj2MMVvJNsVaZRzUTKpnM7F5K5NbhEAZoxFhPGbErrNLJABmmsX
         zdaCl0tXKloNrURtppEsM5ys24ajEs0o5K91E2KzgCaair805pQpH76MmjYl4lcmkzzn
         fLjrpzWdOKQV1PgMX5I2oeI+1EIzNk0i/CILJAPOTkxKm8mMYrNMQFxyQEYU2d5SBmVP
         597xx/PG78yJjcxR3yJrnsJ6NHbcBMjR6C1rREdOcXc6N4uaRB1F8UfllziI5wigHMxn
         VwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlOuVqAol0BeKqxnjaAcjFg7s4ZCOFr4BWfLQs4Uxb06D/2RqO2sp1L+b1Q3jD1xWmFc2eRBMoGUKi272uIQViHoa/87Wdk7yEfM1cnbQ=
X-Gm-Message-State: AOJu0YzSGCjn1SylRayJ+9gLoLLUdM9ok9retVCgzXE6pl2sEFdsS1kJ
	Qkx8WmA85gpo7Ey/YRSH5EHBTxnnGnSThUKCv4EeKUwCFhMl5ohxtRevKgkmIg==
X-Google-Smtp-Source: AGHT+IHNDodOaxePkkFBzLSd1iIJqD0urWy7U9x0QlyKI6dTx0wCe/KRDswxBXRJUyIi63mA0XL9pQ==
X-Received: by 2002:a17:906:1316:b0:a3f:2ffd:c67e with SMTP id w22-20020a170906131600b00a3f2ffdc67emr2349133ejb.15.1708614463730;
        Thu, 22 Feb 2024 07:07:43 -0800 (PST)
Message-ID: <c376a5e2-c9ae-4df5-ae2c-23b9bf299903@suse.com>
Date: Thu, 22 Feb 2024 16:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
 <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
 <1743b4248d30a4e8b68a150c25724caa@bugseng.com>
 <2ff52df443fc080875fd05614d89764d@bugseng.com>
 <4b121e48-9541-4b53-8352-939c904f4f1c@suse.com>
 <be36b86a08f7573b93edc4c03aff93ef@bugseng.com>
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
In-Reply-To: <be36b86a08f7573b93edc4c03aff93ef@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.02.2024 15:43, Nicola Vetrini wrote:
>>> In passing it should be noted that the header ordering in
>>> x86/alternative.c is not the one usually prescribed, so that may be
>>> taken care of as well.
>>
>> I'm afraid I don't understand this remark.
>>
> 
> I just meant to say that this
> 
> #include <xen/delay.h>
> #include <xen/types.h>
> #include <asm/apic.h>
> #include <asm/endbr.h>
> #include <asm/processor.h>
> #include <asm/alternative.h>
> #include <xen/init.h>
> #include <asm/setup.h>
> #include <asm/system.h>
> #include <asm/traps.h>
> #include <asm/nmi.h>
> #include <asm/nops.h>
> #include <xen/livepatch.h>
> 
> is not the usual order of xen/*.h then asm/*.h and there is no comment 
> justifying that ordering.

Well, you'll find such in many other places. It hasn't been for that long
that we've been trying to get #include-s into a more predictable shape.

> So in the process of including asm/flushtlb.h 
> here the inclusion order can be tidied up (or also indipendently), 
> unless there is some reason I'm missing that disallows it.

Independently, if at all possible, would be better. Unless of course you
need to touch almost all of that block anyway.

Jan

