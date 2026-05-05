Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMOOCZXF+Wn2DgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:25:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4D4CB27D
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300489.1575020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCxJ-0008LQ-Rr; Tue, 05 May 2026 10:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300489.1575020; Tue, 05 May 2026 10:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCxJ-0008Ix-P1; Tue, 05 May 2026 10:24:45 +0000
Received: by outflank-mailman (input) for mailman id 1300489;
 Tue, 05 May 2026 10:24:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKCxI-0008Ir-Eq
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCxH-005YTf-E6
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:24:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c557-2eae-0a2a0a5409dd-0a2a450cc57e-28
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:24:43 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c56b-62f1-0a2a450c0019-d1558031c951-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:24:43 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so31882635e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:24:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a824f9f0dsm373141955e9.15.2026.05.05.03.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:24:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777976683; x=1778581483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=559/gDL5cAkgHSxRcisKiAuG+SV9lJdifh/D33J/iJ4=;
        b=V3E9wIU4ymQBn/TbADwA7QaJGQjUdyo4cAL5fAeU0qsQLItlppn2YT+bRbaKo/QP1U
         yPBKKHq2PN9kumo6G63y+b0FtnITgJhSU6jOn/BJeDOPVv9YzxD8oErQIssJuYYJrqJL
         QBcgGJrBV6IQKc6uMGc3g1VE4w8+L9SRHmJKrX+ofVexNaLPQUWvbAXXYXHIV7Vb8/6v
         8tW/NdkPoX3hawekykBifoRgHiVlPoY7GZwZ8c6aERC7gEQcs9y7VxmuNYBsjZKZaXd5
         xll//MGp2pBNNAxdkWly4lxso89uSwwsnkiHW/NOFNHNRrKxnIj9tRiUE2BQIoF8zhz7
         Wq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976683; x=1778581483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=559/gDL5cAkgHSxRcisKiAuG+SV9lJdifh/D33J/iJ4=;
        b=ioTg/2rQPcr+2TkH1FESyR0a1twz5zi9Dwk1j8d7Fp3p6VVpf0BH1NCzZDmPsKRf9j
         e3ikisNB6mFzhbgsboYj1SM30bbO3goHd3TI4KUAmAmXW1rz5qfLOF8vlDrwhqRZ3vpY
         CNTzgmkzOpNVUfUPoNLfihI5sR1/6I7alSbcAG+bGGSCCHxfqMFe0QLDRf1RME6OOrhR
         7h/5vW9l98jnkMi6SRu81ylAq/R3CMpuVCFWa8oXyVjrIra8aD3GBmLJOmj5je17bzRE
         NBfCne230s/s4phVJems2QeoypqGMWjqu64x7if0SmO/wXig7QWWMEqJazjb0trPP3hm
         Fsdg==
X-Forwarded-Encrypted: i=1; AFNElJ9iwERY817A5jqKMoftDjsbuvsfDrMxEh1DeJpM2+63QJkck8QrmbmSQDXj8jmmqYWo08utY8h4YIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOY9yA0XLlqPqYXljgXAYlfhm5URtxzEyQKXVagrTBmz1jUHe+
	0YIwmHhS7n+sSOZ/4ywmHTecdANfJaRMB+nPfkQwcdeXocIByEy35MsI/FUYWupGow==
X-Gm-Gg: AeBDiesDSV8OJ/2f3gSdxxNf/E3NLa/+gqLRHU5m0VavIr+bNsOrmvk7L6w48PS21mD
	QL1zaa/emmHMBehVZj0Eg7z0MSJElHXeG8ug63sBHn0kb7m6RLZqhpBLH6jF1h4gIPBIFsvwipC
	spKJ9aNmM5RuFE8EA7DwEwSESftY681vOB4g5+wUCELYrl5s3HIUghR5tUvOnC1tGhPedjYsnIn
	Mulcjeo48YowBR7CIP6yjlzXeACqiJguQ3gZVnYPEzz/OL3u4KdHw5Eb7bbnTeldQ9YstMOJp8Z
	cueTBFkaS/QhR1XxeFZZjY8gvH+ucBL2XjR2bhXUH5DCy0+WYN/sUeD16D1D+p1blNTJUoSO3C/
	HcrSk4j+jgNnarjo8Wg1g19JbY6H/9YvPJ0mkm3Cyw7t40DV1uutL61zy81Xs393EmNR/ZEfNpP
	jdxPKMPrKrNsF5/Qvg7EIYbzzYcVW/qVP/qgdgitP6NmRwcybcAsQkBJO71gJzzbeeIZgUb05Nd
	sMwQgrFoFHpZf2jyds9ZgXmzw==
