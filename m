Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D290115C84D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 17:34:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2HOB-0001NP-Pz; Thu, 13 Feb 2020 16:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Laim=4B=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1j2HO9-0001NK-SW
 for xen-devel@lists.xen.org; Thu, 13 Feb 2020 16:30:54 +0000
X-Inumbo-ID: 32a8e4f0-4e7e-11ea-bc8e-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a8e4f0-4e7e-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581611450;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bfKL4vLBeVzq1JaOeDxK90V0rUpbcyARr6vFnVIQOsI=;
 b=UJRs2+GdG4Rhi+2C4+sHnTCC3FPJnzr02n2YGhMc9s1B/sx4DFBGQsTwGKsVa02aw5
 qN/w6dd7/ZpveoK7vws80QYeEkHFS+gy2biF96YJjw/sKISBhbibHAUb3m2Dg4Wzigvf
 iifCBCzEhn8pSUVUb89v1wvVrH4mjxb9K19qPIf9fsoxB2g46Y4j8+6knbgJZ4+9tmP1
 BiJNVlN8qAmsxjA37avv3E17aFmWYrHwmbD1LtXjyzAkTWpoi/hMgr/NuROS5Fs/4eAE
 21+3SwVA/wHKvypWCqBtA4/yO6ZdTXR9oaCD4b0xx44y4JODINlKO/P032PxfCFkO6XO
 rFiA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMlkjQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.12 SBL|AUTH)
 with ESMTPSA id 605caew1DGUnvaC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 Feb 2020 17:30:49 +0100 (CET)
Date: Thu, 13 Feb 2020 15:53:18 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213155318.0e43046b.olaf@aepfle.de>
In-Reply-To: <08abe0b1-3735-d987-1ad7-b608331e564a@suse.com>
References: <20200212115325.12f2efc4.olaf@aepfle.de>
 <20200212152219.38d1a43c.olaf@aepfle.de>
 <08abe0b1-3735-d987-1ad7-b608331e564a@suse.com>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] reported memory usage does not match real memory
 usage
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============0451305330117639907=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0451305330117639907==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O=63qKcZP2C/JC4RRefm3aV"; protocol="application/pgp-signature"

--Sig_/O=63qKcZP2C/JC4RRefm3aV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Feb 2020 11:28:29 +0100
schrieb Jan Beulich <jbeulich@suse.com>:

> On 12.02.2020 15:22, Olaf Hering wrote:
> > With the script below, the formula may look like this:
> > - each vcpu needs 1MB extra memory
> > - each GB of a HVM domU memory needs 8MB extra memory
> > - each HVM domU needs 2MB extra memory =20
> ... this is really an implementation details.


That might be true. But it is important to know such detail. Otherwise the =
value of "free_memory" becomes useless because it will be unknown if there =
are enough resources for the domU that is supposed to be started or receive=
d.

However, if the value of 'memory=3D' becomes the real footprint from which =
everything is allocated, future versions of Xen may need more extra memory.=
 The domU may see suddenly less memory after migration, which is something =
unexpected.

Olaf

--Sig_/O=63qKcZP2C/JC4RRefm3aV
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl5FYt4ACgkQ86SN7mm1
DoCQ1g//WNWVOKJna7vv2i2LPVoCOxnOkhYWdWSEbpSX5/0XQ/bGHLKffdCJ00pb
It9P80jtfNfG7K8VCypzpryf7drECl6bvpihmD7CQcMWf03uFNmqkedI1M5QZnf6
ivWGUybNfSD/mlXTbtOtElBdbCYZMJXUeXyAphM5WC/6dZjyTdcc7ov5PM+eTIRM
lnbcVy6JLRdnZYD20MITYZb2xam2RDL3YcZy3MnxnXIAYtSz6Utwk6AFYGE+JAFt
RkjGvWJaAVLTy1nww8zpUmPoVM80+/AJo9lA9oF1v8ICirFa0+ZaLeu13P/mhIa+
pwk//wr+nn5kva0bYEs/oBeKEEvZh0DBR7I3GDUH980Xdr/HZdhuGOPj9LCkQSqJ
XA8aCyVOTnXaMgILDL5J6h3dPkjMVqRr6/wPny9B4jL5lJspmKjhwf6igpNRqE7H
JSO3r6I56/hAv6L6qwJpQ2lvTUk6Col3Gm3bvNFrFrU/mQIBx0ZO72HPqBabJdfi
Gb15i/k7/MMP+8xJjWHU2oKq4DbL0Bj+VnLKNREsHbaCtmNKtZWVz57O11zqY04b
3ggMJHPCNUhJcXfEKtjRb+YnXv/Vlg0I9akKy7RQ+3qHiHQEqizjbazMKNNdzmvC
wYbDBWNj01y2UrIwIU/pIZU7/YFxwQ8E4Sn2baTEOSZG05Rp3y4=
=xaKt
-----END PGP SIGNATURE-----

--Sig_/O=63qKcZP2C/JC4RRefm3aV--


--===============0451305330117639907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0451305330117639907==--

