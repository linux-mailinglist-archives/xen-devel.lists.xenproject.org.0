Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nU/HN2uyRGqIzAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 08:23:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F306EA2DD
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 08:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CGAcoxa2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349515.1607250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weoLA-0003jF-Fu; Wed, 01 Jul 2026 06:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349515.1607250; Wed, 01 Jul 2026 06:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weoLA-0003gX-9W; Wed, 01 Jul 2026 06:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1349515;
 Wed, 01 Jul 2026 06:22:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weoL9-0003gN-CO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 06:22:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weoL8-0078bg-0t
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 08:22:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44b219-bab6-0a2a0a5309dd-0a2a450899fc-42
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:22:29 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44b220-edec-0a2a45080019-d155dd2cbdea-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:22:24 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-472a14c9965so163164f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 23:22:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475643cd85dsm13504749f8f.15.2026.06.30.23.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:22:23 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782886944; x=1783491744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VERsjxAe7q+yFAlos0PXWjPHKVOpuLdwRRRHZYD0o0M=;
        b=CGAcoxa2uaVv3b+9gpK6HqIzr+BXbMmD6Bz8crt+kYsdIaXepk1cq7cD8AHs4vSzIG
         +gC8qwiv5Ppec5VNNTR4tDvSeVXJmoMX0phobIBxW7UHK4a+i669kNmhjteuRf60Cnak
         YGIv5WwNwpAsw6j2tZX5UTzG7ScLMFMBYkm6ckAV2ZfHM8/mxKOKlE3EI5OXaPorciTu
         1aApVBDuFYGdRXcNuDLuOMiMCE6suGUJVNJYygFu3gdu1zTsFOqX7GUas4fFRh1a4J4N
         WapT7CGiR8E220TdiJpCpUvHa01NU8hmQLikRYfSldBGLQjYhQL22XdtTUriBMKmKqIa
         hORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886944; x=1783491744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VERsjxAe7q+yFAlos0PXWjPHKVOpuLdwRRRHZYD0o0M=;
        b=Rcf6N39F+Bn8upRLR1w3Mn6w1c/DSwwTy3tx3miAEbFxqYn7Lr6RS9UIBWR+0wZWYo
         Jojw/41ipWgT/Xx5Wyh4SKJV5ogjPCqMsG7SMM921LbTNBgDA5skKULZ5MFS3MYZf8iL
         kt4b3Dixvz2+rMc0xEwy8yOlVLevgALrxW9ZAjhmXkrjMB8cxww8ma8SGfAcN9bUuGlP
         O3q41tLB7K6Va8sHbnlLQZyA+GzTo+jlvsFMGUC9I7hd8Qn7PlFK9eKi9ZRnVRByRxhT
         lTMUudnmVugG4Vr95k61f9vapghuWdHb+z4lu8qosNNRE3XZBkO1D0LMlXV6hocMYc74
         uI4g==
X-Forwarded-Encrypted: i=1; AFNElJ/KwPgxa/Uq4fhFruCL7fR24kctmRfwOMweiqE8fUtfM1vtDmxIn9tDlO4QY4YlcH/8P2SIBG3dms0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm3NwuS7hvWESQyRAPhvKixexo5g2ZUgj1Mp7ZrjMV663aDTmG
	lDp0msnDGWT4TvngFpFphkmUzI0IwlluLZrfQZt2XoCbvIdJtTWxCUcaCoLej0DTeQ==
X-Gm-Gg: AfdE7clSYgvgCxsasxB3DhZUJAubc4V/SLQYrFCibGYNcPyO4mjvOZgygZns2xQUwse
	iGJODwiq9wLZMIaIkbBUXB+6zoFaaIojaPfU1rBlmLA0TC2bRny67/HcDwM+ZnUvuVfush8rNKA
	m+SjgaIKrEdP+KbKDTZeB0Bz10jVfD6QoKIwiUEoI73eXHs+cTLdqJqm3rJyJewCeFIjBoD0v6v
	ndoe41u82lGbZEH4Jc6cp2J5DpsPyDUyrjokoBamZFgncQHhLkpkJXCfylbaqdKpI/e5LazloZg
	imC/PmvYqtMMeRtNUknCLkokYu4SuGLt3jHqObMV67Hxom5QJjlpudqb2EBQWRlLXWRwNVdELbg
	DubWmmtnBm4T20cQSHHd1ig+sN+CzEuuLeXm52QSjGAFFQIBxrV1Ejtj//BmtsLAcS1qgQsMcA7
	5XA04aK02bEDOljtg4EvaAgt0jEMACcWa/PSu9oEjQbt9Alvv2UF+bNGlJ5wUonMhJxdd0KHOf5
	Pb2
X-Received: by 2002:a05:600c:6a96:b0:493:b750:b565 with SMTP id 5b1f17b1804b1-493c2ba9d58mr2175655e9.35.1782886944372;
        Tue, 30 Jun 2026 23:22:24 -0700 (PDT)
Message-ID: <bef567d3-974b-4654-8cf3-d5a97d9dba10@suse.com>
Date: Wed, 1 Jul 2026 08:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/25] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
 <9d082182-394d-40cd-9afe-35369d7bc4bc@suse.com>
 <20740b98-bdc0-4098-afda-45b09dc07ca3@gmail.com>
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
In-Reply-To: <20740b98-bdc0-4098-afda-45b09dc07ca3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782886949-48C6F3FC-E1378722/0/0
X-purgate-type: clean
X-purgate-size: 2694
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F306EA2DD

On 30.06.2026 18:06, Oleksii Kurochko wrote:
> On 6/29/26 4:46 PM, Jan Beulich wrote:
>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>> +static void __init init_guest_unsupp(void)
>>> +{
>>> +    __set_bit(RISCV_ISA_EXT_f, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_d, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_q, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_v, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_h, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
>>> +    __set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
>>> +}
>>
>> Wouldn't riscv_isa_ext[] better get a prominent reminder that additions there
>> may need mirroring here (unless guest support is implemented at the same time)?
>> (As before, yet better would of course be to make sure this is consistent
>> right from build time, i.e. without the need to have this separate function.
>> Or minimally have the info right in that array, so that while adding one needs
>> to think how to set that separate field.)
> 
> How about making the field mandatory at the call site instead, so it 
> can't be silently forgotten:
> 
> #define RISCV_ISA_EXT_DATA(ext_name, guest_supp)    \
> {                                                    \
>      .id = RISCV_ISA_EXT_ ## ext_name,                \
>      .name = #ext_name,                               \
>      .guest_supported = guest_supp,                   \
> }
> 
> Every entry in riscv_isa_ext[] would then need an explicit true/false 
> argument, e.g. RISCV_ISA_EXT_DATA(f, false). That forces whoever adds a 
> new extension to make the decision right there, rather than relying on a 
> separate init_guest_unsupp() to be remembered. We'd drop guest_unsupp 
> and init_guest_unsupp(), and build d->arch.isa directly from the array 
> in init_guest_isa().

This is what I meant with "Or minimally ...".

>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>       struct p2m_domain p2m;
>>>   
>>>       struct paging_domain paging;
>>> +
>>> +    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
>>> +    char *isa_str;
>>>   };
>>
>> Why is it again that both the bitmap and its string representation need
>> storing? In the end they provide two different sources of truth, as there's
>> no guarantee that they'll remain in sync.
> 
> isa_str is needed to guest device tree to tell which extensions are 
> supported.

Sure, but does that need storing over the lifetime of the domain? Can't
that string be allocated, built, used, and then freed while DT is being
built? Would that string be used at all for toolstack-created domains?

Jan

