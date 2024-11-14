Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005E9C8656
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836165.1252042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWK7-000396-PS; Thu, 14 Nov 2024 09:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836165.1252042; Thu, 14 Nov 2024 09:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWK7-000376-M2; Thu, 14 Nov 2024 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 836165;
 Thu, 14 Nov 2024 09:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWK5-000370-B4
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:39:33 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ff5287-a26c-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 10:39:30 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so294922f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:39:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adad3dcsm953492f8f.31.2024.11.14.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:39:29 -0800 (PST)
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
X-Inumbo-ID: 58ff5287-a26c-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4ZmY1Mjg3LWEyNmMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTc3MTcwLjcwNzYzNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731577170; x=1732181970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RTeIcfRu8RRFkWV4gv7PBAqKjvdu0cbqiaNz4sH7gAY=;
        b=O8kjVKkrJyYEgfW6m4xdCx+SUUa9goQOyy2EWwx31uDWxCJGu5vX4NuXdHnjmZkY1O
         sbrhQHp+FsjQmi5pbM6CBikihl7WovyPXPq0vs65T33OFQ56Qt6Qwuq5nU7MSbwSQc6O
         eafNboKAU0ak8Ms3XieeLb55mppHol5/bWg503SR+Goo6maT3f4U1kbLUPlUXRMaXoc5
         GvOeabMQb7vtTM1n0lwaLda+pYjGFu77Aut4NCjH7XFoiVxlxEevrO1sMdNeLS0vkhm2
         ytx5gMiNr1uBIIleRNI04GH2bHJ7YF4JfExzTtaX3DtVcohHkJow6yshhpbICoPM394s
         lwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577170; x=1732181970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTeIcfRu8RRFkWV4gv7PBAqKjvdu0cbqiaNz4sH7gAY=;
        b=aKHLE/LDAXmz0sFXktkUZd5ONkRLuJDdPmJKD4fYU0vWi7hdYe8kKmpCTr4M60GFBS
         W2Z4e2dzKUOgQFjAZ/Cq9hZqtFB9zhvmrmee6Wpk507jYH9cNJsc0Vv5kC1h/jly+kSB
         ZAL/32afD3fbE7uYR+PKtkNHMqLv7Fjn4JEdmmXNNEY/jcu9slWBha5xkDtyOjnvB9V5
         55zi6/8JNASZo8UTSPmFtK9I+lsee7xj72P9GrXtQgN+u1rjw49e7BG78Qj4/YWsg9zF
         PIJuRvXqbn57kr2lt2k559trVbWb212KogA7ZzVsWS2lI0KGdxsXipqb4wJToU1iB4CE
         R3ew==
X-Forwarded-Encrypted: i=1; AJvYcCX/KJlW0kWVUtWlWLM287u6+0Mn08F1965rqwC580Uh2UjBd/e05+oAFp+It7NN+Ibu0hZINbhtHRE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyzP8rh6c2DYSAXyQz+Fn8w2QB1qsVYpiCQ0WY9dndHEVb1Afk
	rz1v/2bl/bklrK27sQGcSW4IjMANXTMZfqw3o7ORYdtqGCT9tsRq/V2nnrJgOw==
X-Google-Smtp-Source: AGHT+IGHphfRvmW722/TdJAZkp3QG9AaByMTNR+qbPHkvngQpqNgSwW1sNaqjUijvyXGt7Eqo+LYTw==
X-Received: by 2002:a5d:5d88:0:b0:37d:4332:e91d with SMTP id ffacd0b85a97d-38208349f38mr8373766f8f.52.1731577169973;
        Thu, 14 Nov 2024 01:39:29 -0800 (PST)
Message-ID: <9815fb42-9205-4740-97b4-0b915de0c71b@suse.com>
Date: Thu, 14 Nov 2024 10:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
 mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <39de64e1-c615-4ec3-ad05-ff99f27a8e30@suse.com>
 <6442a109-de9a-4b81-a283-2d72bbc3d284@citrix.com>
 <3788f564-7f02-4e2e-ac4c-b29214206e0d@suse.com>
 <876f727c-8929-4149-af72-c3344db06e31@citrix.com>
 <935442f7-4821-4215-a053-eeb1347282bb@citrix.com>
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
In-Reply-To: <935442f7-4821-4215-a053-eeb1347282bb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 14:32, Andrew Cooper wrote:
> On 13/11/2024 1:31 pm, Andrew Cooper wrote:
>> On 13/11/2024 8:01 am, Jan Beulich wrote:
>>> On 13.11.2024 01:24, Andrew Cooper wrote:
>>>> On 12/11/2024 3:00 pm, Jan Beulich wrote:
>>>>> While result values and other status flags are unaffected as long as we
>>>>> can ignore the case of registers having their upper 32 bits non-zero
>>>>> outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
>>>>> mistakenly re-execute the original insn with VEX.W set.
>>>>>
>>>>> Note that the memory access, if any, is correctly carried out as 32-bit
>>>>> regardless of VEX.W.
>>>> I don't understand why this is true.
>>> This talks about the access to guest memory, which is op_bytes based.
>>> And op_bytes determination handles VEX.W correctly afaics. I've added
>>> "guest" near the start of the sentence for clarification.
>> Ah - that makes things much clearer.
>>
>> I had neglected to consider the access to guest memory.
>>
>> In addition to a "guest" earlier, I'd suggest having a new paragraph at
>> this point, and ...
>>
>>>> If we write out a VEX.W=1 form of BEXTR/etc and emulate while in 64bit
>>>> mode, it will have an operand size of 64.
>>>>
>>>> I can believe that ...
>>>>
>>>>>  Internal state also isn't leaked, as the field the
>>>>> memory value is read into (which is then wrongly accessed as a 64-bit
>>>>> quantity when executing the stub) is pre-initialized to zero.
>> ... this reading:
>>
>> "The emulator-local memory operand will be accessed as a 64-bit
>> quantity, but it is pre-initialised to zero so no internal state an leak"
>>
>> or similar.

That's to _replace_ the "Internal state ..." sentence then, rather than an
added separate sentence / paragraph? It says exactly the same, after all.

> Oh, and Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but I'll wait some for clarification above.

Jan

