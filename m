Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHYZKxlVhGkx2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:30:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56DEFE54
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221597.1529779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnukV-0001W2-8D; Thu, 05 Feb 2026 08:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221597.1529779; Thu, 05 Feb 2026 08:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnukV-0001SF-4h; Thu, 05 Feb 2026 08:30:03 +0000
Received: by outflank-mailman (input) for mailman id 1221597;
 Thu, 05 Feb 2026 08:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnukU-0001DR-5t
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:30:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da4f611d-026c-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:29:56 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so6749715e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:29:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d3eee4sm40937725e9.8.2026.02.05.00.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:29:55 -0800 (PST)
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
X-Inumbo-ID: da4f611d-026c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770280196; x=1770884996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3VQEk6lFXF1gghrs7fL7UQiboQuDLN4HxDlL1UWK25Y=;
        b=JFugXloMxR4UW8P7LX9b65dVXw0sn/4mt7RkwDNmAh9J/gmJFNM3etD58GRa9DvnbY
         jZZl49NdUsSfyE4MEbNUpMe+JvZHTCaLhIeCtJVJANSaxKXnw32nutCk/8ybM2fKRYQA
         KSQMjYsSMmNA1HRq5zRkLQsU5c3i9F3Ey6capqLaMEtk0oTeS7n68oERS5l258J3w7YI
         64Y6aX/ZRaShLcrE2ne5WnFdWaWQxiN+GF8Z3ki1eUrbansSqWmKcMmbAOaZBtNjX/MZ
         Eo1iUn2SQFRUI+zwsZ8CJKC8iWkKKwFC0H4DZ1ODlCjVTCdM75v4e4HImbaACu77FvD3
         vGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770280196; x=1770884996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VQEk6lFXF1gghrs7fL7UQiboQuDLN4HxDlL1UWK25Y=;
        b=q3mIzpJj78N45LxWDjyLaH8Dv2stpEkmHDJPoEiorcQm+n7BA79PQYfmoKHgFI3nEB
         u8zb0gcA5pbqt8B0OQW392GceRlgQtLal6bDnZ7cJVgm5pMk5uXhVyvO4GI1IgZ1PX+h
         CYE/GtYA/3F6GCvH3akm/ibxqlW4v/CalYwB04FZnbdTpuBPnuEd4Dc9iRXaAeeRHCm5
         7524YmpSQHhSkhBIWcBgVRObOYnjpbEag76mMlySJ1FopYmJoqIx5aY+slEtQujkzbni
         ZLnjhpUGl4i1poQkEuo1z7tqrdSNRNuevtC37FRFKrReBm9BkoftV+l+wkZSXgiJwsYF
         Lc0A==
X-Forwarded-Encrypted: i=1; AJvYcCW9T93NGrtUzwMMfBrs5b6J5eMkQutKkYz/UzQBuP0mZU4CBw6h4/+7XZxNsJ0M6sq5VEIw4cyrZj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzdb0P/u8snUm0VkNQHtvOBY2xbzkTzU0xRyljfHOl9wPycde1o
	kpRH4BJLb13CGHMo7aF7q/rnDfWFCUf2PyTzSvpPevYhfzv+5WhawLCVHbbRKrxqCg==
X-Gm-Gg: AZuq6aJdQ9bvrKqJ1UGTenDBWv4YeS4ZfJ9n9loU7gPCqMW5rDYUbIJLYySfxZkc8Lx
	x9wLFaOyKqQjRiBiTYkepfMdoh/9wrQ5zKUdPT4aK4Ub2vYEhxRUiTuupFzFdPWI5dF/CMdi/Ll
	SZgcrMSxSqAIev4Wjgp0KUYfTEcP5kawJh/iF4KZGgb+dB6C7xC/bgJQA76cfEvibwgcsohCzL0
	qPdgnc5YU5TTIlm7NSqQ+yxCZsJjtlTqvWgKC7vsGtPaxG6hFSACITGB6TmQFjqeyVkXnIFkap+
	qRSfsOEAglzlsRgnku+7rxMpKzcZtfYQ80PPxe3fb8sUmDbDzE8DFL1H9LGkAADIEmFF0uoDmR0
	jkVMsqLrKtpQyu2fHixPc600Jx6klMXfd3cr4gEd6SNmoEtTKh7R/Ju/kUA8D34LG36pZNBu8Lb
	mGcjbymi4u2MxEs8MdFMa9AvB9JWBGvLqYjsHMKHiJrJLO2W1JPSebGuBVZX6K9FzHXjocMpXmH
	KY=
X-Received: by 2002:a05:600c:800f:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-4830e9713d6mr73445615e9.30.1770280196251;
        Thu, 05 Feb 2026 00:29:56 -0800 (PST)
Message-ID: <5bd55bef-f30c-475d-9831-382406f699fb@suse.com>
Date: Thu, 5 Feb 2026 09:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com> <aYNdJ6sb4GPaSEyY@Mac.lan>
 <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com> <aYN30KD0jsJ2_H_z@Mac.lan>
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
In-Reply-To: <aYN30KD0jsJ2_H_z@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1E56DEFE54
X-Rspamd-Action: no action

On 04.02.2026 17:46, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 04:08:21PM +0100, Jan Beulich wrote:
>> On 04.02.2026 15:52, Roger Pau Monné wrote:
>>> On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
>>>> On 04.02.2026 13:25, Roger Pau Monne wrote:
>>>>> The limitation of shared_info being allocated below 4G to fit in the
>>>>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
>>>>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
>>>>>
>>>>> Drop the restriction in arch_domain_create() and instead free and
>>>>> re-allocate the page from memory below 4G if needed in switch_compat(),
>>>>> when the guest is set to run in 32bit PV mode.
>>>>>
>>>>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
>>>>
>>>> The tag is here because there is the (largely theoretical?) possibility for
>>>> a system to have no memory at all left below 4Gb, in which case creation of
>>>> a PV64 or non-shadow HVM guest would needlessly fail?
>>>
>>> It's kid of an issue we discovered when using strict domain NUMA node
>>> placement.  At that point the toolstack would exhaust all memory on
>>> node 0 and by doing that inadvertently consume all memory below 4G.
>>
>> Right, and hence also my "memory: arrange to conserve on DMA reservation",
>> where I'm still fighting with myself as to what to do with the comments you
>> gave there.
> 
> Better fighting with yourself rather than fighting with me I guess ;).
> 
> That change would be controversial with what we currently do on
> XenServer, because we don't (yet) special case the memory below 4G to
> not account for it in the per node free amount of memory.
> 
> What would happen when you append the MEMF_no_dma flag as proposed in
> your commit, but the caller is also passing MEMF_exact_node with
> target node 0?  AFAICT the allocation would still refuse to use the
> low 4G pool.

Yes, DMA-ability is intended to take higher priority than exact-node
requests. Another node would then need choosing by the toolstack.

> Also, your commit should also be expanded to avoid staking claims that
> would drain the DMA pool, as then populate_physmap() won't be able to
> allocate from there?

Except that upstream claims aren't node-specific, yet, so could be
fulfilled my taking memory from other nodes? Aiui the problem would
only occur if that DAM-able memory was the only memory left in the
system.

Jan

>  It would be weird for the toolstack to have
> successfully made a claim, and then populate_physmap() returning
> -ENOMEM because (part of) the claim has been made against the DMA
> pool, which populate_physmap() would explicitly forbidden to allocate
> from.
> 
> Thanks, Roger.


