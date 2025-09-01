Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53940B3E741
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105009.1456002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5bb-0002uw-PB; Mon, 01 Sep 2025 14:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105009.1456002; Mon, 01 Sep 2025 14:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5bb-0002rq-MR; Mon, 01 Sep 2025 14:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1105009;
 Mon, 01 Sep 2025 14:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut5ba-0002ri-Mq
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:33:58 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1723494-8740-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 16:33:57 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso7508754a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:33:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7848sm7593361a12.2.2025.09.01.07.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:33:56 -0700 (PDT)
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
X-Inumbo-ID: b1723494-8740-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756737237; x=1757342037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a7lB359ETCGiG9kQCfcmnUl1OXWX0fwwbYZJASA5IX0=;
        b=ZFS1qpw1tAWWw1HcUjxYuzBaQCqi71mlt2gsuLwSbCVIedgZx6SwgUi6J1Q9L9as9M
         SsdLRuGcM9HF4hR2goiNDvNSiKYGotMMBjnYbiSdcQrTx7KrAB41cG4ojWucfU89X4dr
         nDQ2BCCYpzKiLp2WffAYz4/O8NKSpNhi/EVGSPQ6F67YOz0Gx97TTjHuanQ3V2vOd7/U
         6VE504DagyOhHXMwXpefaoWRXMUrF+kRy8cNlliftAMluIA/BwLn/4SIlq5Ado2b5U6A
         c6Npb6GLiAloLh3p8Qua+FkDK6bg+qrUEpzVwMbntwTZMKLCGiJ9mIvwCu0iAMbg9cOc
         WBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737237; x=1757342037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7lB359ETCGiG9kQCfcmnUl1OXWX0fwwbYZJASA5IX0=;
        b=RHAOOCKuBmze2asTNdWnxT9UBHRGCUDA9A73Mbq5i/LMxmQyN3fiLuUt09Lby208AH
         jV6ZQBlbBn0P45d2w32rzfunz+s5is0GVP78X6Sc6K7ZEmwgUk2Xq4J8fhKuL05pABAt
         1XRQl+Pp4uLFUHMSzwgubEL8/FxnU4P6OPKiBMzEREDrR7ALeNdx2VYEYVhIAyp1+O1r
         YXwbAnU8zgdRGNCslwO5G7Ka7m6312S+jbPce6H1n7YrCK52Je/FJ18ZOgSrjZys/3BD
         3thoxnwU+ykhdl/glEGJtnvzzDlZuEwDIkEZzo8D4GB7ZAFg2IjFfFPWIoNquJYsJ3NA
         +R6g==
X-Forwarded-Encrypted: i=1; AJvYcCWdIeMzkTD+bv6TdL69DrcSDmHT3bQ9TtgpB7Meu/ikz4OHUcjyE5Z1wMHcTTYM2BBUyp4YOtkQkP8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytEpskHYPeo7QqUdurAdvFoptqfdje7Nva0xNrASqajythBn6K
	D8VcRvAtFQxNv445BbuW5nOD2PV1TJNE8Wit3Uf6uvB3M7XHNs4mDJvt1PUTWuCx+g==
X-Gm-Gg: ASbGncusnw8oDgTt7Uwr+yI/KUX8Fak6UlD+49GNkMRCtZBetsB8MQUs5bP8m0Z6099
	MbGXH/zCRl6zIAos06u/oWzi+Q7v77Qzf5tKne03pG30pnSlINoneApn6bgsHKF9HdZzVHTQFz+
	CNhCieVZ/5bf95fRAXVA6Dgu+hr4N0YMuRoA+CzpQKs4tN7ooq52GitgCwNhKU+ePdZwsLckEFZ
	qbSIGcW0IbNxY0Emyl1N2JSs17H/NU8BVfcqbj7VQytVWPC3eu31a3QQcLycrNwR0uyR/Lr1Hgx
	4rGutHWJIfukKUReV+TM2Oy6ndZv/3Fi9c92/+7XnY35ocdT5BqMFRKfQG5JeDytbUKtByyXp5F
	xqOxoaSEC6NxB0K2flJNvijCbboL1MudPcXvpr51hlm9bMSyu9RgnNnF7P+PVmjdxerGaiCUK1/
	LehJ9Vl7uibmITYaApxQ==
X-Google-Smtp-Source: AGHT+IGvf8w1reX8IyfP+pyiLLuey9HpirPMXoN8K5vaDD6ZyHpdiLS5XzBeq904yNOBZA31nchdUA==
X-Received: by 2002:a05:6402:d0d:b0:608:f493:871c with SMTP id 4fb4d7f45d1cf-61d26aa2be2mr6781682a12.14.1756737237004;
        Mon, 01 Sep 2025 07:33:57 -0700 (PDT)
Message-ID: <3ab662ea-295d-4796-9bf9-d16b5ec0cb46@suse.com>
Date: Mon, 1 Sep 2025 16:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/3] x86/hvm: Introduce Xen-wide ASID allocator
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Vaishali Thakkar <vaishali.thakkar@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech>
 <81169a40fdc8c124b1656e451ac2e81f4e8edd2d.1750770621.git.teddy.astie@vates.tech>
 <7d9fd72a-39b7-43b0-875f-859a7a45c4fb@suse.com>
 <2c16b9f8-580e-4df2-9790-1c3e327b349d@vates.tech>
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
In-Reply-To: <2c16b9f8-580e-4df2-9790-1c3e327b349d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 16:13, Teddy Astie wrote:
> Le 28/08/2025 à 15:05, Jan Beulich a écrit :
>> On 26.06.2025 16:01, Teddy Astie wrote:
>>> Is it possible to have multiples vCPUs of a same domain simultaneously
>>> scheduled on top of a single pCPU ? If so, it would need a special
>>> consideration for this corner case, such as we don't miss a TLB flush
>>> in such cases.
>>
>> No, how would two entities be able to run on a single pCPU at any single
>> point in time?
>>
> 
> It was more concerning regarding having 2 vCPUs of the same domain (thus 
> sharing the same ASID) running consecutively, e.g having on the same core
>    dom1.vcpu1 -> dom1.vcpu2
> 
> without a appropriate TLB flush; because the address space may not be 
> consistent between 2 vCPUs.
> 
> I found a approach to fix it by tracking per domain which vCPU last ran 
> on each pCPU so that in case of mismatch, we need to TLB flush. Along 
> with explictely flush the TLB when the vCPU is migrated, because in the 
> case too the TLB can be inconsistent for the ASID.

Yet that wants constraining to the case where the address spaces are indeed
at risk of being different, i.e. when distinct P2Ms are in use on the two
vCPU-s.

>>> I get various stability when testing shadow paging in these patches, unsure
>>> what's the exact root case. HAP works perfectly fine though.
>>>
>>> TODO:
>>> - Intel: Don't assign the VPID at each VMENTER, though we need
>>>    to rethink how we manage VMCS with nested virtualization / altp2m
>>>    for changing this behavior.
>>> - AMD: Consider hot-plug of CPU with ERRATA_170. (is it possible ?)
>>> - Consider cases where we don't have enough ASIDs (e.g Xen as nested guest)
>>> - Nested virtualization ASID management
>>
>> For these last two points - maybe we really need a mixed model?
>>
> 
> Mixed model would not allow future support for broadcast TLB 
> invalidation (even for hypervisor use) with e.g AMD INVLPGB or (future) 
> Intel Remote Action Request.

Why? For a VM using the traditional model we wouldn't be able to leverage
those, but for others we could. And imo it's better to be able to run a VM
at all, even if not with all possible accelerations, than to refuse running
it.

Jan

