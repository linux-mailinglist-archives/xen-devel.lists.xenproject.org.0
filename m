Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A1917A3C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748444.1156158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNV6-0002hn-Vk; Wed, 26 Jun 2024 07:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748444.1156158; Wed, 26 Jun 2024 07:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNV6-0002g9-T7; Wed, 26 Jun 2024 07:55:32 +0000
Received: by outflank-mailman (input) for mailman id 748444;
 Wed, 26 Jun 2024 07:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNV5-0002g1-BG
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 07:55:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a8fe2b-3391-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 09:55:29 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so81717571fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 00:55:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7069d65dfc7sm2324392b3a.133.2024.06.26.00.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 00:55:28 -0700 (PDT)
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
X-Inumbo-ID: 74a8fe2b-3391-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719388529; x=1719993329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HfM1x1Laydna422ZuoslhxvV0dtdFLN/IxH0RbYrLEc=;
        b=QGQKDaqotHOAQK24WFoFbMSNM7YM9dhk6SNJ1pljfWX9sdJVqYvlhp7srTD4Ubl+cZ
         q2KT9TSvuR9avBY4d974torRUZnnp3TayeWST1T05eb46hcQ0PRwxiFUL/lpQ2sxPsbe
         5hldFbdr8kls1qNIF2awQfIW32l6MvOj6mcInW0cT4pvEafRtIyg69XqrbaDDqaKnbKT
         pLvD/R3J1h8obv1SS6n2Tt7WvDfkVwRQOpBPwsTCPT8/EjfRBQlkBHwf74zrM7A4io3N
         i2pZG3Ep7WlcN3aq6vY/50O9Sr2tFu8Ru0DARqwB1BrrWnxU5RmiLElYCQQZW7zE/2B9
         FJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388529; x=1719993329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfM1x1Laydna422ZuoslhxvV0dtdFLN/IxH0RbYrLEc=;
        b=OInQeqFPhu3TJreHHscA9oosl9ZQxDaXaU+e4UmI8KBCE/SdwnDtW21TBrWUP62g3d
         6dppFWQYBNzl3cojQpTAPxwQa2Lo13b4bSnweYHz81bC+ZcrAFmuI9YG9bJochlFovGW
         9sQypTMavKyRIw6VmCbtCv5jymwFmbFX67zDwMACv6sAKBIDT/4NkdEu2Ma3/3yAcWoV
         NXNZFe/CRUh+2eJ5tVbTQ6KOIBHfcuSQRTZbYoynPB+1fO1+n+heLI1NCg4n+niBoZij
         KMCr0ID6m83v0K9tA1v/JA/ZF9jpNQf4CJxOFm61M8jHhapS1lmL0AbJSyHJPFQLkd7g
         vNXw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbt2HmvMbv9ls4LU0E1yEinf/2Z68WmjI5jApSBElC6a1E4azURxoR488e4xltTSXx5D9XFb1eVv4JlNUBmz1kAbZhMflmzG9BrkPjDo=
X-Gm-Message-State: AOJu0YyB5INOucMkzPCVj9+GYdi2R+q3zIZVRlGOTs3TPM7rwSIcwQaR
	XFwo8h5XQRSQcghQ3Gmbg8cHnzUDl6pPA8wvFNTY2sn7FZ0EsBfgcDBgPsMFGg==
X-Google-Smtp-Source: AGHT+IEzXetCol9Nlj/73s1CJm9Bdr4LbR/LQIJ9xVte8nQVAsAlhpnQXnAn0y7qPX9hNXF/VnM26w==
X-Received: by 2002:a2e:b1cf:0:b0:2eb:efff:771e with SMTP id 38308e7fff4ca-2ec57983bcemr60768691fa.29.1719388528731;
        Wed, 26 Jun 2024 00:55:28 -0700 (PDT)
Message-ID: <ccb68ab1-4e92-4278-917d-6928f0639703@suse.com>
Date: Wed, 26 Jun 2024 09:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
To: Oleksii <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
 <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
 <6aedc34eb248ec9adba921593782a43f0cf0a8bf.camel@gmail.com>
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
In-Reply-To: <6aedc34eb248ec9adba921593782a43f0cf0a8bf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 09:13, Oleksii wrote:
> On Tue, 2024-06-25 at 22:10 +0100, Andrew Cooper wrote:
>> On 25/06/2024 3:49 pm, Jan Beulich wrote:
>>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/cmpxchg.h
>>>> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
>>>> @@ -18,6 +18,20 @@
>>>>          : "r" (new) \
>>>>          : "memory" );
>>>>  
>>>> +/*
>>>> + * Binutils < 2.37 doesn't understand ANDN.  If the toolchain is
>>>> too
>>>> +ld, form
>>> Same question: Why's 2.37 suddenly of interest?
>>
>> You deleted the commit message which explains why:
>>
>>> RISC-V does a conditional toolchain test for the Zbb extension
>>> (xen/arch/riscv/rules.mk), but unconditionally uses the ANDN
>>> instruction in emulate_xchg_1_2().
>>
>> Either Zbb needs to be mandatory (both in the toolchain and the board
>> running Xen), or emulate_xchg_1_2() needs to not use the ANDN
>> instruction.
> But we can't go without Zbb there are some things in <xen/bitops.h>
> which now requires this extension. At the current state of development
> it is mandatory.

Maybe that's the "another bug" that Andrew mentioned (without any details)
on Matrix?

Jan

