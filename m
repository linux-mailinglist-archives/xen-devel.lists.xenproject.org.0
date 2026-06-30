Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kWuzBiS7Q2oHgAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 14:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677F6E4680
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 14:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PaQzXAGs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348812.1606504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weXsF-0000lL-6B; Tue, 30 Jun 2026 12:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348812.1606504; Tue, 30 Jun 2026 12:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weXsF-0000ia-34; Tue, 30 Jun 2026 12:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1348812;
 Tue, 30 Jun 2026 12:47:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weXsD-0000iT-St
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:47:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weXsD-000wfn-6I
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:47:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43bada-e002-0a2a0a5209dd-0a2a4508b99c-40
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 14:47:32 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43bae4-edec-0a2a45080019-d155802dccf4-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 14:47:32 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49395888c7bso39704955e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 05:47:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bc7aca88sm74367685e9.0.2026.06.30.05.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 05:47:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1782823652; x=1783428452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMAKdVcVpUPq5Ans2CUfYgI8lqegiCRthTeFu2d7bCU=;
        b=PaQzXAGsTTspLi53WJMeWllKQqncXueU9aED1mizXl41TlsPInmmoHpWwoSPDvzHJA
         rOkT00U9HF7bGyuB+rYx6Rsy8KxUo7oGc2EvKc6L2wvTnPgH5NzTN2UKZFckrswf+7bz
         Oglkw3rH5N4vgA+6jF0kVxe9IWVta9aXU9PA6WNDWmy3LZdPhHHDg7oaWDbTG4w+Dzq6
         kIMnpcnkIpD8c4n4n1p5xj45+WLWNspUAZOlUruCZsrkjNQTJk7Y5f7xro8mErknb5WJ
         FUCBGGtA7P2MYvqptlvkinOCr6++6qDvX0b57NSaeDqdSXCb/cb+T95G81/vLRkhuRuu
         GPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823652; x=1783428452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMAKdVcVpUPq5Ans2CUfYgI8lqegiCRthTeFu2d7bCU=;
        b=NELhGTK53z9tNSLkSTyluVPT8Exz7B7l2BI7ddN2cqiFpAaYbZy1hgcuWolPTzCxp5
         kZNj4whwTmmIuqxxtqqg1wXdNFNJyYavYOxVfY1cmGRBAvhnZsamEAjZmoh7mm+eLmUN
         exakk4aTYG0/ll4IMYFqeTZIGOjNGH8JNfvDYOkDKbeSagJ355+MYfDkLaA6rcgWlRdS
         uHhf0JQ7tJ3q9di9fMhgJG+9znHr8JMFW6rk9+NWgfJnn0otngHf9avR0B3PLdm5RCv2
         s/K3e71dPv4S7GSOQxv5m6BNbbzCPIXxe7bjQ+PajC6jVhPL+8ATt529t94HmZ7nIwdo
         MNQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+huVgIhrbKzH2iyboMyViZT650JwtxXf5xRsxYZyP9c4LTMaY+yITGAIz6UgI10K5X0c/UPpBWKsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWuQTr/JrnTAfuSANO26bdr/WOV6UgG7YMD4TPuRsz8FrK8EOC
	QeyYkGggYuo7MfDRBV+7cpqR56DtqnRkbFaWoENiZbEAumz4/MlSxuxWL+SImUJhHA==
X-Gm-Gg: AfdE7clJGKNiRgylgeWjemblxmCImftDgFXfP7SqdkZUF7w/5ZjYlqeP3j7sLIIC6e9
	93oPHKdxeusUB3oMVlHWVo55AA9+0+OtUOnbk6cAlgL76IMaFyUOJDS+TjLErJGDKxCochrxCQm
	286jJLzjXTnjMQbezFKMGGRffxkwTfQLYhGiHcuuRxQeCHEuDj2SlpDaKCQ1kRFrrXSPVkhC+UP
	Yo28VfIGizFU72c4Jqpcdu6NxAG7LKrnNkXvJPWT1h/XM+wm4it1FxSbfYN+9EVNwOBomVNkiUj
	JjPlGFBWV4EWvbsKZ8ybXC7laOhMip23aL3DvltXvx/vkCbiegQf6Brrr0woqjICpQLowS7SprG
	lo3I6C6hTWZ3OF7ljxQ94r6sPZmtag9oj/M1EiBQHsxVYw+LAD0Ic/vrV+08YqabwXszyxNPq1M
	qPQD0NW8UPM/U6JlVasuLHQ0MyetO1U1fufWBTA9Rm3hxaeILRqOx4eYjAP+Uq0n8Cq34Icrd1I
	YyDQY6pT9X29r4=
X-Received: by 2002:a05:600c:8b72:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-493bda9e99cmr6558325e9.23.1782823652455;
        Tue, 30 Jun 2026 05:47:32 -0700 (PDT)
Message-ID: <e63b6a58-cd4c-4443-986c-06bb393306e9@suse.com>
Date: Tue, 30 Jun 2026 14:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
 <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>
 <1782822001.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@vates.tech>
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
In-Reply-To: <1782822001.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782823652-488513FC-B3909809/0/0
X-purgate-type: clean
X-purgate-size: 3016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,sbdf.dev:url];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7677F6E4680

On 30.06.2026 14:19, Teddy Astie wrote:
> Le 30/06/2026 à 13:44, Jan Beulich a écrit :
>> On 29.06.2026 19:21, Teddy Astie wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -662,12 +662,11 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>>>       return is64bits ? 2 : 1;
>>>   }
>>>   
>>> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>> -                   const struct pci_dev_info *info, nodeid_t node)
>>> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node)
>>
>> Nit: Overlong line (like already pointed out for v2).
>>
>>>   {
>>>       struct pci_seg *pseg;
>>>       struct pci_dev *pdev;
>>> -    unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
>>> +    unsigned int slot = sbdf.devfn, func = sbdf.fn;
>>
>> Andrew pointed out an issue here for v2, and you addressed only half of his
>> comment.
> 
> Ah, I see, I used devfn instead of device.
> I guess it would be better to avoid slot vs dev wording as it's easy to 
> get wrong.
> In this case, I think it would be even better to drop this variable as 
> it's barely used (only used at the end for display as a alias for sbdf.dev).

Indeed (and I think another comment of mine was precisely about that one use).

>>> @@ -729,14 +727,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>               if ( !pdev->ext_cfg )
>>>                   printk(XENLOG_WARNING
>>>                          "%pp: VF without extended config space?\n",
>>> -                       &pdev->sbdf);
>>> +                       &sbdf);
>>>           }
>>>       }
>>>   
>>>       if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>>>       {
>>>           unsigned int pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
>>> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
>>> +        uint16_t ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
>>
>> Quoting from my v2 reply:
>>
>> "Are changes like these two actually worthwhile to make? sbdf, being a function
>>   parameter, can be modified in the course of the function. pdev->sbdf, otoh,
>>   cannot (for being in a const struct field). If further sbdf, throughout the
>>   function, never had its address taken, the compiler may be able to produce
>>   better code."
>>
> 
> I missed it; though I'm not convinced that would work. While the sbdf 
> field of struct pci_dev is const, the pointer to it isn't, so in the 
> same regard, the compiler can assume that the pdev pointer changes thus 
> can't rely on the const property of the pci_dev::sbdf field.

If the pointer is a local variable of the function which never has its
address taken, the compiler can see all assignments. Hence it can deduce
whether (and when) the pointer potentially changes.

> A better alternative would be to mark the sbdf function param const.

Not really, we don't normally use const this way.

Jan

