Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GJBGwzw1GkjywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:52:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAC3ADF64
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274937.1560905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4yg-0005qC-KO; Tue, 07 Apr 2026 11:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274937.1560905; Tue, 07 Apr 2026 11:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4yg-0005nq-Hn; Tue, 07 Apr 2026 11:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1274937;
 Tue, 07 Apr 2026 11:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA4ye-0005nk-UK
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA4ye-00BrlQ-A3
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:52:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4efed-2eae-0a2a0a5409dd-0a2a4507c88a-12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:52:16 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4efef-ba2d-0a2a45070019-d155dd2ba5b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:52:15 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so2375064f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 04:52:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm52527574f8f.6.2026.04.07.04.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 04:52:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1775562735; x=1776167535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1+gLJTYWBOHZnUmuke5uQ6K8ScG4ViJSTe+g/vhdTcY=;
        b=dtP/BiRuOt8jDhoIl7AzsRXQjj7GoLKIE3rtbgjxkiVvuYL5nVPgLEIDkzTx5i68sr
         MIjVGiVYBQGu+ukBW/3KqRs3Pxmxkc/8lMZZbaDyf9tdL50yjuF/ygpaRpuRmIEY86o3
         9+R8snYI9br+I7iZ5JBoAoTauaU26DLGJV1aeQeMYICJlnmdwNmayPbdgxhel8YbPlMH
         nOjhloHd2o5rzH96cFhd07A13lapQCFpD2BLC5iPIeszECN5pnXY64Y6MiYzaQ7A7fnF
         Y3sA9xQX8MpkZGqKHL5I+m1GfnXgarwXgUV6s8Y3gVdrW7m4f61MXG2EmBt7Cu0wIpAO
         5TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562735; x=1776167535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+gLJTYWBOHZnUmuke5uQ6K8ScG4ViJSTe+g/vhdTcY=;
        b=GKySiut1JsvL3w7LHcWJF8Cost/07BS3ZIkDtvb0Io8rB7JTH2UW7IsDCOn4FLBJIw
         6G8miynA8SP/HhUTFxY0CzAirzL5IMrFM7LOldN88VH75aOl1CkPyy38cs0p1gkrztT/
         m9qC1PpImcIgS+G1gLZnnDFdWfm+sQS8ymTEOdnqKjbHelKksl9XeVwvah195MDENAgK
         cFg3WYiZhFh0XjlMMNoV6DGp42cQwjVyFeQ+SnrHP6D29SgHQ2pvfjXzQkp1qhLVwfER
         rIKp8rn7476mCRKSBoj8H0V3kPwoxYLUwLxA/BNt9QXJjYroM1VxEoy8JcedUHdy1tB/
         PMMg==
X-Gm-Message-State: AOJu0YyzVi3CQTPT4vPce6EPDUEDkg2atNty1S/IvfEClxYafvzbXog4
	NuAECV1hy3tyDXnlR4xZ1qLs25399m6NgrNowuoFf7MOF/YbrDkhlaOCmeSK3jgeErXDAUzNhZ4
	myfDqGw==
X-Gm-Gg: AeBDieuZzt+Z3TiEVs/Dkl1QJZewjEm5qdGz/LIZVhHmxh92q68JvYhREtx7jKTdra6
	xufMnyIwF5kf9N5uE2RdMWf7ZeYkdLwYzO90GByzJ7/d2rD7CPG/oakoZmQ8KvsCJW+SEd5cf4o
	6npU58aWQCUyUOtnnR0VAbU0nLuUFXWKat5ND4Ff3/8nxXyxpOuELcujEPiO1irJ+GuLFvXlyJu
	bTE1tc4mGPE3pLBRkaxf/fsF9L4T4aaUjhbpc5Zn/6r8/qeDqhmWY02Vrwr05j3rP31b6wRwrQH
	0Pohv4szM9sWH81YW5Awc8P/iGWEhq8vJw9WzTxy0MQpQFUMFlmra8ziXortygu+Q+VqV/CRd1O
	LqXV/RauS7KpLLhB2jwDkObWULy6FGZ0XR59dVFU31JbN2fhRPscxmxkR8N/o+7ifhLm6bNlfoT
	QSI5Wlvi2bswwwlgGMS5Biv850nQahIri06qKn1YAKTSdsHEs0elzse14Q+BNKOFBTJvNZUnH62
	zLv/Hetvvmk8rU=
X-Received: by 2002:a05:6000:288b:b0:43d:1df7:e3af with SMTP id ffacd0b85a97d-43d290f71ccmr23944241f8f.22.1775562734922;
        Tue, 07 Apr 2026 04:52:14 -0700 (PDT)
