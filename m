Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65418649885
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 05:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459030.716696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4aqP-0001LF-Q1; Mon, 12 Dec 2022 04:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459030.716696; Mon, 12 Dec 2022 04:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4aqP-0001JP-JY; Mon, 12 Dec 2022 04:55:13 +0000
Received: by outflank-mailman (input) for mailman id 459030;
 Mon, 12 Dec 2022 04:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PhXI=4K=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p4aqN-0001Hu-6j
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 04:55:11 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b2d22b-79d9-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 05:55:07 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 35E0932008FA;
 Sun, 11 Dec 2022 23:55:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 11 Dec 2022 23:55:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Dec 2022 23:55:02 -0500 (EST)
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
X-Inumbo-ID: 24b2d22b-79d9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670820902; x=1670907302; bh=/fhhuNHSw9
	AVcLNazlLsxWzz1tsOBeVmZMRVG4LPq0o=; b=pMhY8wnslbqLJ0WUkRqig4Z7Xo
	8vJ/ohx2mt48CdZRj7cOqlbHSM2KTiEqw/HJQdYQMFt0nMhPro/5muEC9L68MNiM
	6NEkbQrs3QmxfjS6UB3Fid4LiWz0sNWAOUiMgaOvVi+CPFTj2VNXqEKemkrLS7dh
	5W8XX2uQJmBg6vMLYJhF/3WFCiPeTiQgaXwkg4g5VmuX9mmgYdss2YXuB79aFA9w
	KDO1fiWUq60FTaHi7e72KQXkOs14ohyubV5oKYVIH38MJJ1/xCwHSHVobk1cTHl+
	JK11iKYyrWCp52GBpEfxTuUZ29BPKsyofAV9/1FKl8453jrt2BczdRWoQNWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670820902; x=
	1670907302; bh=/fhhuNHSw9AVcLNazlLsxWzz1tsOBeVmZMRVG4LPq0o=; b=X
	BeU2CBA+jpllJaDmiKLTFGdj/sQeJjNoV0wTtXXietnZ1kSCiJPhOOCiygbzIs9u
	1XuVa0fHf11zAlX/LtJzCgCG6zVTJR/SwDI5yPKlooMTKda+jwHwNIFIznbxqUgN
	Gbg+rVAgxcQ0IAzAQx7yPEE4pW8KGOMgXhXuI9/PbZPbwVItRk5wY+wgMc7bVBrJ
	EalkXa59ofHxEdMC/wDUMHik1h38DJd/wQVQecXq1juy8JgdHpHlE6IOAb5aQmZ5
	oEPss4JcYuU20MS9QkLHPXqfHhjE3Sa8NYgJGQ0bhsGMKLByKMoE+4lfDs+E39jL
	g2dZHWfULDADqb9A4pEmQ==
X-ME-Sender: <xms:JrSWY64mizyAnnLG0UqXDbPpe5ApUi5_wnPS-zyFZ4Ho4xKDz0cT1A>
    <xme:JrSWYz7oXaDYIqqbpGb57TrX8o8qB2faIwTmpCWHkrIMuwKDQ8qlVCjfmUIGUB42P
    5pMRfmIb9fUHxE>
X-ME-Received: <xmr:JrSWY5fuK3sbxtp-gvxHaPxhO_Ne2Aty7UfTaTMGhyXxtTgxInPUf_RBwf5Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtgfgjsehtqhertddttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejudfgieeviedtgfdvheejueefkeef
    tdetffejfeduteehhfetuedtieffvdejffenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:JrSWY3KsJxTJPYAyrWLlJmtt9_0jmAz5fTYbKIdYAwTd3pKk7-vPNw>
    <xmx:JrSWY-KcLkuKcnhY2IizoIGyF7mZOzAuL3Z4nya1hGOsMVBSuvwAnQ>
    <xmx:JrSWY4x0CgGC4jvxwPwpgeKe1lS-i0DZQSHDPQKctFJyAnX0o1WQ1A>
    <xmx:JrSWY61foFJPSAB_Y0OSh52C_mGFCjhzv15iDrJ8qcTrOvvPJXWqXQ>
Feedback-ID: iac594737:Fastmail
Date: Sun, 11 Dec 2022 23:55:00 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marco Elver <elver@google.com>
Cc: Juergen Gross <jgross@suse.com>,
	Alexander Potapenko <glider@google.com>,
	kasan-dev <kasan-dev@googlegroups.com>,
	Xen development discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: kfence_protect_page() writing L1TF vulnerable PTE
Message-ID: <Y5azcFUxAWuEVicY@itl-email>
References: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
 <Y5ZM3HCnTcLvP2vy@itl-email>
 <CANpmjNPZwtmMvAOk7rn9U=sWTre7+o93yB_0idkVCvJky6mptA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANpmjNPZwtmMvAOk7rn9U=sWTre7+o93yB_0idkVCvJky6mptA@mail.gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

- -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

