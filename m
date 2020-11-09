Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B832AC2C9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 18:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22790.49217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBFu-0007nr-7j; Mon, 09 Nov 2020 17:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22790.49217; Mon, 09 Nov 2020 17:47:02 +0000
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
	id 1kcBFu-0007nS-4U; Mon, 09 Nov 2020 17:47:02 +0000
Received: by outflank-mailman (input) for mailman id 22790;
 Mon, 09 Nov 2020 17:47:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kcBFr-0007nN-Ux
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:46:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06fa5825-c4d3-4a73-8ca7-2194af36eb00;
 Mon, 09 Nov 2020 17:46:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kcBFq-0003At-69; Mon, 09 Nov 2020 17:46:58 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kcBFp-0006f1-Ve; Mon, 09 Nov 2020 17:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kcBFr-0007nN-Ux
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:46:59 +0000
X-Inumbo-ID: 06fa5825-c4d3-4a73-8ca7-2194af36eb00
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 06fa5825-c4d3-4a73-8ca7-2194af36eb00;
	Mon, 09 Nov 2020 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ij9A6sVLzDlVzXD0GE/WhDIn4hZvFt9y8rauKAsMoR8=; b=lm3X5KRIsCTsQ6aIT+oHMXaiA+
	PMol+3GEmD9gd+VnwnJIdlVodlulcPc5h5yHEjtGh5JyP/sC00DxAmmoPllNkubOq+vHQIw7NnQq/
	51TlGjWwynC5qqmM2d4AiGh1y8wXdOYf1/IGBLnxURBHPYKTXRwTvc6mZHf+vrvvwsUQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcBFq-0003At-69; Mon, 09 Nov 2020 17:46:58 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kcBFp-0006f1-Ve; Mon, 09 Nov 2020 17:46:58 +0000
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>
Date: Mon, 9 Nov 2020 17:46:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2020 16:48, Jan Beulich wrote:
> On 09.11.2020 17:38, Juergen Gross wrote:
>> Currently the lock for a single event channel needs to be taken with
>> interrupts off, which causes deadlocks in some cases.
>>
>> Rework the per event channel lock to be non-blocking for the case of
>> sending an event and removing the need for disabling interrupts for
>> taking the lock.
>>
>> The lock is needed for avoiding races between event channel state
>> changes (creation, closing, binding) against normal operations (set
>> pending, [un]masking, priority changes).
>>
>> Use a rwlock, but with some restrictions:
>>
>> - Changing the state of an event channel (creation, closing, binding)
>>    needs to use write_lock(), with ASSERT()ing that the lock is taken as
>>    writer only when the state of the event channel is either before or
>>    after the locked region appropriate (either free or unbound).
>>
>> - Sending an event needs to use read_trylock() mostly, in case of not
>>    obtaining the lock the operation is omitted. This is needed as
>>    sending an event can happen with interrupts off (at least in some
>>    cases).
>>
>> - Dumping the event channel state for debug purposes is using
>>    read_trylock(), too, in order to avoid blocking in case the lock is
>>    taken as writer for a long time.
>>
>> - All other cases can use read_lock().
>>
>> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V4:
>> - switch to rwlock
>> - add ASSERT() to verify correct write_lock() usage
>>
>> V3:
>> - corrected a copy-and-paste error (Jan Beulich)
>> - corrected unlocking in two cases (Jan Beulich)
>> - renamed evtchn_read_trylock() (Jan Beulich)
>> - added some comments and an ASSERT() for evtchn_write_lock()
>> - set EVENT_WRITE_LOCK_INC to INT_MIN
>>
>> V2:
>> - added needed barriers
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'll give it overnight for others to possibly comment, but I'd
> like to get this in tomorrow if at all possible.

IIRC, Citrix originally reported the issues. I would like to give them 
an opportunity to test the patches and confirm this effectively fixed 
there issues.

@Roger, @Andrew, could you give a try to confirm this unblock the vm 
event issue?

Cheers,

-- 
Julien Grall

