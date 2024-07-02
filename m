Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AA9242EF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 17:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752577.1160799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOfpX-0004Xs-Kf; Tue, 02 Jul 2024 15:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752577.1160799; Tue, 02 Jul 2024 15:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOfpX-0004WI-Hu; Tue, 02 Jul 2024 15:54:07 +0000
Received: by outflank-mailman (input) for mailman id 752577;
 Tue, 02 Jul 2024 15:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOfpV-0004WC-Vd
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 15:54:05 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4edf2fc5-388b-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 17:54:04 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so44684171fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 08:54:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15991bbsm85539525ad.286.2024.07.02.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:54:01 -0700 (PDT)
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
X-Inumbo-ID: 4edf2fc5-388b-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719935644; x=1720540444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cj+P4TnLhHmQBItLm/RdCTrxQwfHZNG8ZUGCmip9Buo=;
        b=X80LGu5M4Zuihti3u3R65qlWnCDQXz+WJt0poMTcGe67WlnzTrZBPx94lEFax29pL5
         K7IlXz1S0JrkqQVqkrI9OyEP5egGLBB3zrScTE8Cp40UHjD2zYjHyDTquIcDdth65tF3
         m2QVPdiFUGFAJmxxV4vaHsFN2lpiAsKK3bQ4EgpvkUWOpHzGgBZL9ML4mX/ixTcRW7Z7
         e+TfhdS3VXkTI8j/FZpJP5J1iOiyo90gJLuBVCqM2XDxrgySAs17+GzwsAwuISAKnbEi
         qupcfr9iSl4mdLhs2g4RDp5gOQMsjWGMSiqtZb9O3virsLRrj3+1XjABUupug1BTpiEI
         kHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719935644; x=1720540444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj+P4TnLhHmQBItLm/RdCTrxQwfHZNG8ZUGCmip9Buo=;
        b=l3ITRmthMIAh5+RKpRAni+c3u1VO+4gSRIbq1xHO0BH3aiRWmbLCCLiOoBpQAGkRX+
         we7GwJyC1dQMlScQy2ITVuZ46iesTvSTV1t29X8RUslVWp8SDXcBDYKOpAGJH2AuZuTW
         dvr35UOJBu1AbdwsiW9Mvc5MkkjUZoanPmkcn8Qc6IKPczEy/XXpTHbFXoS1nR+KpGrd
         PNZIhM6AJUk9G/sgBbUHfQnck1HVKOhayAGeX8hNju4Y/HusKHoRe/dmMwemr3L/RWya
         JXr3OdKs+D0H+E3y/W/LT15ABtKi9SF/6zJMiFCOXpjHgUf+V6oc36/RIligjsp6Xebz
         WdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTLknR/JOIqM8aP0gXvL2asShJd9NyPe1UGL9ZDGX+MLIgVvsKO8vAXltlxss7cxk/Cj2OHe3cb/ImFZSOzhQt4oHrFcSbvN1wkzLbha4=
X-Gm-Message-State: AOJu0YzSxM5q+a9uxIcIoz3KVoxkztuamdGPLDQ+85manVr/VjBvONY9
	rCsyHX2P2R7mC22lJqTxAwqfps0x9lyelpgrbwiaHPsmVbV5gWrBFNWqQxFqwA==
X-Google-Smtp-Source: AGHT+IE2LDqw/JiXUkP/J+hg+pP1s0s8ZvDTZoAuG8dI9T0X2X8V+2mS0dO+BD5OL+rGVwSV4tsHQw==
X-Received: by 2002:a2e:a889:0:b0:2e9:8a0a:ea05 with SMTP id 38308e7fff4ca-2ee5e3ad756mr70220541fa.17.1719935642169;
        Tue, 02 Jul 2024 08:54:02 -0700 (PDT)
Message-ID: <e60ef504-2617-4593-8ad3-4b570c820022@suse.com>
Date: Tue, 2 Jul 2024 17:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/9] xen/riscv: introduce ANDN_INSN
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <07c628e8552f6e31a07e4261b273553cb4a3669b.1719917348.git.oleksii.kurochko@gmail.com>
 <15d42265-0aec-40c1-b468-e6ebaabffbeb@suse.com>
 <06ab486e46148281eda3abf08d43811a4cb2ac85.camel@gmail.com>
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
In-Reply-To: <06ab486e46148281eda3abf08d43811a4cb2ac85.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2024 17:51, Oleksii wrote:
> On Tue, 2024-07-02 at 14:08 +0200, Jan Beulich wrote:
>>> --- a/xen/arch/riscv/include/asm/cmpxchg.h
>>> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
>>> @@ -18,6 +18,19 @@
>>>           : "r" (new) \
>>>           : "memory" );
>>>   
>>> +/*
>>> + * To not face an issue that gas doesn't understand ANDN
>>> instruction
>>> + * it is encoded using .insn directive.
>>> + */
>>> +#ifdef __riscv_zbb
>>> +#define ANDN_INSN(rd, rs1, rs2)                 \
>>> +    ".insn r 0x33, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"
>>
>> Why 0x33? Just like in the other patch you used MISC_MEM (as
>> suggested,
>> for being more descriptive), you want to use OP here. Then
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> (and I'd certainly be okay making the change while committing)
> 
> According to Volume 1, Unprivileged Specification version 20240411 the
> andn instruction looks
> like:
> 31          25 24 20 19 15 14   12 11 7 6           0
> 0 1 0 0 0 0 0   rs2   rs1   1 1 1   rd  0 1 1 0 0 1 1
>                                                OP
> 
> This instruction is R-type. According to the gcc manual
> ( https://sourceware.org/binutils/docs/as/RISC_002dV_002dFormats.html
> ):
> R type: .insn r opcode6, func3, func7, rd, rs1, rs2
> +-------+-----+-----+-------+----+---------+
> | func7 | rs2 | rs1 | func3 | rd | opcode6 |
> +-------+-----+-----+-------+----+---------+
> 31      25    20    15      12   7        0
> 
> so opcode6 in case of andn is 0x33 (0110011)

Right. And "OP" is the identifier you can use with .insn to get 0x33
without needing to write 0x33. As said - the requested replacement is
solely to help readability a little.

Jan

