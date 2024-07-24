Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDC93AF9A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764078.1174392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYxR-0004As-Os; Wed, 24 Jul 2024 10:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764078.1174392; Wed, 24 Jul 2024 10:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYxR-00048K-LC; Wed, 24 Jul 2024 10:10:53 +0000
Received: by outflank-mailman (input) for mailman id 764078;
 Wed, 24 Jul 2024 10:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWYxQ-00048C-74
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 10:10:52 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00719fb7-49a5-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 12:10:50 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so6904035a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 03:10:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c7d3277sm8786969a12.87.2024.07.24.03.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 03:10:48 -0700 (PDT)
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
X-Inumbo-ID: 00719fb7-49a5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721815849; x=1722420649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ApdJnXK62cp1LdO2dl5gzPGbnDoUV5lCOUwTLb3W4LQ=;
        b=UmQW1Cchl9uNGWswu0pwz8WAcRlBiIydlupeLSv6rkqoFhOD++p+YmjnosfZnOjKxw
         oy3HM8TE0bZNMGwKMfLrrv+bBieg+X/7ClIOEbR7bC4ePQ2q4INejnjgbIOP/NFJNz/2
         XjXNzEw17FLKqLgFKmemCVhbYlPYDOnU2Vq3Wb+9bkfzBWeACiO5GS3V6BRx/vsywNFw
         zdiZHtGLbeVWfaCBmZQn7Vg3E+jTXVO5KtLwSKaWGKu+ezhf2gAMVwqzZbBOfDfTLgHW
         DzfXcTSyLyXMvHfr5Jq2YDze41JfzUGEhdMFqzNXuRH0Xg4bvWS+ouBZs5D2iXsaWLE2
         DF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815849; x=1722420649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApdJnXK62cp1LdO2dl5gzPGbnDoUV5lCOUwTLb3W4LQ=;
        b=rROEs6g1Zu4BQLE0vr+FxWrGOOM5gpOx5WA3JwiptCDc4BGBbi3aOe8jn8/xYOTQQt
         HacgXszrF2xnZOXlpelTnKN4BZ2aR7wTH6TWL4P6/7VVAOXKBZzudjSYIF3RxBM5pHQ5
         RSH65O5MmcWn1jRS8iT3TD6KmF0BmJGrglN1u7NfzuV7iGaz1JKlqhHhbQMaIzeKg6DM
         lmiUNmvHZKeANTixdqjAcD9dFq2AmhufNBLelc9DE6K204ON+tBo4NrRWKQXmdVkxsmy
         v3/Qa9uf2Uu+lJV+RF+cyHBCrfa83Gs9REeO63fVXZERXFf4lx53v/nr/werJhrR0s68
         6dgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61PAHBXA46Jtl7dhBBn+5IUZWVlT2Ep19aMzu99Y3WJVq3bgNuTPzZM54o5Rze4c1mSAvFtOX1q2DNHdUFOeSkCg/5k0RGcxEwv+tdo0=
X-Gm-Message-State: AOJu0YztVYoTV8T3t/lT0UnOwqiCUJppSPXCEqn2CiHy6NBxPqJ+cfbv
	d0tYlVyb3y9sGvFBZI7BuH6N6NsHLA4ooQHjfgddQ0HoLPmKYHlTvPndE545Ew==
X-Google-Smtp-Source: AGHT+IGQ/C+IsbMBJqNm+reijz6rQSBUZS3g/dwFQYf95HDnxhRkcxdurtzTIvKz13OuIb0LblAt3Q==
X-Received: by 2002:a05:6402:2789:b0:5a1:73fc:6bdd with SMTP id 4fb4d7f45d1cf-5aaec95b682mr1321045a12.15.1721815849152;
        Wed, 24 Jul 2024 03:10:49 -0700 (PDT)
Message-ID: <9aaaefaf-07e3-4831-a534-6c28cbeae492@suse.com>
Date: Wed, 24 Jul 2024 12:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IO-APIC: Improve APIC_TMR accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723203701.208018-1-andrew.cooper3@citrix.com>
 <14104805-0f0e-4741-877f-24afffc816ce@suse.com>
 <2e133087-bc2d-47f8-be93-3a356f7b2d0b@citrix.com>
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
In-Reply-To: <2e133087-bc2d-47f8-be93-3a356f7b2d0b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 12:08, Andrew Cooper wrote:
> On 24/07/2024 8:56 am, Jan Beulich wrote:
>> On 23.07.2024 22:37, Andrew Cooper wrote:
>>> XenServer's instance of coverity complains of OVERFLOW_BEFORE_WIDEN in
>>> mask_and_ack_level_ioapic_irq(), which is ultimately because of v being
>>> unsigned long, and (1U << ...) being 32 bits.
>> Which of course is bogus when the shift amount is masked down to 5 bits.
>> May I ask that you express this somehow in the wording.
> 
> How about this?
> 
> Coverity's reasoning isn't correct.  (1U << (x & 0x1f)) can't ever
> overflow, but the complaint is really based on having to expand the
> RHS.  While this can be fixed by changing v to be unsigned int, take the
> opportunity to better still.

Reads good, thanks.

Jan


