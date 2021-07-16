Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DA3CB8FA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 16:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157231.290222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4P2S-000744-Tg; Fri, 16 Jul 2021 14:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157231.290222; Fri, 16 Jul 2021 14:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4P2S-00071p-Pl; Fri, 16 Jul 2021 14:42:04 +0000
Received: by outflank-mailman (input) for mailman id 157231;
 Fri, 16 Jul 2021 14:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FyDT=MI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m4P2Q-00071i-QE
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 14:42:03 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.216])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 109f40f2-ea09-4a5c-b818-441a1e5104e9;
 Fri, 16 Jul 2021 14:42:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id t06ddcx6GEfwAS9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jul 2021 16:41:58 +0200 (CEST)
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
X-Inumbo-ID: 109f40f2-ea09-4a5c-b818-441a1e5104e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626446519;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7sC3zz5iCDihdl1GXiS57wOxgDdoAK5p7ZU82cK+MkI=;
    b=ECKhIB5bBQXIhCtyUsRx81yX4BCpnincBADRqDzSl3crDJnzgJiA/YvwT5iZcQc1qZ
    rTyjsayVvgjyCEeKx5Llc/lMaNujahbqDrSzPg3YT16crP8uujN/QoE6D8LsL0q6g/u8
    eiFfQ049BhOTRTSTic1cOpRImMR899aP/BfHbPt51Ruy2ucLicU94sAx7JOymihyAPGS
    sIbOqt5RcEtNCcjxUPIYu0It/+0i1JtH58OnON8GAnSt83In1+9FO3lYCXx68jepPdCc
    FNebU6F+pbglyw5UnwfTQNqhplIZkbS4vGa9ifL1VvZQLctMk6Cs442K8IhyTYlWFaIL
    5tWg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsURaIaRrslkC/Pt+2SNw62nHl8W9V9xI0n+FLuA=="
X-RZG-CLASS-ID: mo00
Date: Fri, 16 Jul 2021 16:41:57 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <20210716164131.56a7b539.olaf@aepfle.de>
In-Reply-To: <YPGXm9F3OHqLk/ml@perard>
References: <20210708065435.24515-1-olaf@aepfle.de>
	<e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
	<20210714093104.52f25e70.olaf@aepfle.de>
	<YPGXm9F3OHqLk/ml@perard>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mtixONCx2Z.ROZU0q.IPFuG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mtixONCx2Z.ROZU0q.IPFuG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 16 Jul 2021 15:28:43 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Actually, it's possible to delete the repo.
> Navigate to the repo you want to delete ( https://gitlab.com/xen-project/=
people/olafhering )
> then in the sidebar/menu (hopefully on the left) there is "Setting".

This entry exists elsewhere, but not in this repo.
I guess a project admin has to wipe the repo.

Olaf

--Sig_/mtixONCx2Z.ROZU0q.IPFuG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDxmrUACgkQ86SN7mm1
DoBKQBAAoBTW78pbTq7uklFcq5pIADPKMNgg3IfvxX2aEzgkXEPzYcqiQyj0bckD
1IN+ZvEgjrDkUmeAeqg7P35nXIf9QgkCoUj9QlQSE/ptOf13nVWWWhew7/pf7GaL
E/lBUP2U7yIlaGo72RL1W1BcKNkU+lrxwK0E2hvZQEQpZWNYPzoh68X9EfLvHIEH
2xn2DZZsPA3jW84jlix2vDrnKC5CvE/O7ZEUlfjEfZHx1rU+w/dzeWJMsG/VZ1bA
/UBDaZq2LGd/bLrhQ+wWYUFn8NBPOkxObLRhz7hFViQhWzVBtrx65cKhNNE/NvLa
BLb9lTHU1xLZss413uupVkXrj+ndanltoOkgnHt1vCQm8g0VyeeAqBiz8hARVCPt
Da2WHOppn7GcCtwcjaGPS0c71XlokzDV/K/IZ22OTTxQ4iM3oQH1l+z3e7RlM4PH
MVT54OpJKEDhrNMGmSjAeKgKmVx4eclviUCuiH8op94/RijaYtlxQJQyDcw1qPI2
VeLM6ackOlvbqPoP8/hL8kk7gVxBaxTvPZsGBUuzzi3OayjlsbYvF+b0Uqye5yN0
tzk2YFtJd03853vq66fm1xdECOfP6Cx5ceNJvIqo3iCjiQ5Td93lhgXKGGKROm8L
mWCsvgo088w0jb9XChB735t+FLsK69z9lpStiFfOteYiqV92+T8=
=H9X4
-----END PGP SIGNATURE-----

--Sig_/mtixONCx2Z.ROZU0q.IPFuG--

