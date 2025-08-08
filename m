Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457FEB1E103
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 05:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073973.1436716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukDrA-0002Gn-13; Fri, 08 Aug 2025 03:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073973.1436716; Fri, 08 Aug 2025 03:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukDr9-0002EF-U2; Fri, 08 Aug 2025 03:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1073973;
 Fri, 08 Aug 2025 03:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qX/=2U=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1ukDr8-0002E9-DZ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 03:33:22 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1473c6-7408-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 05:33:21 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3e3df510580so702055ab.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 20:33:21 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:1183:972:b5b0:f8fc:81d2:9bb])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50ae9bdc54asm216371173.52.2025.08.07.20.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 20:33:19 -0700 (PDT)
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
X-Inumbo-ID: 6e1473c6-7408-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754624000; x=1755228800; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuqdC+wZSlfbOIzaKM+JGjSTsgrg7y1Xmtc+a4LsI24=;
        b=IWT9/aFznwTBfGdXvBeOXnT4lLYEHcv7SKuSmhMQGp8occTxy/B6JHVvFeWEEoMr2y
         ScVllJJTN0PgopL6MNUc2WmL+3YKEQLiS/+IAL2NkY5++3Ur4O//+2W14r0BGh61zfuI
         PqtqmprhKJQ/Op35s9Ix2IReBOWpQuNClcYbPRbWNuK9CNUgR2eZ2ZUaxiCk+/r6T++W
         aAMXx1gzntm3qVeTf/8VPE3wv60MfsD+xG+kOnT071ZjnaL1EyG/Vf6I0c6xDXBYU6gA
         NdcHFhMAy4iTOkMC3A2h+dMnzXCxjHg4HlUQmexMYxLT86hPi17QudR+me1cdjnCXHpo
         50/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754624000; x=1755228800;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuqdC+wZSlfbOIzaKM+JGjSTsgrg7y1Xmtc+a4LsI24=;
        b=afhNKMeeSTpFwUxVGKpxDTWBSvuIuB6BbWpqimV7RCUKCTk1ym+TPBIIPAKY1+gMvH
         u8hIsBoNWlxOIie/3U6SloePiYqFUj38tYrnxsQV3wzRXI6/EckMyiQTC4Riua8ppkEv
         PkAonGrXJuphaXnbcewXKltigXZh6jqbQlahxw4BWzXc5KeED2QqwO+Vp0X5Mgtv00aN
         tjhk5uKsspZ8XZeDEeuc03t3E07RRRkAz+qIh8QV+W3tZXIhCVai5F5ock+PQG5Jkz0Q
         OHXP6jrxwK1daF9AE6JSWu5NRkDfWP4SyyWdbyDFobhOOWQ2T/l2tUMdpy1PjTsay8Gx
         /DqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwGR6Kl1mDe9b0CT0ppTUExD68F0nTTG/TpIP0Wg68CWehSfxDRQlOYVS0/hLais5DgSMUj73qr+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyvEvEjpUm71jFHZfHnLsKk0QvDpHLFq2ld41frzKD4svCgvrC
	rh4MsxFS6tTo2aMWdjJmwgeBU2c/SpOA2CBxgVp1VB9uHsTsm4x/RKU1
X-Gm-Gg: ASbGncvAeTXCo6aS3vmaZL37yUh3XvzKQyGGfOEsPQ1PYPUS8p4RRJS7upfa6AkJ5FA
	g3nkrUGUM51bY/+NO8cXRpjLEGKl8IiQJ8SjOO6sq29oC9wfRehEJ8GNp1E5R1y6oEGNOHzwWqW
	A5zF9bK3eaMW4abyZbrEZyjmihCOMW+fFRPBELVT3yHwp4zfDUh9MBw6CHPB/h7CfaeDHpyPiIT
	52OFQVJphXbSuHwIiQnT5a8HqjY89LPVAJ+ejrjcvnT7jq2UeKPmvijVHygxmENT1F+hV3x4JDt
	qR4AStTz9wZxuufUSID7c/dM2RVb5/N21zxUM2Y1G3ngXvFme4ZjgO9l7w5jhHoXwQ5D9BDeW6K
	ypwdrxCHyvA2OazOCuDoQNHHS88FblOvdNfu2q+s=
