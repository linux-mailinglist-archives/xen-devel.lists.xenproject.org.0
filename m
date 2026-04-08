Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHDRIaRB1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:53:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D23BB797
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275806.1561518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARSF-0003lZ-3R; Wed, 08 Apr 2026 11:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275806.1561518; Wed, 08 Apr 2026 11:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARSF-0003k8-0p; Wed, 08 Apr 2026 11:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1275806;
 Wed, 08 Apr 2026 11:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wARSD-0003k2-86
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARSC-005mAP-5W
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:52:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d6416f-e002-0a2a0a5209dd-0a2a450bab44-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:52:16 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d6416f-bca8-0a2a450b0019-d1558036c048-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:52:15 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso40338505e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 04:52:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c60a2sm56083002f8f.10.2026.04.08.04.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 04:52:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775649135; x=1776253935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=390u33QAMevrk2QMAkWyTSHaXzPx8xkEYrd6JoNYhG4=;
        b=BKCV6KX1yHGCb3egk4wCOMS0RMoaZMWEMCNwm1Qd1T4g51iyxg8WZPYf3lVZTW69of
         9nyN/VRmVzze60Xtsv+tNKLua+/ivaL7KIEMfIDdMpnDIDc8BfwB4M8b65KNkS8vQay0
         0cGI5aIVABzOMK4i+q2U/aERt4VGBAe9WgfwuoKh+tmz99n58qaUX5SGQ30hO6Pq7WcB
         T2sJkGj+qUhXR2K8w50RX+3U4fpNRXDVyhU+LHGfNX9jSse7xWah5Fqyga1hlrkLDk1T
         tYqcyul0CsfRAi54x8mGEbWasDz2J1CgE3iz0tu6R0shxAE/S3WaTmmNuXH2YDw6lCaW
         1YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649135; x=1776253935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=390u33QAMevrk2QMAkWyTSHaXzPx8xkEYrd6JoNYhG4=;
        b=sefUxinGaFu997bv/E5o3jp1fwSY9JP3YZisUGo7mcobLw8DV5Zcp+jJZsugD7JNJj
         SNh821H+sYs0NimCLr07B4h4iZOp5yEiVlJ8Z2xZy/65Q6oeavRrk49cGkDzUoP3L6iV
         Y4kqqc+QGVfMtOAj4TSvZ9reF/pmeSrGwB6jZicFjkUv+V9J3MEBQDGUhTnlC3wud5H7
         21VFRShVNonl1qOTX0tILSK8mSeyEr3hoFq5zJ6G21eIn2KnUzPX915clDFccWa9cfY6
         ow3Xhnc+d3NlDa5fFyvyngclgrOZwu/KtFMspe/vbN6MXSuOHvTTL3gEn0Kw4ecCWFLP
         A2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWHzevVqHm15Iq2VE1vn9soG8AfbuflEyYlzpYU4kbT6FTVRsPCeoJNJOKtZ/1vbrvEijeijA8gzgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNheSSzJfGh6k+2aDhA3bcXAAmUogKk/Aa8oM8CweJtHmrThox
	2FnjjzCxyil5aM12C72OWqPZXwieQqAFUK4P4IVGp9GriVPnKugnbseB
X-Gm-Gg: AeBDiesguyHru5zd+qncpCWd9j5yGjWLATPZ71lZzDeikq3LGUqLJxVNmIwfGJQtiw5
	LWKahagSpaMgUVcQSXqPLoTtgB/pj8dKYv3ss4did+ZD90nWuJ9I0dw545A1Pq5bD6ZNnIfwMr8
	AC6MLvKXr2IbOwIn8fuYxmz6szBNRtqpEgYhzVwRluAI0RnKeqTtnfEkrySmQJDn1KN6Jpp3gQh
	vE4risC21s4BqpE9ulTqMj7QvEk/LrN3I/I7GsYkYxelji8tpja6IN9RfNEawK6FdJWyBJ9JPq/
	oS/j1PBLiAI0KNc2kfRAkkGpsR4ae4M6+QAhkenWds5xT90V5AxOwsrHYrUrOzbHRWtMRlxcOId
	MMT9UDLin9Z1nLKTzlZn7HaiS5qSzfRxnOxar4m9UTb2RjoZ8sN8Ubt3TrWlxL81gRSjsNjiLpd
	UqEiw3oVd/oR87umZPDemduUVtb1nERd1VTb4ZHlIQwP1VdQfe9Ym4crAs0GblLuI+SNC+CoTYz
	aA=
