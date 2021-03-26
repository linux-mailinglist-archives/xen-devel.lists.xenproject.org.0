Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173F34ACDC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 17:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101962.195347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpgu-00087h-RG; Fri, 26 Mar 2021 16:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101962.195347; Fri, 26 Mar 2021 16:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpgu-00087I-NO; Fri, 26 Mar 2021 16:52:08 +0000
Received: by outflank-mailman (input) for mailman id 101962;
 Fri, 26 Mar 2021 16:52:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPpgt-00087C-Dz
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:52:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3479b7de-f86a-4c81-b1fe-f63e9be29b74;
 Fri, 26 Mar 2021 16:52:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7FBFAD8D;
 Fri, 26 Mar 2021 16:52:05 +0000 (UTC)
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
X-Inumbo-ID: 3479b7de-f86a-4c81-b1fe-f63e9be29b74
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616777526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3NjgERvAkuP3YIKE/7W6VirGEjHonaYPLVNK4bQq9E=;
	b=QlAh2ZER4uw1oAOA0FkYqKRIxXgN1muMkMc48eaxj7Hb0hHfXLHS4yap3ePW5WxYaz9iGw
	wGCy6X3u7WbW36V9CdoYNW+WjurzWhI817T9qS7lUmK1/czAXDOeH/e5SfPDiVNd9FBsq4
	KtrDmb3lPjB6yV0wT4ta94jTSlupWj0=
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
 <24670.3891.328817.908772@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10de7758-fadd-3a04-d0d9-8ec3074ea149@suse.com>
Date: Fri, 26 Mar 2021 17:52:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24670.3891.328817.908772@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 17:43, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH][4.15] x86/HPET: don't enable legacy replacement mode unconditionally"):
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
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks, but with Andrew's pending objection I don't feel like
committing it.

> I have to say that this
> 
>    -    if ( hpet_rate )
>    +    if ( hpet_rate || !hpet_address || !opt_hpet )
>             return hpet_rate;
> 
>    -    if ( hpet_address == 0 )
>    -        return 0;
>    -
> 
> is to my mind quite an obscure coding style.
> 
> Do we really want to return a nozero hpet_rate even if !opt_hpet ?

We won't: hpet_rate will be set to non-zero only further down in
the function.

Jan

