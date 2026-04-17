Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPBwJ3074mnm3gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:54:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FFD41BD15
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284395.1566197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjdl-0002oN-OP; Fri, 17 Apr 2026 13:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284395.1566197; Fri, 17 Apr 2026 13:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjdl-0002mD-Kv; Fri, 17 Apr 2026 13:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1284395;
 Fri, 17 Apr 2026 13:53:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDjdk-0002m7-Nr
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:53:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjdk-002jIQ-4l
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:53:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23b54-5cb7-0a2a0a5109dd-0a2a450ac424-20
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:53:48 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e23b6b-56b3-0a2a450a0019-d155802daca6-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:53:48 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso5296605e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 06:53:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393f5sm43910975e9.9.2026.04.17.06.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 06:53:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1776434027; x=1777038827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ayn6K7XeJTYv393CVAVoJQuCEE6s0mu1/Q+1Y2TyLQY=;
        b=ayOd1KWjB6C+L3I+5SiqegrvVwE0M+2XpXX7XYcKTbu4WiOZgK8RUtX7RFT1JKjU5T
         mcEc8jiqNAg7LXgb7r6oPzw8jG0oFPlOETPtCIMzBtmcIeXEQBw6JCuoGAE2pVWYWiDs
         Lg4pXFHiNBbroov30FlEgFt1acmJaxEeS7g4I42gdY0Dz+TIHaOUWVoIdR2mdzSop3sj
         a6WyQXhQWjtO9eCnVotqjnxvzg+CbcMRhD7vG+aQOFP4js5vCU8HfnzXCHM1kn6cAOPY
         R0T7EKeXxSE59Vq/CcHtRfzr0/3rMIqMeDBdfvOhhnyAE3N3254/AYensI12QCV0ZdO5
         Vp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434027; x=1777038827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayn6K7XeJTYv393CVAVoJQuCEE6s0mu1/Q+1Y2TyLQY=;
        b=Sa3X+KCw3EnbafLlCHQlUqQcS7xZteEIj9NUv1UfeEPwOeoMTlXx5Ps++aJOvPYhtF
         +IiIsYsz+k3/G5MEW/jpJCq4K0kHrN80t8Jw4E1Kas2b2V1jT4gv6/HctPux868A8TSb
         0ne0cHKZu68oHFV7ieOukfYymlaCrhmV1ogjBkqNdtGyN8VOLL0JvQOIeSMGqYHDXN+Q
         6T+h1gws/ayEO76Vxjr4XB9XINV31kmhixTnbM6zyMmd58FFfxdOJhuPPqmid95X7apI
         AP+6DBCa/5sqhjQ6he8KEsWhK8IDQ4RyY6gR1mos5HGc5uwdmPx+NLYLI1B99RaS9rnC
         VBDg==
X-Forwarded-Encrypted: i=1; AFNElJ+cMSbx4PmCNWfimnDkHb2K4nRwTiJpv9JE2K6GLKQqvPQXs7rKBgvVLOJgzgaHMnH4ZKLR7sasCP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygeL419dT6abIT06DbAwOL1dPMkN3abLMfnLaRBvH/fnHAK9ww
	FtjQjvRdJt32+v89IhwEGlIP1YweBUJYCIQHLFj760+EYZsLTUVL3ZRf4MMaSAYG1w==
X-Gm-Gg: AeBDiettSWvYJ/ndKnCu2Q1TF4iYLsjsIWPki8DTZCb82AmzGqqhGRDJtKT2ED/rOde
	/MCt2OywXpYn33RWgCnuTGs/psIM0XSp0Eqobs+1ynuGitjv7pszdOfe4OW1/14gaMIzyDQyPXj
	J4w9QldzYUvRQi2vzHlZLAvy0saQlPQztdlMHDr/GKPU6V83bd8GsN85nEgkaXF4FHNXY6EJ2x/
	V7441chkX9k64BpGs4AWMvdqfqkJVdqWIA8rzajN94UvAylniSYR7eX6TV18rX6k3tQFBPbEmfJ
	+5CxvIVMuyYm1z1Ot2gu8vkYxLCQkwZ36oYZXHoizTmvTcz2u1u5t9nw0KO6/6MC3XYw7HUR0r/
	XPwcJe101PVl+/Gie6VsTjppHAvWApBn+4UEWBQwdwVYg6dNlO75N0eHq/5/Qb4rCjNNGO0bHoe
	8Y5lCsYhvZzvDvniASoQ0x4tfJd+t7NzdTa/BRR43w+ugo7VXwZYsBibRh16pXem3HcYGePNMcn
	DWRM9LQnQnlG8yKU3fcnhRNFQ==
