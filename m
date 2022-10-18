Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC9860249B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 08:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424739.672390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okgG1-0006gH-3S; Tue, 18 Oct 2022 06:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424739.672390; Tue, 18 Oct 2022 06:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okgG1-0006da-0I; Tue, 18 Oct 2022 06:39:21 +0000
Received: by outflank-mailman (input) for mailman id 424739;
 Tue, 18 Oct 2022 06:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ejmv=2T=gmail.com=xxc3ncoredxx@srs-se1.protection.inumbo.net>)
 id 1okgCZ-0006Zs-0b
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 06:35:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17083692-4eaf-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 08:35:44 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id a3so21937262wrt.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Oct 2022 23:35:43 -0700 (PDT)
Received: from dj3ntoo (171.sub-72-110-15.myvzw.com. [72.110.15.171])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003c0d504a92csm16848483wmk.22.2022.10.17.23.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 23:35:41 -0700 (PDT)
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
X-Inumbo-ID: 17083692-4eaf-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A9S3CXOTCwdn+lDuQPpMAFg52KVpluL8upUmekQkfE=;
        b=JyMsQR3qIyUWFoQba2C/2+utgcVKN46fWVFxbFVVzSfxcKa2TGDomP3fI0JCcSVpJs
         9+SsVv/xbvTqnO5FCZJGGovhFsWNgeoe22zf108esG0Q5LyLPB1OOWVelV5WKpIMFPcT
         wg01TCcX+GOzUNQYgxtihyLZ+b8JFsAqyE8sGk/JPFipBv3UOt/gpfEV0i6WrgHmoA2b
         WnqwZsTpogUPTN7pj9pnfuK42rOsj8+zJTyEJp8OyN8u1s/Mjp68H44koyiNH9MgA/J/
         WSBUclB9VYsvIWqlTdU1YJNkpWzvsPG/fFu8nzjPCm2g0X+0eC5COXAkMcGcSU9mIlDX
         wWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A9S3CXOTCwdn+lDuQPpMAFg52KVpluL8upUmekQkfE=;
        b=LEq57bJhw7XVKLSztPtN9jhBJdP+7sVFECX8z+6zwIWK2++G8D9TABpCeLZb6R1sXx
         DzcRxjBJ/9L2PallFQfOhVTaJfc8qO52qS0QTP8zAYJpq7kPHY3Jp4/nfu9jDQv1MApn
         iBzn7mdmfinJ7Ynf2yuakjklippD36MTMi57EnEegMRmI++JNwHFH8pDaoVDRG/Mysax
         oAgbiaULKaN6LFYz3fWKa/XpDAUW52c2suiiqAcY0xhctHOipiwnQrpH/65DnB6cRiKE
         IWAaS2HPm3Gf+0za29gtlg51TKFjgO5X8EttcdqrknMY+ew6FzPcRNPoVFK43BjC6JSK
         hU3Q==
X-Gm-Message-State: ACrzQf2e5jXvlB0hsq42IpI8xJJlqvVxbywibRTNxUAqmXnT7SIbIjPu
	FNeZ66uds9A+dj/OFwvA0/8=
X-Google-Smtp-Source: AMsMyM4ODs2Al3Bsn4YO641bipvzPdIt/3s/ruCqKG9waOoeXw09qbFzKhhVAQCLRUch6UatcLiWsQ==
X-Received: by 2002:a05:6000:1541:b0:231:115e:9bb8 with SMTP id 1-20020a056000154100b00231115e9bb8mr852082wry.51.1666074942570;
        Mon, 17 Oct 2022 23:35:42 -0700 (PDT)
Date: Tue, 18 Oct 2022 01:35:35 -0500
From: Oskari Pirhonen <xxc3ncoredxx@gmail.com>
To: grub-devel@gnu.org
Cc: Daniel Kiper <daniel.kiper@oracle.com>, mathieu.desnoyers@efficios.com,
	rharwood@redhat.com, samuel.thibault@ens-lyon.org,
	debian-bsd@lists.debian.org, xen-devel@lists.xenproject.org,
	Denton Liu <liu.denton@gmail.com>
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <Y05JN1zyh/++s5RA@dj3ntoo>
Mail-Followup-To: grub-devel@gnu.org,
	Daniel Kiper <daniel.kiper@oracle.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org, Denton Liu <liu.denton@gmail.com>
References: <20221017103532.845293-1-liu.denton@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hXVz/a4Innggs2yF"
Content-Disposition: inline
In-Reply-To: <20221017103532.845293-1-liu.denton@gmail.com>


--hXVz/a4Innggs2yF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 03:35:32 -0700, Denton Liu wrote:
> A user may wish to use an image that is not sorted as the "latest"
> version as the top-level entry. For example, in Arch Linux, if a user
> has the LTS and regular kernels installed, `/boot/vmlinuz-linux-lts`
> gets sorted as the "latest" compared to `/boot/vmlinuz-linux`. However,
> a user may wish to use the regular kernel as the default with the LTS
> only existing as a backup.
>=20
> Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
> GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
> top-level entry.
>=20
> Create grub_move_to_front() as a helper function which moves entries to
> the front of a list. This function does the heavy lifting of moving
> the menu entry to the front in each script.
>=20
> In 10_netbsd, since there isn't an explicit list variable, extract the
> items that are being iterated through into a list so that we can
> optionally apply grub_move_to_front() to the list before the loop.
>=20
> Signed-off-by: Denton Liu <liu.denton@gmail.com>

Reviewed-by: Oskari Pirhonen <xxc3ncoredxx@gmail.com>

I've tested it on Linux, but the other platforms and os-prober are still
untested.

- Oskari

--hXVz/a4Innggs2yF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQfOU+JeXjo4uxN6vCp8he9GGIfEQUCY05JMQAKCRCp8he9GGIf
EQ0WAP0ZQxLfKP72sWT44WYI+U+sA+CLj0HtNgBM7y1Re5wnBwD8DVQv8NcQ8mkW
qUNttUu8qfwYls2ccVNpvEHPvu9jGQE=
=gtWi
-----END PGP SIGNATURE-----

--hXVz/a4Innggs2yF--

