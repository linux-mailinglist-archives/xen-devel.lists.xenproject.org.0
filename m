Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80311C399BD
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 09:40:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156569.1485614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvX4-00039H-0e; Thu, 06 Nov 2025 08:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156569.1485614; Thu, 06 Nov 2025 08:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvX3-00037O-U8; Thu, 06 Nov 2025 08:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1156569;
 Thu, 06 Nov 2025 08:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGvX2-00037I-EA
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 08:39:48 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26883456-baec-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 09:39:47 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so972878a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 00:39:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72893cc6c5sm157537566b.31.2025.11.06.00.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 00:39:46 -0800 (PST)
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
X-Inumbo-ID: 26883456-baec-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762418386; x=1763023186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a3lKVaj5tvsPyTxl+xisc7FX2U8Vyxf/5JVA/vaGjmc=;
        b=T1GfG+jWSNqXS5M1SIKJAd827CSKCRcKHWiEWGty9sSSRitNklfxFVPr0Mzoe3Dwdj
         rRob7WsvDchE86RwifVQjbdawefzI8zcirAMsLkph8sX+07TigtspTbOlHL55Qe0DZ2f
         E4USOGMk0EMNH6LeQ4STBbdWEdi2z46FHUxHlQQ7r2Q8zw1RKb29YniMMNrKXp9t+2hC
         qvJ7fXBcc8HS2UgqjhkVz/kbvUOvMwNIst+ASf9aC8GurFqD/T15CphTiS8qqFbESG65
         G3WXg/5ysDTnfGNJ5pW+i2da2Ub6pIon0ve5KMMqVisZWrAuuEiUWKrWgw7qqgZi6FOJ
         Hqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418386; x=1763023186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3lKVaj5tvsPyTxl+xisc7FX2U8Vyxf/5JVA/vaGjmc=;
        b=Tq7gF9ZsDIOOQvte9gu+8RGNTFTbhomu4ZkM3BHy1gJcOZGyAvyg/7j3OUufKkI3Yr
         UB7bujyDrv4X114YErXrgSlQbEL1JGEI9v4rMmSlYG09gBzjgOpWm6PRCmlfZCZStxtA
         peWSIcOWOD+Hn+m3UQvZPBbVoJ8zNRRuAlqkzhYH42s9M1CpSkaNXLRO0NEoMak0ThbC
         bcpbwy4eiIyNeSSK3zAblNwo0BhZ7cencqT1GRPhzQPqRTOuKvEMNAXKrBKo5tz75uTS
         OIOMaOaAzb48Uueh4XSu2arH30a3NHC7WSU03ImuDn+pfCPVWNMS/nkTI5NMlKlWT7cg
         weZw==
X-Gm-Message-State: AOJu0YxR4ggB+Ho9OurXuMJZbPD6c3V2czGqXqK6BsLgiZ5YWC2Kgdfy
	uuUsMMIeQiLYQOnzTM1gPuZBgTAQ7UYeCYULEiyH0iEehrLQNmtdXCcx3cb4LK2uoQ==
X-Gm-Gg: ASbGncvj2S/ysiescKFRX+GtP1MqQmuO6+9QSz+c1zXyuX2gUENJ6suHM1ggASkaPKM
	xYk3TagX8I/zN5HuU8Z5u3JbN1wIldpvB+MEZ9ekZgSvUkPvKTdduKTo+b0GFURpUP1ApQQ58UY
	nXOgdQOVwcAjP+uWSBW3qkjwy7eJiDqPdYe3HdjM2kFPZ2nUnoeBB/CSuLv/DyIbgUebmk54+BL
	jrf6assV+OOIN9slOC25zYG+X9TtTU5yhnHHZPjtHsj6/YT6uPutEVaM1FGWlSghEoJT7hUux95
	QGh6VNQ3y/iEVusR+JGvj9AXq/PVdDhzEZhd8/i6v4Wi4iTj6VfFDqx/+y+pODnQwdAn9x40dey
	z/kFAEuyIk1YwG+5x4g5n7PJD4eRoU+oxgtSomG448omIf49TfAiMnOLStnDPzrAve1IMjaAU8b
	cGtQ/Z7YI/llLHdYzwWG8W0MHE20g1rQcHddziZYK5UKSjBxHX6cqox22PEiShRqCEVH9yZmo=
