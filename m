Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6701EFD65
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 18:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhF2r-0004ap-DZ; Fri, 05 Jun 2020 16:18:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhF2q-0004ak-3t
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 16:18:12 +0000
X-Inumbo-ID: 26058546-a748-11ea-9ad7-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26058546-a748-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 16:18:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D23B895A;
 Fri,  5 Jun 2020 12:18:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 12:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cNG2UD
 3egwVbo9tTRHAs2iT39yp8Hke/mmbnbboAw/s=; b=HRTPaJSMa1fEBOudko3om1
 jBrCdqg8I1xQ4kn1OpdCBqsSbLKmtIADC5zhvsgm7vAU3zfOkGY9zpCPCC3lqwyF
 x5V8/jG1rfHq8JycOdXbbRRIMYIQ7F3NvVCRhTDRmUPO98WPST4cA/AhV6sZS1MZ
 enLdq2pPySAAEgzqUpyh2/OINBLBtc3PXBMuHV4KmbOEZ82Mb2fOLaz+aLK1DR8q
 /5jbTcketQzlmbL2f0di/8xiibVi9fKAZ7AoVZhQDXUnzueTFR5fkDw3BTHPrvG0
 x9SBk5abF43MTPIMui5HUimNdrFZ7Z6YEY3mL9ZCJTdAhI5/ne2uD/CUftgWgZrQ
 ==
X-ME-Sender: <xms:QHDaXvG7f0dGgOJoTaiCVhknLg-S7a2ZNruIUx72wL9PqRVQA72x5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpedkofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhikdcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeu
 feffgfegheeikeeggefhgeevfefhfedttdduudelgeekvdettdeuuefgleeggfenucfkph
 epledurdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhm
X-ME-Proxy: <xmx:QHDaXsWnX7zGrXJgrcjfsFGhDjNJNNQIPB8qc1ysNPwS_WuIXnhF7w>
 <xmx:QHDaXhLFcZxeKv_8AVKgvd6ofOF3HUQMah70yalJQoyiMMfoalIKYA>
 <xmx:QHDaXtGA-mAVuTiqmnmiFOG83knkkRnCPtPHU6u0fFeewaVPQPDfgA>
 <xmx:QXDaXkAuxbtVxzxpq_Xu1Wf3i0Y6d9hjK-1xhj0JxhcQsiCUHg3uGg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24CDC30614FA;
 Fri,  5 Jun 2020 12:18:08 -0400 (EDT)
Date: Fri, 5 Jun 2020 18:18:04 +0200
From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
To: paul@xen.org
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605161804.GJ98582@mail-itl>
References: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
 <002001d63b3e$7c268a40$74739ec0$@xen.org>
 <a418a2ea-f4ff-2b8e-eabf-2622099561f6@suse.com>
 <002e01d63b4f$914b3a90$b3e1afb0$@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LYDt+Tnt2WQ/hIRe"
Content-Disposition: inline
In-Reply-To: <002e01d63b4f$914b3a90$b3e1afb0$@xen.org>
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--LYDt+Tnt2WQ/hIRe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 04:39:56PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 05 June 2020 14:57
> > To: paul@xen.org; 'Marek Marczykowski-G=C3=B3recki' <marmarek@invisible=
thingslab.com>
> > Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'xen-devel' <xen-devel=
@lists.xenproject.org>
> > Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0=
 in stubdom
> >=20
> > On 05.06.2020 15:37, Paul Durrant wrote:
> > >> -----Original Message-----
> > >> From: Jan Beulich <jbeulich@suse.com>
> > >> Sent: 05 June 2020 14:32
> > >> To: paul@xen.org
> > >> Cc: 'Marek Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.c=
om>; 'Andrew Cooper'
> > >> <andrew.cooper3@citrix.com>; 'xen-devel' <xen-devel@lists.xenproject=
=2Eorg>
> > >> Subject: Re: handle_pio looping during domain shutdown, with qemu 4.=
2.0 in stubdom
> > >>
> > >> On 05.06.2020 13:05, Paul Durrant wrote:
> > >>> Sorry, only just catching up with this...
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Jan Beulich <jbeulich@suse.com>
> > >>>> Sent: 05 June 2020 10:09
> > >>>> To: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
> > >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; xen-devel <xen-deve=
l@lists.xenproject.org>; Paul
> > >>>> Durrant <paul@xen.org>
> > >>>> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
> > >>>>
> > >>>> On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>>> On Thu, Jun 04, 2020 at 02:36:26PM +0200, Jan Beulich wrote:
> > >>>>>> On 04.06.2020 13:13, Andrew Cooper wrote:
> > >>>>>>> On 04/06/2020 08:08, Jan Beulich wrote:
> > >>>>>>>> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>>>>>>> Then, we get the main issue:
> > >>>>>>>>>
> > >>>>>>>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >>>>>>>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> > >>>>>>>>>     (XEN) domain_crash called from io.c:178
> > >>>>>>>>>
> > >>>>>>>>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor =
its stubdom
> > >>>>>>>>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called alr=
eady.
> > >>>>>>>> I'd guess an issue with the shutdown deferral logic. Did you /=
 can
