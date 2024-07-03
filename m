Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0B925507
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752777.1161004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuvM-0008SV-0X; Wed, 03 Jul 2024 08:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752777.1161004; Wed, 03 Jul 2024 08:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuvL-0008Q7-UF; Wed, 03 Jul 2024 08:01:07 +0000
Received: by outflank-mailman (input) for mailman id 752777;
 Wed, 03 Jul 2024 08:01:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOuvL-0008Q1-79
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:01:07 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e39f2e-3912-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 10:01:00 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so8305761e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:01:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a95fc4sm9745282b3a.215.2024.07.03.01.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 01:00:59 -0700 (PDT)
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
X-Inumbo-ID: 62e39f2e-3912-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719993660; x=1720598460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Jm6t1cLsyW64uhwjDOis+9KRtVEjq1Ra7yGz6jylk=;
        b=TTuK2ZrWWlrBQ/sg+CJicNt27AB4gOrDWzghuPstoLp3pEYA3E6742Bq/ibBOUe5jM
         ruWyZmxh0hs/+ZFKnFubFXs7z7vIAUrjJafYf56XLSmHfXT2ZBi15pqZoXMfXKNs/b11
         rsTqiBETbmmLRyf6IlJTLIvHkp6hWVCH8I8bshr+S147kaiOde4oQfhDMDVftynf0GLF
         7UAxB1qoFmL3U4NJzAQqJXGFpcL3KtRtgdPcpIsKVCVPH2Ws6w4dzCZdOVbDGwI2Y4Rt
         7vC0wN457dSeb2d/cXbsb5EPpueGzksMxrXVef6jJzaJhcjn7fpDMkZC4rVQjHjQsoWk
         7ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719993660; x=1720598460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2Jm6t1cLsyW64uhwjDOis+9KRtVEjq1Ra7yGz6jylk=;
        b=spojS117hNLNepBmb9vuDLhZdjsqaZPf/Bge3E6LTyldRHDYF80Pn//W0kZs3ZdeRl
         GnTpyil243tVpdiDQJYd4KXRNkRUTgMy1kc+FV29YRVoEE3rlHjauysb8Ywlv845gZlZ
         iCKxjyB3FQZ186ctsQBPnMFdYyoVPvDDdvFr0y4UWrCxjbyx0Jr3KJ5SXiw5+x4QVEDs
         0sLTAPrfl/bY8B8INeKubYCmKfeEYTi7jK5XzMxgAXQeDivZNPxP1ig18dIgA1v2eIh1
         xGOCustLZiUsg1NRrUNi1NGX4rj72wJ9MQ1lBVw6VCnVdtH/0ZRIZXQeZuGvhgHDGNid
         z2tQ==
X-Gm-Message-State: AOJu0Yxve/rJUEjQPK3gONhwqrpmX60xNDT4Pxow5pYn8hFzMTCt6Skr
	tCiWYVHNzpUpfxyWMREcVZ3Oe75JJf/9CQ2Mv48ZjbqQEmKS2+UdCuM1cEt8Vg==
X-Google-Smtp-Source: AGHT+IHS4Rs7j/m1k66RO2IxMJE76orshBdeD2urJ4KH7gUHf03MnFmT+uMq6lpaRd4agCXNiXc18Q==
X-Received: by 2002:a05:6512:519:b0:52c:d639:dd4b with SMTP id 2adb3069b0e04-52e8266eab5mr6088290e87.23.1719993659760;
        Wed, 03 Jul 2024 01:00:59 -0700 (PDT)
Message-ID: <c1e981e2-a8fe-42ed-882a-5a8714ff654c@suse.com>
Date: Wed, 3 Jul 2024 10:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.19? 2/2] cmdline: "extra_guest_irqs" is
 inapplicable to PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
 <e95ea1ea-dd11-4994-9d50-308db4c3772e@suse.com>
 <ZoUC_5FuwYLXdfDv@macbook.local>
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
In-Reply-To: <ZoUC_5FuwYLXdfDv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2024 09:51, Roger Pau Monné wrote:
> On Tue, Jul 02, 2024 at 11:52:38AM +0200, Jan Beulich wrote:
>> PVH in particular has no (externally visible) notion of pIRQ-s. Mention
>> that in the description of the respective command line option and have
>> arch_hwdom_irqs() also reflect this (thus suppressing the log message
>> there as well, as being pretty meaningless in this case anyway).
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Since the EOI map physdevop-s aren't available to HVM no matter whether
>> the PVH sub-flavor is meant, the condition could in principle be without
>> the has_pirq() part. Just that there really isn't any "pure HVM" Dom0.
>> ---
>> v4: New.
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1178,7 +1178,8 @@ versa.  For example to change dom0 witho
>>  hardware domain is architecture dependent.  The upper limit for both values on
>>  x86 is such that the resulting total number of IRQs can't be higher than 32768.
>>  Note that specifying zero as domU value means zero, while for dom0 it means
>> -to use the default.
>> +to use the default.  Note further that the Dom0 setting has no useful meaning
>> +for the PVH case; use of the option may have an adverse effect there, though.
> 
> I would maybe remove the has_pirq() check and just mention in the
> comment added ahead of the is_hvm_domain() check that PVH/HVM guests
> never have access to the PHYSDEVOP_pirq_eoi_gmfn_v{1,2} hypercall,
> regardless of whether XENFEAT_hvm_pirqs is exposed.
> 
> Would that be OK with you?

Okay-ish. That's why I had the post-commit-message remark on this very aspect.

Jan

