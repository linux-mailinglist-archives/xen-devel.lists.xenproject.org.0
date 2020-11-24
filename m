Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F252C25D1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35912.67572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXZi-0003gs-3P; Tue, 24 Nov 2020 12:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35912.67572; Tue, 24 Nov 2020 12:37:38 +0000
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
	id 1khXZi-0003gT-0X; Tue, 24 Nov 2020 12:37:38 +0000
Received: by outflank-mailman (input) for mailman id 35912;
 Tue, 24 Nov 2020 12:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khXZh-0003gO-5w
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:37:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37d8de65-7865-4798-a96c-d72c1a860a8f;
 Tue, 24 Nov 2020 12:37:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79410AC2D;
 Tue, 24 Nov 2020 12:37:35 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khXZh-0003gO-5w
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:37:37 +0000
X-Inumbo-ID: 37d8de65-7865-4798-a96c-d72c1a860a8f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 37d8de65-7865-4798-a96c-d72c1a860a8f;
	Tue, 24 Nov 2020 12:37:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606221455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCDm5pogy+IZ0lOtJJutBjvsjA+rmanEIHT9rFjFzIA=;
	b=tMLVqdEkp3s5CI2EME+ZaMdeQJVF2J6uYuTJmzh7zATOZ1S7nszblAB1hP2H4QXFokgmCz
	efI8wy2Jk8H7lG5yLNlyxuRIt/fsRZdPhLOlAIAPXCFwAeWhJAeFyhHglPsdeY9FcELYBs
	NFuu/bnr3ygkno4O59wQi/PGYGc7gws=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79410AC2D;
	Tue, 24 Nov 2020 12:37:35 +0000 (UTC)
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
 <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
 <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9017e6a2-2fa0-4093-32a8-a256a58f4a33@suse.com>
Date: Tue, 24 Nov 2020 13:37:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 13:18, Jürgen Groß wrote:
> On 24.11.20 12:42, Jan Beulich wrote:
>> On 24.11.2020 08:01, Juergen Gross wrote:
>>> @@ -94,9 +93,10 @@ struct evtchn
>>>   #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
>>>   #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
>>>       u8  state;             /* ECS_* */
>>> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */
>>
>> I see no reason to use a full byte for this one; in fact I
>> was considering whether it, state, and old_state couldn't
>> share storage (the latest when we run into space issues with
>> this struct). (In this context I'm also observing that
>> old_state could get away with just 2 bits, i.e. all three
>> fields would fit in a single byte.)
> 
> I think doing further compression now isn't really helping. It would
> just add more padding bytes and result in larger code.

I'm not meaning to ask to widen the use of bitfields right now
(unless this helps avoiding holes). But I'd like to not see the
one non-problematic use go away without this really being
necessary.

>> Also for all fields you touch anyway, may I ask that you switch to
>> uint<N>_t or, in the case of "pending", bool?
> 
> Fine with me.
> 
> Would you object to switching the whole structure in this regard?

I didn't dare to suggest you doing so. So no, I wouldn't mind.
However, there's more room then for what some would possibly
call bike shedding: The wider the scope of the conversion you
do the more relevant it'll become that strictly speaking there
ought to be (almost?) no use of fixed width types here, as per
./CODING_STYLE.

Jan

