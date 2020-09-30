Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB527EA17
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704.2359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcKA-0003Q3-SS; Wed, 30 Sep 2020 13:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704.2359; Wed, 30 Sep 2020 13:39:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcKA-0003Pb-PD; Wed, 30 Sep 2020 13:39:14 +0000
Received: by outflank-mailman (input) for mailman id 704;
 Wed, 30 Sep 2020 13:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSKT=DH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kNcK8-0003PO-Uo
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:39:13 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7896829-2002-4ee4-822c-b1816c574fd3;
 Wed, 30 Sep 2020 13:39:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y2so2175309lfy.10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 06:39:12 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b7sm196832lfi.123.2020.09.30.06.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:39:10 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XSKT=DH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kNcK8-0003PO-Uo
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:39:13 +0000
X-Inumbo-ID: a7896829-2002-4ee4-822c-b1816c574fd3
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7896829-2002-4ee4-822c-b1816c574fd3;
	Wed, 30 Sep 2020 13:39:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y2so2175309lfy.10
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gYYiQVB5bAau0SLe67LyF0f3OKYgxH8Mgav77ILWZBA=;
        b=QpUHEc8FK3whsyID6ND5DdCe7Iw9+oXC1RM2OyRkVtdB1QzaXrt8CMGg6t17u7+7c+
         FbnW1NX6DlJzVrKPZQgSzdLdXwJhKL/oVR8jpd34BGtXnfgf6fKG0Aok1FZ25wJPN5zg
         OudC4NAFv/K+Gxby+Smg362JqvzIoHBT/lqMZ8lQu9NAOhuVQq1GCTTMpOHFLZyu1fZy
         jFcvfTC9ZP5/jcYvi5KqPuwBxAZ4S7lZyScJ5coVFxVntlLop0MfpaRh6XZsHCUKH9gX
         lLiwy4a8816HeLUai03bVBs4fXFjBPYW7wFU82bUzwgKqGdawFg9UCXfmV+8KRSgTN2p
         6zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gYYiQVB5bAau0SLe67LyF0f3OKYgxH8Mgav77ILWZBA=;
        b=blv8ddrwHEbcAVZNYpsDaOFBt9RddfyfBbIIoanDO75ydy78MgfPvB1Jf6os8venzR
         uGLnskvuIQxSQGRx/EMS/msDCQ26oDMg5pUKRcLzQhpISWkQ6JFcXDZJBEtqR9R4z05E
         C5CBNl5RyIoOGowD4KfbLJse7TiQDqjrQCqqn0FyUKLpEjCFOPXZPzuRDgx50b2ycFJi
         CpWgzSLd+ovG7ufeF3Ya7dU+HFHeZsKYmgt84Hw8vlIV/dS6TS84uVtWNkqGAwU9dhgc
         yz4lUPcCT1g0cwdvjTh2PVKvhsBsqK0RAw/8PBCdgPASEgDpytwFwiLSMbJSdd6q5vAM
         q51w==
X-Gm-Message-State: AOAM530BVtPi2xAZLx+h3KTNGz56YOiuH/ynJRn6xs2FtsMt3GOEOgcH
	W3nVDy64TR/9RTOBTFxRmbQ=
X-Google-Smtp-Source: ABdhPJzFwf4jfvbaUH4NVC+DFH1MxMC2Yz+APCzy+hGvG3MLQFLg5MDHLDebOrubtGs3bkP+Oz8YIA==
X-Received: by 2002:ac2:4c19:: with SMTP id t25mr940139lfq.503.1601473150782;
        Wed, 30 Sep 2020 06:39:10 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id b7sm196832lfi.123.2020.09.30.06.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 06:39:10 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: 'Julien Grall' <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich'
 <jbeulich@suse.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Wei Liu' <wl@xen.org>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Kevin Tian' <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
 <000201d69314$97bd8fa0$c738aee0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com>
Date: Wed, 30 Sep 2020 16:39:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000201d69314$97bd8fa0$c738aee0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Julien

On 25.09.20 11:19, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 24 September 2020 19:01
>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
>> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Jun Nakajima <jun.nakajima@intel.com>;
>> Kevin Tian <kevin.tian@intel.com>; Tim Deegan <tim@xen.org>; Julien Grall <julien.grall@arm.com>
>> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
>>
>>
>>
>> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
>>> +static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>> +{
>>> +    unsigned int prev_state = STATE_IOREQ_NONE;
>>> +    unsigned int state = p->state;
>>> +    uint64_t data = ~0;
>>> +
>>> +    smp_rmb();
>>> +
>>> +    /*
>>> +     * The only reason we should see this condition be false is when an
>>> +     * emulator dying races with I/O being requested.
>>> +     */
>>> +    while ( likely(state != STATE_IOREQ_NONE) )
>>> +    {
>>> +        if ( unlikely(state < prev_state) )
>>> +        {
>>> +            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
>>> +                     prev_state, state);
>>> +            sv->pending = false;
>>> +            domain_crash(sv->vcpu->domain);
>>> +            return false; /* bail */
>>> +        }
>>> +
>>> +        switch ( prev_state = state )
>>> +        {
>>> +        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
>>> +            p->state = STATE_IOREQ_NONE;
>>> +            data = p->data;
>>> +            break;
>>> +
>>> +        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
>>> +        case STATE_IOREQ_INPROCESS:
>>> +            wait_on_xen_event_channel(sv->ioreq_evtchn,
>>> +                                      ({ state = p->state;
>>> +                                         smp_rmb();
>>> +                                         state != prev_state; }));
>>> +            continue;
>> As I pointed out previously [1], this helper was implemented with the
>> expectation that wait_on_xen_event_channel() will not return if the vCPU
>> got rescheduled.
>>
>> However, this assumption doesn't hold on Arm.
>>
>> I can see two solution:
>>      1) Re-execute the caller
>>      2) Prevent an IOREQ to disappear until the loop finish.
>>
>> @Paul any opinions?
> The ioreq control plane is largely predicated on there being no pending I/O when the state of a server is modified, and it is assumed that domain_pause() is sufficient to achieve this. If that assumption doesn't hold then we need additional synchronization.
>
>    Paul
>
May I please clarify whether a concern still stands (with what was said 
above) and we need an additional synchronization on Arm?


-- 
Regards,

Oleksandr Tyshchenko