> > >>>>>>>> you check whether XEN_DMOP_remote_shutdown managed to pause all
> > >>>>>>>> CPUs (I assume it didn't, since once they're paused there shou=
ldn't
> > >>>>>>>> be any I/O there anymore, and hence no I/O emulation)?
> > >>>>>>>
> > >>>>>>> The vcpu in question is talking to Qemu, so will have v->defer_=
shutdown
> > >>>>>>> intermittently set, and skip the pause in domain_shutdown()
> > >>>>>>>
> > >>>>>>> I presume this lack of pause is to allow the vcpu in question t=
o still
> > >>>>>>> be scheduled to consume the IOREQ reply?  (Its fairly opaque lo=
gic with
> > >>>>>>> 0 clarifying details).
> > >>>>>>>
> > >>>>>>> What *should* happen is that, after consuming the reply, the vc=
pu should
> > >>>>>>> notice and pause itself, at which point it would yield to the
> > >>>>>>> scheduler.  This is the purpose of vcpu_{start,end}_shutdown_de=
ferral().
> > >>>>>>>
> > >>>>>>> Evidentially, this is not happening.
> > >>>>>>
> > >>>>>> We can't tell yet, until ...
> > >>>>>>
> > >>>>>>> Marek: can you add a BUG() after the weird PIO printing?  That =
should
> > >>>>>>> confirm whether we're getting into handle_pio() via the
> > >>>>>>> handle_hvm_io_completion() path, or via the vmexit path (at whi=
ch case,
> > >>>>>>> we're fully re-entering the guest).
> > >>>>>>
> > >>>>>> ... we know this. handle_pio() gets called from handle_hvm_io_co=
mpletion()
> > >>>>>> after having called hvm_wait_for_io() -> hvm_io_assist() ->
> > >>>>>> vcpu_end_shutdown_deferral(), so the issue may be that we should=
n't call
> > >>>>>> handle_pio() (etc) at all anymore in this state. IOW perhaps
> > >>>>>> hvm_wait_for_io() should return "!sv->vcpu->domain->is_shutting_=
down"
> > >>>>>> instead of plain "true"?
> > >>>>>>
> > >>>>>> Adding Paul to Cc, as being the maintainer here.
> > >>>>>
> > >>>>> Got it, by sticking BUG() just before that domain_crash() in
> > >>>>> handle_pio(). And also vcpu 0 of both HVM domains do have
> > >>>>> v->defer_shutdown.
> > >>>>
> > >>>> As per the log they did get it set. I'd be curious of the flag's
> > >>>> value (as well as v->paused_for_shutdown's) at the point of the
> > >>>> problematic handle_pio() invocation (see below). It may be
> > >>>> worthwhile to instrument vcpu_check_shutdown() (inside its if())
> > >>>> - before exiting to guest context (in order to then come back
> > >>>> and call handle_pio()) the vCPU ought to be getting through
> > >>>> there. No indication of it doing so would be a sign that there's
> > >>>> a code path bypassing the call to vcpu_end_shutdown_deferral().
> > >>>>
> > >>>>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > >>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> > >>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> > >>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > >>>>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > >>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > >>>>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > >>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > >>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > >>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> > >>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> > >>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > >>>>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > >>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > >>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0=
x2 d6
> > >>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0=
x2 d6
> > >>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >>>>
> > >>>> Perhaps in this message could you also log
> > >>>> v->domain->is_shutting_down, v->defer_shutdown, and
> > >>>> v->paused_for_shutdown? (Would be nice if, after having made
> > >>>> changes to your debugging patch, you could point again at the
> > >>>> precise version you've used for the log provided.)
> > >>>>
> > >>>>> (XEN) d3v0 Unexpected PIO status 1, port 0xb004 read 0xffff
> > >>>>> (XEN) Xen BUG at io.c:178
> > >>>>
> > >>>> Btw, instead of BUG(), WARN() or dump_execution_state() would
> > >>>> likely also do, keeping Xen alive.
> > >>>>
> > >>>
> > >>> A shutdown deferral problem would result in X86EMUL_RETRY wouldn't =
it?
> > >>
> > >> Where would this originate?
> > >
> > > I was referring to the 'if ( unlikely(!vcpu_start_shutdown_deferral(c=
urr)) )' at the top of
> > hvm_send_ioreq().
> >=20
> > Ah yes. But this is just one way of things possibly going wrong. Plus
> > the function will return true when ->defer_shutdown is already or
> > (wrongly) still set.
> >=20
> > >>> That would mean we wouldn't be seeing the "Unexpected PIO" message.=
 From that message this clearly