X-Received: by 2002:a05:600c:6cf:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-488a825003fmr108590255e9.22.1775649135279;
        Wed, 08 Apr 2026 04:52:15 -0700 (PDT)
Message-ID: <1e82905b-21b3-4e1d-ba4e-2616a06b6446@gmail.com>
Date: Wed, 8 Apr 2026 13:52:13 +0200
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
 <e69e8de7-dbcc-4839-bff6-866c3fa50ea2@gmail.com>
 <2830de65-c037-439b-a9ff-bfe6d9cce212@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2830de65-c037-439b-a9ff-bfe6d9cce212@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775649136-17B402A1-B408C682/10/73395122804
X-purgate-type: spam
X-purgate-size: 3041
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB0D23BB797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/26 1:25 PM, Jan Beulich wrote:
> On 08.04.2026 12:58, Oleksii Kurochko wrote:
>> On 4/2/26 8:41 AM, Jan Beulich wrote:
>>> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>>>> @@ -61,20 +73,7 @@ int reprogram_timer(s_time_t timeout)
>>>>        if ( deadline <= now )
>>>>            return 0;
>>>>    
>>>> -    /*
>>>> -     * TODO: When the SSTC extension is supported, it would be preferable to
>>>> -     *       use the supervisor timer registers directly here for better
>>>> -     *       performance, since an SBI call and mode switch would no longer
>>>> -     *       be required.
>>>> -     *
>>>> -     *       This would also reduce reliance on a specific SBI implementation.
>>>> -     *       For example, it is not ideal to panic() if sbi_set_timer() returns
>>>> -     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
>>>> -     *       without SSTC we still need an implementation because only the
>>>> -     *       M-mode timer is available, and it can only be programmed in
>>>> -     *       M-mode.
>>>> -     */
>>>> -    if ( (rc = sbi_set_timer(deadline)) )
>>>> +    if ( (rc = set_xen_timer(deadline)) )
>>>>            panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>>    
>>>>        /* Enable timer interrupt */
>>>> @@ -85,10 +84,17 @@ int reprogram_timer(s_time_t timeout)
>>>>    
>>>>    void __init preinit_xen_time(void)
>>>>    {
>>>> +    unsigned long tmp;
>>>> +
>>>>        if ( acpi_disabled )
>>>>            preinit_dt_xen_time();
>>>>        else
>>>>            panic("%s: ACPI isn't supported\n", __func__);
>>>>    
>>>>        boot_clock_cycles = get_cycles();
>>>> +
>>>> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
>>>> +        set_xen_timer = sstc_set_xen_timer;
>>>> +    else
>>>> +        set_xen_timer = sbi_set_timer;
>>>>    }
>>>
>>> Doesn't all of this together eliminate the need for sbi_set_timer as a
>>> separate global variable?
>> There's still a need for that SBI-level dispatch. However, sbi_set_timer
>> doesn't need to be a global variable (exported from sbi.h). Since the
>> only external user after this patch is the time.c, sbi_set_timer could
>> be refactored into a plain static internal pointer with a non-static
>> wrapper function:
>>
>> // sbi.c — keep dispatch internal
>> static int (* __ro_after_init sbi_set_timer_fn)(uint64_t) =
>> sbi_set_timer_v01;
>>
>> int cf_check sbi_set_timer(uint64_t stime_value)
>> {
>>       return sbi_set_timer_fn(stime_value);
>> }
>>
>> Do you mean this?
> 
> No. Why is it that we'd still need both set_xen_timer and sbi_set_timer
> as distinct variables?

We don't need, it just a question of design I think.

extern int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) could 
be renamed to set_xen_timer.

And then re-init set_xen_timer here in preinit_xen_time() if SSTC is 
available:
   if ( csr_read_safe(CSR_STIMECMP, &tmp) )
      set_xen_timer = sstc_set_xen_timer;

~ Oleksii



