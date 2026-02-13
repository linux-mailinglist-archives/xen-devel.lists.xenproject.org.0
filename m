Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KCbLTkjj2mJJwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:12:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACD136374
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230886.1536275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsxn-0005bA-TC; Fri, 13 Feb 2026 13:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230886.1536275; Fri, 13 Feb 2026 13:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsxn-0005Zj-P8; Fri, 13 Feb 2026 13:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1230886;
 Fri, 13 Feb 2026 13:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqsxm-0005ZY-5g
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:12:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 954eed43-08dd-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 14:12:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837584120eso3456985e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 05:12:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm368439055e9.1.2026.02.13.05.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 05:12:00 -0800 (PST)
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
X-Inumbo-ID: 954eed43-08dd-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770988321; x=1771593121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7c6I6VSwTra0rjCakmyj6CRewOV//uSGA5KovOLUpIw=;
        b=Jn/eTIVnz69N3EnaFnTEFg/7az4cUPlng1MxVuC3F+bsAdS4DWUrFdAKQoW77AdTCx
         sVE17nSMfKay3WlOZMVt1vfHlDExePoQ9/eGWrx3ejS+5ZovgAwObrdfPIypRrIZKfmt
         WFu3v3qJTShYD4OrQsLAO1qPYYxUY6FYyAolZ524vgw/25DTIU30oqTlShVzd5wc05so
         3P30l3op0XeUcztUCDZa8PXELxHn+DYS+SN9YOZMR7dQN9NxWtL8GxMP61kLQRwKlmtq
         0iXPxZg1sUOYDoSoVYxG3BRZ3tN08OK+Y6s4qrSZq9SEMyZ8u+HO6MFSORdTlO8QoNv2
         4BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988321; x=1771593121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c6I6VSwTra0rjCakmyj6CRewOV//uSGA5KovOLUpIw=;
        b=TfvR6DH75aKCkcM10mo8qgEcNM8GqHqKd0R17hFbX5kiuksDyi+vyTAzK8xuFr8ME4
         hSQRNLt0AajVzTJMt3oeXoNwImb/vYjGn2o2HsjN6lvWEeHgLL+ay084qDLxYO0u0SEz
         8iSp9Pz9uTzKBpviJ2ZqbAdJ/v+chRQjIRHqCXmasqLAqG79oXZDe4Lo6fsUxoUw93hf
         4D63CcJw0FIww3GVWhJl48zycj7+xVbDTXCCTLHvWpxjHGheiU7CE5qgvB0sfWu4hYDO
         jbfUQNPoRPYnfQvedaK6g/S+ThR7vbTtCd5XKEfYEiSv0/lT0HjNPpXD8+c6UMNOAaOU
         O4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXPe09zQIujbBPaqZ8GAtc4DoxKeBonjNR3s0Rco5ODB1WkgHpMK/X5vEprsF+dBl+Qybo4PQasAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM5E5k++UEz489NXPXIHHTNxhhMwsURrSsT31sT0eUg/rrnNnJ
	5EQDTxvS+u1FPZgjtrLYCOrZoJiJZgmNFrrl+ZGSsCj3ERQ92VvySnx85utUXHc5Ng==
X-Gm-Gg: AZuq6aKLo0c1savG26l1h6GNu5PHQiL+n42c2yR9g89+OrsEq7BRKed+6Q31pibFGCh
	9tsPEk5NkA2dHWrxr3pFjrWc9UKWgHmICA/PoRaz0jfy1phMgKJ4LvI18a1LenwKCXJnIdrILee
	U/1nItmgkIQ7MGn009xjQLxjDKrXV0VzzO/qvzYBgSiShwML+ENL0tTLjRD9GFbZR48Xr0Vvzcb
	0LU6n8dg+VbzN61Pex2erGcecJRVBDF376XDa0boU1o0CUZ3PPXcLeYLMabImNPN945u2967T2w
	LZ66DVhxL6v1yMgRLOap2d/w9v7CrWrTUtHUK7/EvanEJwFBEeH/W9A0vO2x/sDsA9PjnXzeGtl
	FQHeHNn4F/yIS7xjUraaMsHHzUxSdJ19Mi+ToLDZD6B8wCjLaz1Wz61DUx8nk43SXo0MkNheNPt
	slsLx3Dwwou0ouv1bAj606LxBuVg6eh/fuIzRrx0uK771mDwrn8sMwtE2GTG3go4QhV7eJl8z9p
	CskW4zaBdvOvltqBgOizhcK+Q==
