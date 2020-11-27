Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89892C682B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39541.72469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kif3T-0001Z2-IN; Fri, 27 Nov 2020 14:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39541.72469; Fri, 27 Nov 2020 14:48:59 +0000
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
	id 1kif3T-0001Yg-Ez; Fri, 27 Nov 2020 14:48:59 +0000
Received: by outflank-mailman (input) for mailman id 39541;
 Fri, 27 Nov 2020 14:48:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kif3S-0001Yb-84
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:48:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dfb9086-fb0a-44bf-afcf-371c0ac5d62b;
 Fri, 27 Nov 2020 14:48:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D4B6AC55;
 Fri, 27 Nov 2020 14:48:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kif3S-0001Yb-84
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:48:58 +0000
X-Inumbo-ID: 9dfb9086-fb0a-44bf-afcf-371c0ac5d62b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9dfb9086-fb0a-44bf-afcf-371c0ac5d62b;
	Fri, 27 Nov 2020 14:48:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606488536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmazSFssDUXD5aQuFD5sQTaVVUyogC9qfmDS3M1uctE=;
	b=bQ4OT7GtxBDbAIW4Mz2FOhso3gTCZxwN1nGXOpHHrM9z58OKAtHLO15q5lL8yOoX2RVu9k
	eivE8bFphs2n0ZyQmQ8tSWiUFLslGoFC3avCEtn+xMuI9CyeqbAsG2Xfq8Y2vJeJRM53j/
	3/wlYG3PLvJC7Wbv4vxNowC7jHWjFgE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6D4B6AC55;
	Fri, 27 Nov 2020 14:48:56 +0000 (UTC)
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
 <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
 <a11fb0fc-9a2e-8f9a-5fd3-356c0e0a0f60@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29c8daf7-8af4-df16-716e-113bcc3e96a1@suse.com>
Date: Fri, 27 Nov 2020 15:48:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a11fb0fc-9a2e-8f9a-5fd3-356c0e0a0f60@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 15:39, Jürgen Groß wrote:
> On 27.11.20 15:23, Julien Grall wrote:
>> On 25/11/2020 10:51, Juergen Gross wrote:
>>> --- a/xen/common/event_fifo.c
>>> +++ b/xen/common/event_fifo.c
>>> @@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu 
>>> *v, struct evtchn *evtchn)
>>>           return;
>>>       }
>>> +    /*
>>> +     * Control block not mapped.  The guest must not unmask an
>>> +     * event until the control block is initialized, so we can
>>> +     * just drop the event.
>>> +     */
>>> +    if ( unlikely(!v->evtchn_fifo->control_block) )
>>
>> Sort of unrelated, AFAICT, v->evtchn_fifo->control_block can be set 
>> concurrently to this access.
>>
>> Thankfully, once the control block is mapped, it can't be unmapped. 
>> However, there is still a possibility that you may see half of the update.
>>
>> Shouldn't the field access with ACCESS_ONCE()?
> 
> Shouldn't this be another patch? Especially as the writing side needs
> the same treatment.

Indeed. As said on several different occasions - our code base is
full of places where we chance torn accesses, if there really was
a compiler to let us down on this. This recurring pattern
shouldn't lead to unrelated patches getting bloated, unless _all_
affected sites get touched anyway.

Jan

