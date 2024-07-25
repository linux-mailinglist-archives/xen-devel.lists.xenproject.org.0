Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E278D93BCCC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 09:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764722.1175223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsTn-0006v7-9U; Thu, 25 Jul 2024 07:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764722.1175223; Thu, 25 Jul 2024 07:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsTn-0006tL-6i; Thu, 25 Jul 2024 07:01:35 +0000
Received: by outflank-mailman (input) for mailman id 764722;
 Thu, 25 Jul 2024 07:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ik63=OZ=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sWsTl-0006tD-HN
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 07:01:33 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8fcb8a1-4a53-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 09:01:32 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 51.1.0 AUTH)
 with ESMTPSA id Da26f206P71V8dA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 25 Jul 2024 09:01:31 +0200 (CEST)
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
X-Inumbo-ID: b8fcb8a1-4a53-11ef-bbff-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721890891; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HrqWdAKrjJeJjTdQcAYaFJHidHgjxTsNdj6MRgM4eey7n/AYy4sBlkhxuKAMF4+Joz
    9Z5xyKSF5Cv4CCuVupkxVkC84DygDiLij1AGZJW2/i59SzcXjy1s9tax5MsbuOl25/2J
    XhwzkRc46OC5UdiI3h9AFlN8DHk9rpzXyFHUwSgWzbSrkgzViIznLBQATxJuWWdemoL+
    YejqpCFkUOAmW48Un/zreNdxp74UyCC7l5psfuDb/hNV7Kb0qLEss1gOjlzrYyAbbBK7
    zfuMyLYZIeDrcq0EAckayOCgXPTLOcAX/57u3hXrjywdhuBfVqleVxF+/NElp/tnPZX0
    1nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721890891;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=lcMkuGHGXoTQ7r035i/bbCgRrhgabq8SC9/hfmOJc2c=;
    b=BTIFxlDof58nbqZBI8tNbqJFg8R9ZhLM3Auu7CV3HCHyOWE5i63Bdqo4kb+/ROe1h4
    wenEYIztXkXKfEkay8zhVeJ4rc0/2W4Y/+hcBlrY3bKq/QDb3kKOuhL5FVVfLkCfhneu
    SmPvEcorDDN0BLPX8yAXolWIGD75dkrz4sn5BLOqBWAoMMrStKuj9d2AF4LVPH+fIfw6
    OEwLRIGgJ05g0KW7FsBvfV3hEYyIEq4+ZmlrC2kkOS+bfsGj0P0eRbh9e8N2ndvmugJF
    sx6PJ/H3rv9fqI3gu6xPiegg2b4EXf6UKDd08mXm+tAif69Yi5zb3SXztLOQw0Jy/UQ4
    Z/Vw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721890891;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=lcMkuGHGXoTQ7r035i/bbCgRrhgabq8SC9/hfmOJc2c=;
    b=VxkTbNGhX67uTvZAWqG1ftPzgdLjoa+C+CWKfVx8uKxwn6+NzflAdeX1/oY6ySRA+d
    2LSAegT5hpN7rvfEkOr1LYqwcRHLFJy4QJo3GkGldLTTVn6uJpMgLXtF16aX7NJpwkZb
    r3gm6LbthMn2h3FYf0dNHhxjzA2mr3VI9ZH9mcWX2q+8YjfnLUJ63ulDtHTzZXdchY0Q
    oJle1yE0HJ/4REnGCXuztcg2H0hXh5S0DVDJgb1hCWFhjSVNcyuVApDAmadddOV6RVG/
    v/Y0y7GmWWNXWc2EIoPzIKTcsdq1luTYhNaCYotn+VSdVoAjLpj2o77561txyhKyOoRn
    isUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721890891;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=lcMkuGHGXoTQ7r035i/bbCgRrhgabq8SC9/hfmOJc2c=;
    b=yIkV8AQV61O6cSGmX/chJEtWOGnXoag3ukFWjNIbTWgZfgB8F1jVszH9EtFS4+OYnR
    qKn9m5iI31VyQO9HJ/Dg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5U0KIYkrsgXpphFp5TpggLXYhJp+e75du9haPEQ=="
Date: Thu, 25 Jul 2024 09:01:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: remove usage of hostname
Message-ID: <20240725090124.33d571b9.olaf@aepfle.de>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mi7WFVmz=_7ead0OfsLsRso";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/mi7WFVmz=_7ead0OfsLsRso
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Some parts of the build, like "make -C xen defconfig" use the "hostname"
binary, which may not be installed by default. At least the openSUSE
containers lack it. The configure scripts already have code like
"hostname | uname -n" to handle this. I think 'uname -n' gives the same
result as 'hostname'.

Is there any benefit in using 'hostname'?


Olaf

--Sig_/mi7WFVmz=_7ead0OfsLsRso
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmah+EQACgkQ86SN7mm1
DoAUxg//aUjOd01ThPlLZqwhd32xW8dvl0E+f2D5FoqfBMwcKtxqZvNoHKXDTr+R
pPMTeeFvB22Xu6CYMD3smp4ijMiZiXeKsfI4kIbmJISulHcR5SrAVVgQKJyexXht
YbcxgiekwQqYKD22PriJFPpbLHLCFqXyOkWsvo+/mnqyeSqzs90dNEiMLSEP/eXG
Z6RhvDJdx5Vpem+MHlfqRDvNBs+c/xbgu1ukRAHCxdbTk0KT96le7NEbOyafwlAZ
o7uwrHD/M8D423QGKfK4l5DIHhr+k3y0MvvC8eo62jrJvy/I/VSMsAK7jgcHxf7y
rSi31pvSS2Is2i7j8VHfHlO0Bxv7cGSc5ZRzog49jvE1C5T0ZrP6qf1Da5aWOVlw
tGUoQ5VRI9f03O+6mO5I8w9P+H+liEJUPIbx63/tK8qj4+E4HHhmY0zE19IAN4rW
51vJ7eZK0PaI+uz7BtOx42qAtDx54tKD8qtzctWNXd4qI5nogay43fi/5qGK6dFz
VupvjlSshpqejd8mrkPszGq2SNyqSH0kCFA0zu0OXCFmdO1isvhfyi01gkNooAmH
XjI3up8pL/lcfXFgRCFmzpl6m/4s55obknZmAteZ/P5yBgzJQ5UVaB5zheDU7KNc
a++p8OPpyJ9rL7m4vnL4FXprVNKWhySa0bwEYZPlIELc39w81zg=
=nUFm
-----END PGP SIGNATURE-----

--Sig_/mi7WFVmz=_7ead0OfsLsRso--

