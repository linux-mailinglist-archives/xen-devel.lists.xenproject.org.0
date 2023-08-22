Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE37844A4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588534.920054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSe7-0006Dd-MY; Tue, 22 Aug 2023 14:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588534.920054; Tue, 22 Aug 2023 14:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSe7-0006AQ-Jg; Tue, 22 Aug 2023 14:46:15 +0000
Received: by outflank-mailman (input) for mailman id 588534;
 Tue, 22 Aug 2023 14:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ibS=EH=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qYSe6-0006A1-Fk
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:46:14 +0000
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [2607:f8b0:4864:20::d35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38258de-40fa-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 16:46:13 +0200 (CEST)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-79194701ce9so152832939f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 07:46:13 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 o9-20020a639209000000b0056946623d7esm8050500pgd.55.2023.08.22.07.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 07:46:11 -0700 (PDT)
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
X-Inumbo-ID: a38258de-40fa-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692715572; x=1693320372;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HcrzFgjOKNgRJoCpuCt3hagbFqDOGLYwzwCox6Hr+A=;
        b=o9c9P7rNOsruoqrPbIVB+aU3Qcvl77f/uHXxEgzSl1rFQjAoWZd348aQhMZiKLEhrZ
         qa4IeyzeOByT4Ye3ejvW/XJer4nGN9lqht4hjkFH7Co9mjgwpqL+jT4S+WDR/Tlf8g0A
         ubv1WybDsGNuVs0sXlxQeTA+hiPz9/7IfANpzl1r8e9MW3QMXuj3Nkx48y9vtxFWt66F
         +vi7J5StaNe/Ef6MA18svQIFj7s+PwGaXjDzKUw9uDNbLXUsb//fF+TS7ZbrdmzxWO1z
         +NSROPlOrE8SteYSEG2vK2sOPSciHDyPjA9SUMqnvpcwTa7OacbUEYE5ZJIujnouidXK
         vBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692715572; x=1693320372;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HcrzFgjOKNgRJoCpuCt3hagbFqDOGLYwzwCox6Hr+A=;
        b=khwJq6HoM53MxSu8sMtxJE1mIYmUgFIowIb54hj82pLrpI7J6Uxbu/0/MzHeziFb11
         8XlxeVUpLavdVqYpYx2juLMfFdEgRAAVXLu0KJJipooSdTwAy4Y/C96IacE+1LkQJRSw
         /KH6AooWytN/5K0BMmlTx78+46kY4xldb3YLrUqap1xoOB4kaIYPzz6Jps5hWUQ5ndew
         TSdFu1D2gwsDdoHeIPp2lMWuTg8i/4qZ7GK9J2PjQKgLWkJ40IB8UtFnVAmmeZuPZJCO
         O/HOdQlhJdRFqIjo1moM33eHw06G2it2g4Wd6ewM1hBcapX8sUwIlZstTYEgdBQz790N
         LwOg==
X-Gm-Message-State: AOJu0YxRcaTZfdj2x5ShYmgw3sL3Is4zoZDw2L2jhWnrn+A3+y7vl6+M
	el0Q63giWgVxyAg4p9hSqsk=
X-Google-Smtp-Source: AGHT+IEpTwaz8pY4HrN4OoOIXTn7eyeKsX9UF7jIBQgqPUOu28u+k8BxNwq2Zcb4QTcUWhra67fSyQ==
X-Received: by 2002:a05:6e02:1806:b0:349:296c:9b8a with SMTP id a6-20020a056e02180600b00349296c9b8amr14652902ilv.2.1692715571836;
        Tue, 22 Aug 2023 07:46:11 -0700 (PDT)
Message-ID: <11ff64ac-050b-7529-416c-4173b29b17cd@gmail.com>
Date: Tue, 22 Aug 2023 23:46:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <aa422104-be1b-dd6e-8c02-00b90ef2e64c@gmail.com>
 <CABfawh=-cTX8PfQpiT1UCXMKmB_MMy-Oc0YJUDLnU7X8=6vEeg@mail.gmail.com>
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 3/5] x86/hvm: RFC - PROBABLY BROKEN - Defer all
 debugging/monitor actions to {svm,vmx}_inject_event()
In-Reply-To: <CABfawh=-cTX8PfQpiT1UCXMKmB_MMy-Oc0YJUDLnU7X8=6vEeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/22/23 01:34, Tamas K Lengyel wrote:
> On Mon, Aug 21, 2023 at 5:57 PM Jinoh Kang <jinoh.kang.kr@gmail.com> wrote:
>> This is RFC because it probably breaks introspection, as injection replies
>> from the introspection engine will (probably, but I haven't confirmed) trigger
>> new monitor events.
>>
>> First of all, monitoring emulated debug events is a change in behaviour,
>> although IMO it is more of a bugfix than a new feature.  Also, similar changes
>> will happen to other monitored events as we try to unify the
>> intercept/emulation paths.
>>
>> As for the recursive triggering of monitor events, I was considering extending
>> the monitor infrastructure to have a "in monitor reply" boolean which causes
>> hvm_monitor_debug() to ignore the recursive request.
>>
>> Does this plan sound ok, or have I missed something more subtle with monitor
>> handling?
> 
> Sorry but from a monitor perspective this is a no-go. AFAIU injection
> will only happen once the vCPU gets rescheduled after the exit, which
> may take a long time, introducing potentially significant delay.

AFAIU hvm_monitor_debug() call still happens *before* VMEntry when the softirq
processing and actual injection takes place.  vmx_inject_event() is responsible
for queueing an event to the inject slot, not processing what is already
injected.

> The monitor agent itself may need to inject events or alter what gets
> injected, so now it may need to undo the injection of the event from
> where it was called from - if that's even possible.

The monitor still gets the chance to drop the injection; 'rc > 0' from
hvm_monitor_debug() still results in the injection request simply being
ignored.

> I also find the
> change in behavior whereby we would be getting events for emulated
> events on the monitor ring equiavelly problematic, making it very hard
> to reason about the state of the VM on the monitor side. If that could
> be made optional that a monitor user can subscribe to that would be
> fine, but doing so unconditionally is also no-go.

We could use an additional field to 'struct x86_event' to indicate the
source of the injected exception--be it VMExit, emulator, or
monitor-triggered events.  I'd like to hear about Andrew's opinion on
this first, though.

> 
> Tamas

-- 
Sincerely,
Jinoh Kang


