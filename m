Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E70974EFA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796332.1205866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJvQ-0005rh-BI; Wed, 11 Sep 2024 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796332.1205866; Wed, 11 Sep 2024 09:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJvQ-0005p3-7L; Wed, 11 Sep 2024 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 796332;
 Wed, 11 Sep 2024 09:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soJvO-0005ol-QG
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:46:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a981edea-7022-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 11:46:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so247272766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:46:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c60ef3sm589607166b.110.2024.09.11.02.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:46:03 -0700 (PDT)
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
X-Inumbo-ID: a981edea-7022-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726047964; x=1726652764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GyP3GvJsLgj/hl4D381xJPhdtU8rt/Qee15YnoO++dA=;
        b=f6cAm+F8KfexJc/nDMAjP5X7Gcc6ZejzMPkfJruO6uvSK5/5s66zcy+uqCCs8yx/UQ
         5d90Q38ZImqUHCDlBJOepk3Ko2f98Tk0sYZvs+BPHeeeNpPvBWwii18a01YnskB+EN6S
         FqRhwuJAWaP8JRvxngwVQ2FkcQHavcHVHFakmnNibEmbEry4R7SPKUM1I/L70SILxPPa
         MrF7D9aynGlbck4azBkp0oEXTS+Jly8GhWwlAiM1zwIEuYRh96pGpri5Xhjt/fn8UAlY
         1TobvYdaIN/+qm2JmnDXxxa7MehuQ4rIfGr0InQTspL3VU/7WDYn9oWXUQXT3Hp7BOgN
         uAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726047964; x=1726652764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyP3GvJsLgj/hl4D381xJPhdtU8rt/Qee15YnoO++dA=;
        b=UBqGmlLikTdHn+vWaOOPCD1Pc2zTiWdBoKdMQOlR4WQxlDkuZIf8uKGq8sQcxzxqs5
         Qj7Vui2/ZDZK2vIkc5JZfx23JATN4N+ztxSvZmr9JBfHAu6t5ERCazS0ehzAo9Qe1gl4
         JFzvQr/laZcd1dNK9fW7GkKRl+dl2tokMUhH9KfVsJi7qVT3Jzvrzm3hV0veuAPmqVBE
         f8qmY89fD6OIbI0OUbqQoJyLmObNgjxo0+gZCW6hy+4V4/HOp/Vr6X2I/qh+zKK27Ede
         vXx+KkkHnoh7iqZaezqJmnoMRp8EDPqyi6tCD+x7pv6V5wxi28FplFt6N5ptd9ZEcp6t
         WdtA==
X-Forwarded-Encrypted: i=1; AJvYcCX4k/oCI0lZASTYnXV5JoCs3zkxSRwwDJGQ0IPvLIuyJrPyp9GQJW2uTLqOhc3VyOHYoWBZ+lkOPHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM1WZK0rSK+iV0wlFSPuD7LQgqScqPWgix17ILmOPaCftF3iW7
	AerpwYlKwz6a5D+YbXxyRN/JfoX7VjJCuhPNuzsSvfsiNx4wm5NOakryERQw4Q==
X-Google-Smtp-Source: AGHT+IEgGvIJF8DRbyqBrPMziYy1IrljPxwlzsZXXGnjm9DrRLVA1a1PUmNU61X7gsPl3xI6ke9j7g==
X-Received: by 2002:a17:907:9686:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a9004aa53cbmr245581666b.54.1726047964133;
        Wed, 11 Sep 2024 02:46:04 -0700 (PDT)
Message-ID: <9821b3f2-9a50-47c6-95e0-d449bb7f98e2@suse.com>
Date: Wed, 11 Sep 2024 11:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/HVM: drop stdvga's "stdvga" struct member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <836afb28-581c-4ab8-a0a9-badf29a51b5e@suse.com>
 <f05cb8f3-31ff-48db-b741-aa3a5ba6b74c@citrix.com>
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
In-Reply-To: <f05cb8f3-31ff-48db-b741-aa3a5ba6b74c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 19:47, Andrew Cooper wrote:
> On 10/09/2024 3:40 pm, Jan Beulich wrote:
>> @@ -498,19 +483,17 @@ static bool cf_check stdvga_mem_accept(
>>  
>>      spin_lock(&s->lock);
>>  
>> -    if ( p->dir == IOREQ_WRITE && p->count > 1 )
>> +    if ( p->dir != IOREQ_WRITE || p->count > 1 )
>>      {
>>          /*
>>           * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
>>           * first cycle of an I/O. So, since we cannot guarantee to always be
>>           * able to send buffered writes, we have to reject any multi-cycle
>> -         * I/O.
>> +         * I/O. And of course we have to reject all reads, for not being
>> +         * able to service them.
>>           */
>>          goto reject;
>>      }
>> -    else if ( p->dir == IOREQ_READ &&
>> -              (true || !s->stdvga) )
>> -        goto reject;
> 
> Before, we rejected on (WRITE && count) or READ, and I think we still do
> afterwards given the boolean-ness of read/write.  However, the comment
> is distinctly less relevant.
> 
> I think we now just end up with /* Only accept single writes. */ which
> matches with with shuffling these into the bufioreq ring.

I'd like to keep a little more, if you don't mind:

        /*
         * Only accept single writes, as that's the only thing we accelerate
         * using buffered ioreq handling. */
         */

Not the least because writing this I noticed another flaw (or even two,
depending on how one looks at it): ioreq_send_buffered() further refuses
data_is_ptr requests. (Checking ->data_is_ptr is actually more important
than ->count, as ->count will be unequal to 1 only if ->data_is_ptr is
set, whereas ->count can also be 1 in that case.) Not the least because
that "refusing" is actually returning "success" (0 == X86EMUL_OKAY ==
IOREQ_STATUS_HANDLED) on x86, and IO_ABORT on Arm. I.e. such requests
would simply be lost on x86, and whether IO_ABORT is okay(ish) on Arm I
simply don't know (I'll see if digging through history reveals intentions).

And then - how can a buffered ioreq be a read, when there's nothing being
returned? (I.e. I consider this an omission in what ioreq_send_buffered()
refuses to process.)

Jan

