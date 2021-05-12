Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8837C256
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 17:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126295.237756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqTF-0007ff-K5; Wed, 12 May 2021 15:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126295.237756; Wed, 12 May 2021 15:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqTF-0007cw-GA; Wed, 12 May 2021 15:08:21 +0000
Received: by outflank-mailman (input) for mailman id 126295;
 Wed, 12 May 2021 15:08:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TBJP=KH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lgqTD-0007cp-Va
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 15:08:20 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd1d8d1c-b138-4ef0-9700-d3ab6f333129;
 Wed, 12 May 2021 15:08:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4CF8C216
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 12 May 2021 17:08:12 +0200 (CEST)
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
X-Inumbo-ID: bd1d8d1c-b138-4ef0-9700-d3ab6f333129
ARC-Seal: i=1; a=rsa-sha256; t=1620832093; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rJSs8nGgoaowMvCgVdo82zxzhgZl0oYnpI83lNahm981v31dZPoyjFVZjTg4DxeNza
    ZtwnmBF/5zdDFfWLQLMZ3cEUq2luXR03VI+RN34GbaT3DZZpmubJ3gJXtVodvduiZdFH
    Uz7wFqFjJDFiIHp/tuRg7Q0KecGpTxncNTeX06o9+7Tkh7azD6TgTKBcQ+dRmeAdcV8n
    +89F6BZzWOql8/0ODFSZmLMJl7hJxKsglvFA6ef/5BJk6Vqp7fbDlpJczeSdRE8uCvJ/
    2zYlu5UJfoCj1dQKeBVN088mpa0b+iTAmoUOzip5KEqFhnDZSxoXuBntA+YqbWZUzsgH
    4ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620832093;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cfY2t/Q352tHbkiQrn0BpR6TvhyLbPsyWfDitKNkVHQ=;
    b=M6iuIuWvGpNwGdiueBYazHjU+x799Z5B1A4aol/bHQLhz9YM2/iN/l1kwjyvfCZBjr
    l+KyOku/ydf/+Pn8/NiSiNHamUPqESeNAPrayvevGd7mnW3vcDWOabBSltpHDmcCSgvI
    gpsP3IQzlRyL2Zs68LEX1XpADlDc6Nu+mLj2cJF5/pp3qf+kg1ppOK0UqSlbLBhYfjgB
    EBctF/CVkrRShTZ9Zd4sXcs8SydxRsnhUupuIbfUbQpMg+2n8lqdBg1fihfxuYOyyi3c
    jL8AnYDfN1FJU3dxfB3u8sQeQMta0JE0GTuhz35I8ts/4onvvgXOOcB2XD8SaZ8DEcil
    GEAg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620832093;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cfY2t/Q352tHbkiQrn0BpR6TvhyLbPsyWfDitKNkVHQ=;
    b=B3yQsgbabn1EYEFUxDX6yvdKLlnwXP13W0xB0bTOGuVf7HgB8FvJWq5NQ0VwuAxs3b
    o9OHrL1ltGYD1WYg2x5nEGIEUPN+BSm12PfaGtrb1v54Se0jefOaZVP+ccReF4FczHA9
    MdT0JG+XIw3vmczzOz0O3gcUfZ8w7ACZpjDdJDdR6MY7AyaOW13hgncmZFBAmHisdTZa
    IZ7BHxr2YkoFe6SOEsgbPeWz96m/TvN9T3KbF4QvFzThcA5mfaWktjFuJhJUMsGL7DOt
    8Ol3iid8q6PeL2pu9njxS4ZPtmYHcl6my83VqFbUZqsDKilx4SEKWnBUWZJ1C31dAsRK
    xABQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Wed, 12 May 2021 17:07:59 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools: remove unused sysconfig variable
 XENSTORED_ROOTDIR
Message-ID: <20210512170759.15c7a3cf.olaf@aepfle.de>
In-Reply-To: <fe7ccfe8-967e-ed12-5804-590fd9663608@citrix.com>
References: <20210506151631.1227-1-olaf@aepfle.de>
	<a236f079-1771-7808-bb16-97b9dc5ed733@citrix.com>
	<fe7ccfe8-967e-ed12-5804-590fd9663608@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CeSp98GfloKO1uqBbFogruP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CeSp98GfloKO1uqBbFogruP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 12 May 2021 15:52:16 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Olaf: View on the above?

I'm fine with the additional CHANGELOG.md change.
I thought the suggested addition is obvious.

Olaf

--Sig_/CeSp98GfloKO1uqBbFogruP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCb708ACgkQ86SN7mm1
DoBUnw/+LHeLr8d2lFl3nGOISVN5hU0GDYBtuAm5LN0ALoKkqiL8K2Rv2ce5HOHV
MrEHFnycPUlZk4tcgXKjiTsN8xK647tKyBuASa4+nFRdFIofzih6CJpZRgxXQ6qh
6Js3dyGrwUDO9pHfWoX5ITiidlAy+2IWvWhhTW2LqRZIjB5s31FT//ifPDdfmlGG
x3r+hBe34dw/l70aVnjjZrtMkQcM2Y7W6m9GSRlWu1cYGyrhRm6ArK6S77u9uvU0
/LQV8CdITbSpAovPGpzcTj7FYUQXEoFYHuJ4K+HXM9gF6mQH05+/qh1TXcxXd5YK
rSW7MoMSDH62OsqcocJSlAx7ajunEyfp3R2SAMYX14CJnqUsk85buuJQC+O7cklL
P2AuhZroHRqPcJvgnCQnERxnL+e6/aIk6gv3huWpV9hzdXREHmAJgJNvnVSbRuPI
f/cuZw8JOZtGXTi9tC1IcEvzwPzPzpBNLXFtEu3nfPW+PyjLFXdGUhgcfUsPzdSu
i+zcEI3WSEusPemPgcqq1oeh6vbqSbOgSVoZFOjeGYlOhjKqoY5rV7TZHuEZoZn5
Zsx1IXXRWcU6TMmQ3ko4aefvebR92wnGvZgkdg8erj1ZAYqdQZSWRJp6kXhyYftt
yXJlcE3cAmBds+zNskIzsKcSQGqFOx0xq8Y1J0Lj/UGF8nxqii0=
=piAE
-----END PGP SIGNATURE-----

--Sig_/CeSp98GfloKO1uqBbFogruP--

