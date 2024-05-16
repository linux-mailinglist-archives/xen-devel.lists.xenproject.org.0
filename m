Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4798C7411
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722955.1127371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xh1-0005Kg-NU; Thu, 16 May 2024 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722955.1127371; Thu, 16 May 2024 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xh1-0005J4-KM; Thu, 16 May 2024 09:46:31 +0000
Received: by outflank-mailman (input) for mailman id 722955;
 Thu, 16 May 2024 09:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Xh0-0005Iy-EO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:46:30 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5fd056-1369-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 11:46:29 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5a5cce2ce6so248364966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:46:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a7b53fc8fsm368333366b.38.2024.05.16.02.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:46:28 -0700 (PDT)
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
X-Inumbo-ID: 2b5fd056-1369-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715852789; x=1716457589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uoB7/keanyFaN2lwuhb3jZv9pDHbUfKzN3oRLYa1Wtk=;
        b=HJ1Df1RxZ7Uzd5gJmntOzRuov6Z0NEAfaT1dMv2JP535NNFxF2mveXvdWzEASm4Kuz
         Jcua36w9CMKVFX4bcStrrB0Sb1Cy5F4obgvUWN8P9irhelQJ8eZuUvr94ziy3Uty4t0Y
         mR0w9BYNf81p1l1uL38nIVvE3OCcQZvGQ+gbHkqQ1WnRj6BS5exg/FMvNVDghaoklzlE
         aqipiorcKrFdaLknyD4C8wsCI7inuDUgaltfPIlhS76vTpGYSsWNAHF4l7UJJ2VwNCpS
         BLyj+tPbtLFAIz9C6ofb7adrH2EafouvsYa7RmPi+VzWxVSG5BPQUEVaYqJUeNQv+DK/
         JeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715852789; x=1716457589;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoB7/keanyFaN2lwuhb3jZv9pDHbUfKzN3oRLYa1Wtk=;
        b=Bvnq6csnFqRGPw4sNVVTDRCuO7YppbkowTBZAcafR6uFoM25q/A9dIswPNvTMgs2m2
         lNu3c0a57DbqQOk0U7sUbm6yH1LGz993hcWVrmQg19VADwHncnY8LZtQFwrg7vxoOcCz
         Ic8Wb80/nNVPkjj+EwHArIuQyztSKRmvuGhrZYYSjsSd85VAl+bhyfnckqLqIJBK5rZl
         pF770Tg0CYQqOo4ZVRCCFXng8Cwen0/mIDhdsHePVrfDaUFgF9/BbBpisXyVsYEGITC6
         l/wwlfEjeQvmnEjSq8P4XWYQEb+APTJ4ODl3Q+kEQpHE9ImzDmiSHNOvSP4mNz5Tnary
         Bovw==
X-Forwarded-Encrypted: i=1; AJvYcCVaUANYZb9fOoWWm1+2Q8pZz7S1Zpv83Q3/wGAsMjhtGvm0FRybKJWL4f20lsm6h/vhnKi3HLB2SEiaUwh5/KxH6ZVuAITqAGyWWUpQr10=
X-Gm-Message-State: AOJu0Yyg4Kuu+DMZUAcNN+aY5RCevWNgzQy9oaVUpD15JR2PggrYGmt3
	OcMTcH4+w4gerWym52AJ/8HfQwSyBH5qXvOgMBSidUfYhSKEgwEAv9y7REXWiQ==
X-Google-Smtp-Source: AGHT+IFC/jODb1+ATe6fbHrsnVq5ZDtKBMYxaJ1At2gBM6gvD6DL7eiTSCgz50kPO16jKNf9T13rIg==
X-Received: by 2002:a17:906:b79a:b0:a59:aa69:9790 with SMTP id a640c23a62f3a-a5a2d54c87fmr1143782366b.8.1715852788813;
        Thu, 16 May 2024 02:46:28 -0700 (PDT)
Message-ID: <ea51dc26-e098-457f-a44c-262742b317d5@suse.com>
Date: Thu, 16 May 2024 11:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/6] x86/MCE: add default switch case in
 init_nonfatal_mce_checker()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <01aad263ad60f37ed74138b5abf2733361bb7d25.1715673586.git.Sergiy_Kibrik@epam.com>
 <7cffa5fc-7e23-4acf-98c3-56929025bbd9@suse.com>
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
In-Reply-To: <7cffa5fc-7e23-4acf-98c3-56929025bbd9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 11:44, Jan Beulich wrote:
> On 14.05.2024 10:26, Sergiy Kibrik wrote:
>> The default switch case block is likely wanted here, to handle situation
>> e.g. of unexpected c->x86_vendor value -- then no mcheck init is done, but
>> misleading message still gets logged anyway.
> 
> With "likely" dropped I'm okay with this as far as the addition of the default
> label goes. However, ...
> 
>> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
>> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
>> @@ -29,9 +29,13 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>>  		amd_nonfatal_mcheck_init(c);
>>  		break;
>> +
>>  	case X86_VENDOR_INTEL:
>>  		intel_nonfatal_mcheck_init(c);
>>  		break;
>> +
>> +	default:
>> +		return -ENODEV;
>>  	}
>>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>>  	return 0;
> 
> ... converting this to an error return still isn't justified. On one hand it's
> benign because we still don't check return values from initcalls. Yet otoh it
> isn't really an error, is it?

I realize earlier in the function there are error returns, too. I question at
least the former of them as well. And the latter shouldn't be an error at least
when the vendor isn't going to be handled in the switch().

Jan

