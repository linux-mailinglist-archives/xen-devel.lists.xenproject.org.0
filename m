Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BECD519B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 09:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191978.1511353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXbS8-00045e-Mc; Mon, 22 Dec 2025 08:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191978.1511353; Mon, 22 Dec 2025 08:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXbS8-00042n-Jh; Mon, 22 Dec 2025 08:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1191978;
 Mon, 22 Dec 2025 08:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXbS6-00042h-I4
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 08:39:38 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf3a4df3-df11-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 09:39:36 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so3008737f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 00:39:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b1bdsm20250637f8f.8.2025.12.22.00.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 00:39:35 -0800 (PST)
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
X-Inumbo-ID: bf3a4df3-df11-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766392776; x=1766997576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kM/G+3vOlIVJr3eIOgvO/AXnK7vKxY6uR+eXbYXpnBI=;
        b=b9RkonsTa5gejcIMoQWk7VqE7aawvxxdeYPR3CPSrQGBbDfcbnyz1bfLdeENQVKhl7
         swA3TcqWcqRbbFWdK97BBQKIKxA1GUgCtwiLo5DvzyAzOUlS7JKgAq1R6VzxOk/i2tUS
         B/7WMTXBPcfz/6xMLAwIMTLtmutZUnMeHCC9PzqssHtUYpuezAE1LH+1z0i+NPi/guUj
         /OHdNJ3c+HL9BvP2EX3DYwdADVMlq9oVbxd8s8Yy1+WlUKYSmUwxMjSOj4rCPm4s4mqC
         dOE91AXPv/o7fr+q8R3SkEh9C6RjfjvFGAXTa+aq5nZSsdiWyeMGz/c9Y8DYuAI64a1w
         Khpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392776; x=1766997576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM/G+3vOlIVJr3eIOgvO/AXnK7vKxY6uR+eXbYXpnBI=;
        b=rpaRRL0RHSYluJ2MJ/EWqhoP8sKlDbJ02rNQ7bmGrzJMRSbqgode3clqXx48WKuGxq
         Rl0sZ9hGKfzhgFhLL2JeVadS2p6ruGqemR45LLkNAngFDqsbkTCDFdoHPVU9QLHfWzO0
         Iy7Ut86DcjXNf7puokXKHZIxBMVjM4XVAxmQV8bgTnJUB+1yiEOAklXi6BEoIhkNzRRd
         88vsfK04kpxD5MpVnkVUJ4gA1prXpajT23a4Tc82oNdgQ6fuJE8dv8Cc2u15YVVhCYFL
         4XSiNxE3QmPrc6iQ5FOAwufzZHcLd2oCzMOHrFQUUKDnQWFvYBFfFko0BT+MXeQ0xWQK
         wbYw==
X-Gm-Message-State: AOJu0YwjPjnLzuCMBnu8WETtQD5BUTReqXa7NzW2+H6moSVVcEv+SgKk
	2FXfOlz13UfLTR8351RZP7Bs7bShjSmcuSKEHFVAK1l+e35xfQAwSenEaf7d4mTDUA==
X-Gm-Gg: AY/fxX4+ZGB5Brg+MSBk2RVzeER/6gcRYYeX6BUFHmhIChT0o2tY3Tf99LycaFSaDbx
	JoPAsGAROrpllMbd5H+ndZh8wqpfIzexPB57JUsO/d6IEnVlAROBaVwRsDHcrr9inEqS+/Sq+2i
	npsQrAkvPasbPFUSyWJ4xmYqqfvZ1xgLY9WbAsMkAWzSbg5qo8dvOQOVsdJNsC8Vr4GRqnI055v
	89UG0JHWrYtUQyhvhBqR9wmHsUhi2BqWcfExz6vmaCf+NtZAW3uwhyfoSq9px9sQQTtAAU59Ui5
	m9CZp+3fXek426f8o61fM7FFK9UKu0HVwOjvXHj5Q3g3EV1yvzz6Jcm1wbGlbHG9feb+h3aV9x6
	WgMfOpaz8QWxuVsK9IobPTI7ee8CBzFNN4F9YY9FHbUPTyVCVxFOKDOwTle8P9EGGDuUsmzQ+3z
	4suI9lfMJahb+0mzqrfrrjjoKE+ozSL8KUR67sFD+cBY0g55X8QbYtWqw+qedwUc3YdGC90HQ9C
	xk=
X-Google-Smtp-Source: AGHT+IELJDtylkiXIOj/1JApop7nYHXK3BTk53NIp3FKZhWQEepymwHi3KDGNKsOR6MYtSO0ZceJ3g==
X-Received: by 2002:a5d:588c:0:b0:42f:b707:56cc with SMTP id ffacd0b85a97d-4324e4fdb0bmr10316197f8f.30.1766392775951;
        Mon, 22 Dec 2025 00:39:35 -0800 (PST)
Message-ID: <4159dd59-4301-4265-bb5c-82949ed095a9@suse.com>
Date: Mon, 22 Dec 2025 09:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
 <aUUPPPYyuLUdj3XJ@Mac.lan>
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
In-Reply-To: <aUUPPPYyuLUdj3XJ@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2025 09:39, Roger Pau Monné wrote:
> On Thu, Dec 18, 2025 at 08:56:24AM +0100, Jan Beulich wrote:
>> Legacy PCI devices don't have any extended config space. Reading any part
>> thereof may very well return all ones. That then necessarily means we
>> would think we found a "loop", when there simply is nothing.
>>
>> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> With the U suffix added to the constant, as noted by Stewart.

Thanks, albeit I'm not quite convinced I actually should put it in. Imo ...

>> ---
>> This is the minimalistic change to get rid of "overlap in extended cap
>> list" warnings I'm observing. We may want to avoid any attempt to access
>> extended config space when there is none - see Linux'es
>> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
>> then also avoid us interpreting as an extended cap list what isn't one at
>> all (some legacy PCI devices don't decode register address bits 9-11, some
>> return other non-0, non-all-ones data). Including the risk of reading a
>> register with read side effects. Thoughts?
> 
> I think that's likely too much - for the hardware domain we want to
> allow the domain to access all the PCI config space, regardless of
> Xen's thinking there's nothing there.

... we really need to do better here, irrespective of this intended behavior
for hwdom. Us accessing the supposed extended capabilities list is already a
mistake when there's no extended config space. Us then calling
vpci_add_register() to "pin down" the value read is wrong too in that case.

Question here is whether even with that fixed the check being added here
would make sense to keep. In that case putting it in now and then doing the
other re-work would likely be the right thing to do.

>> The DomU part of the function worries me as well. Rather than making it
>> "read 0, write ignore" for just the first 32 bits, shouldn't we make it so
>> for the entire extended config space, and shouldn't we also make it "read
>> all ones, write ignore" when there is no extended config space in the
>> first place (then in particular also for the first 32 bits)?
> 
> If there's no explicitly handler added, the behavior for domU will
> already be to drop writes, and return reads as all 1s, which is fine
> for the rest of the extended config space?  We just need to return 0
> for the first 32bits to avoid seeming to have extended capability
> support.
> 
> Maybe we want to keep the same behavior as expected from native for
> legacy devices and just return all 1s consistency for the extended
> space?
> 
> Hence we don't need to special case this region, as it's already
> covered by how unhandled accesses are resolved for domUs.
> 
> Or is there something else I'm missing?

Imo correct behavior would be to return 0 for the first 32 bits when there
is extended config space, and ~0 when there isn't.

Jan

