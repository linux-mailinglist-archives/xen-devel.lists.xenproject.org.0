Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E829E71D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14080.35045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY46m-0007Kr-O1; Thu, 29 Oct 2020 09:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14080.35045; Thu, 29 Oct 2020 09:20:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY46m-0007KS-Kc; Thu, 29 Oct 2020 09:20:36 +0000
Received: by outflank-mailman (input) for mailman id 14080;
 Thu, 29 Oct 2020 09:20:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kY46l-0007KN-Bk
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:20:35 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a100300-c334-46b4-b805-2c3296e067a7;
 Thu, 29 Oct 2020 09:20:33 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9T9KW16C
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 10:20:32 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kY46l-0007KN-Bk
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:20:35 +0000
X-Inumbo-ID: 4a100300-c334-46b4-b805-2c3296e067a7
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4a100300-c334-46b4-b805-2c3296e067a7;
	Thu, 29 Oct 2020 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603963233;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=jfdgUILIVnX0r6rpu2YL1X5K0LZjxjv3EjQIIikHW6k=;
	b=oqA4UyCGoZxipQhCrWpaHpGD7dYfwvd9+Ztv0nuTIIIbxR9Dxv2h95jaq9tGCHhRTG
	Ru2rl0ZnPZg96y+Ytudh7Cqfim6N0bN08L5HEg9B/kQPvhOhA/TTbBglXx6xM8UoHaMD
	3SXl/uUFlURyEjkuQ9Duz36CitB+YItsLtC/AlSHCXZ2/0HeGoFQuCxDJssq3MBtlMov
	ap9flUhTIfrCUJAxsBg78Azk5u/Zyz+0OKD4sAVNAutHGMda2/ya0Xlcz8CGQZWeQxrG
	KEdOuLCu2L6Q+e0J/OXJn7dYaNtCm6HI4bx2Tx+CnWTicjG8d46FcsD02E9J7rxPNw/h
	Ljmw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9T9KW16C
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 10:20:32 +0100 (CET)
Date: Thu, 29 Oct 2020 10:20:28 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: call traces in xl dmesg during boot
Message-ID: <20201029102028.08c85230.olaf@aepfle.de>
In-Reply-To: <1172852a-3428-be59-a1a0-9e264664bf81@suse.com>
References: <20201029092237.50b8a6f6.olaf@aepfle.de>
	<1172852a-3428-be59-a1a0-9e264664bf81@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NoJyVm/.FBGIada81nYL12i"; protocol="application/pgp-signature"

--Sig_/NoJyVm/.FBGIada81nYL12i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 29 Oct 2020 10:10:51 +0100
schrieb Jan Beulich <jbeulich@suse.com>:

> I've been assuming this is stuff left in the serial port's input
> latch or FIFO.

Weird, there is no `ipmitool` attached to this host.

Maybe the firmware does funny things...


Olaf

--Sig_/NoJyVm/.FBGIada81nYL12i
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+aiVwACgkQ86SN7mm1
DoCfyg/8CFamjskrgUNabLft9FSPSqz4RuLGZp7q3QhU0jF6hjCoiS9/hXSjjueL
CGNB+TPF/MnmxCFtA6nUNaR7Jzmxhh44mjzadTrL8mqGD0IFJ+ATs8ULhwXqAWPK
rQMJpLdY45TRhL72zR8vJ7bw/rQ1ImBt2ImVJcgvJYcJStF6fXBX2VX5jLcLN/7v
8CsMxDLKcl7HJNhN7h/waOWqqJkOdya5p/SJVum4jQXODYRFOzYxMBK3944XNxp/
jHIYDg1G00FTTJ6XPY69B8G79VzAvviifMNZxX8QLW3rxba1+kzuWHyZs73fEmA/
hZIcIpl6u+r0WmEjjLIq9I2ZNXJL/tIHwzCfx4yrYM4eOPdR/OyoWZLt85p7ij5+
aahB/px4+qwDHVhNtwlWXG2UpO/tyADR7MGiSG6CWTdvLcNeNqE9zkN3eElYnwWV
BVQDpSpSEJRR/bD2iB/OkHcNAIFThe6+HGOGwSRhIz6bmPLng5caqGMqYfXlnNxZ
16hjJIEC47gboTJouYUBistiAPwCuoL7zhwhXqIRbhlAvPSt6s84N8yYWJxt9PvY
e9QUAcdOvt62pIFh2alTDWv3JUy9+nODktiYf2zb1nbzpov3YGp/nONw1OOPvvf+
wSE9F/iNqoleRs2SF9x2UxqXr1eVP4hfELz2h9zk/fNoXzMC4lI=
=b5oW
-----END PGP SIGNATURE-----

--Sig_/NoJyVm/.FBGIada81nYL12i--

