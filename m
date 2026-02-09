Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GpjMQtIimmXJAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 21:48:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC1114875
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 21:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225997.1532578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpY9o-0006xA-Hm; Mon, 09 Feb 2026 20:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225997.1532578; Mon, 09 Feb 2026 20:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpY9o-0006vL-EE; Mon, 09 Feb 2026 20:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1225997;
 Mon, 09 Feb 2026 20:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uJQ=AN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vpY9m-0006uu-9l
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 20:46:54 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7587846e-05f8-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 21:46:51 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 341FFEC00AE;
 Mon,  9 Feb 2026 15:46:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 09 Feb 2026 15:46:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 15:46:48 -0500 (EST)
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
X-Inumbo-ID: 7587846e-05f8-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770670010;
	 x=1770756410; bh=KUf8dHESCwGRXDGc8BvIy9z73QNSXOuARFg+gAz4Mx4=; b=
	OiLuPVEIRij+SJAWrHqjDdRiCFIxlcP94+09Fuhn3wRU12D0hkf9zIpRNO4KMFv5
	Ix2nBTdlC9nBp+pfQjGcUPtXPm2GM/mi0r7d6Qnv1Za/bSdmHe2i96ND2a/78XnK
	rU6C0TmRl/miGd/KHZLGbkqOArephT2N7RwaA5jI2dmPUR8flivErxUXMmFoA15O
	j4/s/L9y16fzpMjGe0hN/15AOJmBA2Tzj0fyD6YkLZuQHJ4aL4GYbl+ozTmpmrKu
	WQRqfyyEdHOjAcZZD/FYRcZMtcpv5M6N6poEURF5hylErPbuiyy7EVO2HozIcgVA
	HBm7HmVa11bkSi7A8pqmag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770670010; x=1770756410; bh=KUf8dHESCwGRXDGc8BvIy9z73QNSXOuARFg
	+gAz4Mx4=; b=BsG9NwH2O2hsC3X3U8QSHYqcPIoAi6gQ6y7PyHaJpUCJLhuIZx8
	xo27d6Ie09nP/MEVUVaWHxIldNCmCqN4avwWDtrvWxUq883j77it1m4D0GUbsmc/
	xJfP4Kxr2rvQsNCNpIvFWNwQ8MUsVnJcl6t2j709kmlAYYeTTNIcf+QdT/knzTol
	zlx029vUZwJAaFcgFYZGC7+o+DDOzl4e2NTHUmywQSDIQwxBFhxi+o10Fn4SNixp
	DtQpzvoSGjdzxFgTmXk6nhzLIj+O+FZT2J1LShVikOjGisI0Y6NfMZkIcfoNbwh2
	RsAkQDOBPuRcCpbEHXSy3d2VgERXro1JM/A==
X-ME-Sender: <xms:uUeKabmjZYYwSUNIh1tHvDCFWkvS9Nd87L8WbmaOymjo1KFjEbhZsw>
    <xme:uUeKaa3posc17X-YabcThBjYvdIYOAof5t1XfiqegCle4QZjJBLNSPu91TM4ej_7n
    O9zbHVVigy6768Es7EY8i7Ybx4boH_O5cvvK1mxtcIivrm80g>
X-ME-Received: <xmr:uUeKaT09jlL3ZaIPj_7BE-oNROztHMALiJIXduNw1IKayjRLTdHt9fcPTGSweXbyBbf1l_CETof02WnK4hhkToDW8kS4DZ-nCgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvefhleei
    feejgfeiueeugeefvdekfeffjeetudehudeiudegfeelveelueeiueegnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhnvghtfihorhhkrdhphidp
    qhhusggvshdqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihs
    hhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepjhhirghnghdrphgvnhhgle
    esiihtvgdrtghomhdrtghnpdhrtghpthhtoheptghhvghnqhhiuhhjiheiieeisehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepjhgrshhonhdrrghnughrhihukhesrghmugdrtghomh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrgh
