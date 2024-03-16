Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAD87D826
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 04:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694135.1083051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlKdW-0007a7-95; Sat, 16 Mar 2024 03:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694135.1083051; Sat, 16 Mar 2024 03:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlKdW-0007XS-6M; Sat, 16 Mar 2024 03:23:06 +0000
Received: by outflank-mailman (input) for mailman id 694135;
 Sat, 16 Mar 2024 03:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ATQ=KW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rlKdU-0007XM-Ir
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 03:23:04 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e261e40-e344-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 04:23:01 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D1D05C004F;
 Fri, 15 Mar 2024 23:23:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 15 Mar 2024 23:23:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Mar 2024 23:22:59 -0400 (EDT)
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
X-Inumbo-ID: 7e261e40-e344-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1710559380; x=1710645780; bh=JG
	KYRygn5+9kiCBHJyMLdgRVPh3h1+QHe7wMvEDshX4=; b=IcKkSERbS/GWt9n5ac
	NtsdYKqbxPnMZJ45Scp6hBk43AtiEw+JPQCX33ddogfP8c8QVcd2BPdfxxPhcKTx
	0P04TYcudKJumskb4LaSwEJyLR57txdKkwaIsfZVfu1sMQUM9Ps6UGlE8toP5lZJ
	CohbAf3EJcI5BbiIwxc2jdM57oPcYRCcPDtjaFEb8/hXVPferDxzTMHyUhFk9nE9
	0wNfo6LhjeiGcs/ISNbnqZB9PUXWbLB1+QkFL9ury3NSgaZawMOjk7nZvg/pAsx3
	zeVeg83aRJyDn+tDoRibECimS7OwDQSSTfyc3Fv8O2DJgJT+WjSqsI+/97lkHkz6
	XfQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1710559380; x=1710645780; bh=JGKYRygn5+9kiCBHJyMLdgRVPh3h1+QHe7w
	MvEDshX4=; b=qOuAL5SNITcwXg1l/GzJJRTIKI0rRUeKNYjyQbmg1pxMKR22otT
	GNYtLweSrclIOb07JMURQ5OdVN+QZfW+RwQfJVAxQqwdh4wKVGBq4Jo6G0WLoED2
	V8ZImSbiYFeZJA6UGMh6yZh4PXB4iPbWvn7OcQAh7HRm3IK7OVNRxXDprHhMdkaa
	xrtDEOFbt7tmZ5UeGIULIUdvGG8Wvk9ko0CHfAEnoCSwN6VddQ62toaj48BqUO4f
	p+EvDPYfm7HI4MppcG7YyPSMjg8NOqH3meP0Onoh/aVozxIWsZuz+mplLqqqL/hv
	GFhaFCncsPZDny6CDRkoRe1hHVkOn8HQj2A==
X-ME-Sender: <xms:lBD1ZSyNOedvRgrjiLgSCyaYsLCR0KFEISmNaNRUjhrgwSsiiejQiA>
    <xme:lBD1ZeS_3LyxZX3bVGtnCUMuRO5Mtdmp8G2BTNcUJRDAkaA_q172s_EQ-UGRsq2ug
    ACdGR7BoiMkPA>
X-ME-Received: <xmr:lBD1ZUXk9FNvERd6FfaHYg2J5q6XFOPVWeXl8hZHPost96tK1vzm8Ea9Fg3qvg-Bq1nwjohO60sLDc8YDYUsDU7vSbvrOXxocA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkedtgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeltdek
    kefgieekjeejiefgvefhudfhvdduhfdtvedufeefhfehteehieehteenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:lBD1ZYib2k5_h80lilSDZaqjm6Np4PNlcZ8Jer2oxOC7BJDVHNfXiQ>
    <xmx:lBD1ZUAtdIiKHF_c-ZAaOjwFqSc1LQNeKwhJxDklz5QxUwmULSFVxg>
    <xmx:lBD1ZZJgBTJALJI_yR8ArPkMfZpCmL2pSlN6nCJREP-HtlKn-4cBhQ>
    <xmx:lBD1ZbDbQjbVBk_vVqKZEYACkBqcoKUMjn0i0FiK6kkgeJXiW6qilw>
    <xmx:lBD1ZXOiH8ajM0YSPLtluKB6l2EXZxrXv5wZDuPwZzsSlG0pD1q1BQ>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 16 Mar 2024 04:22:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Simon Gaiser <simon@invisiblethingslab.com>
Subject: Status of S0ix with Xen
Message-ID: <ZfUQju8HBEkJNnKh@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PeMlmw02okIHY8Dx"
Content-Disposition: inline


--PeMlmw02okIHY8Dx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Mar 2024 04:22:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Simon Gaiser <simon@invisiblethingslab.com>
Subject: Status of S0ix with Xen

