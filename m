Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNfyGM+ziWkUBAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:15:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1210E0C5
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:15:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225130.1531601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOIe-0007PF-LG; Mon, 09 Feb 2026 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225130.1531601; Mon, 09 Feb 2026 10:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOIe-0007Mq-HZ; Mon, 09 Feb 2026 10:15:24 +0000
Received: by outflank-mailman (input) for mailman id 1225130;
 Mon, 09 Feb 2026 10:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpOId-0007Mk-QV
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:15:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d98be0e-05a0-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 11:15:21 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so35927785e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:15:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320396ccbsm122726605e9.0.2026.02.09.02.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 02:15:20 -0800 (PST)
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
X-Inumbo-ID: 3d98be0e-05a0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770632121; x=1771236921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rKEYjfwGSlDXYIcWOdqL22W8ABlXSix8asFwzwPE4lc=;
        b=TeddAdJ1FSzUmWbNbTwKkzDJSdHzNwF/aKPnbgOQLM+ZJaDFPR5AWJpDc89/AvFGvL
         g3MmdiPt7mCA3+4s6VyqIZ9WoKGLOrv22uDwsLntDBmRcTrOPM0UU6Pn8VsOIHpGkZpQ
         VMU1bgjHaKYp+IZIgBtM+WMQxV+b7LcPjUmRCo0XbnKT/adJzN5yedQBYafsLlNB6Jhe
         6JPhcV3zreJAjm/MKJPEXTC71PWyR7fF65xSNjSwducbg2bvht5fmdCkL1W+hf7roNXD
         gcXuVPRYp+Rfg+7rg+fN3Wxs/jBvMX00YpYiLEv2IwVzf52L55U5Te81/MMQaZKKsC/C
         /Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770632121; x=1771236921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKEYjfwGSlDXYIcWOdqL22W8ABlXSix8asFwzwPE4lc=;
        b=eu0zKu9aqhe1DncRMhqmqhihcvraYJqLgqZ1McXJSEEHg8Xa4NKswsuJZ87HTwvrEu
         TUsKAFRKSM/AOWtc6wNIG8eSAROrAgIkt7NMVFvmQVxhCpeESdRP+2cHskcudMAc+/Te
         yahfqsOpD+ovyeYuDv9Okj+h7e5pq9gu5mmrR6cBnTHFfcQ64mY7cioaqyQ1HBdYZcec
         4dOxszYI0+fqIGLO0eiIqInCksreHj6Ud7jcTp6wqZkWF70fSk4zwqnJzn4eV596urMn
         afYDPeO++CyNjNyTSS+vKjkQmN10/bVz7E2MkVe5z+ziFD4iBGQNrk892ItXHy7KtMcg
         w4tg==
X-Forwarded-Encrypted: i=1; AJvYcCVNXP0wVdCX7+X91xxqa3AchwzT5OwyXjD1VcjNjiNo33WXzW/U+voUs2ZLWgNZDcPR/6fdi6vNlDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVWPXbQeZoOSnH8rBkyLEgdjuvvm/2DNomdjSUB0s/m/G6w7WY
	Gv5VDzekR1YTSIQ3Z/YCD/yBVu7OQyT5tw8zGwqCNEbpMxT01k2IG2tlaS1PM3G/7UDrvKd876F
	4WM8=
X-Gm-Gg: AZuq6aKlpJz4CtZ6s/QSvrzi9ENGXDRA11eJrfu7n+XIHI3/Mx17IekA2koSa4p9VKP
	Gj2MMr0/+BTu72OJGXY5GSeNF76PYdy8Bexqh814jnnWAykJE9uMTtahWUBuvr11oBYj4ngBiUr
	+75jolWu0nrM5aHUESSuKgTgfozJLIxUGue5AaekBmdqYKA9SqvkvBnAWVxxVxBubJM6vnNr1S4
	m0aVGxd2b2ybMtPLlclJmBuk+D7RWLrjH8AuCOIK65LG8a0zczJRMEkBtrhFjOZR34dasjq0Grq
	abTtl0H4PNafoszq1QjedsEyUjN+vrV1R+U9wfHnzboU7cRk7VjP59sFpe1lYBZ1pQd+w4CPFpS
	KVALbKkEmJhXZz8cyA+NvurJ/t0dYsaNtETV1AMgyLwMYCeeivqYSJOmJZWUoqctMMK88iIrdNS
	iUeEaBd57wBxj2Fi8wMYgMPPPoohu/SEERGQm3MV3axVg5H7190rc+uwjizXNGnawetHQbQj71z
	zUw/CwPRMneLFA=