X-ME-Proxy: <xmx:uUeKaUrBhH7botie_RuVmuytTE0W-zbOOQO2bPmweelOn9OJC4Yxzw>
    <xmx:uUeKaXidhAfYIKbFOI7Hn3jw5GKoRe3GYG8T9OuIulYAC7FcbD9XWA>
    <xmx:uUeKaY-RHaHLguQmyiRTi8nuN6V98X0ZxTN7rMNfWUmlVkpBhgRGfQ>
    <xmx:uUeKabWjsd1rGIYrUWwwHK11LCKJHtcLGEl-rMGxwkEKwy2HU8c0Pw>
    <xmx:ukeKadJrH0yJqqHQWwFLLaxy8HA17Kd_fcxiBdwpud2EiIDughYsNAiw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 9 Feb 2026 21:46:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peng Jiang <jiang.peng9@zte.com.cn>,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
Message-ID: <aYpHth_TvtA8hg4J@mail-itl>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
 <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
 <e1060ba2-7985-4e80-9d84-fb738758e3b3@suse.com>
 <aYYdgXMKnMCfXob7@mail-itl>
 <abd6f188-4c5e-4e56-9dbf-3bc942622b6f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wio1BjPJwyTU119d"
Content-Disposition: inline
In-Reply-To: <abd6f188-4c5e-4e56-9dbf-3bc942622b6f@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jiang.peng9@zte.com.cn,m:chenqiuji666@gmail.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,epam.com,zte.com.cn,gmail.com,amd.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,qubes-os.org:url,invisiblethingslab.com:email,invisiblethingslab.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 29BC1114875
X-Rspamd-Action: no action


--Wio1BjPJwyTU119d
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Feb 2026 21:46:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peng Jiang <jiang.peng9@zte.com.cn>,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash

On Mon, Feb 09, 2026 at 10:02:28AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 06.02.26 17:57, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jan 29, 2026 at 08:02:35AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 26.01.26 08:08, J=C3=BCrgen Gro=C3=9F wrote:
> > > > On 17.11.25 12:06, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > On 02.11.25 04:20, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > When the backend domain crashes, coordinated device cleanup is =
not
> > > > > > possible (as it involves waiting for the backend state change).=
 In that
> > > > > > case, toolstack forcefully removes frontend xenstore entries.
> > > > > > xenbus_dev_changed() handles this case, and triggers device cle=
anup.
> > > > > > It's possible that toolstack manages to connect new device in t=
hat
> > > > > > place, before xenbus_dev_changed() notices the old one is missi=
ng. If
> > > > > > that happens, new one won't be probed and will forever remain in
> > > > > > XenbusStateInitialising.
> > > > > >=20
> > > > > > Fix this by checking backend-id and if it changes, consider it
> > > > > > unplug+plug operation. It's important that cleanup on such unpl=
ug
> > > > > > doesn't modify xenstore entries (especially the "state" key) as=
 it
> > > > > > belong to the new device to be probed - changing it would derail
> > > > > > establishing connection to the new backend (most likely, closin=
g the
> > > > > > device before it was even connected). Handle this case by setti=
ng new
> > > > > > xenbus_device->vanished flag to true, and check it before chang=
ing state
> > > > > > entry.
> > > > > >=20
> > > > > > And even if xenbus_dev_changed() correctly detects the device w=
as
> > > > > > forcefully removed, the cleanup handling is still racy. Since t=
his whole
> > > > > > handling doesn't happend in a single xenstore transaction, it's=
 possible
> > > > > > that toolstack might put a new device there already. Avoid re-c=
reating
> > > > > > the state key (which in the case of loosing the race would actu=
ally
> > > > > > close newly attached device).
> > > > > >=20
> > > > > > The problem does not apply to frontend domain crash, as this ca=
se
> > > > > > involves coordinated cleanup.
> > > > > >=20
> > > > > > Problem originally reported at
> > > > > > https://lore.kernel.org/xen-devel/aOZvivyZ9YhVWDLN@mail-itl/T/#=
t,
> > > > > > including reproduction steps.
> > > > > >=20
> > > > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisi=
blethingslab.com>
> > > > >=20
> > > > > Sorry I didn't get earlier to this.
> > > > >=20
> > > > > My main problem with this patch is that it is basically just pape=
ring over
> > > > > a more general problem.
> > > > >=20
> > > > > You are just making the problem much more improbable, but not imp=
ossible to
> > > > > occur again. In case the new driver domain has the same domid as =
the old one
> > > > > you can still have the same race.
> > > > >=20
> > > > > The clean way to handle that would be to add a unique Id in Xenst=
ore to each
> > > > > device on the backend side, which can be tested on the frontend s=
ide to
> > > > > match. In case it doesn't match, an old device with the same kind=
 and devid
