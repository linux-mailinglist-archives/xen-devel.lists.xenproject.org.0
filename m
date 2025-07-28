Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6BB138E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061236.1426759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL36-0008LS-Hc; Mon, 28 Jul 2025 10:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061236.1426759; Mon, 28 Jul 2025 10:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL36-0008Ib-EN; Mon, 28 Jul 2025 10:25:40 +0000
Received: by outflank-mailman (input) for mailman id 1061236;
 Mon, 28 Jul 2025 10:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugL35-0007b5-42
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:25:39 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 345c6a83-6b9d-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:25:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so648137f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:25:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe330fdfsm50632965ad.64.2025.07.28.03.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:25:37 -0700 (PDT)
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
X-Inumbo-ID: 345c6a83-6b9d-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753698338; x=1754303138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+z7bs2oyVRI6CtKSJhOix7Y/tKDBQNuf67Osk+NWOxw=;
        b=RQm3beFNYcmtEFwqgCNl+g6WHZBUHs2+u9ppeKtw7rixunsDBWGYZ1vZTqzS7mYLcO
         2KJE6EHOrjXXjy+sYvpUK0eOzyckq/RuZ+TAmhuSRbz/ap/cPy6ltVFLIUpL1m4N2ppb
         QvnTxap5Rf0N24Z0m0JJ9sZ4Xoyv1uoIvsiY/opdPvJ1zg+8u5wLnbM0UopTsbRuVb+Q
         awtmDzsCAVPJXvLroXAjiooHQc9Jl2A60EGO418fedj99N0gWGfaOerh86vVfrH/blRJ
         7W9h1rCCtl6fRXGBgj646YTnC1IA9KsgfYqHm/OAaQkil6zwzPh4fI94lX69n3/Hq+sx
         wnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698338; x=1754303138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z7bs2oyVRI6CtKSJhOix7Y/tKDBQNuf67Osk+NWOxw=;
        b=eBp92+G3tXPLmRDAvEPTKiUbgW0i8H7MX16tMzVuBIW/5nMb6k3C5Y+xpZ+kv8VoQ9
         ancKaNLo3g5ikI1Asrh5iWtcVBnHYMNcwAo4SQIO3jYt1sBEv1sPM+7nD3CiXf41w7rs
         NubGj80Pp9b4eVxdSQxU7g5Zoz8KBjB02Ox1EWlNbiu/uWnPMRQE58n5l2O3HfNpePYp
         1Eh8B7xkxncLPqise745XCfFJ1E1ma5wIav1mrpdI3cm87pVEWkAelLCJ5GVef9YRL9/
         F+lTSicvtuc8Upu7HglIp1RkB6tytwkpQFfDt9BKrkl+wVqbmDPn8WwFSwjWQ4rpiYJu
         fbdA==
X-Gm-Message-State: AOJu0YwvMcN8hniQO5LJ2R0NZeA3iHgk1t4opCGOBiItvRpn+9PQF3Oq
	BECg7mxHkifNu+YSz7aJWVXwzUVy2Gn7hjtVkfvu2GTgjtRqzLfiK9dWQhgwhfnjbw==
X-Gm-Gg: ASbGncuk1kPnlxaOW32dxrcu56jFR8NctND2m+sR1CjvtohMBKJuPanvaz3Xq9Nx8VJ
	fqkUUkCS2lCMML4DhTcgdWg1/skz0ofc3DHPvbTb4U0ekeQc7AfFahnloUXoL1dfple5BE06Jpl
	e+mtkHeoYdN8t05FLlNfu6K8TrBFCpCXGqut7XKQ7cvufpZ9JHrNHULeXPtEYEC62G/b6YIBaTm
	MFGKJJ5QJlPbiPoUgVnN4LwWpTtkjVSIblhk/zUcqkgtSic6drhK60o2xWdHp3Q+rCVhAdxducM
	cL70QbhbajaWWR/CZXDti+ouR9Z6fjaw1ztmcsF/PBsAKxmlD0Pb06xnSoxSYI3xG/42V3miA7/
	ndN/vN5E3y6X7JCTQ542D9g99ENwh/bdt0GMwosZu8lwMw2/CM79tDolryG46iD7vL4DfT47zOg
	O+LfceaFc=
X-Google-Smtp-Source: AGHT+IESGz5yFD9fREbeuqVoD1jnMK7wOOHUnGqa/teM0wE/DWa3EzJW4fVMhhaeavN8fMxNPK2y/A==
X-Received: by 2002:a05:6000:430c:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3b776666498mr7617821f8f.34.1753698337470;
        Mon, 28 Jul 2025 03:25:37 -0700 (PDT)
Message-ID: <d8fab342-2687-41aa-9e30-98ba2c62e8e0@suse.com>
Date: Mon, 28 Jul 2025 12:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/10] pmu.h: add a BUILD_BUG_ON to ensure it fits
 within one page
To: Edwin Torok <edwin.torok@cloud.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
 <0cd10fcf-d017-4a85-b248-e29e77903349@citrix.com>
 <CAEfZLvk6nr6h3D9bX+r210A3hmrybmrzUXPbE2ApXbY4H_nbCg@mail.gmail.com>
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
In-Reply-To: <CAEfZLvk6nr6h3D9bX+r210A3hmrybmrzUXPbE2ApXbY4H_nbCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 12:22, Edwin Torok wrote:
> On Mon, Jul 28, 2025 at 11:21 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>>
>> On 25/07/2025 4:06 pm, Edwin Török wrote:
>>> Linux already has a similar BUILD_BUG_ON.
>>> Currently this struct is ~224 bytes on x86-64.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
>>> ---
>>>  xen/arch/x86/cpu/vpmu.c  | 1 +
>>>  xen/include/public/pmu.h | 3 +++
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
>>> index c28192ea26..7be79c2d00 100644
>>> --- a/xen/arch/x86/cpu/vpmu.c
>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>> @@ -401,6 +401,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
>>>      uint8_t vendor = current_cpu_data.x86_vendor;
>>>      int ret;
>>>
>>> +    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
>>>      BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
>>>      BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
>>>      BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);
>>
>> This is fine (even if it ought to be elsewhere, but don't worry about that).
>>
>>> diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
>>> index af8b7babdd..15decc024d 100644
>>> --- a/xen/include/public/pmu.h
>>> +++ b/xen/include/public/pmu.h
>>> @@ -93,6 +93,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
>>>   * Architecture-independent fields of xen_pmu_data are WO for the hypervisor
>>>   * and RO for the guest but some fields in xen_pmu_arch can be writable
>>>   * by both the hypervisor and the guest (see arch-$arch/pmu.h).
>>> + *
>>> + * PAGE_SIZE bytes of memory are allocated.
>>> + * This struct cannot be larger than PAGE_SIZE.
>>
>> This isn't.  Xen's PAGE_SIZE is not necessarily the same as PAGE_SIZE in
>> the guest consuming this header.
>>
>> This highlights one of the problems that Xen's ABI entrenches.  Being
>> x86-only, it's 4k in practice, but there's no easy solution.
>>
>> I'd just skip this comment.  Anything else is going to get tied up in
>> unrelated bigger problems.
> 
> Thanks, I'll drop this comment in the next version of the series.

As said, I'm happy to ack the change with the comment adjustment dropped.
That is, I could easily carry out what you say above while committing.

Jan

