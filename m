Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2E927C2E9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.21.97 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDHU-0005jX-Ia; Tue, 29 Sep 2020 10:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21.97; Tue, 29 Sep 2020 10:54:48 +0000
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
	id 1kNDHU-0005j8-F5; Tue, 29 Sep 2020 10:54:48 +0000
Received: by outflank-mailman (input) for mailman id 21;
 Tue, 29 Sep 2020 10:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNDHT-0005j3-19
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:54:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb8b93b-18be-4643-a8bc-83ea0c5b6fa4;
 Tue, 29 Sep 2020 10:54:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FA25AF3D;
 Tue, 29 Sep 2020 10:54:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNDHT-0005j3-19
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:54:47 +0000
X-Inumbo-ID: ebb8b93b-18be-4643-a8bc-83ea0c5b6fa4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ebb8b93b-18be-4643-a8bc-83ea0c5b6fa4;
	Tue, 29 Sep 2020 10:54:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601376885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31qGixsXSBuSp1VmiCoWdpsPrUq0aHTCCvmxhQWFeJU=;
	b=M2MVxnjJ2jmLo0gJXfkUFep+7D13aLeT43zKUO7MZNodW/d8IbnugPL5zWr93oncrPdywd
	SSaO1gs3cxkKXtKeCO1YcrxcLB/uTSl2aiRUa+5IUiOpIHTWeWwqIMExZ6szV0VT4byFXZ
	DiWEkjZsVO6SsbImzSOVLP+RFKxopdM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5FA25AF3D;
	Tue, 29 Sep 2020 10:54:45 +0000 (UTC)
Subject: Re: [PATCH 03/12] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <1bf3959d-c097-f8ef-cce4-3a325d0984c4@suse.com>
 <895e7361-4d63-15b8-76c1-84ea39051b68@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <882edfa8-c2b5-accd-f1eb-fc625aa43439@suse.com>
Date: Tue, 29 Sep 2020 12:54:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <895e7361-4d63-15b8-76c1-84ea39051b68@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 12:16, Julien Grall wrote:
> On 28/09/2020 11:57, Jan Beulich wrote:
>> While there don't look to be any problems with this right now, the lock
>> order implications from holding the lock can be very difficult to follow
>> (and may be easy to violate unknowingly).
> 
> I think this is a good idea given that we are disabling interrupts now. 
> Unfortunately...
> 
>> The present callbacks don't
>> (and no such callback should) have any need for the lock to be held.
> 
> ... I think the lock is necessary for the vm_event subsystem to avoid 
> racing with the vm_event_disable().
> 
> The notification callback will use a data structure that is freed by 
> vm_event_disable(). There is a lock, but it is part of the data structure...

Oh, indeed - somehow I didn't spot this despite looking there.

> One solution would be to have the lock outside of the data structure.

I don't think that's viable - the structures are intentionally
separated from struct vcpu. I see two other options: Either free
the structure via call_rcu(), or maintain a count of in-progress
calls, and wait for it to drop to zero when closing the port.

VM event maintainers / reviewers - what are your thoughts here?

Jan

