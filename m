Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E973479C7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 14:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101011.192826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP3ke-0006Cq-B7; Wed, 24 Mar 2021 13:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101011.192826; Wed, 24 Mar 2021 13:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP3ke-0006CT-7U; Wed, 24 Mar 2021 13:40:48 +0000
Received: by outflank-mailman (input) for mailman id 101011;
 Wed, 24 Mar 2021 13:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lP3kc-0006CO-HV
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 13:40:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49c42590-0167-45af-b5bc-b92137048bfc;
 Wed, 24 Mar 2021 13:40:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F05EAD80;
 Wed, 24 Mar 2021 13:40:44 +0000 (UTC)
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
X-Inumbo-ID: 49c42590-0167-45af-b5bc-b92137048bfc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616593244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmWBLwuAjQTD3R0E7Rrg/jNF+8iv7spYDJUONDz4gyc=;
	b=q+04gCb4ZC+NLX4ziaYzBZjGeQi+X5Mi5ioD/Su1FPsQvt+cO5P1bCq6xcM+D9TNCv2ohW
	gI457B2gT2HIOKo6G0iEtFLMDJL9ypcyhzDMsI6UTmk39RjiPL9LTn+TJz5cEPR7dXDBYD
	R0jMIoeu1JvnJIYONxgK/IUZruWKzCY=
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
 <CABfawhmbVyVAf7y6S+4SvdUZKUYe8kg=h-kvLfBzpVZhzquyiw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5666cd15-02c9-6aa8-c8fc-c44c826b14b2@suse.com>
Date: Wed, 24 Mar 2021 14:40:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmbVyVAf7y6S+4SvdUZKUYe8kg=h-kvLfBzpVZhzquyiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 12:37, Tamas K Lengyel wrote:
> On Wed, Mar 24, 2021 at 6:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
>> static PIT clock gating") was reported to cause boot failures on certain
>> AMD Ryzen systems. Until we can figure out what the actual issue there
>> is, skip this new part of HPET setup by default. Introduce a "hpet"
>> command line option to allow enabling this on hardware where it's really
>> needed for Xen to boot successfully (i.e. where the PIT doesn't drive
>> the timer interrupt).
>>
>> Since it makes little sense to introduce just "hpet=legacy-replacement",
>> also allow for a boolean argument as well as "broadcast" to replace the
>> separate "hpetbroadcast" option.
> 
> While having the command line option to control it is fine what would
> really be the best solution is if Xen could figure out when the
> legacy-replacement option is necessary to begin with and enable it on
> its own, even if it's done as a fallback route.

This was the original plan, but no patch has arrived by now. I can
imagine this being due to things being easier to state than to
actually carry out. Plus of course this fallback approach still
isn't ideal - even better would be if we could address the actual
failure. I for one lack sufficient technical data to at least try
to think of possible solutions.

> We'll have issues with
> telling users when the option is needed and when it isn't. I don't
> like the idea of users having to go through a route of "well, let's
> see if Xen boots and if you get this weird crash/reboot add this
> obscure boot option". It's just a bad user experience all around.

I can't see how it's worse than what we've had so far, crashing
during boot _without_ there being any option available.

Jan

