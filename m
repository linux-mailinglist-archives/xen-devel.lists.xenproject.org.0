Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KDYM3UrzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFF3862F5
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271287.1559508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Dab-0006eU-He; Thu, 02 Apr 2026 08:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271287.1559508; Thu, 02 Apr 2026 08:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Dab-0006d2-Dk; Thu, 02 Apr 2026 08:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1271287;
 Thu, 02 Apr 2026 08:39:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Daa-0006cw-Dh
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:39:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DaZ-001Cqk-QE
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:39:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2b4a-e002-0a2a0a5209dd-0a2a4506d760-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:39:43 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2b4f-0df0-0a2a45060019-d155802bb57e-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:39:43 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48704db565eso6243655e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 01:39:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e832585sm328006935e9.6.2026.04.02.01.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 01:39:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1775119183; x=1775723983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FTEc4Up5NS5nmekNW2xg2XC0IwNoFW18OBkCBWWQUS8=;
        b=NEQ4y2BBwHfRe+UKsjCLUAnYeR8LFSZUY2vU2TZqElAsu1Uk3eCzI1gLae4N/OBC8D
         r3mpAJHvixE/38o81JsSTbxT3wjaYyJRqpmgZUB9BX+tzXzpEGqap2uecUFlllL/shFe
         n08NB7rdq3crHYQ9yi06nz0Lxm7zwssdtRIDZGQKCU+xcIBoqfkmD2VU5gSbujGpN2sR
         Beqi0SxqpnD0KxW1Vh8xmMxy5q0rja55puO3fER+62OopfkNvN4+m6cFaj4z0/ctI6K7
         HSMrm0zp/QqXRvQ4DxpXqxBT+G83wiUjI9eRYS+kQH3Foh+S0DpKoDPfjdkqyy56tIw6
         0QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119183; x=1775723983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTEc4Up5NS5nmekNW2xg2XC0IwNoFW18OBkCBWWQUS8=;
        b=N5Wn2WUUMLnmiFyTFrLBi9r7d/CgcmwsN7ZJyv6O8o7ehUUwjsF8UrrtBbSh4Bz6+m
         1OrkL36aJ4TpnC9FtrKwtz1POzS7UYwd3HpcFuOmBNOExQDoFlwfn6RlfFflMDgVeKen
         45BpX798x4IL71ezCiQBuI/xCvbcRos9Xbmcr2fKN6HKlzGJ0KGuEYWku2Da4y3oOdWQ
         KrggghE2nkcdfwlcbhJIxUrj2F17Z7m+0TCsJ4qo3U+wL3EHdHl9B+7ZnITh/C2Krj9o
         qAYiNUGJbah2C0evW96LIRB/6xnlJURv+Bl2XsZBumPFUZqBa00kJOh4lfw5LZVHH3Zy
         Dk1w==
X-Gm-Message-State: AOJu0Yz95kRwNHrr3SYuoImvmehOoqKLpIIc0yRZaC2SiK0U0blnDy4e
	alQYDXmyK7reC8oHhGOdRNO2bEP7JmpcS8vccaSnY36o6ClolF6D5pFT48O0GnDcpBlPt6eB4kt
	xGieMjQ==
X-Gm-Gg: ATEYQzyZxXGqPC+ptRIXYgmUg0/dF7hVgLXjlE6VFyZoNvPZCAlfa5eFJoiKHREEAAH
	IObC3RM87YwsUCmP04cKvGLzpN8D1Q4U5hyocY6g0kJf1WYsjlYHWoWV71V/3m/ddEQjGSF7A++
	uoIwEqpJkZ/tC6tC3KoirK2L0WTLPpEVt2DpkHCteg3+Kewe1BnOvSgvyC3tCib/EygK/SWgQ6m
	HRWvFyWXxtOyrUf//X7VC74tSOspWNrXiSk2UvH+liynJM9BI0eopX6zZL8RFT5ZGXhhCgwBFId
	LB/5WIGupioI0h5R3geJKX2hAw7IgPlINtFqEPYPXmkGJYcD0JV/qKeyrrdkxYtxe1Csd6sbSWc
	wbtzr+oRjxMeCxt6DdgKkg0QupEnSNNyUPmNcwp+VpslohT9ctmcMWpSmJHD5RK8I3EM+NH4Tcc
	EsnmoDVc4EbAypAbJTJG/GvrjvV97I/uk6sml+jV0ty0rP0PFP5wGc+Z1RTzYXmGcDcblvPWk8T
	oSUssrxBj65/50=
X-Received: by 2002:a05:600c:310b:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-4888b769851mr41616695e9.14.1775119183071;
        Thu, 02 Apr 2026 01:39:43 -0700 (PDT)
Message-ID: <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
Date: Thu, 2 Apr 2026 10:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
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
In-Reply-To: <ac4kCq87SQSc6ddV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775119183-642483D8-4995561C/0/0
X-purgate-type: clean
X-purgate-size: 5827
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 44DFF3862F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
> The xl dmesg output (from MTL this time):
> 
>     (XEN) [  123.477511] Entering ACPI S3 state.
>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0

XEN_ARAT being off is the one odd aspect here. That'll want tracking down
separately. As per xen-cpuid output (below) ARAT is available.

