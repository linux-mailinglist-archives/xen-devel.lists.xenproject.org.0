Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123AFB52A5C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119453.1464806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbyZ-00019h-AW; Thu, 11 Sep 2025 07:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119453.1464806; Thu, 11 Sep 2025 07:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbyZ-00018C-7N; Thu, 11 Sep 2025 07:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1119453;
 Thu, 11 Sep 2025 07:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwbyX-00017D-HA
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:44:13 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d24eaf-8ee3-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 09:44:05 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b079c13240eso62081266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 00:44:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b317124esm74481266b.46.2025.09.11.00.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 00:44:04 -0700 (PDT)
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
X-Inumbo-ID: 17d24eaf-8ee3-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757576645; x=1758181445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=13EITH6UPoKNJoOZIRh0oEczIS9NjP3IQCphogYLm4Q=;
        b=GisFM34M7GNR11sd9DTY2qELAbsCew1pdsuLOqy82S/CzwNgW91PNfPvWkro0jgd5k
         BKMo4cI0f6yu9XMbbgFgFnK0O1f2Iw+1QxHbK7LN4Eep1OhFJtLguR9PNbmdeJSiBR93
         QX+eg4zAXtHLfbPjZXROUoPp6QhQiMGGQZxYNcwp7QxSBRGCUWogW8ya95ZKp3oHyXH/
         xid0WqWVnnnUTFtKw5z0D/nBoQb6OfvIGN7w66cIcS6/bneLIP2hbonB48QDbCr697La
         1awFAOprNN1RscGDv1fCl27md8HT/CFwzy6Nr4AvN4It7XeTe8iYphxMZdJk1YhHUFRm
         MEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576645; x=1758181445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13EITH6UPoKNJoOZIRh0oEczIS9NjP3IQCphogYLm4Q=;
        b=cbkwROkWUWE6rOxVtkPWdZx3sLAkYIxvv6n1oGp1Aa9l/QT/Qa0Wje0Pj4H9lOXoLq
         sonAPrrVvtmso6EQR4ym8N7DYHErg1CwDRLs6JruiDmaNiXtNSt4tOj9fPd+UO6opgNG
         juU4RnqSv/F9+U78qJKwki39KHwkoMDBT7+l0bO/7s+Fa+g0hLAUq/UD/UFlhQfYe9bK
         M69mRP7gQQdqHukjH3zIhIo8XevfAPAqBKxH0Nkc/1/vds90vP5XuFwst3sl5qfi9XSo
         A77Nmwg6oIylBfftNdHq0EnxWqfK6Txz50ML9AGUPj1UY+bT/6UEktjnrz84/POd+UzH
         UQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVO7LpgS29js41cHTIcZ+NJ9IefIMXYZKYb+wHFKZa6kSDl6cwW4KqjOWO4JmvjnRCLH6IwQ2bkZQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBEbtr7Oj1UQjX/+0Uht1bXDRDfRNTzOUOvn8a08JIY/nI8nTk
	pOeZXJDlQ1NznSQim6UpsL26lLZchdjHEXIOOiFYqwYCytl/jVj75SvuGJurfct3Vw==
X-Gm-Gg: ASbGncsG6e0Qsn30Wu4jfqBzaQKFXr5FdzKSutY2QMnpjH3pcRMp/NBmygNhbNw1RZ8
	EKiLd3NN/DIup8MHZL7vXwb9hMQQLkpbSm6j3X/U/JS1aPK2P5Jz+rGiR8oATA+Dy2RZlgCafDy
	eq0+4Z+MJnDVwlNBA++NTGVA3D1jrMpXmpRR/uUUwPQYSgrpjmWeOMc6CD6KTTJG20Pc6OKJTVz
	1XSn+tgwR7z6ixjS33PU8Mt6+1oH0Rw/uam/cZRs0+BJZDpJsKZ+Wjm68FUNWnp+v3rm9FbdgH4
	1NRRQ1gok2odVNOUhwXfdZrGkHsWKacxDjfKosvygqaaF7+oYlSyQ0h7I+/6YnhOFShKXpAuQoE
	HyLuvefm0fAiBCVL5DajnE0ubxGj9AobxomhXTnhut9gc7Wb7+XnYRiUl8w9nZPxjS5JLQkKGdX
	HLqPylHW8U2ex/ZdOvlg==
