Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB75E348EBD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 12:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101374.193849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPNv5-0003rj-Hv; Thu, 25 Mar 2021 11:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101374.193849; Thu, 25 Mar 2021 11:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPNv5-0003rK-Eq; Thu, 25 Mar 2021 11:12:55 +0000
Received: by outflank-mailman (input) for mailman id 101374;
 Thu, 25 Mar 2021 11:12:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z95P=IX=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lPNv3-0003rF-7P
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 11:12:53 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bc5925a-58cc-4269-a3c2-1b03395ed618;
 Thu, 25 Mar 2021 11:12:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.22.0 SBL|AUTH)
 with ESMTPSA id 204541x2PBCW50T
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 25 Mar 2021 12:12:32 +0100 (CET)
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
X-Inumbo-ID: 5bc5925a-58cc-4269-a3c2-1b03395ed618
ARC-Seal: i=1; a=rsa-sha256; t=1616670753; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JcWZ8Vl/Y739zpvIuEeh6F6rtvsYzFNPDhA1PZTV380+4Jc4Z8o+zQ1/NFhQGlZcxy
    WnH9WjJO9BERmhLzcuv28ybkXa2C4JCwRz4uQ6M618PPwpYqF0hh472337stu5sjNhwa
    YECnOl9IZ1n+jpCLFR0pD6Qv7dz9F85ghtgPLtaDHJPML2SuAMbIh5R5+c1p8wwGZcWD
    ozd7L4uHgSBLByW5hsWnqsAq2tgz5AnYeH9Y915OusZShBD9+l7jSEAF97JHYiY8/Mqy
    EBcKInxYF+199hzCGMehT8wR60Tv5NrMLD584l2rk0Sv0OTtOXni6fbSIZy20KkYsngA
    cCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1616670753;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BHLafyRjRvEA3puYQ80EOvJ1Vi/2uXDQaBXaQ3IFZJA=;
    b=pgA2u+tTUV4ad5xzkGDZ8z3CYeu8WwjTEJox4eYNtk0ZDYuoHBLq89hJ1oH4hc3tsa
    rsiyRnL4kPP8K/6WO2fAn57vzs6qDJj0I/TUKwCL96rRtw42Tn4gVK6p29S4prB1zo9i
    JIafA/+Rq2X9rGpkp6hI8f6mtE4prisvYBLmHUfFuy6x0B8w6KUGpYiWgHVDSe5QpHOr
    eLsipMPz/VBmNi2b36u1qMHt6qDgXnJYKhlTUt9F6TQ4gw86GvaBSwTUW7GiLq8RkJAu
    t8cF3xPdUL4wwB9s2Hj/LWkpJOzr6+sH0ucLiM/KW9fMlGCYTEeK3X8j0JxbzuFQMA6c
    E4pw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1616670753;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BHLafyRjRvEA3puYQ80EOvJ1Vi/2uXDQaBXaQ3IFZJA=;
    b=AV8Y9/W7xPLUqF42tea0B+oHK77nz9jfGDsHHm6uE1BmEDdwks8bZvphyzv/SRzxxa
    3N4GOaiVPhjkudPRhNLwX8FQlfs+nH2m4eb/bU908+i5XLojLmEwO7xIAvAXg46FgnYz
    I/y2s5Bx4k8dCjyk1HGn2A/UMlIpSZ2d4b/NEgdCniIMpIBHeAOou7oTcHI2i1/pVCRJ
    tlCLK6ufg1JbcFDtoXC1Vbt4XoFMhniIrcSH6MQdZmbnHTJoBemN4OiJKMU7p1lgmBXN
    Knp7ZkOtXVD3cAdx1tTzC4iqVSm+vahN3bgAmF7yK6oYcrnXanrCTBfRLH9t2jE8oJLC
    meew==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+n4/A=="
X-RZG-CLASS-ID: mo00
Date: Thu, 25 Mar 2021 12:12:19 +0100
From: Olaf Hering <olaf@aepfle.de>
To: John Snow <jsnow@redhat.com>
Cc: xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20210325121219.7b5daf76.olaf@aepfle.de>
In-Reply-To: <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sOLp+_RWfRI_U2rhB9e8ruU"; protocol="application/pgp-signature"

