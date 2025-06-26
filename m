Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F8AEA1CF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026633.1401815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo84-0001Bl-9Q; Thu, 26 Jun 2025 15:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026633.1401815; Thu, 26 Jun 2025 15:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo84-0001AH-6V; Thu, 26 Jun 2025 15:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1026633;
 Thu, 26 Jun 2025 15:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBQK=ZJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uUo82-0001A8-MJ
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:03:06 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6385bf5-529e-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 17:03:00 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E5F541400031;
 Thu, 26 Jun 2025 11:02:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 26 Jun 2025 11:02:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 11:02:57 -0400 (EDT)
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
X-Inumbo-ID: a6385bf5-529e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750950178;
	 x=1751036578; bh=JNKituUeUdPKycoRaCS6tsxKpHjrP5kr9AX5sCJlG2o=; b=
	AR3IGma44pqJ9YfFSPNR+ah4Qq7Vzt/H1JdIo8ulRc2MnMygLYjnokYzgXU5CmCC
	S2Gi44bdyx18ZSRTAg3vTPXnCWYU21vmBOPrM/958EEmUgD4U4cHMLpdD/HskUwJ
	CEO5FRIXWbuH2TLhbrUXuh6Ar0YkR8gMBiiwl4B/tcXyJCA1hjfKRpYgO8rGHVnI
	3BEjf47KLj5lM8rq5f8Ox61HRuZ+kjooIolUd2ZkwKDVv4lHJcyICh1/oPILfLPl
	/Tn1B/4bHRpc2Qm4FhMYhoiYRaSXNbLbRVxQX824QN8Gi2HyD/6sIDDYqh2MRLZL
	RlEaCG4xvoAKhTj1DOAYPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750950178; x=1751036578; bh=JNKituUeUdPKycoRaCS6tsxKpHjrP5kr9AX
	5sCJlG2o=; b=Rea3kE3/VpHeFV54ukdO8odFCAEvUjlzjMZ7L7rBfTkrqadrlgf
	VaPd60MWtjv2fOh9ZDRlUHEzXE1gGn++fa+36WwUJK5MhPwFue1o3CZDUT1xdpzB
	8YyR/GptLmfsoZX5n+eBv8jSReOYff/ov4CbM8lsLWJCXR3u9Yh4VrKCiZKFG3qZ
	hUuzeGcS8dl1LgQXru52ocSmzCzVkpk0TuDn3z6UDmR5Ns5HgmjY8dJuA8clctS7
	YDtC/jYiSyIFFnn0hRdoDaL+auX4BTQeSGMeJCpEAqhlKYPcNNr5oV4/4i9EwfSo
	F+zLJJAMNIofR7mu3gtkoR7lxWQAeTu2RzA==
X-ME-Sender: <xms:ImFdaNLss9SDJXjzJ6zimjc-ebcERmNHkeBvtcYuTZifoO-PCzef7Q>
    <xme:ImFdaJKd7uy-Co1ATgJOo5NoZamIToCXnV6enVDbchPsIIwzDkS6joxppkv7UuU-f
    7XNlkJBs--fow>
X-ME-Received: <xmr:ImFdaFubIhnEN2ac3YYq5We-HE2S7TbeThSgqREHt8RaxMQVmKlBa6I_lWSDI1yRjLCLB_KYpttMFeV4pGEyKVpJQOcqddVgOqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgleegveffkeei
    keejjefhudelhedtgeefieefueeitefgvdeiheeuledvffefvdenucffohhmrghinhepgh
    hnuhdrohhrghdpghhithhlrggsrdgtohhmpdhqvghmuhdqshhmohhkvgdqgiekiedqieeg
    qdgvfhhiqdhukhhirdhshhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehfrhgvughirghnohdriihighhlihhosegtlhhouhgurdgtohhmpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghp
    thhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:ImFdaOZTFzKlja5jqbRRQkB7q9njaHCuEN3eW9EWGRzjA3kQurecWw>
    <xmx:ImFdaEYhm1EZMY4KR8gk65ozNRD1oEl_AgLsMT1IlT1zAJ_hXZdD2A>
    <xmx:ImFdaCCrYADaDdWfn276Y6i89vUdKrqVlQa3j6TfaI45bq3Bo1MZgA>
    <xmx:ImFdaCYuBfetgP86WJZ6SDj85MmAbR2D97NzpwOvznU6hQ7iRV6-yA>
    <xmx:ImFdaAGpOnXTOKmpArpptduZoAqkllSqaIoE7i09lgDyyirXPncwkVei>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Jun 2025 17:02:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2
Message-ID: <aF1hIARPp6a0wWmi@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl>
 <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f4hgJwe7T6D4GLZx"
Content-Disposition: inline
In-Reply-To: <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>


--f4hgJwe7T6D4GLZx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jun 2025 17:02:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2

