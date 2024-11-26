Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA509D939A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 09:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843410.1259024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFrKW-0008UX-GY; Tue, 26 Nov 2024 08:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843410.1259024; Tue, 26 Nov 2024 08:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFrKW-0008SP-CS; Tue, 26 Nov 2024 08:53:56 +0000
Received: by outflank-mailman (input) for mailman id 843410;
 Tue, 26 Nov 2024 08:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFrKV-0008SJ-5t
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 08:53:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f15631-abd3-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 09:53:50 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3824a089b2cso3186724f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 00:53:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2609csm12843925f8f.44.2024.11.26.00.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 00:53:49 -0800 (PST)
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
X-Inumbo-ID: f4f15631-abd3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY0ZjE1NjMxLWFiZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjExMjMwLjk5NDMxNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732611230; x=1733216030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M9Pj19LOv/lvkzPq5ZhXA/9GjxgfRQqPQZoDshak4vw=;
        b=YDMLUvVXUYtiT5JG60rmSxbTN6mX/AL3Tc405h0dtGkiBk2oR8TcfKcrWtuvEGzOO3
         qxYF6iuU1eiJ1Ceo30zLhbNyrVxx+y/NrfCi6AP918Ac+j44PoCCTb8SdsrzPRcrkRs/
         BNwHGPUahsHjloTNECRbSZ1S4f2tu9qB2yX3w1UyAzSlILVcQQ8FYIilkD2NUm8qaI3u
         B/NXBGUefs5uXXZ6bAQdBrGbbbeDGiGAxF2erLAzilmw2fn6fg7wnChej3NTUKnzUK/N
         aauwsJQ9ym+vgCoAIYzEkznQh0DB+5LzbPWAYP4cnumMY5zlG3Ysl142UtjeaIg+RRan
         ST2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732611230; x=1733216030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Pj19LOv/lvkzPq5ZhXA/9GjxgfRQqPQZoDshak4vw=;
        b=gR6d7fQcgVzW+xm2pDGI0DOrIBVd34dWTw5AgpU4LLtzOhgsdRC6pWODpgmtojOKRy
         Jvewn5lyChJEagYgao3PwhBrb/NLXFTmAIEPYmc8UXu44d5ub4bjCUKMPSGJz265g7Ug
         7M1Z/HFHNmmw+tEQScC9JmVomEmsNX2spEUlP5dk4ucYxYwi5/urvSO3AagBLcNjLa5z
         u+WFmz0SHCAOmOmQrwZXJJ/CNC3xHd+5ukV09whW3ftxJaDpWbXqUHUHpa9255sg1X+i
         6XZNYgxmPGwOquUvl9ksF9GuTsSgoJmXbWZ7tCGInkRX64kw+Wl8h5OZzjNEwI9u89v0
         YpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzmPScscFXMRuaHI7gOL4TCcTTPsaRpeOtEWxCAqFMxJEfhASh9gcoxvLGvhaSBjct+Az1ELgqRSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7nlohrRTxw8dmDTNx2DuFNFpoFOfOWx7ZvUGmxL0ITbLrBHUC
	BkIpZsvnnTpiCFCS8OJYFpFB7W1vEo3KQQNyVO/ubhXJ3xanK6GYtuHkBjt5AQ==
X-Gm-Gg: ASbGncvRh+TQmLpfSAv8KSqmr8AHpsIguJpmk4/TA93yfjAq7WNZKSGwnp04Lv08OiQ
	qM914E3P7HrcASgd8JsmVZ413IjPg5/za3ZrUnr0ucajWk1Y7csuT0QRd+ceFoRPMVjfmdSwE5f
	s814wIQlp+DxwYaffILxxIpyf5PbcR9DhJ9VFG5NUng4C97h4LXPF+EkjYf5aw8i8LSJIYtcjUt
	mR/ULKuRb5+csitOMdpj6saRa/ILdlutcbkFeEDo7zF1uuj0k5OsQnB/uONQIjgzd4dZm0sl5Fm
	YswT7kGvwTdK1uiiQEx644O+PSFGd6HwPKw=
X-Google-Smtp-Source: AGHT+IF4cKoseb3pebSpOSOR6x6zoSZ4FYyCJsUuQJhmGasRJPz8+lXKzrzfrYtCRMFjK+rLfDZlsQ==
X-Received: by 2002:a05:6000:2805:b0:382:3afd:126a with SMTP id ffacd0b85a97d-38260b8766bmr9623098f8f.35.1732611230338;
        Tue, 26 Nov 2024 00:53:50 -0800 (PST)
Message-ID: <6b9b7910-ef5c-4633-8f83-c2748b0114f3@suse.com>
Date: Tue, 26 Nov 2024 09:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] Arm32: use new-style entry annotations for entry
 code
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <74c761c9-41b1-4397-aec2-95558d53a7cc@suse.com>
 <777d2832-76e2-4d59-88b7-ea9226bf8225@xen.org>
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
In-Reply-To: <777d2832-76e2-4d59-88b7-ea9226bf8225@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 21:25, Julien Grall wrote:
> On 01/10/2024 16:17, Jan Beulich wrote:
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should the GLOBAL()s also be replaced?
> 
> What would you replace them with?

LABEL() or, perhaps better, DATA()/END() pairs.

>> @@ -362,13 +362,13 @@ trap_irq:
>>   trap_fiq:
>>           vector fiq
>>   
>> -return_from_trap:
>> +LABEL_LOCAL(return_from_trap)
> 
> OOI, why do we need to annotate return_from_trap?

We don't _need_ to; it's for consistency. Please advise whether you want me
to drop that change (it's the only use of LABEL_LOCAL() throughout the series).
But please be aware that then END(return_from_trap) also needs dropping (i.e.
leaving the range uncovered as far as plain ELF metadata goes).

>>           /*
>>            * Restore the stack pointer from r11. It was saved on exception
>>            * entry (see __DEFINE_TRAP_ENTRY).
>>            */
>>           mov sp, r11
>> -ENTRY(return_to_new_vcpu32)
>> +LABEL(return_to_new_vcpu32)
> 
> I am a bit confused why this is a LABEL rather than a FUNC. But I wonder 
> if either of them are corrrect? The code above is meant to fall into 
> this one.

My take is that function (or object) ranges shouldn't overlap. That's an
abstract reason. There's a practical reason, too: With "common: honor
CONFIG_CC_SPLIT_SECTIONS also for assembly functions" FUNC() will change
sections when CC_SPLIT_SECTIONS=y (which LABEL() won't). Section changes
clearly may not happen when fall-through is intended.

> So I think at least the alignment should be 0.

That would be a change compared to the prior use of ENTRY(). I can certainly
do so, but without having sufficient context my goal was to leave existing
alignment unaltered as far as possible (on the assumption that there's a
reason for it).

Jan

