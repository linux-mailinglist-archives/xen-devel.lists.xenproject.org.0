Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A873FBB2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556110.868359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7UO-0006ge-48; Tue, 27 Jun 2023 12:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556110.868359; Tue, 27 Jun 2023 12:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7UO-0006e7-1S; Tue, 27 Jun 2023 12:08:08 +0000
Received: by outflank-mailman (input) for mailman id 556110;
 Tue, 27 Jun 2023 12:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pgfp=CP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qE7UL-0006e1-Rw
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:08:06 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e66638-14e3-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:08:04 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5RC7qlTW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Jun 2023 14:07:52 +0200 (CEST)
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
X-Inumbo-ID: 44e66638-14e3-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1687867672; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Z5J84F76Y2pHDpWAhgTn6P9MzSnJwW7BZNFyhgbvF6ZKXCmKqpanCgWh+Tha+o8p6H
    la1V6F6y0Zv+UOAGS8FH6T7gqGtDruj/jASYfp+kxJx0PuqOoBDQ9YAGO2XHDWV7jgNi
    mmUm36um7yIr3HAkRoKij37ivmC//79pvApzPsqJOLUjF9PrzcLkXcbTzT32OLmweLRf
    U5j89NZtEHb3KBoSo6utv1kyk/K6WtZVWkti94estXLkVBOY56D1y6G1lJAto/viK1+M
    lzyt1wgRogpKImbzv/mibhPgH/D2dsiszn3NbcT5MgBoaLkw9V5VvgRCFCFZvMts0Kr/
    UUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687867672;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tx8S908wrSoiDBE8MNdPbWlWFv0DUqhlBPowJD3iDxY=;
    b=A+LQU8cNhOkdi5EoI3u4TaM9wEhatrZovAwl2zaByL+6NzgBh64Xy9CIos/qj+IsTp
    22/sDF4KE0Z3JxrWYkLUe0LZIcy8O1GqvxAOoJneoq+t4wEu5HoP1SjgW0wOM6O5uACY
    4thS931rEL93JKJ8slvlsc5EQ8OUBkxUuSf8co9qpVlxLZxjQ34mVMqfw6hh0Yu96CPD
    CNVfKGy6mVbcI8DhC9UKnsVXP5FgIwiCHzD/BL7tNo13HoXf5qZnzmWFKrJrPf494X5d
    A5cwHz2qjEX59s7DekEzcEwIv2XbJ3QGR2i37jzS94JkFlweHPw7TWnk45HGLw2JUUYc
    IAnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687867672;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tx8S908wrSoiDBE8MNdPbWlWFv0DUqhlBPowJD3iDxY=;
    b=LTGZ8IIDUZBcJg+kznzXi/ilPFivPQ1cekWdtvb1EpOp+IPn29VhdfSyyCK+A3U8lw
    jO7RgR0rSdHefHA9/C4oLAF0zEdR/WH67K3dR/tqWMaNul6ugMt7u9/dWXcVg9Xgyxv0
    9fHxSJaoAZwYgSDi1Nq1n++OlsCwxPhjdms43poCxCQZQT2bBsd6U6AxPJqZyqThZ+RF
    IytYm/eEjFAvz7lWQ2ZLl/3jx7t8/dT4QG+YAmCoffOBK7X/L1L/XI80i48iQE9GD9Y6
    igKNdn+NwAj/kYPpcBzpT3/Dpf/PBgYftql14+I5l+VaHIpHObXVPnnTz5G7gZYXm0TD
    on7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687867672;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tx8S908wrSoiDBE8MNdPbWlWFv0DUqhlBPowJD3iDxY=;
    b=P4uUlc5zpulTSMQrewpzWItDt5YZulGrPs3FvKjFCffo+f8/z9S/XpBgRwVpBR1oaR
    WqbdLpKtfMTo8GH897Cw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXWiuRyeUQh3GC6w0BTiV2X9kN/WAr0rdTE7oY1qJzPNA=="
Date: Tue, 27 Jun 2023 14:07:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, John Snow
 <jsnow@redhat.com>, xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230627140740.2736f6e8.olaf@aepfle.de>
In-Reply-To: <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
	<20210325121219.7b5daf76.olaf@aepfle.de>
	<dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
	<20230509225818.GA16290@aepfle.de>
	<20230626231901.5b5d11c1.olaf@aepfle.de>
	<c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
	<5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1+315bbqjMVp=z=Vx.W5NN2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/1+315bbqjMVp=z=Vx.W5NN2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail.com>:

> The BAR is a 32 bit register whose default value is 0x00000001. I think w=
hat's supposed to happen here is a pci_set_long() rather than a pci_set_byt=
e().

Indeed, the u32 at that address changes from c121 to c101 with the current =
code.

Olaf

--Sig_/1+315bbqjMVp=z=Vx.W5NN2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSa0QwACgkQ86SN7mm1
DoCGbg/+KP49nafrg8nrPI64mYG580E7pJzqqzgHClvUn7NqE+jBpQ+P3rom9Yxo
5sUx/U8WVYHF8NJM4Hyik3nbpIUindEmg6Y4hBFOSC+rHB+XFzjpnsudno5YDWKh
AEFFXEIbzA2ckQJ6/Vu4EZ/8zDKA8C6HY5yGhICk25X5ESFfkJG5sKcrmfB/MhIQ
UOOsrWkk3fV+xBHW8U94+P6zSJ8UMEHHick1pP/csIrK1VqUgPcg+nLL/JI5oCiS
XqzzQvEsp7H+tq1q42syxXytNtdAoOJ9kTI0/teKOUqykwJwEHLIGxM40KGO1ZWM
DY6XcPZAiRmrhHqaMw+Z/4ilcRyn5a8yY8uZZqF7b8jYIRUgMCYeqJY8ZyzjRiJt
+M8uRzcM5lotYjv3+bNEOlfhKWZ4uzxNlSsg3At1Yolw1LbtoRtOE+I1Q2up2EZM
JpDjaxcnUalJa9NdbCElgd3gM6fATSb5W/wDhm71NiJ0BK/8WHuoLLArFma47GcD
7vBaFl0fMTXsMeabH2eFP4cg0KgeUzK76SvQn2YaAkThUZTwvXvdMqq3vTuRsG1m
F4JS+2smXhFv3N2lXBSyWqyi8rU/y3sI/e22BTKpsh1AE41nqIVIIMyr0xoHXBwX
HTaYjY/jGdSJz8yeBZFwo9/pHrpu3wG3yqCDz0LA55zWtwcZbD4=
=WuKj
-----END PGP SIGNATURE-----

--Sig_/1+315bbqjMVp=z=Vx.W5NN2--

