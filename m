Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90C37F404
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 10:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126765.238201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6hz-0000gI-R0; Thu, 13 May 2021 08:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126765.238201; Thu, 13 May 2021 08:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6hz-0000eB-Nq; Thu, 13 May 2021 08:28:39 +0000
Received: by outflank-mailman (input) for mailman id 126765;
 Thu, 13 May 2021 08:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lh6hy-0000dz-7G
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 08:28:38 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fe4971d-7143-4139-bd2c-a3f70568cea7;
 Thu, 13 May 2021 08:28:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4D8SY3gF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 10:28:34 +0200 (CEST)
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
X-Inumbo-ID: 6fe4971d-7143-4139-bd2c-a3f70568cea7
ARC-Seal: i=1; a=rsa-sha256; t=1620894514; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gr3TYjjsSq6/cW5QestgIVt9YDooC1dvJxDM0iBp/XS8bvcoDFgcOJUqmjEHOBJvVu
    Utk8Y2EK1CLP3XAFFQBTXWnkMPnN/AwvXbxlNpNFr8w0KBPXEqnlMIiQfw/LsrDvrkss
    Z5AX26VYZo52agAgm/BQdwjl87FU0r+EYUtrdjyZKphcNJ6ouoMVkAnBd/c/ZhyhCKGZ
    U774eLTlQErn3S0oCko5nBa6D8k3M+FG2BvnzLJoYOZc+Q9v695vFIBhABn/tI8gRUZv
    mRXyBUXV+SfT9LPy1yt4cGssGpuClSdkGMVS8reZlFL9CB5IFfWXeGxH6iiRsSv8uIh0
    yy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620894514;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Rf+0QxJR3FddhhWri78kmDStz4nY5a6KJIiaNH0d6TM=;
    b=hfPBcNZZfjsbE+dn1BfMa7AtPBAnFatRYB274wUIdVyyDdUR7uZkoE5oiWe9xIemtD
    Y/8i36Um3QiM04io9aU+YptTW/hJNYuOKQwC5s68POh9nnYUGWeN8W4/cnSqStaemp5I
    jVYmq2bEy6v56bheIcmgloWD/eT+vf82cjIPSudqZMS6yxG+5VYrL9yqeW62hpDkMrlG
    d7bqOZdJxFeRR3VsxQjb7nl+r9CeAJh1p0oalLlWQSisnzIpfkrBi+tjP7w5ihxdT+3V
    rabbMM29WzPaT6BrUcKrX2fEDbW2TojWbgyhGxdpGFIS2/O+Xr3QThRyOnBaRjbqR7DZ
    yWnA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620894514;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Rf+0QxJR3FddhhWri78kmDStz4nY5a6KJIiaNH0d6TM=;
    b=YDkWSQKOLrsbAxAth8zwKLW/sAvvYVFRfuXbHBpZ8N/sphTiRxDxBm6GVj9E+HupQX
    10jqDxJTvBfyJLmLdpq6EZgmFWoVoEmNgNEQtXf6zlIoWoo9u+bj89sUtR71fcuR1niq
    UyArTpkogglmE0Z9f18xaQdDkJpY2GACtpPnDkFQ1aSh46QK+HAZZBqqW+iFS8fWUWto
    2IfPc1VGxtJEZiBaAaJouAFC93FhF94OaZ0Q2+y2C1v9HUy/u1HWB/p4bJTKcmAncAt0
    DNICvkz6WfEfaSvXYQRJSyNtQv52byM1gGBhw4o+P3QZPnGFyWNW+/H7QgaW9I+rbKVi
    bxBg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 10:28:27 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>, Oleksandr Andrushchenko
 <Oleksandr_Andrushchenko@epam.com>
Subject: Re: Hand over of the Xen shared info page
Message-ID: <20210513102827.2204d5d8.olaf@aepfle.de>
In-Reply-To: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XICQkDJW9le_hmiaMj+R0yS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XICQkDJW9le_hmiaMj+R0yS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 08:03:48 +0000
schrieb Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>:

> shared info page needs to be handed over from one entity in the system to=
 another

The same issue exists with kexec. Not sure why it was not addressed as you =
proposed, "soft_reset" was implemented instead.

Good luck.


Olaf

--Sig_/XICQkDJW9le_hmiaMj+R0yS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCc4ysACgkQ86SN7mm1
DoARXQ/+KTSFDC2lbtxTzMzNJECgftXg1LCtq8TuXUlP3PSGvykK2pBcEBKvhRuo
Ut/ywXgGvhjBPJZVsVfJq+TgPCvn7cxApIDCWqStqlUvfulooBrhIOYbtLaUfv0H
UNU3ukk1nP8naUX3skCftX4bCeyAk0IXmhV3+xOw1x9VZOENh8p+Qvzd0vPKiYy6
NWqL/elTdAxwP617AZMoxarf9fP4QFYzzr6aErv+5QVNGFoFXh7ywBfqhw7Cbv6p
c1OkkRLUdPXsBxYEzbXkg0t2iTddlQB0fykykEWO8MHEklLGQ8Stl1YRjIy2fFUr
jjpNH1BF8jNoRJGzDlegSRx5mUapGE/CUp8gOeQUCmibWFsiWdHRNMHgVhWzIoVo
oF6N6YiU/yJ2R8tz5G/g4B1CURWQnkngkB/Opjpvtywl2JLMFpxtv5zM1zW5sekv
m+LR6ypWyumIM5EW4dyNYaei/o8tFEQu8tRJh0FPt9bbERZ5+dVjHI1hLwUYqh9g
XxnQ2JpzftU0l/3SQXQpwW3P6EsYsXXEN8Q8yRd5wS58eVXPG4gmcmd2sE+4apZ/
rnNCSWCmm+QAgdcT/jkBRLy/wJee3eaj+j5sgWoOvlkJjur3s0Lw8g6ts2lo4eA6
yiil/h3j/GnkANDCCF3bjSa0Fhypx/DQlog4pExwc8KYC5aqyYQ=
=8p4u
-----END PGP SIGNATURE-----

--Sig_/XICQkDJW9le_hmiaMj+R0yS--

