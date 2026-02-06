Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG+eEvnYhWlZHQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 13:05:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E7FD762
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 13:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223163.1530771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voKZu-00084p-Bn; Fri, 06 Feb 2026 12:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223163.1530771; Fri, 06 Feb 2026 12:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voKZu-00082j-8o; Fri, 06 Feb 2026 12:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1223163;
 Fri, 06 Feb 2026 12:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C95x=AK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1voKZs-00082d-GT
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 12:04:48 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0537be4c-0354-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 13:04:43 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id DF4411D0013D;
 Fri,  6 Feb 2026 07:04:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 06 Feb 2026 07:04:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 07:04:39 -0500 (EST)
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
X-Inumbo-ID: 0537be4c-0354-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770379481;
	 x=1770465881; bh=RpwilhNWGcU20VgC4fNtVXpo08Rs6aa7wHosmip5EVQ=; b=
	XI7cDEnbaS4a910RPsaP63/uYfF16p07shE0ZjP6DuqyPNzB49pQ4Sr3Ql9ERa6X
	03w2OMsVUaaN5UnWC9D3wG3j4aL78dr1ViUQOLlSOZn7bvuGEyC4Ot0OSdzr+gwm
	aQDnZ8v6WVpxow04hqVYp0c8tL7eSj+FwL571desm2uKUnRomUwo5tGNig8KbKTa
	likbhwTUElsaVQUPIw5/Z3KWcvP6q6qlcaQjseMe6id3TBvb6LQutIw9fhjJBJTu
	u/5qNqXv/OGkv1TR12r6e9qEbICWADDdFbOZy6PXdbEcn5mDNdpdjCe17KsQXyPF
	PKdASFHE323WH7RRAZ2pew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770379481; x=1770465881; bh=RpwilhNWGcU20VgC4fNtVXpo08Rs6aa7wHo
	smip5EVQ=; b=l2hq+XDyXo4RDYa2tyFjUddxjcFVn3zQsOhNo2mQ/hxzyVjopfP
	UykzOD/uqR3MoOMMg1N81JdRnfSOurTeVDEbAiF+qYrblTs2NZqb/TXQvmCVOyiy
	MxuVMAAxnxRI8qtnnS7SSbWJnTgxHTZt6TGPpygmmk+VO/pwHGWzYp+lITYNrKKP
	L62cbSMVDsSQvhSIMKVTjGig3+8bHUoZ8Qs9136m0jE80VhRSHE4QoQ2elCAOvRk
	IWdGX2PG+PXJkD+twI3KhYVnRSmUwE5Lp4dD+YoSnkkpCd3nPrPn2TWwyfazJ5Uw
	ItM4WLOX1Mgad3ejglRUWklpzwjQCwinTWQ==
X-ME-Sender: <xms:2diFaeoXj69JmIBh8bn4Q5R6W0yIaj5SVDcd-HCCvDyHJDA2ajxs-A>
    <xme:2diFaZNR7b7Rc4sI9YkQa4bQM5tnjexduwJH302-IrMtPZwDVAq_nxpMA0MdUj1Dl
    4VZt1Qjm_EonE2xHm3sdiSd5Enggs2belbLbMJoXTyjEDlHbA>
X-ME-Received: <xmr:2diFaXoGgKM3-ELfG2PA5fLARx7yQzeK5anpIZ7od3-a8uj2SmQWDGsBwIQTxqczLKYFOJcDTuT978F3wItajlDCqUfqwD5KfH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgt
    ohhmpdhrtghpthhtohepthgvugguhidrrghsthhivgesvhgrthgvshdrthgvtghhpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtoh
    epmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghn
    seigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtoh
    hmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:2diFaUtfQZjwR-ZhRBo-eh9bdvDbBYCgwqdUcHvXSGbxHhbpEZC4ew>
    <xmx:2diFae3MtM7E6DTWTSRwJivMzbxVyvxHUWHsW1neZSkNQvissn0pNQ>
    <xmx:2diFaXGmlrzt7_WqE6PZzfZmRCAjgCOTFXoqj0S4IBQ26-n_aqz40g>
    <xmx:2diFaRvNmqfmF2VKuK3PQ9VYFPhlWFkhPQ-YhQJkannpfxs2F4ZegA>
    <xmx:2diFaVTCNju2rwTdjXCqOrQJc6oGZrUzvhfC8moURRP9aczcFijuup9p>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Feb 2026 13:04:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default
Message-ID: <aYXY1iLWmoBzTb5M@mail-itl>
References: <82dfede43d81c2072f90b01d12fe5ef18c80fc24.1770312308.git.teddy.astie@vates.tech>
 <be09e51c-5201-4837-9921-5ac0d8cae582@suse.com>
 <aYXV8o4LjGLQ0VaE@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6fIOSKi6fkyCQFPu"
Content-Disposition: inline
In-Reply-To: <aYXV8o4LjGLQ0VaE@mail-itl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AE0E7FD762
X-Rspamd-Action: no action


--6fIOSKi6fkyCQFPu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Feb 2026 13:04:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default

On Fri, Feb 06, 2026 at 12:52:18PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Feb 06, 2026 at 07:29:49AM +0100, Jan Beulich wrote:
> > I further wonder whether the EXPERT dependency of the prompt wouldn't
> > better be dropped when flipping the default.
>=20
> IMO the EXPERT dependency is still relevant. This option is basically
> "break Xen on a large number of UEFI systems".

To be clear: I mean disabling the option (changing the new default)
should be IMHO hidden behind EXPERT.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6fIOSKi6fkyCQFPu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmF2NYACgkQ24/THMrX
1yytngf/edaIsV+0DngPXnzmL9xsuPT3k0V7h4WSgth5ouF4gv02DFYC3p3FhLoU
yqEACmeQ8D11URuS5Lyol4V2sztydtiIYbxNjr1/J/MQOocD4NMEWQziYljbdlNT
nH+POiDeIfGXNiUKq+Jk8Vc6Lb0Glwumq5DbAjcQnIY9CgVEPgkXVZjY74kfzEQd
vRSwhjStcPnnrNAqjtyeCHCD79qQf5ryE510oidv0pyQs4afh5pAr9W75JRwzwtB
ztuVpvxZUiyXDmFdTtHWTYnvjh30/3uNDZMti85bdYEtNc5JUccxi6Z1olows3YQ
LsiBiUb6UybCn+vMXSA3rKawFdZamA==
=1uHT
-----END PGP SIGNATURE-----

--6fIOSKi6fkyCQFPu--

