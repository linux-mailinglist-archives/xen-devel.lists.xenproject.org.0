Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36597611A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 08:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797011.1206759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sod5O-0001AA-2T; Thu, 12 Sep 2024 06:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797011.1206759; Thu, 12 Sep 2024 06:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sod5N-00016z-Vx; Thu, 12 Sep 2024 06:13:45 +0000
Received: by outflank-mailman (input) for mailman id 797011;
 Thu, 12 Sep 2024 06:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0OgS=QK=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1sod5L-00016p-HP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 06:13:44 +0000
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 266add26-70ce-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 08:13:41 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X46ZQ6Vf8z4x0K;
 Thu, 12 Sep 2024 16:13:34 +1000 (AEST)
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
X-Inumbo-ID: 266add26-70ce-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726121615;
	bh=TB3+OuQrMEL6lwfslY3+79QTMJPjCDrIbhGGNU2vMfg=;
	h=Date:From:To:Cc:Subject:From;
	b=hRCNg49eX5Nns6R9QZDXZpWXYdXQNoHhyCuMbdXcDszPPTD7e/GZtpOHiexdMlBor
	 d15IeeoR+wcFlM3+H1wtJkHnTorG/rlG1x/uTfhYDSIbTNfhLXlOSY1jsAPi5dlzkw
	 Dq75i2K4y38e0QNH8eC8Pvi8E4BIJclaXfNRNLLEG8oP5/d45aghF0mnPhiz8kVMnt
	 4uOslD2TAlP2+f4Oea8KV8haS6RUrh2xholRlcDHi4cUDuTJBMsPR2UIO/lXLQDIjV
	 vuCqtxdbbrB4k5PdEISMB41vpIn4tj+p3F4FGHdENqCAD9OpsxJwjuUyjbGFyWP9rb
	 qsVdnPyk0ABCQ==
Date: Thu, 12 Sep 2024 16:13:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <20240912161333.1e65a06a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PnVukLxuawTL4o2NvivCaRM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PnVukLxuawTL4o2NvivCaRM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "acpi_os_ioremap" [drivers/gpu/drm/gma500/gma500_gfx.ko] un=
defined!

Caused by commit

  de4237fd5174 ("xen: allow mapping ACPI data using a different physical ad=
dress")

acpi_os_ioremap is not exported to modules.

I have used the xen-tip tree from next-20240910 (as the next-20240911
version had a different build failure).

--=20
Cheers,
Stephen Rothwell

--Sig_/PnVukLxuawTL4o2NvivCaRM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiho4ACgkQAVBC80lX
0GzdXAf/dMV45FVDLzwh1p1FCLsoY+g+bl1mjxTGFDD6lo4+W2yb6c7Z+R91pJCA
fJHgBkYOYAK0Q4pLZa/k7bSgBF5mGN4VwDQi+nwa6PQbcIhjo2fRshAiguKy7vi3
UDppoP3OOadX9alUNN9q+bd/mG68AmO21KUIieTzHhJGEFAc8gwc+bNG5mDWfU3K
Y+dPPa3Wcf6QkRzZDEbkHhqdEFE5ZK7ubv1HlzwaDuiM5LGsKa49WnLzCesxz+gj
9tN8N1l7tHIXZ9KfwOcaug+x9KWiZg+yMYOLqx22Sld+k9DajQ1cCacN5svLncDZ
uk/LhwVwfmZi/JqITMdrCzdaOW0suQ==
=d7UP
-----END PGP SIGNATURE-----

--Sig_/PnVukLxuawTL4o2NvivCaRM--

