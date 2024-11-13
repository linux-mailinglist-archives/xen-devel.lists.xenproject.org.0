Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE09C6BD4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835209.1251052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9z9-0004hl-Bt; Wed, 13 Nov 2024 09:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835209.1251052; Wed, 13 Nov 2024 09:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9z9-0004fD-8E; Wed, 13 Nov 2024 09:48:27 +0000
Received: by outflank-mailman (input) for mailman id 835209;
 Wed, 13 Nov 2024 09:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tB9z8-0004f7-9u
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:48:26 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c31ae2e-a1a4-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:48:23 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so4438416f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:48:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed99790csm18008641f8f.46.2024.11.13.01.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 01:48:22 -0800 (PST)
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
X-Inumbo-ID: 6c31ae2e-a1a4-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZjMzFhZTJlLWExYTQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkxMzAzLjYyNDY5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731491303; x=1732096103; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0y3CFETTl41FaY0WfsIq+6Ad3iVxYujuidi3KjQN4oQ=;
        b=EMtaOeA/yOG+G0fk36cb0uTMmQRYFCTWRKChPMdpS0coAeztdBIXFMIMEeVs+kJhCJ
         tL68RHZbsznNh9XJchJSaVuREw0/dlAuYzXziNfrybqDo5X6wP4PKvlm+B30icAAG05T
         6uK1AfiP2kDm1WXnYDOI3e4kzu25l6ydJUSm2a+GArC8qMIS18wZOS0+xmZ6gTPfRzW0
         QakmAU64NB8FJOLTGEBk4P/txtVxxGrvtcOXRrRVY7IClHaPinv1ulJXDus2xkZ08TzP
         I58OB9Ga9EAGKKqmhj3fGrjUjEFNS61tiMTWRlvE9Jg3POlwX2ZH7OE0hFsWfTDV0V6y
         wXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491303; x=1732096103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y3CFETTl41FaY0WfsIq+6Ad3iVxYujuidi3KjQN4oQ=;
        b=QrRYKhHD6XTHH0IkX+rTCwr8Yi/6UwCgUK63SWKaMOE/Lt597z2MmqzVbYICo72Yyc
         en12c8vkRIzrYsmmQTEJN9Jh6j3xneZ4Y4fQ9cNTmjlmwCWq1Fks7oOdi1F65wmztnnt
         1MerB0QySa0aAyTRFaOD5BuJVhCFjvA1lhNJaw7XEv1OlGDctu8GwEV/QsGzDqnAfupn
         jbDICeptnjsqXLXFJa9Mj5FbKC6SURDu5nszX8VRG/fogFwzocZeplxdzkoAJ+JMDtRl
         9tCbxNIzqgoq/7EhT8ljyCUQvKE/3dTAXQm649pGm72/EeyPtXPqcmHDqQSvytdPOIor
         skmA==
X-Forwarded-Encrypted: i=1; AJvYcCUS1zqh4sLPJVjeBsdAtFfPp3lztm71nl0e4hEEVcHk7uuZ1IiADEIqI6x55TF9gbV/HtJb/kwXh/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDyc1F6xMjULgobjQfJ3hZfClgeTzLVAicV0WrRONumeY38+WS
	ytToSISvDXRne6VkXRjSLPP0MFpPz0RbKAy1JPyvHGKB7OdvXQgG8aYk5jow9g==
X-Google-Smtp-Source: AGHT+IELV4KJC7QGrObSBB7sc8eQFKYD7AvJKHiAwygI7KSuU9vTjL2afv0BjGOzp821noycZMsc/A==
X-Received: by 2002:a5d:6daf:0:b0:381:f0e2:8406 with SMTP id ffacd0b85a97d-3820df5bd05mr1730724f8f.12.1731491302858;
        Wed, 13 Nov 2024 01:48:22 -0800 (PST)
Message-ID: <14df2192-9736-4c1c-8aac-2853467ea330@suse.com>
Date: Wed, 13 Nov 2024 10:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [August-October]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Kelly Choi <kelly.choi@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
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
In-Reply-To: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 17:16, Oleksii Kurochko wrote:
> === x86 ===
> 
> *  Expose consistent topology to guests (v7)
>   -  Alejandro Vallejo
>   -
> https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
> 
> *  Boot modules for Hyperlaunch (v8)
>   -  Daniel P. Smith
>   -
> https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@apertussolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e
> 
> *  x86/mm: miscellaneous fixes (v2)
>   -  Roger Pau Monne
>   -
> https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34239b793501c6246c85c4b00e52f9c439ac0
> 
> *  x86/ucode: Simplify/fix loading paths further (v1)
>   -  Andrew Cooper
>   -
> https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.cooper3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1
> 
> *  Address Space Isolation FPU preparations (v2)
>   -  Alejandro Vallejo
>   -
> https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
> 
> *  Fix module-handling use-after-free's (v2)
>   -  Andrew Cooper

Wasn't this committed already?

> https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
> 
> *  Reuse 32 bit C code more safely (v4)
>   -  Frediano Ziglio

Same question here.

> https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
> 
> *  x86/alternatives: Adjust all insn-relative fields (v2)
>   -  Andrew Cooper
>   -
> https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> 
> *  x86: address violations of MISRA C Rule 16.3 (v1)
>   -  Federico Serafini
>   -
> https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.serafini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6
> 
> *  Support device passthrough when dom0 is PVH on Xen (v16)
>   -  Jiqian Chen
>   -
> https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
> 
> *  x86emul: misc additions (v5)
>   -  Jan Beulich
>   -
> https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e
> 
> *  x86/HVM: drop stdvga caching mode (v2)
>   -  Jan Beulich

This, after having been committed, even became the subject of an XSA that
was published earlier this week.

> https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
> 
> *  x86/HVM: emulation (MMIO) improvements (v1)
>   -  Jan Beulich
>   -
> https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7

More stuff missing that was already intended for 4.19: AMX, AVX10, and
use of ERMS in Xen, to name just a few.

Jan

