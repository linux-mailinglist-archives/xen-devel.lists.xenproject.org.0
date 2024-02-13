Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC1853453
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680008.1057812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuRh-0007bj-3Z; Tue, 13 Feb 2024 15:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680008.1057812; Tue, 13 Feb 2024 15:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuRh-0007a6-0m; Tue, 13 Feb 2024 15:11:41 +0000
Received: by outflank-mailman (input) for mailman id 680008;
 Tue, 13 Feb 2024 15:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAib=JW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rZuRg-0007Zy-1j
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:11:40 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dd130ed-ca82-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:11:37 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 707CF5C00D7;
 Tue, 13 Feb 2024 10:11:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Feb 2024 10:11:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 10:11:33 -0500 (EST)
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
X-Inumbo-ID: 2dd130ed-ca82-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707837095;
	 x=1707923495; bh=SWskn1JQAhzyV9QJqVJcUm7BudG2qUjNcEm7Vmf1B/w=; b=
	FLOxx8R+H43Xw5yZIl8YDsd8/E1lktzMLtW1uFXWZ3rYTWCfbF49xh8Ubl0AT7tK
	PikSv/cLzflegrWFYZsE4BnJVXZGQvnnWnMCa1nqPyKVucKr6yLK9uH7Wl98wCju
	rgR6QzLOw3JLWuIoaTn22Ex9i41hQzPgzQhAFL0eGHL53DW+BiZC1DsNYT7UJIwe
	UdoorrHF4kuENmcXgSqFyLEtrJxYNpJjbyLSDyS2ITEGTdcfBH4LKskzY2lNYDAl
	D6Y8zGOX6PqSJO6ht6rWfkzH7k1BD9oykO9mngqSn+e1ri7nEYEAeyjWSfs9YkAN
	5t/P1IF3S5Xs6x53VgHjjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707837095; x=1707923495; bh=SWskn1JQAhzyV9QJqVJcUm7BudG2
	qUjNcEm7Vmf1B/w=; b=iS1cULKvrMlmcohLuVHADSQfuzFtZB866GBtCbsJDH4K
	22+T7tJRpGsmjkWmXJlWZf4seyszuJUzWfWo5SABgNsN6voGhHnLswO4/m+y2Zlr
	9kXx0LaMOrK/dAWPCsKxduAbxDFZyxNCqB2YoDlbz39bcQ9vhnRdiLuDzYuJqyXC
	5t7wed+j0encZrFJNST0EpBJXA1LoxYBj19eLKRwfp0K7bkA7x68D1DHnivmNi49
	iwVsHNCxH5jmNJ/kw46I0wUd/NAFe07qSYoi/+p/kl7d4ThJrRS50iRCx/a5Bwer
	rVBw1TunF6CDrqdKgSpW4GB+ZDj5SlA+ufEpWeKeCA==
X-ME-Sender: <xms:pobLZRhi36H75kiXbIVCh0ACcSUHmOLTmOn6gliYvmHDm0eWVYRRHQ>
    <xme:pobLZWBwVCSoaRbuABfOKOu3Vm1bUYKiRRGi5LXqD_PrKIcGbt3THUPiBhohh7ufJ
    rWD3hZX0yo7Jg>
X-ME-Received: <xmr:pobLZRFxyiQN8Hj8M3dFt9ZthFoDeDPtpiH_urdftZk2exLwoOMAgEi7W8fEh5V0jjJpftmCnZqAAM1pq4ZeRlOQOujS5N-WJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihfelhfekhefgveejjeet
    vedtgfduveelgeekteehueeufeefudegveejueefhfenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pobLZWTWVso8mXcWQ9Gk8DxeNpNdffMG1zHio8FVufFK0OB_BSrtgA>
    <xmx:pobLZezkCsRK1TCOPGphXT-aWm4EuytTtFOaziYtCz-g3pqGP8b-dg>
    <xmx:pobLZc4cxnQex18a6-M-abp_7SILuLqB7TAWDsVGCKBgefmlSeQZLQ>
    <xmx:p4bLZVq6Rwjqe_944VaRk4Xxk1D67S4GxrY6QCUuxHfQN-IkvrYiRA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 13 Feb 2024 16:11:31 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Message-ID: <ZcuGo_vQhiTAQep0@mail-itl>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
 <ZcrlcuNU9y8WymiK@mail-itl>
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>
 <ZcuCTnMpFib4ArHW@mail-itl>
 <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m4B4VxtdGezXXxDY"
