Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46158B3603
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 12:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712638.1113460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JB3-0005Bm-An; Fri, 26 Apr 2024 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712638.1113460; Fri, 26 Apr 2024 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JB3-00059A-7g; Fri, 26 Apr 2024 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 712638;
 Fri, 26 Apr 2024 10:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0JB1-000592-Tz
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 10:51:35 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b27ee2-03ba-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 12:51:34 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51b09c3a111so2762527e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 03:51:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 el5-20020a056402360500b005725e1100b9sm192543edb.54.2024.04.26.03.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:51:33 -0700 (PDT)
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
X-Inumbo-ID: f2b27ee2-03ba-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714128694; x=1714733494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqMPJs6GSXdJLBvDgz4ntcAfwPDuACaaty5tFMN/xQE=;
        b=RxuqBPTvZ5x8Y8iOYyPBgqvqxr7CUwO4IYZIDhJyKYfbLbCv4w9EQVl8TXCtAnjZGq
         vqWZpjYUnNyfg/6hkT4Xvv9HH5PGd0PicebZbgVfSpAOw2vhxTykdWXnpFviPDYEvuiK
         SMhdpFO/IrKCz30GaR9QB9BrObeKPkV6byjG6v+o26eaDfLHixXy5V+N4+ZZlO6aYZfC
         unNq0wlZl8bTlSiHAnHxfEfc9u/B6o/POiAFYYaxvGDQdcd6hmUpiPcZlrKx3lMqxx7O
         YaEBYy4boYiPXIStwlC+LMWJCVRu0ZEtecaGkmM+f6/u1cio+ZJ9//E5JmU2VZK+iIsJ
         46kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714128694; x=1714733494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqMPJs6GSXdJLBvDgz4ntcAfwPDuACaaty5tFMN/xQE=;
        b=gic0l6rfSOxgwHBaEA5eoQ8x/QA36U3vN85DFZT3A5RBzZFZt8hnRYYzLDi4JhPkUB
         EVBgplqaDRbWdqXB/C0shomt5frusFD483q7e6kLIFdjQ2mIpbdBydNmLvDiRZdRv3Hj
         KqMRagho5lbSvD+s0+QS1pofO2jJC29uig+JMF3G2kFDqoVk3gD+qeUwfvTAUXu/Iooi
         THZD2f34Hna3yDbjljVH/QeQxl/9psuV0GYwCPLQPL9clAIS0MxKJvbNTn9pdw1jjS0V
         ialh0J15gdPsk3FIg+AD09xnor7b0dxXH8x1IqOrPC1eBlTaXCBLjiO/i3TXBW1Wm+DK
         Kbng==
X-Forwarded-Encrypted: i=1; AJvYcCUwtcElwnavmt2oh4ahDc4WlfNZ2GrVh06nMK7pMu81LJyNSN/V8Q4U/JJoSlIi5WIiztnFKIo0DvkJ4w1uKdoVQT5ZoBylDyU6vRnaOqk=
X-Gm-Message-State: AOJu0Yy3Rwo3WHuuFmrMeKSviT7LcQG9EAiZHOHx7CzUUreJehqett4Z
	E1gzyaPSfHOPcjrAS1hni4fkTaiTdD8WHOcB65UnycvoQx3wBSN+QKulK45qYQ==
X-Google-Smtp-Source: AGHT+IF8V1T4XSwiCIS1kjA9StsHcYkxoDb9oOFxMeAq6pRyGBsy0wBIHdK6pOutiz5YzdL2PxpvXQ==
X-Received: by 2002:a05:6512:529:b0:51b:14f9:3f1d with SMTP id o9-20020a056512052900b0051b14f93f1dmr1395664lfc.30.1714128693812;
        Fri, 26 Apr 2024 03:51:33 -0700 (PDT)
Message-ID: <d1f546dc-35bd-47f9-89be-582660d23ec1@suse.com>
Date: Fri, 26 Apr 2024 12:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
 <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
 <fb1a228b1bd58d17d7836c3413d3b0a8a9602978.camel@gmail.com>
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
In-Reply-To: <fb1a228b1bd58d17d7836c3413d3b0a8a9602978.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 10:21, Oleksii wrote:
> On Thu, 2024-04-25 at 17:44 +0200, Jan Beulich wrote:
>> On 17.04.2024 12:04, Oleksii Kurochko wrote:
>>> Return type was left 'int' because of the following compilation
>>> error:
>>>
>>> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer
>>> types lacks a cast [-Werror]
>>>        18 |         (void) (&_x == &_y);            \
>>>           |                     ^~
>>>     common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>>>      1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e
>>> - s) - 1);
>>
>> Apart from this I'm okay with this patch, assuming Andrew's won't
>> change in
>> any conflicting way. As to the above - no, I don't see us having
>> ffs() / ffsl()
>> returning unsigned int, fls() / flsl() returning plain int. Even more
>> so that,
>> given the LHS variable's type, an unsigned quantity is really meant
>> in the
>> quoted code.
> If I understand you correctly, it's acceptable for fls() / flsl() to
> return 'int'. Therefore, I can update the commit message by removing
> the part mentioning the compilation error, as it's expected for fls() /
> flsl() to return 'int'. Is my understanding correct?

No. I firmly object to ffs() and fls() being different in their return
types. I'm sorry, I realize now that my earlier wording was ambiguous
(at least missing "but" after the comma).

Jan

