Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHNzKd001mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:58:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33683BB059
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275702.1561457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQc4-0000vA-Ss; Wed, 08 Apr 2026 10:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275702.1561457; Wed, 08 Apr 2026 10:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQc4-0000t9-QA; Wed, 08 Apr 2026 10:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1275702;
 Wed, 08 Apr 2026 10:58:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAQc3-0000t3-MG
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:58:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQc3-001evq-2F
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:58:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d634c6-e002-0a2a0a5209dd-0a2a450bdbdc-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:58:23 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d634ce-bca8-0a2a450b0019-d155d035ed88-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:58:23 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-66e129e457dso6094764a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 03:58:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3c99fc09sm639526266b.17.2026.04.08.03.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 03:58:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775645902; x=1776250702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mP54B1bbFvAPwnzObEpCSH78rhbF3gbAx/8ow8Js+5E=;
        b=l3BA2iHC15B1aYUCZlfL2mfl1nu2IR+ndyZGwY5tmQR6BSxmbEBDV9h0fNQzodAE43
         50hGwZ6Z/jLz5+2ym3ArxSF0L5W0xKZllhc0a4leiymZp2HqQErTwor/OnofVT7jZvWH
         RF1ZeYB5qQiqio37pDqIrcvFhxWCeWkdUegiBtpvBkLoK+7PAv7Cjj4KnsO54sIOIY28
         Dr1KFx5BS69SMuoGC84dKa+8ovID40dIq3Bxo9dZVyn4SkCgMGKVa42v6JMjQ2Zmrcnn
         VtP9+NoLRkleGFdcspf8hsUmvYXz6JLY7DZazVyaH1wL54+ynhbAXW2w5clz1W2vkxYx
         NF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645902; x=1776250702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mP54B1bbFvAPwnzObEpCSH78rhbF3gbAx/8ow8Js+5E=;
        b=UdDBm8hx2Up6cRmxjoeU2Eba9n0IE7+4Bjz0+2stQzOUbwOdjincdLW9wMRFoJb5gZ
         Pa/hfdzDFNoa3l804Ipjo6i+b9niDVHBxlmuYCzHWCMgTb5dIgsbfROayLK5snaakxs+
         /SLgIweMCk/3+4cul91DH3daCpVi9q3fvFGoTu1p6kv0UAvzPm3o+3M1AirvB2ZhFkUz
         b8MuIXvQ7waqcchV31KXFiZz6tHI0rJFIWzagwCdj8+o5PRHFLcSrEx5ckPlv1vkw7me
         HGgTLgyY7VkLjjP/pZxnr4wQAwp2NFr82LejjLG7zaoW8rUOOh71ArPgZu7em97yFhZf
         KOMw==
X-Forwarded-Encrypted: i=1; AJvYcCWJCqKJceLAiMr4roBS0piJCwNzUkT7bY2zwEzErrDZUI4LlMQh9FdDk42aOH+zNokXAX49EijxPu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrnR0Yeq5++ZYnYWmAjr++zr7CcS57+xyEQCUaP3VUXuTbshjE
	KROxAYapXCeO8A+6MK42UM7KLNYVkmEJtMb3Dkwc98dGnC+nMpC/5MJH
X-Gm-Gg: AeBDietNLeuNlurMogO4X74+y6e7VwRSA1z6YUir8bCtPOwJYHHxkT6eZ+J61LMzkGJ
	VHrBrichLtF6dub4jwow/siFLR/QuuXBAXCPIBdzV7RmsYKcg3ns4D8OGm4bQimrwBAJ+v+zg14
	+BgeCBkAKPg16ATz3B5DoNfJM0+JMXtMBB5vdTGKy3xUYezh3iSF5+qshi+5jTScFTaWmNJj1Ow
	ri2sX9KRnmIHg2WGPI5BoIEph/PplPyO2l+qlps3cMJpd9HGA/Y/JOgBjozA0WgOsqe6sQLpxf3
	BSE3bBfGEs9BqTGvweeYeME29Mp8B/MIlNdf0bT8UUrO49OxmMwCoGXeo7LOZIUJpSXFoG3myUj
	8fnbb2UH59/v3yS0IaZbXfZAhUJDPmXCjF+JRh9KSfVLgtNH0vytMhixxRPipu77obOKtrHyjVD
	ICexNLCUU/M/77uW75Urw9am8/v5stVZ6m0sJAK1ldLF79Pf2Rt8SBdkn5QnKFFFBqbZTK7CgY4
	N0=
X-Received: by 2002:a17:907:84d1:b0:b93:a3db:a6b9 with SMTP id a640c23a62f3a-b9c67bbd200mr721739766b.53.1775645902134;
        Wed, 08 Apr 2026 03:58:22 -0700 (PDT)
