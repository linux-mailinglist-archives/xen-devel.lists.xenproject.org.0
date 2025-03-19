Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08CA68D22
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920648.1324759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuso5-0000aZ-Aq; Wed, 19 Mar 2025 12:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920648.1324759; Wed, 19 Mar 2025 12:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuso5-0000Z5-5t; Wed, 19 Mar 2025 12:46:01 +0000
Received: by outflank-mailman (input) for mailman id 920648;
 Wed, 19 Mar 2025 12:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuso3-0000Yx-4N
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:45:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae39902-04c0-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:45:58 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so29504505e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:45:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f33242sm18186415e9.5.2025.03.19.05.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:45:57 -0700 (PDT)
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
X-Inumbo-ID: 1ae39902-04c0-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742388357; x=1742993157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3rl34ryBNNb9JNRDevjRvklFEDVjEpS9pBa6d449dGM=;
        b=aWG5t7CquuN0IDTA/FKaanqwI4jcqklBw9N/X9ZLCo0OrVvgwCOWtW4xkq47lOqwQv
         AdYIgWfe8aWi5UxDZ2S2xUiQ2lKwFucZqiYchnIhlRQgDGQ6Oci76u6Y8yNe9jd/3VIW
         Ir0Ocm8mslqxdjPA9lgjPOuWQGqNxTL2KHAtD1ne/qRg76VdetXh/EaBSesCXjO92Oo8
         2tWYxnATeBhrqAlUVjC/PkmWP01ozE1r6CS1A6Dcvr0oji/TT8/h6xvoQ+AIXwukf3Ho
         sxUmRBc61Uz7ZCuA3MzGp4dTDU41Bu0onozis6lYwvFmXoHUk/leWtE7w5h73t33lpHg
         Dstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388357; x=1742993157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rl34ryBNNb9JNRDevjRvklFEDVjEpS9pBa6d449dGM=;
        b=fNNu3XUy5RhfzNkwaiFsDEXlzZaw2D2xxXNd1/TjrSwj5MBC9kitDCgb8wNPtVgjXL
         D3luo6rdz4wQZ3EbpOkwCfNMQv+Jej+lR6Yosf0ieClRlCaCqcTp2f4j/fhcap8BpswL
         vzzXkwJESH7n7tpB/LYEXkJzA/sQPrzDS8rdB+yTrYm47MXh0Kln6hCz4JCBDH/B/jSN
         62EHGIZPJu+uAedbFEn49K+9HspeuKv01cA0qAz9OiPXAi22vfLf8ihmXNPh5ztKuvC6
         ossgFA2w35hqkrn6cqYaXjNF5HAPFa68Ba4UoT5tJZ63Dr6EKRtPklAY/n9CLWOLWLMz
         CUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuxtxEzBwb1/WSSpqodFuu0Spa3X1d/4xkBlLgvqQfDeJotqHOTzAg2hmzTfaKr8ooyoWr8OkcOjI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr5WQaLyEit6Utf1hBR6jV1/a7be/oF75SjtXmBJFqRshEsRT+
	Xem7iIW9u8ByusUgWVeswgparo/yjrCnfOs2beCZlqKY9qMKYp2tkwbHUzhOyQ==
X-Gm-Gg: ASbGncslFvFquTBDNktQGy1Jd8QFCfp9eFzOs7E4FMfclOb/My62Vu44ahe58Mn6Bx1
	wRzNu5avRBbck/M/1on7wR/wc7WHfDcviRsyX9EsGGdwtq8kZkU2InFd6ET+CAaV9fGxcgW8OeC
	+jx+gghj/ahwD1aoImlPRdubSkwsC+pr2E5spIt0e687OiJUsj9ckJfRwm9gryg40w+WALRqPbM
	34CS6VlMQ4i0w8Reh06kSnGExG+TtB5GLd+9cK3r0LiIR7AqoWeg5RKfwj3mBKNnDsXH8/1L3Xd
	SgsO86PgnSAKbHQ00SfDesUDiC8jWqzindBfeDflYzFoaLyYz9gGpeSipfglqbsl1BLtlV/eGHT
	r+kFSxOOa7hb1+vyIuO8JYsxLYASBaw==
X-Google-Smtp-Source: AGHT+IEwFn957NGbM37K0Jd9LJCScYatWfqYE6mqqTl9r9+zLCmi/W3o9JQzuZZQkFCayxqAsmy8bA==
X-Received: by 2002:a05:600c:4f86:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43d4378b49bmr19840805e9.8.1742388357463;
        Wed, 19 Mar 2025 05:45:57 -0700 (PDT)
Message-ID: <bbd59084-096b-4d5c-b66b-438a398859a0@suse.com>
Date: Wed, 19 Mar 2025 13:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] iommu: Add checks before calling iommu
 suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
 <2caf2bc0-d915-413e-ac76-cc70f9010ebe@suse.com>
 <CAGeoDV8=F1suS+0DJAV4uOh1vtMWwV41wwqDx9115t004BWvRw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8=F1suS+0DJAV4uOh1vtMWwV41wwqDx9115t004BWvRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 13:01, Mykola Kvach wrote:
> Hi,
> 
> On Wed, Mar 5, 2025 at 6:45 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -613,7 +613,7 @@ int __init iommu_setup(void)
>>>
>>>  int iommu_suspend(void)
>>>  {
>>> -    if ( iommu_enabled )
>>> +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->suspend )
>>>          return iommu_call(iommu_get_ops(), suspend);
>>>
>>>      return 0;
>>> @@ -621,7 +621,7 @@ int iommu_suspend(void)
>>>
>>>  void iommu_resume(void)
>>>  {
>>> -    if ( iommu_enabled )
>>> +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->resume )
>>>          iommu_vcall(iommu_get_ops(), resume);
>>>  }
>>
>> When iommu_enabled is true, surely iommu_get_ops() is required to return
>> non-NULL?
> 
> As far as I can see, in some cases, the handler is still checked even
> if iommu_enabled
> is true, such as in the case of the iommu_quiesce call.

You say "handler" and also refer to a case where the handler is checked.
My comment was about the bare iommu_get_ops() though.

> However, it
> might be better to drop
> this patch from the current patch series or add a patch that
> introduces the handlers.

Only if they're not merely stubs.

Jan

