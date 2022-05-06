Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3892E51CDD9
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 02:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322457.543764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmlva-0004zh-M2; Fri, 06 May 2022 00:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322457.543764; Fri, 06 May 2022 00:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmlva-0004x4-JR; Fri, 06 May 2022 00:34:38 +0000
Received: by outflank-mailman (input) for mailman id 322457;
 Fri, 06 May 2022 00:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5BOl=VO=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nmlvY-0004wy-VV
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 00:34:37 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c142a3e-ccd4-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 02:34:35 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E3C2E32004ED;
 Thu,  5 May 2022 20:34:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 05 May 2022 20:34:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 20:34:29 -0400 (EDT)
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
X-Inumbo-ID: 4c142a3e-ccd4-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651797270; x=
	1651883670; bh=4fuzwXGW6jdzk5aPMIJm9U3GDfDnsy/WcfnqqxRJkLE=; b=n
	scaNm3vHXqKB6RJv9Bg1zliCBfRE1RAuCUQFGM425nIbHlnMrrVMIIJzJnPNQAcZ
	+aDY4IScmrDBhCEUx/iCWptFaaHE5pivFEmn0oIZwK/Sr/ljYNJ6YXY3CuNmxJOG
	0Z1Tim8a5yiSlkhrLEiV02IExvnWLhMnzjG1kxHYABKyygmNu1BUUMWH7yZESZL1
	hsW0S07jFVHqIpYy2N5WihpubvrocP7uIkpXB0QOQbWx8hqMNrLHB0Q++DZk6wme
	kAVUo/ej784Y1ztxFDQlk2S4Dk9FonwAVFe26TRrzXv5jhH3YyMrGRZ6rb7dbl6q
	jzDuvN5qyyXd7ni8vRK6Q==
X-ME-Sender: <xms:Fm10YrBux3QWhZHa9iNbSRccyJMWPWPLiA6vkWAzOtQuxTx3IuyC8A>
    <xme:Fm10YhhdktgvfRUGfg0JSUs5DFdQ6j1tdbSZ569t27VHfzPUAFNN1wHPc8UG30yuA
    Rgo6ClMtVBe4N4>
X-ME-Received: <xmr:Fm10YmmLdU8LArKbczkEPl4_HbJuw21nCVzQxnv6u9H-cdo1IxP7oQKaqf1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:Fm10Ytwd_EeA_8J9ivWDgueIkzYdGoJDXCMcZuCjssbUGz8Z6pWssw>
    <xmx:Fm10YgQjQLSgI0ueuMZbF3jsmAxNlxmAdSZoeU5JFTTh3sQcjAwImA>
    <xmx:Fm10YgYdW59iB9OuEwFiewKqOTiOXST0j0DZmaH2kbCmUUFGV08o7Q>
    <xmx:Fm10YvMa7J4QbrsHL6fqbxD0ACkCx4s9pzY9vNcLajCiIVeiRUcCuA>
Date: Thu, 5 May 2022 20:30:17 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Proposal: use disk sequence numbers to avoid races in blkback
Message-ID: <YnRtFBzfba0OYldx@itl-email>
References: <Yf8h36wj5QWSWEud@itl-email>
 <YgaNeZNSt26oCzbZ@itl-email>
 <YkOgDihJCrtWriDq@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sBH/PEPWRYXGqvzq"
Content-Disposition: inline
In-Reply-To: <YkOgDihJCrtWriDq@itl-email>


--sBH/PEPWRYXGqvzq
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 May 2022 20:30:17 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Proposal: use disk sequence numbers to avoid races in blkback

Proposal: Check disk sequence numbers in blkback
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Currently, adding block devices to a domain is racy.  libxl writes the
major and minor number of the device to XenStore, but it does not keep
the block device open until blkback has opened it.  This creates a race
condition, as it is possible for the device to be destroyed and another
device allocated with the same major and minor numbers.  Loop devices
are the most obvious example, since /dev/loop0 can be reused again and
again, but the same problem can also happen with device-mapper devices.
If the major and minor numbers are reused before blkback has attached to
the device, blkback will pass the wrong device to the domain, with
obvious security consequences.

Other programs on Linux have the same problem, and a solution was
committed upstream in the form of disk sequence numbers.  A disk
sequence number, or diskseq, is a 64-bit unsigned monotonically
increasing counter.  The combination of a major and minor number and a
disk sequence number uniquely identifies a block device for the entire
uptime of the system.

I propose that blkback check for an unsigned 64-bit hexadecimal XenStore
entry named =E2=80=9Cdiskseq=E2=80=9D.  If the entry exists, blkback checks=
 that the
