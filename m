Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB435159E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104545.200080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyG6-0004Is-P9; Thu, 01 Apr 2021 14:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104545.200080; Thu, 01 Apr 2021 14:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyG6-0004IT-M2; Thu, 01 Apr 2021 14:25:18 +0000
Received: by outflank-mailman (input) for mailman id 104545;
 Thu, 01 Apr 2021 14:25:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEwQ=I6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lRyG5-0004IO-2k
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:25:17 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a6c0d1-7127-439c-9264-39585dc02db7;
 Thu, 01 Apr 2021 14:25:15 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
 with ESMTPSA id 005bafx31EP99L9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Apr 2021 16:25:09 +0200 (CEST)
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
X-Inumbo-ID: 32a6c0d1-7127-439c-9264-39585dc02db7
ARC-Seal: i=1; a=rsa-sha256; t=1617287110; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=j4iAYUbgEisykYQRzKU0rugcUpNY7CL/gaqgVLpkf/lr8b/YHG4MoGK2zQzm2odIK/
    tU41KXALKj1wrbTmWP0vrAfGdMaqd/k++X9rw8NYSik8eiLtDN06nRhvMmvINCP5+SgM
    K4AqBlwfQOmgGjCQLWzjclkyEcXP7/L/bnoc34boIM4vhZZGnwmX1OMGspSWRvqKhFy7
    5lfTZEoNooxAsMj10en9SdfpcltIvSfHBPufE9Gb45jE8+QHYYx7RE3Qio3PTsPy/kgs
    tZMDIwB9+Sl8L/LfApEkmPI17K7405oAcwwV5wqcKuSUlZQJxdA9kOUYA6p1cNDrYaq1
    sglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617287110;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FM41hKIuLgnoLVd8uBVj7PEK15Ao/d5Jsy/Z+nsM4dU=;
    b=AwbgkmDOZE8QubP0r0NyehAL9JfvSvj95Yl6uybNBIaxSGPAX3DIKfz/vOzi8BnFkT
    s3fPO40PaEedLoerldGvruCkDXrhylA/ijRBHdSbb6DU78NRY4UjIaOmY8NwtHMcOEp0
    tWYUlA8+wZcdyx5UiHphp8XJl3ZJ5By7P5+EGr9FJUQez4qbLm3v0ObGD1Stg9Y/Lt13
    8g55h1JS7DBJj9teeEdc35YeVVug4GCSc9Jj5aciyM4/if9gq/ILXJedKX23Yidr+4eR
    Z7tt8AZtvR36hJ/gkFg9Ih/h8LrEndNeZagRk+3U/g5D0QFG5Ruy457EDYrr9lmE1etS
    9uwQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617287110;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FM41hKIuLgnoLVd8uBVj7PEK15Ao/d5Jsy/Z+nsM4dU=;
    b=MXVE+hGinVIwP1D8PSNVFCa9IOVjfgh8F7JhvBCPey7XbMJgAzzCOCd7yh+5tz8FG2
    +98mLaIC2XC9d3XHZAgQZPGblkdwhnrdfONTd9SncK4aGbeEc5bWuGFxFRiE2vUT4SaE
    6qXIcV5xB+RSO1y8bGWY8SBLWZ5fOBlsi/0wMpilIAXFKjKrUlbzW2IHlFv5wYdlE9Gj
    Tvvrj6IS3RahCR7v0ItY2uXPanYJL8IOgWGHMTbFRO7OaZzr4tGGDxiB+Y8tZ476KObN
    ISV+ggVJa42vpSc+NOjeE9KLBvBKcotOHTlupcKNjk1fse0FnmdkmvOz/GZK46MVMk1Z
    8Zrg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+P6/A=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Apr 2021 16:24:54 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
Message-ID: <20210401162454.78fb0290.olaf@aepfle.de>
In-Reply-To: <20210322141744.522041-1-anthony.perard@citrix.com>
References: <20210322141744.522041-1-anthony.perard@citrix.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4cFygLJ1LDJGH5ZoXulrxJK"; protocol="application/pgp-signature"

--Sig_/4cFygLJ1LDJGH5ZoXulrxJK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 22 Mar 2021 14:17:44 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> We use the deprecated QMP command "query-cpus"

There is also the already removed "cpu-add" command used, which apparently =
has to be replaced by "device_add".

Do you happen to have a fix for this as well?


Another thread suggests that more deprecated commands are used. I think the=
y have to be adjusted as well, ideally before they finally disappear from u=
pstream qemu.

Olaf

--Sig_/4cFygLJ1LDJGH5ZoXulrxJK
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmBl17cACgkQ86SN7mm1
DoBz+A//ZMJcUonxTlK57+9aisiRzk8Z7AQ7iM4r8iPX7athCtqpCplQNkhKvvx7
Ky3t3VR7+r4E+INxdtscZONRDS1RmhtJTy0Fa7VK8cpfeQo4YyHVBMk37gEN0CN/
1m6K21Pc+EBMopoyBo6EvHPPibYt7bRjnhTRg/g/4OM0mWyTQPuzzhYAgsUo5g+d
svnYW2hCNRXq0ZI0U5w+wM8oxO4ldRJQDM2DrPmeFeuBzid/QKXKd+M0PtTTEovr
OjWdFBNtD9uGR0SbKy1ow6pS27muzJd3Ilo+E4FVehUm/Q45Xoxch5z1JbsqloDC
IxQMrRYyOwNYyn2q22NrlEU7XsnU/SpJdsGuITiF0anShLLO8CpSmMvskwNlXQKA
k1xaxPGm3N0LnqCnnvvmC0Jvt9wcrOw1BwVJfU9l7aLlGdQft57a3MDEtizCNlFx
KUxyAURACD3oBhjiUwbNu7VQMj9BbUQSUI0zSV+0qPL32M5x5EDrWpDxr6/hz1o2
3mVf2rJuSQ5COKA3X/uEsaXDS0k4KB4fGDAHlMnSjLd+e0rcaJBbZ8ZjTzGP4TGr
Bzqnpm1RVti7Ce1+1pkSCR+rP0NJUKhtYtRKPCR8SjzEbe3T5sRnwe10cmxkR1bk
JX4ScbsAmsG4rr61YWqNJKYIEFmHyDgKM2vWUrVNI/zY0gLdHl8=
=QY7s
-----END PGP SIGNATURE-----

--Sig_/4cFygLJ1LDJGH5ZoXulrxJK--

