Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE3A254A8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 09:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880474.1290547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tes0u-0000Jm-3V; Mon, 03 Feb 2025 08:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880474.1290547; Mon, 03 Feb 2025 08:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tes0u-0000Hz-0p; Mon, 03 Feb 2025 08:41:04 +0000
Received: by outflank-mailman (input) for mailman id 880474;
 Mon, 03 Feb 2025 08:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tes0s-0000Hq-TB
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 08:41:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9739a17c-e20a-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 09:40:58 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so790428566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 00:40:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47f18e8sm711482866b.76.2025.02.03.00.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 00:40:57 -0800 (PST)
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
X-Inumbo-ID: 9739a17c-e20a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738572058; x=1739176858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y0xBbitpS9i8ni377JlZcv1Y5PcoH7Rr8Lrb2D13J8=;
        b=RC9VzAvtjWPm6xAswku4ma4cM7hjGaEhD32QN/eXSndqrg6X10m4Qlq/cCC0hGtjD7
         iE3jxhDpQMUn1hPFpV9hio935LCkOAehz6Qqf7/0LSKpSy+4jJSYJnMMogjRlTJtzoY3
         E92mZ158U3ymTvefz00lU4ei0yhjlbQ0B7R4YSCe4F9FehD4AjYxRwTgnDJ+ViMXU+ro
         xbzFg1HxqEs77ynRavs7jPKvtddUOvU4WONydYdWfVys7Ic33DZVTySkvYwNZ0snSrbe
         QNVnPRHBCL/7OOiUid3mZ7iuLr5e9PiAPFq6xnC4ppeccyqriNmDJgly+BKWdNCMhOSC
         QNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572058; x=1739176858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y0xBbitpS9i8ni377JlZcv1Y5PcoH7Rr8Lrb2D13J8=;
        b=BOxLa3rvmbTFAeuge00LCC5xxRzEo/ae/Lw6HGp34S4K5NZ2lKbs8mcPBgoCQqc0IJ
         m4uwW0ukDFe1QtWjHQ/GKJfsne8QxDzhrhb4IRubf4EMhG0RzIK1eF1AG3KrOOXKGK15
         BDrTCEFNURGHjM01rGVH9lysZD5T4aByPhEnU1jaEIMICz/19ttkD8mSUR77HIvWycy9
         SfxQ9Xe78n3vXOwVrzdFFE5DdqwMQx4Ih53oatVAbp+ILcyDe3C0c5PnTz2ZfcT+O8vB
         t5KRnipde8M21k2witjwEGCUl0HLuLyCeTGz5JDoM/45UzbiBlGt80cM7jahrNjmX27E
         0yLg==
X-Forwarded-Encrypted: i=1; AJvYcCXT7nt5lE1lToMV9z1kRRlAmz1FJIXmkKfRYWyCWeX4N2kAzWM9Ct5mzAqQUcul8AC1LPJIhtNrNgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT39Uqw03CYFBu9DUNUUQAbwWF5MYe/nPZkGq66qYC9f1U7Nyf
	YLZf+zvq0pJjgVxJejVOtU7klDTREq1ToDgpuKdFRgLIm7MZvFfMS1fMjfZIsg==
X-Gm-Gg: ASbGncuKdhtcbJwgBudayrbFnLgJGRdRNK9KAFpqxTSupSZ77BLIUeNfrkE/ciHXF+6
	T1w//UXw98UwA9gAJpK7QEwxZAQSKGXZNCQ/VE3/4eWyJ0CnGGW5uIG0nNw9C/OAyPmN++YUBai
	EzSrgFOCpxy11RgLQKwKLR1xpE0O2ML4TVObDqQ08tbdH+fB5lqfXdMElzENaEwbh6wwkcLlBpU
	CH8S1rB/wPcVthHEh/SvFElfUFrIa0URYDRyPzD07v4LmifMsu6TA83TuG3CcocyYgXbhEVKoDy
	Wi40T64zN9qF9ewOJudTE1RTohhqFdZ/1QNc27DheIikqjMYR7NI+JFSUOyHXDiSvYGEm+NAAmn
	H
X-Google-Smtp-Source: AGHT+IESPnzULv5Yno2JL4rlXkl0mgfdPWOtgBkTQktqy7gZJiEEcj20W4SpovIXJpgezMMlWNjGJw==
X-Received: by 2002:a17:907:2ce3:b0:aa6:6a52:970 with SMTP id a640c23a62f3a-ab6cfcb3b92mr2430563066b.1.1738572058166;
        Mon, 03 Feb 2025 00:40:58 -0800 (PST)
Message-ID: <14d1f7fb-4e4e-4f06-b3e6-8ab25de7f939@suse.com>
Date: Mon, 3 Feb 2025 09:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
 <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
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
In-Reply-To: <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2025 14:50, Andrew Cooper wrote:
> On 30/01/2025 11:11 am, Jan Beulich wrote:
>> While the 2nd of the commits referenced below should have moved the call
>> to amd_iommu_msi_enable() instead of adding another one, the situation
>> wasn't quite right even before: It can't have done any good to enable
>> MSI when no IRQ was allocated for it, yet.
>>
>> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
>> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
> 
> There's a call to amd_iommu_msi_enable() just out of context here which
> was added by the 2nd referenced commit.
> 
> Given that it's asymmetric in an if() condition regarding xt_en, and the
> calls are only set_affinity() calls, why is this retained?
> 
> (I think I know, and if it is the reason I suspect, then you're missing
> a very critical detail from the commit message.)

Hmm, you did read the commit message, didn't you? That commit should have
moved that call, rather than adding another one.

However, you have a point. It looks like 7a89f62dddee ("AMD IOMMU: make
interrupt work again") should already have removed that call. Prior to
that change request_irq()'s call (via setup_irq()) to iommu_msi_startup()
was in fact premature, as MSI address and data weren't set up yet (IOW
while still apparently redundant, the extra call served kind of a doc
purpose). Things apparently worked because the IOMMU itself wasn't
enabled yet, and hence shouldn't have raised any interrupts prior to MSI
being fully configured.

However, for S3 resume I think the call needs to stay there, as the
startup hook wouldn't be called in that case (which may be the detail
you're alluding to). Imo that wants solving differently though. Not sure
it's a good idea to do this right here, or perhaps better in a separate
change.

I've added

"The other call to amd_iommu_msi_enable(), just out of patch context,
 needs to stay there until S3 resume is re-worked. For the boot path that
 call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
 done it already (by way of invoking iommu_msi_unmask())."

as a 2nd paragraph to the description, in the hope that's what you're
after.

Jan