number stored there matches the disk sequence number of the device.  If
it does not exist, the check is skipped.  If reading the entry fails for
any other reason, the entry is malformed, or if the sequence number is
wrong, blkback refuses to export the device.

The toolstack changes are more involved for two reasons:

1. To ensure that loop devices are not leaked if the toolstack crashes,
   they must be created with the delete-on-close flag set.  This
   requires that the toolstack hold the device open until blkback has
   acquired a handle to it.

2. For block devices that are opened by path, the toolstack needs to
   ensure that the device it has opened is actually the device it
   intended to open.  This requires device-specific verification of the
   open file descriptor.  This is not needed for regular files, as the
   LOOP_CONFIGURE ioctl is called on an existing loop device and sets
   its backing file.

The first is fairly easy in C.  It can be accomplished by means of a
XenStore watch on the =E2=80=9Cstatus=E2=80=9D entry.  Once that watch fire=
s, blkback
has opened the device, so the toolstack can safely close its file
descriptor.

The second is significantly more difficult.  It requires the block
script to be aware of at least device-mapper devices and LVM2 logical
volumes.  The general technique is common to all block devices: obtain
the sequence number (via the BLKGETDISKSEQ() ioctl) and its major and
minor numbers (via fstat()).  Then open /sys/dev/block/MAJOR:MINOR to
get a directory file descriptor, and use openat(2) and read(2) to get
various sysfs attributes.  Finally, read the diskseq sysfs attribute and
check that it matches the sequence number from BLKGETDISKSEQ().
Alternatively, one can use device-specific methods, such as
device-mapper ioctls.

Device-mapper devices can be detected via the =E2=80=98dm/name=E2=80=99 sys=
fs attribute,
which must match the name under =E2=80=98/dev/mapper/=E2=80=99.  If the nam=
e is of the
form =E2=80=98/dev/X/Y=E2=80=99, and the =E2=80=98dm/uuid=E2=80=99 attribut=
e starts with the literal
string =E2=80=9CLVM-=E2=80=9D, then the expected =E2=80=98dm/name=E2=80=99 =
attribute should be found by
doubling all =E2=80=98-=E2=80=99 characters in X and Y, and then joining X =
and Y with
another =E2=80=98-=E2=80=99.  This accounts for LVM2 logical volumes.  Alte=
rnatively,
one can use device-mapper ioctls to both check if a device is a
device-mapper device, and to obtain its name and UUID.  I plan on going
with the latter route.

There are *many* other rules that might need to be followed, but these
are the most important ones.  In particular, this is sufficient for
device-mapper devices, which are by far the most important case for now.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--sBH/PEPWRYXGqvzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ0bRMACgkQsoi1X/+c
IsFN5xAAlusB3Q7DsZRqGMbud2GkOlcxHockfDCNpbmFNwSAF8fqpahqKm33dTq9
v8veYst4jCKcEJqUiqU8rb8syGvBP6DW/PR162k/0uxtX4ox9+mxj7VtcZ/ReSQR
tVN12gPHQzxhImXtTdg5vuw6qbAs4Ykch1kc+febuq4IzXzWhyI5e4DaEk8Wpmq2
ZsX9RKY/dRN9rEt5WRd66B7v4cCItA2t9lMpus6QN4uRq0SnSRqutemjr/m9vTYj
thGRYskXub8SshzNUjnkwe4fBpNjfY43FXLPhJn0qzwL+OEh3bTHqNVfrJ0VAiPM
Ao8+3Oiy4ENef5dJhUaBuDR4fY2UweZyuZ0J14nJ3x/eLWndIQSNu9QM7K+jYFul
jGkHVjm6GxzmHcwHonksr8Hh31HwZBpmC5G+O71aW/sV7c8AtOP5N6oJHAjR7mez
QMaxZaIYF2ih2mtRgyfD9CK855IfssMHkspg3zkiYQiDkGiUd77qzpxVE3/Jn2VR
ik/FxbO/4K4+gB58H/Pgo4Gwp/jml8Px5IHJ6C3PxUXQr+YRhhsNmiTEK3c8UHNr
Io2peTvFAJqaNE6Y8sx4udlxMCvmZGorFtlrwAvULtfVn0aonM+DKMfElvN7vaDB
NViuqGND+XU8Eg2P/an74AuV/vikLdijtWCXOHTFbJkLWoZKZvg=
=zoaQ
-----END PGP SIGNATURE-----

--sBH/PEPWRYXGqvzq--