> > >> X86EMUL_UNHANDLEABLE which suggests a race with ioreq server teardow=
n, possibly due to selecting a
> > >> server but then not finding a vcpu match in ioreq_vcpu_list.
> > >>
> > >> I was suspecting such, but at least the tearing down of all servers
> > >> happens only from relinquish-resources, which gets started only
> > >> after ->is_shut_down got set (unless the tool stack invoked
> > >> XEN_DOMCTL_destroydomain without having observed XEN_DOMINF_shutdown
> > >> set for the domain).
> > >>
> > >> For individually unregistered servers - yes, if qemu did so, this
> > >> would be a problem. They need to remain registered until all vCPU-s
> > >> in the domain got paused.
> > >
> > > It shouldn't be a problem should it? Destroying an individual server =
is only done with the domain
> > paused, so no vcpus can be running at the time.
> >=20
> > Consider the case of one getting destroyed after it has already
> > returned data, but the originating vCPU didn't consume that data
> > yet. Once that vCPU gets unpaused, handle_hvm_io_completion()
> > won't find the matching server anymore, and hence the chain
> > hvm_wait_for_io() -> hvm_io_assist() ->
> > vcpu_end_shutdown_deferral() would be skipped. handle_pio()
> > would then still correctly consume the result.
>=20
> True, and skipping hvm_io_assist() means the vcpu internal ioreq state wi=
ll be left set to IOREQ_READY and *that* explains why we would then exit hv=
memul_do_io() with X86EMUL_UNHANDLEABLE (from the first switch).

I can confirm X86EMUL_UNHANDLEABLE indeed comes from the first switch in
hvmemul_do_io(). And it happens shortly after ioreq server is destroyed:

(XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 reason 0
(XEN) d12v0 domain 11 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 done
(XEN) d12v0 hvm_destroy_ioreq_server called for 11, id 0
(XEN) d11v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_shu=
tdown 1 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:180:d11v0 hvmemul_do_io X86EMUL_UNHANDLEABLE: io_req.state 1
(XEN) d11v0 Unexpected PIO status 1, port 0xb004 read 0xffff

I've also made handle_pio message printed on v->defer_shutdown=3D1
regardless of the port, but didn't hit any other case than read from
0xb004.

Now, I'm going to try your patch.

> > Marek - to verify this doesn't happen (sorry, my qemu knowledge
> > is rather limited, and hence I don't know whether this can
> > happen at all), could you also log hvm_destroy_ioreq_server()
> > invocations?
> >=20
> > Jan
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--LYDt+Tnt2WQ/hIRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7acD0ACgkQ24/THMrX
1yzfpgf/U/bg+CKhU69uCjA8iaE/e8OfywprRPrwhaQCwIL/BhrBagVlPOfWUlu+
tiUJKaEePB6Gpo0T1EnxtjeoX67DaTDKrJ5BLCENKiFrpFalcsvgDzQetJMVh3Id
fds2qJDXAYRf9ahjhe8v1kx3qOIBQ+r0BYZ8tqYO8+7kr0InBpAluUEZabdv4Yhp
HOAlNFu5f0JOYh7qqWirxaDkE2L6WS3LsBgf7vg6nPFOc4Fw6Qr0KMN+lAHCmBEM
eKvcVQqNuxV2cjPSHHvOYGshSonSJ1Gdv+woqV4iU8c0TgfRB7WanePDVKJwaOYc
8E0OTUKkF54I6rIkXT7vf9BiDRRw+g==
=rlSs
-----END PGP SIGNATURE-----

--LYDt+Tnt2WQ/hIRe--

