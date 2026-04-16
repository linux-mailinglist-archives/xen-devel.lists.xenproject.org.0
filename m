Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJP5LQcF4WkuogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:49:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CF41138D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283724.1565867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOxw-0007SC-UE; Thu, 16 Apr 2026 15:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283724.1565867; Thu, 16 Apr 2026 15:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOxw-0007QW-Rb; Thu, 16 Apr 2026 15:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1283724;
 Thu, 16 Apr 2026 15:49:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDOxv-0007QO-Ht
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:49:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOxu-006M3d-RK
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:49:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e104ed-e002-0a2a0a5209dd-0a2a4504b378-16
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:49:14 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e104fa-1dec-0a2a45040019-d155802eb03a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:49:14 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483487335c2so89868805e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:49:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fa6879c4sm5505e9.26.2026.04.16.08.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 08:49:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776354554; x=1776959354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+YCiCULCXb5S55fi5M74v6vjmP8FtFN2IO158PMUrQ=;
        b=EOrCbiVTjv3JkLFhI8V/GDBztQ3colpS1uqfqJEkumUpRKuM44XfN5Fu68rpXbOtBC
         axnt702Exm+GxA93Yg7UWc5oLsmhJdkkCCk0Qhb7acnvzcNmJdHpoggjlgUZEleuivsE
         2UUf3jlYZGvMMv35fjTpgSJqCgE9PkhNRFxazGf8xTUNLGuQ0zrFkG3XuDr10dYtptaH
         HLrTHgr1jjCX4psJzihvw7e7BXFRWozuzW1odG3kVUCYsfT11UT3HaJbEiM6CiFXv2yy
         ikJcYYlnrT+aoCefygACrCRm12Eg9cIQuR3jr6sddcs2t7z4gvh7LZKVBUe/KlcDVH3M
         XAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776354554; x=1776959354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+YCiCULCXb5S55fi5M74v6vjmP8FtFN2IO158PMUrQ=;
        b=NNr2l3rxMZWLIEAMl07mHuovd5QFc2TaiP3eNbkaaGQbmr1TDy7fWCZwR5LRq6/D1P
         cbF3Mp95bDrXhMQgns1p6p1rxLbdKW0a/rEhEWNFjXDj9rN2pxkdxd/tD1xtMm27MiL3
         UN/UmbehB/D0vnVusft6svn3fCYqWxz/7hhiOvnQADsdN5IKWLPHcMtQO/TivqBjZood
         dl4PoM9qRgw6C9FqW+vOx93rpGyY7TGnHwIRsFObQoQaSVqjtHenQaXqJKw95gPDeW3M
         q348kk3qZBQuWYC4U6rCCuGQs/rzBhZRTXBd58x+bTWKQcAa5WXC+wAsiLfyvlv7NR6D
         Wr4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9xGmYiwsTyT+nqf2PznRLdWpZcLxGJ8dOCXOxv90Q5pDN0J4O64awWwJZMLLoe17Ri9ez0Qor61zg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyszP7R8YZsy6mSrQ/dklyHWKBfubH7POJgj9zd8wb7+Fzp7NL
	hpOGqmzY6v26qEygGayYcCUkltPLH6ckp2e9Gsym6+8wNvJ2YUyP4PJM
X-Gm-Gg: AeBDieudkgI0qd2ocCNMgFKwaBC96KR7+G0nMLrF01BlMal2dirnRRHqFcGaDHPNLPL
	H1U9vpARSehxswkZ+Ap7xHR4e8zT8MbYuRcD/U6BoB7Z/3KcO3MLYPE6ORfA2y3CDE5YluaeYSU
	qJ/HC0leaj5a1FAq+BWpOD0i38gFA9C5GCIPLq8F24cIXGmUsbykQKCDzodWcxT79r8earv7T0F
	uYZRuAayo5/RMFQNv5FleIdR7V+XWkhlCwJJOXTW/oXGljiMGCZK7BWmxrMr7OuHoAxKAbnbzc6
	xeEORePnQm1s/dgh5T07vbsybc81VvPlc4VqHOfjoDkCEhYCkMxKksxC+KYJudjPcVoQxqToVvl
	SU6TLy5ZRas2m2xZLEasMnTZzOfrG2M+TrEw1pa5RsCl5NQdsEXLeN3DNObrViSIkN3ubg+RGUO
	frYRlghs1tZ/Jd57rtUBIE7RXpuBrs3V9gwEUOp95/sJMvyFc7AtS9ufL/IR88zREMYDgAH58GA
	TAwtps0zF81DhNY4yIJBELE
