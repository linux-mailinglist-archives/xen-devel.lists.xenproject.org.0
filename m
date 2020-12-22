Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819C2E0B07
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 14:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57860.101430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krhyk-0003aU-9O; Tue, 22 Dec 2020 13:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57860.101430; Tue, 22 Dec 2020 13:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krhyk-0003a5-5n; Tue, 22 Dec 2020 13:45:30 +0000
Received: by outflank-mailman (input) for mailman id 57860;
 Tue, 22 Dec 2020 13:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krhyj-0003a0-Ct
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 13:45:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b155724-1d3a-454f-bad1-4dfe5ef6c525;
 Tue, 22 Dec 2020 13:45:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48CEFB1C2;
 Tue, 22 Dec 2020 13:45:27 +0000 (UTC)
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
X-Inumbo-ID: 7b155724-1d3a-454f-bad1-4dfe5ef6c525
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608644727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7piISWuDwlyJQQ+sseEC12064PAEKVH/Rn56hAAVO5E=;
	b=ELPRDMQG1gxEYOsZHplyJcirxNivha0NLVgk37hpd5izhxEmN7VhEtMwjm/dLUfR0iVm8e
	LWEgZ9KF9AbIiBtfMHnEZUQ9kOAXHP0/sRQ1cqE48F9i8N3+o0LZkIA9vIFJhypz5+KDSv
	rKMBlj/7S0ZSYfRE7QnXoywgH/EvtMQ=
Subject: Re: [PATCH 3/3] xen/evtchn: Clean up teardown handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-4-andrew.cooper3@citrix.com>
 <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
 <683f7808-aad7-1c42-e9e9-3e251e1a4561@citrix.com>
 <5d66a8c9-e3d6-e329-7daf-6b1d0e220e13@suse.com>
 <91ec88c5-fa7b-e700-2466-322dd3db7397@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7dd510f-58bd-213f-922f-fe24df68babe@suse.com>
Date: Tue, 22 Dec 2020 14:45:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <91ec88c5-fa7b-e700-2466-322dd3db7397@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.12.2020 14:33, Andrew Cooper wrote:
> On 22/12/2020 11:52, Jan Beulich wrote:
>> On 22.12.2020 12:28, Andrew Cooper wrote:
>>> On 22/12/2020 10:48, Jan Beulich wrote:
>>>> On 21.12.2020 19:14, Andrew Cooper wrote:
>>>>> First of all, rename the evtchn APIs:
>>>>>  * evtchn_destroy       => evtchn_teardown
>>>>>  * evtchn_destroy_final => evtchn_destroy
>>>> I wonder in how far this is going to cause confusion with backports
>>>> down the road. May I suggest to do only the first of the two renames,
>>>> at least until in a couple of year's time? Or make the second rename
>>>> to e.g. evtchn_cleanup() or evtchn_deinit()?
>>> I considered backports, but I don't think it will be an issue.  The
>>> contents of the two functions are very different, and we're not likely
>>> to be moving the callers in backports.
>> Does the same also apply to the old and new call sites of the functions?
> 
> I don't understand your question.  I don't intend the new callsites to
> ever move again, now they're part of the properly idempotent path, and
> any movement in the older trees would be wrong for anything other than
> backporting this fix, which clearly isn't a backport candidate.
> 
> (That said - there's a memory leak I need to create a backport for...)

My thinking was that call sites of functions also serve as references
or anchors when you do backports. Having identically named functions
with different purposes may be misleading people - both ones doing
backports on a very occasional basis, but also us who may be doing
this regularly, but only on halfway recent trees. I, for one, keep
forgetting to check for bool/true/false when moving to 4.7, or the
-ERESTART <=> -EAGAIN change after 4.4(?). For the former I'll be
saved by the compiler yelling at me, but for the latter one needs to
recognize the need for an adjustment. I'm afraid of the same thing
(granted at a lower probability) potentially happening here, down the
road.

Jan

