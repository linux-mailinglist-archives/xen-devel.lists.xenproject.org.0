Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOynN7gdhmmTJwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:58:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882A100A4E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223670.1531128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voP9O-0004gn-DJ; Fri, 06 Feb 2026 16:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223670.1531128; Fri, 06 Feb 2026 16:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voP9O-0004dg-9m; Fri, 06 Feb 2026 16:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1223670;
 Fri, 06 Feb 2026 16:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C95x=AK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1voP9N-0004da-E0
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:57:45 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ac846b-037c-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:57:43 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 8E0081D00089;
 Fri,  6 Feb 2026 11:57:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 06 Feb 2026 11:57:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 11:57:39 -0500 (EST)
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
X-Inumbo-ID: f3ac846b-037c-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770397061;
	 x=1770483461; bh=fdei6A8Fv4G08+sQSJ06Za50Yavvk3tX+aq5jzNB1wg=; b=
	rBnxDer3O29CxSJ2JTGeSBi7N+3wUbgsBXif/NU3xMTWBLcTKNhQSJNwwJFbg3lq
	Jo/2M3z2RUMffV3adZ8iamRlfLPY5WtimrsfcJ6eOBQPzuAiLTjfrV0b+1EYtcue
	lmo/hEji/UYgT5ekOc1Dy/CkU6M7GJSV4jwKLEY2uQZb+l2rdouE+cAQJF1y8dZL
	epNUd83zOzI4u746AjZa8XhxLmQLHytO2t0bCKGWVZiWG2HmtnghSUzECymSWnZn
	acPXoDl8IlaAtjhnQ9VQiXHyUtGWjNx4yqpRchc9BpTfjo+l3fDa28U7QA6GKeBo
	HnnF7+T/8vCpKbzECy3XGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770397061; x=1770483461; bh=fdei6A8Fv4G08+sQSJ06Za50Yavvk3tX+aq
	5jzNB1wg=; b=DL1g5BcjX/E+F9Jp3+8NmuPC7styb3BfG94kopqevU97Ptl635R
	XcBj5OoJMB0LJBGivzE0j0yJGFLNxj1PDHGZHc+hz76WVmrUSp1Z8JzN8YU8VQQF
	GsmsAVR8d2kM+eBACuNCeWPQ3b+audocL328o/65tVnqv1EhJh+szjrjBTuydHqe
	zHChXPfcP2QSvX8s86erKUOj693RT0v/olxWxUeqs8TaV95BuaJeY90RrAXGUJEW
	2ufPDIzxPSLJr3Frs/g/+/OI4TL/GjrkkBQ0wjmUXxCTREeMmAhOtc57q3q2uKI7
	qO+0M4gyTP+3gevyecOnxMs+wgGU8yjVL5A==
X-ME-Sender: <xms:hB2GaS5hYtMQTXWJctQjxIZEBoy7eUYdB3W-xzCbk8wqBChPVSPg2g>
    <xme:hB2GaX6yUr8y8EblxgUxBNv-UD93Br51qwhhawh5qwCeLKMSQgS1E9wl-tS-RJ0J7
    x1dQbWFgZUKrUGIXiDmhk6hEoJteAF_Saieeg94RN7E1DVGQg>
X-ME-Received: <xmr:hB2GaTqEfhV-tteecrjqb4rJI293h_EodkdEkGR2MJumEEVQc9FdjlWzuhqsOUhENuwksKmuOEAYUsKywzOrTZUPaiC2fzTlGgs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledtleeu
    ueeugeekudejgeffgfffheelieehgeffleeikefhuefgjedugfduffdunecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhnvghtfihorhhkrdhphien
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjghhrohhsshesshhush
    gvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdr
    tghomhdprhgtphhtthhopehjihgrnhhgrdhpvghnghelseiithgvrdgtohhmrdgtnhdprh
    gtphhtthhopegthhgvnhhqihhujhhiieeiieesghhmrghilhdrtghomhdprhgtphhtthho
    pehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:hB2GaQNJ1jVub0lMmmKZQEMTQZXwqIMn9r3K3adt--DqaBc2_yizEw>
    <xmx:hB2GaT2dt-EVv4j8LNM0GvYP8tbVNzVXLiN9Y_ePfHJAq9QmlwDEUw>
    <xmx:hB2GaXB2O_p656wqNDpv9GQq4tHWR9rjOCgH3WakjN-rVwLWAHVarQ>
    <xmx:hB2GaYI9esgJQrlQWeDbaK-9bmISleRuFnLRXralJaxJ3lDOzyVvuA>
    <xmx:hR2GaQyYMfkxYEB3g83E9UIwGVsWQGRDx8hkC-V69yQS07-U9Z3Jt0Cg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Feb 2026 17:57:37 +0100
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
Message-ID: <aYYdgXMKnMCfXob7@mail-itl>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
 <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
 <e1060ba2-7985-4e80-9d84-fb738758e3b3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RiDRDFZVGyD/fnDn"
