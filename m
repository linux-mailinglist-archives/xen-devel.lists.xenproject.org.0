Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDA0151571
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 06:28:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyqhS-0005KF-Rw; Tue, 04 Feb 2020 05:24:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pcy4=3X=ispire.me=jules@srs-us1.protection.inumbo.net>)
 id 1iyfco-0007N3-W3
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:35:07 +0000
X-Inumbo-ID: 828ac2b6-46ab-11ea-8396-bc764e2007e4
Received: from mail.bcnx.de (unknown [103.214.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 828ac2b6-46ab-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bcnx.de (Postfix) with ESMTP id ADCF3208EF
 for <xen-devel@lists.xenproject.org>; Mon,  3 Feb 2020 18:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ispire.me; h=
 x-mailer:to:date:date:message-id:subject:subject:mime-version
 :content-type:content-type:from:from; s=dkim; t=1580751300; x=
 1583343301; bh=86QE6k+alkNWgSUM+R8q4EUw8A+hE8lQqlSxCN5PaZE=; b=e
 9qvV/OrvLaT9543d/ZeEnbEHmiL1hdZYGyLbxtSlTWOEe8AtFRGimQKb5Fh7BILn
 UfkA4rVju/PUwH/w1WQsPhllYc3kTjn0uYCGFLkcQwTWYKu+21nBFMshe1V23stB
 hH2Ra0oQ/Is3N7O8TJBkL4UXFmfWrhckIL+nzWgCvw=
X-Virus-Scanned: by amavisd at mail.bcnx.de
Received: from mail.bcnx.de ([127.0.0.1])
 by localhost (mail.bcnx.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hlTLU3KDDPDu for <xen-devel@lists.xenproject.org>;
 Mon,  3 Feb 2020 18:35:00 +0100 (CET)
Received: from juless-mbp-2.fritz.box (ipbcc3c4ce.dynamic.kabel-deutschland.de
 [188.195.196.206])
 by mail.bcnx.de (Postfix) with ESMTPSA id 81C59204EA;
 Mon,  3 Feb 2020 18:34:58 +0100 (CET)
From: Jules <jules@ispire.me>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Message-Id: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
Date: Mon, 3 Feb 2020 18:34:57 +0100
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Tue, 04 Feb 2020 05:24:37 +0000
Subject: [Xen-devel] XEN Qdisk Ceph rbd support broken?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: oleksandr_grytsov@epam.com, wl@xen.org
Content-Type: multipart/mixed; boundary="===============0724443117166433028=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0724443117166433028==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D1CB3786-F86D-4E7A-8766-11C02A00CB90"


--Apple-Mail=_D1CB3786-F86D-4E7A-8766-11C02A00CB90
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hey,

I don=E2=80=99t know if it was this or a previous change in qdisk =
driver, but can it be that remote Ceph RBD support is broken?
=
https://github.com/xen-project/xen/commit/8f486344a00652ed202ade43c02c9677=
1812bf8c =
<https://github.com/xen-project/xen/commit/8f486344a00652ed202ade43c02c967=
71812bf8c>

Remote network Ceph image works fine with Xen 4.12.x with a config =
syntax like this:
disk =3D [ 'format=3Draw, vdev=3Dxvda1, access=3Drw,backendtype=3Dqdisk, =
target=3Drbd:<pool-Name>/<Image-Name>:id=3D<cephx-Id>=E2=80=98 ]

In Xen 4.13.0 which I have tested recently it blames with the error =
message =E2=80=9Eno such file or directory=E2=80=9C as it would try =
accessing the image over filesystem instead of remote network image.

Please help confirm.


Kind Regards
Jules=

--Apple-Mail=_D1CB3786-F86D-4E7A-8766-11C02A00CB90
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hey,<div class=3D""><br class=3D""></div><div class=3D"">I =
don=E2=80=99t know if it was this or a previous change in qdisk driver, =
but can it be that remote Ceph RBD support is broken?</div><div =
class=3D""><a =
href=3D"https://github.com/xen-project/xen/commit/8f486344a00652ed202ade43=
c02c96771812bf8c" =
class=3D"">https://github.com/xen-project/xen/commit/8f486344a00652ed202ad=
e43c02c96771812bf8c</a></div><div class=3D""><br class=3D""></div><div =
class=3D"">Remote network Ceph image works fine with Xen 4.12.x with a =
config syntax like this:</div><div class=3D"">disk =3D [ 'format=3Draw, =
vdev=3Dxvda1, access=3Drw,backendtype=3Dqdisk, =
target=3Drbd:&lt;pool-Name&gt;/&lt;Image-Name&gt;:id=3D&lt;cephx-Id&gt;=E2=
=80=98 ]</div><div class=3D""><br class=3D""></div><div class=3D"">In =
Xen 4.13.0 which I have tested recently it blames with the error message =
=E2=80=9Eno such file or directory=E2=80=9C as it would try accessing =
the image over filesystem instead of remote network image.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Please help =
confirm.</div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">Kind Regards</div><div =
class=3D"">Jules</div></body></html>=

--Apple-Mail=_D1CB3786-F86D-4E7A-8766-11C02A00CB90--


--===============0724443117166433028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0724443117166433028==--

