Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C301160C234
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 05:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429536.680534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onAVV-0006qb-2r; Tue, 25 Oct 2022 03:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429536.680534; Tue, 25 Oct 2022 03:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onAVU-0006n9-VX; Tue, 25 Oct 2022 03:21:36 +0000
Received: by outflank-mailman (input) for mailman id 429536;
 Tue, 25 Oct 2022 03:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3CU=22=gmail.com=xxc3ncoredxx@srs-se1.protection.inumbo.net>)
 id 1onAVT-0006n3-OF
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 03:21:35 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20a9cdd5-5414-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 05:21:34 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id z14so5287495wrn.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 20:21:34 -0700 (PDT)
Received: from dj3ntoo (171.sub-72-110-15.myvzw.com. [72.110.15.171])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003b47b80cec3sm9933587wmo.42.2022.10.24.20.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 20:21:33 -0700 (PDT)
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
X-Inumbo-ID: 20a9cdd5-5414-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTnwREWlqkIf0C+tQK1BYatGy5JJBtcEmRypgG1tfC8=;
        b=FFlo3E3AJ6gVOkkZ877m15eYpdvi+2vc0258y0EJSMrwws0Qo8aEbAQ3uYBO3mBpGV
         29QAPHVYzNVTF4prYWv/UTK3lKC6OSvgQwp9ZfKhRazFNHnHbVdjntwpi+GwA5aCimBw
         MgCszF0dO8q2g+Nd0Uav92QDdAbINLMaNgdO7vkutDTjenvwxTS9C6/nl9FfzFnRTdel
         FG0ZIqArzUpturRNSoiqH5h93JmWsnlzcg/Ty1wnill8/+H/weU2I7c4LZ142npcYi5M
         0oHYgDleI9J8zFhVLzTSRRNMpSASd8Le6RyNXEfVEPrXiGQ3Ea6Q2BreFCv+b7QD1YnW
         Fobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTnwREWlqkIf0C+tQK1BYatGy5JJBtcEmRypgG1tfC8=;
        b=iIJkJGZyd2j6dcNzZCPM77V2dwTVH0/FMeJFOB/GPI2/huyNP/ruXToFCYEs5Rkiap
         rmRG4BdeMJVGvyyLjhKIJQYMmHi+Eg89QcQIOytaeAX+mga2X8fCVZ7CZxh6vVt62sYz
         6OC7Z/iTuBl4nwRyJAAkVmK4KFZ57kTkGETekBn9/mO4FZd9AINotm9qUZPxpOtEaPmU
         wBgs89WTdMHHfEBXyINZFfeVW/Jvsr+uS39KuJSAx77KeSB0huoxfAvD5d6Ro/9xWtCd
         kxMBYtUUeTtbBX1WAwXIuKQlcXD6vcOg0xtEptJF+Aa+HRkl+bPttUG9SIP3w7JqPBKA
         pjdg==
X-Gm-Message-State: ACrzQf1tK0rvfhx9dtYLg4Lc1tWuC1WUx/znkSo1P/P+Kl+7MUpBZnuh
	86r/Q7N4A3szgIqqso3d+xE=
X-Google-Smtp-Source: AMsMyM5XJApCOKG2D9tkZVO19Ozd/wp3HBGy2skSFF6/cK/qNc8usr9jwO5pYpUtNZW+RUggIAoVPw==
X-Received: by 2002:a05:6000:a09:b0:236:6b18:6b30 with SMTP id co9-20020a0560000a0900b002366b186b30mr7544228wrb.356.1666668093838;
        Mon, 24 Oct 2022 20:21:33 -0700 (PDT)
Date: Mon, 24 Oct 2022 22:21:25 -0500
From: Oskari Pirhonen <xxc3ncoredxx@gmail.com>
To: grub-devel@gnu.org
Cc: Denton Liu <liu.denton@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <Y1dWNXeWlLUdxbFm@dj3ntoo>
Mail-Followup-To: grub-devel@gnu.org, Denton Liu <liu.denton@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
References: <20221024104642.251016-1-liu.denton@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M+Fpb3cxK4PU3FTu"
Content-Disposition: inline
In-Reply-To: <20221024104642.251016-1-liu.denton@gmail.com>


--M+Fpb3cxK4PU3FTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 03:46:42 -0700, Denton Liu wrote:
> A user may wish to use an image that is not sorted as the "latest"
> version as the top-level entry. For example, in Arch Linux, if a user
> has the LTS and regular kernels installed, `/boot/vmlinuz-linux-lts`
> gets sorted as the "latest" compared to `/boot/vmlinuz-linux`, meaning
> the LTS kernel becomes the top-level entry. However, a user may wish to
> use the regular kernel as the top-level default with the LTS only
> existing as a backup.
>=20
> This need can be seen in Arch Linux's AUR with two user-submitted
> packages[0][1] providing an update hook which patches
> /etc/grub.d/10_linux to move the desired kernel to the top-level. This
> patch serves to solve this in a more generic way.
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
> [0]: https://aur.archlinux.org/packages/grub-linux-default-hook
> [1]: https://aur.archlinux.org/packages/grub-linux-rt-default-hook
>=20
> Signed-off-by: Denton Liu <liu.denton@gmail.com>

Reviewed-by: Oskari Pirhonen <xxc3ncoredxx@gmail.com>

I've tested it on Linux, but the other platforms and os-prober are still
untested.

- Oskari

--M+Fpb3cxK4PU3FTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQfOU+JeXjo4uxN6vCp8he9GGIfEQUCY1dWLwAKCRCp8he9GGIf
EQlWAP9KzyNwrmNeoh+pUYxfKaD0KqahfOci3jRBPT5HTjkWsgD6Ags50AtOFgwZ
xGBmMRE5PQwxdn1oBD84vPzhTLcF9wM=
=b5NF
-----END PGP SIGNATURE-----

--M+Fpb3cxK4PU3FTu--

