Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA041974A16
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 08:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796196.1205686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soGSu-0002j6-51; Wed, 11 Sep 2024 06:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796196.1205686; Wed, 11 Sep 2024 06:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soGSu-0002gd-28; Wed, 11 Sep 2024 06:04:32 +0000
Received: by outflank-mailman (input) for mailman id 796196;
 Wed, 11 Sep 2024 06:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl2R=QJ=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1soGSq-0002gX-Vc
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 06:04:31 +0000
Received: from mail.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8311e8-7003-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 08:04:22 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3VQC6sHRz4wj1;
 Wed, 11 Sep 2024 16:04:19 +1000 (AEST)
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
X-Inumbo-ID: ae8311e8-7003-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726034660;
	bh=9AiLuBNs/7aC54Rkm+IEyIUtDABvpTmRemFLe/DNkpc=;
	h=Date:From:To:Cc:Subject:From;
	b=MezA2tSsLIj4Crg7kfrq3FW/LYnC3ajf+7iFpeoUBAzxRWxPG3uNP09CrIwFLQWtj
	 mpMGJuwqW1JWApIA2MgcHYHs9+p5EpURjo12OWxqL1dxUVXqwqcPiSL2TB9PhSYr2S
	 Su+GrsbrcNn4GjRGggvov88r87g76FRbCoXbh4mRqWrHZdJjsrK888H3xNqVmcBW4b
	 YGLJdfe98mgksJ2BQWhkKKfpdcxU6LkHxFNvC1WNeqdgXekDYhqVFnJyG7stBmW9Ff
	 ncREL+A+nFrB9zEygqKzteu2lWoH/1AseJamhXqWv6qTIP9GnMdfeLrsobVIOmqsaZ
	 tfai8Jwr9Vbog==
Date: Wed, 11 Sep 2024 16:04:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <20240911160419.20aa64a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/582N.9D4_/VhahkMF_TFUjA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/582N.9D4_/VhahkMF_TFUjA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/kernel/jailhouse.c:17:
arch/x86/include/asm/acpi.h:179:42: error: unknown type name 'acpi_physical=
_address'
  179 | extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
      |                                          ^~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/acpi.h:180:42: error: unknown type name 'acpi_size'
  180 |                                          acpi_size size);
      |                                          ^~~~~~~~~
arch/x86/include/asm/acpi.h:181:35: error: unknown type name 'acpi_physical=
_address'
  181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_=
size size);
      |                                   ^~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/acpi.h:181:63: error: unknown type name 'acpi_size'
  181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_=
size size);
      |                                                               ^~~~~=
~~~~

Caused by commit

  9adc485684da ("xen: allow mapping ACPI data using a different physical ad=
dress")

I have used the xen-tip tree from next-20240910 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/582N.9D4_/VhahkMF_TFUjA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhMuMACgkQAVBC80lX
0Gx7DQf/RD962o1RDRkEQf9nkOtLj/Uiy/44PMz2jH50hkl9p1Ji6HGiCICqt7lR
1kXYslR4yv9r0oywo/LaO3/pD+Q6QfgRXIrj8oLwVIVsErscyqBpDwoJI1pufupx
q21+oHuYInRtSvLOgyDXZAJXeW6jIKumP8INzGJBCVYJhEN9OU1EEkr0tmK64Wh8
4ZgiJsKsOOfI4B1u40oy0lnRzh2bXin4SdZHBtOIhxmAjrL50cB7aCVrtHG6ykEh
xjic7GrimIgywqxSRf+1NkiHQa9B02tJzBIZwj+u5ldcHJ8TFnUQIKAmgVmQOsCl
KbrtiDKRqhEiKVvoLVaj32FFzjLwTA==
=8S/U
-----END PGP SIGNATURE-----

--Sig_/582N.9D4_/VhahkMF_TFUjA--

