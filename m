Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DE602E21
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425030.672777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknQX-0004Wy-Ew; Tue, 18 Oct 2022 14:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425030.672777; Tue, 18 Oct 2022 14:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknQX-0004VA-C6; Tue, 18 Oct 2022 14:18:41 +0000
Received: by outflank-mailman (input) for mailman id 425030;
 Tue, 18 Oct 2022 14:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XTa7=2T=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1oknQV-0004V4-AI
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:18:39 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c203f717-4eef-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 16:18:38 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 48.2.0 AUTH)
 with ESMTPSA id z9e8dfy9IEIZqTs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Oct 2022 16:18:35 +0200 (CEST)
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
X-Inumbo-ID: c203f717-4eef-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1666102716;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=vhiNBxZSYP3vilOtpXXi2VpwfooaHch2tx9V29uJbYc=;
    b=SCH6OGh1SevE4+QjYkiWEMFjXucx7SGL+u40cm+JiP/myWGtx7D9yfEQJw5ms4Q2BX
    ogNWGrZMPqzZT+ezU8px85Jfu8R5UCo9XBpfRCNDYTAwGYkftOv/s6Fy14aDVaadt2Fe
    UnfokEn1KxndP9YGB5ZgJoQE76RgaYFcM3D8nSecFllKycbiVJHkPRjvSg7r7MM9sL0R
    AG16wLKZNNkpSXXl5WhFoqy6MtlKip82gYFCgF+kfkKPSyVfMrONNCKP/sMEfMNFdd/p
    TbmHbgj1eWvIcq5Ssb5Xz5d+LJTuTnAfs+dEroBYalQI7Al9ufHt9ggVqheoelAikcNf
    UsiQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX2j/OiDv7LX1ITFkr8sRtLhQJY8wcRJ+GvY"
X-RZG-CLASS-ID: mo00
Date: Tue, 18 Oct 2022 16:18:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Denton Liu <liu.denton@gmail.com>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>, Oskari
 Pirhonen <xxc3ncoredxx@gmail.com>, mathieu.desnoyers@efficios.com,
 rharwood@redhat.com, samuel.thibault@ens-lyon.org,
 debian-bsd@lists.debian.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221018161821.149ee6fd.olaf@aepfle.de>
In-Reply-To: <Y06w0Oda0sHTHPNW@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
	<20221018131235.5e70f0bc.olaf@aepfle.de>
	<Y06w0Oda0sHTHPNW@generichostname>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=pk9Y9LpQ6oa5YoIJDRURMY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=pk9Y9LpQ6oa5YoIJDRURMY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 18 Oct 2022 06:57:36 -0700 Denton Liu <liu.denton@gmail.com>:

> If I'm understanding correctly, what you're proposing is a mechanism for
> setting the default entry. If I'm not mistaken, this seems like an
> orthogonal discussion to me. My patch proposes a method of setting the
> top-level menu entry while this method only sets the default entry,
> which may be hidden behind a submenu.

I think this can be done already today. At least YaST offers a way to selec=
t a specific item in a submenu and pass it to grub-set-default. This leads =
to an entry like this in grubenv:

saved_entry=3DAdvanced options for SLE15SP4 (with Xen hypervisor)>Xen hyper=
visor, version 4.17.20220823T122205.399bcbf2-xen_unstable.150400.370>SLE15S=
P4, with Xen 4.17.20220823T122205.399bcbf2-xen_unstable.150400.370 and Linu=
x 5.14.21-150400.24.21-default

This entry will be booted as long as both this specific Xen version and thi=
s specific kernel version is found. There is a slim chance a SUSE specific =
patch exists to enable this functionality.

Maybe the patch description lacks a specific example how the proposed chang=
e is supposed to be used in your environment.

Olaf

--Sig_/=pk9Y9LpQ6oa5YoIJDRURMY
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmNOta0ACgkQ86SN7mm1
DoALCg//dbAthIrUpj/CgWD2MVsYXsTcxEnduej/jcSyWMLfj8qeRCuNuMx03neD
3OMOhs/3nz6cnbp9fKv8421fP8qaUrgwn+meU6Er/r0bn08pGvlBBrNnetwrV/Sv
FfFdXuemnaGTyDLmw3VNvTWGcHMZwGpASjdIPJd7OImLs4XBqO2zLlptCiP/nRCv
bBAR3V8J3EbKjNtqqiZVrf1fFdAVNcbyB/0jQIewJ5Fv/lo+grg8Hx6YtchPvJlJ
lcE42oQ7G637/HH8y9nZig1Tzm0jat7/WbmbM8wkSTBL0DM+rWeHI9H/85U9l9Sc
fC7hq5LafaaTBmHyT6W3kK0anGArLrXB1ii4Cg7ZDz1ClpoXB042BeXujtpOzJMC
pAi3uE/7qkVsZkL+TJa45Be47TbLT7MIIzyFpJNTOGmVwCeNkyqLiHAdYwTzojgG
im++PkFocBq4w2+SLmSNlzLtbMIv3KufrjM0hTrJga6M30QrRF+Uhu7D+iE/7vpR
oFYjtczM7WfETQ6E9In/pqhPp/8l+X/BwpEV4RrEVofxXSsPH4ajMZ7x+LKiOMNC
DDlsD2xkRwQMTdqgyboSBWP9GBmDw+jH7WUUEzOBNXsIYMnckLaKi0T1Rb2mSppN
+RsP/PReLrCnsB6DwtDespr5lO4Wf1U7laVpqMmC54fwmpxeEVA=
=feKy
-----END PGP SIGNATURE-----

--Sig_/=pk9Y9LpQ6oa5YoIJDRURMY--