X-Google-Smtp-Source: AGHT+IEew67QPKjteNM6PENQoGic2kJr0i4aniLjkPqGfDaT8Hrd8JPvgaxSEVMZ608Geg8oP2HWJA==
X-Received: by 2002:a17:907:2d91:b0:b04:3302:d7a8 with SMTP id a640c23a62f3a-b04b16d300dmr1757116666b.58.1757576645156;
        Thu, 11 Sep 2025 00:44:05 -0700 (PDT)
Message-ID: <96b58fe4-668f-44be-9469-0ec7f4f28c6f@suse.com>
Date: Thu, 11 Sep 2025 09:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
 <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
 <DCPA5G9EUXZZ.1739W35VKVBBP@amd.com> <DCPAR2NLL4VI.78XRJRDLA0ID@amd.com>
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
In-Reply-To: <DCPAR2NLL4VI.78XRJRDLA0ID@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 19:29, Alejandro Vallejo wrote:
> On Wed Sep 10, 2025 at 7:01 PM CEST, Alejandro Vallejo wrote:
>> On Wed Sep 10, 2025 at 5:31 PM CEST, Jan Beulich wrote:
>>> On 10.09.2025 17:16, Alejandro Vallejo wrote:
>>>> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>>>>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>>>>> CPU hotplug relies on the guest having access to the legacy online CPU
>>>>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
>>>>>> this causes the MADT to get corrupted due to spurious modifications of
>>>>>> the "online" flag in MADT entries and the table checksum during the
>>>>>> initial acpica passes.
>>>>>
>>>>> I don't understand this MADT corruption aspect, which - aiui - is why
>>>>> there's a Fixes: tag here. The code change itself looks plausible.
>>>>
>>>> When there's no DM to provide a real and honest online CPU bitmap on PIO 0xAF00
>>>> then we get all 1s (because there's no IOREQ server). Which confuses the GPE
>>>> handler.
>>>>
>>>> Somehow, the GPE handler is being triggered. Whether this is due to a real SCI
>>>> or just it being spuriously executed as part of the initial acpica pass, I don't
>>>> know.
>>>>
>>>> Both statements combined means the checksum and online flags in the MADT get
>>>> changed after initial parsing making it appear as-if all 128 CPUs were plugged.
>>>
>>> I can follow this part (the online flags one, that is).
>>>
>>>> This patch makes the checksums be correct after acpica init.
>>>
>>> I'm still in trouble with this one. If MADT is modified in the process, there's
>>> only one of two possible options:
>>> 1) It's expected for the checksum to no longer be correct.
>>> 2) The checksum is being fixed up in the process.
>>> That's independent of being HVM or PVH and independent of guest boot or later.
>>> (Of course there's a sub-variant of 2, where the adjusting of the checksum
>>> would be broken, but that wouldn't be covered by your change.)
>>
>> I see what you mean now. The checksum correction code LOOKS correct. But I
>> wonder about the table length... We report a table as big as it needs to be,
>> but the checksum update is done irrespective of FLG being inside the valid range
>> of the MADT. If a guest with 2 vCPUs (in max_vcpus) sees vCPU127 being signalled
>> that'd trigger the (unseen) online flag to be enabled and the checksum adjusted,
>> except the checksum must not being adjusted.
>>
>> I could add even more AML to cover that, but that'd be QEMU misbehaving (or
>> being absent). This patch covers the latter case, but it might be good to
>> change the commit message to reflect the real problem.
> 
> It doesn't quite add up in the mismatch though. There might be something else
> lurking in there.
> 
> Regardless, I don't want this junk in PVH. Would a commit reword suffice to have
> it acked?

I think so, yes.

Jan

