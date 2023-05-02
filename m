Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5566F42DD
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528543.821848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoG4-0001cf-OA; Tue, 02 May 2023 11:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528543.821848; Tue, 02 May 2023 11:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoG4-0001Yq-L1; Tue, 02 May 2023 11:33:24 +0000
Received: by outflank-mailman (input) for mailman id 528543;
 Tue, 02 May 2023 11:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptoG3-0001Yk-Oe
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:33:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 249ce61b-e8dd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 13:33:22 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42BXLcdY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 13:33:21 +0200 (CEST)
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
X-Inumbo-ID: 249ce61b-e8dd-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683027201; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OPmksB21DJ/AM3xaWUaFAcKcHc64BbFMB73v/u4wOT3i927uccuD9SukXRIZvaQhID
    DJEq8Q66LYnXBFZ9r1KW/TDnUYcfLUKIjYIIlqGsbIT86770hv04loBQq1ZMDv0H0aVI
    5A3a8fXXz7Woegs3KdX7AYOA4SFOHj7Nuxc2lbFx15slcIAbUH5B049KWqp7UKlu2xai
    Ih4L6i1gKMPj1EzieMpX9aTZPdr13TiAbYdwFVfiloAtUmN+TLeUulzkBZDJXH1bTIjA
    jQ0bVi96oHHncNlTQF+6h4f3YSR1HbRlHMpsvbcSCD9EcMUIOKI3qZf0hRP73eX5nvxP
    gqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683027201;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a3cApHRkIUuCYLUFapSTvXuSRmye/cuLETd9DiG0noI=;
    b=ISXeZjZgIr3V0NLFvqCUV1BhAzOmu8OcsmRZBL0rKjuQGIx/TX5eOgxcaxHOsm4w2R
    VKwN5HyFRAGoF+VrdVj/yJMcVYyZCG+MCfpi0RD7QtdQmEPyvZgiZT15j7i7vb2ddZTT
    UFm4u5Kprraq/L/xOPQm8UOyd3n6LhQYHsB8ae/VUUaB2dj0Khjqw19vKjiLpoPgGQCB
    R9lf1hhVkzZxNUi1xVX6FNada8gSJzZaty9RNQ7oD1txhhmeCqjvZxjIpcyLUoMABH+i
    oYxM1MPx3iq6zu2ExwVJC4Yb5bpMFFA3aBuT6GczBiv/mpIheDookkb7Jso7M12eHJCC
    oFcA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683027201;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a3cApHRkIUuCYLUFapSTvXuSRmye/cuLETd9DiG0noI=;
    b=jGjW0GErGZEy4WbQqHVMLYT0A9O7hTsDS/qPrMyOBIZW2JH4rOkTvn+swnfYZq7LX8
    lxSSS00N/2pYm10CDYjR5XQrrUQE964BirJjdwH9nKodnqZZr4msGJ/YrngdlBWtQNZ7
    TGFUW6NaoEB470r8V0QpxBkQk4nCD6Qi+IRRmsNVsVavjz/EwndzuZnR442NMgnqBQnr
    nMAF7umO1+8CMIIFu8nO4xMPtiY/kyVczKAzFIkqBpcnQ6a1lDBpiVidPEiijuJjJdZk
    MgWt9DnC7EOT5Cw1zVDwYIaXnMVL8JIBIvytpCDUl5O/FDcsYYCGvO8QK4rcZtujmPu9
    ++Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683027201;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a3cApHRkIUuCYLUFapSTvXuSRmye/cuLETd9DiG0noI=;
    b=Fc8fDeCGR/88HxagNILvsBGC25hJpHyM34J7f+xg5BbWjHbo0PyYaWEW/5FFYqTdCO
    g6wq6q52WXuaTUWbZ3DQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 13:33:13 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HAS_CC_CET_IBT misdetected
Message-ID: <20230502133313.2192eb99.olaf@aepfle.de>
In-Reply-To: <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
	<43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZQhO5xssfOKW5Bk_p7R4m3I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/ZQhO5xssfOKW5Bk_p7R4m3I
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tue, 2 May 2023 09:31:56 +0200 Jan Beulich <jbeulich@suse.com>:

> How does 2.37 vs 2.39 matter? CET-IBT support is present in gas as of 2.2=
9.

I have no idea. It turned out, the previous Leap image was based on 15.3, w=
hile the current one will be 15.4.

If I run this manually, it appears the error is produced properly:

gcc -Wall -fcf-protection=3Dbranch -mmanual-endbr -mindirect-branch=3Dthunk=
-extern -c -x assembler -o /dev/null - ; echo $?
gcc: error: unrecognized command line option =E2=80=98-fcf-protection=3Dbra=
nch=E2=80=99; did you mean =E2=80=98-fno-protect-parens=E2=80=99?
gcc: error: unrecognized command line option =E2=80=98-mmanual-endbr=E2=80=
=99
1

An for some reason there is no failure with the refreshed image on gitlab:

https://gitlab.com/xen-project/xen/-/jobs/4210269545/artifacts/external_fil=
e/build.log

I will investigate why it failed to build for me.


Olaf

--Sig_/ZQhO5xssfOKW5Bk_p7R4m3I
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRQ9PkACgkQ86SN7mm1
DoC9CA//aPfzO636VAjq1LQFiCVnWwcsTYs0KQwbwG9x31em7JznVL0gCwMfHYAW
ICNLXqRWD1h9g8/Yd8O9BquHMJkvW2GUyPDfEP815c8mnUiGoVBMAv+C4oWUNDAS
rpmZYgj4a6qvKDzCEienxUgTyYSamcNGg4sBY7jHuXnb8rSdDVlEE4hVQI2cQZFa
707tI0DQAGct+DbinX7VAO7feLRHm9vYEs9tDC/iaxrbqlcKSDJ/Nam60vSBma0M
esw8xw5+WoXbFCTQ2KVKcL3dfxaDG7vkN6QrCUD26SoDe1wA/a6bVMQ/nauidTZd
QQ/raf5KI65Nt1cSf8Cq7GZ34twmHXt76TRM2HQwPM4kFb7Agj0n1tdGPNxWJnkA
ioOTo7GBWsAwm47UKb/XGU83rFuwHHDVQNQegmMBG8w/M6WSaOSWqiy6M577FnLd
QoeQWoTgCsbwAI83UaYglllxYZBqNiflQI7YxFEOAm7hVkIDEU3fV6skVVgIeMHb
Rjtvx/WiLuARltBrfP2Wewr6qrPsJTI6bNlNoztPnxri50D/TcQUVbVTztQ4cseP
T9wFQ6+tzejC1C2C0joBdn8MsiW5O29cnqcMMDJ4EJLR/3OP6yUxhxAjQjvSr9Aq
JLH1x532mVooANRhpcSpG0kqwLW1Jz1o/2MuuB+nRSjvQ0P+IU0=
=IsJ1
-----END PGP SIGNATURE-----

--Sig_/ZQhO5xssfOKW5Bk_p7R4m3I--

