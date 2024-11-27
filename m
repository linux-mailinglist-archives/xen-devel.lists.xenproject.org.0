Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A929DA4ED
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 10:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844571.1260065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEVB-0005pQ-R7; Wed, 27 Nov 2024 09:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844571.1260065; Wed, 27 Nov 2024 09:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEVB-0005mn-NF; Wed, 27 Nov 2024 09:38:29 +0000
Received: by outflank-mailman (input) for mailman id 844571;
 Wed, 27 Nov 2024 09:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGEV9-0005lz-Rv
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 09:38:27 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5898d019-aca3-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 10:38:24 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cefa22e9d5so7722212a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 01:38:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa547ffb152sm419872066b.62.2024.11.27.01.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 01:38:23 -0800 (PST)
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
X-Inumbo-ID: 5898d019-aca3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4OThkMDE5LWFjYTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzAwMzA0LjAxMjYyMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732700303; x=1733305103; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9exAmv/Jersz29noNodm0Pe78x0jkVG6BLy0mxEeEks=;
        b=Nu+BtX7pNP2UxRSeEB+xMPbyuXu44MjeobhgVursWy36CWP6oLN+zT/KFOuVgIuGKC
         AwKVmRBCaQqzAVZxECcLdsLw9v2dWnL//yVYPbPDflqxMsvu1IOPRvkxzFxoijXKctTJ
         Bblz56ul/8iEn3w4Anu9BAw4OHLP3QyKUcrZjDLpvHTchjETmCNBgLmDG7JI5Hvd1TSw
         UIiWlV3WJ3xabOW2+E/jTOjngT0HWYx2C2DIREgNu5mUcfZI0jvocM8nzsxDBxAyEz6F
         Ft6vddEhF0vGRusC3zkc7mKOvCKZM5lS12ccxgYK1MQmc+u+ZYGlV2oXkELnhocu12Nq
         kb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732700303; x=1733305103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9exAmv/Jersz29noNodm0Pe78x0jkVG6BLy0mxEeEks=;
        b=eCDN0a4AfmBI3dWfO8rWj2VBbDtwvM2toCjVnaWKuGSLoUrFDdHJs7iQcFEj/YIToR
         1Wpm2mlWSNfKKpzzUAydYQO1k4wpKwFZO0cCQTDsXAc8VlYlqQhZwhHnLBID7Vxl8Nk+
         rGohufgOuxeaL0YQLy3pGS4GTqLtccUEL2fueULHdCpwV7sDdKzfa3p4jle3ll+GpSsN
         tirnG5b6Rtw2kv4jhklHhrz+bObnP4d1SUxYo8MXQwQ6usXFeb+rg8YRsRxWrPqBvEtd
         c68kCW99wRkfnpDdiuOGnc97ml05n+9SVojMWvbpow/JDucBeuDGpX09dN/aET1x3ewQ
         stFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVED/NeZuDmjwIXn3Y+XCFtkjfNcMH5balBeq5A3uzI1ihjok4G6ngBjnbHWcOgcFxzpZJz4yYXV+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXR0RXJ+anj12iiY9rGjCfIkyQCuSPaRIwdWJNhbFGtPjwipfC
	6srTYjs3m6oQPc64Y8jgvhP5p1B2pxakpUS/F8EdJ1DGvUrmb/aXnQkZ8k+Kaw==
X-Gm-Gg: ASbGnct1evl/iNZ/MHQPoBEax0Of4C8eWjRtnNT9WokMpXq4xU2qRes8CDnzCu8EjmJ
	o6rpCF2tOdbAL2PlocA117aXktbO1vqOoQY2OtX5wM+RgRx74ig6Q4qr0lufydC/NS5xv7CDCvI
	ql9Jw1M6YKMVSl78lJopN2xK40syFC9i7n1SNdDX+jAjOPE0Ij+cpWgtzdFHrI53ph5uAJ9w4He
	7ogFl/CmvHiE5ADS49VDapKGHmOikXdmJdVudjKjeRF7gt3CL8emv0/bhNEjuFIekhpMW1F7ZCy
	lr3DAFV5pI3ZIZrwvlSTSmO0hgSXYmge/I8=
