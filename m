Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B560945AD7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770796.1181389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoU3-0001sc-PS; Fri, 02 Aug 2024 09:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770796.1181389; Fri, 02 Aug 2024 09:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoU3-0001pz-MK; Fri, 02 Aug 2024 09:21:59 +0000
Received: by outflank-mailman (input) for mailman id 770796;
 Fri, 02 Aug 2024 09:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZoU1-0001pr-Pl
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:21:57 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9fbba4d-50b0-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:21:56 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5afa207b8bfso8397285a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:21:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d45452sm75452066b.111.2024.08.02.02.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:21:55 -0700 (PDT)
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
X-Inumbo-ID: a9fbba4d-50b0-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722590516; x=1723195316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+EJYI9leEtgevuRyDON90kG9LR0bATAV0PxKKihd8=;
        b=G03HjcEenn9MIU6zxtlcz9VSFSji3x3WrNoNTosbkvJpE1glHpVpkmuKSb9aEJLM5B
         g+AkwirxfPeo7jbe+b0NF2Ap5G3lyrf7beShWxGEaf/uulrpTpzdQyCyUgfXZTBOIgn2
         VMFSvwHJRtSRhmgF4or1bBLLG3hqbcVN/ov9W9qt1jLPBmIoDnuaqlN0NHfcR++n3jNe
         S4WOhJZyELnw6hFpJQwRHN5rg7v4/Zn3h0pxH+RbCu3XBUP8yuWPANyl8aiGRscz786Z
         ynakVVpY7VeN6JczQAfFnrU8dB/OtTh4DdlMUNuuimxHdmArb/nJR+V/dbd/YW7dwdyV
         pyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722590516; x=1723195316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8+EJYI9leEtgevuRyDON90kG9LR0bATAV0PxKKihd8=;
        b=XMuwjzhkFIp1kmGkN1kM0PFpzMxKn8T9GCqiBHnvR1bJ5plRV2rKM+DgS0GHT1WIWB
         vjkPsQ6/8vQZh5Htl91r+o/U5PCN7Y1I1xcYBND+IHYhKq9ho9h8B/XXf9zJ7DJvuCHM
         ORVYyyL24phsjPseEOpSxWyVO97uh40UIXYp9Lz8cuwL8n6/XC9/KjhOO9ain1/BkDmP
         iALavaHlnUIWyy0QcCWjxKLQcfJi50xvv6sEowvvH/IIZMeP910M8JARg2qZsO/DviSE
         1IGShRQSxtCCutRn3kV7Npc0qoeHAitDJOby3oNVrx1NuXPh6GPXTQflzCeko4KQUj+X
         NuVQ==
X-Gm-Message-State: AOJu0YyNmrY0HUMRRATCl6FtUYEf/w+QA1ebmG/A5wO/K+yKGWRnzLLP
	eFtkNg3B1ZJXPytByzLxFFFBB4n2xwRz0t21CdqlK8GAnie4pAr7G4yg5mbvK2gZRRqZpPn1qYk
	=
X-Google-Smtp-Source: AGHT+IFw5FdcHNqUG3khxmyZgbSor5C+nryqVw/byjc7PMgUEHIr8wTfk8iZQ8vGkiHA0SUTTqQ+fg==
X-Received: by 2002:a17:907:72c9:b0:a7a:d093:f843 with SMTP id a640c23a62f3a-a7dc50feae0mr206020966b.63.1722590516242;
        Fri, 02 Aug 2024 02:21:56 -0700 (PDT)
Message-ID: <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
Date: Fri, 2 Aug 2024 11:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
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
In-Reply-To: <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 11:14, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
>>> To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
>>> it is needed to enable GENERIC_BUG_FRAME.
>>>
>>> ebreak is used as BUG_insn so when macros from <xen/bug.h> are
>>> used, an exception with BREAKPOINT cause will be generated.
>>>
>>> ebreak triggers a debug trap, which starts in debug mode and is
>>> then filtered by every mode. A debugger will first handle the
>>> debug trap and check if ebreak was set by it or not. If not,
>>> CAUSE_BREAKPOINT will be generated for the mode where the ebreak
>>> instruction was executed.
>>
>> Here and in the similar code comment you talk about an external
>> debugger, requiring debug mode, which is an optional feature. In
>> my earlier comments what I was referring to was pure software
>> debugging. I continue to fail to see how properly distinguishing
>> ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
>> WARN() is going to be feasible.
> GDB keeps track of what addresses it has breakpoints at.

Of course it does. But in Xen how do you decide whether to trigger
the debugger when you've hit an ebreak? (Just to repeat, my question
is about the purely software debugging case; no hardware debugging
extensions. In such a case, aiui, Xen gains control first and then
decides whether to trigger the debugger, or whether to handle the
exception internally. Sure, none of this infrastructure is in place
right now, but imo it wants taking into consideration.)

> And if QEMU is being used, GDB isn't actually inserting ebreak
> instructions because QEMU has an infinite amount of "hardware"
> breakpoints.
> 
> If it answers your original question I could add this to commit
> message/code in the next patch version.

I'm afraid it still doesn't.

Jan

