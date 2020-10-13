Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671CE28D14D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6283.16746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMFx-0008GL-Uq; Tue, 13 Oct 2020 15:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6283.16746; Tue, 13 Oct 2020 15:30:29 +0000
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
	id 1kSMFx-0008Fw-RA; Tue, 13 Oct 2020 15:30:29 +0000
Received: by outflank-mailman (input) for mailman id 6283;
 Tue, 13 Oct 2020 15:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMFv-0008Fq-Uw
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:30:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9a37e76-fe33-475a-9e56-47d37fb2fc9c;
 Tue, 13 Oct 2020 15:30:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDBF0AFB4;
 Tue, 13 Oct 2020 15:30:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMFv-0008Fq-Uw
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:30:27 +0000
X-Inumbo-ID: a9a37e76-fe33-475a-9e56-47d37fb2fc9c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a9a37e76-fe33-475a-9e56-47d37fb2fc9c;
	Tue, 13 Oct 2020 15:30:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602603024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8L/ye6Ivq6ZDftmmpKRBn7rh8rkbJuKib1hoHVa0yw=;
	b=ZauRg+cywz/CtoY6p4DnGOIkxdE6O62clWTxwmJwE/xCCPZNvnsfMUi6sXMzeg6LEoWU1Y
	mvl4gywfBVIYVadG/+VXlQRIzV1X7urQGtNgF/zcJ63H+EeQl/yUzdgvY58m+9JObCXbhD
	95AlmH55GzpeZS+uPM1DCLcuZ5f4cZY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BDBF0AFB4;
	Tue, 13 Oct 2020 15:30:24 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
 <3a15ba70-c6b1-dd07-12fe-f8d7a1e6c4d9@suse.com>
 <68aea3f2-21ef-8fbf-e1ad-c404e69a8b8e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d076369-b21a-6bf6-13f7-36b19469d66b@suse.com>
Date: Tue, 13 Oct 2020 17:30:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <68aea3f2-21ef-8fbf-e1ad-c404e69a8b8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 16:13, Jürgen Groß wrote:
> On 13.10.20 16:02, Jan Beulich wrote:
>> On 12.10.2020 11:27, Juergen Gross wrote:
>>> Currently the lock for a single event channel needs to be taken with
>>> interrupts off, which causes deadlocks in some cases.
>>>
>>> Rework the per event channel lock to be non-blocking for the case of
>>> sending an event and removing the need for disabling interrupts for
>>> taking the lock.
>>>
>>> The lock is needed for avoiding races between sending an event or
>>> querying the channel's state against removal of the event channel.
>>>
>>> Use a locking scheme similar to a rwlock, but with some modifications:
>>>
>>> - sending an event or querying the event channel's state uses an
>>>    operation similar to read_trylock(), in case of not obtaining the
>>>    lock the sending is omitted or a default state is returned
>>
>> And how come omitting the send or returning default state is valid?
> 
> This is explained in the part of the commit message you didn't cite:
> 
> With this locking scheme it is mandatory that a writer will always
> either start with an unbound or free event channel or will end with
> an unbound or free event channel, as otherwise the reaction of a reader
> not getting the lock would be wrong.

Oh, I did read this latter part as something extra to be aware of,
not as this being the correctness guarantee. Could you make the
connection more clear?

Jan

