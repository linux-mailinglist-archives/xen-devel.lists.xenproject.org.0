Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04443DB2E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 08:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217659.377775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfyyd-0006Vj-CL; Thu, 28 Oct 2021 06:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217659.377775; Thu, 28 Oct 2021 06:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfyyd-0006Th-98; Thu, 28 Oct 2021 06:33:27 +0000
Received: by outflank-mailman (input) for mailman id 217659;
 Thu, 28 Oct 2021 06:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7Vm=PQ=canb.auug.org.au=sfr@srs-us1.protection.inumbo.net>)
 id 1mfyyZ-0006Tb-HL
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 06:33:25 +0000
Received: from gandalf.ozlabs.org (unknown [2404:9400:2:0:216:3eff:fee2:21ea])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f0293af-01bf-4ea0-8ac7-358bbb1fc79d;
 Thu, 28 Oct 2021 06:33:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfwjn0W6hz4xcC;
 Thu, 28 Oct 2021 17:33:16 +1100 (AEDT)
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
X-Inumbo-ID: 8f0293af-01bf-4ea0-8ac7-358bbb1fc79d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1635402797;
	bh=/R7loCnMrMbPjsUshOHJxqGM+7aLjRr8ecYMPWeUsTU=;
	h=Date:From:To:Cc:Subject:From;
	b=g64YH78CMh3JlAlFRYGBkNNGd4y5pNAcgx5ZxVoMv9669gK8hhRZMeZ0HaS+keMbD
	 I7eue/L5R22Q5T/JgBZ9sPSEv7GQyYu1PoIm0XF3UFC/uppsItGb6+XKMOnl0y+TEp
	 lJk0yAUVtpLTv1wHn8KrXXU3a8cDmWIvac5TwoEIYYy+ArxmcOACaewgiKs7JFEzWm
	 P2UOmmmmq1f8ohxWoDrCKaRICLqCjqSHuhc104TqrB1Pow2a/oCC22QjLkLkXs/6gy
	 P0RtS8q+siRTjlxaIBjNuSqKwP3F/kb6j0h+VRUe+QMFsVEqNXZYTteqt7AFDRKf7F
	 xKet4Q0PvuHmg==
Date: Thu, 28 Oct 2021 17:33:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the xen-tip tree
Message-ID: <20211028173315.55b1a121@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r0i/0s/oy4PgZOhjNEZmIby";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r0i/0s/oy4PgZOhjNEZmIby
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

vmlinux.o: warning: objtool: pv_ops[32]: paravirt_BUG
vmlinux.o: warning: objtool: lock_is_held_type()+0x145: call to pv_ops[32](=
) leaves .noinstr.text section

Presuambly introduced by commit

  97c79d816979 ("x86/xen: switch initial pvops IRQ functions to dummy ones")

--=20
Cheers,
Stephen Rothwell

--Sig_/r0i/0s/oy4PgZOhjNEZmIby
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6RCsACgkQAVBC80lX
0Gysogf8DPnYiV4jaScnM+66C/vwmmlpos27JM+22fOKgj/3J1syzTHopLIS2jZ8
v358bhJ1jj8EnGJI/m2ebkZwATeNbGhsTj/Grs2AWaz4XzjVNX7fX6PX6fg4p4wM
aLCRmuedIMDcNkzSNtsO9AZQsQLtpdsmxRthvfwdLkA/L6895mszPTP+hA4AZNzD
SuoLYGP622hkjcASTSGxhaohbo1hJtsfwAkQQzviQ/QhfWdVKmx7gOuLA7AG9mJU
UPVVXAFwoYX58z2q3AqoN2xsAFknKRAafS2L8zKk99JKhrK7azlwoqXZj9unkErI
rivpI4IsQO6yjZs3k9OZ0aIZSI/PkQ==
=yI5b
-----END PGP SIGNATURE-----

--Sig_/r0i/0s/oy4PgZOhjNEZmIby--

