Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9709931A7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812195.1224924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxprv-0005xD-VX; Mon, 07 Oct 2024 15:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812195.1224924; Mon, 07 Oct 2024 15:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxprv-0005vg-SZ; Mon, 07 Oct 2024 15:41:55 +0000
Received: by outflank-mailman (input) for mailman id 812195;
 Mon, 07 Oct 2024 15:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JJzu=RD=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sxpru-0005va-CE
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:41:54 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac50c98f-84c2-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 17:41:52 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id D2e8f2097FffutE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Oct 2024 17:41:41 +0200 (CEST)
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
X-Inumbo-ID: ac50c98f-84c2-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728315701; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ctoCGH8ds0I4kTFd+1VAIM/YOqzI8i6XfYKWtKqA9Tz4R75G/d6ozrPzh9G95FfmtC
    oc/zPKjmNJRGS2WKAya2k1cz6UiLBSNyvhJMJDLmbpMXhm+HdrGllEcu9s5NFdo3tX6g
    6uGzeZ7rcHR0H8O24UEtEPQDYa7HOlcyUgU2SNUgeUa+iUVubcq5eBYn6Wygo4mwlMH+
    iAXp5+KPBnslXrLpWT3kxePzRG4Lo7fhYFpdwxpdl0UlUlJJPoC5ggqq55yseGn74SNp
    opIGGcfUauzMK3QCId4TqFPV+3w7ZbX+N6B0ARj/aQHMDR8TGGcxXgymoMeKb563m2WR
    BGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728315701;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6LLQ+SsIt0thm9uOSeifd1Epsg5iTo6AT+D/8PnPTQ=;
    b=E8J+1KUPA4Fo/6lR7uGx7I2pMl7yYvbNxtJNGoF/vnkP0bRSJTcVhCH0Wbv9mq017Y
    vFmdsecJWyLGm1JYMqAOYdKVgyVdZzvgy9FxRLLP9qtHuv5KTo2gYg0dgQIBO2OpAikV
    auC/3ZlWyRCuAcMUa9Vr9E6fim5MSmzNd8QSqn0+bPjmp5nPqC3cPBh5despAt9El+iC
    m0BiLDa22vWQpIghJ6d+BNuPZcqyjhC5953nwklcKQBzLHGUDQmD1fe+4PvFeu5u/gFv
    2J7VAWliHbAk3wU/Tr/KgrKfttauJNTVKCnqlYjUPUb2J9/p7xjQyboNBQWqiua3EMEG
    AXLQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728315701;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6LLQ+SsIt0thm9uOSeifd1Epsg5iTo6AT+D/8PnPTQ=;
    b=Swl1oDQb10p79tTGcshp/z/xXo4q3bAUvGuYBFUrs782WpAsSsf2vdaErzUEky+YMf
    tSQ34xZTdf0EFYG/WYSeARiYEC5UMsUzTRdkyh1DfT5mt+1GklhkQMx5BYm/JBU160L8
    s3R3tNO/+nY90rm5FI18W7ylCq+ssNqyNII6ASBf85JWVlNvqKgovzS5QgxoEOwabUNN
    U3NfwKGWuP0yhkTbIOLiFsybank4VjlAWrp4KVqoKp+lUXZVx/FE8ZEhydKzYPf4x4yG
    iiV5F3Nwf6x4w4ESQBoAndL1PlCnETEKUZS1AI5QozpcQiI9/XslpSJWcFFRv3JQR2t+
    BGCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728315701;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6LLQ+SsIt0thm9uOSeifd1Epsg5iTo6AT+D/8PnPTQ=;
    b=BV/Vg7DThKf2u2bKZcmjAneJpXZr1FXfWJeNMq7GRkpzPa4ta6+QTlS8XdZgk5vDJH
    MtHn2toc2IvzyxZ1fYDg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4WhSIPErsYj46j6YNLTj1Qc8innI3ISQYqcHUew=="
Date: Mon, 7 Oct 2024 17:41:32 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: use PYTHON for qemu-deps-check.py
Message-ID: <20241007174132.04ea99e7.olaf@aepfle.de>
In-Reply-To: <e7f552d7-f9c3-4f22-8a18-68294324a676@citrix.com>
References: <20241007152259.1353-1-olaf@aepfle.de>
	<e7f552d7-f9c3-4f22-8a18-68294324a676@citrix.com>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4NT.P0/p.1/Apk=fJkFGymn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/4NT.P0/p.1/Apk=fJkFGymn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 7 Oct 2024 16:35:13 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> We spend more than ~50% of wallclock time building QEMU, when 99% of
> changes aren't even liable to change the interaction with QEMU.

Makes sense, thank you.


Olaf

--Sig_/4NT.P0/p.1/Apk=fJkFGymn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmcEASwACgkQ86SN7mm1
DoDa+xAAkKsGYpIdMg+e5O8wt6g9Tt1C6xH+q7lrTSGnfylGOFR9PWCKy4koDhyJ
j67WA0tSEeiO4Avxbw6rAgGUgAAzB7OWYwZra+Up7dEaFzLnq6WkXWDM4J/c2/L9
LJhy6jdyqW7CoASRURRR+/SxGyAYcMguZURHTHWvcECHIkrNOFi8s9oWKj1GC2hx
81SoibnPEDC/08Ic6vgfotxg65LLGSCmh91/G5myrEnckvVybSNV+j0PY6uabzER
Oxwiz5/IaIQf1GeEhD20ziYSPTeMnNSqZ3RQdoEDlpz7bswYmqCAiTVEzYGLuozX
M+YiCQITRmhKf1MDFDd17BJwr+VyoQ6LWe0ICxtV0OMI1cWdK9o4nebV+GdD0ChY
laCzUeyay4gawpziPo1IGnKJ4EjR+HtNy4JKT/V/jdiMKb+p9falyPUuOSscpm+j
o2FZ5oquECxxdD7Yi+/2xKV+LGTwWWcQ4XqPztgqqr0mtd6FSmw4C+FIX+avDX/K
emJg5uB1a9KGdb8oAvKMm/JjiBgQLjhBNvp/fC4D7X4fsmH7/by6YGKj6cLllOcU
Z1HyZYmtlIi8+7xJrFTG2O8V8wXWxdn/tvezXt4pnrcTF661iAlfe8l0D15ro1pi
Vn4WoYF7CsDC4vaZFEdQ72lxqjodqN0JDniFhyQCHvDDMFiKpdw=
=cZEK
-----END PGP SIGNATURE-----

--Sig_/4NT.P0/p.1/Apk=fJkFGymn--

