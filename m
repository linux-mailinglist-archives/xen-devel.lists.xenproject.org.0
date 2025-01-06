Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D4FA02082
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 09:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865534.1276767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUiGw-0003lL-Dq; Mon, 06 Jan 2025 08:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865534.1276767; Mon, 06 Jan 2025 08:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUiGw-0003iv-B1; Mon, 06 Jan 2025 08:15:38 +0000
Received: by outflank-mailman (input) for mailman id 865534;
 Mon, 06 Jan 2025 08:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUiGu-0003io-FQ
 for xen-devel@lists.xen.org; Mon, 06 Jan 2025 08:15:36 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e5c8b5-cc06-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 09:15:32 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso4563653f8f.2
 for <xen-devel@lists.xen.org>; Mon, 06 Jan 2025 00:15:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1acsm47369895f8f.68.2025.01.06.00.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 00:15:31 -0800 (PST)
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
X-Inumbo-ID: 65e5c8b5-cc06-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736151332; x=1736756132; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rSYdRm/a7jNFsYtQqLFAh2uV/OUwD/apSXYr7PyQd3I=;
        b=CMru65QhHVdJLd5X7aPeHsde+vUo2Eg8Akom8HqIU/6r7RorDqN+/nfw0DQYl5z1kE
         KG1WxgrjswK2FFnfUrLPANJeCq3UC7zzrI4I60ctrV3CTPlOpL3zNYvIVCyRIMtiZiaz
         yK8POYDUB9qAue+0e/4foztkEtg7zuDipX8iza6ZHPZOagEvBqK77+zslBltm9kxJGa7
         qwAymx8veQFhfvLug3WAZkVIWShYZFNe/Z/Tvu22oQH13Acw751xAH/czhukIfSTOm1A
         z1f+F/ZrJyv9ljMctXJz8VqZaWeAwzZlSqwP3uOgeYyeAIZ42LfWIiAIqlSU1Jzq+AeC
         cJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736151332; x=1736756132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSYdRm/a7jNFsYtQqLFAh2uV/OUwD/apSXYr7PyQd3I=;
        b=XstVln+knxOpDesmEwisZpyBNUyWflKK8hG7A0aQH1xjhEtrWzAt+p9zbaasdlcn3n
         ViKTIwF7Rh0sEhfv+pwOxyQDUYpRVuLYsyjCUyX6evt/bVgvYiOqy3aYsrXPieXaJV2w
         ExFXzOrN1Lk2RWMaEXaNYqiAhfJjXyW43e/eLlsskMAiwjjK0Lmn118z3V8A8E957Qxh
         RX7nY4twxdBkAtb50VADqFGj1dRPPBlQsnXvWu9mKPvQXPMm26dBle7SfS3EEl8fucy1
         tvGbsPgvnKgSV+2zeryzfyCAEBEpCSdx/iOTN6sy3sIbllaPOt7U/EAbeHq41OIixBuZ
         6a3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVon6OrJS+CNjFKWecDszyA/bBSjB7s4nqcEVlZDrUjQaJuWJqivyBY/kL9d7h2NEazFF5pTrMy2m0=@lists.xen.org
X-Gm-Message-State: AOJu0YyorVJxDrpC1KO+nudZ7oRmSVy0V5HsQ7mL2GahUkOcryj23hxR
	NWvGICtMc4Atc6seuyBdOiPDlYWu2IUva681uw5F3eY3o6h3pA3mfYTjdd913Q==
X-Gm-Gg: ASbGncsvhjnuXXlFqH11Tjw2i02eh2IP9OBuaHyENCqT2UrwngWdH370V5AsDPdQNWC
	0xWmUq/YdjMnZElq97rlvcFjwxSkOep7to+C/K48OHrXcuesScMf8gzpcAL+oya57yffw+ANdlB
	xWAxRQFY+feEakFy52Ciim5g4EjjquCCzaCTIum2uaDhsat6U/+GYhJ8tk/OriRfmrkSq5/t5vt
	u4ch4pEs2c/lz3ewOkyvjSGXE3qGQ1cwPZLYOHd8I051tDBQBH+wEGeqC6KlA9iPziObwcIiOar
	1rK2KyX6bXvXkWV7V2PQbYk08UlLBqq56hOuLWHMRA==
X-Google-Smtp-Source: AGHT+IH2becdfDFGpDsUA06tng4ArRB6Mr9/OA4UN3771rx3JmTQbijQYW8zStIhyyUy9cj9odCb1w==
X-Received: by 2002:a05:6000:3cd:b0:386:1cd3:8a03 with SMTP id ffacd0b85a97d-38a222009camr41124699f8f.32.1736151331769;
        Mon, 06 Jan 2025 00:15:31 -0800 (PST)
Message-ID: <2f33b1fc-e527-4e42-b197-058b1a9f7870@suse.com>
Date: Mon, 6 Jan 2025 09:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xen.org
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
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
In-Reply-To: <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.01.2025 14:38, Jürgen Groß wrote:
> On 02.01.25 13:53, David Woodhouse wrote:
>> On Thu, 2025-01-02 at 13:07 +0100, Jürgen Groß wrote:
>>> On 23.12.24 15:24, David Woodhouse wrote:
>>>> On Tue, 2024-12-17 at 12:18 +0000, Xen.org security team wrote:
>>>>>                Xen Security Advisory CVE-2024-53241 / XSA-466
>>>>>                                   version 3
>>>>>
>>>>>            Xen hypercall page unsafe against speculative attacks
>>>>>
>>>>> UPDATES IN VERSION 3
>>>>> ====================
>>>>>
>>>>> Update of patch 5, public release.
>>>>
>>>> Can't we even use the hypercall page early in boot? Surely we have to
>>>> know whether we're running on an Intel or AMD CPU before we get to the
>>>> point where we can enable any of the new control-flow integrity
>>>> support? Do we need to jump through those hoops do do that early
>>>> detection and setup?
>>>
>>> The downside of this approach would be to have another variant to do
>>> hypercalls. So you'd have to replace the variant being able to use AMD
>>> or INTEL specific instructions with a function doing the hypercall via
>>> the hypercall page.
>>
>> You'd probably start with the hypercall function just jumping directly
>> into the temporary hypercall page during early boot, and then you'd
>> update them to use the natively prepared vmcall/vmmcall version later.
>>
>> All the complexity of patching and CPU detection in early boot seems to
>> be somewhat gratuitous and even counter-productive given the change it
>> introduces to 64-bit latching.
>>
>> And even if the 64-bit latch does happen when HVM_PARAM_CALLBACK_IRQ is
>> set, isn't that potentially a lot later in boot? Xen will be treating
>> this guest as 32-bit until then, so won't all the vcpu_info and
>> runstate structures be wrong even as the secondary CPUs are already up
>> and running?
> 
> What I don't get is why this latching isn't done when the shared info
> page is mapped into the guest via the XENMAPSPACE_shared_info hypercall
> or maybe additionally when VCPUOP_register_runstate_memory_area is being
> used by the guest.

The respective commit (6c13b7b80f02) lacking details, my guess is that
because at that point both operations you mention didn't have HVM-specific
logic (yet), the first HVM-specific operation used by the PV ("unmodified")
drivers was selected. pv-ops (having a different init sequence) appeared
only later, and was then (seemingly) sufficiently covered by the latching
done when the hypercall page was initialized (which was added a few months
after said commit).

Jan

