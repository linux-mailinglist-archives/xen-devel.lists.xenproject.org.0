Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C531327E115
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.434.1317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVcU-0007f2-15; Wed, 30 Sep 2020 06:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434.1317; Wed, 30 Sep 2020 06:29:41 +0000
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
	id 1kNVcT-0007ec-U1; Wed, 30 Sep 2020 06:29:41 +0000
Received: by outflank-mailman (input) for mailman id 434;
 Wed, 30 Sep 2020 06:29:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNVcS-0007eW-Db
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:29:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7356a049-4fba-4e28-bebc-f972c62359e2;
 Wed, 30 Sep 2020 06:29:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09FF2AD32;
 Wed, 30 Sep 2020 06:29:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNVcS-0007eW-Db
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:29:40 +0000
X-Inumbo-ID: 7356a049-4fba-4e28-bebc-f972c62359e2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7356a049-4fba-4e28-bebc-f972c62359e2;
	Wed, 30 Sep 2020 06:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601447379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RJyQwhZhgVBiUAc+DNq+5I4lkpdCsYgSYqeGPQq3dg=;
	b=cMVAxaU/9FKo36C7w3pR7yWQw5m8UoJG6QCqxuDWXep1unPBTIASyOHTnKDoZ/LoeR924S
	7eEHqiHRrHZkki1ilWQnWY1yviYYuYrwnZJHBwi19BCgojw0OnxELOlDgB+91IpIXRwag4
	6+GVNl/yMx6R7h/u2T2JNigIWQdIWmg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 09FF2AD32;
	Wed, 30 Sep 2020 06:29:39 +0000 (UTC)
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
Message-ID: <b140fe08-c1cb-775d-73a5-52ac2d2d3518@suse.com>
Date: Wed, 30 Sep 2020 08:29:39 +0200
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

In the interdomain case you mean?

>> The field gets updated by
>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
>> i.e. the two reads may observe two different values. While the 2nd use
>> could - afaict - in principle be replaced by q->priority, I think
>> evtchn_set_priority() should acquire the per-channel lock in any event.
> 
> ... so how is this going to help?

Indeed, this will require more thought then.

Jan

