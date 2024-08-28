Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279029623D2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784588.1193972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFBq-0002FR-LI; Wed, 28 Aug 2024 09:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784588.1193972; Wed, 28 Aug 2024 09:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFBq-0002D2-IB; Wed, 28 Aug 2024 09:42:10 +0000
Received: by outflank-mailman (input) for mailman id 784588;
 Wed, 28 Aug 2024 09:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjFBp-0002Cw-K8
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:42:09 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca895870-6521-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:42:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so7056243a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:42:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb475f2esm2018303a12.63.2024.08.28.02.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:42:06 -0700 (PDT)
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
X-Inumbo-ID: ca895870-6521-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724838127; x=1725442927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chP+CDnz93O6ObYXNfs6fucwEu+/SuH+oCZro2F2ioE=;
        b=Rkqc1T7ArWDvo2S9z+ll1IEa8uF+RygW/sIXdXUSA0ylB+KG2qoKUf0cx6s8HeE6VH
         Wm2Grk0rdXmAnz05RYJSte+B/JcAuC9XgfhuQdrXtsp4NNrEO4Opgh22owGPChE0bUgN
         X3UHYI3zRp2ofxb5yXcJe6SuWHmsLXBe9RbQmDdV2JmwAMzRj3ZC0Cigg/6qSi2sUUes
         vzh2Q+VjvRkWMiJvaOIh1Jyx9wGjnCSQ1W3IlwIF1s/CAYdX/N6gPw9p/w1IRB9l6oiV
         9lBKDoQfpqMQ+PL+g39yZeA0OkBKZHWyTFtnoOSRfZ5nOE8/KHDZ/eMHmOaecUcJaZPS
         5Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838127; x=1725442927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chP+CDnz93O6ObYXNfs6fucwEu+/SuH+oCZro2F2ioE=;
        b=FL5CQ86272vzZsdDO95UEVorpnshnGVPPIoPzYHrJFRZOE+XAZ25JXCLw0UbrBbY1+
         5LQny6WnI+wGQx4nWd0CpcPfpuedqJeIur/UDXZhweLyp6UpLLSBBCmU5+2DUw1QeJlM
         zKV+aLzfR8W5HWD0f1HPWqS76P8Sui5u4vEqPGA8gAFWn+5BSlsRuWIV1LVE2pwUG2w6
         nUDu494CiuJndxMa05OUe9lSgXAQ1mWInhin6EOHfB0ZBtlcZEsVMrQ5Kbj10u0SuJkw
         TOoW8M7j3lC+fMGHiYf7Lne0GIpru3kTCJnz64BqisdfU1XIuMZp924LEn+uelrnqOas
         MUvA==
X-Forwarded-Encrypted: i=1; AJvYcCVCp7vDsn8jAWQKSG/OjLPNFLdL+hG5eU9B7MnHwDvXiGrp7Tqoajn7ZXA2FZVM5eVZ7rCaNOsh9G0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc4POlSxUVk5iOygtqqotGmaf6+NdNAgCbZ3i3KinZFuO5bn7C
	N5xBQTjVWvN6KtxtLt4t/H/qpz7sTA+F1o3sft6QNMAhlFINLVhXMe2jDGmVzA==
X-Google-Smtp-Source: AGHT+IG55RV53GxEA9tgFbvg7tGjxBxVgDwc/0KtzecQ/tc5sdKdiNA11PKpFrzdYimzSfnL3JSx5g==
X-Received: by 2002:a05:6402:5cc:b0:5bf:50:266b with SMTP id 4fb4d7f45d1cf-5c089171b3fmr9914572a12.19.1724838127072;
        Wed, 28 Aug 2024 02:42:07 -0700 (PDT)
Message-ID: <45f1305f-2c2c-4b1c-8377-f98dbc5dbe53@suse.com>
Date: Wed, 28 Aug 2024 11:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
 <0f9fb47c-91d1-4ee9-b6bf-1d491339e904@suse.com>
 <3f52a19ea90fa8e70d7bf0055fe39a2be721c129.camel@gmail.com>
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
In-Reply-To: <3f52a19ea90fa8e70d7bf0055fe39a2be721c129.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 11:21, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 12:06 +0200, Jan Beulich wrote:
>> On 21.08.2024 18:06, Oleksii Kurochko wrote:
>>> In Xen, memory-ordered atomic operations are not necessary,
>>
>> This is an interesting statement.
> I looked at the definition of build_atomic_{write,read}() for other
> architectures and didn't find any additional memory-ordered primitives
> such as fences.
> 
>> I'd like to suggest that you at least
>> limit it to the two constructs in question, rather than stating this
>> globally for everything.
> I am not sure that I understand what is "the two constructs". Could you
> please clarify?

