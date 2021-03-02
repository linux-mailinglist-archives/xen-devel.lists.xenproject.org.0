Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D732A054
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 14:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92337.174231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH4u5-0003HA-IP; Tue, 02 Mar 2021 13:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92337.174231; Tue, 02 Mar 2021 13:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH4u5-0003Gl-Es; Tue, 02 Mar 2021 13:17:33 +0000
Received: by outflank-mailman (input) for mailman id 92337;
 Tue, 02 Mar 2021 13:17:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH4u3-0003Gg-Cx
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 13:17:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8661fcfe-ecfb-407e-b8c4-ebe1983c32f7;
 Tue, 02 Mar 2021 13:17:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8886CABF4;
 Tue,  2 Mar 2021 13:17:29 +0000 (UTC)
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
X-Inumbo-ID: 8661fcfe-ecfb-407e-b8c4-ebe1983c32f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614691049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3YLJ/1TbX5vgLaUMxs+xbO9ahunRESEPXHHc3rxuY4=;
	b=ZFHMWdImzcYvH6ZhCyw6FgCv+N9PKRoaA33IFE+dX+4gjvaj2hvz1lQUC4mahkN0vKtJ5o
	gNkfIZGinu3wupfZMb/AvSgOom1I6uWY8X6E2OwuXpWP2dlLkvpYwac8J6gmuiUxJtqZWl
	94VVLo0aFqnP67xkS+WgoJ9psapTyfw=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Ian Jackson <iwj@xenproject.org>
Cc: Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
 <72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
 <24637.9408.839033.439930@mariner.uk.xensource.com>
 <99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
 <24637.10160.977640.808417@mariner.uk.xensource.com>
 <fb542bda-d25e-b286-400f-dfb54bfe55d4@suse.com>
 <24638.12380.286845.325678@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4cde5206-9c9e-c1fa-ad2e-bc1f16450aca@suse.com>
Date: Tue, 2 Mar 2021 14:17:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24638.12380.286845.325678@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.03.2021 13:32, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>> On 01.03.2021 18:43, Ian Jackson wrote:
>>> Andrew Cooper writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>>>> On 01/03/2021 17:30, Ian Jackson wrote:
>>>>> I'm afraid I don't follow enough of the background here to have an
>>>>> opinion right now.  Can someone explain to me the risks (and,
>>>>> correspondingly, upsides) of the options ?  Sorry to be dim, I don't
>>>>> seem to be firing on all cylinders today.
>>
>> I guess the risk from that patch is no different than that from the
>> patch here. It would merely improve performance for guests using
>> very large GFNs for memory areas needing emulation by qemu, which I
>> suppose originally wasn't expected to be happening in the first place.
>> In fact if I would have been certain there are no side effects of the
>> too narrow GFN representation used so far, I would probably have
>> submitted the patches in reverse order, or even folded them.
> 
> I am still confused.  You are saying that the existing patch, and your
> proposal that you are wanting me to have an opinion on, have the same
> risk.  So, what aspect of the proposed other way of fixing it might
> make me say no ?

Yet another change / yet more code churn for merely improving what
got fixed already. But, oh, there looks to be a misunderstanding
nevertheless - I'm not proposing another way of addressing the
same issue, but instead a performance improvement (for perhaps
just an unlikely case) on top of the fix that you did give your
ack for already. (As said - had I been certain of no aspect that
I might be overlooking, I might have folded that. But I wasn't
certain, and hence I did post the basic fix first / individually.)

Jan

