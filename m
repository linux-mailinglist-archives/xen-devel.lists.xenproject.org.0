Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF027C6F6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108.229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNE8o-0002ss-VM; Tue, 29 Sep 2020 11:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108.229; Tue, 29 Sep 2020 11:49:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNE8o-0002sT-Rh; Tue, 29 Sep 2020 11:49:54 +0000
Received: by outflank-mailman (input) for mailman id 108;
 Tue, 29 Sep 2020 11:49:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNE8n-0002sO-3U
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:49:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d467d62a-099b-474d-a3bb-79c139358bf5;
 Tue, 29 Sep 2020 11:49:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F7B4ACB8;
 Tue, 29 Sep 2020 11:49:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNE8n-0002sO-3U
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:49:53 +0000
X-Inumbo-ID: d467d62a-099b-474d-a3bb-79c139358bf5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d467d62a-099b-474d-a3bb-79c139358bf5;
	Tue, 29 Sep 2020 11:49:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601380191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCUYmd0QZ8YD+beiqU6yzrS2hVYk4KD2SZBqOQqc/sE=;
	b=NJuS389/PqhM7ogZfbjGBCEIOVfaqoAmXV0kyASXvl1owLw1LRZ1i66MmWDSldBTChKMmx
	n145VGLFJE0R/VDIVgKG+QJVFOkQuLZeuHohqjzyIkOx3SPYE88XZk6VsNbyoRoORw3APV
	5n2S0ey0Er3TqXDl5Jy2w/6IzDHnONg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2F7B4ACB8;
	Tue, 29 Sep 2020 11:49:51 +0000 (UTC)
Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the
 per-channel lock
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
 <05977dcd-8283-6022-b183-6a83500f32f6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0969a6a6-bb03-6c4c-7bc1-3182c3f26157@suse.com>
Date: Tue, 29 Sep 2020 13:49:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <05977dcd-8283-6022-b183-6a83500f32f6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 12:21, Julien Grall wrote:
> On 28/09/2020 11:57, Jan Beulich wrote:
>> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
>> two uses of the channel's priority field. The field gets updated by
>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
>> i.e. the two reads may observe two different values. While the 2nd use
>> could - afaict - in principle be replaced by q->priority, I think
>> evtchn_set_priority() should acquire the per-channel lock in any event.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -1132,7 +1132,9 @@ static long evtchn_set_priority(const st
>>   {
>>       struct domain *d = current->domain;
>>       unsigned int port = set_priority->port;
>> +    struct evtchn *chn;
>>       long ret;
>> +    unsigned long flags;
>>   
>>       spin_lock(&d->event_lock);
> 
> Is it still necessary to hold d->event_lock?

Good point - I see no reason for it to be held anymore.

Jan