On Thu, Jun 26, 2025 at 09:12:53AM +0100, Frediano Ziglio wrote:
> On Wed, Jun 25, 2025 at 9:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> > > On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> > > <frediano.ziglio@cloud.com> wrote:
> > > >
> > > > The combination of GRUB2, EFI and UKI allows potentially more flexi=
bility.
> > > > For instance is possible to load xen.efi from a no ESP partition le=
aving
> > > > a boot loader like GRUB2 taking care of the file loading.
> > > > This however requires some changes in Xen to be less restrictive.
> > > > Specifically for GRUB2 these changes allows the usage of "chainload=
er"
> > > > command with UKI and reading xen.efi from no ESP (so no DeviceHandle
> > > > set) and usage of "linux" and "initrd" commands to load separately
> > > > the kernel (embedding using UKI) and initrd (using LoadFile2 protoc=
ol).
> > >
> > > I was forgetting. If somebody wants to test "linux" and "initrd"
> > > command with these changes be aware that GRUB currently has a problem
> > > passing arguments, I posted a patch, see
> > > https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.html.
> > > I also have a workaround for this issue in xen but it would be better
> > > to have a fix in GRUB.
> >
> > Can you tell more how to test this, especially the second variant? When
> > trying to use GRUB linux or linuxefi commands on xen.efi, I get "invalid
> > magic number" error.
> >
>=20
> That's weird.
>=20
> Be the way. As usual I have a super complicated script that does everythi=
ng.
>=20
> But to simplify:
> - I compile xen (plain upstream plus my patches) with "make -C
> ~/work/xen/xen -j O=3Dnormal MAP"

Is there any that would be related to the "invalid magic" error? IIUC
without your patches options will be mangled, but I don't think I get
this far.

> - output xen.efi in "~/work/xen/xen/normal/xen.efi"
> - add configuration and kernel with "./add_sections xen.efi
> xen.unified.efi .config xen.cfg .kernel vmlinuz-xen"
> - boot using patched Grub (or patched Xen, to handle command line, if
> you don't care about command line you can use a stock one), the menu
> entry is
>=20
> menuentry 'XenServer (Serial)' {
>         search --label --set root EFI-BOOT
>         linux /boot/xen.unified.efi -- com1=3D115200,8n1
> console=3Dcom1,vga dom0_mem=3D1232M,max:1232M watchdog dom0_max_vcpus=3D1=
-4
> crashkernel=3D256M,below=3D4G -- root=3DLABEL=3Droot-qjhppe ro nolvm
> hpet=3Ddisable console=3Dtty0 console=3Dhvc0
>         initrd /boot/initrd.img
> }

All looks quite similar. FWIW my setup is:
https://gitlab.com/xen-project/people/marmarek/xen/-/blob/test-uki/automati=
on/scripts/qemu-smoke-x86-64-efi-uki.sh?ref_type=3Dheads

Booting such UKI from OVMF directly works, as well as with
"chainloader" grub command:

https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1891308263

CI uses Grub 2.06 from Debian, but I get the same result with 2.12 from
Fedora too.

>=20
> xen.cfg file:
> ----------
> [global]
> default=3Dxen
>=20
> [xen]
> ----------
>=20
> add_sections file:
> ----------
> #!/usr/bin/env perl
> use strict;
>=20
> die if $#ARGV < 1;
> my $in =3D shift @ARGV;
> my $out =3D shift @ARGV;
>=20
> my $max =3D 0;
> open(IN, "objdump -h $in |") or die;
> while (<IN>) {
>         next if !/^\s*\d+\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+/;
>         my $val =3D hex($1) + hex($2);
>         $max =3D $val if $val > $max;
> }
> close(IN);
>=20
> sub up($) {
>         my $n =3D shift;
>         return ($n + 4095) & -4096;
> }
>=20
> my @args =3D ('objcopy');
>=20
> my $start =3D up($max);
> while ($#ARGV >=3D 1) {
>         my $name =3D shift;
>         my $fn =3D shift;
>         push @args, '--add-section', "$name=3D$fn";
>         push @args, '--change-section-vma', sprintf("%s=3D%#x", $name, $s=
tart);
>         $start +=3D -s $fn;
>         $start =3D up($start);
> }
> push @args, $in, $out;
> print "Executing @args\n";
> system(@args) =3D=3D 0 || die "Error!";
> ----------
>=20
> My script creates the initrd, builds a full disk for Qemu and launches
> Qemu too with specific options.
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--f4hgJwe7T6D4GLZx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhdYSAACgkQ24/THMrX
1yz2/Af/bZ9rJzhMGKYOuWLllBLQQj1vZrLMSvyPU2ae7uwUupuMcEJ/nkfrguNm
Gsq7RYM2AL7B0i3xizwWF/idND7Po5dwUnFvjS209DKeoABQ+bAhc33Y43CGbWAj
/1AVMtLAXIMRvMc86aqekPh1lK6o1wgSXYY/PJ/r1ZU5CsQB+3W1maCbU8BwyOU0
2S++KWWbAViGkjVo/hnRVPvjHHG6jEc+X9eP506pE7/0Y5Qmp84lFSP2tOLd0LT2
sNB6RHWIJ7qGZHYEATyw8dqGx95xhITPYgtt/pokggi7kEtka42DtVs2jhQosU3Z
yE0SbyKrRFZPyqiGAdoq+Ik4rxu/NQ==
=ZmLQ
-----END PGP SIGNATURE-----

--f4hgJwe7T6D4GLZx--