Message-ID: <e69e8de7-dbcc-4839-bff6-866c3fa50ea2@gmail.com>
Date: Wed, 8 Apr 2026 12:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: allow Xen to use SSTC while hiding it
 from guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <ff0e2e7332d5b887d00ad10caf01952f90f5da5c.1774863161.git.oleksii.kurochko@gmail.com>
 <df6fb4f1-b420-4b5f-90e1-dea9069311bf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <df6fb4f1-b420-4b5f-90e1-dea9069311bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775645903-EF9412A1-18787A9F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5098
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: F33683BB059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 8:41 AM, Jan Beulich wrote:
> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>> @@ -495,6 +498,36 @@ void __init riscv_fill_hwcap(void)
>>           panic("HW capabilities parsing failed: %s\n", failure_msg);
>>       }
>>   
>> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
>> +    {
>> +        printk("SSTC is detected but is supported only for Xen usage not for "
>> +               "a guest\n");
> 
> Please don't wrap format strings. Them going slightly beyond 80 columns is okay.
> Them going much beyond that is a good indication that you want to consider re-
> wording. (Here e.g. "SSTC detected; supported for Xen use, but not for guests".)

I will reword log message in the form you suggested.

> 
> I question though whether something like this needs logging.

It is just a debug reminder that something should be additionally done. 
I will do it dprintk() so it won't appear in release builds.

> 
>> +        /*
>> +         * As SSTC for guest isn't supported it is needed temprorary to:
> 
> Nit: temporary
> 
>> +         *
>> +         * 1. Clear bit RISCV_ISA_EXT_sstc in riscv_isa as theoretuically it
> 
> Nit: theoretically
> 
>> +         *    could be that OpenSBI (it doesn't pass it now) or whatever ran
>> +         *    before Xen will add SSTC to riscv,isa string. This bit clear
>> +         *    won't allow guest to use SSTC extension as vtimer context
>> +         *    switch and restore isn't ready for that.
>> +         */
>> +        __clear_bit(RISCV_ISA_EXT_sstc, riscv_isa);
> 
> Seeing your other series, shouldn't this instead be done without affecting
> riscv_isa? The BUG_ON()s in vtimer.x therefore also look inappropriate.

It is incorrect to use __clear_bit(). What should be used instead is 
__set_bit(), because in the current boot process OpenSBI does not add 
"sstc" to the riscv,isa string. Therefore, we need to set the 
RISCV_ISA_EXT_sstc bit manually.

This change will affect BUG_ON() checks in vtimer.c, which I plan to 
remove. If SSTC is not supported for the guest, there is nothing we can 
do anyway. It might make sense to reintroduce these BUG_ON() checks once 
an unsupported bitmap is implemented [1]. At that point, we could have 
something like the following in the vtimer save and restore context 
functions in vtimer.c:

BUG_ON(!riscv_isa_extension_available(guest_unsupp_bmp, 
RISCV_ISA_EXT_sstc));

On the other hand, using BUG_ON() in the vtimer save and restore 
functions is of limited value. If SSTC support for guests is added in 
the future, these functions will need to be updated anyway, so such 
checks may become redundant.

[1] 
https://lore.kernel.org/xen-devel/007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com/


> 
>> @@ -61,20 +73,7 @@ int reprogram_timer(s_time_t timeout)
>>       if ( deadline <= now )
>>           return 0;
>>   
>> -    /*
>> -     * TODO: When the SSTC extension is supported, it would be preferable to
>> -     *       use the supervisor timer registers directly here for better
>> -     *       performance, since an SBI call and mode switch would no longer
>> -     *       be required.
>> -     *
>> -     *       This would also reduce reliance on a specific SBI implementation.
>> -     *       For example, it is not ideal to panic() if sbi_set_timer() returns
>> -     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
>> -     *       without SSTC we still need an implementation because only the
>> -     *       M-mode timer is available, and it can only be programmed in
>> -     *       M-mode.
>> -     */
>> -    if ( (rc = sbi_set_timer(deadline)) )
>> +    if ( (rc = set_xen_timer(deadline)) )
>>           panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>   
>>       /* Enable timer interrupt */
>> @@ -85,10 +84,17 @@ int reprogram_timer(s_time_t timeout)
>>   
>>   void __init preinit_xen_time(void)
>>   {
>> +    unsigned long tmp;
>> +
>>       if ( acpi_disabled )
>>           preinit_dt_xen_time();
>>       else
>>           panic("%s: ACPI isn't supported\n", __func__);
>>   
>>       boot_clock_cycles = get_cycles();
>> +
>> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
>> +        set_xen_timer = sstc_set_xen_timer;
>> +    else
>> +        set_xen_timer = sbi_set_timer;
>>   }
> 
> Doesn't all of this together eliminate the need for sbi_set_timer as a
> separate global variable?
There's still a need for that SBI-level dispatch. However, sbi_set_timer 
doesn't need to be a global variable (exported from sbi.h). Since the 
only external user after this patch is the time.c, sbi_set_timer could 
be refactored into a plain static internal pointer with a non-static 
wrapper function:

// sbi.c — keep dispatch internal
static int (* __ro_after_init sbi_set_timer_fn)(uint64_t) = 
sbi_set_timer_v01;

int cf_check sbi_set_timer(uint64_t stime_value)
{
     return sbi_set_timer_fn(stime_value);
}

Do you mean this?

Thanks.

~ Oleksii

