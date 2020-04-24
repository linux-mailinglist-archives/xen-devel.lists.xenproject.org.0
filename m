Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B01B80B0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 22:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS4y5-00046T-Lc; Fri, 24 Apr 2020 20:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YMss=6I=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jS4y3-00045f-Ex
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 20:30:35 +0000
X-Inumbo-ID: 7359aaf6-866a-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7359aaf6-866a-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 20:30:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63A632098B;
 Fri, 24 Apr 2020 20:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587760234;
 bh=34XVNqm5fYpeiInmIqijqkzKtnLoAIHcUKIwyMqVmro=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eir61xWOHQOIedkje6F3WsKeryw6qqQIroTCyKNoSDnHmFdWxzOv9uaAuFGFxq4jR
 mtuA4m6bNTrT5Urj9sfqCpRwG0ER7N++skH7jkgN5tlxYpdiZJ5IJIZNQCWrFPw8te
 XgHfew5fMG5gMrvc83Uk3JT+IC59YvQGpjJIbY2M=
Date: Fri, 24 Apr 2020 13:30:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [[PATCH v3]] xen/guest_access: Harden *copy_to_guest_offset()
 to prevent const dest operand
In-Reply-To: <6ce4afd3-7f03-1083-1057-ed90876f90e0@xen.org>
Message-ID: <alpine.DEB.2.21.2004241328130.7982@sstabellini-ThinkPad-T480s>
References: <20200416112423.25755-1-julien@xen.org>
 <495b74dc-3ee3-ff23-99ce-2fa4a17d57a4@suse.com>
 <6ce4afd3-7f03-1083-1057-ed90876f90e0@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Apr 2020, Julien Grall wrote:
> On 16/04/2020 13:19, Jan Beulich wrote:
> > On 16.04.2020 13:24, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
> > > data to guest handle marked const.
> > > 
> > > Thankfully, no users of the helper will do that. Rather than hoping this
> > > can be caught during review, harden copy_to_guest_offset() so the build
> > > will fail if such users are introduced.
> > > 
> > > There is no easy way to check whether a const is NULL in C99. The
> > > approach used is to introduce an unused variable that is non-const and
> > > assign the handle. If the handle were const, this would fail at build
> > > because without an explicit cast, it is not possible to assign a const
> > > variable to a non-const variable.
> > > 
> > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > with one further remark:
> > 
> > > --- a/xen/include/asm-x86/guest_access.h
> > > +++ b/xen/include/asm-x86/guest_access.h
> > > @@ -87,6 +87,8 @@
> > >   #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
> > >       const typeof(*(ptr)) *_s = (ptr);                   \
> > >       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> > > +    /* Check if the handle is not const */              \
> > > +    void *__maybe_unused _t = (hnd).p;                  \
> > 
> > Not being a native speaker, to me "if" doesn't look appropriate
> > here. I'd use "that" instead, but you may want to confirm this.
> > Overall then maybe "Check that the handle is not for a const type"?
> 
> I am happy with the new suggestion. I will fixup while comitting it.
> 
> I would also need a review from Stefano here also.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

