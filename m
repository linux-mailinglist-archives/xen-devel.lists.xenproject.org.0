Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287D37F854
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 15:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126944.238534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAxP-0006D3-NC; Thu, 13 May 2021 13:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126944.238534; Thu, 13 May 2021 13:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAxP-0006B4-Jq; Thu, 13 May 2021 13:00:51 +0000
Received: by outflank-mailman (input) for mailman id 126944;
 Thu, 13 May 2021 13:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lhAxO-0006Ay-RG
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 13:00:51 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed72c616-108e-4c2b-be7a-b239aa834ae6;
 Thu, 13 May 2021 13:00:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4DD0l48G
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 15:00:47 +0200 (CEST)
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
X-Inumbo-ID: ed72c616-108e-4c2b-be7a-b239aa834ae6
ARC-Seal: i=1; a=rsa-sha256; t=1620910848; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fE20vfkRVmpJhOM3cLGjRIXU+P2FXPDvbQT9RcK4IxGSKHHQtkQJnjod6Le8B8pDgP
    eZFLbB7Us0slRVXJ7N3454Gr/5SmkgDclx9HzONAOq5xJvrEDnetECaZLFV/QjoanGKS
    d4DukNggkQ4MPhW0eZqZQ0vlxaXYvJ5uMJCQEwZGhKjFQLKtmRZH4xVWxzz00mv5BHLP
    wvIMsZpeaEFzQL34JM9AKbyf/zyUBsHHRgcCagB3zDm0j+hlJkF/DYRpiW0ZuDBP5w/H
    +s6lqYVyrcXGZ9rwluCsvnXaWnizpFnM6u+esQxqdL8ExuCI1LWrMeZP6O/4E+uZtnm2
    Lw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620910848;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VAaDm+7Sqi0/Wawe5GvM8BYwU+cG8DW+YhY0b1pyaPU=;
    b=Kc/DA/7C2n0q7ZqNyu9WwojZdGoussBh4scVJNM5JKKZxBrIq0mO3YMCeu0+2huY/R
    Ovfu14+6Qj0rVEdUlcFUHJyTGToC+Wb+O7uiqM7z1snWQwQupZsZShQtoxwhCUoID9Td
    Iah3MNZh9y7ptc3Zb7v4flX9mYh4WSBRVLBZUWKPzUlq3nimmUVVMYAWBF6pwf9i9GfZ
    fu/BFHiuC/kn8AI58YA8ZXOgWXVrSt3WEeYdDQ1LFKOt/Nf9Dj0+VNQMooBarMEzW1d3
    Zmflv5bSSB8vFB61mnUBOilwdJJ+FPs6yfTdQ7MjdgoI8RLRYDR94WzhJrOhH8rZ5Nqc
    XLdg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620910848;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VAaDm+7Sqi0/Wawe5GvM8BYwU+cG8DW+YhY0b1pyaPU=;
    b=VEtz5OfXI//bKAjpTwJM6YVlBQlu3fWU71yvR9VND81+z8Fkz3eSlgzfklf8kVCqsV
    msof5zFRcom6ysI0DUKdUE/gdcTkOQHw/eg2ibI6TBYjqN9YWErPr3EjD2W3wchwszAi
    mWRmGXRRQm66i2W37KQXLsnZCa6K///OBnMjcLHOYUI6m+w1Y0Liu5YT6VgMGKePk8Sn
    pPv+2ERCY90sran0pqlGkEDtKbvXpKFC2wsLsTO8K20SymfqqQHSEHYeWxyQ102h98V5
    7KAjuJ8mbebySdYyLYVmqVw+pphSKxJF+ikM44a+fMTfAMewH3RZcAMF8x2UsaAuqPzy
    /9dw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 15:00:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210513150033.2448f533.olaf@aepfle.de>
In-Reply-To: <389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
	<20210513142229.2d2aa0b4.olaf@aepfle.de>
	<389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iSjik7i_kC6qWodgkfSsITE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iSjik7i_kC6qWodgkfSsITE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 13:29:32 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Warning: NX (Execute Disable) protection not active

There was a knob in the BIOS, it was set to "Disabled" for some reason.
Once enabled, the flag is seen and the dom0 starts fine.

If Xen is booted with 'cpuid=3Dno-nx', the dom0 crashes again.

Thanks for the help, Andrew.


Olaf

--Sig_/iSjik7i_kC6qWodgkfSsITE
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCdIvEACgkQ86SN7mm1
DoC/fQ//aHWh5Fulc+rReth+PZhI7yUroVASVGuNUQ7j3A4zF9alOoGY9qd/mkrz
6xw7jUMLr9ZxcEfPWiNH1DR2ZUw/akEjJobYOc0juLNu26Ms0Z6k5VsvD3UPtYK0
j4LFkD+ZoNURkEgEkQ5CJyozQAL1bVhY/8bInExtztimGP4PFfoMKbJXEZNnWPK/
2px/b4KBC4wPbhH50w75odEj/BTxYjuE5gSzOtvhsX+M4li6QNxjxYg5l4IIX5VY
h6B4MeiACkIRjOCVMt4iqaZJeI/VplbxEMs7bQ54CVzs9OG/e3rG55tqtAPf2Uag
9mODnT/pShJNcE217aRpUi4KalFQN/5B0B7Zt9Lx5k0bqlKDERmGt/ltSB/CeS0w
BvWRV0YrH3zO0Y86eFR4Cmcx7cSVlZ5/fnmtZlqdgE+E+thornp6VzBAdwosRPSU
KV+4G1xlVKDwFR8vy8rR+ah8KZXOM6DvtyWdEt49rgxdd91Wrt4xEkhqalSX2xjh
kcL0GoWuP8R39o8l1Vxo6jpJVsxzSwszKW3thWf1OZZzUHhYCsRqSdbUcXBBx7Yd
pxeqBQ5O208pEvANcbyVsalrxK5tSnfS0Hk1tyZMGwidQpjlCcZMHu13rZ1mD82b
ncA6RlXCvTIBdkJjVguX9Dh+gs0O+Al7lccYjP0Q/zQleUkb+X4=
=AHmM
-----END PGP SIGNATURE-----

--Sig_/iSjik7i_kC6qWodgkfSsITE--

