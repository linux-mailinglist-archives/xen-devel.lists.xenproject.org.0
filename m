Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AA30893C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 14:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78133.141997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5TWX-0001IU-4t; Fri, 29 Jan 2021 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78133.141997; Fri, 29 Jan 2021 13:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5TWX-0001I5-1M; Fri, 29 Jan 2021 13:09:17 +0000
Received: by outflank-mailman (input) for mailman id 78133;
 Fri, 29 Jan 2021 13:09:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5TWV-0001I0-TK
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 13:09:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66b312ed-c5b6-434a-b310-ef96d78af1e1;
 Fri, 29 Jan 2021 13:09:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52FD7AC41;
 Fri, 29 Jan 2021 13:09:09 +0000 (UTC)
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
X-Inumbo-ID: 66b312ed-c5b6-434a-b310-ef96d78af1e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611925749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xV0erOPMjYUBHIryVvlrAVZadBdb7HdfDjUcO2JiXo=;
	b=LWAaJo0qWmYCVG30RGntzfnVYLi/TGZq3UtyQuFIAu/Xma0RUZn6e7lESMxDNEJKepNU1O
	P/d8CmaFfJ3zJtNImWcJC/f6In++Q5h/lvhW+/0ytztEEa12UvOH6C5ChiRRxhx78yS+rw
	C/APgmm71Xfywb0X++mffCwXTXmYXag=
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Oleksandr <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
 <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
 <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
 <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
 <4da02c52-1866-6eaa-415b-ddd374edc9d9@gmail.com>
 <645c998c-8a63-7f65-1de1-2c9000da4d69@suse.com>
 <92a8fedc-1837-908f-26e5-a5fd7b867853@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a8de722-f095-d084-1f79-033530519d0e@suse.com>
Date: Fri, 29 Jan 2021 14:09:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <92a8fedc-1837-908f-26e5-a5fd7b867853@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 13:06, Oleksandr wrote:
> On 29.01.21 13:54, Jan Beulich wrote:
>> On 29.01.2021 12:37, Oleksandr wrote:
>>> I am wondering do we need to update support.md in the context of IOREQ
>>> status on Arm right now or this could be postponed?
>> I think so, yes. I have to admit I didn't even realize the whole
>> series doesn't make an addition there. I think this wants to be
>> part of this patch here, as without it the code can't be enabled
>> (and hence can't be used, and hence its support status really
>> doesn't matter [yet]).
> Thank you for the clarification.
> The only mention about IOREQ server I managed to find in support.md is 
> "x86/Multiple IOREQ servers"
> with Status: Experimental. Does it match the current state on X86? I am 
> asking because we are considering Tech Preview (which is higher than 
> Experimental)
> on Arm. Now I am wondering how could that be... Or I missed something?

That's a question primarily to Paul, I guess, but I wouldn't
recommend you piggyback on that entry that you've found. You
want IOREQ servers in general (which are an integral part of
x86/HVM), and hence imo you want a separate entry.

Jan

