Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F540BCF4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 03:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187130.335892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQJSy-0003D6-T0; Wed, 15 Sep 2021 01:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187130.335892; Wed, 15 Sep 2021 01:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQJSy-0003AB-PM; Wed, 15 Sep 2021 01:12:00 +0000
Received: by outflank-mailman (input) for mailman id 187130;
 Wed, 15 Sep 2021 01:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSyZ=OF=canb.auug.org.au=sfr@srs-us1.protection.inumbo.net>)
 id 1mQJSv-0003A4-Av
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 01:11:59 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 034c0daa-db69-469f-82ae-b5a1a8a1d088;
 Wed, 15 Sep 2021 01:11:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8Mcj3v97z9sVq;
 Wed, 15 Sep 2021 11:11:49 +1000 (AEST)
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
X-Inumbo-ID: 034c0daa-db69-469f-82ae-b5a1a8a1d088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1631668309;
	bh=bsbgThutFzSZRIz+iIoRjpMDBwlNKjj7zE08iVOcKm8=;
	h=Date:From:To:Cc:Subject:From;
	b=GQ4N5kqUphB1adToSZjO4dbkkhtqdhVMR1notEhX3u97X4ssGnPn32VdHHedKmWWZ
	 +0arIz8siPieVOqQ9B8UoyuvnI9qof9E/VsYqh0s7iptj81Y3Sf6IOEnXgnQcnvTWe
	 Iqpb8rQB1QY8tcTO8bSgUv9SgmHu4eZ1u3vjWfX7dVMKQ5oMMRH+UDLpum9RZ71y4J
	 tXm5t5h61g6B8uq7XAl5712Hv1R0LTw/sCerjChEP91tZVcDX78AxBmi5y5rhyT9jm
	 POzBGNG8OcIbKmZ+JjhZrURJo6DypINO7/3gakwIgigLbNMz9suc8wTPtr4hXgglOz
	 dkWum8cvmiU1Q==
Date: Wed, 15 Sep 2021 11:11:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <20210915111148.54ddb83d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G6hcjoL2RPpb8JI4cIlnBY_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G6hcjoL2RPpb8JI4cIlnBY_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/base/power/trace.c: In function 'generate_pm_trace':
drivers/base/power/trace.c:170:10: error: 'return' with a value, in functio=
n returning void [-Werror=3Dreturn-type]
  170 |   return 0;
      |          ^
drivers/base/power/trace.c:163:6: note: declared here
  163 | void generate_pm_trace(const void *tracedata, unsigned int user)
      |      ^~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  38b6c7137e13 ("PM: base: power: don't try to use non-existing RTC for sto=
ring data")

I used the xen-tip tree from next-20210914 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/G6hcjoL2RPpb8JI4cIlnBY_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFBSFQACgkQAVBC80lX
0Gwr+wgAn46P/kdwFCQD2pKCXXk05+r+qWnuFMr5KwM2MfId4x5n2PVvQI3g5uPm
dLBHzZMllBDegIdFjtA4y1LDWf9YVKZa+XIwhUnOO1OUFnNR18rB3oLTAWFhIvIt
8FTtXQx30QfzUMrJ8yQfmvmswT1POEKINkQ9fSKH9XKNTo/yghs4CwEQM2UGjPr2
mUDvk+aguzW/YGRK0WCR+ZsahpQ9pj+DydM7DTPRaDJG3Ok1G0NYwXPP0W23A61D
ErwiFq/IPeb8o7c+mfDJG6o5AoW+xy+VKBnNt8UsERO0r2Bg7yZEZvn/TEtehLKS
UJ+ep5+DR8uotIVWaEQQfh5zjz67Uw==
=c0eW
-----END PGP SIGNATURE-----

--Sig_/G6hcjoL2RPpb8JI4cIlnBY_--

