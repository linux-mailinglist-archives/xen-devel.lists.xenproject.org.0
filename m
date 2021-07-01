Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0753B953E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148975.275352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0BE-0000v4-E3; Thu, 01 Jul 2021 17:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148975.275352; Thu, 01 Jul 2021 17:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0BE-0000t9-B1; Thu, 01 Jul 2021 17:08:48 +0000
Received: by outflank-mailman (input) for mailman id 148975;
 Thu, 01 Jul 2021 17:08:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lz0BC-0000t1-CU
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:08:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fde8654e-da8e-11eb-8351-12813bfff9fa;
 Thu, 01 Jul 2021 17:08:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61H8c7rD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 19:08:38 +0200 (CEST)
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
X-Inumbo-ID: fde8654e-da8e-11eb-8351-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625159318;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LIhm0s7MYVUQghllSXbu6oUayBlInZOsy10OIdm7s0I=;
    b=SBrVmwUHsTuXkXkTY5WYeyyCWBhZ0q2qkZ0N5BDgJU+LyTvI3Vp064+97g2hk8UivV
    8/qu/Yx4VPUElj4Gyw54CjjBt3n9d4W+1GRYqedrWDZuDgBpV/SBIVGX57Eq1Svs9TY7
    Z0ru3kIjPLgmD23Ua3YsCA7lEZAWcS5msXfbSyGDjKuJOtqoTVCb+z4s5u/EdMyY5xmj
    gMAa7OUDfl8dn3vur7+rX2CaJBn0Dq5LGOwRVcWDYSM/GN7yvguurUhCN/FKuOZYt7pj
    47/e1dCNh6Qq8z4iO9sJarz3uLMYA+slNn40QN0cRjf5QQ+/FIgMozs8CUvuC78sCgX1
    78pg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 19:08:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 33/40] tools: change struct precopy_stats to
 precopy_stats_t
Message-ID: <20210701190831.4bee9632.olaf@aepfle.de>
In-Reply-To: <YN3xGNq2vkTXqwZv@perard>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-34-olaf@aepfle.de>
	<YN3xGNq2vkTXqwZv@perard>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3dctEgGIi/JgQQnvlhc7Xxj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3dctEgGIi/JgQQnvlhc7Xxj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 17:45:12 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> But can't libxl_save_msgs_gen.pl been able to deal with
> thing like 'struct precopy_stats' ? It seems to be able to deal with
> 'unsigned long'.

Yes, this is apparently possible.
I have to check why I thought it was required to turn this into a typedef.
Right now I do not see the reason in the code comments.

Olaf

--Sig_/3dctEgGIi/JgQQnvlhc7Xxj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd9o8ACgkQ86SN7mm1
DoBmFw/7BEB4hxB/i2Pgr7FCI7N41L0qjTC5QwSjJhbD3xC5GxULbccTqGUlGlqw
zrCXcgMLeauNYQ33EUWLU5q7GqlhIvnK0hTpjJAIdw8AWXINTog0CqQIfYTvPGxR
y0wqdUkePVmAugyMy7/zPm6lYTKTrgbcVLgS5nhuSwNW46DXjXJV2Ox0d33wygo6
ThV9Gey/IuIB3wtt9dbJoDr1URWaP+pWX9PTQt4/m1bVdEiYWdO9IBbbQXzbZsa4
xwrgjlplR2uW16CLez4+++T698WkK6nr1wcCqIoNF8Tyx+dZbzdBhNh+qyFofBQ3
3YyPwlP0Do0bEVw0Kyy7CH19gi2th/RBUlJ3JGsNGYN9ip4hOQR9vDCG+TEA9rNs
6Z7/NPySd0HPUQZ4SqVxGJAFWeYpxId6rzgUMI++heE6t0Xb9n04Dxa1AD0FoK7B
nmTX5/2TlmTJGu9e7viVabvplRfaXRWRg14txM2Mqc8JvFXjyWGH6kJFpCA3ArrE
YolOAuoY8cpXbSQpNIkASx2//Am3XXx1RawZUBsJKrlMcRyhLWohmOt+YAwJEZ8e
ZcM41hFjabbSZJxFk+87CDjVMP9l/fZa1ITotgIRQ8NhVCpGYEJ1Pt9wVWIH1rOA
h/KjyFDxkHT7rtEGTGBNBnx4V1XQvfMMp11mGMggbTTBgo04B2U=
=EGPx
-----END PGP SIGNATURE-----

--Sig_/3dctEgGIi/JgQQnvlhc7Xxj--

