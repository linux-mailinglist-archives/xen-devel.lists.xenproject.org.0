Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D6935FDC3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 00:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110850.211783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnwv-0005n3-Nc; Wed, 14 Apr 2021 22:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110850.211783; Wed, 14 Apr 2021 22:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnwv-0005me-K7; Wed, 14 Apr 2021 22:25:29 +0000
Received: by outflank-mailman (input) for mailman id 110850;
 Wed, 14 Apr 2021 22:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=35og=JL=goodmis.org=rostedt@kernel.org>)
 id 1lWnwu-0005mZ-Lt
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 22:25:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 021aaba3-48f0-4fd2-a6f1-283672b117e3;
 Wed, 14 Apr 2021 22:25:27 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD7EC600CD;
 Wed, 14 Apr 2021 22:25:26 +0000 (UTC)
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
X-Inumbo-ID: 021aaba3-48f0-4fd2-a6f1-283672b117e3
Date: Wed, 14 Apr 2021 18:25:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Giuseppe Eletto  <giuseppe.eletto@edu.unito.it>,
 linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org, Enrico
 Bini <enrico.bini@unito.it>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <20210414182524.0e51a520@gandalf.local.home>
In-Reply-To: <28ac9c046cc521cbaef9c2ff56911cd7b3100ac4.camel@suse.com>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	<20210413114614.4971caff@gandalf.local.home>
	<28ac9c046cc521cbaef9c2ff56911cd7b3100ac4.camel@suse.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Apr 2021 00:11:32 +0200
Dario Faggioli <dfaggioli@suse.com> wrote:

=20
> Yes, basically, we can say that a Xen system has "its own trace-cmd".
> It's called `xentrace`, you run it from Dom0 and you get a (binary)
> file which contains a bunch of events.
>=20
> Not that differently from a trace-cmd's "trace.dat" file, but the
> events in there comes from tracepoints within the hypervisor (which, of
> course, use a different tracing mechanism than ftrace).

Right, that's exactly what the ESX trace did as well.

> > Perhaps we can update trace-cmd agent to work with
> > Xen as well. Does xen implement vsock or some other way to
> > communicate
> > between the guests and the Dom0 kernel?=C2=A0
> > =20
> Not vsock, AFAIK. But we probably can use something else/come up with
> something new.
>=20

Yeah, we would like to have trace-cmd agent work with more than just vsock.
Heck, we could just use networking as well. It's just a bit more overhead.


> > And then on KernelShark,
> > we have a KVM plugin in development that does this. But you can do
> > the same
> > with Xen.
> >  =20
> I think that one of the trickiest aspects would be synchronizing the
> timestamps in the 3 traces.
>=20
> *I guess* that the dom0 trace and the guest traces could at least use
> the PTP algorithm that is currently implemented in the trace-cmd
> patches (but not KVM specific one). For synch'ing the Xen trace with
> them, well, I don't really know... We'd have to think about it. :-P

Really, TSC is the way to go. All you would need to do is to have a way to
map all the TSCs together. Assuming the xen trace has a unmodified TSC, and
you can retrieve all the multipliers and shifts used for each guest, you
then will have a synchronized TSC. Then only one guest or the xen HV needs
to calculate the TSC to nanoseconds, and then have all use that. Probably
would need to be the xen HV as it would be the one without a modified TSC.

-- Steve

