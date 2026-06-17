Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjRHJMqIMmqO1gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:45:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC616993EA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QFJSEGpR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340314.1601359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZohN-0004j1-Co; Wed, 17 Jun 2026 11:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340314.1601359; Wed, 17 Jun 2026 11:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZohN-0004gZ-A2; Wed, 17 Jun 2026 11:44:49 +0000
Received: by outflank-mailman (input) for mailman id 1340314;
 Wed, 17 Jun 2026 11:44:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZohL-0004gT-II
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:44:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZohK-00DN4c-Hd
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:44:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3288a4-e002-0a2a0a5209dd-0a2a4504839e-40
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:44:46 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3288ae-1dec-0a2a45040019-d155dd30b49f-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:44:46 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so4396346f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:44:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa891acsm157940465e9.9.2026.06.17.04.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:44:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1781696686; x=1782301486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5mGmnJIxwekRDqofWm/XFLnXoWAponBjyeNMTYgeDwM=;
        b=QFJSEGpRBTUUQwM1rqyYvHbtQewXrqtt21UCD3mi8KwnA8ta7zhXTsHtXhzujg1vah
         TIAKhB6pRsJNkm/nGq5xjot6cZjysrDJZSfmZs1UfDVJmvq9CGCroFDQi5QdwfCkEQxX
         LVrfj8eRkUddtgw1LSamz+JnN/YsgW0QofvCI9icbrOk7hxdX2V3TIn79+JcGvcy+VAv
         pJs7dYOJ1MnfEgSVGnWXDAbbhMRlzA8v840m8EtJ/9wCQ4bc7qjWlxfecqVV/ziYNTuy
         /iCI45Dz7J9BLL9wEylj2tiIvNwY2LDVqZpKfypE1CE4mTWTQoYq2z1GGHTiDx4c0JZ9
         2VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696686; x=1782301486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mGmnJIxwekRDqofWm/XFLnXoWAponBjyeNMTYgeDwM=;
        b=UBuaxNBHq2bCa9fFpXRQlvxPdnPni+GYxRy8kZHixqxpWxdQ7xp4frTso+nLF/1gI6
         8UQlthuIfhxtvWT5RQ8LiNZhjybz7CWZUpeAfsCS07obXzIw2BVfWQt4A7OYz7wcUHF+
         TZ44cZqHBkYyeay4n0HEkDHNjpRyeEzJ71W+IPzwuaOCvYhHDYQkBDQcjiR5gU7BGCTV
         tWLDCLL6DhQgAb3r79MR+dclLvj4WeilD7Uee4sj66y8pF/sLVUTf6hPo0r+klmqstrS
         /iyivprUN5azRc5sGoWInfqnsnXnR+2e5UhDGioVZk/G1UpYOqPiNdgV5IOFpfpulnE1
         7uvQ==
X-Gm-Message-State: AOJu0Yz1uB/5n6apzXNmObXUmIcGwu/AgwptKW5kn/jKvYLv+3TMHCRX
	UFy11GcCbJPgpO4MiS1KL/w6U3lX7p/pLbXCFDNRdjS8E8Mnve2leRVWG+u/3TWRIw==
X-Gm-Gg: Acq92OEMPraaokdfLe+TLpzTOWYP3r6UenGtkhQmrentodeoCIbitGa4wpBiAZjT/4D
	C5Jt3vKp8xjYh1fS/v3mnW1CVlZGi5rvGrAmR9b/dC41Bdf7r/A9qctxtOdm+BymJv3T2i6m/uq
	lhn4yA+COyRS580H1ocZwuAttoTRimcxCTBnsGXtmViiiTDV1+WKZRn+C4GP9cfiZ7u3Ey7XQws
	g1uU8ikGQq5YW0uPmAO9fUPDW3mxipHnKu/adlDmyhoCvFX1I21Uu3S2q6KpaKb5SXoCGwbG1Ua
	mwKE+JlaZXP0HS4AHtmG4cTiLsx4N7fRHXALafiExsC7cNIqHxsHjVG5x5kkQ1hcuR2j3vgsSMg
	NlrxwByc9Yxr3CfwftbbJaijzTJvPV7PMLkOggwXLl8Pw7Q3LqkZ2rgkOYfSn8spsrbpa4xePFm
	UdarfoRabSZ7GunliO4/jLxWf+g+K1Q8Qcrx1pR1sQfRqFvzjA8x8q+wMdZeFNck9XkXQ/5bRZ4
	CQq
X-Received: by 2002:a05:600c:620f:b0:492:2e93:1199 with SMTP id 5b1f17b1804b1-4923410c4admr43139845e9.15.1781696685788;
        Wed, 17 Jun 2026 04:44:45 -0700 (PDT)
Message-ID: <fd448d36-237d-4617-92b7-211f6374eb87@suse.com>
Date: Wed, 17 Jun 2026 13:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <ajJ3C40FLsyBZn-U@macbook.local>
 <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
 <26179fd5-15b8-4395-9808-447963180b7d@citrix.com>
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
In-Reply-To: <26179fd5-15b8-4395-9808-447963180b7d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781696686-4217E3FF-D06BE265/0/0
X-purgate-type: clean
X-purgate-size: 2504
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com,citrix.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAC616993EA

On 17.06.2026 13:20, Andrew Cooper wrote:
> On 17/06/2026 11:37 am, Jan Beulich wrote:
>> On 17.06.2026 12:29, Roger Pau Monné wrote:
>>> On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
>>>> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
>>>> yet we need to access it ourselves when switching out of "physical mode".
>>>> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
>>>> doesn't have the discardable flag set (which cannot even be expressed in
>>>> ELF) will yield the output section also non-discardable.
>>>>
>>>> Since for intermediate binaries we don't care about section attributes,
>>>> link in the new object only on the final linking pass.
>>> I'm not sure I follow.  Xen already does generate a custom .reloc
>>> section without the IMAGE_SCN_MEM_DISCARDABLE attribute when using
>>> the mkreloc utility, and hence the .reloc section should never be
>>> marked as discardable?
>> mkreloc is used only when we recognize the linker to be incapable of
>> producing (correct) base relocations.
> 
> I wasn't even aware of that behaviour.
> 
> So we've got even more completely undocumented and obscure toolchain
> restrictions and behaviours.
> 
> What else?  It needs at least enumerating somewhere so people stand a
> chance of being able figure out which toolstack they need in order to
> get a functioning xen.efi.

The two ways of generating relocations exist to allow people to build a
functioning xen.efi irrespective of GNU ld version used. Hence it's not
quite clear to me ...

> I'm going to insist that a doc happens, and that this patch patches it
> adding in the Binutils 2.46 requirement.
> 
> But I'll write the doc if you can summarise the other checks I'm not
> aware of.

... what exactly you want to document. The change here is towards
secure boot support; outside of that xen.efi is operating okay in this
regard, afaik. The first paragraph of docs/misc/efi.pandoc could do
with an update (as the version restrictions are now obsolete), but it
was my understanding that the secure boot related aspects all would
live in a new, to be created doc (which iirc you already have in flight).

Besides the .reloc filling, the other check we have is for whether to
include debug info. As with the documentation on toolchain versions
required, the MS ABI check could likely be dropped now as well. Otoh
the "linker supports PE" check of course needs to remain.

Jan

