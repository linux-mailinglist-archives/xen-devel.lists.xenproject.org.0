Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD9C9683B3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 11:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787702.1197140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3iu-0003gl-E6; Mon, 02 Sep 2024 09:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787702.1197140; Mon, 02 Sep 2024 09:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3iu-0003eA-BI; Mon, 02 Sep 2024 09:51:48 +0000
Received: by outflank-mailman (input) for mailman id 787702;
 Mon, 02 Sep 2024 09:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3is-0003e2-He
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 09:51:46 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f696bf51-6910-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 11:51:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so370860866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 02:51:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196babsm535557266b.100.2024.09.02.02.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 02:51:43 -0700 (PDT)
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
X-Inumbo-ID: f696bf51-6910-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725270704; x=1725875504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tSU+D77Bv69moKk9L87ESOnfVHOkQTkuJ7yZ6jomc4=;
        b=Q73QZQ4h0Bkqapz4ne90xmbiNFZxdlRadGrV01oroyHnr32Ly8+I+1380anLEe8hZ3
         Ws/IpnvAnvXo96mt3JAZkeCzHSm+DBjQGbjYaH3tDBr9B8GHqirECTgQo8zHm3zsLGz+
         SHfSkEnmaJv9RNcO0Qco6iBJvupC2wLd0oBOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270704; x=1725875504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tSU+D77Bv69moKk9L87ESOnfVHOkQTkuJ7yZ6jomc4=;
        b=WYVxyn4gSRAJuhrrwIXnH/rRDnlf3ZC6j6dMpQt/+YsVPs3wPUOTOjQ+4dj1HC/bDz
         X2EpiEyf+JtQquLyqIvzUOvp+W8sDBR71mKVlzaGdM+9IJW6ygAJh4LuQ7dyfYS9NkA6
         330uuFrNSCEAaIIYdFz3SE8lBBpdHrNjINwY3AKPl+DxyXOy3pYYoqn59lh3+fl0KP/V
         MtFCT15a/oS00889FCoUZWpQQuiWiXxL9mYauyiuhDfISWI+lUH5ckQeUtk1x7d5QwDT
         JbjZajQyq/XzscQ5nGF4GSIbtnRyQug2z3USCie8HaC/bqNWXeSUV4/Oh3UTCwgHTOdr
         8aHg==
X-Gm-Message-State: AOJu0YwMEmNdH9FP4jwwvP/eulL6BRGs8nlylwvCNmrTJXKpR3tWAzyY
	nHLY+V7x1CNpQHDME4/U45RAxifUj96SuUJJYIuAhPHneA5iRpVSa8BPBhVwcMs=
X-Google-Smtp-Source: AGHT+IHdKVEYjxBweHFPCpAEH/sTp0KUnwc4I7apHD9gBoPAWGSrFViYBRLvRjpwIbisyLvP65qPoQ==
X-Received: by 2002:a17:907:3d8a:b0:a75:23bb:6087 with SMTP id a640c23a62f3a-a89b9555f82mr606034866b.29.1725270703789;
        Mon, 02 Sep 2024 02:51:43 -0700 (PDT)
Message-ID: <e0158b9b-5773-4a41-a362-3acfca2c1ec7@citrix.com>
Date: Mon, 2 Sep 2024 10:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOREQ completions for MMIO writes
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <f4551fc8-d0c0-492c-8ad3-b045843af381@amd.com>
 <f6bfba53-3a17-4da2-ac45-50b7b2175eb2@citrix.com>
 <66fb71e9-c603-4ec9-ab41-9af2a82863f0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <66fb71e9-c603-4ec9-ab41-9af2a82863f0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 10:28 am, Jan Beulich wrote:
