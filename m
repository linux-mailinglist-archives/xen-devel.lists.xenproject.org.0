Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB731D7E9A
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 18:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaij3-0002Cd-68; Mon, 18 May 2020 16:34:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jaij1-0002C7-K6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 16:34:47 +0000
X-Inumbo-ID: 7c237eb4-9925-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c237eb4-9925-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 16:34:46 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Q3jbo6O4LYW6cbIn/QuEaplO4s0geX/mDEzvnfGuEkLEkqNQGsYNrWufn/wWHO63ocU7LJtjE6
 bj7SYEOnEzEnQ1Fio4i4GEoD1sxa77eJpnHzA+ts2SIhr1WME1I93Szf3WnCqEaXpYuWjlUSu/
 f8xmtHaGSq6Owi7eiq/zOubIeaaDlL6UGQ6RNMytn/0H83/Ek1vQSXQlC7iO7VoaIlly53HUzD
 yODUDz2AWZBjTqKdO86rYrhrnporMzDxI8qryRZETviUl0QO27r1nC+VzYDzHlGvCZ81tDOIiC
 qMk=
X-SBRS: 2.7
X-MesageID: 18511119
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18511119"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.47393.798081.764926@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 17:34:41 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 06/18] libxl: write qemu arguments into separate
 xenstore keys
In-Reply-To: <CAKf6xpueM5BXd0ivDHHpq2oRo_T1Uh+zMF0TrrV5u5dVR8DiLQ@mail.gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-7-jandryuk@gmail.com>
 <24258.39310.574582.176081@mariner.uk.xensource.com>
 <CAKf6xpueM5BXd0ivDHHpq2oRo_T1Uh+zMF0TrrV5u5dVR8DiLQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [PATCH v6 06/18] libxl: write qemu arguments into separate xenstore keys"):
> On Mon, May 18, 2020 at 10:20 AM Ian Jackson <ian.jackson@citrix.com> wrote:
> > I think this should be "goto out".  That conforms to standard libxl
> > error handling discipline and avoids future leak bugs etc.
> > libxl__xs_transaction_abort is a no-op with t==NULL.
> >
> > Also, it is not clear to me why you chose to put this outside the
> > transaction loop.  Can you either put it inside the transaction loop,
> > or produce an explanation as to why this approach is race-free...
> 
> I just matched the old code's transaction only around the write.  "vm"
> shouldn't change during runtime, but I can make the changes as you
> suggest.

Ah I see.  I hadn't spotted this duplication.

As there is only one caller of libxl__write_stub_dmargs the messing
about with %d/vm and the transaction and so on could be factored out
and only the actual arg processing made conditional.

I would prefer that, to be honest.  But I don't want to derail this
series at this point by asking you to take on refactorings that I
ought to have asked for sooner.

So I'll take it if you make the new code the way I like it, as I
suggest above.  Maybe it will be refactored later (perhaps even by
me...)

Regards,
Ian.