{read,write}_atomic() (the statement in your description is, after all,
not obviously limited to just those two, yet I understand you mean to
say what you say only for them)

>>> based on {read,write}_atomic() implementations for other
>>> architectures.
>>> Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
>>> {read,write}{b,w,l,q}(), allowing the caller to decide if
>>> additional
>>> fences should be applied before or after {read,write}_atomic().
>>>
>>> Change the declaration of _write_atomic() to accept a 'volatile
>>> void *'
>>> type for the 'x' argument instead of 'unsigned long'.
>>> This prevents compilation errors such as:
>>> 1."discards 'volatile' qualifier from pointer target type," which
>>> occurs
>>>   due to the initialization of a volatile pointer,
>>>   e.g., `volatile uint8_t *ptr = p;` in _add_sized().
>>
>> I don't follow you here.
> This issue started occurring after the change mentioned in point 2
> below.
> 
> I initially provided an incorrect explanation for the compilation error
> mentioned above. Let me correct that now and update the commit message
> in the next patch version. The reason for this error is that after the
> _write_atomic() prototype was updated from _write_atomic(..., unsigned
> long, ...) to _write_atomic(..., void *x, ...), the write_atomic()
> macro contains x_, which is of type 'volatile uintX_t' because ptr has
> the type 'volatile uintX_t *'.

While there's no "ptr" in write_atomic(), I think I see what you mean. Yet
at the same time Arm - having a similar construct - gets away without
volatile. Perhaps this wants modelling after read_atomic() then, using a
union?

> Therefore, _write_atomic() should have its second argument declared as
> volatile const void *. Alternatively, we can consider updating
> write_atomic() to:
>    #define write_atomic(p, x)                              \
>    ({                                                      \
>        typeof(*(p)) x_ = (x);                              \
>        _write_atomic(p, (const void *)&x_, sizeof(*(p)));  \
>    })
> Would this be a better approach?Would it be better?

Like const you also should avoid to cast away volatile, whenever possible.

>>> 2."incompatible type for argument 2 of '_write_atomic'," which can
>>> occur
>>>   when calling write_pte(), where 'x' is of type pte_t rather than
>>>   unsigned long.
>>
>> How's this related to the change at hand? That isn't different ahead
>> of
>> this change, is it?
> This is not directly related to the current change, which is why I
> decided to add a sentence about write_pte().
> 
> Since write_pte(pte_t *p, pte_t pte) uses write_atomic(), and the
> argument types are pte_t * and pte respectively, we encounter a
> compilation issue in write_atomic() because:
> 
> _write_atomic() expects the second argument to be of type unsigned
> long, leading to a compilation error like "incompatible type for
> argument 2 of '_write_atomic'."
> I considered defining write_pte() as write_atomic(p, pte.pte), but this
> would fail at 'typeof(*(p)) x_ = (x);' and result in a compilation
> error 'invalid initializer' or something like that.
> 
> It might be better to update write_pte() to:
>    /* Write a pagetable entry. */
>    static inline void write_pte(pte_t *p, pte_t pte)
>    {
>        write_atomic((unsigned long *)p, pte.pte);
>    }
> Then, we wouldn't need to modify the definition of write_atomic() or
> change the type of the second argument of _write_atomic().
> Would it be better?

As said numerous times before: Whenever you can get away without a cast,
you should avoid the cast. Here:

static inline void write_pte(pte_t *p, pte_t pte)
{
    write_atomic(&p->pte, pte.pte);
}

That's one of the possible options, yes. Yet, like Arm has it, you may
actually want the capability to read/write non-scalar types. If so,
adjustments to write_atomic() are necessary, yet as indicated before:
Please keep such entirely independent changes separate.

Jan

