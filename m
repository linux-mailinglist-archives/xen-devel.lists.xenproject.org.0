Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87757A564F2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 11:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904853.1312667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUmM-0005zg-0t; Fri, 07 Mar 2025 10:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904853.1312667; Fri, 07 Mar 2025 10:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUmL-0005xS-Tt; Fri, 07 Mar 2025 10:18:05 +0000
Received: by outflank-mailman (input) for mailman id 904853;
 Fri, 07 Mar 2025 10:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqUmL-0005xM-Eb
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 10:18:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 742b18d1-fb3d-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 11:18:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bd87f7c2eso9363605e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 02:18:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfbaa94sm4905486f8f.14.2025.03.07.02.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 02:18:02 -0800 (PST)
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
X-Inumbo-ID: 742b18d1-fb3d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741342683; x=1741947483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lwusYRAshkn4IoRmn+Btk/sfMLkdMusYw3dg4FXrJfA=;
        b=DoMyWIBwoD3/cWFdYtBQGdz+QjOZuUoi4L9kBpjjJcseyC6zobybyQplPS0SYvKM9c
         rsF4FzfQuIkppnajLy2/rxYsk7n+PnHp7v6UC3g31o0WwoGdMfcYUWohkLIAtOF4FCbg
         PPRt/+g9IlCUSoe/Gy4NpuQF/NLzdw8vJ6KCaNmHP/BTOKcIwRbPaGmgbFiihINyuf5t
         7P9IS6z3qrqrvIofrz8smxi3MwrvedE9FLCq+/Hcm9mU5MbOtJC1Py3iVUoQn5u5t3O6
         EMddE49cBUqqYqjuUbsY5Dybu1Min1GwMjbIwZjqq+L3doh7K5X78BDqI5qh0/OtwXEO
         yd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342683; x=1741947483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwusYRAshkn4IoRmn+Btk/sfMLkdMusYw3dg4FXrJfA=;
        b=XwNQvIEyc1c48/jHq+u0v6WaVu6T7v+dj4POQzhjlp00Q8PC6HOY6Tk3lJpIIuQ91s
         9XnKzH2457AxOpWP0Fdj539T8QEyBiN5QzrqMUrDKNBVH60dZQ1HKrOXKzu0axMFHmth
         kb6ltl/u2ch8j85iJi4X+FRkfr6dDfPUtWvKbvvPrlnEXBx79eHJcgyxuAjZRBJYVlRB
         fmRfAZRI8z0OSjeOr9ECCPd0gZLmF+RGQX7xUhI2Z32DSGQVO4sG1OsuJxEghohiSgN5
         z9+u5cFaHswGK40cbNMXvpBDRKeWMU4R9e+Gai1h/K/HUf8ymTc1pCE7pyNniX4tErpC
         YpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzQ+FQgk6BinkKtBu7aymD113DReFg9lMGurYU+FF9LoEn3TszW0yOSe82JVfDbiVN4ndExo2i4mk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8Pp3mFumoDBz92kItLms5ZA+YwFe/U6HhEqEIuebNjTgftSgP
	9TzsRCkpFSIUywM0SuNTKLKKORlahPvjGzuUQsUMd2dVzf4beuno1YjgUiQ6jg==
X-Gm-Gg: ASbGncs57RaFx6xEOom952VeDf7VqPUskcx0/DhptNwtlVHeYt8UfkwAVuGqEC4YTxr
	8V7XX/GeDtOxUJXZNZ81cBNukjYcQlfauzbVMaMwq/bda+2PAk1JxYTiHkLYXRhIfd3/hJDindz
	RkTGXnhja5TEgEtztDrErnCMXc+Hw3Y9w8BqqqmOFmdGz+U0zOfBZY9ScdWjfASQvB6/8ppNaOl
	T8gykC1dI3KOtv+1Q67N91fGiEKUHREWXZLumMdQT/3rIHT97ZVV2MNzlMl+sflKhbwJ7ChaaPS
	0dVJduZUH5JOafSozbOFG3MzuaLTa96tazx/rLomi1x643kgs/+9K8tkKQj9+bfxu5jk+1oG4xp
	obQ3XR3uq6AxF2X48S7SD3R4aBM7GUQ==