X-Received: by 2002:a05:600c:3b2a:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48d18cf637amr40888785e9.28.1777976682686;
        Tue, 05 May 2026 03:24:42 -0700 (PDT)
Message-ID: <29422b34-b33f-4a25-838f-de6078151e46@suse.com>
Date: Tue, 5 May 2026 12:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260505080653.197775-1-jgross@suse.com>
 <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
 <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
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
In-Reply-To: <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777976683-6E169CF5-DEEE9B63/0/0
X-purgate-type: clean
X-purgate-size: 2990
X-Rspamd-Queue-Id: 8ED4D4CB27D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 11:13, Jürgen Groß wrote:
> On 05.05.26 10:43, Jan Beulich wrote:
>> On 05.05.2026 10:06, Juergen Gross wrote:
>>> When fixing a conflict in xen_e820_resolve_conflicts(), the loop over
>>> the E820 map entries needs to be restarted, as the E820 map will have
>>> been modified by the fix. Otherwise entries might be skipped by
>>> accident.
>>>
>>> Fixes: be35d91c8880 ("xen: tolerate ACPI NVS memory overlapping with Xen allocated memory")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> First, while trying to review this, isn't there another issue in
>> xen_e820_swap_entry_with_ram(), in that
>>
>> 			entry->addr = entry_end - swap_size +
>> 				      swap_addr - swap_entry->addr;
>>
>>
>> really means to be
>>
>> 			entry->addr = entry_end - swap_size +
>> 				      swap_entry->addr - swap_addr;
>>
>> (affecting non-page-aligned E820 entries)?
> 
> Yes, you are right.
> 
>>
>> Further, that function converts swap_entry to the page-aligned superset
>> of the passed in range. How is it guaranteed that this new range won't
>> overlap with the predecessor and/or successor one? Wouldn't that need
>> to be conversion to the page-aligned subset instead?
> 
> This is subtle. :-)
> 
> We are converting to RAM (usable), so the type value is 1. e820__update_table()
> will handle overlaps just fine, with higher type values "winning" against lower
> ones. So any other region overlapping with the new RAM region will result in
> another conflict in the next loop iteration.

Oh, wow, and this is a property of the function that one can rely upon?

> Using the page-aligned subset would result in possible memory holes, which would
> be problematic (the kernel or page tables shouldn't have holes, after all).

Aren't such holes normal to occur, e.g. on misaligned RAM/UNUSABLE
boundaries?

>> And then, is passing the page-aligned superset to xen_add_remap_nonram()
>> really appropriate? Why would any leading or trailing space there be
>> subject to remapping?
> 
> How would you want to remap a sub-page physical memory area to another location
> without affecting the rest of the page? We are reworking the final p2m map here.

Well, first and foremost: xen_add_remap_nonram() takes and stores byte-
granular addresses / sizes, with the sole requirement being that the
offset-into-page be identical between both addresses. That check alone
already indicates that non-page-aligned addresses are expected to be
passed into here.

Further, xen_acpi_os_ioremap() uses the resulting remap table, and is
byte granular. With the physical address adjustment there, both mappings
could (theoretically) coexist. But the problem I'm trying to point out
is that by passing the page-aligned superset into xen_add_remap_nonram()
you misguide xen_acpi_os_ioremap() (while at the same time
xen_do_remap_nonram() will do suitable rounding to page boundaries even
if exact addresses were passed).

Jan

