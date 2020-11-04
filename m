Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784D2A60FE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18980.44147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFWS-0003Kd-Rc; Wed, 04 Nov 2020 09:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18980.44147; Wed, 04 Nov 2020 09:56:08 +0000
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
	id 1kaFWS-0003KH-OX; Wed, 04 Nov 2020 09:56:08 +0000
Received: by outflank-mailman (input) for mailman id 18980;
 Wed, 04 Nov 2020 09:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaFWR-0003KC-J2
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:56:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id eb1e07be-29bd-4ea4-ac90-862fcc76dd56;
 Wed, 04 Nov 2020 09:56:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05D18AD39;
 Wed,  4 Nov 2020 09:56:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaFWR-0003KC-J2
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:56:07 +0000
X-Inumbo-ID: eb1e07be-29bd-4ea4-ac90-862fcc76dd56
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id eb1e07be-29bd-4ea4-ac90-862fcc76dd56;
	Wed, 04 Nov 2020 09:56:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604483766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7L3rbLKg4H3gEpdFsKTqGAdRHuG1jvorSTQF5dPDJIM=;
	b=bTCBovgt2jnVLJ61h0zDHqKq7mtGvVw8EwnaO/se9gTtOh1/Ama3DygMxrJJLzoW+njTUS
	haoUJ5QEh9nnyn6km0BXNhQDJqm3Zw4PmszQeSvUhRRgKdCEKZQA7Wlry6VKZhoZkSpaEx
	SUXs9fqZC4obwdp/K87M9zgE5/bKhxM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 05D18AD39;
	Wed,  4 Nov 2020 09:56:06 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] xen/evtchn: rework per event channel lock
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-3-jgross@suse.com>
 <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
 <0c39eb60-9843-9659-f7c5-4e2c3e697ee0@suse.com>
 <c77add99-f92e-126a-5a5e-81a2b5983aa0@suse.com>
 <07cc4218-7aa6-2276-32af-559c0db841b5@suse.com>
 <6cf9d927-5e8d-a705-0fac-38f81da07d7e@suse.com>
 <b5ff1e48-1245-5ea7-cf4a-3a198450aa49@suse.com>
 <b0065652-5cae-c57e-dcac-d8948f04cda0@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9017a6fd-35ec-1d66-7a73-7901f64ea64e@suse.com>
Date: Wed, 4 Nov 2020 10:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b0065652-5cae-c57e-dcac-d8948f04cda0@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.11.20 10:50, Julien Grall wrote:
> Hi Juergen,
> 
> On 02/11/2020 15:26, Jürgen Groß wrote:
>> On 02.11.20 16:18, Jan Beulich wrote:
>>> On 02.11.2020 14:59, Jürgen Groß wrote:
>>>> On 02.11.20 14:52, Jan Beulich wrote:
>>>>> On 02.11.2020 14:41, Jürgen Groß wrote:
>>>>>> On 20.10.20 11:28, Jan Beulich wrote:
>>>>>>> On 16.10.2020 12:58, Juergen Gross wrote:
>>>>>>>> @@ -360,7 +352,7 @@ static long 
>>>>>>>> evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>>>>>>>         if ( rc )
>>>>>>>>             goto out;
>>>>>>>> -    flags = double_evtchn_lock(lchn, rchn);
>>>>>>>> +    double_evtchn_lock(lchn, rchn);
>>>>>>>
>>>>>>> This introduces an unfortunate conflict with my conversion of
>>>>>>> the per-domain event lock to an rw one: It acquires rd's lock
>>>>>>> in read mode only, while the requirements here would not allow
>>>>>>> doing so. (Same in evtchn_close() then.)
>>>>>>
>>>>>> Is it a problem to use write mode for those cases?
>>>>>
>>>>> "Problem" can have a wide range of meanings - it's not going to
>>>>> be the end of the world, but I view any use of a write lock as
>>>>> a problem when a read lock would suffice. This can still harm
>>>>> parallelism.
>>>>
>>>> Both cases are very rare ones in the life time of an event channel. I
>>>> don't think you'll ever be able to measure any performance impact from
>>>> switching these case to a write lock for any well behaved guest.
>>>
>>> I agree as far as the lifetime of an individual port goes, but
>>> we're talking about the per-domain lock here. (Perhaps my
>>> choice of context in your patch wasn't the best one, as there
>>> it is the per-channel lock of which two instances get acquired.
>>> I'm sorry if this has lead to any confusion.)
>>
>> Hmm, with the switch to an ordinary rwlock it should be fine to drop
>> the requirement to hold the domain's event channel lock exclusively
>> for taking the per-channel lock as a writer.
> 
> I don't think you can drop d->event_lock. It protects us against 
> allocating new ports while evtchn_reset() is called.

I wrote "exclusively", as in case of a switch to a rwlock it should be
fine to hold it as a reader in case the reset coding takes it as a
writer.

> Without it, you are going to re-open XSA-343.

Yes, of course.


Juergen

