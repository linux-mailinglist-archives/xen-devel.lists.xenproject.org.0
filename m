Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A4A95ECF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 09:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961724.1353065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77eB-0000Sm-NM; Tue, 22 Apr 2025 07:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961724.1353065; Tue, 22 Apr 2025 07:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77eB-0000Pe-KN; Tue, 22 Apr 2025 07:02:23 +0000
Received: by outflank-mailman (input) for mailman id 961724;
 Tue, 22 Apr 2025 07:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u77eA-0000PY-8M
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 07:02:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6ea55bb-1f47-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 09:02:12 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so23014755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 00:02:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6dfe4esm159911805e9.33.2025.04.22.00.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:02:11 -0700 (PDT)
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
X-Inumbo-ID: b6ea55bb-1f47-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745305331; x=1745910131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7CHFRSyu8dPjSYeLexPNX3I4OBr9SDzB58c4i0VyPDI=;
        b=QYE9xSR2UjIzOPmUJ9R3jncjZJaW8gp09KBfMot5y3GiX9flTGNmwwSR7vc9cW7FGv
         gs1Are6MhUiVlQENiJRsH8rZxqplaxugSVYChA6W0GzubZt/cUbQdsvIhI2lRrqlpBPv
         B5+oVytrb2/2IOS1Rnfe0Lsbrhv1ClqO03YgkCM7apfR7I0yKtdm4k0oAGL7HbhAjiYc
         ehM5ghzFxk1SI+GFGSUqkzxwMSjgPGhjTlNNhMoA6nNi3eIX8wE/epw67czhVVxgcPGQ
         QM/IfipLjM+EHipGI3EUqEiS7u3VsyfBq83JwTorxX333JXWCc9gUlL1CviD37w9LdhJ
         dvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305331; x=1745910131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CHFRSyu8dPjSYeLexPNX3I4OBr9SDzB58c4i0VyPDI=;
        b=H5csavAsgkpu04LaQsmAMFXJGE2iROe8nOa1iDKsjT2C6kyUfPA0SZ8tLY4xJM855N
         xjPd85Ad2wj4Dxs83QMfaYCdqAGTFVRF/PpEbSTYEEVvH91twuk43FwXW0agHa7ayZcy
         FiozSLIbiwx1od12RZEWvXKhZBzuyRps0WVw1C6yvYSI1TDo3q/P1WuCsLsRuxfFTFsj
         hdPtLJnuAvncWTYqWZMBA/MudX7AGZKrbjso8TIB5oaxYWwcdeM/Mu3fTDIEhIjcOwVE
         q7axWfwihlhu5DiHa75Mm+vSwGyClHTAvru57iMLCiQ/c0AxrkBD/+84j61i1tqFwHa+
         jHRg==
X-Forwarded-Encrypted: i=1; AJvYcCWNgzyYTInpKuy5QfSbQZQcTBcJ44Xygl/LuFucdBk2v+FC4R6VmTCzUDnErxrWKr5xZbKBaYd1VSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUnmvVseUxRCy2nl7HKnNy/q2/BqZZEaTANfPC025ovDBUuyJT
	VwVQi8byFDsQR+DwlyHZW6AmZJH0l11D52F/BMf3YBoxI/JVz1gLpafezSPv8A==
X-Gm-Gg: ASbGncvxQiu/J7qDo8LOstL6gceRbDT2F68M39HpP8xlGr/PX0XeUl6QQCWlWGABZDK
	jpYKd4kK8vKu2xfuDa8yPgmi5uS0nacH1QjlxwgFpC1VvZ70n2DzV3mtKEeJI1s2N/UDSGcHgn8
	UOvsxTDQJ2jYCqfKkkCKkrstspOfIVvnFMpGKc4nMffzgPMenSuzpXsES61/U9o5cg65cH/160Y
	fInTj27HSOqQtNs7yZJ1eDTf58YLtfJw8SqDs6e6P7oXz/4oBcYJMQ+8VJVRfOjaxYMbPpkydbW
	J4Gk+I3TeqbUAnqdRjkznGxZy+uUy8dAQQzhf1ywSomqn6HeaRufTS+OyuaJsoHJZ0TdEhNvHIe
	SagfLKjEg34lZnQ6O3p30n+ht0Q==
X-Google-Smtp-Source: AGHT+IEHnl30xlBVAq1iLpi0EO/Lyr63mMuqSOvS4olrDcmJL750c5xU5fLyTUrzUw7lxdfMCpNmXw==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr139931005e9.15.1745305331638;
        Tue, 22 Apr 2025 00:02:11 -0700 (PDT)
Message-ID: <d63a6410-7053-4f75-aeda-6cd4e36bd302@suse.com>
Date: Tue, 22 Apr 2025 09:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <3426df1b-938a-4d20-a533-dd6695473db0@suse.com>
 <5f922b70-d4c2-4e6e-ad05-f91afc70ee73@gmail.com>
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
In-Reply-To: <5f922b70-d4c2-4e6e-ad05-f91afc70ee73@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2025 12:43, Oleksii Kurochko wrote:
> 
> On 4/15/25 4:53 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -14,12 +14,68 @@
>>>   #include <xen/errno.h>
>>>   #include <xen/init.h>
>>>   #include <xen/macros.h>
>>> +#include <xen/spinlock.h>
>>>   #include <xen/xmalloc.h>
>>>   
>>>   #include <asm/imsic.h>
>>>   
>>>   static struct imsic_config imsic_cfg;
>>>   
>>> +#define imsic_csr_set(c, v)     \
>>> +do {                            \
>>> +    csr_write(CSR_SISELECT, c); \
>>> +    csr_set(CSR_SIREG, v);      \
>>> +} while (0)
>>> +
>>> +#define imsic_csr_clear(c, v)   \
>>> +do {                            \
>>> +    csr_write(CSR_SISELECT, c); \
>>> +    csr_clear(CSR_SIREG, v);    \
>>> +} while (0)
>> Coming back to these (the later patch adds one more here): How expensive are
>> these CSR writes? IOW would it perhaps make sense to maintain a local cache
>> of the last written SISELECT value, to avoid writing the same one again if
>> the same windowed register needs accessing twice in a row?
> 
> CSRs belong to the HART, so access to them is very fast.

Can you back this by any data? I view CSRs as somewhat similar to x86'es MSRs,
and access (writes in particular) to some of them is rather slow.

Jan

