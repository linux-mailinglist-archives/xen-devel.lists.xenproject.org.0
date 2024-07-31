Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE289429D8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 11:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768379.1179153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5Dj-0007z0-7p; Wed, 31 Jul 2024 09:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768379.1179153; Wed, 31 Jul 2024 09:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5Dj-0007vq-4P; Wed, 31 Jul 2024 09:02:07 +0000
Received: by outflank-mailman (input) for mailman id 768379;
 Wed, 31 Jul 2024 09:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ5Dh-0007vg-4i
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 09:02:05 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da92e36-4f1b-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 11:02:03 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aabb71bb2so753996266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 02:02:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad90486sm740983866b.150.2024.07.31.02.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 02:02:02 -0700 (PDT)
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
X-Inumbo-ID: 8da92e36-4f1b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722416523; x=1723021323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aJzNeH57RQ05sxtKkArxkc+GM/7CT4Dx4VMM1khlzJk=;
        b=cMvRfKbxLM1yV/Zi0Du5greE4S7v3OONKhyUdNheAtNvxv9VOxDc1xTfPF9X0j6mTy
         GzE72koD/buHC7KCE9+89LMOS8vp72YuQhJqqsMdIWD87ww1WibNdaStdoBan5K2kXMK
         AxMffF9UVpyYofSBdbzp0Dz7mvIZyNDiOV/ynP1vEHexeKQhowE6jGEozPN+p9lT+j0n
         jUXfM8AjQpjZ7p6ObsuW65z3oERFMQ7qEbGk1pmJ1hj9oq/8mIzGpb72V6fxPj+M2BlX
         GqS/on1wZ09sDUy4IVEvqPGRjBihbS/OZvFcN72+U5WrVnCXcxIynVFsgXf79w69x1c7
         LMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722416523; x=1723021323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJzNeH57RQ05sxtKkArxkc+GM/7CT4Dx4VMM1khlzJk=;
        b=De1ArKN1+47UoWBi815KOS7Nrl5ZO1VSKFmV/+sLWrDUC4qS240r+xv6SaAYZYyt4R
         wXPC9eMnipXjFiwFrLUiWkUk7pF/kYp1PgaSt2J+66KOBemKkwjVyhzLEcUwx31ELxEy
         7zzLWE/Z7zsQnLvi7SuJu6dEEyNzJujLRS4usGlK2GMfz1OoZoVGKYVWaALkmyigt1uL
         g+luqsKEjDBmVzejrhdMMTa1B4Pv736G4v1iVyUSbHia66Cr2gZQA9FnL28up3hxCX2C
         lOCle2wDkhwqOLXVPq9m0VBfM8xRcmPVPOH3WT7dl5USLl8kho+bpIGLY1RLF1DwFHUd
         TQPg==
X-Gm-Message-State: AOJu0YwJ0ReITmqasMK9pfg3mDp4jwNwl9xqmSHFruOwiFAHD5rlWejv
	pBbn6By88x3DABxYjZ5WRFrzgpQdvExk6qCENaFxJfotaFLJYpr0sreW76uqCQ==
X-Google-Smtp-Source: AGHT+IG5UoHoRMnszgQeXPuI7oU9idLjD5iRnnBOyJbB5LatJnkw8c1v2y3bjvoevSLWBIVVzrExWw==
X-Received: by 2002:a17:907:6d13:b0:a72:69e8:f039 with SMTP id a640c23a62f3a-a7d3ffc064bmr1058371066b.12.1722416522620;
        Wed, 31 Jul 2024 02:02:02 -0700 (PDT)
Message-ID: <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
Date: Wed, 31 Jul 2024 11:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com> <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
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
In-Reply-To: <Zqn7HEuooChgRCuf@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 10:51, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 10:40:46AM +0200, Jan Beulich wrote:
>> On 31.07.2024 10:24, Roger Pau Monné wrote:
>>> On Wed, Jul 31, 2024 at 09:58:28AM +0200, Jan Beulich wrote:
>>>> On 31.07.2024 09:50, Roger Pau Monné wrote:
>>>>> On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
>>>>>> --- a/xen/arch/x86/physdev.c
>>>>>> +++ b/xen/arch/x86/physdev.c
>>>>>> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>          if ( !d )
>>>>>>              break;
>>>>>>  
>>>>>> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>>>>> +        /* Only mapping when the subject domain has a notion of PIRQ */
>>>>>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
>>>>>
>>>>> I'm afraid this is not true.  It's fine to map interrupts to HVM
>>>>> domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
>>>>> allow HVM domains to route interrupts from devices (either emulated or
>>>>> passed through) over event channels.
>>>>>
>>>>> It might have worked in the past (when using a version of Xen < 4.19)
>>>>> because XENFEAT_hvm_pirqs was enabled by default for HVM guests.
>>>>>
>>>>> physdev_map_pirq() will work fine when used against domains that don't
>>>>> have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.
>>>>>
>>>>> I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
>>>>> keep the code in do_physdev_op() as-is.  You will have to check
>>>>> whether the current paths in do_physdev_op() are not making
>>>>> assumptions about XENFEAT_hvm_pirqs being enabled when the calling
>>>>> domain is of HVM type.  I don't think that's the case, but better
>>>>> check.
>>>>
>>>> Yet the goal is to disallow mapping into PVH domains. The use of
>>>> has_pirq() was aiming at that. If that predicate can't be used (anymore)
>>>> for this purpose, which one is appropriate now?
>>>
>>> Why do you want to add such restriction now, when it's not currently
>>> present?
>>>
>>> It was already the case that a PV dom0 could issue
>>> PHYSDEVOP_{,un}map_pirq operations against a PVH domU, whatever the
>>> result of such operation be.
>>
>> Because (a) that was wrong and (b) we'd suddenly permit a PVH DomU to
>> issue such for itself.
> 
> Regarding (b) a PVH domU issuing such operations would fail at the
> xsm_map_domain_pirq() check in physdev_map_pirq().

Hmm, yes, fair point.

> I agree with (a), but I don't think enabling PVH dom0 usage of the
> hypercalls should be gated on this.  As said a PV dom0 is already
> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> domU.

Okay, I can accept that as an intermediate position. We ought to deny
such requests at some point though for PVH domains, the latest in the
course of making vPCI work there.

Jan

