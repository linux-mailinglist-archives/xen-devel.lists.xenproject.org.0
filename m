Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2A2CF0B4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 16:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44902.80328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klD18-0006YP-AD; Fri, 04 Dec 2020 15:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44902.80328; Fri, 04 Dec 2020 15:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klD18-0006Y0-6P; Fri, 04 Dec 2020 15:29:06 +0000
Received: by outflank-mailman (input) for mailman id 44902;
 Fri, 04 Dec 2020 15:29:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1klD16-0006Xv-Ld
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 15:29:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1klD14-0005Lq-St; Fri, 04 Dec 2020 15:29:02 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1klD14-0006dl-IH; Fri, 04 Dec 2020 15:29:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xv+O3Dg9lMSF5rvurll0ZdkFckixVgK3H+VKj0h2FEU=; b=QT+l22IkuGn5fajKqG1whz4c2b
	fxgPLxt2Tq/4uQGw24HQ9a518q7LFOLv9ahi1brrhtCbOKnmJv7SqSDTeH8/eg9YRi/o3yAluYpLo
	fXSjcn6Dgh3mCSQsLSdtEZoYWggHnSDod3hSblJgPx43f7aQ6ZZeRQ7JLklODe8iuVd4=;
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
 <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5862eb24-d894-455a-13ac-61af54f949e7@xen.org>
Date: Fri, 4 Dec 2020 15:29:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/12/2020 15:21, Tamas K Lengyel wrote:
> On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jan,
>>
>> On 03/12/2020 10:09, Jan Beulich wrote:
>>> On 02.12.2020 22:10, Julien Grall wrote:
>>>> On 23/11/2020 13:30, Jan Beulich wrote:
>>>>> While there don't look to be any problems with this right now, the lock
>>>>> order implications from holding the lock can be very difficult to follow
>>>>> (and may be easy to violate unknowingly). The present callbacks don't
>>>>> (and no such callback should) have any need for the lock to be held.
>>>>>
>>>>> However, vm_event_disable() frees the structures used by respective
>>>>> callbacks and isn't otherwise synchronized with invocations of these
>>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
>>>>> to wait to drop to zero before freeing the port (and dropping the lock).
>>>>
>>>> AFAICT, this callback is not the only place where the synchronization is
>>>> missing in the VM event code.
>>>>
>>>> For instance, vm_event_put_request() can also race against
>>>> vm_event_disable().
>>>>
>>>> So shouldn't we handle this issue properly in VM event?
>>>
>>> I suppose that's a question to the VM event folks rather than me?
>>
>> Yes. From my understanding of Tamas's e-mail, they are relying on the
>> monitoring software to do the right thing.
>>
>> I will refrain to comment on this approach. However, given the race is
>> much wider than the event channel, I would recommend to not add more
>> code in the event channel to deal with such problem.
>>
>> Instead, this should be fixed in the VM event code when someone has time
>> to harden the subsystem.
> 
> I double-checked and the disable route is actually more robust, we
> don't just rely on the toolstack doing the right thing. The domain
> gets paused before any calls to vm_event_disable. So I don't think
> there is really a race-condition here.

The code will *only* pause the monitored domain. I can see two issues:
    1) The toolstack is still sending event while destroy is happening. 
This is the race discussed here.
    2) The implement of vm_event_put_request() suggests that it can be 
called with not-current domain.

I don't see how just pausing the monitored domain is enough here.

Cheers,

-- 
Julien Grall

