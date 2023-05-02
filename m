Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17F6F459C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528677.822138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqTv-0006vA-Ag; Tue, 02 May 2023 13:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528677.822138; Tue, 02 May 2023 13:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqTv-0006tU-6N; Tue, 02 May 2023 13:55:51 +0000
Received: by outflank-mailman (input) for mailman id 528677;
 Tue, 02 May 2023 13:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptqTt-0006tO-BS
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:55:49 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084e93ce-e8f1-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:55:44 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42DthdKB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 15:55:43 +0200 (CEST)
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
X-Inumbo-ID: 084e93ce-e8f1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683035743; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XeW4ofbK+AA3guzhnDqpR8OkHutJp/iL36w6+/V1wRW6DBB79cQJZOoqxxJoscU9am
    NgPJQVZMsOd+TozEpbMso2Npo/1l25EE5l/UkEh0j3yMQm3zCEY+QXcH87gz5uoLbA6P
    BWcpM8hNWVA7uNhh6UstMlgpLozcvs7zFjhnbFKIfEvR1H18788PUKAbzLQ+GI27RkAo
    GiltCUI3BxBAZOfXnhax80fjL235hqXqIXrjAFZ9gsirOb95cOr0CF0eSB0HeG6IDMr2
    X6zI+OplFpwzRb8Knht+4D4TUxiVQz2teSVxT2EfDOBgayMRA3+cCfUGDwevDYIW8KGf
    7dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683035743;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ppQjs137PIEaIYcsU7xdieFlAfxpPdqVwfIympx+wZU=;
    b=T2GR49QIZYjFVjUlSOs3RRCQHfyF3/FqUOFambY//D2OPdoM56N+RAJ4rKRbJ+fHHB
    11QX7ssQ/RuWvDjykyyLg7RT1yzL91QOGsADu+bg2IGUHdsfELlodWvlxd+vOwNYzV4z
    dCz4iWeHuZUl4Epl9ZOvjEEYYv4bhUV3rS5Wjpu2BMVIvndE87iR+LvgE+1kWTvwAgVJ
    7lvbpECRAtW/PbIBd9WxVfAZFGuFNpEkYG8tol632VeENdyAyf2mXBRdnt4A7e31+nfI
    F8q94lpoGceVY0L186fY9tPgqiXb+zUn5WRANJYseuTQpfnMmXwU4sZvWmY2yvwoGI0x
    GAmg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683035743;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ppQjs137PIEaIYcsU7xdieFlAfxpPdqVwfIympx+wZU=;
    b=d2BReKChG41bRnZ9NbI5CKFIqd4LdKboFlmxKz17MU8Ez6ssOyx9RUL1GyrNZaAk39
    kEUOUAFz4EPW4aqKHpdVUD1gqgjnHgQzDsOZcYJKn75O4gsJDgAq+9J+CETMe6MawciB
    mFhZGxY4P0243jfxIxIt4P2JgxTFgMxeEWR7iFDJC5zDHSEChHxhLXMUiEej1dDJbAZj
    6ND/GvAptsZJQMT/6oEHbQpEB2hcgQVYXgCZdFDNUX9ag3mwkutFaeKxlOx6sUP8Jo/6
    4RfhAPEnwaB94INY98DwW7LN3xe6d3xK4A3yLzL4kdVAhjVistpAYy6CWoKEx7sR2y0P
    MJAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683035743;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ppQjs137PIEaIYcsU7xdieFlAfxpPdqVwfIympx+wZU=;
    b=iIFIO0oVE5btZ3rW4u9IZ3fr/IB7z7R36u8ZnyC7qbpGhXswZWGDtWYvnq9gJs6iW9
    8ETtO42BMUUahh6dg1DQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 15:55:37 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HAS_CC_CET_IBT misdetected
Message-ID: <20230502155537.7983f8c9.olaf@aepfle.de>
In-Reply-To: <ea9ec814-83b8-5545-2ce3-46192525cf17@suse.com>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
	<43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
	<20230502133313.2192eb99.olaf@aepfle.de>
	<20230502140444.1dacdb33.olaf@aepfle.de>
	<9353d3f3-563b-ff88-0b0b-dfa2bb03522c@suse.com>
	<20230502153612.431dfc08.olaf@aepfle.de>
	<ea9ec814-83b8-5545-2ce3-46192525cf17@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/txqaj7Ga2TsSeTMnuGl7Usi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/txqaj7Ga2TsSeTMnuGl7Usi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 2 May 2023 15:44:41 +0200 Jan Beulich <jbeulich@suse.com>:

> How would an out-of-tree build help (which for the hypervisor we now
> have support for)? An incremental build there will hit exactly the same
> issue afaict.

Each container target will use a separate output directory. The Leap contai=
ner will only see Leap things, the Tumbleweed container will only see Tumbl=
eweed things.

A toolchain update within a container will be no different than it is today=
. But there will be no unexpected jumps anymore.


Olaf

--Sig_/txqaj7Ga2TsSeTMnuGl7Usi
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRRFlkACgkQ86SN7mm1
DoDc6xAAmT2Bn9OAawtgCy/HNNIyKO1JcjrwHb0s32tyJtABnfXpFYLlqO2zgbcN
j3CfVD9YXzH1V9UE7pPhPFDJcih1elvyzu3iLUy64ZQ+xOcJW2H0sKGhYj9U7uR0
CEcK+2iZASYcW+rIg3AAHXQixDaZjP3P9fYQbvgYb/919TB4AW+Pk/OA9GCOBz5M
OXnMSHsgPlyfm9SpAkI4u5FPN4L28MlHV5K9AWTv0hB7FlYaYlfZcFXipYZAEtp4
ES9UxowQcjLpKb5P5ms2RfHCd6MDiQumRkiM7WCASGGnQbW1fY4UpNo7fZqO4hL0
+uEGVlOxQxl3aL1ZUlAHbfFUoBx1H4ZVA1C20uSnrhSqHKdI+p/Y75KQCsCoxMVT
/Zh9cvBegpDECHJc0XlOEC2nJsZ5SY/S9zNxtjB9mMLYQKnweHC35yv2uebbWSTQ
F1IPG3esTZukhv0I+eVfMKdGjwiWsq4PvYT47Q0l9ranP8nxKqSsuyI+ftyi6dZb
ogG0WVk2Iv+4/DXQY7DeaU+Ff3qh7TgAB5CHvU4nkEjh6mcVtYVyv0zWOIZMjQZM
zPqFPyBhs8Utfyd14dOpQ9Q7EQsodfjTcaGLC4iXJBJ9QeT1oS2fQ28AIb1B40ku
1j2i9fnpbN7ncSEGoWWZe2xI2wMWqFzbY1fqJx87qT0AWD2YHt8=
=LOIW
-----END PGP SIGNATURE-----

--Sig_/txqaj7Ga2TsSeTMnuGl7Usi--

