Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558727E48A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 11:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.508.1645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNY77-0007sx-3a; Wed, 30 Sep 2020 09:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508.1645; Wed, 30 Sep 2020 09:09:29 +0000
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
	id 1kNY77-0007sY-0N; Wed, 30 Sep 2020 09:09:29 +0000
Received: by outflank-mailman (input) for mailman id 508;
 Wed, 30 Sep 2020 09:09:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNY75-0007sT-Ec
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:09:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6cdcc03-982b-4010-a514-f85062369ef9;
 Wed, 30 Sep 2020 09:09:26 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNY70-0005DD-L5; Wed, 30 Sep 2020 09:09:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNY70-0006K0-6R; Wed, 30 Sep 2020 09:09:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNY75-0007sT-Ec
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 09:09:27 +0000
X-Inumbo-ID: d6cdcc03-982b-4010-a514-f85062369ef9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6cdcc03-982b-4010-a514-f85062369ef9;
	Wed, 30 Sep 2020 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=l+CGgoqnpCWqbwDXt4ZKn4jUsLwRZ3pfUyH2A8tOInA=; b=tO4sEIaGozg/H3r6whngH49kVR
	IxvlDo2sTIP8MpEUYqHZcEZI33iGl1Kx9PWU7Vt5ywXXJ6qP0UvuW4fHjCrOsgMoHD5Di2iNuPS5B
	GbtD7DlUChCoKhKGnWPBoKO1Xvyn9mKCuGTpqtDqTIfed4UoryK8y8M9YMhvrdoYFN4Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNY70-0005DD-L5; Wed, 30 Sep 2020 09:09:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNY70-0006K0-6R; Wed, 30 Sep 2020 09:09:22 +0000
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <56faf769-d305-22d3-c3fe-2f9d767f0f07@xen.org>
 <60490a6c-593b-7aed-5e83-b0418500eed2@suse.com>
 <c4de244b-417e-39cb-59b0-dbda7108dc21@xen.org>
 <03d30b08-c0ce-0d24-444d-ec20f3528039@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c3d565e6-0094-557b-6828-8280de68b590@xen.org>
Date: Wed, 30 Sep 2020 10:09:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <03d30b08-c0ce-0d24-444d-ec20f3528039@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/09/2020 07:26, Jan Beulich wrote:
> On 29.09.2020 19:18, Julien Grall wrote:
>> On 29/09/2020 14:37, Jan Beulich wrote:
>>> On 29.09.2020 15:03, Julien Grall wrote:
>>>> I am thinking that it may be easier to hold the write lock when doing
>>>> the update.
>>>
>>> ... perhaps this is indeed better. I have to admit that I never
>>> fully understood the benefit of using spin_barrier() in this code
>>> (as opposed to the use in evtchn_destroy()).
>>
>> I am not entirely sure either. It looks like it is an attempt to make
>> v->virq_to_evtchn[X] visible without holding a lock.
>>
>> Any holder of the lock after spin_barrier() has completed will read 0
>> and not try to use the lock.
> 
> I'm not sure I follow: A holder of the lock is obviously already
> making use of the lock.

My point is the barrier is meant to split the holders of the lock in two 
category:
    - Anyone acquiring the lock before the spin_barrier() completed may 
see either the port open or close.
    - Anyone acquiring the lock after the spin_barrier() completed will 
see a close port.

> Or are you talking of two different locks
> here (recall that before XSA-343 there was just one lock involved
> in sending)?
> 
>> But the update of v->virq_to_evtchn[X] should have used either
>> ACCESS_ONCE() or write_atomic().
> 
> Of course, like in so many other places in the code base.

This is known. What I meant is if we are going to continue to use a 
spin_barrier() (or rw_barrier()), then we should also switch to use 
ACCESS_ONCE()/write_atomic().

Anyway, I think we discussed to acquire the write lock instead. So it 
should not be a concern.

Cheers,

-- 
Julien Grall