> > > > > can be cleaned up.
> > > > >=20
> > > > > The unique Id would obviously need to be set by the Xen tools ins=
ide the
> > > > > transaction writing the initial backend Xenstore nodes, as doing =
that from
> > > > > the backend would add another potential ambiguity by the driver d=
omain
> > > > > choosing the same unique id as the previous one did.
> > > > >=20
> > > > > The question is whether something like your patch should be used =
as a
> > > > > fallback in case there is no unique Id on the backend side of the=
 device
> > > > > due to a too old Xen version.
> > > >=20
> > > > I think I have found a solution which is much more simple, as it do=
esn't
> > > > need any change of the protocol or any addition of new identifiers.
> > > >=20
> > > > When creating a new PV device, Xen tools will always write all gene=
ric
> > > > frontend- and backend-nodes. This includes the frontend state, whic=
h is
> > > > initialized as XenbusStateInitialising.
> > > >=20
> > > > The Linux kernel's xenbus driver is already storing the last known =
state
> > > > of a xenbus device in struct xenbus_device. When changing the state=
, the
> > > > xenbus driver is even reading the state from Xenstore (even if only=
 for
> > > > making sure the path is still existing). So all what is needed is t=
o check,
> > > > whether the read current state is matching the locally saved state.=
 If it
> > > > is not matching AND the read state is XenbusStateInitialising, you =
can be
> > > > sure that the backend has been replaced.
> > > >=20
> > > > Handling this will need to check the return value of xenbus_switch_=
state()
> > > > in all related drivers, but this is just a more or less mechanical =
change.
> > > >=20
> > > > I'll prepare a patch series for that.
> > >=20
> > > In the end the result is more like your patch, avoiding the need to m=
odify
> > > all drivers.
> > >=20
> > > I just added my idea to your patch and modified some of your code to =
be more
> > > simple. I _think_ I have covered all possible scenarios now, resultin=
g in
> > > the need to keep the backend id check in case the backend died during=
 the
