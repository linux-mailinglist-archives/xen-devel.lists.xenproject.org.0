Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4418BC64921
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163978.1491008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzvQ-0006Qv-Tm; Mon, 17 Nov 2025 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163978.1491008; Mon, 17 Nov 2025 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzvQ-0006Ol-QN; Mon, 17 Nov 2025 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1163978;
 Mon, 17 Nov 2025 14:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKzvP-0006Of-5H
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:09:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fcd84a6-c3bf-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:09:42 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so7088343a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:09:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4487sm1116583266b.22.2025.11.17.06.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:09:41 -0800 (PST)
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
X-Inumbo-ID: 0fcd84a6-c3bf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763388581; x=1763993381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXNtjF6veLw1YHLqTY8l6Q2aj1InYFAF5HJx/Kwd3Qk=;
        b=IT/pfZPrI8GT1m3RTJmvo4E35Vk7b3FhjG9fNipFjVyaPGEtLKVaw5gyZa0xttV7Tm
         SMGFy/3begJ7EXqBuwqLczFsqSxg4eapz50xncsB4Wr7N+fX6WcK688FS+nTKQSCI6MB
         KsDsavxBK2eEG4wlIx268IyLeGy6eKPyRL0EYD2QFHoXYCkLy2kp78tfARU4uGdUuMsL
         2H7WvrSLx4MeZCdXi6gUQUqATH9LD+4Js7LrgpuJ/9K0dn8a+ilrrfkNYiUlqHkTOsgT
         znyiyJwAuwTmHV/VG/tYC+nrlKypadAx4Vlxo5vZjg4EzplT6wNd5V/55AEvouf9NxPA
         LiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388581; x=1763993381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXNtjF6veLw1YHLqTY8l6Q2aj1InYFAF5HJx/Kwd3Qk=;
        b=CfDQqY99vtIyNTaMo+MlH5eODko2N1YZE+3mX2SbH2I1ZMmV46vk2HGEnk9ZyHgp0m
         4pUK4u/Tzn7BF9g4TJPc06UqRyMZAIsRR+QyoPi3uvGy7SrQdcgky0bvDMfaAa38Daxz
         tEJkFjhjTFRYm/4sFOToNm9vdKBpzSSN8Fz7dN0nsbvbpyh/MJ3CIPGeceqFhVjj84lO
         TZgXlH82Hm53qTaloNyxbA+mkPJGZMb78ALhyv60IjGYCPvKBb/y4Xxuc8Z+nNqNDenf
         XG3CK1IKmWCE5Kb42AABniCIx7EwPLwO54QA5ru3mxkkT6XfZt/zLNEvYLybNxDNVsy7
         Nb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+scUX2Z/Aq4+4BD0r/owG1QSFl5mxzCiF8hT84m12RYhRcuBS1Rhpkg/EZ+yS72ECjXTaS6kO8+g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwENEG2LwtMIo706mL3cnmXo+xo4tf1nVx3e1WDuqO1S+q6DMn4
	ksxXjjnXTolvEZHPypnTkzlGyyk9vKek9mvbRaO0MD5KHGBrSSoPGtjvskdSIpVOWg==
X-Gm-Gg: ASbGncvIefu/h2h38rbMGtVdSMygBawUxT3+eQbPjSxrODetoyFq1c9ihnojAWu504x
	ptPng+0qKamDOvOHNDzHQjh9/eOw5f0u+MNxyF6CRxik0RTR5T6oYYxexdQTEdIRvkLz8XoF5P/
	rNTpLCWMm8IRLYE8Gf6W5poRDYGbrTktK7gJj/JysvzNk6fb8k7gGWuXTBkHgXsLvG5H1fLBvMi
	l0ykDcigvblzY97T+0R956pngULxXj8PlRLWG4LWyvLVeftF5IkVB7bND+y4Alsd6eydjrwTW6I
	MDY6nMOdO/mUDtN+dntEQEcWM/lBv/iedLCL2qpzPucbl6tOYOmoE3cV2qQjxcLWQiB57qFcY17
	oiRMaEIPcg7GlsSFko7VzJFcYJqQIS+aWzpOkZ+fx3C2wQDrwmlXmrWPTWHKDVw3otz0VpiSPCb
	ih+5wACaThurla3EqGUpXuO7FOKRllxr6CXCG3Ewz+00/TCm+914HgBBizy4r7PxOs5jyzU14j0
	Uv5ScTeCKl4Hg==
