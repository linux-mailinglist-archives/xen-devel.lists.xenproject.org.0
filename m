Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYTL+dc12lUNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:01:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B831C3C7673
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276786.1562095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkKQ-0006cI-BR; Thu, 09 Apr 2026 08:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276786.1562095; Thu, 09 Apr 2026 08:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkKQ-0006aa-8h; Thu, 09 Apr 2026 08:01:30 +0000
Received: by outflank-mailman (input) for mailman id 1276786;
 Thu, 09 Apr 2026 08:01:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAkKO-0006aT-Cz
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:01:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkKN-008dr7-89
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:01:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d75cd2-bab6-0a2a0a5309dd-0a2a450cac9e-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:01:27 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d75cd6-f40c-0a2a450c0019-d155dd33e9af-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:01:26 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43b95e5b3afso324460f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:01:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d29bbsm67047676f8f.21.2026.04.09.01.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 01:01:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1775721686; x=1776326486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls4VkKrCyhgbFAgAAGHo8Ibiq+8snbVkxZ+xz9PhIfI=;
        b=bIzacTbGk+UmbdFO89xsio2t6nU0fvzo9pB0/2Ba9UcRFCjmJVcvIoVEuVaZKh8d+S
         ZiOZNfTgmTrEEFTIQWMWgfNa+sYG+qlkvvveT8oW30b820hfS1Qol1IURWIOKtuN0Nao
         ZVKsmSMWzY/9c5C8zXJHt58SmL7w23IcdKPPRv7+n90AErZgZ51qufu+8fn9K7bpMKjZ
         eb/wrEkv/er8hufg/pQmf9Wpip0FAtF6mzcZFIROg6kRIkW9fraadRZqfj0cxQ+Rkvj1
         IfTsTjfAeEtA4Glns86XauEB05MYOeG3NPxw3ctocr2Ngh2vltoPfwVhvxNlahV1TNUq
         uqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721686; x=1776326486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ls4VkKrCyhgbFAgAAGHo8Ibiq+8snbVkxZ+xz9PhIfI=;
        b=ATfbH+eZBu3fyB/yoktZq8XnP9a/J+0zQTT31NDYW22cZpBj1RLqgNcZftXB1V0UTp
         iDqtAovsKgUpNTIsFBeshYBN0wKhcfdu47Ez+uPyz4d1N2gMXvgksWNhuEp3FFtOBKrW
         wpxBBla+upxSh4+ZOC1xeRkciQ+hJPMy0vPsTIh+EkqpQXFjLKKuamtecjj1dHgT0X+h
         J69Einsr4E6oVLH47J1Y4ofcza7ONFkJrKcBnZGXK1y2SbEoSCgICm3Krb87POi1x5pQ
         EXhUx6s/gUjp2U+pr/7oihYmi4gwPVAJTKhtTdmjzdrNnfP4vZTSudyq1CwWeNOfeG4K
         LrHw==
X-Gm-Message-State: AOJu0Yw+rLFWa7QGtCGGh2PSpvBMNvKsz8u0qo7oF4A8r7NoNLj6Mbk+
	DINOZHNJ2vjXXqsnUr10QoSBc8pfIgqrAMt4nId6tj1/UqBKbmDg3aEfqBffeLgU5ncdsPZNPsR
	ujGiqkg==
X-Gm-Gg: AeBDiev747fTScrAEtVsQylYfmNqLQDA4M6Ir/yNuawtKx8xiaodi9nKquQC89deFMJ
	FnrSTRkY0WoRyx19goeF+uiFDOfWwDdadu9MAeCmd/W3iBMQuHSrFASB99BIP5UVyuthw/peWkb
	kCV2oCxjTiTeKWNrPaSTmVXfCavN/gSDIXUiviSjNBV6LRkMS5vSVWFl82Mi9hqeQa2cptKxVxZ
	D3GeueCO/zooATDMUzX/bx827bvj+dSOzSVVdD5YNtxohfmrpY7S7XofT/LORp1DQQLUQ3E9Gz3
	mSyAGAPwpvi2LdeRxJrD0z5nfbKnVR3Q/QTAFCfbJ6tG1u/gU6cm+tUhbjUqTiqRKYEIPbmAAJf
	D+SyaSiYM9g/i/ThOXvY4MUrKndnSEg2YH+OGKRoBrxOl4cmILXEHlyvRCaZDae9WtVPvTvjDoO
	3ayCTqwRC3Pj4hVUnz6B+DTTCwHKOUylZpTjmTLR+Bwk0EUhYyQZfXnzJTmLaogvt4ADXpOkCwi
	wvrqlIa/xWQYkA=
X-Received: by 2002:a05:6000:24c8:b0:43c:f4df:9247 with SMTP id ffacd0b85a97d-43d2930037emr34859255f8f.51.1775721686306;
        Thu, 09 Apr 2026 01:01:26 -0700 (PDT)
Message-ID: <da248a6e-1b4e-49b9-8cd2-151582db9369@suse.com>
Date: Thu, 9 Apr 2026 10:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] make ioremap_wc() x86 only (for the time being)
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <da4bf81d-7591-4f5d-8e0d-e6ed9ecb834e@suse.com>
 <4291DA48-87D9-491B-83C6-51CCACC0FFE7@arm.com>
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
In-Reply-To: <4291DA48-87D9-491B-83C6-51CCACC0FFE7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775721686-FF746A3D-0A910852/10/73395122804
X-purgate-type: spam
X-purgate-size: 1136
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:Bertrand.Marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[oleksiikurochko.gmail.com:server fail];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B831C3C7673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 09:52, Luca Fancellu wrote:
>> On 8 Apr 2026, at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Its use in domain building is questionable: Already at the point both uses
>> were introduced, ioremap_cache() existed. I can't see why kernel and
>> initrd would need mapping WC, when at the same time other similar mappings
>> (in common/device-tree/) are done WB.
>>
>> With those uses replaced, neither Arm nor RISC-V have a need for the
>> function anymore.
>>
>> Amends: d8972aa9645f ("xen/arm: kernel: Rework kernel_zimage_load to use the generic copy helper")
>> Amends: bb7e6d565d92 ("xen/arm: domain_build: Rework initrd_load to use the generic copy helper")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> 
> Reviewed the arm and common part, tested on arm64 mmu, arm32 mmu, arm64 mpu:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks, but I guess I'll use the form you sent earlier, with the restricted tags
(matching what you say separately).

Jan