Message-ID: <9a5a290f-0abb-4afb-b58d-da21b40ac761@suse.com>
Date: Tue, 7 Apr 2026 13:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl> <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl> <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
 <ac6Bg21hMLBRDNdm@mail-itl> <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
 <ac72dp3yEHikJzw2@mail-itl> <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
 <8c9e5404-24bf-410d-a2e8-551cb87c6400@suse.com> <adTr0_IwZXcGgUI1@mail-itl>
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
In-Reply-To: <adTr0_IwZXcGgUI1@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775562735-8895941E-9347A65A/0/0
X-purgate-type: clean
X-purgate-size: 5423
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CCDAC3ADF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 13:34, Marek Marczykowski-Górecki wrote:
> On Tue, Apr 07, 2026 at 12:23:16PM +0200, Jan Beulich wrote:
>> x86/HPET: channel handling in hpet_broadcast_resume()
>>
>> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
>> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
>> the (possible) channel put in legacy mode we don't do so during boot
>> either.
>>
>> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
>> all-zero message (when the passed in CPU mask has no online CPUs). Nothing
>> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
>> would later produce a well-formed message template in
>> hpet_events[].msi.msg.
>>
>> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This appears to fix the IOMMU faults.
> Started with no-arat, the debug output is now this:

Same question here: May I translate this to Tested-by:?

Jan

> (XEN) [18446743900.509455] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
> (XEN) [18446743900.509470] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> (XEN) [18446743900.509480] _disable_pit_irq:2662: init: 0
> (XEN) [18446743900.509491] hpet_broadcast_resume:662: hpet_events: ffff830461b3f080
> (XEN) [18446743900.509636] hpet_broadcast_resume:673: num_hpets_used: 8
> (XEN) [18446743900.509644] hpet_broadcast_resume:691: cfg: 0x1
> (XEN) [18446743900.509656] hpet_broadcast_resume:696: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
> (XEN) [18446743900.509687] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.509698] hpet_broadcast_resume:705: i:0, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.509728] hpet_broadcast_resume:715: i:0, cfg: 0xc130, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00f18
> (XEN) [18446743900.509739] hpet_broadcast_resume:696: i:1, hpet_events[i].msi.irq: 123, hpet_events[i].flags: 0
> (XEN) [18446743900.509762] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.509772] hpet_broadcast_resume:705: i:1, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.509803] hpet_broadcast_resume:715: i:1, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00f38
> (XEN) [18446743900.509814] hpet_broadcast_resume:696: i:2, hpet_events[i].msi.irq: 124, hpet_events[i].flags: 0
> (XEN) [18446743900.509838] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.509848] hpet_broadcast_resume:705: i:2, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.509877] hpet_broadcast_resume:715: i:2, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00f58
> (XEN) [18446743900.509888] hpet_broadcast_resume:696: i:3, hpet_events[i].msi.irq: 125, hpet_events[i].flags: 0
> (XEN) [18446743900.509912] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.509922] hpet_broadcast_resume:705: i:3, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.509952] hpet_broadcast_resume:715: i:3, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00f78
> (XEN) [18446743900.509963] hpet_broadcast_resume:696: i:4, hpet_events[i].msi.irq: 126, hpet_events[i].flags: 0
> (XEN) [18446743900.509987] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.509997] hpet_broadcast_resume:705: i:4, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.510027] hpet_broadcast_resume:715: i:4, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00f98
> (XEN) [18446743900.510038] hpet_broadcast_resume:696: i:5, hpet_events[i].msi.irq: 127, hpet_events[i].flags: 0
> (XEN) [18446743900.510062] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.510072] hpet_broadcast_resume:705: i:5, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.510102] hpet_broadcast_resume:715: i:5, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00fb8
> (XEN) [18446743900.510113] hpet_broadcast_resume:696: i:6, hpet_events[i].msi.irq: 128, hpet_events[i].flags: 0
> (XEN) [18446743900.510138] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.510149] hpet_broadcast_resume:705: i:6, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.510179] hpet_broadcast_resume:715: i:6, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00fd8
> (XEN) [18446743900.510191] hpet_broadcast_resume:696: i:7, hpet_events[i].msi.irq: 129, hpet_events[i].flags: 0
> (XEN) [18446743900.510214] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743900.510224] hpet_broadcast_resume:705: i:7, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743900.510253] hpet_broadcast_resume:715: i:7, cfg: 0xc100, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfee00ff8

