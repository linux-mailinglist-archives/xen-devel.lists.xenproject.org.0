Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EyPtKNm6TGpGowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:37:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A2719311
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eCqWWtWk;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356076.1610736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1J5-0003Ij-TL; Tue, 07 Jul 2026 08:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356076.1610736; Tue, 07 Jul 2026 08:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1J5-0003G1-QR; Tue, 07 Jul 2026 08:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1356076;
 Tue, 07 Jul 2026 08:37:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh1J4-0003Cr-CQ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:37:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1J2-00CqDE-Vf
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:37:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbab9-bab6-0a2a0a5309dd-0a2a4501cdb4-44
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:37:28 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbac8-400f-0a2a45010019-d155dd2dd9a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:37:28 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso2000373f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 01:37:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960816sm30728346f8f.29.2026.07.07.01.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:37:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1783413448; x=1784018248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0FA7YGBTQf9PlPRxd4lq++npfL8jfIrohvmnplJ9js=;
        b=eCqWWtWkwMKXaSIJUbg/4ppiTwheX6qFufeP5pgnVIBUlHPrjLyobeqaPeF+VoN99E
         hLCYhCkqCikk8TpckL8v+3cPbISLUBDunSGrVpLgslD/Hd5V3fLVzogkw9DMEbM3gzQv
         YY9oxOyAFZ1hzqqRnghXX8wkubIOF+KhFATqirh1fNTQO5WxjnF4ImQb7nIfmCjUmgaQ
         0nme7K+mFdXNXuwU1vVvIyKD8FPegXGDgeQzZyPobS9Hw/5Zq3VZsP1wk5odjTRB9P7l
         Kkw1S/G2mZ/un5qEQcosqW2upRW7cLDkUvhVuPM/TePVk1WHHuLWZAO8PIzgrsNf3EhJ
         9iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413448; x=1784018248;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0FA7YGBTQf9PlPRxd4lq++npfL8jfIrohvmnplJ9js=;
        b=n/xxhlMcMYOoQq7lcBolFcboTpW1jzto9pZvKUgZ32VbJc7Nz44NTTQ2dWpG2beAhX
         6ryM1fqftekYCXWzihI/Bd0FLpYhYzOmzUD9s+wSWaV+94g8Mpsjar+Fq8UMZKs8ij1y
         hYvamQ7Ya9I9LMOyHtjRPrmfupq+HrwjgMSLMLEdFMQjD2PUDr2hwNFA+A2AWCYQ6gsZ
         goVl6qgFBGKRuoqQuwc/Lil9lijIhS1Zi/8B1KSy3zFFDyvhpKmxhNmrxH4F2vslkTiJ
         GHOJ1U6w3BSnW4jFMq5xW1piULNVFI63Yq+YoXHr0PDhhZrEs1+bR5Hr+Bnv1ai/6VZz
         grPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnfZO4k4UdkA3doItNhy+otdSUTfBd8trEodOwTr6AqNttyvvFsaFRocXpRzdvxu140udo2OmDsm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI+dVTLg1gvaCJr1Ub6sjEdnR3B04PDMWoD1m64a83TFCXK4AH
	/8E0yh6M3PDg193nQgDjgikD00VF0HEaEUg9t/NZ36kHdLdGLY2GZAnde6ubskl5cA==
X-Gm-Gg: AfdE7cnZiS+lHPP+OaZRmQWepjiHPZosHwq7Y5fPNf/h+TRZmgcfm+bFAjwn2VUjG2j
	Zo6i6D3VsvzXvN97KctvXKERUeAq077hianlo44CNRbtBGZQASSBhXjciEjyYeIanbZfWKdwgYD
	Tzw/5A7S/Fe9wIlVJCEhDGd99F58bPrtzq9D2y0qDh233mA6mVIOBVkP/FnZZgO04Dmb18TaeCV
	1uC9aiqVXHu2bD5o2jUerJw1BSxoCpPqPz+LahZCkdZ4aP3nfXa7GxAt6ogb0Ycm24PyFr9kvqC
	FdUKSEqZyJKPIiQ2PXKWKmX5IfPNRTtEPhBTZkb/gqnaWJsHNR+1/e/kX9NfUw7+7sDRd77yh/0
	F2pTj8cmuMwzL01Q/286oNVJk5qyTdLs/r/GP1kgTDYBYmNdd4hJ+Dddb/b/Bj8OjYnFbNj87qR
	2IhraK79gVf/BqEPTpZUrPeZfnYYH+2y2ZoFxe+SSjKGD4EfvbW1cgZV01CT7FTKPKPcQcJn+4W
	48P