Content-Disposition: inline
In-Reply-To: <e1060ba2-7985-4e80-9d84-fb738758e3b3@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jiang.peng9@zte.com.cn,m:chenqiuji666@gmail.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,epam.com,zte.com.cn,gmail.com,amd.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4882A100A4E
X-Rspamd-Action: no action


--RiDRDFZVGyD/fnDn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Feb 2026 17:57:37 +0100
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

On Thu, Jan 29, 2026 at 08:02:35AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.01.26 08:08, J=C3=BCrgen Gro=C3=9F wrote:
> > On 17.11.25 12:06, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 02.11.25 04:20, Marek Marczykowski-G=C3=B3recki wrote:
> > > > When the backend domain crashes, coordinated device cleanup is not
> > > > possible (as it involves waiting for the backend state change). In =
that
> > > > case, toolstack forcefully removes frontend xenstore entries.
> > > > xenbus_dev_changed() handles this case, and triggers device cleanup.
> > > > It's possible that toolstack manages to connect new device in that
> > > > place, before xenbus_dev_changed() notices the old one is missing. =
If
> > > > that happens, new one won't be probed and will forever remain in
> > > > XenbusStateInitialising.
> > > >=20
> > > > Fix this by checking backend-id and if it changes, consider it
> > > > unplug+plug operation. It's important that cleanup on such unplug
> > > > doesn't modify xenstore entries (especially the "state" key) as it
> > > > belong to the new device to be probed - changing it would derail
> > > > establishing connection to the new backend (most likely, closing the
> > > > device before it was even connected). Handle this case by setting n=
ew
> > > > xenbus_device->vanished flag to true, and check it before changing =
state
> > > > entry.
> > > >=20
> > > > And even if xenbus_dev_changed() correctly detects the device was
> > > > forcefully removed, the cleanup handling is still racy. Since this =
whole
> > > > handling doesn't happend in a single xenstore transaction, it's pos=
sible
> > > > that toolstack might put a new device there already. Avoid re-creat=
ing
> > > > the state key (which in the case of loosing the race would actually
> > > > close newly attached device).
> > > >=20
> > > > The problem does not apply to frontend domain crash, as this case
> > > > involves coordinated cleanup.
> > > >=20
> > > > Problem originally reported at
> > > > https://lore.kernel.org/xen-devel/aOZvivyZ9YhVWDLN@mail-itl/T/#t,
> > > > including reproduction steps.
> > > >=20
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > >=20
> > > Sorry I didn't get earlier to this.
> > >=20
> > > My main problem with this patch is that it is basically just papering=
 over
> > > a more general problem.
> > >=20
> > > You are just making the problem much more improbable, but not impossi=
ble to
> > > occur again. In case the new driver domain has the same domid as the =
old one
> > > you can still have the same race.
> > >=20
> > > The clean way to handle that would be to add a unique Id in Xenstore =
to each
> > > device on the backend side, which can be tested on the frontend side =
to
> > > match. In case it doesn't match, an old device with the same kind and=
 devid
> > > can be cleaned up.
> > >=20
> > > The unique Id would obviously need to be set by the Xen tools inside =
the
> > > transaction writing the initial backend Xenstore nodes, as doing that=
 from
> > > the backend would add another potential ambiguity by the driver domain
> > > choosing the same unique id as the previous one did.
> > >=20
> > > The question is whether something like your patch should be used as a
> > > fallback in case there is no unique Id on the backend side of the dev=
ice
> > > due to a too old Xen version.
> >=20
> > I think I have found a solution which is much more simple, as it doesn't
> > need any change of the protocol or any addition of new identifiers.
> >=20
> > When creating a new PV device, Xen tools will always write all generic
> > frontend- and backend-nodes. This includes the frontend state, which is
> > initialized as XenbusStateInitialising.
> >=20
> > The Linux kernel's xenbus driver is already storing the last known state
> > of a xenbus device in struct xenbus_device. When changing the state, the
> > xenbus driver is even reading the state from Xenstore (even if only for
> > making sure the path is still existing). So all what is needed is to ch=
eck,
> > whether the read current state is matching the locally saved state. If =
it
> > is not matching AND the read state is XenbusStateInitialising, you can =
be
> > sure that the backend has been replaced.
> >=20
> > Handling this will need to check the return value of xenbus_switch_stat=
e()
> > in all related drivers, but this is just a more or less mechanical chan=
ge.
> >=20
> > I'll prepare a patch series for that.
>=20
> In the end the result is more like your patch, avoiding the need to modify
> all drivers.
>=20
> I just added my idea to your patch and modified some of your code to be m=
ore
> simple. I _think_ I have covered all possible scenarios now, resulting in
> the need to keep the backend id check in case the backend died during the
> early init phase of the device.
>=20
> Could you please verify the attached patch is working for you?

Thanks for the patch!

