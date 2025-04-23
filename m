Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB649A97FEB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964001.1354880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7U2R-00083I-Qe; Wed, 23 Apr 2025 06:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964001.1354880; Wed, 23 Apr 2025 06:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7U2R-00081Y-N0; Wed, 23 Apr 2025 06:56:55 +0000
Received: by outflank-mailman (input) for mailman id 964001;
 Wed, 23 Apr 2025 06:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7U2Q-00081S-5q
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:56:54 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228f7f8e-2010-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 08:56:52 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso49443835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:56:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d38118sm14150745e9.31.2025.04.22.23.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:56:51 -0700 (PDT)
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
X-Inumbo-ID: 228f7f8e-2010-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745391411; x=1745996211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tKWEaUbZW4TOsQqLn7KnL4yXgc/YZBmsRSo6GnZlJgk=;
        b=GI9hbKm5hIko+pZxDCiOpqO0VXmkyYnQ9A/OuM0oPu7zc7p6TRCGXaOdejG4VmldXE
         dC1sYA217HP3Fh6x883zmTJkZcDE1YS802UkXTsD+YJgDexV7wKiLHWOvPvXxUOUOkid
         gTNsl0LCrrpgTUBs7V3nZUPt4zfbRZou8YWHzEFhXpmrUwuqGjM2+wntXkRHwQZR19nD
         hbVhNPrpTRMCw2JeNmIY8We3tcUrgPIIiDEinNhIQG/OKAnOKidqXOS6dOZkKT1k7nKO
         ZPTXGtjSnStGC5gHNbhKNQRYJGHiOEoyS19PG8+gh/Bv6ZPk9L3rBEbXG54I0/V18p+c
         TtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391411; x=1745996211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKWEaUbZW4TOsQqLn7KnL4yXgc/YZBmsRSo6GnZlJgk=;
        b=V0VnQlAjfu/p3uyBmqfuzy2XI2q0326k5U/bQghP6OHdTeZpmydscxuzdZdtoXB0dE
         LQgf74R3CeXdtIMdyrozyTXBd5VL3iEETZ+YDYigrvQnsqSsSHFGgzJsWeELkk9MnYWi
         oOYPFt9/4LvbNE+tFo6kjwh+Y71jWy2wdDkyd8BIYIYOjfLP387eEKlsEpEpxuxzdDvS
         Jo74sJ0gOuf7+33OWfPmv4MtMiIdg4hOzA3S3z+orQc6ZCSyOGgQaTccPPNP+2bLJJ9k
         avzwE87hqAU6Mq6VmTZ6fZe3I5CY6W9eg4uOT5nbbqGs5EKZsnIvv6/vfoT+mJA6maqs
         uD+Q==
X-Gm-Message-State: AOJu0YxYa47R6dzAjEa3/8sUEnwb29Nx5SrFVA2TeTIj2nKmJSSCr8lb
	RCiPnleFLEol3UQCGDcJig0Y54F/mAyQJrZSfWJe3Wof8z+5UjyHwwya4h559g==
X-Gm-Gg: ASbGnctHLvh5iAYuEMqNqOFASYQAd03XJ8yUmAUD4QVV5sCnMBj+c45ZFSy8m/IPw9F
	HFVo+yMEtPD4Lpbtw0Q7FuHK6tOhfodHODXU5eIznf+aSvg/f0R0FB5utxAWVgm+ALGjLqo5Chd
	udcDf/CHRTHauVkkuhDbK2qGoeqmFCrMjmRtFFicTIJMsudOgUlXn7M09vkuv6DHrziCV0md8Ge
	ycdkmOmqlKQNVSP7NaGtPzwyi4xyi3LciBSEg+SAgMIIp5rsZt3Xy2uLc7xy/5gQ/BdfxhkWWwl
	4tUexO8Z5QncPwg7bQLL06QocTS4DswD27w0E6+uVkpjHa7OYddSoTGJBNjK6i2PNv7QnBiLThk
	4JJvj/+gaxmiy4+RqjYPDemzlcA==
X-Google-Smtp-Source: AGHT+IEFHoeTnD/bfmieebuAEDgnC5/qE86gV3pTAFpfkOXMznGgRE5ZB83Vya7xqM5xoHtpweBIvA==
X-Received: by 2002:a05:600c:4686:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-4406ab677aamr136877895e9.5.1745391411496;
        Tue, 22 Apr 2025 23:56:51 -0700 (PDT)
Message-ID: <9fca39ed-e3f2-45db-8041-1157eaecd25d@suse.com>
Date: Wed, 23 Apr 2025 08:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Update __vmread() signature
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250422011530.3010312-1-dmukhin@ford.com>
 <c76427bb-87b4-4c51-a057-1942b9c3d92c@suse.com> <aAgUKi8DadC6ZPMI@starscream>
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
In-Reply-To: <aAgUKi8DadC6ZPMI@starscream>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 00:11, dmkhn@proton.me wrote:
> On Tue, Apr 22, 2025 at 09:56:00AM +0200, Jan Beulich wrote:
>> On 22.04.2025 03:15, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Current implementation of __vmread() returns the result via pointer argument
>>> which leads to having excess code in some places.
>>>
>>> Update the signature of __vmread() to return `unsigned long` and drop the
>>> pointer argument as per suggestion in [1].
>>>
>>> Update all call sites everywhere in the VT-x code.
>>
>> You did read Andrew's reply to v1 before posting v2, didn't you?
> 
> I missed to address the function name change request, posted v3:
>   https://lore.kernel.org/xen-devel/20250422215833.522007-1-dmukhin@ford.com/

That was only part of what was asked for. Andrew also gave a pretty clear outline
of how to avoid the need to touch all use sites in one single patch. Plus he
explained why it's better to do this in smaller steps.

Jan

