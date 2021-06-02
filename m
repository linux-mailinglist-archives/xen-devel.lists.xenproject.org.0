Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A03986C2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 12:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135936.252284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOLg-0007FS-2Y; Wed, 02 Jun 2021 10:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135936.252284; Wed, 02 Jun 2021 10:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOLf-0007Cy-Uy; Wed, 02 Jun 2021 10:43:43 +0000
Received: by outflank-mailman (input) for mailman id 135936;
 Wed, 02 Jun 2021 10:43:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOLd-0007Cq-P6
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 10:43:41 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67e4bd11-c797-46a1-8eb8-a937b89119cd;
 Wed, 02 Jun 2021 10:43:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52AhV4Ii
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 12:43:31 +0200 (CEST)
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
X-Inumbo-ID: 67e4bd11-c797-46a1-8eb8-a937b89119cd
ARC-Seal: i=1; a=rsa-sha256; t=1622630612; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Hn+VMaCzwXi+Dbsyabk6p4NRP1srElc30vcisnlESTcDuEE6Fj3oEIthlR9UjaApnD
    1NYvcUJzZktdt20hlBMsOFsu8sUdy5FKYSkvkz0inyLEW9nBdQIibvEf5bFurW+SI5tU
    XNf76Gl0bVSu7KsQf9Z+aMqZvL9hvI9jz+hnd9X+GryZHYXRnrqPfU0KMf46MRxCVOKr
    08XsUIcPLhnUQId9qWtTB0erY7+c6gl2XDdyZjavcH3HbEJ6ZjZvDBZM8dr1xw2TZf49
    bADcHTkV+MsjuMye0NsIbZxQlPC/MxHEcAb/7sHwITNf1go0KE+NGCnvbp+eitCgOyTQ
    0lDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622630612;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cp5ejae4nR+8FjxdlK6xVBZLvaHpWZO8UIYNCx9OGdk=;
    b=aPRsWfQL2FBKbwokeAVgJk+aOx8VIAZ117/gI/n/qz0YG4AMdpFGQKim6zMij5U9NX
    XBIXdtfhWwJJ6bA35utpBgCDyG84JzN3AQ1riZHaJgTKBl3gjR84nl5pSHpLNEfmZ4d0
    YPQkoJADzVetkPzKJgs+3LOPcGnEbEeaWNGN+N395JfIuGR3DD5ktTyxlcwriyQOO6WL
    re2yzJ/JmX44c0fsW312pja1Q0r9R7XCf1thI91xHIc+vaA/AFL6qqvt2myv98C2RPiR
    IsI/FfkwyY1ia7IPOL4MS5pb0bES0Q3Wqg6Idrwm9TBIj4ZsPGI9trb4dw4Lnh6sK02d
    st+w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622630612;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cp5ejae4nR+8FjxdlK6xVBZLvaHpWZO8UIYNCx9OGdk=;
    b=KMxjthg3Y4WcMjCPhf0x2GFuBZo9m9mM995GFvmXs3+bDtRL79yq5MjqOWjzDwFsbl
    tpZh8NQfLRFf0PaHgYBKGmkn3jqtKZSB30jkv6wyN5b908hyt2eX2B6rr7P+08Wtclj7
    vC0O/miRNSPaFmDZvHn2DZ6SR8f/CWdUrDQRGcYg/UeLWZ0qjVY4v8HLTm4uzRdefBUB
    /Pe0G3f7wVsk+Op4cHK83C1y0Jp6z0yMmpGnmIDmdoohMtupyh+qfrT9Ybc0+Aw4jVq/
    wNkdhOBgUegBTPnaLIIoF1SVshGfb4AwONlB76E7jw3Dm/cXkGhkAJeY9Ndk0EMn38EZ
    P0lg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 12:43:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210601 02/38] xl: fix description of migrate --debug
Message-ID: <20210602124324.1bd02cd7.olaf@aepfle.de>
In-Reply-To: <58453bfc-d932-3b46-7ec8-cd883b4c7440@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-3-olaf@aepfle.de>
	<58453bfc-d932-3b46-7ec8-cd883b4c7440@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xna6f/lcOQlsfx6uda2TY58";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xna6f/lcOQlsfx6uda2TY58
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:09:00 +0200
schrieb Juergen Gross <jgross@suse.com>:

> > -    if ( ctx->save.debug && ctx->stream_type !=3D XC_STREAM_PLAIN )
> > +    if ( ctx->save.debug ) =20
> This is no documentation change IMO. You should either mention this
> modification in the commit message, or put it into a separate patch.

I think the conclusion was that this branch is dead code because
only the stream_type=3D=3DXC_STREAM_PLAIN code branch sets debug.


So far there is a decision to be made about this code branch:
- document it
- remove it
- fix it

The latter might be impossible due to lack of APIs to query the usage of a =
given page.

But, perhaps remus and/or colo does not suffer from apparent corruption.
One day I should create a remus and a colo setup to exercise these code pat=
hs.=20


Olaf

--Sig_/Xna6f/lcOQlsfx6uda2TY58
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3YMwACgkQ86SN7mm1
DoCQBg/+MAMxtAjytiGCOC+8y7leqe0HZ/OWy9mJg59TJ6S4V7odZN2HH/9trjef
4JDLvXS0IZLvOL4oU8uPrk3ex1qz6r/KSAT/pGyQysDbcnXpFfWB5eAmNPSbnN4t
rfA0NG/d7A6xQco5/wKiv9u46njI9eputceqxenNKTl27+BBzyThLYags44TVEej
54G9eq+2A1dkSgqWodp5Pdiamz0XvVKTzgSMVHDtU25eykSkD6HGmD8Hz1zD9jhU
ua1BKm0HUsTEfYQh5mTsEqWnKgT7qkQdpOoTuXsbosQPI3jMGvjW4oSY+XnJJTK2
4bGabwTSkyZ6O7jHi8S1bBFnDvSh6oIYaUhay6JQrHW8qdM0sL7UoDTWi0FMeVcd
yfbZzTJByOa8zzyCNdJbVCrq1j88TFNMu4V/53MFLjWSNqV+mp+icReU5lhLIpiy
dVPCn2x7Q01TkjoNMhunUsT8QJmympsKtptkhooRLNG7USdoEKiVsyy6zMIXCwv6
ao0bR4NKTm596CbS6c4ZomHrrArN5uS+xmyKiwtVbkrbBYQ7diFB/fhitCcC8OKE
e2MmGcDg4nyJ/AganFB2jRd+f5U4nFhM2On3w0e9mZg8MnL4W3eoKucbOvu9DO9g
n2EVPimc4yxCxPlO0Mpat6/sk8Emq9O1nbRW962LnHnbe8J3X40=
=v4eQ
-----END PGP SIGNATURE-----

--Sig_/Xna6f/lcOQlsfx6uda2TY58--