X-Google-Smtp-Source: AGHT+IFFPMtK1WSA7NW/A+hNFQHScjfbrnsNzatTFCJ9a+4pzx/MH71FS0QTyI/mnt2ZkrL5GnRnFQ==
X-Received: by 2002:a17:907:1c27:b0:b73:3e15:a370 with SMTP id a640c23a62f3a-b7367c001f0mr1349226366b.57.1763388581464;
        Mon, 17 Nov 2025 06:09:41 -0800 (PST)
Message-ID: <e0f69901-b8d4-4af0-b085-d936fdfcb0fd@suse.com>
Date: Mon, 17 Nov 2025 15:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ioreq: Make sure ioreq is always in-bounds
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech>
 <97ffeca9-348e-4997-a223-359fefa83107@suse.com>
 <8e1403ce-c333-4236-b38a-82525c7b542f@vates.tech>
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
In-Reply-To: <8e1403ce-c333-4236-b38a-82525c7b542f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 14:43, Teddy Astie wrote:
> Le 17/11/2025 à 13:46, Jan Beulich a écrit :
>> On 17.11.2025 13:35, Teddy Astie wrote:
>>> A 4K page appears to be able to hold 128 ioreq entries, which luckly
>>> matches the current vCPU limit. However, if we decide to increase the
>>> domain vCPU limit, that doesn't hold anymore and this function would now
>>> silently create a out of bounds pointer leading to confusing problems.
>>>
>>> All architectures with ioreq support don't support 128 vCPU limit for
>>> HVM guests, and  have pages that are at least 4 KB large, so this case
>>> doesn't occurs in with the current limits.
>>>
>>> For the time being, make sure we can't make a Xen build that can
>>> accidentally make a out of bounds pointers here.
>>>
>>> No functional change.
>>>
>>> Reported-by: Julian Vetter <julian.vetter@vates.tech>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>
>> I was meaning to ack this, but ...
>>
>>> --- a/xen/common/ioreq.c
>>> +++ b/xen/common/ioreq.c
>>> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>>>   
>>>       ASSERT((v == current) || !vcpu_runnable(v));
>>>       ASSERT(p != NULL);
>>> +    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));
>>
>> ... does this even build on e.g. Arm? IOREQ_SERVER is a setting which can be
>> enabled (with EXPERT=y) also for non-x86. Yet HVM_MAX_VCPUS looks to be an
>> x86-only thing. (I then also wonder about some of what the description says).
>>
>> Just to mention (no further change requested at this point, in this regard):
>> HVM_MAX_VCPUS being part of the public interface, we'll need to see whether we
>> can sensibly retain that identifier to carry changed meaning once we up the
>> limit. The check here may therefore not trigger at that point; the hope then
>> is that while making respective changes, people would at least stumble across
>> it by e.g. seeing it in grep output.
>>
> 
> Apparently it doesn't build (debian-bookworm-gcc-arm32-randconfig 
> catched it).
> ARM does provide MAX_VIRT_CPUS and GUEST_MAX_VCPUS which is 128 or 
> lower, but that doesn't map (or not properly) with what we have in x86 
> (MAX_VIRT_CPUS=8192 is PV-specific, and GUEST_MAX_VCPUS doesn't exist).
> 
> I am not sure what to do, looks like many things are redundant here.

Maybe non-x86 could surface HVM_MAX_VCPUS as an alias of whatever they already
got, much like CONFIG_HVM exists also for Arm, and will likely need introducing
for PPC and RISC-V (despite not being overly meaningful for non-x86)?

Jan