X-Google-Smtp-Source: AGHT+IH1nhEqv+xWaaR39hvdJBYeEueIxRa8v0YeEhMtvosnBLuik+AI7j4VK6KczUFc2CyARGr3Ag==
X-Received: by 2002:a17:907:948c:b0:b70:df0d:e2f1 with SMTP id a640c23a62f3a-b72653ec470mr674225766b.28.1762418386506;
        Thu, 06 Nov 2025 00:39:46 -0800 (PST)
Message-ID: <37ac4dce-e61c-46a7-9e55-410fbda843e8@suse.com>
Date: Thu, 6 Nov 2025 09:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan> <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan> <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
 <aQSoE8ugCKdNWy9C@Mac.lan> <8c7881d9-5959-41b5-865d-d61199ac7a44@suse.com>
 <aQS2arOWxEiHq1sj@Mac.lan>
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
In-Reply-To: <aQS2arOWxEiHq1sj@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 14:15, Roger Pau Monné wrote:
> On Fri, Oct 31, 2025 at 01:34:55PM +0100, Jan Beulich wrote:
>> On 31.10.2025 13:14, Roger Pau Monné wrote:
>>> On Fri, Oct 31, 2025 at 12:47:51PM +0100, Jan Beulich wrote:
>>>> On 31.10.2025 11:54, Roger Pau Monné wrote:
>>>>> On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
>>>>>> On 31.10.2025 11:22, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
>>>>>>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>>>>>>>> place.
>>>>>>>>
>>>>>>>> 1: disable RDSEED on Fam17 model 47 stepping 0
>>>>>>>> 2: disable RDSEED on most of Zen5
>>>>>>>
>>>>>>> For both patches: don't we need to set the feature in the max policy
>>>>>>> to allow for incoming migrations of guests that have already seen the
>>>>>>> feature?
>>>>>>
>>>>>> No, such guests should not run on affected hosts (unless overrides are in place),
>>>>>> or else they'd face sudden malfunction of RDSEED. If an override was in place on
>>>>>> the source host, an override will also need to be put in place on the destination
>>>>>> one.
>>>>>
>>>>> But they may be malfunctioning before already, if started on a
>>>>> vulnerable hosts without this fix and having seen RDSEED?
>>>>
>>>> Yes. But there could also be ones coming from good hosts. Imo ...
>>>>
>>>>> IMO after this fix is applied you should do pool leveling, at which
>>>>> point RDSEED shouldn't be advertised anymore.  Having the feature in
>>>>> the max policy allows to evacuate running guests while updating the
>>>>> pool.  Otherwise those existing guests would be stuck to run on
>>>>> non-updated hosts.
>>>>
>>>> ... we need to err on the side of caution.
>>>
>>> While I understand your concerns, this would cause failures in the
>>> upgrade and migration model used by both XCP-ng and XenServer at
>>> least, as it could prevent eviction of running VMs to updated hosts.
>>>
>>> At a minimum we would need an option to allow the feature to be set on
>>> the max policy.
>>
>> That's where the 3rd patch comes into play. "cpuid=rdseed" is the respective
>> override. Just that it doesn't work correctly without that further patch.
> 
> Won't using "cpuid=rdseed" in the Xen command line result in RDSEED
> getting exposed in the default policy also, which we want to avoid?
> 
> Or am I getting confused on where "cpuid=rdseed" should be used?

No, there's no way here to get max but not default.

>>>  Overall I think safety of migration (in this specific
>>> regard) should be enforced by the toolstack (or orchestration layer),
>>> rather than the hypervisor itself.  The hypervisor can reject
>>> incompatible policies, but should leave the rest of the decisions to
>>> higher layers as it doesn't have enough knowledge.
>>
>> But without rendering guests vulnerable behind the admin's back.
> 
> I think that's part of the logic that should be implemented by the
> orchestration layer, simply because it has all the data to make an
> informed decision.  IMO it won't be behind the admin's back, or else
> it's a bug in the higher layer toolstack.

I fear I simply don't see aspects like this to be exposed to a toolstack.
We didn't for RDRAND.

> Not putting rdseed in the max policy completely blocks the upgrade
> path, even when a toolstack is possibly making the right informed
> decisions.
> 
> I guess I need to see that 3rd patch.

https://lists.xen.org/archives/html/xen-devel/2025-08/msg00113.html

Jan

