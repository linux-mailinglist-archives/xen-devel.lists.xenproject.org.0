Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD31EF660
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhATy-0006Zq-77; Fri, 05 Jun 2020 11:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhATw-0006Zl-5k
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:25:52 +0000
X-Inumbo-ID: 4f2c5748-a71f-11ea-9ad7-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f2c5748-a71f-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 11:25:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id v19so8110081wmj.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dlYTlG/wymsby/4U+vjonCAb2F5ntKKcsWFlhfbgi5I=;
 b=WS09KQ7EsjMBoQrJ/ZgYKD0icqMrZlH2uMwwQ1V0z14uHzqhUHlwSycHxvCnPqEaNV
 MD8pjL8UYBv5yWhsDVCjvyzKnHUKxVNuz+QbP8sO0m6x8EjSEI2bu2dVCjDC969Kz+bL
 bta7ek6CqH3jaUrEF6+VxnrUghfEzbHUWIZ6lAhPKl0EdOoXLSxPfhuXfQKLz//pRcxn
 RFQ5S1bvwfNJNkMBZyM0ZZd5/FkUVtQbnSfv1EhFT/wvFh/a70yHrN42wQknianrTDkF
 f2hPd1peQ4WsIq7PO3H/6rplKsFZNT4EEek1dII6p8ZsyyjlUPDyY0s/EJpxjP7ERZmW
 0aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=dlYTlG/wymsby/4U+vjonCAb2F5ntKKcsWFlhfbgi5I=;
 b=PpeUh7uTFQBg8rGZ+Lm66KuhTA9sfczGNb89OIixVjFtF+GSnnF5vniyXihsN5vD12
 hx4ZWds603TSoj1Snzc8gVcHHgHZMmv09SYuKvJk9HTSN6U/MGp/AphGiR9YHoIOvrHm
 PXvidsBLfzEA0Fg9/g7EK7Br+IPhNjzAyl8AORmPli+baj3gBN6vzG/yHJo41/J9zi/+
 2qR5eZae5EUOas0/Pr9vpQeizsOYLa4ih4pUjP9aw6q6K4L13kysV794dcsgvFI58WOK
 xQe0dlfT0PE5j0NnEEM6y8Cj4z9fFrVcMHbup869kPkzxniGgXd5d6Kp0zq3FOy1ncVc
 G8ag==
X-Gm-Message-State: AOAM531gtFMuYU0IuKQq7LLjJVDHbbL2ReVkExR9aibsyhkNezcAZDNp
 tn/cv6+2mZGUc3gnlkawZGM=
X-Google-Smtp-Source: ABdhPJyJP2N4Y/lD+1IJcoUcakf+Edk6oYfMzMR1pUMbN70kPPRbFXOaj66o/SPsSoCw6F+qt+E/kg==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr2375719wma.118.1591356349822; 
 Fri, 05 Jun 2020 04:25:49 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id j5sm11644078wrq.39.2020.06.05.04.25.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 04:25:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <paul@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
