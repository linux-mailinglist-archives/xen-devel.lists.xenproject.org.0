Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97401EF968
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 15:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhCXZ-0003YC-CT; Fri, 05 Jun 2020 13:37:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhCXX-0003Y5-LG
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 13:37:43 +0000
X-Inumbo-ID: bb1239ac-a731-11ea-9ad7-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb1239ac-a731-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 13:37:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id l26so8464581wme.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Xnm6RG1lTRFl8C4lU0Ru25tg/z+eFwYbBvt6kf3Jqkw=;
 b=BthjVa0muG3yXjSU0ZpR3CzXbCwWuZOD4cagqq8MzzM7bi2MZLtSKJDN9S1OrRIv0E
 Y1+lUJGDoR2Zh9YZUQ3BKGPmNBfLfb8JkoiyBWvLAhLNcjdHNZtsXGjF3/DxD7FNR410
 HfP9WNqsQQFF/c97eR8Q1c8Nib54AYBhwrE2+IeL1/dgdej7wgmTAl5xkezn6KMGUoOa
 T/JrRcBgcpya2Q4vNCzWBUnGDJVQstn7LteWx6AMCmMkA4nRFnNjoo2lpTzAXyKgYQS7
 1Aki8r3LhBiADLMTQCya4rJFgjnmerL0boYyshB/RbHZFq7/NbKVctaoATIs/u9iIGnE
 5tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Xnm6RG1lTRFl8C4lU0Ru25tg/z+eFwYbBvt6kf3Jqkw=;
 b=hMZ+Fx1vgK+FEhL8jvoVTe0iZ/7eAciWt9hXabqndXsBevplCQXVoZasFx4roEVxb8
 wVv3X01HyvYtSbURuQzh3PYOobKgRfIVZL6u6hXnX6gJFIEXToF+a3WB0tzvDomiytjH
 O8d3mAclBjLInZxnE/CFlicz+YaA3/q6AlQlBlqOAGcbKKIIC6rvf041AfrISFfCcAey
 E+Q1Eqfqn3MbG/s48m4UtlmWw1YzSLj/zCn0TrraVjKYxOqwTuILNV5bmyH3rgXqILIc
 W/om/39ENRrDbJ6TKrMZLunptHTPmMsi6HlAO6ohjO1mMBH2Nfgf9Nndj0bDK8layZrf
 bLcA==
X-Gm-Message-State: AOAM530tB+MGMNRNSeFNk9GkIQXTLdbclhx887bAVryiH0JxEAo6/jMI
 vBsL6Os9Mnirukh3nHJbSX8=
X-Google-Smtp-Source: ABdhPJygeSuKWH7scO4PI+yarj+iQ6lcV7GxaVwUN142f5582pj7/VUnBRTXvwRusg7t706HXJocvw==
X-Received: by 2002:a1c:143:: with SMTP id 64mr2909215wmb.182.1591364261828;
 Fri, 05 Jun 2020 06:37:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id f9sm11732769wre.65.2020.06.05.06.37.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 06:37:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
In-Reply-To: <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 14:37:39 +0100
Message-ID: <002001d63b3e$7c268a40$74739ec0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjLdCXHS+ot6864srdbAQDyQsvoACJ30jDAXuEodcCsFgQ5AHivRJwAUZxxQAClbGaTgE+0ENsqNKFMYA=
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
 =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 05 June 2020 14:32