- - -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Sun, Dec 11, 2022 at 11:50:39PM +0100, Marco Elver wrote:
> On Sun, 11 Dec 2022 at 22:34, Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> > On Sun, Dec 11, 2022 at 01:15:06PM +0100, Juergen Gross wrote:
> > > During tests with QubesOS a problem was found which seemed to be rela=
ted
> > > to kfence_protect_page() writing a L1TF vulnerable page table entry [=
1].
> > >
> > > Looking into the function I'm seeing:
> > >
> > >       set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> > >
> > > I don't think this can be correct, as keeping the PFN unmodified and
> > > just removing the _PAGE_PRESENT bit is wrong regarding L1TF.
> > >
> > > There should be at least the highest PFN bit set in order to be L1TF
> > > safe.
>=20
> Could you elaborate what we want to be safe from?

The problem is not Linux=E2=80=99s safety, but Xen=E2=80=99s.  To prevent P=
V guests from
arbitrarily reading and writing memory, all updates to PV guest page
tables must be done via hypercalls.  This allows Xen to ensure that a
guest can only read from its own memory and that pages used for page
tables or segment descriptors are not mapped writable.

> KFENCE is only for kernel memory, i.e. slab allocations. The
> page-protection mechanism is used to detect memory safety bugs in the
> Linux kernel. The page protection does not prevent or mitigate any
> such bugs because KFENCE only samples sl[au]b allocations. Normal slab
> allocations never change the page protection bits; KFENCE merely uses
> them to receive a page fault, upon which we determine either a
> use-after-free or out-of-bounds access. After a bug is detected,
> KFENCE unprotects the page so that the kernel can proceed "as normal"
> given that's the state of things if it had been a normal sl[au]b
> allocation.
>=20
> https://docs.kernel.org/dev-tools/kfence.html
>=20
> From [1] I see: "If an instruction accesses a virtual address for
> which the relevant page table entry (PTE) has the Present bit cleared
> or other reserved bits set, then speculative execution ignores the
> invalid PTE and loads the referenced data if it is present in the
> Level 1 Data Cache, as if the page referenced by the address bits in
> the PTE was still present and accessible."
>=20
> [1] https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/l1tf.html
>=20
> This is perfectly fine in the context of KFENCE, as stated above, the
> page protection is merely used to detect out-of-bounds and
> use-after-free bugs of sampled slab allocations. KFENCE does not
> mitigate nor prevent such bugs, because it samples allocations, i.e.
> most allocations are still serviced by sl[au]b.

It is not fine when running paravirtualized under Xen, though.  Xen
strictly validates that present PTEs point into a guest=E2=80=99s own memor=
y,
but (in the absence of L1TF) allows not-present PTEs to have any value.
However, L1TF means that doing so would allow a PV guest to leak memory
=66rom Xen or other guests!  Therefore, Xen requires that not-present PTEs
be L1TF-safe, ensuring that PV guests cannot use L1TF to obtain memory
=66rom other guests or the hypervisor.

If a guest creates an L1TF-vulnerable PTE, Xen=E2=80=99s behavior depends on
whether it has been compiled with shadow paging support.  If it has, Xen
will transition the guest to shadow paging mode.  This works, but comes
at a significant performance hit, so you don=E2=80=99t want that.  If shadow
paging has been disabled at compile time, as is the case in Qubes, Xen
simply crashes the guest.

dom0 is exempted from these checks by default, because the dom0 kernel
is considered trusted.  However, this can be changed by a Xen
command-line option, so it is not to be relied on.

> How can we teach whatever is complaining about L1TF on that KFENCE PTE
> modification that KFENCE does not use page protection to stop anyone
> from accessing that memory?

With current Xen, you can=E2=80=99t.  Any not-present PTE must be L1TF-safe=
 on
L1TF-vulnerable hardware, and I am not aware of any way to ask Xen if it
considers the hardware vulnerable to L1TF.  Therefore, KFENCE would need
to either not generate L1TF-vulnerable not-present PTEs, or
automatically disable itself when running in Xen PV mode.

In theory, it ought to be safe for Xen to instead treat not-present
L1TF-vulnerable PTEs as if they were present, and apply the same
validation that it does for present PTEs.  However, the PV memory
management code has been involved in several fatal, reliably exploitable
PV guest escape vulnerabilities, and I would rather not make it any more
complex than it already is.