X-Received: by 2002:a05:600c:c0da:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488d685b577mr310909935e9.21.1776354554067;
        Thu, 16 Apr 2026 08:49:14 -0700 (PDT)
Message-ID: <5de7ede4-b14f-4a36-b06b-12bf768b52a8@gmail.com>
Date: Thu, 16 Apr 2026 17:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
 <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
 <3c8cba0b-8d9c-4656-b70e-f5c65017aecc@gmail.com>
 <9579ca3e-e98b-4d76-81bf-0f2e0df5a990@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9579ca3e-e98b-4d76-81bf-0f2e0df5a990@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776354554-2A9623FF-00904EBD/10/73395122804
X-purgate-type: spam
X-purgate-size: 2623
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C6CF41138D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 5:45 PM, Jan Beulich wrote:
> On 16.04.2026 17:37, Oleksii Kurochko wrote:
>>
>>
>> On 4/16/26 9:50 AM, Jan Beulich wrote:
>>> On 10.04.2026 19:41, Andrew Cooper wrote:
>>>> On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
>>>>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>>>>> index 7efa76fdbcb1..80f0e9ddae6a 100644
>>>>> --- a/xen/arch/riscv/time.c
>>>>> +++ b/xen/arch/riscv/time.c
>>>>> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>>>>>            panic("%s: ACPI isn't supported\n", __func__);
>>>>>    
>>>>>        boot_clock_cycles = get_cycles();
>>>>> +
>>>>> +    /* set_xen_timer must have been set by sbi_init() already */
>>>>> +    ASSERT(set_xen_timer);
>>>>> +
>>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>>>>> +    {
>>>>> +        set_xen_timer = sstc_set_xen_timer;
>>>>> +
>>>>> +        /*
>>>>> +         * A VS-timer interrupt becomes pending whenever the value of
>>>>> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
>>>>> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>>>>> +         * ULONG_MAX.
>>>>> +         */
>>>>> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
>>>>> +#ifdef CONFIG_RISCV_32
>>>>> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
>>>>> +#endif
>>>>
>>>> You've got this pattern twice in this patch alone, and these aren't the
>>>> only CSRs which are formed of pairs to get a 64bit value in 32bit mode.
>>>>
>>>> Sadly, the numbering isn't consistent for the high constant, but we can
>>>> let the compiler do most of the hard work for us.
>>>>
>>>> #ifdef CONFIG_RISCV_32
>>>> # define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
>>>> #else
>>>> # define __csr_write32h(csr, val) (void)(csr, val)
>>>
>>> Just to mention: Since the comma is an operator here (not a lexical element
>>> separating function arguments), more parenthesization may be needed for
>>> Misra's sake.
>>
>> I will define it in the next way:
>>
>> # define __csr_write32h(csr, val) (void)((csr), (val))
> 
> Actually, yet more parentheses are needed:
> 
> # define __csr_write32h(csr, val) ((void)((csr), (val)))

It seems like (void) should be for (csr) and (val), so it should be:

# define __csr_write32h(csr, val) ((void)(csr), (void)(val))

Otherwise the following compilation error occurs.

./arch/riscv/include/asm/csr.h:38:48: error: left-hand operand of comma 
expression has no effect [-Werror=unused-value]
    38 | # define __csr_write32h(csr, val) ((void)((csr), (val)))

~ Oleksii