In-Reply-To: <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 12:25:48 +0100
Message-ID: <000701d63b2c$10536930$30fa3b90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjLdCXHS+ot6864srdbAQDyQsvoACJ30jDAXuEodcCsFgQ5AHivRJwAUZxxQAClbGaTqjcVVBw
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 05 June 2020 12:06
> To: 'Jan Beulich' <jbeulich@suse.com>; 'Marek =
Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.com>
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'xen-devel' =
<xen-devel@lists.xenproject.org>
> Subject: RE: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> Sorry, only just catching up with this...
>=20
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 05 June 2020 10:09
> > To: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>; xen-devel =
<xen-devel@lists.xenproject.org>; Paul
> > Durrant <paul@xen.org>
> > Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
> >
> > On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, Jun 04, 2020 at 02:36:26PM +0200, Jan Beulich wrote:
> > >> On 04.06.2020 13:13, Andrew Cooper wrote:
> > >>> On 04/06/2020 08:08, Jan Beulich wrote:
> > >>>> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>>> Then, we get the main issue:
> > >>>>>
> > >>>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >>>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> > >>>>>     (XEN) domain_crash called from io.c:178
> > >>>>>
> > >>>>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor =
its stubdom
> > >>>>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called =
already.
> > >>>> I'd guess an issue with the shutdown deferral logic. Did you / =
can
> > >>>> you check whether XEN_DMOP_remote_shutdown managed to pause all
> > >>>> CPUs (I assume it didn't, since once they're paused there =
shouldn't
> > >>>> be any I/O there anymore, and hence no I/O emulation)?
> > >>>
> > >>> The vcpu in question is talking to Qemu, so will have =
v->defer_shutdown
> > >>> intermittently set, and skip the pause in domain_shutdown()
> > >>>
> > >>> I presume this lack of pause is to allow the vcpu in question to =
still
> > >>> be scheduled to consume the IOREQ reply?  (Its fairly opaque =
logic with
> > >>> 0 clarifying details).
> > >>>
> > >>> What *should* happen is that, after consuming the reply, the =
vcpu should
> > >>> notice and pause itself, at which point it would yield to the
> > >>> scheduler.  This is the purpose of =
vcpu_{start,end}_shutdown_deferral().
> > >>>
> > >>> Evidentially, this is not happening.
> > >>
> > >> We can't tell yet, until ...
> > >>
> > >>> Marek: can you add a BUG() after the weird PIO printing?  That =
should
> > >>> confirm whether we're getting into handle_pio() via the
> > >>> handle_hvm_io_completion() path, or via the vmexit path (at =
which case,
> > >>> we're fully re-entering the guest).
> > >>
> > >> ... we know this. handle_pio() gets called from =
handle_hvm_io_completion()
> > >> after having called hvm_wait_for_io() -> hvm_io_assist() ->
> > >> vcpu_end_shutdown_deferral(), so the issue may be that we =
shouldn't call
> > >> handle_pio() (etc) at all anymore in this state. IOW perhaps
> > >> hvm_wait_for_io() should return =
"!sv->vcpu->domain->is_shutting_down"
> > >> instead of plain "true"?
> > >>
> > >> Adding Paul to Cc, as being the maintainer here.
> > >
> > > Got it, by sticking BUG() just before that domain_crash() in
> > > handle_pio(). And also vcpu 0 of both HVM domains do have
> > > v->defer_shutdown.
> >
> > As per the log they did get it set. I'd be curious of the flag's
> > value (as well as v->paused_for_shutdown's) at the point of the
> > problematic handle_pio() invocation (see below). It may be
> > worthwhile to instrument vcpu_check_shutdown() (inside its if())
> > - before exiting to guest context (in order to then come back
> > and call handle_pio()) the vCPU ought to be getting through
> > there. No indication of it doing so would be a sign that there's
> > a code path bypassing the call to vcpu_end_shutdown_deferral().
> >
> > > (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > > (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> > > (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> > > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > > (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > > (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > > (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> > > (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> > > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > > (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > > (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags =
0x2 d6
> > > (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags =
0x2 d6
> > > (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >
> > Perhaps in this message could you also log
> > v->domain->is_shutting_down, v->defer_shutdown, and
> > v->paused_for_shutdown? (Would be nice if, after having made
> > changes to your debugging patch, you could point again at the
> > precise version you've used for the log provided.)
> >
> > > (XEN) d3v0 Unexpected PIO status 1, port 0xb004 read 0xffff
> > > (XEN) Xen BUG at io.c:178
> >
> > Btw, instead of BUG(), WARN() or dump_execution_state() would
> > likely also do, keeping Xen alive.
> >
>=20
> A shutdown deferral problem would result in X86EMUL_RETRY wouldn't it? =
That would mean we wouldn't be
> seeing the "Unexpected PIO" message. From that message this clearly =
X86EMUL_UNHANDLEABLE which
> suggests a race with ioreq server teardown, possibly due to selecting =
a server but then not finding a
> vcpu match in ioreq_vcpu_list.

Actually looking at remote_shutdown... the test of ( reason =3D=3D =
SHUTDOWN_crash ) and then clearing defer_shutdown looks a bit odd... =
Just because the domain shutdown code has been set that way doesn't mean =
that a vcpu is not deferred in emulation; SCHEDOP_shutdown_code could =
easily be called from one vcpu whilst another has emulation pending.

  Paul

>=20
>   Paul
>=20
> > Jan