--Sig_/sOLp+_RWfRI_U2rhB9e8ruU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 22 Mar 2021 18:09:17 -0400
schrieb John Snow <jsnow@redhat.com>:

> My understanding is that XEN has some extra disks that it unplugs when=20
> it later figures out it doesn't need them. How exactly this works is=20
> something I've not looked into too closely.

It has no extra disks, why would it?

I assume each virtualization variant has some sort of unplug if it has to s=
upport guests that lack PV/virtio/enlightened/whatever drivers.

In case of HVM, the configured block or network devices can be either acces=
sed via emulated PCI or via the PV drivers. Since the BIOS, the bootloader =
and potentially the operating system kernel typically lack PV drivers, they=
 will find the devices only via the PCI bus. In case they happen to have PV=
 drivers in addition to PCI drivers, both drivers will find and offer the s=
ame resource via different paths. In case of a block device, ata_piix.ko wi=
ll show it via "/dev/sda" and xen-blkfront.ko will show it via "/dev/xvda".=
 This is obviously bad, at least in the read-write case.

The pvops kernel triggers the unplug of the emulated PCI hardware early, pr=
ior any other PCI initialization. As a result the PCI drivers will not find=
 their hardware anymore. In case of ata_piix, only the non-CDROM storage wi=
ll be removed in qmeu, because there is no PV-CDROM driver.

The PV support in old xenlinux based kernels is only available as modules. =
As a result the unplug will happen after PCI was initialized, but it must h=
appen before any PCI device drivers are loaded.


> So if these IDE devices have been "unplugged" already, we avoid=20
> resetting them here. What about this reset causes the bug you describe=20
> in the commit message?
>=20
> Does this reset now happen earlier/later as compared to what it did=20
> prior to ee358e91 ?

Prior this commit, piix_ide_reset was only called when the entire emulated =
machine was reset. Like: never.
With this commit, piix_ide_reset will be called from pci_piix3_xen_ide_unpl=
ug. For some reason it confuses the emulated USB hardware. Why it does conf=
used it, no idea.

I wonder what the purpose of the qdev_reset_all() call really is. It is 10 =
years old. It might be stale.


Olaf

--Sig_/sOLp+_RWfRI_U2rhB9e8ruU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmBccBUACgkQ86SN7mm1
DoBpfRAApO8ObWyfk/aH+aRPfNasALKYjlGgNR8CNaz0Tkxqx2fFggdGZZQwfsp2
dsbOmCw6W9hBQSZZ2naOknqO9BLfjiJr+DHgnxCqfmxd+udmtl9j2qd+nFFRJRik
GFz5ecM3zi4c/ZOU/+pk1kmYTiHeART4JcjrAuPd9mCF8btk5JP7FJ5LuikVAosU
FDzM4gp1h6hA+6avJv7gwhb+Is0UFuDrAgugjHiHbpwX3jSjAh+YyrpCOUEvQe99
s0v8Sp831x/x3ulc+z/jhb3ZcvAZY42iFBsy0YwRmi3UMTQlWA16WJjfHj0x6VUd
WhZcmtpeVFLlPgTE/Ioc9lx2CA4WFkT10jub+l8A03uPNw0ADC7KzgEz1JspwwK9
8a9JVaJNmtzE3eqXRnyguCYCtFI76vT31NeQxZLDfvUCpaLoKKO2l65+x6GS6X9i
CsvH5M/DacZjstogrdx7KOczNrh/uW3zxbX3PSFj66KT6uO+mmTPyYYeNrzkavLp
8rzIZ0WV/AsapimTOUvQ2MDCmraqPyUsJ6GVdhA+UpTJatRsjdfVT7MjpL2kzWZ6
qAH3K85PXE1Tdyx977sQvMOYtvW0HB5/Av8TfY3uk2FHHfbMK/JtL5hoXIc97OVo
F+6HwgHEQEkueZUtNlAJh7ED6h7GvZWpewd0eQ255vxEXejjVd8=
=14YY
-----END PGP SIGNATURE-----

--Sig_/sOLp+_RWfRI_U2rhB9e8ruU--