X-Google-Smtp-Source: AGHT+IHr2rR11saKPXNTU4WSOsbJ8FeXEsdfLC9R+B/hxLuVpWzneo5dQ5B0UwKfaM0o9tQ0zu4kHw==
X-Received: by 2002:a17:906:3d21:b0:aa5:3fa9:e90c with SMTP id a640c23a62f3a-aa580f56c51mr149533666b.32.1732700303296;
        Wed, 27 Nov 2024 01:38:23 -0800 (PST)
Message-ID: <6c3a913d-5a44-4e35-84cd-ac839369400f@suse.com>
Date: Wed, 27 Nov 2024 10:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] x86: re-work memset()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <62b3403f-3800-4c1e-a7a2-165ebfac04c0@suse.com>
 <2bc5221d-e54b-47f2-9f2e-ff76c0d74c90@citrix.com>
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
In-Reply-To: <2bc5221d-e54b-47f2-9f2e-ff76c0d74c90@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 18:13, Andrew Cooper wrote:
> On 25/11/2024 2:28 pm, Jan Beulich wrote:
>> ---
>> We may want to consider branching over the REP STOSQ as well, if the
>> number of qwords turns out to be zero.
> 
> Until FSR{S,M} (Fast Short Rep {STO,MOV}SB), which is far newer than
> ERMS, passing 0 into any REP instruction is expensive.

Is this a request to add such a conditional branch then, perhaps patched
out when FSRS is available? And then perhaps also for the JZ that's
already there?

> I wonder how often we memset with a size less than 8.

Hence why I raised the point, rather than putting the jump there directly.

>> We may also want to consider using non-REP STOS{L,W,B} for the tail.
> 
> Probably, yes.  We use this form in non-ERMS cases, where we're advised
> to stay away from STOSB entirely.

Yet then we'll end up with three conditional branches - do we really want
that?

> Interestingly, Linux doesn't have a STOSQ case at all.  Or rather, it
> was deleted by Linus in 20f3337d350c last year.  It was also identified
> as causing a performance regression. 
> https://lore.kernel.org/lkml/CANn89iKUbyrJ=r2+_kK+sb2ZSSHifFZ7QkPLDpAtkJ8v4WUumA@mail.gmail.com/T/#u
> although the memset() path was not reverted as part of the fix
> (47ee3f1dd93bcb eventually).
> 
> Yet ca96b162bfd2 shows that REP MOVSQ is still definitely a win on Rome
> CPUs.
> 
> I expect we probably do want some non-rep forms in here.
> 
> Do you have any benchmarks with this series?

What I specifically measured were the clear_page() variants. I didn't do
any measurements for memset() (or memcpy()), first ad foremost because
any selection of inputs is going to be arbitrary rather than representative.

>> --- /dev/null
>> +++ b/xen/arch/x86/memset.S
>> @@ -0,0 +1,30 @@
>> +#include <asm/asm_defns.h>
>> +
>> +.macro memset
>> +        and     $7, %edx
>> +        shr     $3, %rcx
>> +        movzbl  %sil, %esi
>> +        mov     $0x0101010101010101, %rax
>> +        imul    %rsi, %rax
>> +        mov     %rdi, %rsi
>> +        rep stosq
>> +        or      %edx, %ecx
>> +        jz      0f
>> +        rep stosb
>> +0:
>> +        mov     %rsi, %rax
> 
> Could you use %r8/9/etc instead of %rsi please?  This is deceptively
> close to looking like a bug, and it took me a while to figure out it's
> only correct because STOSB only edits %rdi.

Well, I can certainly switch (the number of REX prefixes will remain the
same as it looks), but the fact that STOS, unlike MOVS, doesn't touch
%rsi is a pretty basic one.

Does your request extend to all uses of %rsi (and %esi), or merely the
latter two (across the REP STOS)?

Jan

