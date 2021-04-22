Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B8367CF1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115201.219683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZV5A-0007qE-DR; Thu, 22 Apr 2021 08:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115201.219683; Thu, 22 Apr 2021 08:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZV5A-0007pp-9x; Thu, 22 Apr 2021 08:53:08 +0000
Received: by outflank-mailman (input) for mailman id 115201;
 Thu, 22 Apr 2021 08:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZV59-0007pk-Fn
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:53:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fd0ef89-5c54-4332-94ac-d439acb5be0d;
 Thu, 22 Apr 2021 08:53:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DC5DB04F;
 Thu, 22 Apr 2021 08:53:05 +0000 (UTC)
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
X-Inumbo-ID: 0fd0ef89-5c54-4332-94ac-d439acb5be0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619081585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvJVZKIQ7nzqthQNf7Gjf4K0aXrUNPHb1yrWcFsulSo=;
	b=IaX3+o/Luox0mL1UZX83zixbdOI9yCxzgUWjdrXKmvH4DgnZUms+q8Js82HY5fAQK0vftq
	oAaMuZXXPPYIvR/AKH4UNwUT+MjXxD15qIh7TdIvjcCD4iXKrXT9u1YQPcxY9ivpJDhNnN
	uy3ximAQDTa+pFW83gq93Hr563QT59w=
Subject: Re: Ping: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
 <40e90456-90dc-7932-68ec-6f4d0941999f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e19fb4c-4a87-ff80-fa98-fab623d6704f@suse.com>
Date: Thu, 22 Apr 2021 10:53:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <40e90456-90dc-7932-68ec-6f4d0941999f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 17:56, Julien Grall wrote:
> 
> 
> On 21/04/2021 16:23, Jan Beulich wrote:
>> On 27.01.2021 09:13, Jan Beulich wrote:
>>> These are grouped into a series largely because of their origin,
>>> not so much because there are (heavy) dependencies among them.
>>> The main change from v4 is the dropping of the two patches trying
>>> to do away with the double event lock acquires in interdomain
>>> channel handling. See also the individual patches.
>>>
>>> 1: use per-channel lock where possible
>>> 2: convert domain event lock to an r/w one
>>> 3: slightly defer lock acquire where possible
>>> 4: add helper for port_is_valid() + evtchn_from_port()
>>> 5: type adjustments
>>> 6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
>>
>> Only patch 4 here has got an ack so far - may I ask for clear feedback
>> as to at least some of these being acceptable (I can see the last one
>> being controversial, and if this was the only one left I probably
>> wouldn't even ping, despite thinking that it helps reduce unecessary
>> overhead).
> 
> I left feedback for the series one the previous version (see [1]). It 
> would have been nice is if it was mentionned somewhere as this is still 
> unresolved.

I will admit I forgot about the controversy on patch 1. I did, however,
reply to your concerns. What didn't happen is the feedback from others
that you did ask for.

And of course there are 4 more patches here (one of them having an ack,
yes) which could do with feedback. I'm certainly willing, where possible,
to further re-order the series such that controversial changes are at its
end.

Jan