X-Received: by 2002:a05:600d:b:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-488fb73b424mr36706855e9.2.1776434027535;
        Fri, 17 Apr 2026 06:53:47 -0700 (PDT)
Message-ID: <a578a32e-4cf3-4c61-b834-da2831c9a9bd@suse.com>
Date: Fri, 17 Apr 2026 15:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
 <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
 <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
 <7d022fea-0836-43b0-983d-5f7cb26a2e62@suse.com>
 <ac19fdeb-90fa-42bd-9041-7c2aaa5346d4@gmail.com>
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
In-Reply-To: <ac19fdeb-90fa-42bd-9041-7c2aaa5346d4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1776434028-815848B7-CE70404B/0/0
X-purgate-type: clean
X-purgate-size: 3812
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03FFD41BD15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 11:01, Oleksii Kurochko wrote:
> 
> 
> On 4/16/26 1:49 PM, Jan Beulich wrote:
>> On 13.04.2026 10:43, Oleksii Kurochko wrote:
>>> On 4/1/26 5:16 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
>>>>> +    if ( res )
>>>>> +        return res;
>>>>
>>>> So host properties are again directly handed through to the guest?
>>>
>>> I am not sure that it can be different from what host has.
>>>
>>>> Shouldn't the number of interrupts (aiui that's the "number of cells"
>>>> here) a guest gets be independent from the host it runs one?
>>>
>>> The #interrupt-cells property specifies how many 32-bit values (cells)
>>> are used to encode a single interrupt specifier when referencing this
>>> interrupt controller from another device node.
>>> In this APLIC schema, it's fixed at const: 2, meaning every interrupt
>>> reference requires exactly two cells — typically:
>>>
>>> Cell 1 — the interrupt source number (which of the riscv,num-sources
>>> wired inputs)
>>> Cell 2 — the interrupt type/trigger flags (e.g. edge vs. level, active
>>> high/low)
>>
>> So what if #interrupt-cells is 3 in the DT Xen is handed? If Xen can
>> cope, should that value really also be handed through to guests?
> 
> I would say that it depends on what cell 3 will represent. But likely it 
> will be needed to hand it to the guest.
> 
>>
>>>>> +    regs = dt_get_property(aplic_node, "reg", &len);
>>>>> +    if ( !regs )
>>>>> +    {
>>>>> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
>>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>>> +    }
>>>>> +
>>>>> +    res = fdt_property(fdt, "reg", regs, len);
>>>>> +    if ( res )
>>>>> +        return res;
>>>>> +
>>>>> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
>>>>> +    if ( !data )
>>>>> +    {
>>>>> +        printk("%s: Can't find 'riscv,num-sources' property\n",
>>>>> +                aplic_node->full_name);
>>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>>> +    }
>>>>> +
>>>>> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
>>>>> +    if ( res )
>>>>> +        return res;
>>>>
>>>> Or maybe this is the number of interrupts?
>>>
>>> This is the total count of hardware interrupt lines wired into this
>>> APLIC domain.
>>>
>>> It could be independent from the host it runs one but looking at the
>>> possible range [1,1023] for this property if we will put for a guest
>>> lets say 22 but new host support only 20 when we will be in a trouble
>>> anyway.
>>
>> Correct. But if you had some hosts with 1024 and some with 256, how
>> would you bring up a guest on the former to later be able to migrate
>> it to one of the latter when guests inherit the count from the host?
> 
> It will be impossible to do that without emulation,

It's not quite clear to me why this would be.

> so I expect it will 
> be easier to simply forbid migration to such a host.
> 
> Basically, it is just a game of numbers. We could try to estimate how 
> many interrupts are needed for the guest, or for simplicity use some 
> hard-coded number (say 128 or 256, something “pretty small”). Will it 
> resolve the migration issue? Partially yes, but not fully, as there 
> could always be cases where the new host’s number of sources is lower 
> than our hard-coded “small guest value.” So having a smaller value will 
> likely help on average and will allow to support more h/w migration to 
> which could happen, but the migration issue will still be present.

An admin, knowing the capabilities of all hosts in a pool, can suitably
limit guests intended to move among hosts. No migration issue at all.

Jan