X-Google-Smtp-Source: AGHT+IGXKqeuMDpIOn5fCsmA/A3KtV3o3FqDAwIIzN2D/HXXPQOuE2HR/PxD13987H3juysRFr8apA==
X-Received: by 2002:a5d:5889:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-39132d1df2cmr2177980f8f.16.1741342682790;
        Fri, 07 Mar 2025 02:18:02 -0800 (PST)
Message-ID: <8fc6651f-f100-4ba6-95a8-faa8d99ed8f7@suse.com>
Date: Fri, 7 Mar 2025 11:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/msi: don't use cached address and data fields
 in msi_desc for dump_msi()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-3-roger.pau@citrix.com>
 <697601b2-5592-4552-b6e0-4366a55467e8@suse.com>
 <Z8nhxJV5lS4dz0AL@macbook.local>
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
In-Reply-To: <Z8nhxJV5lS4dz0AL@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 18:56, Roger Pau Monné wrote:
> On Thu, Mar 06, 2025 at 05:45:27PM +0100, Jan Beulich wrote:
>> On 06.03.2025 15:57, Roger Pau Monne wrote:
>>> Instead compose a dummy MSI message just for the purpose of getting the
>>> delivery attributes, which are the same for all messages.  Note that the
>>> previous usage of the cached MSI message wasn't fetching the hardware MSI
>>> fields either.
>>
>> This feels not future proof. There's no guarantee special IRQs (HPET, IOMMU)
>> would necessarily use msi_compose_msg() (or any open-coded subset thereof).
> 
> Hm, even if not using msi_compose_msg() I don't see how any device
> would use a different MSI settings from physical delivery and fixed
> destination.  I think it's unlikely for a device to use anything
> different from the current values set by msi_compose_msg().

I'm not entirely sure about this. If e.g. broadcast was possible to send via
MSI, I could see use cases. Potentially also for e.g. NMI.

> Otherwise I can see about returning whether the entry needs to be
> updated from iommu_update_ire_from_msi() (if the offset into the IRT
> for the entry has changed).  However that requires adding code to both
> AMD and Intel IOMMU implementations, and will need at least a way to
> signal that the MSI fields must forcefully be written on resume.

While that may indeed be more intrusive, it feels like it may be the less
risky approach (as to overlooking yet another case where we rely on the
untranslated message to be stored). Overall I can only say that I'm
uncertain which of the two approaches would end up being better.

>>> @@ -1512,8 +1520,7 @@ static void cf_check dump_msi(unsigned char key)
>>>              mask = '?';
>>>          printk(" %-6s%4u vec=%02x%7s%6s%3sassert%5s%7s"
>>>                 " dest=%08x mask=%d/%c%c/%c\n",
>>> -               type, irq,
>>> -               (data & MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT,
>>> +               type, irq, desc->arch.vector,
>>
>> We've already dropped desc's lock, so shouldn't be de-referencing desc anymore.
> 
> Right, I need to cache it before dropping the lock.
> 
>>>                 data & MSI_DATA_DELIVERY_LOWPRI ? "lowest" : "fixed",
>>>                 data & MSI_DATA_TRIGGER_LEVEL ? "level" : "edge",
>>>                 data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
>>
>> To add to the comment at the top, plus taking patch 1 into account: If we
>> uniformly used the output of the dummy msi_compose_msg() invocation, why would
>> we even bother to log information conditionally upon what is in data/addr?
> 
> We could change what's set by msi_compose_msg(), and then the
> information here would be incorrect (if hardcoded).

Hmm, yes, that could happen, but would hopefully be caught in review (much
like it happened this time round).

Jan

