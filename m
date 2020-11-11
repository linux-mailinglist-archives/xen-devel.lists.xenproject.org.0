Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF82AEA40
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 08:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24282.51441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kckgl-0005AA-DO; Wed, 11 Nov 2020 07:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24282.51441; Wed, 11 Nov 2020 07:37:07 +0000
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
	id 1kckgl-00059l-9j; Wed, 11 Nov 2020 07:37:07 +0000
Received: by outflank-mailman (input) for mailman id 24282;
 Wed, 11 Nov 2020 07:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kckgk-00059g-72
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:37:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac37dd4e-7cdc-43fb-9c04-76361172de2b;
 Wed, 11 Nov 2020 07:37:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E99EEACB5;
 Wed, 11 Nov 2020 07:37:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kckgk-00059g-72
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:37:06 +0000
X-Inumbo-ID: ac37dd4e-7cdc-43fb-9c04-76361172de2b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ac37dd4e-7cdc-43fb-9c04-76361172de2b;
	Wed, 11 Nov 2020 07:37:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605080221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZGPpPQWd/RqUsbCF9Ic6LnkUqyzWBAcp5xJxKjrV3I=;
	b=jlCGgKLFhIMZYgb98L4XiR6oWNdHpMOkOEUX/murXyIP3nJDz0v7RqdlBIBgcAVzNtKc14
	LD0II9m3Krlw89HRIDUqdKUbus+iCXcWk9iTY+0gY0XrTZDOaqPBSdyXJoy4JANJ1yC1+o
	CBD3GeilIBuY/DFHV1YfihrUFlTdtwI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E99EEACB5;
	Wed, 11 Nov 2020 07:37:00 +0000 (UTC)
Subject: Re: [PATCH] xen/events: fix build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201111054946.3229-1-jgross@suse.com>
 <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>
 <dbd01178-d925-b01c-8624-377a00270a22@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8882494b-0da5-306e-ba2b-e1b7588973ad@suse.com>
Date: Wed, 11 Nov 2020 08:37:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <dbd01178-d925-b01c-8624-377a00270a22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 08:27, Jürgen Groß wrote:
> On 11.11.20 08:20, Jan Beulich wrote:
>> On 11.11.2020 06:49, Juergen Gross wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -61,7 +61,9 @@ static inline void evtchn_write_lock(struct evtchn *evtchn)
>>>   {
>>>       write_lock(&evtchn->lock);
>>>   
>>> +#ifndef NDEBUG
>>>       evtchn->old_state = evtchn->state;
>>> +#endif
>>>   }
>>>   
>>>   static inline void evtchn_write_unlock(struct evtchn *evtchn)
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index 7251b3ae3e..95f96e7a33 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -114,9 +114,7 @@ struct evtchn
>>>           u16 virq;      /* state == ECS_VIRQ */
>>>       } u;
>>>       u8 priority;
>>> -#ifndef NDEBUG
>>>       u8 old_state;      /* State when taking lock in write mode. */
>>> -#endif
>>>       u8 last_priority;
>>>       u16 last_vcpu_id;
>>>   #ifdef CONFIG_XSM
>>
>> Did you mean just either of the two changes (and then the former),
>> not both? If so
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> and I'll be happy to drop the other half for committing.
> 
> The header fix is required for NDEBUG builds, while the other one is
> removing a write with no accompanied read for NDEBUG builds.

Oh, that's because of our absurd ASSERT() implementation in the
NDEBUG case. I stand by my position that the field should not be
there in the first place for release builds. Even more so with
the original patch having got re-based ahead of what was patch 1
of the series, which I did not the least because I want that one
backported urgently, while I continue to be hesitant altogether
about the other one.

I guess the course of action is then to put #ifndef NDEBUG
around the ASSERT() itself, however strange this may look. Or
introduce an evtchn_old_state() wrapper, perhaps returning
ECS_RESERVED in the NDEBUG case. I guess it'll be quicker if I
take your patch and massage it before throwing in, than to have
you make a v2.

Janan