> To: paul@xen.org
> Cc: 'Marek Marczykowski-G=C3=B3recki' =
<marmarek@invisiblethingslab.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'xen-devel' =
<xen-devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On 05.06.2020 13:05, Paul Durrant wrote:
> > Sorry, only just catching up with this...
> >
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 05 June 2020 10:09
> >> To: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; xen-devel =
<xen-devel@lists.xenproject.org>; Paul
> >> Durrant <paul@xen.org>
> >> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
> >>
> >> On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Jun 04, 2020 at 02:36:26PM +0200, Jan Beulich wrote:
> >>>> On 04.06.2020 13:13, Andrew Cooper wrote:
> >>>>> On 04/06/2020 08:08, Jan Beulich wrote:
> >>>>>> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>> Then, we get the main issue:
> >>>>>>>
> >>>>>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>>>>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> >>>>>>>     (XEN) domain_crash called from io.c:178
> >>>>>>>
> >>>>>>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor =
its stubdom
> >>>>>>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called =
already.
> >>>>>> I'd guess an issue with the shutdown deferral logic. Did you / =
can
> >>>>>> you check whether XEN_DMOP_remote_shutdown managed to pause all
> >>>>>> CPUs (I assume it didn't, since once they're paused there =
shouldn't
> >>>>>> be any I/O there anymore, and hence no I/O emulation)?
> >>>>>
> >>>>> The vcpu in question is talking to Qemu, so will have =
v->defer_shutdown
> >>>>> intermittently set, and skip the pause in domain_shutdown()
> >>>>>
> >>>>> I presume this lack of pause is to allow the vcpu in question to =
still
> >>>>> be scheduled to consume the IOREQ reply?  (Its fairly opaque =
logic with
> >>>>> 0 clarifying details).
> >>>>>
> >>>>> What *should* happen is that, after consuming the reply, the =
vcpu should
> >>>>> notice and pause itself, at which point it would yield to the
> >>>>> scheduler.  This is the purpose of =
vcpu_{start,end}_shutdown_deferral().
> >>>>>
> >>>>> Evidentially, this is not happening.
> >>>>
> >>>> We can't tell yet, until ...
> >>>>
> >>>>> Marek: can you add a BUG() after the weird PIO printing?  That =
should
> >>>>> confirm whether we're getting into handle_pio() via the
> >>>>> handle_hvm_io_completion() path, or via the vmexit path (at =
which case,
> >>>>> we're fully re-entering the guest).
> >>>>
> >>>> ... we know this. handle_pio() gets called from =
handle_hvm_io_completion()
> >>>> after having called hvm_wait_for_io() -> hvm_io_assist() ->
> >>>> vcpu_end_shutdown_deferral(), so the issue may be that we =
shouldn't call
> >>>> handle_pio() (etc) at all anymore in this state. IOW perhaps
> >>>> hvm_wait_for_io() should return =
"!sv->vcpu->domain->is_shutting_down"
> >>>> instead of plain "true"?
> >>>>
> >>>> Adding Paul to Cc, as being the maintainer here.
> >>>
> >>> Got it, by sticking BUG() just before that domain_crash() in
> >>> handle_pio(). And also vcpu 0 of both HVM domains do have
> >>> v->defer_shutdown.
> >>
> >> As per the log they did get it set. I'd be curious of the flag's
> >> value (as well as v->paused_for_shutdown's) at the point of the
> >> problematic handle_pio() invocation (see below). It may be
> >> worthwhile to instrument vcpu_check_shutdown() (inside its if())
> >> - before exiting to guest context (in order to then come back
> >> and call handle_pio()) the vCPU ought to be getting through
> >> there. No indication of it doing so would be a sign that there's
> >> a code path bypassing the call to vcpu_end_shutdown_deferral().
> >>
> >>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> >>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> >>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> >>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> >>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> >>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> >>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> >>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> >>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> >>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> >>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> >>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> >>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> >>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> >>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags =
0x2 d6
> >>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags =
0x2 d6
> >>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>
> >> Perhaps in this message could you also log
> >> v->domain->is_shutting_down, v->defer_shutdown, and
> >> v->paused_for_shutdown? (Would be nice if, after having made
> >> changes to your debugging patch, you could point again at the
> >> precise version you've used for the log provided.)
> >>
> >>> (XEN) d3v0 Unexpected PIO status 1, port 0xb004 read 0xffff
> >>> (XEN) Xen BUG at io.c:178
> >>
> >> Btw, instead of BUG(), WARN() or dump_execution_state() would
> >> likely also do, keeping Xen alive.
> >>
> >
> > A shutdown deferral problem would result in X86EMUL_RETRY wouldn't =
it?
>=20
> Where would this originate?

I was referring to the 'if ( =
unlikely(!vcpu_start_shutdown_deferral(curr)) )' at the top of =
hvm_send_ioreq().

>=20
> > That would mean we wouldn't be seeing the "Unexpected PIO" message. =
From that message this clearly
> X86EMUL_UNHANDLEABLE which suggests a race with ioreq server teardown, =
possibly due to selecting a
> server but then not finding a vcpu match in ioreq_vcpu_list.
>=20
> I was suspecting such, but at least the tearing down of all servers
> happens only from relinquish-resources, which gets started only
> after ->is_shut_down got set (unless the tool stack invoked
> XEN_DOMCTL_destroydomain without having observed XEN_DOMINF_shutdown
> set for the domain).
>=20
> For individually unregistered servers - yes, if qemu did so, this
> would be a problem. They need to remain registered until all vCPU-s
> in the domain got paused.

It shouldn't be a problem should it? Destroying an individual server is =
only done with the domain paused, so no vcpus can be running at the =
time.

  Paul

>=20
> Jan


