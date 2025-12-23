Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2FCD9C70
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 16:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192639.1511779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4KG-0002Qv-5X; Tue, 23 Dec 2025 15:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192639.1511779; Tue, 23 Dec 2025 15:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4KG-0002PC-19; Tue, 23 Dec 2025 15:29:28 +0000
Received: by outflank-mailman (input) for mailman id 1192639;
 Tue, 23 Dec 2025 15:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY4KE-00026z-Ig
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 15:29:26 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290e82b9-e014-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 16:29:24 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so26553185e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 07:29:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3ad0c60sm123824475e9.5.2025.12.23.07.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 07:29:23 -0800 (PST)
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
X-Inumbo-ID: 290e82b9-e014-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766503764; x=1767108564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5jQDUbo7rkS2ayZCu6ncU3OwyE6ZcsbrZt5OfxfF1CM=;
        b=Vn0ou74op+0qndghvmxtBOplWhhZ4Z02IdugNmLaLgmk1uSqIWXybRISnww3XxzghZ
         dx97TSpC3OHSXsctNaYo8sSU0DmoPxGBHCCVaMBAqbEMq3uqeXQMrb0+JvaYBvEMylPI
         ozF4GD7MfI3I6zkCt4iIcDAqisCTf4bz9RMT1DTLzmkXL5InvDnF02p8p4YjIpgtPfLV
         QcT8HUuuSUmKMQsyxVXc+a0GOtCP2LQDmN3lCVrN0SwQ2xUzSZMh/YkrOIRJJ7rLyl3a
         5nFpHCLpY2YuGbRiImnTZZiu2E2nDfe0p5My+0ix+QcJfr3OrkTL6piV7QRwCxJE82Ef
         ZRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503764; x=1767108564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jQDUbo7rkS2ayZCu6ncU3OwyE6ZcsbrZt5OfxfF1CM=;
        b=KdIgGP5hwhdy/BPOC2t7RG97uN0seFPtZZRYjR7hU3kk2xXMvUqMAPbtGGTGAMO1ck
         I+ZyFtLar7w3lMrWuAnRaP0knO3cbwsrYHf5dNALWmlhVxJ6TjRdCcvl4A2iv9inmQ63
         OnYPuqRxEpBVKs+Tym8FROYOYnryFJ6dGVXkdGt8BLaJrrmheQsx4VeSnL2Q15oitQLr
         RD66XMdROqpdepBv4WhAt3hb2XqQcprYpOsEDHeXRTNvnR+GGNWlFN7fImNQGS33vXVD
         3JRaz8qFsl6qBSwrosoEHS44jqpchkdqaiYf2ZpIXRiOna1ZWbcheYd5FbLHmtj0NeMp
         buAA==
X-Gm-Message-State: AOJu0YwF+bU5ikHlRU8ET5NWbIAnLRpmM5z7EaWU0emJEJpQukv3vHxV
	wmOdj1BkKaTSFMjx4Fcf97Ru2fuwo5dd3PkTZjT70ZXf5SeaU5fobiWFdQKEgv40mg==
X-Gm-Gg: AY/fxX7VOHrOybJQXkTq9AQ40XNBK3Q7UOq8bVTKOzB7pxcIyV9iOVRgq9VhWxjGjFZ
	WofJiUi4wREPAYa/hpa31ybBwr7FziJ7SC1EWqv5LhwIRD6PszQZfliaKuJpelYVwMCGqFL+8iz
	xCqtO11KZqUlMaToDkxj258ROCdorSsXRe5isDXdmOCbuEqRDQnqfb/LxxdPFxaHxnsD0j8SBSx
	XPmgV3FHeTMjmGzjvr1PrtevzWPQJNvwYKvzWlIRYS+qJ2qW/TQv5CTabvHL/WOIv/6VfXvdXaZ
	eMGlVKIgAS6lxsKgA7Nlc6hIft12bGf2hbvXIp3Ss+CkfJaz65ifY2I2UbxVq+dN1femoI78zRj
	soIaqJKakkGrbXxJoH9zS4x0Vl9Zh7mp7GIBL+E023rNhwVBBZZlsB9V2wXA+L/S0UJJd3Pt449
	H9KBXL8cpre0Rp1Da6cqA8Ve+sBRP+tU2x1CaXaol0J1i7Aq3tWgKUpdOnpr/iV2lerPEpDuvKs
	Lg=
