Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E72F6486
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67182.119677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04aB-0001xD-Cs; Thu, 14 Jan 2021 15:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67182.119677; Thu, 14 Jan 2021 15:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04aB-0001wV-9A; Thu, 14 Jan 2021 15:30:43 +0000
Received: by outflank-mailman (input) for mailman id 67182;
 Thu, 14 Jan 2021 15:30:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04a9-0001wA-MM
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:30:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b7253e1-561c-48cc-b76d-18b4d47ef2fe;
 Thu, 14 Jan 2021 15:30:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC58FAEBB;
 Thu, 14 Jan 2021 15:30:39 +0000 (UTC)
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
X-Inumbo-ID: 9b7253e1-561c-48cc-b76d-18b4d47ef2fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Aat2KhZGVzT89vwbz4h58pWI6a2e3d1PUhq1Gw6e4=;
	b=hglrONKNCjg1WrHi3yFW1jeKzkB+ODflaT2KK9nOkh2ZORyNF5Ag7ZQvzvyMkvsmMkHQ7E
	TGPUnkA6pJBSccas78TfBSZBi0Oo5deLlNFXlu1Qv4VVWgUKAZj0bXk8ZwS42/7Dx0lM+H
	egjra8qtvH/DhiOV/DqHY6XKI1TtVmE=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
Date: Thu, 14 Jan 2021 16:30:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.01.2021 15:43, Julien Grall wrote:
> On 14/01/2021 14:02, Jan Beulich wrote:
>> It's not overly difficult for a domain to figure out its ID, so
>> requiring the use of DOMID_SELF in a very limited set of places isn't
>> really helpful towards keeping the ID opaque to the guest.
> 
> So I agree that a domid can be figured out really easily today and in 
> principle it would be fine to relax it.
> 
> However, most of the guest OSes will care about running on older Xen 
> versions. Therefore they are not going to be able to use this relaxation.
> 
> So I am not entirely convinced the relaxation is actually worth it for 
> existing hypercalls.

I'm aware of the concern (Andrew has voiced it both here and in
earlier contexts), but personally I think undue restrictions should
not be retained just because they used to be enforced. We've gone
this same route in a few other occasions not overly long ago, and
iirc there are two patches going in a similar direction (different
area of course) that I have still pending and which neither got
ack-ed nor firmly rejected.

> Anyway, if we decide to relax it, then I think we should update the 
> public headers because an OS using this relaxation will not work on 
> older Xen. A developper will not be able to know that without looking at 
> the implementation.

Well, DOMID_SELF exists because that's the preferred form to use.
I can certainly add commentary, but it would feel a little odd to
do so. To be honest I'm also not sure how helpful this is going to
be, considering that consumers often have their own clones of our
headers.

Jan