X-Received: by 2002:a5d:4e82:0:b0:471:c76f:332a with SMTP id ffacd0b85a97d-47de665040emr3136377f8f.3.1783413448347;
        Tue, 07 Jul 2026 01:37:28 -0700 (PDT)
Message-ID: <326e44ad-2014-43cd-bda8-e9c1faffe315@suse.com>
Date: Tue, 7 Jul 2026 10:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/26] xen/riscv: do a 4th linking pass if necessary
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
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <ba3b7e3197ae90c9f0e5190ba34de174b86090ac.1783331040.git.oleksii.kurochko@gmail.com>
 <3835ed9c-4c9a-49e4-90fd-37644262a942@suse.com>
 <66b5f31f-8ef6-4555-9c04-f5314512b598@gmail.com>
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
In-Reply-To: <66b5f31f-8ef6-4555-9c04-f5314512b598@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783413448-D16DE1E0-614FA668/0/0
X-purgate-type: clean
X-purgate-size: 2644
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 031A2719311

On 07.07.2026 10:19, Oleksii Kurochko wrote:
> On 7/6/26 6:13 PM, Jan Beulich wrote:
>> On 06.07.2026 17:58, Oleksii Kurochko wrote:
>>> Embedding the symbol table can shift sections and flip relaxation
>>> decisions, changing code size and thus the set of emitted symbols
>>> (e.g. gap end markers).
>>
>> What difference in symbols is there? (And: Do you mean the ELF symbol
>> table or what tools/symbols emits?) On ...
> 
> The ELF symbol tables of .xen-syms.0 and .xen-syms.1 are identical
> (same names, types, and count; only addresses past a certain point
> differ). The difference is in what tools/symbols emits: the
> address-only "end of symbol" entry produced when want_symbol_end()
> is true, i.e. when a sized text symbol's end doesn't reach the next
> symbol's address:
> 
>      static bool want_symbol_end(unsigned int idx)
>      {
>          return table[idx].size &&
>                 (idx + 1 == table_cnt ||
>                  table[idx].addr + table[idx].size < table[idx + 1].addr);
>      }
> 
> In pass 1 (generated from .xen-syms.0): simple_strtoull is at
> 0xffffffffc00c0444 with size 0x16c, ending at 0xffffffffc00c05b0,
> while turn_on_mmu (alignment-pinned) starts at 0xffffffffc00c05c0.
> 16-byte gap -> the end marker at ...c05b0 is emitted.
> 
> In pass 2 (generated from .xen-syms.1): simple_strtoull moved to
> 0xffffffffc00c0454 (same size), ending at exactly 0xffffffffc00c05c0
> == turn_on_mmu. No gap -> no end marker. Hence symbols_addresses
> shrinks by 8 and symbols_names by 1 (the marker's empty name).
> 
>>
>>>   Re-link with a regenerated table when its
>>> size differs from the previous pass.
>>>
>>> This mirrors commit 35de7285d508 ("Arm: do a 4th linking pass if
>>> necessary"), which riscv didn't receive when the underlying
>>> pass-2-vs-pass-3 check was extended to it in commit aa786d6e3467
>>> ("non-x86/symbols: check table sizes don't change between linking
>>> passes 2 and 3").
>>
>> ... Arm the problem was with a symbol (dis)appearing from/in the ELF
>> symbol table. The situation looks to be different here. Sadly ...
> 
> I will rephrase then this paragraph to:
> 
> This takes the same remedy as commit 35de7285d508 ("Arm: do a 4th
> linking pass if necessary"), though the underlying cause differs:
> here no symbol (dis)appears from the ELF symbol table; instead the
> set of end markers emitted by tools/symbols legitimately changes,
> because want_symbol_end() depends on code layout, and layout differs
> between passes due to linker relaxation.
> 
> Or it could be just dropped.

Please don't drop it.

Jan

