Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAq+J8tVpGnreAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 16:05:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5601D054C
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 16:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243903.1543444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwiLQ-0003Xr-5i; Sun, 01 Mar 2026 15:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243903.1543444; Sun, 01 Mar 2026 15:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwiLQ-0003VI-2w; Sun, 01 Mar 2026 15:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1243903;
 Sun, 01 Mar 2026 15:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Sm6=BB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vwiLO-0003VC-1t
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 15:04:30 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee1dcc03-157f-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 16:04:23 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id EF5351400041;
 Sun,  1 Mar 2026 10:04:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Sun, 01 Mar 2026 10:04:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Mar 2026 10:04:20 -0500 (EST)
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
X-Inumbo-ID: ee1dcc03-157f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1772377461; x=1772463861; bh=WE
	DyKPtzrdTYeQrs6sXaKHMHgxci7AQYZmlLMmwrR0c=; b=MOZckj4blRe6GpBJ9K
	mrFLHjWzhvxV6IfWrMeYsZv94I73ac4DisWR9mr4KIfWY6qe9MruhZm5BfVk8DlI
	qrGswbo6ttGYzCIYr8HJWwjj5a0XfLruQebDPGlt1JmAaLnDpu30jYeaoxzbASyz
	gpCPiho2r9CAO+QI4recP3De4mNH3V1/fg7Y3w+hORWaohNdrYQW0DfCMwENkaJN
	lqJXhPmfV7focWMPJ1MMtyw2BPU2CyAg16i+IrlNwHqRo4zB0VEstzZT88MnvUBt
	Imz8PHxQY8c8SUtSc3EfiNLlhLPeM+QJ8KlvB64JDeJSq62PpUycsdv7s0DdvuQ5
	tehA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772377461; x=
	1772463861; bh=WEDyKPtzrdTYeQrs6sXaKHMHgxci7AQYZmlLMmwrR0c=; b=f
	kG6+E2VoodApJN/EJ8l7DI2H1dhuidCPTWV00X9B2K4adlBSduICjvJOcD1U54mO
	JcZ1eZ6VsLEDOJinDsZihX1KIbUYIJbKzHeKbu0j0wUv+LN/gKnKObCzcW7HvXts
	wKp9SXyJ2Yp8mzUJSvFY4854RXzyJL+0rDc1Mw9szORGOpieneM4KiaZmZNGhvjX
	WlHn8xHK/IR4Yj9catvZYjrFPRfeF9xxwoHGlhuC0HEWlk5YDBPIr9Ms0osDBdkl
	z1KGPsEkTd+CvSAhv90h+MG6v9usy8QeSjqXj+tpzWx+HOOzSfnYinH+avlYPz9K
	/ozYPZPF1qroMkGmflHBw==
X-ME-Sender: <xms:dVWkaVSavsnQZ_j-wlgrwFiQ_4JmGQpT-CVbec0vx62H85R3UIOHtQ>
    <xme:dVWkaVoUbF0WOe7kFxHq_NvWe2LsaVj3toSF2DgCvr9dIt1rvcd2J9taUUfb53YsC
    ACO4bCWygZHVyF0CvNcQJmmXKew-msoJGijJjU90w1zFmxOWQ>
X-ME-Received: <xmr:dVWkaTIZWFP2IIbZUtYoFYZLZEN21UzFSmN_2VcqQnF9Y1mm77_1acX5_jL-AJ4yAtPxTDe7-4Q4uxRPjTLy1CLNJ0-zN2eTDQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheehuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfetuefhiefg
    tddtlefggffggeevhedtvdefffeugfeiieeiheefteefgefggeejnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepsghorhhishdrohhs
    thhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuh
    igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurghvihgusehkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:dVWkaYrQ3r5TykAOdBhm2g_PTgV9B1X0YM8dfrI0ADXEsG4owEQAnQ>
    <xmx:dVWkabyDiJTmON6uYuH-nBMykZcn2O2d0zlsU1iFzwhMkHRhwIy7qw>
    <xmx:dVWkacNYx2Gy-rkIsrojIhtXpAgsrjBuchuJdvwQS7B3pnSIsHrR_w>
    <xmx:dVWkaQ5Fnf_MKdEwIpntCQqGqiOrreCQSYjpbEmg6R8K1WN78wdOlg>
    <xmx:dVWkaVJaCnN2eY1Hxv6gpjYUVzieb1-jb0fjsSO0S4KE7CsHS-NJoFf8>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 1 Mar 2026 16:04:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Subject: Excluding init_on_free for pages for initial balloon down (Xen)
