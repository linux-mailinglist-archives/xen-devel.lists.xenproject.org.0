Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFDA028B2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 15:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865776.1277048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoZ5-0000as-AE; Mon, 06 Jan 2025 14:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865776.1277048; Mon, 06 Jan 2025 14:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoZ5-0000ZN-6R; Mon, 06 Jan 2025 14:58:47 +0000
Received: by outflank-mailman (input) for mailman id 865776;
 Mon, 06 Jan 2025 14:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUoZ4-0000ZH-AN
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 14:58:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b92ddc59-cc3e-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 15:58:44 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4368a293339so111885385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 06:58:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea487sm567419575e9.8.2025.01.06.06.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 06:58:43 -0800 (PST)
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
X-Inumbo-ID: b92ddc59-cc3e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736175523; x=1736780323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhFIIEkr/GJ4M5GxwXcyKkBtEuR/1xAwnhwUUHRhLvs=;
        b=fUoYN2J48EV1F9dYVfsiIAIPWM49x2118x8zgfLuJGvhdjODX0T9QV5p7eZT8NFBvI
         ZvzD7t9M+ep95KrTo7cBQB5fSeXNaAx5Y6mspZ9NWOs79ek7IIHOAj0qNTZUMsiz6tyZ
         YP6fMBQarDGXy/UrnCGkabtML9fW5edsuWUJyCiOJZw+VFv70Cv14jeKjb8Op+woNTl3
         osU9ULeVM0jkF7sFlh/fdVNG7kT8CYmFM0iRI0qEHxXNz7AMJYduVNxb3bPnW/sGe88X
         N7ZFuiFSkAd9LcNHEbErEiFNxTNl+rET57LgHIn6plrW/4xcyo5QUC/X9EDaoztqB2+U
         ggEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175523; x=1736780323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFIIEkr/GJ4M5GxwXcyKkBtEuR/1xAwnhwUUHRhLvs=;
        b=vwJzReLiQ4Fwc8NrxEaIVuLoNLrW3DaH3z7Wo+NoQecqIH3Y1w5uQBddvEu+MD+l1l
         5jrhZjQsMvMVIEKflq2ujUAPLBRmj0nM/ueG2RdBtLQd2m8StRd1rAfJ5aIVZyv5eSqa
         K8+kVYOHFfp6kIhDoezNeH6ofLb/pMjL7Kmnr8xtAaOx9iLYTXMt2MftHRwF3L0Bg3q1
         zDsg2Ys3sHECBnwJON85v2hPPbZ2+D0NBAOWlV2L8w4+frG0pIhJDr1gHKAMVKjCzRHC
         HD0WEoUATbrQunxAIHs/+7mdwYxxduzGyo1dwKB0CuPIbGZaA6ARrLdKoReL6AJyTsoq
         TVhw==
X-Forwarded-Encrypted: i=1; AJvYcCUZHNVfdFwcB7T8F8GpH0lP8dYebto+kzYDMyy6BSYKFXsoqgKyxE2cbi3rxnLH3yjHtFQtqRjO8ng=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrs3+K65TnkMT/zOMoO66+lUBXvnDAfq7m+dOJKWeZ+0ApfePx
	SFCWfnHc6LnXD4JunuSUf+QLyx017fpHlbnexk9J2gu6hjIbaCvGxhc3iQfoBQ==
X-Gm-Gg: ASbGncuPc+QGUhYzTynZefzUyihl5cA3Gw7yhuAKfkMkYr5ne6p6mLyaykx2G2HAyCY
	6m9eODfnaKfXK1yHTUdjLhcOaMJ8eOnRRTxQfx/mNVg/OvDHAb2r3wQkYps31yRgkdEs/1NKjrI
	p7+z2OUL7LJPnkDSof3T8C2Ac7csnQhSgsp60hzG3vle84Tim3igwA6dC3wYArsw5G+bPLqDus6
	zgCXE0suMX77+gs73q56zfd0q4aP9QILdjWQi3mCy1HRprm2wRVJneabs8/ENhNhZhQPC2OrUc6
	R1lvI4Zim2dCkdz+bSPAcA8E7u3VZaKYYAE+J1HZMQ==
X-Google-Smtp-Source: AGHT+IHLybgUg1D9p5Nly5aMT4acGCVC2qeQavhuwBUTIHlTBqfVB6Hoi9/i/5hL/Wm4No06mIwnvw==
X-Received: by 2002:a05:600c:a0a:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-43668b93ca2mr518166105e9.30.1736175523347;
        Mon, 06 Jan 2025 06:58:43 -0800 (PST)
Message-ID: <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
Date: Mon, 6 Jan 2025 15:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
 <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
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
In-Reply-To: <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 15:05, Tamas K Lengyel wrote:
> On Mon, Jan 6, 2025 at 5:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.12.2024 07:30, Sergiy Kibrik wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
>>> and monitoring support optional.
>>
>> Yet doesn't this end up in things becoming misleading? Don't we rather need a
>> 2nd Kconfig option, with a dependency between the two? Or alternatively a
>> rename of the existing option (to describe the higher-level feature rather
>> than the lower level one)? Tamas, I'm particularly interested in knowing your
>> view here as well.
> 
> Thanks Jan, I was thinking the same thing. The dependency of these
> subsystems is mem_access -> monitor -> vm_event. If the goal here is
> to disable all three levels the ideal way would be to have separate
> kconfig options for each level. It may be a bit too fine-grained
> though on ARM since there are only two types of events for monitor
> (SMC & mem_access) and only the monitor uses the vm_event channel (no
> mem-sharing/paging on ARM). So if doing separate kconfig for each
> individual feature is an overkill I would suggest using
> CONFIG_VM_EVENT that disables all three levels, including both
> mem_access & smc monitor hooks.

Except that "disables all three levels" doesn't work, unless the other
option(s) are promptless (and selected). I'd have expected VM_EVENT to
maybe have a "depends on MEM_ACCESS", whereas a "select MEM_ACCESS"
wouldn't make much sense as long as MEM_ACCESS can be enabled
individually (with it being unclear to me whether such a configuration
is actually useful in any way).

Jan