>     (XEN) [18446743903.571866] _disable_pit_irq:2662: init: 0
>     (XEN) [18446743903.571877] hpet_broadcast_resume:661: hpet_events: ffff83046bc1f080
>     (XEN) [18446743903.572020] hpet_broadcast_resume:672: num_hpets_used: 8
>     (XEN) [18446743903.572029] hpet_broadcast_resume:690: cfg: 0x1
>     (XEN) [18446743903.572040] hpet_broadcast_resume:695: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
>     (XEN) [18446743903.572081] hpet_broadcast_resume:706: i:0, cfg: 0xc134
>     (XEN) [18446743903.572089] hpet_broadcast_resume:695: i:1, hpet_events[i].msi.irq: 123, hpet_events[i].flags: 0
>     (XEN) [18446743903.572123] hpet_broadcast_resume:706: i:1, cfg: 0xc104
>     (XEN) [18446743903.572132] hpet_broadcast_resume:695: i:2, hpet_events[i].msi.irq: 124, hpet_events[i].flags: 0
>     (XEN) [18446743903.572167] hpet_broadcast_resume:706: i:2, cfg: 0xc104
>     (XEN) [18446743903.572175] hpet_broadcast_resume:695: i:3, hpet_events[i].msi.irq: 125, hpet_events[i].flags: 0
>     (XEN) [18446743903.572210] hpet_broadcast_resume:706: i:3, cfg: 0xc104
>     (XEN) [18446743903.572218] hpet_broadcast_resume:695: i:4, hpet_events[i].msi.irq: 126, hpet_events[i].flags: 0
>     (XEN) [18446743903.572252] hpet_broadcast_resume:706: i:4, cfg: 0xc104
>     (XEN) [18446743903.572261] hpet_broadcast_resume:695: i:5, hpet_events[i].msi.irq: 127, hpet_events[i].flags: 0
>     (XEN) [18446743903.572294] hpet_broadcast_resume:706: i:5, cfg: 0xc104
>     (XEN) [18446743903.572303] hpet_broadcast_resume:695: i:6, hpet_events[i].msi.irq: 128, hpet_events[i].flags: 0
>     (XEN) [18446743903.572338] hpet_broadcast_resume:706: i:6, cfg: 0xc104
>     (XEN) [18446743903.572347] hpet_broadcast_resume:695: i:7, hpet_events[i].msi.irq: 129, hpet_events[i].flags: 0
>     (XEN) [18446743903.572382] hpet_broadcast_resume:706: i:7, cfg: 0xc104

Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() values
might be a good idea, if only to double check.)

All values logged look entirely plausible, with XEN_ARAT being off.

> And the xen-cpuid -p output from this system:
> 
>     Xen reports there are maximum 120 leaves and 2 MSRs
>     Raw policy: 48 leaves, 2 MSRs
>      CPUID:
>       leaf     subleaf  -> eax      ebx      ecx      edx     
>       00000000:ffffffff -> 00000023:756e6547:6c65746e:49656e69
>       00000001:ffffffff -> 000a06a4:20800800:77fafbff:bfebfbff
>       00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>       00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
>       00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
>       00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
>       00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
>       00000005:ffffffff -> 00000040:00000040:00000003:11112020
>       00000006:ffffffff -> 00dfcff7:00000002:00000409:00040003
>       00000007:00000000 -> 00000002:239c27eb:994007ac:fc18c410
>       00000007:00000001 -> 40400910:00000001:00000000:00040000
>       00000007:00000002 -> 00000000:00000000:00000000:0000003f
>       0000000a:ffffffff -> 07300805:00000000:00000007:00008603
>       0000000b:00000000 -> 00000001:00000002:00000100:00000020
>       0000000b:00000001 -> 00000007:00000016:00000201:00000020
>       0000000d:00000000 -> 00000207:00000000:00000a88:00000000
>       0000000d:00000001 -> 0000000f:00000000:00019900:00000000
>       0000000d:00000002 -> 00000100:00000240:00000000:00000000
>       0000000d:00000008 -> 00000080:00000000:00000001:00000000
>       0000000d:00000009 -> 00000008:00000a80:00000000:00000000
>       0000000d:0000000b -> 00000010:00000000:00000001:00000000
>       0000000d:0000000c -> 00000018:00000000:00000001:00000000
>       0000000d:0000000f -> 00000328:00000000:00000001:00000000
>       0000000d:00000010 -> 00000008:00000000:00000001:00000000
>       80000000:ffffffff -> 80000008:00000000:00000000:00000000
>       80000001:ffffffff -> 00000000:00000000:00000121:2c100800
>       80000002:ffffffff -> 65746e49:2952286c:726f4320:4d542865
>       80000003:ffffffff -> 6c552029:20617274:35312037:00004835
>       80000006:ffffffff -> 00000000:00000000:08007040:00000000
>       80000007:ffffffff -> 00000000:00000000:00000000:00000100
>       80000008:ffffffff -> 0000302e:00000000:00000000:00000000
>      MSRs:
>       index    -> value           
>       000000ce -> 0000000080000000
>       0000010a -> 000000000d89fd6b
>     Host policy: 41 leaves, 2 MSRs
>      CPUID:
>       leaf     subleaf  -> eax      ebx      ecx      edx     
>       00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>       00000001:ffffffff -> 000a06a4:20800800:77fafbff:bfebfbff
>       00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>       00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
>       00000004:00000001 -> fc004122:03c0003f:0000003f:00000000
>       00000004:00000002 -> fc01c143:03c0003f:000007ff:00000000
>       00000004:00000003 -> fc0fc163:02c0003f:00007fff:00000004
>       00000005:ffffffff -> 00000040:00000040:00000003:11112020
>       00000006:ffffffff -> 00dfcff7:00000002:00000409:00040003

Still ARAT available as per here.

Jan