X-Received: by 2002:a05:600c:a101:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-483456a51ebmr12005765e9.25.1770632120620;
        Mon, 09 Feb 2026 02:15:20 -0800 (PST)
Message-ID: <836c1ef7-4ec3-4c4a-b527-17066327ff19@suse.com>
Date: Mon, 9 Feb 2026 11:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] const-ify vendor checks
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
 <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
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
In-Reply-To: <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6B1210E0C5
X-Rspamd-Action: no action

On 09.02.2026 11:05, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 10:21 AM CET, Jan Beulich wrote:
>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>> High level description
>>> ======================
>>>
>>> When compared to the RFC this makes a different approach The series introduces
>>> cpu_vendor() which maps to a constant in the single vendor case and to
>>> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDORS is a
>>> mask of the compile-time chosen vendors. This enables the compiler to detect
>>> dead-code at the uses and remove all unreachable branches, including in
>>> switches.
>>>
>>> When compared to the x86_vendor_is() macro introduced in the RFC, this is
>>> simpler. It achieves MOST of what the older macro did without touching the
>>> switches, with a few caveats:
>>>
>>>   1. Compiled-out vendors cause a panic, they don't fallback onto the unknown
>>>      vendor case. In retrospect, this is a much saner thing to do.
>>
>> I'm unconvinced here. Especially our Centaur and Shanghai support is at best
>> rudimentary. Treating those worse when configured-out than when configured-in
>> feels questionable.
> 
> Isn't that the point of configuring out?

That's what I'm unsure about.

> Besides the philosophical matter of whether or not a compiled-out vendor
> should be allowed to run there's the more practical matter of what to do
> with the x86_vendor field of boot_cpu_data. Because at that point our take
> that cross-vendor support is forbidden is a lot weaker. If I can run an
> AMD-hypervisor on an Intel host, what then? What policies would be allowed? If I
> wipe x86_vendor then policies with some unknown vendor would be fine. Should the
> leaves match too? If I do not wipe the field, should I do black magic to ensure
> the behaviour is different depending on whether the vendor is compiled in or
> not? What if I want to migrate a VM currently running in this hypothetical
> hypervisor? The rules becomes seriously complex.
> 
> It's just a lot cleaner to take the stance that compiled out vendors can't run.
> Then everything else is crystal clear and we avoid a universe's worth of corner
> cases. I expect upstream Xen to support all cases (I'm skeptical about the
> utility of the unknown vendor path, but oh well), but many downstreams might
> benefit from killing off support for vendors they really will never touch.

To them, will panic()ing (or not) make a difference?

>>>   2. equalities and inequalities have been replaced by equivalent (cpu_vendor() & ...)
>>>      forms. This isn't stylistic preference. This form allows the compiler
>>>      to merge the compared-against constant with X86_ENABLED_VENDORS, yielding
>>>      much better codegen throughout the tree.
>>>
>>> The effect of (2) triples the delta in the full build below.
>>>
>>> Some differences might be attributable to the change from policy vendor checks
>>> to boot_cpu_data. In the case of the emulator it caused a 400 bytes increase
>>> due to the way it checks using LOTS of macro invocations, so I left that one
>>> piece using the policy vendor except for the single vendor case.
>>
>> For the emulator I'd like to point out this question that I raised in the
>> AVX10 series:
> 
> There's no optimisation shortage for the emulator. For that patch I just
> ensure I didn't make a tricky situation worse. It is much better in the single-vendor case.
> 
>> "Since it'll be reducing code size, we may want to further convert
>>  host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
>>  (should be [almost?] everywhere)."
>>
>> Sadly there was no feedback an that (or really on almost all of that work) at
>> all so far.
> 
> It sounds fairly orthogonal to this, unless I'm missing the point.

It's largely orthogonal, except that if we had gone that route already, your
codegen diff might look somewhat different.

> In principle that would be fine. the vCPU features whose emulation requires
> special instructions are most definitely a subset of those of the host anyway.
> 
> I agree many cases could be simplified as you describe.
> 
> I do see a worrying danger of XSA should the max policy ever exceed the
> capabilities of the host on a feature required for emulating some instruction
> for that very feature. Then the guest could abuse the emulator to trigger #UD
> inside the hypervisor's emulation path.

Well, that max-policy related question is why I've raised the point, rather
than making (more) patches right away.

Jan