> On 29.08.2024 19:31, Andrew Cooper wrote:
>> On 29/08/2024 5:08 pm, Jason Andryuk wrote:
>>> Hi Everyone,
>>>
>>> I've been looking at ioreq latency and pausing of vCPUs.  Specifically
>>> for MMIO (IOREQ_TYPE_COPY) writes, they still need completions:
>>>
>>> static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
>>> {
>>>     return ioreq->state == STATE_IOREQ_READY &&
>>>            !ioreq->data_is_ptr &&
>>>            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>>> }
>>>
>>> state == STATE_IOREQ_READY
>>> data_is_ptr == 0
>>> type == IOREQ_TYPE_COPY
>>> dir == IOREQ_WRITE
>>>
>>> To a completion is needed.  The vCPU remains paused with
>>> _VPF_blocked_in_xen set in paused_flags until the ioreq server
>>> notifies of the completion.
>>>
>>> At least for the case I'm looking, a single write to a mmio register,
>>> it doesn't seem like the vCPU needs to be blocked.  The write has been
>>> sent and subsequent emulation should not depend on it.
>>>
>>> I feel like I am missing something, but I can't think of a specific
>>> example where a write needs to be blocking.  Maybe it simplifies the
>>> implementation, so a subsequent instruction will always have a ioreq
>>> slot available?
>>>
>>> Any insights are appreciated.
>>
>> This is a thorny issue.
>>
>> In x86, MMIO writes are typically posted, but that doesn't mean that the
>> underlying layers can stop tracking the write completely.
>>
>> In your scenario, consider what happens when the same vCPU hits a second
>> MMIO write a few instructions later.  You've now got two IOREQs worth of
>> pending state, only one slot in the "ring", and a wait of an unknown
>> period of time for qemu to process the first.
>>
>>
>> More generally, by not blocking you're violating memory ordering.
>>
>> Consider vCPU0 doing an MMIO write, and vCPU1 doing an MMIO read, and
>> qemu happening to process vCPU1 first.
>>
>> You now have a case where the VM can observe vCPU0 "completing" before
>> vCPU1 starts, yet vCPU1 observing the old value.
>>
>> Other scenarios which exist would be e.g. a subsequent IO hitting STDVGA
>> buffering and being put into the bufioreq ring.  Or the vCPU being able
>> to continue when the "please unplug my emulated disk/network" request is
>> still pending.
> Or, in generalized terms, any writes having side effects.
>
>> In terms of what to do about latency, this is one area where Xen does
>> suffer vs KVM.
>>
>> With KVM, this type of emulation is handled synchronously by an entity
>> on the same logical processor.  With Xen, one LP says "I'm now blocked,
>> schedule something else" without any idea when the IO will even be
>> processed.
>>
>>
>> One crazy idea I had was to look into not de-scheduling the HVM vCPU,
>> and instead going idle by MONITOR-ing the IOREQ slot.
>>
>> This way, Qemu can "resume" the HVM vCPU by simply writing the
>> completion status (and observing some kind of new "I don't need an
>> evtchn" signal).  For a sufficiently quick turnaround, you're also not
>> thrashing the cache by scheduling another vCPU in the meantime.
>>
>> It's definitely more complicated.  For one, you'd need to double the
>> size of an IOREQ slot (currently 32 bytes) to avoid sharing a cacheline
>> with an adjacent vCPU.
> Iirc we talked about moving to a full page per vCPU anyway, back in Prague.
>
> As to more complicated - I'd be curious how you would mean to avoid abuse.
> Even without considering abuse attempts, qemu becoming de-scheduled would
> already look to be problematic as to holding up an MWAITing pCPU for too
> long. Some sensible heuristic towards some form of timeout would likely be
> difficult to come up with (both helping performance and avoiding issues).

Well - the scheduler tick will force the CPU out of MWAIT.  It's not
conceptually different to a vCPU which used its entire timeslice.

But yes, it is not necessarily the most ideal behaviour, but does depend
on circumstances.  e.g. if you're not oversubscribing vCPUs to pCPUs to
begin with, then going to sleep for any length of time is ok.

~Andrew