Message-ID: <aaRVcVmtv2UBD-GF@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TuuO5D0SW37++uJS"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BB5601D054C
X-Rspamd-Action: no action


--TuuO5D0SW37++uJS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Mar 2026 16:04:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Subject: Excluding init_on_free for pages for initial balloon down (Xen)

Hi,

Some time ago I made a change to disable scrubbing pages that are
ballooned out during system boot. I'll paste the whole commit message as
it's relevant here:

    197ecb3802c0 xen/balloon: add runtime control for scrubbing ballooned o=
ut pages

    Scrubbing pages on initial balloon down can take some time, especially
    in nested virtualization case (nested EPT is slow). When HVM/PVH guest =
is
    started with memory=3D significantly lower than maxmem=3D, all the extra
    pages will be scrubbed before returning to Xen. But since most of them
    weren't used at all at that point, Xen needs to populate them first
    (from populate-on-demand pool). In nested virt case (Xen inside KVM)
    this slows down the guest boot by 15-30s with just 1.5GB needed to be
    returned to Xen.
   =20
    Add runtime parameter to enable/disable it, to allow initially disabling
    scrubbing, then enable it back during boot (for example in initramfs).
    Such usage relies on assumption that a) most pages ballooned out during
    initial boot weren't used at all, and b) even if they were, very few
    secrets are in the guest at that time (before any serious userspace
    kicks in).
    Convert CONFIG_XEN_SCRUB_PAGES to CONFIG_XEN_SCRUB_PAGES_DEFAULT (also
    enabled by default), controlling default value for the new runtime
    switch.

Now, I face the same issue with init_on_free/init_on_alloc (not sure
which one applies here, probably the latter one), which several
distributions enable by default. The result is (see timestamps):

    [2026-02-24 01:12:55] [    7.485151] xen:balloon: Waiting for initial b=
allooning down having finished.
    [2026-02-24 01:14:14] [   86.581510] xen:balloon: Initial ballooning do=
wn finished.

But here the situation is a bit more complicated:
init_on_free/init_on_alloc applies to any pages, not just those for
balloon driver. I see two approaches to solve the issue:
1. Similar to xen_scrub_pages=3D, add a runtime switch for
   init_on_free/init_on_alloc, then force them off during boot, and
   re-enable early in initramfs.
2. Somehow adjust balloon driver to bypass init_on_alloc when ballooning
   a page out.

The first approach is likely easier to implement, but also has some
drawbacks: it may result in some kernel structures that are allocated
early to remain with garbage data in uninitialized places. While it may
not matter during early boot, such structures may survive for quite some
time, and maybe attacker can use them later on to exploit some other
bug. This wasn't really a concern with xen_scrub_pages, as those pages
were immediately ballooned out.

The second approach sounds architecturally better, and maybe
init_on_alloc could be always bypassed during balloon out? The balloon
driver can scrub the page on its own already (which is enabled by
default). That of course assumes the issue is only about init_on_alloc,
not init_on_free (or both) - which I haven't really confirmed yet...
If going this way, I see the balloon driver does basically
alloc_page(GFP_BALLOON), where GFP_BALLOON is:

    /* When ballooning out (allocating memory to return to Xen) we don't re=
ally
       want the kernel to try too hard since that can trigger the oom kille=
r. */
    #define GFP_BALLOON \
        (GFP_HIGHUSER | __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC)

Would that be about adding some new flag here? Or maybe there is already
one for this purpose?

Any opinions?

PS issue tracked at https://github.com/QubesOS/qubes-issues/issues/10723

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TuuO5D0SW37++uJS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmkVXEACgkQ24/THMrX
1ywhmgf/eZeGTjx6//+hTB2Qy9RqzuXOwOQ6AfyQquM85TNDY4pn/smySDi3d6PL
fHo5sweOijroW7tFUMeUQPO+7IewuVJo9OlE9wq09nM3J5KwiamrKDrgedaDuqP5
1Trg1sd4LV+qLNXvlHHZ49EuSoNzbz76ZBcHZQwqnGWF5L8Y9ruqQXPKpoi1MplN
5A2uOLr9QWYIrpYkMxl+8bMzlGWS+nhASDy4V/0R2ba5z6QzPS/4RMI/p65SalHI
ZfiER1PFuL+bIo+SWciATW+SJgC5XmmMXPW3NbTrKVyFW8+tcu3u31pvJKivC5qy
zvseR3nvv808lqmg/ErE6FXP7nRWWg==
=Uy3v
-----END PGP SIGNATURE-----

--TuuO5D0SW37++uJS--