I ran it through relevant tests, and I got inconsistent results.
Specifically, sometimes, the domU hangs (actually, just one vCPU spins
inside xenwatch thread). Last console messages are:

    systemd[626]: Starting dconf.service - User preferences database...
    gnome-keyring-daemon[975]: =E2=90=9B[0;1;39mcouldn't access control soc=
ket: /run/user/1000/keyring/control: No such file or directory=E2=90=9B[0m
    gnome-keyring-daemon[975]: =E2=90=9B[0;1;38:5:185mdiscover_other_daemon=
: 0=E2=90=9B[0m
    xen vif-0: xenbus: state reset occurred, reconnecting
    gnome-keyring-daemon[974]: =E2=90=9B[0;1;39mcouldn't access control soc=
ket: /run/user/1000/keyring/control: No such file or directory=E2=90=9B[0m
    gnome-keyring-daemon[976]: =E2=90=9B[0;1;39mcouldn't access control soc=
ket: /run/user/1000/keyring/control: No such file or directory=E2=90=9B[0m
    gnome-keyring-daemon[976]: =E2=90=9B[0;1;38:5:185mdiscover_other_daemon=
: 0=E2=90=9B[0m
    gnome-keyring-daemon[974]: =E2=90=9B[0;1;38:5:185mdiscover_other_daemon=
: 0=E2=90=9B[0m
    xen vif-0: xenbus: state reset occurred, reconnecting
    systemd[626]: Started dconf.service - User preferences database.
    xen_netfront: Initialising Xen virtual ethernet driver
    vif vif-0: xenbus: state reset occurred, reconnecting

And the call trace of the spinning xenwatch thread is:

    task:xenwatch        state:D stack:0     pid:64    tgid:64    ppid:2   =
   task_flags:0x288040 flags:0x00080000
    Call Trace:
     <TASK>
     __schedule+0x2f3/0x780
     schedule+0x27/0x80
     xs_wait_for_reply+0xab/0x1f0
     ? __pfx_autoremove_wake_function+0x10/0x10
     xs_talkv+0xec/0x200
     xs_single+0x4a/0x70
     xenbus_gather+0xe4/0x1a0
     xenbus_read_driver_state+0x42/0x70
     xennet_bus_close+0x113/0x2c0 [xen_netfront]
     ? __pfx_autoremove_wake_function+0x10/0x10
     xennet_remove+0x16/0x80 [xen_netfront]
     xenbus_dev_remove+0x71/0xf0
     device_release_driver_internal+0x19c/0x200
     bus_remove_device+0xc6/0x130
     device_del+0x160/0x3e0
     device_unregister+0x17/0x60
     xenbus_dev_changed.cold+0x5e/0x6b
     ? __pfx_xenwatch_thread+0x10/0x10
     xenwatch_thread+0x92/0x1c0
     ? __pfx_autoremove_wake_function+0x10/0x10
     kthread+0xfc/0x240
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0xf5/0x110
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    task:xenbus          state:S stack:0     pid:63    tgid:63    ppid:2   =
   task_flags:0x208040 flags:0x00080000
    Call Trace:
     <TASK>
     __schedule+0x2f3/0x780
     ? __pfx_xenbus_thread+0x10/0x10
     schedule+0x27/0x80
     xenbus_thread+0x1a8/0x200
     ? __pfx_autoremove_wake_function+0x10/0x10
     kthread+0xfc/0x240
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0xf5/0x110
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

(technically, `top` says it's the xenbus thread spinning, but it looks
like the actual issue is in xenwatch one)

Note that other xenwatch actions in this domU are not executed, for
example `xl sysrq` does nothing. Not surprising, given xenwatch thread
is busy... Fortunately, it blocks only a single vCPU, so I'm able to
interact with the domU over console (to get the above traces).

It isn't a reliable failure, in this test run it failed once, out of 4
related tests.

The specific test is: https://github.com/QubesOS/qubes-core-admin/blob/main=
/qubes/tests/integ/network.py#L234
In short:
1. Start a domU
2. Pause it
3. Attach network (backend is !=3D dom0)
4. Unpause

TBH, I'm not sure why the "state reset occurred" message is triggered at
all, I think it shouldn't be in this case...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RiDRDFZVGyD/fnDn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmGHYEACgkQ24/THMrX
1yzAmQf+NRGy8QTLgD4KZEUEwmKcOoJt0GuZ7D6tvKQSWciyTrBlUf68vuVPyZLq
JIq18vc7BjqyecbfsOxID/vULrP0Gk6s4dQzC4vjZo3Cq3eNkTNgrJsNqVOU/dQV
vweIA/Xochl8VdUB4q1gpKBvuwzXFjbOZ3Ec4R3ynnBdJBHNGI1IYJ7UMdftNi6Y
lPqKfyKL8E0s8f814lfGemyS1y27K5iYqq5TdqoOtZvy4Qa1/3KXe61QYwgwjmZ7
VpvGKIxSHB1hh8KK1jI7RQTLhpZHC3qWhvd3SXKFfopMt2b+XROe1ZX1UmmYWsGY
kB28LvL2H2Wg0NtuT/5uC+j6RwdFtA==
=Jub0
-----END PGP SIGNATURE-----

--RiDRDFZVGyD/fnDn--