X-Google-Smtp-Source: AGHT+IHMY1SxJmBUk3eIqjGsmpIc5ula7DColMzJa6G8+8WXsj3QfRr6oqdQzIZWwitoi7xvbraYSg==
X-Received: by 2002:a05:600c:c0c7:b0:47d:264e:b37d with SMTP id 5b1f17b1804b1-47d264eb725mr85641705e9.22.1766503763657;
        Tue, 23 Dec 2025 07:29:23 -0800 (PST)
Message-ID: <0784ac64-f055-4d66-a811-e432b257009c@suse.com>
Date: Tue, 23 Dec 2025 16:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
 <aUUPPPYyuLUdj3XJ@Mac.lan> <4159dd59-4301-4265-bb5c-82949ed095a9@suse.com>
 <aUqzCZHYfiKB3Ltv@Mac.lan>
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
In-Reply-To: <aUqzCZHYfiKB3Ltv@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.12.2025 16:19, Roger Pau Monné wrote:
> On Mon, Dec 22, 2025 at 09:39:38AM +0100, Jan Beulich wrote:
>> On 19.12.2025 09:39, Roger Pau Monné wrote:
>>> On Thu, Dec 18, 2025 at 08:56:24AM +0100, Jan Beulich wrote:
>>>> Legacy PCI devices don't have any extended config space. Reading any part
>>>> thereof may very well return all ones. That then necessarily means we
>>>> would think we found a "loop", when there simply is nothing.
>>>>
>>>> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> With the U suffix added to the constant, as noted by Stewart.
>>
>> Thanks, albeit I'm not quite convinced I actually should put it in. Imo ...
> 
> What about using ~0U instead of the longish 0xfff... hex literal?

Oh, sorry, my reply apparently was ambiguous. I wasn't questioning the U, but
whether to commit the change after adding the U (as expanded upon further
down).

And no, I specifically replaced an earlier form where I also made assumptions
about unsigned int being 32 bits wide. ~0U would make the same assumption.

> Am I misremembering that we had a coding style rule to write hex
> numbers all in uppercase letters?  I don't seem to find it anywhere

I would have hoped you didn't find any: I, for one, consider them harder to
read and harder to distinguish from #define-s. Plus with the U in upper case
that also better separates from the digits.

>>>> ---
>>>> This is the minimalistic change to get rid of "overlap in extended cap
>>>> list" warnings I'm observing. We may want to avoid any attempt to access
>>>> extended config space when there is none - see Linux'es
>>>> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
>>>> then also avoid us interpreting as an extended cap list what isn't one at
>>>> all (some legacy PCI devices don't decode register address bits 9-11, some
>>>> return other non-0, non-all-ones data). Including the risk of reading a
>>>> register with read side effects. Thoughts?
>>>
>>> I think that's likely too much - for the hardware domain we want to
>>> allow the domain to access all the PCI config space, regardless of
>>> Xen's thinking there's nothing there.
>>
>> ... we really need to do better here, irrespective of this intended behavior
>> for hwdom. Us accessing the supposed extended capabilities list is already a
>> mistake when there's no extended config space. Us then calling
>> vpci_add_register() to "pin down" the value read is wrong too in that case.
> 
> Hm, yes, it would be better for Xen to use a logic similar to Linux's
> helpers to find the config space size.  This would need extending to
> pci_find_next_ext_capability(), as Xen does read the extended space
> without any checks there also.
> 
>> Question here is whether even with that fixed the check being added here
>> would make sense to keep. In that case putting it in now and then doing the
>> other re-work would likely be the right thing to do.
> 
> Yes, it probably wants to be there in addition to the extended checks
> for extended space presence.  If we have a pre-check that ensures the
> extended space is available, Xen should return an error also if
> reading from PCI_CFG_SPACE_SIZE returns ~0, as in that case the device
> must handle at least that access and return 0 to signal no extended
> capabilities.

Okay, so I'll commit the change as is and then make another change along
those lines. Or perhaps two, a 2nd one to deal with the DomU aspect. That
may only be in the new year, though.

Jan

