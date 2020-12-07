Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80B2D22ED
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 06:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47045.83434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmVIO-0006GY-6s; Tue, 08 Dec 2020 05:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47045.83434; Tue, 08 Dec 2020 05:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmVIO-0006G9-3d; Tue, 08 Dec 2020 05:12:16 +0000
Received: by outflank-mailman (input) for mailman id 47045;
 Mon, 07 Dec 2020 21:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovVX=FL=konsulko.com=trini@srs-us1.protection.inumbo.net>)
 id 1kmOP0-0003pY-36
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 21:50:38 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f646448e-91af-4056-aa1f-4a3fa8fe05c3;
 Mon, 07 Dec 2020 21:50:37 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 1so14259205qka.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 13:50:37 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id b14sm11970109qtx.36.2020.12.07.13.50.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Dec 2020 13:50:36 -0800 (PST)
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
X-Inumbo-ID: f646448e-91af-4056-aa1f-4a3fa8fe05c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/ZcCG7pADF2Oan3XaaLEvoIyvCq89Mhc+GwW8vVvIrY=;
        b=Lozzj4GfI580ONqAuCJKC3AAbdqg1jhqs2wm7PT4W0lBO7ssjToZ1C5s6xMzXBuy2Q
         RANmCAIdVLZ8U6O5cFiEnSTK/M3L+2NbtbQNUHJLTwHedrzizOas4aZSk09mnrHh2fO6
         J1Lq1zy1/7zESVTeOQjjTpj7b3wkCAVA4oQPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/ZcCG7pADF2Oan3XaaLEvoIyvCq89Mhc+GwW8vVvIrY=;
        b=bw7z6F3wREVi1VaHbnHPvhAYkEH05w0um3fHokudcqRwHwNgUGA0huRXHkWAdQSEkB
         PQw+MTOPBOMPedWk+s+TwkLX5cveaJoWNLjEAHQfytwqINp8KlcKp/+rlvcoIYbEsigu
         g1+jUPU4QPaQARWiWGvLC9J1QNSRFrBMBsX3dGP0zUcDcb4BQiPyHGBb2y1a/qJaMIWy
         B/0eNrPlbkdW3fDGGHU48hTHi+8Clfp0jx+3UpzUejkc7dBt3gNB3ylPk6I+iWIIMAQV
         fb+eb3iKrNchCWkmR3DXjJVeTRmTKGJb3vDekuEftVk5vJPJHbA3FGsk60ASdfuBBpa8
         zMow==
X-Gm-Message-State: AOAM530ppifdu3ryScQth8AEDS3mpiZeCCgegZnPDmVDl4kVeWi0SPKo
	jsrSPUPPKysHR4nJlaGxjL0+7A==
X-Google-Smtp-Source: ABdhPJz6FCbeMXa2G2maw67GOiOFfbP8/C/NR5x0geY5gSM9+hW8KXY+f/apvUvqCtKzzryrb+b0Nw==
X-Received: by 2002:a05:620a:6c8:: with SMTP id 8mr963037qky.176.1607377837079;
        Mon, 07 Dec 2020 13:50:37 -0800 (PST)
Date: Mon, 7 Dec 2020 16:50:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wim Vervoorn <wvervoorn@eltan.com>,
	The development of GNU GRUB <grub-devel@gnu.org>,
	Daniel Kiper <daniel.kiper@oracle.com>, coreboot@coreboot.org,
	LKML <linux-kernel@vger.kernel.org>,
	systemd-devel@lists.freedesktop.org,
	trenchboot-devel@googlegroups.com,
	U-Boot Mailing List <u-boot@lists.denx.de>, x86@kernel.org,
	xen-devel@lists.xenproject.org, alecb@umass.edu,
	alexander.burmashev@oracle.com, allen.cryptic@gmail.com,
	andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org,
	"btrotter@gmail.com" <btrotter@gmail.com>,
	dpsmith@apertussolutions.com, eric.devolder@oracle.com,
	eric.snowberg@oracle.com, hpa@zytor.com, hun@n-dimensional.de,
	javierm@redhat.com, joao.m.martins@oracle.com,
	kanth.ghatraju@oracle.com, konrad.wilk@oracle.com,
	krystian.hebel@3mdeb.com, leif@nuviainc.com,
	lukasz.hawrylko@intel.com, luto@amacapital.net,
	michal.zygowski@3mdeb.com, Matthew Garrett <mjg59@google.com>,
	mtottenh@akamai.com,
	Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>,
	piotr.krol@3mdeb.com, pjones@redhat.com, roger.pau@citrix.com,
	ross.philipson@oracle.com, tyhicks@linux.microsoft.com,
	Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
