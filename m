Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ABF9E3823
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 12:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848506.1263366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIn7x-0003Hk-Vc; Wed, 04 Dec 2024 11:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848506.1263366; Wed, 04 Dec 2024 11:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIn7x-0003FZ-Sw; Wed, 04 Dec 2024 11:01:05 +0000
Received: by outflank-mailman (input) for mailman id 848506;
 Wed, 04 Dec 2024 11:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIn7x-0003FT-AF
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 11:01:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d23430e-b22f-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 12:01:02 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a9f2da82so58500605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 03:01:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5273199sm20553715e9.14.2024.12.04.03.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 03:01:01 -0800 (PST)
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
X-Inumbo-ID: 0d23430e-b22f-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733310062; x=1733914862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K6EPxLBgH2uOPc1YMRH/qANrWmud5mKlT8E7LujwulM=;
        b=Ty9++cvOLd1VVmGyAVh/YbEpVYp0iIgNNL1gsjkGLLYBcsxzZmVwnSNe1Ld9xZuwIg
         FOM5CPxeSeYVzl+jc4nTg3n4bXLRnHmf2QbpWCS+DZWWCmNRJhBH+AfZ+NcypAUw2Xfl
         ThM/EGcfIQoi0ZCEeCOXXeAr7CQhbPO3af7O1Sonct/5bfE4ElN71B6dxCH23xgpN4rU
         OHQL42ngKhMnRgmNXmGlKLPyyFYl/Jn5i37NUBbcMy7/zc+mwqAzOAGY8ZAYkHYyA0sS
         unzZUbkMAqUFaNrmlSYF1q3OnNeIXGe/+JTHOGai8fZR0R9q+oLCLWVSROcOqxM5ksxs
         EImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310062; x=1733914862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6EPxLBgH2uOPc1YMRH/qANrWmud5mKlT8E7LujwulM=;
        b=VhQCCZ7PLLPSsjtq/FaV+8fn6zxWWri/pqWJH1CNqFgTGYIATw7XfZiTIQMwwFBoWC
         6puzeOUF9aC7MkDIs9v3XpzX1lv6sum9CCGVQo9dDOTpP9FgUCtBmrK+jIE9BZ1snGyJ
         zBIYFFNJYe6bYGSI8odqvzFs33olW2X7zSWZHVHBE60vSw44bTw3OgjENbpAcwuWKUaz
         jvd/571nPg+HJtfR8WJgM6hZ2fAuWWIuD2EUM7m/f2metKDCDzp5cMA78g51Mlej5X/k
         Bq3jm6viOOBBuwNzIKxfG4zraufuEfmhXxcs5s62EiX83eNLF40v3TtCSRqsoH7vT42P
         U98g==
X-Forwarded-Encrypted: i=1; AJvYcCVNP/DpYPK3Ak38L8ALz3mF+BDPHY2EL7LGFCbVo77WizgAa7wtvZJ6LDa9ZzaMlIvuYcdTt+8SZfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxxksqg+ibFUp/TmNMMZUH9T0XZ7+lVjZ7PXtCezZPpBhmAvQkD
	lqt4L+POD7Mart59JmALB7aUPbu/dRYAjJtCbtJ6pr8C+0B5th6lvq6tYkwv1B4LuOuxIc7N6IQ
	=
X-Gm-Gg: ASbGncs//vFIo+NEX2b751AlI328oLZJRHeiPZzMVY02sh4B7RnJ/t/WuvXlIY7iv+6
	s44rpTSWOPQzQ8wzyEJfkZV18Vd/V+Ptu7+pUXRKpTFjNm2c0/XGV0BR7uXjZGYmaOBr2oMD4kJ
	uSJuQAQ6cULg8sQT53cMiza63N2CdFZBhXSt3oPkA9SxxXHKHNZeO4mwT/sKVnbT7ZyzbMJaatT
	GWWPmkAgPYS2PdPn5MbxusDZJ2CiyW+YPjLgCcOCzIuE4x0o2dw3QORulWUJhtpugpG8VkG0/Yf
	7bL7MVXugUSh7NzV9j+iaLahBqprBHq2wtk=
X-Google-Smtp-Source: AGHT+IHArLbFC3F5WAAgEgxRisITlttOdOuzaGtekx0ZU33kmpUTEX2/XDfxliwF2yImnYXNpWF1sQ==
X-Received: by 2002:a05:600c:524d:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434d09ce368mr53712405e9.16.1733310062044;
        Wed, 04 Dec 2024 03:01:02 -0800 (PST)
Message-ID: <3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com>
Date: Wed, 4 Dec 2024 12:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [November]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, kelly.choi@cloud.com,
 xen-devel@lists.xenproject.org
References: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2024 11:20, Oleksii Kurochko wrote:
> === x86 === 
> 
> *  Expose consistent topology to guests (v7)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
> 
> *  Boot modules for Hyperlaunch (v8 -> v9)
>   -  Daniel P. Smith
>   -  https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/
> 
> *  x86/mm: miscellaneous fixes (v2 -> v3)
>   -  Roger Pau Monne
>   -  https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/

This went in, didn't it?

> *  Address Space Isolation FPU preparations (v2)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
> 
> *  x86/alternatives: Adjust all insn-relative fields (v2)
>   -  Andrew Cooper
>   -  https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> 
> *  Support device passthrough when dom0 is PVH on Xen (v16)
>   -  Jiqian Chen
>   -  https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526

Some of this went in too, I think?

> *  x86emul: misc additions (v5 -> v7)
>   -  Jan Beulich
>   -  https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/
> 
> *  x86/HVM: emulation (MMIO) improvements (v2)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/
> 
> *  x86: support AVX10.1 (v2)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/bcfea345-57c1-43d9-82b3-240b685486cc@suse.com/

In v2 the title had changed to "x86: support AVX10", dealing with a first
aspect of AVX10.2 as well. I have long completed AVX10.2 work, yet there
was little reason to re-post without having got any feedback.

> *  APX support (v?)
>   -  Jan Beulich
>   -  ?

I think you want to remove this from the list. While I have completed work
there, I'm not fancying re-basing ahead of the AVX10 work, and hence that
needs to go in first anyway. Which seems unlikely enough at this point, for
4.20.

> *  VT-d: SATC handling; ATS: tidying (v2)
>   -  Jan Beulich
>   -  https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/
> 
> *  x86: parallelize AP bring-up during boot (v1)
>   -  Krystian Hebel
>   -  https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
> 
> *  x86: memcpy() / memset() (non-)ERMS flavors plus (v3)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/

Isn't this the same as ...

> *  x86/spec-ctrl: IBPB improvements (v4)
>   -  Jan Beulich
>   -  https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/
> 
> *  Move some boot code from assembly to C (v2)
>   -  Frediano Ziglio
>   -  https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/
> 
> *  Hyperlaunch device tree for dom0 (v1)
>   -  Daniel P. Smith
>   -  https://patchew.org/Xen/20241123182044.30687-1-dpsmith@apertussolutions.com/
> 
> *  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
>   -  Jan Beulich
>   -  https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/

... this?

> *  amd-pstate CPU Performance Scaling Driver (v1)
>   -  Penny Zheng
>   -  https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/

This series was posted only this week, and upon asking it was clarified that
it's indeed not aiming at 4.20.

Jan

