Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3AB974DE3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796296.1205806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJIX-0006HA-Gk; Wed, 11 Sep 2024 09:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796296.1205806; Wed, 11 Sep 2024 09:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJIX-0006Fd-Dp; Wed, 11 Sep 2024 09:06:01 +0000
Received: by outflank-mailman (input) for mailman id 796296;
 Wed, 11 Sep 2024 09:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soJIV-0006FX-Ma
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:05:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec786b3-701d-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:05:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso2007643a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:05:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25926ee8sm592434466b.50.2024.09.11.02.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:05:56 -0700 (PDT)
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
X-Inumbo-ID: 0ec786b3-701d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726045557; x=1726650357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8AXSl1nRv5etQOf26LOjYC/cTIWsSZAazFtkmq7c6OM=;
        b=ZEfcH6+C6I7kvdgwEklEP8cqZNhrUY4LdOc4/0uA8CzQFjABcWC1RhrKNyz3HV+IxY
         I4leIxJb2PtoNqEFpnVkfm+vaYx0a725NUrDwnV/CEc5/qN2ZJad2srKSLCz2lzhcQVG
         akSCVyPLG9WTHE0R1EvO5+zVfCSc9aVe0oSNyGwRqGD8dKAdf9WtKy8dd5jq8/qGhHA/
         0hAgahwRCpmgcrnbkaVDY3h85FlJakLffHNOHbDKsIrGvqbiC5ReliQ0ay83UzQ+rhik
         2Q5ch1M5ohe1oO5EPxuy2maSTIVB5EYluHeFNIDlmA6VXj04Vc2RZWXCARkiuqMaTPWa
         691w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045557; x=1726650357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AXSl1nRv5etQOf26LOjYC/cTIWsSZAazFtkmq7c6OM=;
        b=DyxqMDvh3H+TmuS0oOIv4uHhkmCaF6yZmSlRgF2u1g4Qwha95nG6TLQl8xvrpEVivu
         UMdTdrBMeYn1aiajdSmcfqNXKzUIa7VgG8d0NFXjxiydd56fya3kblgUpZ+QgbUnWwJB
         hX16dBM16jrKpsWR1I+xLcd6c6wgRn4HUgVMnDBQgOMnEvZ1m+mILLM4ynpUIdwqpSAC
         l1FgZecHpn2C+aqFuyvhoC97dvJ51y8ZoypvyFFjPuOMX4iE5PX1T7QhbUw/cFvs5ZDu
         I13zmF++sh1bOxb7teQenow7Qa/qUKeYOn+47ZJhnVwhjEBhh52nCObVQ72JeTy//jvz
         k9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1xyZJ4aY5L8aCZwsYh8WB5Hi7vyd4+HUCX7vRMwaTeSuFHbhhGqyQ7NxdEbu+/ggbGMD090pYdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws+VwTkaxIY0qVRIxdT8dlQ8+uj29wwSZCNL3hfsqOlPPIK21l
	NhsopZ3iijOAMlLZ8sxzWyEUNCn+rs+sQz4TZyiS5dpeAqM04gSgKpSmQQ9yHQ==
X-Google-Smtp-Source: AGHT+IFsGOrspnDSXC/waDsc3G6/JQog3JlC8JEvYBII5PSXn+Wn881+ic3Ijhcc5oteEK87JJAKGA==
X-Received: by 2002:a17:907:7da8:b0:a86:9fbd:5168 with SMTP id a640c23a62f3a-a90047456d5mr190549066b.10.1726045557017;
        Wed, 11 Sep 2024 02:05:57 -0700 (PDT)
Message-ID: <1177d672-db21-49bc-aede-f3cd85ce946b@suse.com>
Date: Wed, 11 Sep 2024 11:05:56 +0200
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

Fine with me. As usually I'm commenting rather too little, I was fearing
I'd remove too much if I shrunk the comment like this.

Jan

