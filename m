Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E127E16A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.437.1328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVoB-0000t3-3E; Wed, 30 Sep 2020 06:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437.1328; Wed, 30 Sep 2020 06:41:47 +0000
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
	id 1kNVoB-0000si-07; Wed, 30 Sep 2020 06:41:47 +0000
Received: by outflank-mailman (input) for mailman id 437;
 Wed, 30 Sep 2020 06:41:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNVo8-0000sd-Vo
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:41:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b95e7a2-6bbb-4055-90ae-8420eb63ce72;
 Wed, 30 Sep 2020 06:41:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F60EABAD;
 Wed, 30 Sep 2020 06:41:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNVo8-0000sd-Vo
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:41:45 +0000
X-Inumbo-ID: 5b95e7a2-6bbb-4055-90ae-8420eb63ce72
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5b95e7a2-6bbb-4055-90ae-8420eb63ce72;
	Wed, 30 Sep 2020 06:41:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601448103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzFdogPWnqHkQzwgsaLtlXEW80q/NbKqGOzTIAiHNEE=;
	b=fgtmVmu+fwQXS/1GDNmfbTrSG6tdHAtEinaMH7If2r7SN46wZ12G+cGmNHuzQF6M1w9rnj
	eqo3/+Y38J67tXvDHPkftwY2Z7dT8rfQ8u3rubCEd6DXBYvDAVHB7tMyr9UQLcLG9w/Lo4
	fAlgWeOlkvaylA07GIdXKB5z0Cxb8DU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6F60EABAD;
	Wed, 30 Sep 2020 06:41:43 +0000 (UTC)
Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the
 per-channel lock
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
 <002301d6967d$f0fc18e0$d2f44aa0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4404072-c49d-6d24-ba3e-8b8f9804d9ca@suse.com>
Date: Wed, 30 Sep 2020 08:41:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <002301d6967d$f0fc18e0$d2f44aa0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 18:31, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 28 September 2020 11:58
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
>> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
>>
>> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
>> two uses of the channel's priority field.
> 
> AFAICT it is invoked with only the sending end's lock held...
> 
>> The field gets updated by
>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
>> i.e. the two reads may observe two different values. While the 2nd use
>> could - afaict - in principle be replaced by q->priority, I think
>> evtchn_set_priority() should acquire the per-channel lock in any event.
>>
> 
> ... so how is this going to help?

I guess the reasoning needs to change here - it should focus solely
on using the finer grained lock here (as holding the per-domain one
doesn't help anyway). It would then be patch 10 which addresses the
(FIFO-specific) concern of possibly reading inconsistent values.

Jan