X-Received: by 2002:a05:600c:8706:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-48373a0b010mr28748065e9.10.1770988320533;
        Fri, 13 Feb 2026 05:12:00 -0800 (PST)
Message-ID: <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
Date: Fri, 13 Feb 2026 14:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
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
In-Reply-To: <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 25ACD136374
X-Rspamd-Action: no action

On 13.02.2026 13:54, Oleksii Kurochko wrote:
> On 2/12/26 5:39 PM, Jan Beulich wrote:
>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -44,6 +44,9 @@
>>>   #define P2M_LEVEL_MASK(p2m, lvl) \
>>>       (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
>>>   
>>> +/* Holds the bit size of IPAs in p2m tables */
>>> +extern unsigned int p2m_ipa_bits;
>> Hmm, I can spot a declaration and ...
>>
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -51,6 +51,12 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>>>       .name = "Bare",
>>>   };
>>>   
>>> +/*
>>> + * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
>>> + * restricted by external entity (e.g. IOMMU).
>>> + */
>>> +unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
>> ... a definition, but neither a use nor a place where the variable would
>> be set. Hmm, yes, I see common/device-tree/domain-build.c uses it. Then
>> the following questions arise:
>> - What does "ipa" stand for? Is this a term sensible in RISC-V context at
>>    all?
> 
> IPA stands for GPA. (maybe it would better to rename the in common code to gpa too).
> It was used as common code uses p2m_ipa_bits.
> 
> Yes, I miss to set p2m_ipa_bits properly in p2m_init() where G-stage MMU mode is set.
> 
>> Judging from the comment at the decl, isn't it PPN width (plus
>>    PAGE_SHIFT) that it describes?
> 
> It is PPN width + PAGE_SHIFT what is equal to PADDR_BITS (44bit PPN + 12 bit PAGE_SHIFT).
> 
>> - With there not being anyone writing to the variable, why is it not
>>    const (or even a #define), or at the very least __ro_after_init?
>> And no, "Arm has it like this" doesn't count as an answer. Considering
>> all the review comments you've got so far you should know by now that you
>> shouldn't copy things blindly.
> 
> It was added because of the usage in common/device-tree/domain-build.c.

Well, I understand that, but this isn't the way to do. And you've been through
such before. Anything you want to share between arch-es that isn't shared yet,
will want some suitable abstraction done. Like giving variables names which
are appropriate independent of the arch.

>>> --- a/xen/include/public/arch-riscv.h
>>> +++ b/xen/include/public/arch-riscv.h
>>> @@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
>>>   
>>>   #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>   
>>> +#define GUEST_RAM_BANKS   1
>>> +
>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>> +
>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>> Hmm, does RISC-V really want to go with compile-time constants here?
> 
> It is needed for allocate_memory() for guest domains, so it is expected
> to be compile-time constant with the current code of common dom0less
> approach.
> 
> It represents the start of RAM address for DomU and the maximum RAM size
> (the actual size will be calculated based on what is mentioned in DomU node
> in dts) and then will be used to generate memory node for DomU (GUEST_RAM0_BASE
> as RAM start address and min(GUEST_RAM0_SIZE, dts->domU->memory->size) as a
> RAM size).
> 
>>   And
>> if so, why would guests be limited to just 2 Gb?
> 
> It is enough for guest domain I am using in dom0less mode.

And what others may want to use RISC-V for once it actually becomes usable
isn't relevant? As you start adding things to the public headers, you will
need to understand that you can't change easily what once was put there.
Everything there is part of the ABI, and the ABI needs to remain stable
(within certain limits).

>> That may more efficiently
>> be RV32 guests then, with perhaps just an RV32 hypervisor.
> 
> I  didn't get this point. Could you please explain differently what do you
> mean?

If all you want are 2Gb guests, why would such guests be 64-bit? And with
(iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
even a 32-bit hypervisor would suffice?

Jan

