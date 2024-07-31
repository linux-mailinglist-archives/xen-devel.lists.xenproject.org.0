Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2819432E1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768892.1179780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZB2Y-0007HK-1v; Wed, 31 Jul 2024 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768892.1179780; Wed, 31 Jul 2024 15:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZB2X-0007Fj-VL; Wed, 31 Jul 2024 15:14:57 +0000
Received: by outflank-mailman (input) for mailman id 768892;
 Wed, 31 Jul 2024 15:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZB2W-0007FS-6G
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:14:56 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a849a9-4f4f-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 17:14:55 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so89582661fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:14:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9026fsm793433866b.145.2024.07.31.08.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 08:14:54 -0700 (PDT)
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
X-Inumbo-ID: a4a849a9-4f4f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722438895; x=1723043695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz7HXKxvOUNkM7HKYp9Io9e7HY+vg8LQ0/8P7swjnBA=;
        b=f27KhloMSK8mVSjLC0T1LKPS5ib2LHGpXhoM9ejigzn3FGFMhhf84n28hrHRx/bJmm
         AqHeOknsiRu0sAbHKzlmluzbidpktm0WEEQsTtNz9Wjt85yTtNdQbLzFR9iivxxHePeT
         hql8QmtFtJemeulyfODolGD25IdZZOyky25VevgZXB/ZPpRrFORp4kveE5o2HHM0qHQF
         dmmeeKGdZR4YEtwCgC9cOt4eygvgtMMMgjpmElOkKB/QdUhwvAVbRhWwJ9pUewXqtlu8
         sFRfkahp0/ZzRkdDH0QccblEAFngi8MqIVE8F3pTzdNw0cIC/H2K6/LUWm+t1+n1waYt
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438895; x=1723043695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz7HXKxvOUNkM7HKYp9Io9e7HY+vg8LQ0/8P7swjnBA=;
        b=xNJV8dmodFNerGmMWQoWLtpu6riedoSB7TzB9SlQWNsM45RrVy/CSPe0hGk8N1gRxy
         DuCQDI0QO7GonSoU5hTeRAZQqrzEsrZjah9qJJ6yNZGJf/caQUpTiqrsSRdNrqP4MaFj
         Yd9l7M1xtFfa5SEY40IKg6P3q97aBqznsofnhxKzpeSGHWwhU88WQrsQ9y6mMZQK9LYm
         JCRkv3JN+TR/LMqEUK8yGkiO8N8reGXwolQktBTiErANNASzfa6CmaWT08OxgX3prbTV
         6shRT00urSxq4v510NqNYeYiu1PVszAH7KRXGQBOZBxmNVQMNJnKrYqN2tFV697IVQzv
         TIYg==
X-Forwarded-Encrypted: i=1; AJvYcCW+HB+OFep6YPsmn0pP1ZObbSxORzI9GExJX7+oQaRvVwAURXdICbxVurKRKOuqpqO4d8OajNK9HI8KMCE1msEhZs7cdTa0So98Oad6UXg=
X-Gm-Message-State: AOJu0YyK3jEULNiSIia21eCgleA9QEwX73OoK5S+wB5DCjs0uOn3hjOB
	YnDUkPc4iuceroIPDEV/rUC31KXDaXrbABdsDH8+5GHfmCkusubaUWzELW70Nw==
X-Google-Smtp-Source: AGHT+IFWpzKoJDxLHUMe1ZUgd2B0+1UXwjaGZmJjDoDrssDgIlZ5/o7l9HCclftUQZ3a4qunZNoxzw==
X-Received: by 2002:a2e:3a17:0:b0:2ef:22ef:a24a with SMTP id 38308e7fff4ca-2f12ee57c24mr117902251fa.31.1722438894745;
        Wed, 31 Jul 2024 08:14:54 -0700 (PDT)
Message-ID: <36cee24e-e9c3-4a22-a2f7-cec6c3ffcf74@suse.com>
Date: Wed, 31 Jul 2024 17:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] SUPPORT.md: split XSM from Flask
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <121c2612-c255-4051-8d7c-315df6b3d348@suse.com>
 <a1fc969a-aa91-4daa-92ff-931a2c5c8f37@citrix.com>
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
In-Reply-To: <a1fc969a-aa91-4daa-92ff-931a2c5c8f37@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 16:59, Andrew Cooper wrote:
> On 31/07/2024 3:28 pm, Jan Beulich wrote:
>> XSM is a generic framework, which in particular is also used by SILO.
>> With this it can't really be experimental: Arm mandates SILO for having
>> a security supported configuration.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Terminology adjustments. Stronger description.
>>
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default
>>  
>>      Status, x86: Supported, not security supported
>>  
>> -### XSM & FLASK
>> +### XSM (Xen Security Module)
> 
> I'd suggest using Modules (plural) here.

But XSM itself is just one thing?

>> +
>> +    Status: Supported
>> +
>> +See below for use with FLASK and SILO.  The dummy implementation is covered here
>> +as well.
> 
> I still think we want a one-line description of what "dummy" is.
> 
> "XSM is a security policy framework.  The dummy implementation is
> covered by this statement, and implements a policy whereby dom0 is all
> powerful.  See below for alternative modules (FLASK, SILO)."
> 
> ?

Hmm, can do. Looking around in some cases we indeed have such explanations.

Jan