Content-Disposition: inline
In-Reply-To: <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com>


--m4B4VxtdGezXXxDY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Feb 2024 16:11:31 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers

On Tue, Feb 13, 2024 at 04:00:32PM +0100, Jan Beulich wrote:
> On 13.02.2024 15:53, Marek Marczykowski wrote:
> > On Tue, Feb 13, 2024 at 08:45:54AM +0100, Jan Beulich wrote:
> >> On 13.02.2024 04:43, Marek Marczykowski wrote:
> >>> On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
> >>>> On 08.02.2024 23:00, Julien Grall wrote:
> >>>>> On 05/02/2024 13:27, Jan Beulich wrote:
> >>>>>> In preparation of dropping the register parameters from
> >>>>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> >>>>>> register state needs making available another way for the few key
> >>>>>> handlers which need it. Fake IRQ-like state.
> >>>>>>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>> ---
> >>>>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsisten=
t with
> >>>>>> other console poll functions we have, and it's unclear whether tha=
t's
> >>>>>> actually generally correct.
> >>>>>
> >>>>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if=
=20
> >>>>> run_in_exception() doesn't exist. But looking at the caller, no-on =
seems=20
> >>>>> to care about the 'regs'. So is this just a latent bug?
> >>>>
> >>>> What do you mean by "doesn't exist"? ns16550_poll() assumes it exist=
s.
> >>>> And I can spot any use of guest_user_regs() on the respective generic
> >>>> or Arm-specific bug.c paths.
> >>>>
> >>>>> BTW, do you have an idea why the poll function is not run in an=20
> >>>>> exception handler?
> >>>>
> >>>> "The poll function" being which one? If you mean the one in xhci-dbc=
=2Ec
> >>>> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
> >>>> manages to finally catch his attention.
> >>>
> >>> TBH, I don't know. That's part of the original xue patch at
> >>> https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
> >>> and it works for me as it is.
> >>
> >> "Works" meaning what? Doesn't crash on you? Or does also provide
> >> sensible output in _all_ cases (i.e. including when e.g. the poll
> >> happens to run on an idle vCPU)?
> >=20
> > Generally provides sensible output, for example during boot (it is using
> > idle vCPU then, right?).
>=20
> Before Dom0 is started: Yes. With the exception of the phase where PV
> Dom0's page tables are constructed, albeit in that time window
> guest_cpu_user_regs() shouldn't yield sensible data either. I can only
> say I'm surprised; since I have no way to properly test with an XHCI
> debug port, I'd have to see about faking something to convince myself
> (unless you were to supply example output).

Would you like me to test this series with xhci console? Or maybe add
some extra debug prints and include their output? But note, printk from
inside console code generally leads to deadlocks. What I did for some
debugging was to log into some separate buffer and dump it later.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--m4B4VxtdGezXXxDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXLhqMACgkQ24/THMrX
1yyQAgf7B/1ICb7+VpGmREInGiIW2AOY5R1/IcNPN0lHd5QGLZQqSm7pbhYHUwBT
1rH0cMVn6hhyqA7t1D6Hmuj37SESeC1Pcj5l3jtbXbMjU15gtWzGQh6jJ14L9Ezh
fgUx/7Be076ajBvHz8tL9OqSOIyI/YVRFh6gxU4tAhVIfTS2Kj+fzyfBZMgI/019
a5FxDpP+iTyNeRCKXJO2oAGuxYnvDbLHHcpLcvPmKfeVtNbshjHkrrQyLLhurP3G
rYgrVeAmdvy3eIuII9f1WWuBqvLKAZMr/Si4DyicCFynhjeNpmen9eVI+0J2aUjN
RgnaJhuIn009kJ0dZSqjjdGtW/xt1Q==
=kqUh
-----END PGP SIGNATURE-----

--m4B4VxtdGezXXxDY--