Message-ID: <20201207215032.GN32272@bill-the-cat>
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
 <CAODwPW9dxvMfXY=92pJNGazgYqcynAk72EkzOcmF7JZXhHTwSQ@mail.gmail.com>
 <6c1e79be210549949c30253a6cfcafc1@Eltsrv03.Eltan.local>
 <9b614471-0395-88a5-1347-66417797e39d@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HtAX+RUajEpU4A/"
Content-Disposition: inline
In-Reply-To: <9b614471-0395-88a5-1347-66417797e39d@molgen.mpg.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--/HtAX+RUajEpU4A/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 02:23:23PM +0100, Paul Menzel wrote:
> Dear Wim, dear Daniel,
>=20
>=20
> First, thank you for including all parties in the discussion.
> Am 04.12.20 um 13:52 schrieb Wim Vervoorn:
>=20
> > I agree with you. Using an existing standard is better than inventing
> > a new one in this case. I think using the coreboot logging is a good
> > idea as there is indeed a lot of support already available and it is
> > lightweight and simple.
> In my opinion coreboot=E2=80=99s format is lacking, that it does not reco=
rd the
> timestamp, and the log level is not stored as metadata, but (in coreboot)
> only used to decide if to print the message or not.
>=20
> I agree with you, that an existing standard should be used, and in my
> opinion it=E2=80=99s Linux message format. That is most widely supported,=
 and
> existing tools could then also work with pre-Linux messages.
>=20
> Sean Hudson from Mentor Graphics presented that idea at Embedded Linux
> Conference Europe 2016 [1]. No idea, if anything came out of that effort.
> (Unfortunately, I couldn=E2=80=99t find an email. Does somebody have cont=
acts at
> Mentor to find out, how to reach him?)

I believe the main thing that came out of this was the reminder that
there was an even older attempt by U-Boot to have such a mechanism, and
that at the time getting the work accepted in Linux faced some hurdles
or another.

That said, I too agree with taking what's already a de facto standard,
the coreboot logging, and expand on it as needed.

--=20
Tom

--/HtAX+RUajEpU4A/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/Oo6UACgkQFHw5/5Y0
tywf8Qv+L4APGvoo04UfMbodnLWALTyJgHeFXO5lXNUc1MVcmDGlZImiPdj72ky9
E8YqQQS1D5zoRlQrHXefKqKxUHPcmHnSYGkwC3xfBX7yrvxB8ggEbbrA1uWBZm+2
mXpJhP9wPwUzAJYGriknNOA4Ly6UVpgSljQCwKSRPSVAOXr90A9bWsQLktAqrkH5
QdWwrpKAS1XaOPvnWYWyFs6dTQjqxfGngG+9zWio8JFwj9tFHTvZgI3Nqzi+8+N5
7bBRqyvEkpni2VoQi20RQSiWwdVw21r8ezlP4Zx8HkW4LqoqZIEpY2pa2UVkDb8b
phjIxsZqG4lCy9sP4byqcAQnu1h0FFzSdKFuBpRJi3VJaQ0gJ2g0ySPzBSCDu4Va
5qIVE/64uMhIhgU3cYr+7pi/bgw8LoGNnjOBh9d4CVYh61M2EWSEA9f227tlAWlJ
YK0wpz6REoq0TRpRHwr313pkdMHefe9dWaJ2ul4tSud420mQ+zzFZ+ghLywLSo0w
vAPmRdwM
=tVGW
-----END PGP SIGNATURE-----

--/HtAX+RUajEpU4A/--

