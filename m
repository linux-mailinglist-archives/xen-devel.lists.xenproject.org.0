Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E77EDC72
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634022.989233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XEz-0001aH-Lo; Thu, 16 Nov 2023 07:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634022.989233; Thu, 16 Nov 2023 07:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XEz-0001YO-IZ; Thu, 16 Nov 2023 07:56:45 +0000
Received: by outflank-mailman (input) for mailman id 634022;
 Thu, 16 Nov 2023 07:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1T5=G5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r3XEy-0001Wf-4F
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:56:44 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad01af7c-8455-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 08:56:41 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAG7uaSmQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Nov 2023 08:56:36 +0100 (CET)
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
X-Inumbo-ID: ad01af7c-8455-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1700121397; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DqO+msE6gqNJzgX7skWJRGDGGG8gXxYGKcqxbJwMsYf6ETtZR/T9Om/wPuwqLii+GK
    Nu2BD+qe9hHBrdoJ91erUbE+wCPxbyA/aMl3jw8L1WYiTy0W/DlkOyNxXAUl/VnyLywm
    wPCeGh6FV9Rld60gdHoZWcH3GoMYtYldEQszDuqZj8gNoY2gBmJCwu5WU5uz2/tIGhtF
    rWoc3ysrbx5/A6mZbR0JZoaJteHF6DSY2e4Es0opvtH0dVlCPpe7kkNF8BHs6T785oY4
    D8khZAOA8vJcsQ/GytNeDQVvAxljoKJGGMBkBHONEPxtOlpg1SFbdunY8UNrRuAaFwll
    yEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700121397;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=AnljQ8K6uF4BXAaaiwfgVnxNAfc/Xknbp/9acCyB5B8=;
    b=PP9T1ygBPU/CAK5+pwN4osIMKfHgPYAwIOmJUr+ZCqMx9uI8VUMxKfKu+OSItN9Nms
    FNOP469HD6Jc82uZW4vSao3pk5Xs4AtO9VdR5TBq8yNY96xrKpE2judcxlqVTF1ovYUE
    QEkejGaOH4yYdd6cUiTEglnTz9OW+YSg21Jw4FGPAy1mtcoo2jOqO1+0des5/zA8v2v9
    7+WWx3ZNJh45iFQUvTqSnFEcz6Ihh5TR1Rh99p0T4qT90LcaGyX0s15TxDMaA2GTpkpE
    y9+sa+sLDUNHclAkxqbcIHeju5XfQ6atSVnmi5Q+YZaiO6Hdrd5u0SlNJfLZgZeh6Ylg
    9G+g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700121397;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=AnljQ8K6uF4BXAaaiwfgVnxNAfc/Xknbp/9acCyB5B8=;
    b=LoPcFF0+xgjS+fXkGhNtwL+650xwhPVx0ojkM62YIvjj2vLQXB1V7oNeNTNUIlpmIh
    He7x17edYbgcu2me0pyOH71OzlO36tSk5cssW7Bc/nKfT4nVboig4FAmidEF2o5zH4da
    RfGIJbLk9VAzz8oP9bti3x7rpBAHmzygDf3O6Gc1ZmdzQeqNXXFPVMoehADjI8n+aWdN
    X/fDvUzBpygUxsQESopRvD3ND2h/JixZI2Ma9wmEMjmXeIPHIQzSmQG3kI+SnT6qy8s1
    NPcGIbyxoWDcy75OANp57qbxFmshjdfuoT40vW7Rn3wCuadAs7YCtw9ZRp0o3CbroKc4
    MH3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700121397;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=AnljQ8K6uF4BXAaaiwfgVnxNAfc/Xknbp/9acCyB5B8=;
    b=DxttJMogw7jSBWssTh6AxbCA5carDejNC7PRq6j9Sj3xw1yPiTVk7dJ1opXtPPG4tz
    GFduFKlQF9TAS0kxqwAA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BhaIaRnsNaqJN2h0dTFZeqQ89seVgD7Tlo9gNQ=="
Date: Thu, 16 Nov 2023 08:56:29 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, anthony.perard@citrix.com,
 jgross@suse.com, Luca Fancellu <Luca.Fancellu@arm.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>, Divin Raj <divin.raj@arm.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable
 through 'xl.conf'
Message-ID: <20231116085629.40a0445b.olaf@aepfle.de>
In-Reply-To: <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
	<20231115182340.505df6c3.olaf@aepfle.de>
	<4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V74wZ8tGdTQRVwrOwF.EGa/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/V74wZ8tGdTQRVwrOwF.EGa/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Thu, 16 Nov 2023 08:45:43 +0100 Jan Beulich <jbeulich@suse.com>:

> Did you ever submit it?

Likely not.

I think the approach to use a xenstore entry was used to avoid
ABI incompatibilities due to changed .idl files.

In case anyone really wants up upstream such change, a global
per-device timeout should not go into xl.conf, to make sure
domUs managed by libvirt can also be tuned.


Olaf

--Sig_/V74wZ8tGdTQRVwrOwF.EGa/
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVVyy0ACgkQ86SN7mm1
DoC9FA/+MnD/mCrH4a/yXmIvtc6RfZCO21t71JN7WKTBUyrWuUUtKrDY0SODlsmr
U7BrBrjcTV38soNbXsvxwfofIQyAZpQas2ad0tj4v1PG/9p49BXqfouarqVeUGvA
qHa58qTV11iEOuTUiu5UUl2STCNQmFONxi+s5RPRHxp1SMwYBTD1xUypDfUtJUSl
PbSPRfz8gQ+4jH4r39cOPprsmS6tt4KbN+UrnDfAre7e/b2l/PjUqb0mdaLaTT6u
u3T0o02NV4OPCsWLN1Pjl7KKixlfb0IF9XfOvasgCO/kXz/oYUNWfpnMQy1HCBHD
27y0caJvTs2KAuAS8d9gpuUQ13L3zVKJKel1IBxCxhXKU5tG9jqR/xN9B+wmKfY1
1zb339UCau3RMTqhFYhy3EV4u+JHvWhyU0B5lD6YP35FWnkPvkJxLxwbXV/yYa/k
inxnK+Wa1atA4xsW6wRsheDm3t8nAn4QV3FFQFstrYb9mb1kwZjHU8nhdho8RxZz
+9/OADzc172+YwFNJOzebSzGuJK/ped3f9d8BnDT7TXyF9mf6P6C/LC7dsKuKvMN
sd4lZ5c5Uv9GAJFeR5PIg8fgFzAKE8v4nR1eG7pBbb4Y8TkQY1eesOHWbpfzZhfK
VII/W2ihVaENPWTBadsU+uHbqdepCd+nBcKM7etTCaTXqUU8cvc=
=VR7f
-----END PGP SIGNATURE-----

--Sig_/V74wZ8tGdTQRVwrOwF.EGa/--

