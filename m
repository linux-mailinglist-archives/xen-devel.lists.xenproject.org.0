Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4B3A3B7B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 07:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140179.259065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lra0A-0007P9-V8; Fri, 11 Jun 2021 05:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140179.259065; Fri, 11 Jun 2021 05:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lra0A-0007N6-Rz; Fri, 11 Jun 2021 05:46:42 +0000
Received: by outflank-mailman (input) for mailman id 140179;
 Fri, 11 Jun 2021 05:46:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6eg9=LF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lra08-0007N0-Rc
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 05:46:41 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3ded2e1-8f86-4fff-8f94-16c1b53b8a90;
 Fri, 11 Jun 2021 05:46:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5B5kYan8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 11 Jun 2021 07:46:34 +0200 (CEST)
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
X-Inumbo-ID: b3ded2e1-8f86-4fff-8f94-16c1b53b8a90
ARC-Seal: i=1; a=rsa-sha256; t=1623390394; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PusxxvblkP6TtULIxAwlJD5W5L72yD74vJNyl/UXAaGXSILdDXKg7fYElqay47LnQ3
    UUjGGQJaq4TS9VMTcTAh1RtdRvbE3gxoqd5qcbBvZ0XVMEGaHKAnH2IUKbq7JXmmBHmM
    AzhWvC1Px1DHG0V3cwQiph615H41u3Yo5kS/39gnrFrGRd/n68NVwmxpjmfP+/C/w+uQ
    UCDj+5RPe4CSntkjclKb/etbtWddqmnoup1F68okcVsHJbydoQuB8HlgtttkyhTfH49J
    0rQg4mWTpuzb9SS9yfJsUdCXQCl4PH+gsgSPTK78HK9TlPHGpasFQacKkhV4Grmm2F79
    Z/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623390394;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=vjMzR4FeZm4cvFakoMghiFq6SXk0IuoSP8kIiQZsVEs=;
    b=j8IRvA9HFk4dNL+2QWnCV6Kig1jTrTX8dSXxRugfTqK+NMSJ1lh9uYtCtPF0/jkbcd
    AqmAxj3IOLci6U8TXAkaDjJC9Zr9/RsNH8ZYTb/rQAw8UWS0/FIBnVKzT8jD+0dR381L
    RwtlnZf/V02dR9teFAv3jS/ncd8zYytg9UhEnEU6GPMejF9lM0UpZnwIVuiHbNn7Kmqa
    H06ORsBIsh7kOa1H7BoZYPnLn7qJXHjg8NTgIyt+VNXDQnnCg7wJ5iVVNSMkSoXWTQV+
    ddK+SmG7j2vXY12B8LnK6mfSe05fSd74PIXkx2sSgsevWft1Ev2x6DSYTiyzaZWabDI1
    FJEA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623390394;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=vjMzR4FeZm4cvFakoMghiFq6SXk0IuoSP8kIiQZsVEs=;
    b=G3v8OKC0KmHA0vpKYm0/Gt2VZprUAy4RQpCE+h8IY1rShSxNhnNd9FFGgH0kJiYaio
    5S5+tGH9xAP0E/Zl/EcnfRJPpGUhSGiQHw+Q7udwUmx7wW3UTWyyhzQherPdGdeCmxHb
    jGOjwjG2l4Mb4Fbw4Jufw8cBSzP/WfV0aiKmEijBpxrA6rDB+GpfO5ZPezN6aLiQkpYb
    XM1STOroXQIBgSNeMZGtvsoINTSNhtaLddLZULtm2um28qqwCMI3dzSgC/NwHGCpmYk/
    SFPbJXs8yVUXG/RF6I7vHjsd7xDTfDAwzk4iAghSPevKCyyEUzzbMiznIW0aS1swtBT9
    zU8Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Fri, 11 Jun 2021 07:46:16 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit
 for xenstored
Message-ID: <20210611074616.2a4b96fb.olaf@aepfle.de>
In-Reply-To: <eaf53d99-fee9-0c79-7f29-efd00aae4d16@suse.com>
References: <20210608055839.10313-1-jgross@suse.com>
	<20210608055839.10313-3-jgross@suse.com>
	<20210608183833.023551f4.olaf@aepfle.de>
	<eaf53d99-fee9-0c79-7f29-efd00aae4d16@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_3zU0s57d+DGRnJ1RRL3E5f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_3zU0s57d+DGRnJ1RRL3E5f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 11 Jun 2021 07:01:31 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Why? You realize that above is a comment just documenting the default?

That depends on the context. See https://bugzilla.opensuse.org/show_bug.cgi=
?id=3D1185682 for a reason why it should become an empty variable. But yes,=
 we can patch that one too.

Olaf

--Sig_/_3zU0s57d+DGRnJ1RRL3E5f
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDC+KgACgkQ86SN7mm1
DoA1CA/+P2LL79vAacNURWmh/ed5rqoSlrR4Xfi2XZJL3OdmZEk19I2Z6KBU9jbp
6zE/JHGBkR8AEpbwXJipbiM/RjlMfXRPWK8l93+7l4JyfgGrVUGrzbAvTmq521pO
qWCjPv2FUYy7Oo8d9B7ul+SpOGMkEz2Zrf4/1kKhqC4IhrMfVVB/TNX6UGeogGH/
jl/fsjQNObseXqVj/Ep5IryRvPxUpNPjIMyvPsqKQwdWA9+EYHe+33PghlCpdaWk
d5qRad46HptnhG3eHh6rDQDncYQXUDnqOHgvrhVOpnzwl5FV+L21Wg5ZC9gCljva
hIJ6sLfrV4w3wFpkPi00HIr7MxGk+TSMUEKisqBTyPdz7Yk0/5AXoWR/Io73HMGp
4i/mURj6NXPonzVRBG+18Z3ffEekbUL+9tlhOFkx5b0rltM1le8mCjyRaBrIFdiR
sdKV8rb6dkAyowLdpIRn0ZNva4euEgYa+BwQ381ziNvQV4U1qnaYImSG2OW63hqd
waVFuxCQJsWtW1hpkvViFUkczjvcH8gOHS5Lc9Lk+jMQo6zDpKYNWWH4a+YU0yQI
uPxQ0QTkbHO735EOZZWDr3jBRJpRg9jl/TI2lS+xR5OxITPJ39uO03RXlYCGXlrh
qcrrtno0E9lFAgdwVj23pdWYQs2YwAc3ps95KMNCnNt6C1djr+w=
=Yuqa
-----END PGP SIGNATURE-----

--Sig_/_3zU0s57d+DGRnJ1RRL3E5f--

