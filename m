Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB05986CE8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804941.1215929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiKb-00059t-T9; Thu, 26 Sep 2024 06:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804941.1215929; Thu, 26 Sep 2024 06:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiKb-000581-PK; Thu, 26 Sep 2024 06:50:29 +0000
Received: by outflank-mailman (input) for mailman id 804941;
 Thu, 26 Sep 2024 06:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stiKa-0004pX-L3
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:50:28 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d57570e-7bd3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 08:50:28 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f8ca33ef19so8047791fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 23:50:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34291sm318266466b.14.2024.09.25.23.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 23:50:27 -0700 (PDT)
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
X-Inumbo-ID: 9d57570e-7bd3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727333427; x=1727938227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wgoi8CYH125Xpf+L61ZN42o44y9/8eYrWERuvEtkdQw=;
        b=BL7750WaNUCtvuB5UtkMg0M4dS9RjKqKAITSLMf3zF7Y1+PBrz7rWfdX+ZxL7y6dcq
         pliAmNU6oHBmBRBANTh7jNgt6ASudz+B440PWYGVxrx5igssUDKUwy1mmsmzsNVlnImo
         QTQW49ma0NwJHdAg2WNOxi6GfaiovN732Gh+r24A7elIY6rFg5ObYgfZOIb4sFfmKuZf
         1dJCem8UZ2Y0/y4k+shw9gtqPbc1pQPzfDRyxDWhAG1Sz1uQa+KFMBkJtbHj7qwQeWQe
         3QDCCkaK8+7xklptvu9EHv3ZnHqwjjSqSUOR+g/b9Sm3SzTijsNF8F61PYbyWxLh1XVR
         exXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333427; x=1727938227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgoi8CYH125Xpf+L61ZN42o44y9/8eYrWERuvEtkdQw=;
        b=nJ3P+H+lMdsZBMhl1HFxFFbBI1H9NWbpZkpgrQX8Qxu9GXnutmu8ed4juv0HFNG0Uu
         OCcyEJ8YxKbnInW7gNof9SiKWZ9OewpxTyzQRqWp3+bdM9OfO8ouvE4+Q69Vjvd2mmRn
         Zyh0ab7csZsbUXNHNvLoV3ER+dx4wqDBkKLYpf+NqL9ZWKAq2nBbk/c5KO4Mdq3siYR6
         a84zSalrTv0kMthh12MzraoHTUtDbbdFxJWnoKFb5ClP3s2767zMF8QElqM8c00cazjX
         cjYOyHPOuZDm3HHFHVEdzFIo9BYjIKfE73XdVvon7aR6FA9Rkcahb0+7Wu4UANU4FbH9
         kmqA==
X-Forwarded-Encrypted: i=1; AJvYcCWvT1nabrhfUG5dHgEyxBzLM+J2K/+oDTOijvA/j7AtV+TCCeHhEqTs8uGyYXWHu4OtIEqRU4lCSrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuexjCXaylkcuoGwR/Bt4YY5lyhkeYqXB0dWmaLSx9c+P0UXYK
	TEGkjPhTcykcj+oQ19Dl3qIlvLbNsXI33tuW4vnahvK8mYoADrZQXUeVQ9xDtg==
X-Google-Smtp-Source: AGHT+IElBa1AeusaJ7Rc+EYN40MevDb4JqaRXy9GSmz4m1lAkuyebAviUYmtpq/8QpnvKiqHR/sQPw==
X-Received: by 2002:a2e:a543:0:b0:2f6:6198:1cfa with SMTP id 38308e7fff4ca-2f91ca4a9a2mr46958151fa.41.1727333427416;
        Wed, 25 Sep 2024 23:50:27 -0700 (PDT)
Message-ID: <2c550860-97fc-487d-9799-e543de15fff7@suse.com>
Date: Thu, 26 Sep 2024 08:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/boot: Refactor BIOS/PVH start
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-3-frediano.ziglio@cloud.com>
 <88189db4-c89c-430d-b96f-46259993fb5e@citrix.com>
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
In-Reply-To: <88189db4-c89c-430d-b96f-46259993fb5e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2024 21:33, Andrew Cooper wrote:
> On 25/09/2024 7:00 am, Frediano Ziglio wrote:
>> @@ -449,62 +458,40 @@ __pvh_start:
>>          mov     %ecx, %es
>>          mov     %ecx, %ss
>>  
>> -        /* Skip bootloader setup and bios setup, go straight to trampoline */
>> -        movb    $1, sym_esi(pvh_boot)
>> -        movb    $1, sym_esi(skip_realmode)
>> +        /* Load null selector to unused segment registers. */
>> +        xor     %ecx, %ecx
>> +        mov     %ecx, %fs
>> +        mov     %ecx, %gs
> 
> Honestly, the more I look at this, the more bizarre it is.
> 
> We should just set up %fs/gs like we do %ds/es, which in this case is
> simply to drop the comment and the xor.

What's bizarre here? As long as we don't use %fs/%gs, it doesn't matter
much what we set them to. So yes, they may be set to what %ds etc are set
to, but they may as well be marked unusable. Documentation-wise that's
cleaner imo, as down the road - when a need to use one arises - it then
won't require auditing of all code to figure where the register(s) is(are)
actually used (just to find: nowhere). Even if a comment to this effect
was left here, I for one wouldn't trust it in a couple of years time, but
rather fear it went stale.

Jan