X-Google-Smtp-Source: AGHT+IGx2bYcdOer58Y4Fx1XNGXtROMnGzgqbpHQBJQ9YhkL60Qv6zZ3FYmYhwbapvnXbuovn/bsCw==
X-Received: by 2002:a05:6e02:190d:b0:3e4:8c0:5a49 with SMTP id e9e14a558f8ab-3e533174002mr9089295ab.6.1754623999797;
        Thu, 07 Aug 2025 20:33:19 -0700 (PDT)
Date: Thu, 7 Aug 2025 22:33:12 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250807223312.100a8ab4@kf-m2g5>
In-Reply-To: <20250804235009.30e39bd9@kf-m2g5>
References: <20250804234816.3d14f53f@kf-m2g5>
	<20250804234911.3cc3997c@kf-m2g5>
	<20250804235009.30e39bd9@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nNdR5oRnuudB/zN3nJu_MvE";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/nNdR5oRnuudB/zN3nJu_MvE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Aug 2025 23:50:09 -0500
Aaron Rainbolt <arraybolt3@gmail.com> wrote:

> Xen traditionally allows customizing guest behavior by passing
> arguments to the VM kernel via the kernel command line. This is no
> longer possible when using GRUB with Xen, as the kernel command line
> is decided by the GRUB configuration file within the guest, not data
> passed to the guest by Xen.
>=20
> To work around this limitation, enable GRUB to parse a command line
> passed to it by Xen, and expose data from the command line to the GRUB
> configuration as environment variables. These variables can be used in
> the GRUB configuration for any desired purpose, such as extending the
> kernel command line passed to the guest. The command line format is
> inspired by the Linux kernel's command line format.
>=20
> To reduce the risk of misuse, abuse, or accidents in production, the
> command line will only be parsed if it consists entirely of 7-bit
> ASCII characters, only alphabetical characters and underscores are
> permitted in variable names, and all variable names must start with
> the string "xen_grub_env_". This also allows room for expanding the
> command line arguments accepted by GRUB in the future, should other
> arguments end up becoming desirable in the future.

Darn. I sent this patch as a reply to the previous patch in the stack,
not as a reply to the cover letter. That's probably not the right way
to do things.

I should just set up git-send-email and stop trying to make Claws Mail
barely work for this kind of thing... Will resend the patch soon-ish,
this time formatted right (unless that would just cause needless noise).

--Sig_/nNdR5oRnuudB/zN3nJu_MvE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiVb/gACgkQpwkWDXPH
kQlsZg//UyTi6GewosMb9Q1V+INPSVwkzf47vrMgEwysTXq1JOLOqjYwe1352Y5D
IYhNxdDpt7vt7k4iRbKIu4iuMrgOmSn8jqzXa88n/tATCU3dz4bXNGr5O/yxl6BA
V5//5ek54GrEBihvd/FFVVPcs6XNw64mStWYR/ZUDmh4ZRlKFpZl+pqoixOaVyN5
4PLJ09OOx4OXhg9t9O4kMGT0G3ce9f6IG9TvQpFxRniYk1acsf7R/PJatcwzgaON
oWyNgL14DRgzqm3V8PmsxgHcmaLhd3SPBmYv0xHndFwgp0tBC+8h0qm6EkqLs+n8
tUpj+Kx+aMi4sCcGLR5cwsJi79h40D15DIgtBFOvwKbPOCxdGLW2pNZi7bIXpqf2
DKKgXeq1VuCI/sIBvLSQNMlL12YfoGSOUaRCZTmIL9M0V5lGw/AkMRjZXVX9ku6g
6zezZSMCxIfVeUYjJzAKxSM7/udWxqoF639YNIge3cxXoMEXA4fD56Ltw2c0GyqR
Kz8US5vn729QiSuu6TcbsEQYILCr8gxcnuPY0+RApB4VOUx3bugH1J3OSxwgqkAm
Mz7u1ickmQX+EnNmuMkEIw5Exez4InCl7wtbvR60QTKErbsxaQFR3mNcxI/KwM4V
CGkjnUk6LW+K3CVW1q/mEyN5ABRIntF+QG5FCy7eoJlAfl1BF0Y=
=/B9Z
-----END PGP SIGNATURE-----

--Sig_/nNdR5oRnuudB/zN3nJu_MvE--

