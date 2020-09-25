Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCDE278CE0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 17:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLply-0002u0-6q; Fri, 25 Sep 2020 15:36:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLplw-0002tv-QJ
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 15:36:32 +0000
X-Inumbo-ID: d892be88-c6c3-4ef4-a088-5eadd72664e3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d892be88-c6c3-4ef4-a088-5eadd72664e3;
 Fri, 25 Sep 2020 15:36:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601048187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vfp4iXF0CDopQBe7yaJAku+iQEn0maxwFbemUgqlSVM=;
 b=rgZUPV7p8+/KXKvqXcTLf8ZPC0V2uREMKMukIbx5LHkoEXfqNS0T+5UIEoCjNmY8ysHTf4
 251hX9yAzkG8Q4PoetEnkH03aCn/CI2XpEeqs7ubABMSvLvY+rZ7oD5VE8LtBck1CMJpm4
 X/Jmo3sIpZY0jytqhZqisRgUxA1pW2M=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81199ACB5;
 Fri, 25 Sep 2020 15:36:27 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
Date: Fri, 25 Sep 2020 17:36:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.2020 16:33, Julien Grall wrote:
> On 25/09/2020 14:58, Jan Beulich wrote:
>> On 25.09.2020 15:16, Julien Grall wrote:
>>> Fair enough. I would still like to consider a way where we could avoid
>>> to hack xsm_* because we have the interrupts disabled.
>>
>> Well, from a conceptual pov it's at least questionable for XSM to
>> need any memory allocations at all when merely being asked for
>> permission. And indeed the need for it arises solely from its
>> desire to cache the result, for the sake of subsequent lookups.
>>
>> I also find it odd that there's an XSM check on the send path in
>> the first place. This isn't just because it would seem to me that
>> it should be decided at binding time whether sending is permitted
>> - I may easily be missing something in the conceptual model here.
>> It's also because __domain_finalise_shutdown() too uses
>> evtchn_send(), and I didn't think this one should be subject to
>> any XSM check (just like send_guest_*() aren't).
> 
> Maybe this is the first question we need to answer?

Indeed that was the question I asked myself before putting together
the patch. Yet I have no idea who could answer it, with Daniel
having gone silent for quite long a time now. Hence I didn't even
put up the question, but instead tried to find a halfway reasonable
solution. After all it's not just the master branch which is stuck
right now. And from a backporting perspective having the "fix"
touch code which hasn't had much churn over the last years may even
be beneficial. Plus, as said, the minimal change of making Flask
avoid xmalloc() when IRQs are off is a change that ought to be made
anyway imo, in order to favor proper functioning over performance.

Jan

