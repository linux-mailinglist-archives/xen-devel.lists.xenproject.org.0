Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BC76B478
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 14:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574109.899295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQoFy-0006By-FP; Tue, 01 Aug 2023 12:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574109.899295; Tue, 01 Aug 2023 12:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQoFy-00069P-CP; Tue, 01 Aug 2023 12:13:42 +0000
Received: by outflank-mailman (input) for mailman id 574109;
 Tue, 01 Aug 2023 12:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+Fi=DS=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qQoFw-00069J-Ln
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 12:13:40 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d920d718-3064-11ee-b25a-6b7b168915f2;
 Tue, 01 Aug 2023 14:13:39 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.6 AUTH)
 with ESMTPSA id jd2f5az71CDQQlu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Aug 2023 14:13:26 +0200 (CEST)
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
X-Inumbo-ID: d920d718-3064-11ee-b25a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690892006; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hlyrkG3upPwylhpKCY70T7olKKv3MPc3Ro+hkooftpd3KrftJ4p99qPdLYStHTLb82
    TwULyqqsWs8xS47amaK1otp2OskjtH8thHyNXfabo63732WWKzYvYUam4mDVRlhlxB6P
    AtmCUP5anXT54cwgRCQGbC69Er5P6UZK8V1V9/Kgn4JDBFkvhbVvj9ibO9VYhbdfGVX1
    RE2LBkWUS3d+zNlTuAeUC+7f65RzZTWQWpvQl0XnEq2SPscmwfyngZaPafd+p2pPggHY
    nXdFHQllRtmsjvDvTgTPIGh1LnZVvF5MIaLJUGwQzftBumuEN5U8qRBGUpbh9WF9b0Ue
    tjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1690892006;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cjRqM+XjqX1Xuvw0nxwkdauQMImA252wVov7Kg5/gfo=;
    b=EsDRaa/NnC7MtoLZWYjjNxltk6iEUz3BboFvsMj0MP14/dh03LSy5sxicaKWlAX2dL
    cGQzGxcnaCg7fvyAd40JsGcS8B54c7Ye05oahU9KWW2bR1qIdajs1/TjtQk/SGVmQ4HH
    5kd8rUr/tmNClZ6AtSFqlWqRXxI6BWj9+8BfFRgeNKJFq3WpwpSo6JndmcWVqFrwhT4l
    J19bffWRasdD/Juit9zV8Me+JQ2loGAfgJ+Lbhs+s8SDzab0XAbUkOSXcsPVwYVmij6m
    xrai54viwlGG1sJC8F18n5RRDuJihMa9ZKBg4G8K0CTzoVSupay01QTJxdjsM78Lk0N5
    3xIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1690892006;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cjRqM+XjqX1Xuvw0nxwkdauQMImA252wVov7Kg5/gfo=;
    b=B2yTSpb9ZG5W4q0AuKy4bbPz5AA0vsbp0lDB8vP5aAWyi2+9ST65sl6tJf5k96V5eu
    gJA0rvP7cS02gA293BaNBT+DpDeCYrkqN1qbV6kMvaVuUEZnxrrqOXqv7SbIZ1aJ4PSH
    9Q+Yut7DxYFhp4pn/T8rYdEXRX+s27Q2pnVOWRrSE5KQKwdkmYKpjrt/nGCdXlhLHW+0
    hB+O6cKtysSLZkaeDDIw+yhRx3YTc7cGnc2mtwdndMxRI4hnQo8kYql0jtoZJSNgsWSo
    sa1yQOROGl6QguxdkAq3TbDPsZR28aEtKAEm6X8jorOcqH3+HPFVmbEloYgszu2RZsal
    EdkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1690892006;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cjRqM+XjqX1Xuvw0nxwkdauQMImA252wVov7Kg5/gfo=;
    b=RAjlMPjQoRY7IBn74SP4oslNAYtx4bnC3tgSxZsLDc74KdTCNRVVGbUAFhMCRP9ADv
    DagtMgP1A/wIA1DZVgCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5U0GIOxzsQPrGAhfM0BJebfTWeDWMtcJLtvI+aQ=="
Date: Tue, 1 Aug 2023 14:13:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 7/7] xenalyze: handle more potential exit reason
 values from vmx.h
Message-ID: <20230801141317.53844521.olaf@aepfle.de>
In-Reply-To: <CA+zSX=ZW+-un+sUCEDA3RKd4vHzCvCjJxmqZPuXNf0UHFDq2BA@mail.gmail.com>
References: <20230601142742.15489-1-olaf@aepfle.de>
	<20230601142742.15489-8-olaf@aepfle.de>
	<CA+zSX=ZW+-un+sUCEDA3RKd4vHzCvCjJxmqZPuXNf0UHFDq2BA@mail.gmail.com>
X-Mailer: Claws Mail 20230724T063118.58ae3d58 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5OA8GnnQmIdpCHIvi1e7iim";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/5OA8GnnQmIdpCHIvi1e7iim
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 28 Jul 2023 21:35:54 +0100 George Dunlap <george.dunlap@cloud.com>:

> Everything looks good (including adding the missing strings), except for
> the removal of the fixed array size.  Call me paranoid, but if we define =
it
> as REASON_MAX length, then there will never be any way that a value less
> than REASON_MAX causes a segfault (and if we assign a value higher than
> REASON_MAX, the compiler will complain); whereas if we make it variable, =
we
> leave open the possibility that someone won't update REASON_MAX properly,
> resulting in either segfaults (if REASON_MAX is too high) or missing
> strings (if REASON_MAX is too low).

I think the code needs to be rearranged to work with "array_size" instead.


Olaf

--Sig_/5OA8GnnQmIdpCHIvi1e7iim
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmTI9t0ACgkQ86SN7mm1
DoDJRRAAhg9TndADa8iMkqaX96wWJunwbGup/eUS/YRqgDjB0yt5hw4S+XscIVni
DHkmnUJBMefeVmpZKeRSIKSBqjXPhPN7AUdebxYEFHbX0p+UdSXy8mLP5seUNLK5
REy7AT/zdG49AsfIV8t0AZvsQ9kDeey2TBDX0egnBSU94HtqmcuY1K4k0DE6XiA2
QjOkN4WW59ZPOLkGx/+y55X/sKN+eEOTHov2dXjbHpdC81CHh2i/iG/kXrBXjupj
ppGzlcvtuHSnCDhj1YuIDiCpiKBDr6kZFM4P2LLK+ym9WV84q3k6+o2Kzj3eD1Hz
thiqU6lCaVbOgCAeWIH5QTYSVk31sMUO6OqQsD0jh7t/VCaMA+4yZDgvHesZV0R4
q8OOsFGs/vkYdpPo2TQ8jAXyZLVNy3Flfz4l9VkE7uwT8tlCcttIafITII7mcbhD
UGxVICO2OUSxTkJusx6FcXjd0jYoVto2iV1rOYBEv0oO87L6VtShG596Rg66WC09
YjUw+LVEGjiLARB5YvobQp8v9fqrMT/pqzXQUa+q3Hh0ZWpGfygQLL9byhA85m+x
B3vHen5SugJJff5fMtrDxIfTJ5G4i6bzHuD067cEl9aoYJZ1ZPQUMzPmAZr3sJYC
f/rDE9vhr6VGaKRESsDPfnswIgDpE6o54yIM8+0nAGryiDU6HHc=
=OFI8
-----END PGP SIGNATURE-----

--Sig_/5OA8GnnQmIdpCHIvi1e7iim--

