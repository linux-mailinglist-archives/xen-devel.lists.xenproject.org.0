Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1907925684
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 11:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752836.1161074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwA8-0006sW-0j; Wed, 03 Jul 2024 09:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752836.1161074; Wed, 03 Jul 2024 09:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwA7-0006qs-U6; Wed, 03 Jul 2024 09:20:27 +0000
Received: by outflank-mailman (input) for mailman id 752836;
 Wed, 03 Jul 2024 09:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOwA6-0006qW-Uy
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 09:20:26 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d65ced-391d-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 11:20:23 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so6274568e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 02:20:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708045abc8csm9906522b3a.180.2024.07.03.02.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 02:20:22 -0700 (PDT)
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
X-Inumbo-ID: 79d65ced-391d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719998423; x=1720603223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ne0A+c0yF9QVLUQeQAORx9Q7T7ApyGXfazDGupnRYvU=;
        b=eIhYkJrjNfWGSjCXLlkikzp9iSPv4BmKx3krg11Pa+RxfrcCR/vpw1gLLu+JSm1VNj
         v1tAKiZjBh+8j1vnpnM1WAfVQJ1xPdkDH4qubiVGRJQoN7ZVrJamdJPyMDhraX1qyKYp
         lOmjkKly+0mQMC7fBhkg7DVEn+7/+R5MrGEzq0lohmYGHZBa2Y4FPYF6xiAbiiR2pSSi
         33zvxYf87fygS0wNi4X1YBH88VAluNHJ7Tvj7d2OZSoPKj0gDpRXafopuP7SnJpRCdov
         vlIXoxPFdYSDlDODusnj2MtZlxLqed+irSr+JCzYRNFBm0ruqqCIDx20QBmGRpMi0/Va
         Vxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719998423; x=1720603223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne0A+c0yF9QVLUQeQAORx9Q7T7ApyGXfazDGupnRYvU=;
        b=SWzKz5/kTmUs4rergNrruyQ5cnck02X6x+JSkKS8uU5NABNoRqXjoZK2r+Sr6eG+/n
         eIXB4IgqsqKiD+JWfJP4QXhCbTlwP+94k9B1bSe/2TH4DQVSQtTgrtiQkTQeazbRpZRn
         56sUi2HPywWbES+nMWb/cxgrCThdC2Dqxh3HntUoOj/O7E4no9c1mntmUTQYvAIMWiOD
         +s8QQ0j78XCAZxxQCD81XobcIsCnOT6dQqX4JQS/JpAnArvA94W6eQ5X+S/gUa0ydp3L
         JRJHU69I9ar4uC8UDCO2qyWp1JtbgiiKLMrFpQ3z+uhUdXM6bu22ao85omOSBqToRSc6
         Apcw==
X-Forwarded-Encrypted: i=1; AJvYcCXe7xKEKFNfmsdthUE4ks3OmDmUa15WuUlTXrs9YejPg6QUH0310ChSy32bOHnAUeNwA70HcAdahurZjasyvusIDqyXgbBNVVgJ6GtE/B8=
X-Gm-Message-State: AOJu0Yxh+Zg9OSia4MQx0zMedc5Xt6dKq0bh+K6XcQPB4iQoODC9g3ak
	MuOIjqP4ydTXzoXpWGANFzjw8qQr28B6yldmSMf+BuHAjx9vc2jHxFMkHh0vrA==
X-Google-Smtp-Source: AGHT+IEJfJ/RAF96iuDLs/QOX2ndAfAe8cSb2TM2kz4MyafxgAmvBS/+Rw1OuiQAW2Rgx0S8w8bPGw==
X-Received: by 2002:a05:6512:4014:b0:52e:7f23:5d8d with SMTP id 2adb3069b0e04-52e82685f67mr7306447e87.30.1719998422771;
        Wed, 03 Jul 2024 02:20:22 -0700 (PDT)
Message-ID: <02cf1ef7-a0d8-41ce-aa1a-f4ba3ce98ba0@suse.com>
Date: Wed, 3 Jul 2024 11:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] xen: introduce generic non-atomic test_*bit()
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
 <630de29e-e350-47ee-b451-5312befde5ce@suse.com>
 <ad6835dad7bee82bbe0aa66ca9a5070412fcd826.camel@gmail.com>
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
In-Reply-To: <ad6835dad7bee82bbe0aa66ca9a5070412fcd826.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2024 10:47, Oleksii wrote:
> On Wed, 2024-07-03 at 09:24 +0200, Jan Beulich wrote:
>> On 02.07.2024 13:01, Oleksii Kurochko wrote:
>>> The following generic functions were introduced:
>>> * test_bit
>>> * generic__test_and_set_bit
>>> * generic__test_and_clear_bit
>>> * generic__test_and_change_bit
>>>
>>> These functions and macros can be useful for architectures
>>> that don't have corresponding arch-specific instructions.
>>>
>>> Also, the patch introduces the following generics which are
>>> used by the functions mentioned above:
>>> * BITOP_BITS_PER_WORD
>>> * BITOP_MASK
>>> * BITOP_WORD
>>> * BITOP_TYPE
>>>
>>> The following approach was chosen for generic*() and arch*() bit
>>> operation functions:
>>> If the bit operation function that is going to be generic starts
>>> with the prefix "__", then the corresponding generic/arch function
>>> will also contain the "__" prefix. For example:
>>>  * test_bit() will be defined using arch_test_bit() and
>>>    generic_test_bit().
>>>  * __test_and_set_bit() will be defined using
>>>    arch__test_and_set_bit() and generic__test_and_set_bit().
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V14:
>>>  - Nothing changed. Only Rebase.
>>> ---
>>> Changes in V13:
>>>  - add Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V12:
>>>  - revert change of moving the definition of BITS_PER_BYTE from
>>> <arch>/bitops.h to xen/bitops.h.
>>>    ( a separate patch will be provided to put BITS_PER_BYTE to
>>> proper place )
>>
>> Oleksii - seeing that this wasn't actually done (as noticed by
>> Michal), my
>> intention would be to adjust the patch while committing. Please let
>> me know
>> shortly if there is anything I'm overlooking, possibly implying the
>> intended
>> adjustment shouldn't be done (and further suggesting that the
>> revision log
>> then is wrong and/or incomplete). As indicated, I'll need another
>> reply of
>> yours here (and for subsequent patches; maybe simply the entire
>> series)
>> anyway, as a release-ack is still missing.
> The changes log is correct.
> 
> If we are going to drop BITS_PER_BYTE in xen/bitops.h, then it will
> need to be added back to <arm>/bitops.h as it was done in "Changes in
> V12". (This change was lost somewhere due to an incorrect rebase by
> me.).
> 
> Regarding Release-Acked-By, I was okay to have this patch series during
> Soft Code Freeze but now we are in Hard Code Freeze state where I am
> expecting to see only bug/security fixes.
> 
> Unfortunately, it would be better based on current state of release to
> wait 4.20 staging branch.
> 
> Based on that let me know if you want me to sent a new patch series
> version with BITS_PER_BYTE adjustments or it still could be fix during
> the commit when 4.20 staging will be available?

I'm okay either way.

Jan

