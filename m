Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE1BF5AD0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 12:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146975.1479310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB9CS-0006SN-5U; Tue, 21 Oct 2025 10:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146975.1479310; Tue, 21 Oct 2025 10:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB9CS-0006PN-12; Tue, 21 Oct 2025 10:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1146975;
 Tue, 21 Oct 2025 10:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB9CQ-0006PG-3s
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 10:02:38 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 117c8e90-ae65-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 12:02:36 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so29612095e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 03:02:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494a91c47sm15476155e9.1.2025.10.21.03.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 03:02:34 -0700 (PDT)
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
X-Inumbo-ID: 117c8e90-ae65-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761040955; x=1761645755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CN10TbGqcRdEPaJIFMAwTedsuIkuHG9llWs0il6133g=;
        b=J+dWVM9JilkT5k7eVSgN52Iw0clxznSpwekpAvel5dzfMkpAK+rKs0J/vMhKQI8PTu
         JKXTTvodZRddls+RzheiJEYB+pM+pvBE3H0UtMIFqo04mz6aBk+9sncWaQe07Ag4NNoj
         h06Twpzdx21q7RYHapeVBPlfUh0fdm8EQmwRdIib4M4bo2Kb2nUApLDZdEERDOxS9TW9
         tznb9LqTTrzjAaqfWon3rZYmBk1mVL4flX4OUh1KbQLCxincolo+g9kbDOIcDVqaVUU6
         Zvsco/lmM9RegAZR/T8s6GCb5bHh8bYZ8ggF2TUrJ6LwWkBHvW0KnL+gSDviWSiISbTd
         Xkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040955; x=1761645755;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN10TbGqcRdEPaJIFMAwTedsuIkuHG9llWs0il6133g=;
        b=jticGCORZkSazI8VCJS8W1jNDKhH2CfJ7U/+JmS3fKoj4VvIxsnx2gYjXS1rUAnppq
         flhJbIob/bs+/2yVl8HRWstbs8HyHKqGZviZpssufkCls1DxyweuV699JymzM9413NbH
         9R9+ISynN+VYELSLrtbHX3f6l8VRS6VIWjAtE2WtTCUfqpVh6VMLNZxiWmF1ljlEHqlE
         4GfaVjuH5AohRn1cf3zQ338uda32lFqRaFa5KweE5/4rG54z11L6GA0g38feecTxZvUS
         KSKfSTNhZelZAAeYCK5s9Fcm6l+/P9ubp4YtW78eRJb39+P5+HvYMu5pORIOHswMz8/z
         joiw==
X-Gm-Message-State: AOJu0YyJxsIWNHz1nQ3LrCvy6oULMTGSx1vQhOXjaX2gKGB8wNOvGZEW
	QruYNZa9+Ubzzu/Gpybyt7ze5X6Qj2AODi+9dugogVk5Gbz0d1P54napEaH3FqL8Gw==
X-Gm-Gg: ASbGncvwOFVQBodjZmz6gNalDueD+BBZGkdi0Kxy19gl5NLcEqw4MOpdzTW76KitEbg
	hLvSc/gvtI2IQuzysxaBXQ0WlWOq6gKMEHpfqobd4bXtE5BFJUOQJB39pnUBTrsOU99koLtbVZ7
	O0wLCIvOL5QfoEFemxMoZfBGs7pohbLl2C2ZB4169/l5juKdIu+aBpx4HnOSeCHJw4hJhvd3plN
	T9ewmxcL8vjwMZ7HywMsqy2pYcHUSOAApSijZFJoEpfjT9neLax+WlNl5lTuGRFQk+tcDkGSjVM
	UOpW22XZ0La8WsgicQzzwDmnKSUKPfrWKamxehAEMU9VORBn3nZtYNwB8FL3snBwosa0wlBlwf6
	8gOBdC7TR5wYHYrrLZU5RSSfRCYIXpO4jzvGMdG+sYqt8/XkOD3VuX5ebA0ajr1vA0wSm+gKIFi
	cmcj+YIfMFB5zMp9JZBYwL5vtDRu7tVdprlPB3RYfRKw6GvIag7+1mr34oHXWk
X-Google-Smtp-Source: AGHT+IGzCRu54PK1C2JKVlEeenAE9Zd1KXtiLJ/NP+4KRPksGpEApozLymKLUJ11J4I9Hxut54tn1g==
X-Received: by 2002:a05:600c:450a:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-4711791cb1fmr123629665e9.35.1761040955060;
        Tue, 21 Oct 2025 03:02:35 -0700 (PDT)
Message-ID: <434fd92e-911f-41f5-99c3-706122631960@suse.com>
Date: Tue, 21 Oct 2025 12:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable
 handlers
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
 <aPdXCTvrcUHv2uQM@Mac.lan> <5b98c3a7-c3eb-41c5-af60-2ade0556085a@suse.com>
Content-Language: en-US
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
In-Reply-To: <5b98c3a7-c3eb-41c5-af60-2ade0556085a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2025 11:59, Jan Beulich wrote:
> On 21.10.2025 11:48, Roger Pau Monné wrote:
>> On Mon, Oct 20, 2025 at 04:16:13PM +0200, Jan Beulich wrote:
>>> @@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
>>>      return 0;
>>>  }
>>>  
>>> +static void cf_check iommu_msi_ack(struct irq_desc *desc)
>>> +{
>>> +    irq_complete_move(desc);
>>> +    iommu_msi_mask(desc);
>>> +    move_masked_irq(desc);
>>
>> Not sure it matters much, as I don't expect IOMMU interrupts to move
>> around frequently, but do we really need to mask the source?  The
>> update of the interrupt would be done atomically, as we know IOMMU is
>> available.
> 
> First I wanted to keep things in sync with other, similar functions. Then
> the masking here may be not only about the moving, but also about this
> actually being the .ack handler. In fact, when taking into account the
> combination of both aspects, don't we need to deal with the case of this
> being the last IRQ on the "old" vector, with us wanting to prevent another
> IRQ on the "new" vector until we actually handled the IRQ? The LAPIC ack
> (only done in the .end handler) wouldn't guard against that, if the "new"
> vector is a higher priority one than the "old" one.

... or on a different CPU.

Then again such nesting is avoided by generic logic, in particular via the
IRQ_INPROGRESS flag (in combination with the IRQ_PENDING one). So perhaps
you're right and the masking could be avoided (not just here).

Jan

