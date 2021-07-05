Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE93BBC32
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 13:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150158.277690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Mky-0004Nt-43; Mon, 05 Jul 2021 11:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150158.277690; Mon, 05 Jul 2021 11:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Mky-0004M2-0m; Mon, 05 Jul 2021 11:27:20 +0000
Received: by outflank-mailman (input) for mailman id 150158;
 Mon, 05 Jul 2021 11:27:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0Mkw-0004Lw-AU
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 11:27:18 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0145efd7-a439-4bb9-a1a2-e65b6dc99917;
 Mon, 05 Jul 2021 11:27:16 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65BR9LuB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 13:27:09 +0200 (CEST)
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
X-Inumbo-ID: 0145efd7-a439-4bb9-a1a2-e65b6dc99917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625484430;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=kDJw5Tk/nHHHPMSp2tcxaOrmHWkx5UmSIVMwA4NxEn4=;
    b=Dw4jVhuobhTIYt1M3lM/r2kBk/DkYu+2dq/jrXsYUcTJ3DNa9IqSMmUrJW7J77ORd5
    dDdv7rwg7nsqgp13ZzmXfKTmAO5I/9UAWjp55iy1R3NnbZixgWunO4faalHbp4ett//N
    yasCs6zpSHc/lnPAnq4hhJaqySUDRBzc9Qm59dsqea8t4Ky71PjBTKWdXDPjTwBmGnVk
    qNPeIwx0/SwhZG+LKTlAJAG04ZXcz7LneS3HifdSoBsBLAP+Z0QcadU4d6KGMwcL/aIT
    fI8dcXgT501cdplEerFMH5xuD2eEg+iT6LGZzR87XbBbtbqtqZOusx4BKPDfAFB0cKMR
    PkdA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 13:27:00 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 15/40] tools: prepare to allocate saverestore
 arrays once
Message-ID: <20210705132700.05d92744.olaf@aepfle.de>
In-Reply-To: <644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-16-olaf@aepfle.de>
	<644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XgVQo8WahRDWVUNFLYxNH_g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XgVQo8WahRDWVUNFLYxNH_g
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 11:44:30 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 01/07/2021 10:56, Olaf Hering wrote:
> I agree that the repeated alloc/free of same-sized memory regions on
> each iteration is a waste.=C2=A0 However, if we are going to fix this by
> using one-off allocations, then we want to compensate with logic such as
> the call to VALGRIND_MAKE_MEM_UNDEFINED() in flush_batch(), and I think
> we still need individual allocations to let the tools work properly.

If this is a concern, lets just do a few individual arrays.

> > This patch is just prepartion, subsequent changes will populate the arr=
ays.
> >
> > Once all changes are applied, migration of a busy HVM domU changes like=
 that:
> >
> > Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2=
0963b3 xen_testing):
> > 2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
> > 2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + =
2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
> > 2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + =
2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
> > 2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + =
2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
> > 2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + =
2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
> > 2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + =
2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error
> >
> > With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2096=
3b3 xen_unstable):
> > 2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
> > 2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + =
2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
> > 2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + =
2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
> > 2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + =
2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
> > 2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + =
2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
> > 2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + =
2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error =20
>=20
> These are good numbers, and clearly show that there is some value here,
> but shouldn't they be in the series header?=C2=A0 They're not terribly
> relevant to this patch specifically.

The cover letter is unfortunately not under version control.
Perhaps there are ways with git notes, I never use it.

> Also, while I can believe that the first sample is slower than the later
> ones (in particular, during the first round, we've got to deal with the
> non-RAM regions too and therefore spend more time making hypercalls),
> I'm not sure I believe the final sample.=C2=A0 Given the byte/page count,=
 the
> substantially smaller elapsed time looks suspicious.

The first one is slower because it has to wait for the receiver to allocate=
 pages.
But maybe as you said there are other aspects as well.
The last one is always way faster because apparently map/unmap is less cost=
ly with a stopped guest.
Right now the code may reach up to 15Gbit/s. The next step is to map the do=
mU just once to reach wirespeed.

> Are these observations with an otherwise idle dom0?

Yes. Idle dom0 and a domU busy with touching its memory.

Unfortunately, I'm not able to prove the reported gain with the systems I h=
ave today.
I'm waiting for preparation of different hardware, right now I have only a =
pair of CoyotePass and WilsonCity.

I'm sure there were NUMA effects involved. Last years libvirt was unable to=
 properly pin vcpus. If I pin all the involved memory to node#0 there is so=
me jitter in the logged numbers, but no obvious improvement. The fist itera=
tion is slightly faster, but that is it.

Meanwhile I think this commit message needs to be redone.

> Even if CPU time in dom0 wasn't the bottlekneck with a 1G link, the
> reduction in CPU time you observe at higher link speeds will still be
> making a difference at 1G, and will probably be visible if you perform
> multiple concurrent migrations.

Yes, I will see what numbers I get with two or more migrations running in p=
arallel.

Olaf

--Sig_/XgVQo8WahRDWVUNFLYxNH_g
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDi7IQACgkQ86SN7mm1
DoAwwA//XF8PXPFKJLtFNJCTMf4Xe8Rjl9ERKY6N/vecZot5SBluwct6qRYmekVp
aj6OE6Nclpk1hru2E5lH2cXWa6PqgWoRVWzfpKeBdovagNLmdZnKbnLAG1STuIKW
N6JgTjgAdrIYSFAXnJ70irXc+rL3Za00w3WbSGnCXqeQx7Bjb+WAMLSafs9ifr1W
oFmKwDGsUpJckvJ5UA2WMS4gwZmF3ImitNWwM0IAXBqOYlzk4HqSkPuzYmoXatCq
TJZvs9xeqU5ZSoUmWVMIqr32bYHPx6WEGY59j3JHhdvVuGOiN9EYxcT+g4g+O62f
mYlMyj+0SBlB0AozPar4CBzyFsjeCKVDR8UJrAZrPShY8sXG0fmLf9JSs6eX10eJ
H7qHhvzOjBVO9+WFbWjB2uJvJNE8ovno9+DKXeXHeBGXLsJQDLlg7zMERwmPmgue
k+3QLD5aVM2RFbJcttUhKzTub4AqQb1F2Mq6OYykalzU10mY1dVqHRARpOp2FprJ
CnyFLCbAzF977BKBMQfXTt5gGzDGdyzZ/Q4Cdt9vbTf2aPEOqM/dlQcFeQwHV1Rw
ZwlzT/9HfmsIzsjIzOUveX3NZpLcNEgXklWfVYJpGoNcaxJEeceF+TAcCsNV1yPi
soekoN++h2xwe/RZy6eRJZWT6z0rqbJndPk+T73NQ9LXLRBBtcs=
=Xm59
-----END PGP SIGNATURE-----

--Sig_/XgVQo8WahRDWVUNFLYxNH_g--