> > > early init phase of the device.
> > >=20
> > > Could you please verify the attached patch is working for you?
> >=20
> > Thanks for the patch!
> >=20
> > I ran it through relevant tests, and I got inconsistent results.
> > Specifically, sometimes, the domU hangs (actually, just one vCPU spins
> > inside xenwatch thread). Last console messages are:
> >=20
> >      systemd[626]: Starting dconf.service - User preferences database...
> >      gnome-keyring-daemon[975]: =E2=90=9B[0;1;39mcouldn't access contro=
l socket: /run/user/1000/keyring/control: No such file or directory=E2=90=
=9B[0m
> >      gnome-keyring-daemon[975]: =E2=90=9B[0;1;38:5:185mdiscover_other_d=
aemon: 0=E2=90=9B[0m
> >      xen vif-0: xenbus: state reset occurred, reconnecting
> >      gnome-keyring-daemon[974]: =E2=90=9B[0;1;39mcouldn't access contro=
l socket: /run/user/1000/keyring/control: No such file or directory=E2=90=
=9B[0m
> >      gnome-keyring-daemon[976]: =E2=90=9B[0;1;39mcouldn't access contro=
l socket: /run/user/1000/keyring/control: No such file or directory=E2=90=
=9B[0m
> >      gnome-keyring-daemon[976]: =E2=90=9B[0;1;38:5:185mdiscover_other_d=
aemon: 0=E2=90=9B[0m
> >      gnome-keyring-daemon[974]: =E2=90=9B[0;1;38:5:185mdiscover_other_d=
aemon: 0=E2=90=9B[0m
> >      xen vif-0: xenbus: state reset occurred, reconnecting
> >      systemd[626]: Started dconf.service - User preferences database.
> >      xen_netfront: Initialising Xen virtual ethernet driver
> >      vif vif-0: xenbus: state reset occurred, reconnecting
> >=20
> > And the call trace of the spinning xenwatch thread is:
> >=20
> >      task:xenwatch        state:D stack:0     pid:64    tgid:64    ppid=
:2      task_flags:0x288040 flags:0x00080000
> >      Call Trace:
> >       <TASK>
> >       __schedule+0x2f3/0x780
> >       schedule+0x27/0x80
> >       xs_wait_for_reply+0xab/0x1f0
> >       ? __pfx_autoremove_wake_function+0x10/0x10
> >       xs_talkv+0xec/0x200
> >       xs_single+0x4a/0x70
> >       xenbus_gather+0xe4/0x1a0
> >       xenbus_read_driver_state+0x42/0x70
> >       xennet_bus_close+0x113/0x2c0 [xen_netfront]
> >       ? __pfx_autoremove_wake_function+0x10/0x10
> >       xennet_remove+0x16/0x80 [xen_netfront]
> >       xenbus_dev_remove+0x71/0xf0
> >       device_release_driver_internal+0x19c/0x200
> >       bus_remove_device+0xc6/0x130
> >       device_del+0x160/0x3e0
> >       device_unregister+0x17/0x60
> >       xenbus_dev_changed.cold+0x5e/0x6b
> >       ? __pfx_xenwatch_thread+0x10/0x10
> >       xenwatch_thread+0x92/0x1c0
> >       ? __pfx_autoremove_wake_function+0x10/0x10
> >       kthread+0xfc/0x240
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork+0xf5/0x110
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork_asm+0x1a/0x30
> >       </TASK>
> >      task:xenbus          state:S stack:0     pid:63    tgid:63    ppid=
:2      task_flags:0x208040 flags:0x00080000
> >      Call Trace:
> >       <TASK>
> >       __schedule+0x2f3/0x780
> >       ? __pfx_xenbus_thread+0x10/0x10
> >       schedule+0x27/0x80
> >       xenbus_thread+0x1a8/0x200
> >       ? __pfx_autoremove_wake_function+0x10/0x10
> >       kthread+0xfc/0x240
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork+0xf5/0x110
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork_asm+0x1a/0x30
> >       </TASK>
> >=20
> > (technically, `top` says it's the xenbus thread spinning, but it looks
> > like the actual issue is in xenwatch one)
> >=20
> > Note that other xenwatch actions in this domU are not executed, for
> > example `xl sysrq` does nothing. Not surprising, given xenwatch thread
> > is busy... Fortunately, it blocks only a single vCPU, so I'm able to
> > interact with the domU over console (to get the above traces).
> >=20
> > It isn't a reliable failure, in this test run it failed once, out of 4
> > related tests.
> >=20
> > The specific test is: https://github.com/QubesOS/qubes-core-admin/blob/=
main/qubes/tests/integ/network.py#L234
> > In short:
> > 1. Start a domU
> > 2. Pause it
> > 3. Attach network (backend is !=3D dom0)
> > 4. Unpause
> >=20
> > TBH, I'm not sure why the "state reset occurred" message is triggered at
> > all, I think it shouldn't be in this case...
> >=20
>=20
> Second try.

This time it's green: https://openqa.qubes-os.org/tests/166851 :)
You can treat it as T-by tag.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Wio1BjPJwyTU119d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmKR7YACgkQ24/THMrX
1yx6Zwf/Vg7p6rojPha934MdDVbWbu9+dqgnuc8BcDish1Vk5IDYjJSXTPsdjCQh
C3ihtGcIRJFSyoxABnERRjSZ60lk4Nl4xsBrnWl/+4pIsAn6U8tEs87dYkK2RywS
BAxViQ7OPmEku+cyqWwQVXGN+j/s4nMCnLcmMTuk4PFbW4SkNln68MRTdiRw1i34
oSSL10uS/KihVLspBayzKPRKQQBYyMJURNw86bErv3xLoG0K2bNmH6HxJjh3DXQs
jsjTrfHScNUbNgX6Q+Pj8LS3e2B/ERIbk+p09LsfWwgqqf532EW+Ktlo0ZZil+U4
rq9G1pnidgnLyqSqTUDghINWA8y4Yg==
=TyC6
-----END PGP SIGNATURE-----

--Wio1BjPJwyTU119d--