A much better solution would be for KFENCE to use PTE inversion just
like the rest of the kernel does.  This solves the problem
unconditionally, and avoids needing Xen PV specific code.  I have a
patch that disables KFENCE on Xen PV, but I would much rather see KFENCE
fixed, which is why I have not submitted the patch.
- - - --=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
- - -----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOWs28ACgkQsoi1X/+c
IsEvBQ/+MLAfhKAxmMAto9jII+4SIq6vXHvhNJfC+qyMPCToTI1QLiwGLOAXM7uk
nrnFh+eA9Tx1iYJyP6jZpKqWHFLtXNIh+QE+6gag1rMYjCeJyl6Y0bgmxw7EgJ4t
uACncw+N72CopWu9Yg2YNH9wahX7EX4/q+3FA2xzsYd/XgXOEVEF9h3vgnzDOVTJ
02/Q4c4P/YH+I0aLkD3lamwdBTeE2f+5h+kDFxib/qu1lHLVbC9Lx45/T2dUoWVa
K3uRPAzwwLQcxB1Q8wGHKj7ziEwygqKRoD8QYwMU67OdB0UsTQ+f5hH8JUgevm8V
po0T/cQDaAnJi0y9jcjUd4eyeOHZmbzjro+YAqOgkGGhs+TJwhU5VuDHD26z+0g3
dRaunQ7YFWrEFbeAmV0hK39x40nRdR42YRj6Q/uYhZcaORDeG+e5FshyeUesQfDW
B9r5Lvl6/V0ldgPHL/AyGFI/fZBUJhju3QyXNLML1xrv19j24Ku+bhKDjxSrHYlJ
nvxYo6zFhMkgRxTYNIrZUA70Xn3wDtJwFKGlKNmWRy4Hjfxy2tyIQnp00j+MDseY
fftXjlAPxm0am3lYHlp4u3L5hK1aY0l0mCdGjjP7geeEKK9f2Q009uTeywavOkAB
bAKQ9VNWrj7SlRhbK86sHi0zYTvNN+tF9/x32jUu1lSz+jyMfLM=3D
=3D3TnU
- - -----END PGP SIGNATURE-----
- -----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOWs/wACgkQsoi1X/+c
IsGDew/8DrvkeG5llY9Q9NFXfBPCNeu5WfK2Sbll892izQAl0l+JILKHG7AQqsRf
/avO3U5US64acEsL2PqugK1BDDYPK097WNJtV3/nb6IUL+A3UrMtq3a6bqCWMULY
FaCTqAe9ESYLS2NA4rqcqsCvGcR0PYM8fALqq+xHUr102rXyo+jGoOxCh6emuImg
UittOmEhslRtIJtiDgUHgQkff8xBllztVE1MaDeMIEO2D+uvKWD+7SYli+O3USAj
lNKlVPzHAwQnUs9AP++FVz0yVzcoyXcIsi14oFxSHR+EqqacxvtG60iWKcU6I8nr
zySMyjlN8rZcq/QpukYFAPkJL63m1zefHBWeLFzNcv5Mrar0L4cWpM+jLZyh/fJE
JQ2YuDt8Z5mhrs8KQJBdf96QSgOgkreMQ6IWNnPGiAwIW85wwsU1iJa8AjIEe8PN
t4EleqLqsgn9nihBreJZ77f/xKAWKK/VN6FOXGOuFZO/FrvPpP0KAHQpRugMmDZk
NOGJKcWfruAZ11HQTFK1qelLg0n2SBSzw5KxKyxntazvx80W+FzwwzJJz2T3z06g
58sCdyXqrzhSv55pfTX94suX+w3pqcwJID/XMjelPtvcVtvosugHmaCEKTHEX5zo
QKZRoHELiOymXsy7kSP8NMpiuyfrjAsYFY2NGbTS5Mb6+ApHT2s=3D
=3DgX1O
- -----END PGP SIGNATURE-----
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOWtCMACgkQsoi1X/+c
IsGPlQ//QaynWUjFxss7xGDDU3adTawbb5KHgxcaHQKsUCgDMqOYZ6wIm6VeiBgJ
OxX14wucGTKVYN0JSMqn1UpJgxVmMtwMTXMuIjz+oTdd3Ab/cQejqGV2ZiiW/KWH
Hq3jWqoqXL9R0sMmGmeq2Kyi1+XL78KhWZIkJ4eEKYhRdLIG9/q27EeH3ppdH6Kt
AamU0Bq1aatOW3+Y6C+FPjsLrHP16vWZInaoy+UqE0E7B4VcAC2wPcPVbwbF7SJc
KP4YaE3W95Zvl7TWxtOWWzZzKP3A6waiyY289+Kf7Xgs2rQOgNnQuR5JEGqxABwZ
LfbATY1uT9akgf62IevmGj3694ZPLVfgqr3d7057QfMCZLjAG5ZioIzCe7drCZ+3
91zM0+ykWYIqanab327lpduOkHHSJC0P1Jvzx4yxqo1PvgqhEHhp3jcXS6amCm9e
l4RVmAVm+UujZ1vbrTG7PcJgb5jbrtLKInhmYiiXGgS1zhxsty/MUCiy5YgjD5n1
vl+8/8/kiI4el/hjbqUbDjjItDmHn9kVZHfY5G1dT6lHZkNk6NI93IB6EcxZx1af
fNoxR904M7Y53yUI1sJpdeOhEsNHUeV5dgqbJxwTxKRuDNu4E89FDvRr3YMSbusk
7nU6+DVJaWRn05lq0lT2HsU401ECx383Pr5/lmvHCRdNuEOTwyo=3D
=3DjVTg
-----END PGP SIGNATURE-----

