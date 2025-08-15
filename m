Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E14B286CC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083831.1443280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0Zj-0005Np-Vi; Fri, 15 Aug 2025 19:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083831.1443280; Fri, 15 Aug 2025 19:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0Zj-0005MG-SY; Fri, 15 Aug 2025 19:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1083831;
 Fri, 15 Aug 2025 19:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un0Zi-0005MA-1B
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:58:54 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4422ce45-7a12-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 21:58:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F9ADA5837B;
 Fri, 15 Aug 2025 19:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C130BC4CEEB;
 Fri, 15 Aug 2025 19:58:49 +0000 (UTC)
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
X-Inumbo-ID: 4422ce45-7a12-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755287931;
	bh=KeZ9nGDPhYIlP7j7m4D88X8oexmsh94FFACn1/Stn3g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BqnLVdZhWdI6EznkMqfVGza6sPY8b/Vl5WCzeJKCfetixvuo7Hco8sJYqdZTLR3bn
	 qGdrn2SIlwVKabyna9JLyqM4G1IvJY2Bfq0ZAJxxSXOGi7YXxJNXNsA0aMxXkUn6QM
	 x01C67zQ4CILOStpKDV0nTugZ8Ad2vw2IpzCzZZALA38YHAGqWmHuqQ1kKOK3enxCI
	 uQ+42KC4Ku+Tmz8RBYzZOKTRnrlq99KM6rCIPKLNKpCltQHgWyi7oE8Pnn0wUIup1o
	 PxJMzau694iez62I3M/kqYDf2xPj6MBnAu+f33/K9FMW3l6zecblOVTNFFjWv211AS
	 KZODOUhxjjP3w==
Date: Fri, 15 Aug 2025 12:58:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Teddy Astie <teddy.astie@vates.tech>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] misra: address Rule 11.1 violation in cmpxchgptr()
In-Reply-To: <53d285af-e7ce-4736-a91a-5893b1773171@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2508151258090.923618@ubuntu-linux-20-04-desktop>
References: <64882f9ee8e470a2633b8b4d0b5c1cd9d1c0a8c7.1755107902.git.dmytro_prokopchuk1@epam.com> <53d285af-e7ce-4736-a91a-5893b1773171@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1824684921-1755287930=:923618"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1824684921-1755287930=:923618
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 14 Aug 2025, Teddy Astie wrote:
> Hello,
> 
> Le 13/08/2025 à 20:07, Dmytro Prokopchuk1 a écrit :
> > Misra Rule 11.1 states: "Conversions shall not be performed between a
> > pointer to a function and any other type."
> >
> > The violation occurs in the macro:
> >      __typeof__(**(ptr)) *const o_ = (o);                                \
> >      __typeof__(**(ptr)) *n_ = (n);                                      \
> >      ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              \
> >                                     (unsigned long)n_, sizeof(*(ptr)))); \
> > })
> > when it is used for handling function pointers of type:
> > typedef void (*)(struct vcpu *, unsigned int).
> > The issue happens because the '__cmpxchg()' function returns an 'unsigned
> > long', which is then converted back into a function pointer, causing a
> > violation of Rule 11.1. In this particular usage, the return value of the
> > macro 'cmpxchgptr()' is not required. To address the violation, the macro
> > has been replaced to discard the return value of '__cmpxchg()', preventing
> > the conversion.
> >
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> > ---
> > Probably separate macro is too much for this single case.
> >
> > And the following will be enought:
> > __cmpxchg(&xen_consumers[i], (unsigned long)NULL, (unsigned long)fn, sizeof(*(&xen_consumers[i])));
> > ---
> >   xen/common/event_channel.c | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > index 67700b050a..2094338b28 100644
> > --- a/xen/common/event_channel.c
> > +++ b/xen/common/event_channel.c
> > @@ -93,6 +93,17 @@ static void cf_check default_xen_notification_fn(
> >           vcpu_wake(v);
> >   }
> >
> > +/*
> > + * A slightly more updated variant of cmpxchgptr() where old value
> > + * is not returned.
> > + */
> > +#define cmpxchgptr_noret(ptr, o, n) ({                  \
> > +    __typeof__(**(ptr)) *const o_ = (o);                \
> > +    __typeof__(**(ptr)) *n_ = (n);                      \
> > +    (void)__cmpxchg(ptr, (unsigned long)o_,             \
> > +                    (unsigned long)n_, sizeof(*(ptr))); \
> > +})
> > +
> >   /*
> >    * Given a notification function, return the value to stash in
> >    * the evtchn->xen_consumer field.
> > @@ -106,9 +117,9 @@ static uint8_t get_xen_consumer(xen_event_channel_notification_t fn)
> >
> >       for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
> >       {
> > -        /* Use cmpxchgptr() in lieu of a global lock. */
> > +        /* Use cmpxchgptr_noret() in lieu of a global lock. */
> >           if ( xen_consumers[i] == NULL )
> > -            cmpxchgptr(&xen_consumers[i], NULL, fn);
> > +            cmpxchgptr_noret(&xen_consumers[i], NULL, fn);
> >           if ( xen_consumers[i] == fn )
> >               break;
> >       }
> 
> AFAICS, Rule 11.1 has a deviation which allows this specific case.
> 
> In docs/misra/deviations.rst
> > * - R11.1
> >   - The conversion from a function pointer to unsigned long or (void \*) does
> >     not lose any information, provided that the target type has enough bits
> >     to store it.
> >   - Tagged as `safe` for ECLAIR.
> 
> Here, we are constructing a function pointer from a unsigned long. I
> assume this rule goes the other way it says, and allow converting a
> unsigned long into a function pointer as long as its value is a valid
> function pointer.

You are right, we should need to update the deviation instead here:


-doc_begin="The conversion from a function pointer to unsigned long or (void *) does not lose any information, provided that the target type has enough bits to store it."
-config=MC3A2.R11.1,casts+={safe,
  "from(type(canonical(__function_pointer_types)))
   &&to(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
   &&relation(definitely_preserves_value)"
}
-doc_end

--8323329-1824684921-1755287930=:923618--

