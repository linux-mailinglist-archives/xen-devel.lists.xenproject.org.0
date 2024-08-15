Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A98952C32
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 12:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777983.1188055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXm7-0006U1-EJ; Thu, 15 Aug 2024 10:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777983.1188055; Thu, 15 Aug 2024 10:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXm7-0006Qh-Al; Thu, 15 Aug 2024 10:32:11 +0000
Received: by outflank-mailman (input) for mailman id 777983;
 Thu, 15 Aug 2024 10:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seXm6-0006Qb-2a
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 10:32:10 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ffea4af-5af1-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 12:32:09 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso663775e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 03:32:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396d375sm79711666b.221.2024.08.15.03.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 03:32:08 -0700 (PDT)
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
X-Inumbo-ID: 9ffea4af-5af1-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723717928; x=1724322728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EGsjvC942kx9kp0whsx4H5yJiPjZMLgP8DFO/iTkuM8=;
        b=I2mT3fRjTSs0neZdhw7tNKeNh93pq1SvgFkw8sovwxoSCnrDZX94ECNfzNCkSqmZCW
         cbJlK7sSrnpycB0IwaScT2mDVYsu2fd9m4wCQK4RuVczzYn03wZI17iTrHJDvUdK+CI5
         Jt3jBTI6t8tcPVUifTsdrgKdQv5e6AHhbk2d1a2UrCwnY+L2TywIRWhxSs1qqq4Ufrfd
         Rpma2QxUZPnxfzGV3+KBODQuMZOIay7XyaxYoqr4LzBDUPH02qW/buKw6Df54cDGjAJb
         0NFpragoOXAPXwiO4TNluzvfgNJroiWq035bcC1p/tuDjcD5auTDZ/+rUWL0zDU4ioA5
         RRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723717928; x=1724322728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGsjvC942kx9kp0whsx4H5yJiPjZMLgP8DFO/iTkuM8=;
        b=AuExzfphGInw0wtg9Dk+bATv7M936kARD83NXnADYoFM5ZlzYSjxcE0IBLvzkYDvaB
         ckLA+PRoNAVJECs3gjxMy+RLMTEYJgajDEgw9GSQGlIbigvba0jIxDNZ69TSbNxNpbgK
         TQqYZMZuUD9JnG6WRGqScCpaEHS4iYgxUGRV2EeleDZX38APcfpaL3mdn/0ecXKKdIfu
         0xz/ORrCFA9Vur+y1d1jhuVAcwvYTTLZxkwYU+43ATiV3KlUxfSFiMgdmGYT99WpcTCH
         HF/K5lg/5UjKq1PrKiwkKxhBKD8BhuKptrqj8/m/NlKQqnrWV4IPeXG3gegYDtlu8tGG
         1kGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjliEaIO5ZTYiqHoXOLP0V+PyKlnJo/6naaB401ZWgD4CpiiD1ht1e10nYtC3RLb0hucaMWgmVfCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgKcwoQzkvfNBp8YjQ7mK9s/81s1XcybAY3SaPVNm+PHlZsLaB
	qo0+sZCu/scW6VYd0iklT/1tH8KOQAlGXlK0YVKkNX0tNHyLSy38TbQN1ZRMPQ==
X-Google-Smtp-Source: AGHT+IGcJ6jjmA9EOrE5v78bCNWVAZyjyp6gihc/kKxloWVqxwBL2MsnG8bXirYP5g8ULIrsQex2Wg==
X-Received: by 2002:a05:6512:3b2b:b0:52e:99fd:d386 with SMTP id 2adb3069b0e04-532edbbee60mr3601374e87.50.1723717928315;
        Thu, 15 Aug 2024 03:32:08 -0700 (PDT)
Message-ID: <023bb28d-1acd-4988-a8a2-110bcb43da63@suse.com>
Date: Thu, 15 Aug 2024 12:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
 <34cbaff323d9619f8d4cb1d2b8ed12584037ee0d.camel@gmail.com>
 <959f33b6-3649-45b3-8f31-ec494e60fd80@suse.com>
 <f23aadf93c41b6045cfc5879b5b287ada7c9ef7b.camel@gmail.com>
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
In-Reply-To: <f23aadf93c41b6045cfc5879b5b287ada7c9ef7b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 12:00, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-08-14 at 17:53 +0200, Jan Beulich wrote:
>> On 14.08.2024 17:41, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
>>>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>>>> +static unsigned long sbi_major_version(void)
>>>>> +{
>>>>> +    return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT)
>>>>> &
>>>>> +        SBI_SPEC_VERSION_MAJOR_MASK;
>>>>> +}
>>>>
>>>> Can you use MASK_EXTR() here, allowing to even drop the separate
>>>> SBI_SPEC_VERSION_MAJOR_SHIFT?
>>> I am not sure that:
>>> (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) & 
>>> SBI_SPEC_VERSION_MAJOR_MASK == MASK_EXTR(sbi_spec_version,
>>> SBI_SPEC_VERSION_MAJOR_MASK)
>>
>> How come you're not sure? That's precisely what MASK_EXTR() is for.
> As the order matter here. First should be shift then applying
> SBI_SPEC_VERSION_MAJOR_MASK, as SBI_SPEC_VERSION_MAJOR_MASK is defined
> now as 7f. If SBI_SPEC_VERSION_MAJOR_MASK set to 0x7F000000 then it
> will work.

The assumption was of course that you'd adjust SBI_SPEC_VERSION_MAJOR_MASK.
That's the underlying idea after all: When the mask is shifted to its
appropriate position, the shift amount needed can be calculated from it.
Hence the lack of a need for SBI_SPEC_VERSION_MAJOR_SHIFT (and alike).

Jan

