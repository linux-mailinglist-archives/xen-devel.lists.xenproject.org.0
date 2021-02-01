Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98330AB4F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79982.146009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b9K-0007qY-OQ; Mon, 01 Feb 2021 15:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79982.146009; Mon, 01 Feb 2021 15:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b9K-0007q9-LL; Mon, 01 Feb 2021 15:29:58 +0000
Received: by outflank-mailman (input) for mailman id 79982;
 Mon, 01 Feb 2021 15:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6b9J-0007px-5B
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:29:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8d9ccc6-4a65-4e07-8520-3501842ef03e;
 Mon, 01 Feb 2021 15:29:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B248B14D;
 Mon,  1 Feb 2021 15:29:55 +0000 (UTC)
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
X-Inumbo-ID: b8d9ccc6-4a65-4e07-8520-3501842ef03e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612193395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ68E43jyhkHfGMTsQG8E0vxVLN8gjNoABSisXJaxCo=;
	b=GTTkoEG/IPXdgXwap0jXm1bPO5y3CafyIYzXDmouBE5JPkWiGa/wDZ9M9pbl7LVsKfN9Kz
	M1vmWi1KZz3srJWdNEWjM9z+s9i6CDYI7YN7aoAnKWgMyzJnYEz9mahuxl9rr6FBRHo5Lb
	rFOlLV4g1N8apj0QtQqig2ahvVH+LDk=
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
 [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
 <0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
 <24600.6974.503961.950273@mariner.uk.xensource.com>
 <aed2dfba-3b1c-7e54-7996-766b100375f9@suse.com>
 <24600.7722.256518.556806@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c09f5d9-22b3-07f6-3af3-ed76c6d15c75@suse.com>
Date: Mon, 1 Feb 2021 16:29:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24600.7722.256518.556806@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.02.2021 16:28, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s [and 1 more messages]"):
>> Oh, this used to be different on prior releases once we were
>> past the full freeze point. Are to intending to allow bug fixes
>> without release ack until the actual release (minus commit
>> moratorium periods, of course), or will this change at some
>> (un?)predictable point?
> 
>>>    Friday 29th January    Feature freeze
>>>
>>>        Patches adding new features should be committed by this date.
>>>        Straightforward bugfixes may continue to be accepted by maintainers.
>>>
>>>    Friday 12th February **tentatve**   Code freeze
>>>
>>>        Bugfixes only, all changes to be approved by the Release Manager.

Oh, looks like I forgot we have three freezes, not two.

> I will send a proper announcement.

Thanks.

Jan