Hi,

S0ix came up in a recent discussion, so let me post a small status
update. We have patches that makes Qubes suspend with ~90% S0ix
residency. It's significantly worse than native Linux on the same system
- that gets 99+%, but still a significant progress.
We do have a tricky case though, because we use PCI passthrough, with
stubdomains.

A summary of changes required is posted by Simon in a tracking issue[1],
but let me post it here too:

    So currently on my test system (NUC11TNHi5) I'm being able to reach
    S0ix residency with only dom0 running for nearly 90=E2=80=AF% of the su=
spend to
    idle time. (That's still worse than native Linux with >=C2=A099=E2=80=
=AF%.)

    Used changes:

     - Xen
       - Disable HPET legacy mode after it has been userd for IOAPIC
         test during boot ([upstream discussion](https://lore.kernel.org/xe=
n-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/),
         including minimally required diff)
       - Tiger Lake support in Xen's mwait-idle driver. Unlike Linux'
         version of that driver Xen's only supports the CPUs for which
         it contains a hardcoded config. For the moment I just manualy adde=
d the
         config Linux is reading from ACPI. Needs to be tested if this is
         actually required (see also
         [Jan's comment](https://lore.kernel.org/xen-devel/f6c27788-bdd9-e5=
b1-a874-7f48a27c66a9@suse.com/))
       - Allow reading of S0ix related MSRs. Not sure if any of them is
         strictly required to get into S0ix states, but at the very
         least you want them to be able to debug things (for example via
         `/sys/kernel/debug/pmc_core/...`)
       - Teach `cpu_idle.c` that Tiger Lake also has PC{8..10} (for proper =
debug output)
       - Disable `ondemand` cpufreq governor (both `powersave` as well as `=
perfromance` work)
     - Linux in dom0
       - Add wakup support to `xen-pirq`
         ([patch](https://lore.kernel.org/xen-devel/20230313134102.3157-1-s=
imon@invisiblethingslab.com/) sent upstream)
       - If using a SATA device you need to enable low power mode for
         link management (`echo min_power > /sys/class/scsi_host/host0/link=
_power_management_policy`, tried to get
         it [enabled by default](https://lore.kernel.org/linux-ide/20230213=
102450.1604-1-simon@invisiblethingslab.com/)
         but that's
         [not so easy](https://lore.kernel.org/linux-ide/ad02467d-d623-5933=
-67e0-09925c185568@leemhuis.info))

    First tests with a running guest and investigating the difference to
    native Linux are progress (the later is probably due to some timer).

Since the above update, few more things came up:
1. Thunderbolt driver in Linux does not support suspending when kernel
is built with CONFIG_HOTPLUG_PCI=3Dn (which is the case in Qubes). We have
a hacky workaround at [2] (the first patch), together with more details
about the issue in the patch description.

2. When toolstack issues "suspend" command (via xenstore
control/shutdown), Linux uses "freeze" path, that doesn't put devices
into low power state. Changing that to "suspend" path helps (the second
patch in [2]), and for our case seems to have no negative consequences.
But we do not use live migration nor save/restore - which is another use
of this feature, and we have not tested if this still works.

3. QEMU emulates (instead of passthrough) power management related
config space. This is fixed at [3]

The relevant patches are all linked in pull requests connected to the issue.

This is still work in progress. Some of the patches were already posted
to relevant mailing lists, other still require some more work and will
be posted later. I'm posting it here mostly to share that we are working
on it. But also, if anybody wants to try it out and maybe help
improving, the patches are out there.

[1] https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-153808=
9344
[2] https://github.com/QubesOS/qubes-linux-kernel/pull/910/files
[3] https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/63/files
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PeMlmw02okIHY8Dx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmX1EI4ACgkQ24/THMrX
1ywKngf/WbytYRhVxqGN+4F/FXKdP8I2vfrQTWYOK6FpP7vAuijgaTBtO6Z3Q5VK
izGubqVrrANF5xw+fsalsbXwsbE+Z/kjzHz9qGKzjBrnqu0hK7nxArDcRmGbH4ej
+uacy3SmY7fU6OxBzEtYbzomq9MF+ZgNrzQ63luO6g0c1vsRcdF3gFxKEpXArnQD
wUlqhJ4fnNRaKQQuEk9VZp1/eaN5nUTNEse1zz36z7FM0qWKmaTPQfuCfMTsRvZo
q3dwbnnyr8pXOw6isae47BWurkSErJkZ6UWfFuKdvpxqv+1mxJCjwZJW7ft/+eLn
dXVV9QOWUNQbegJapSwC6A5sW+0hKw==
=aNDT
-----END PGP SIGNATURE-----

--PeMlmw02okIHY8Dx--

