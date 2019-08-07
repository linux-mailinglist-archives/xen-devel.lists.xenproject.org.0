Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9A84BDE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLFh-0008BL-0n; Wed, 07 Aug 2019 12:41:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvLFf-0008BG-2I
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:41:11 +0000
X-Inumbo-ID: a1005417-b910-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [62.239.224.234])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1005417-b910-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:41:09 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 13:40:45 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:41:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:41:06 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVTPljpfwTk/sMkk++4xOSHxskc6bvbaGAgAAxHHw=
Date: Wed, 7 Aug 2019 12:41:06 +0000
Message-ID: <1565181666201.26324@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
In-Reply-To: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, pbonzini@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, mreitz@redhat.com, pburton@wavecomp.com,
 marex@denx.de, robh@kernel.org, hare@suse.com, gxt@mprc.pku.edu.cn,
 berto@igalia.com, proljc@gmail.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de, david@redhat.com,
 magnus.damm@gmail.com, yuval.shaia@oracle.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, hpoussin@reactos.org, joel@jms.id.au,
 marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============6182766161198144762=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6182766161198144762==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156518166620126324btcom_"

--_000_156518166620126324btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 8/7/19 8:37 PM, Philippe Mathieu-Daud=E9 wrote:

> I'm confused I think I already reviewed various patches of your previous
?> series but don't see my Reviewed-by tags.?


Apologies Philippe! I am the confused one here =3D/


Will append.


Thank you very much for the reviews and qemu-devel newbie tips so far. I ha=
ve felt very welcome.


Tony

--_000_156518166620126324btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">On 8/7/19
<span style=3D"font-family: Calibri, sans-serif; font-size: 14.666666984558=
105px; background-color: rgb(255, 255, 255);">
8:37 PM</span>, <span style=3D"font-family: Calibri, sans-serif; font-size:=
 14.666666984558105px; background-color: rgb(255, 255, 255);">
Philippe Mathieu-Daud=E9</span> wrote:</span></p>
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">&gt;&nbsp;I'm confused I thin=
k I already reviewed various patches of your
 previous</span><br style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 3=
3, 33); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.3=
33333015441895px;">
<span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441895=
px; background-color: rgb(255, 255, 255);">&#8203;&gt;&nbsp;series but don'=
t see my Reviewed-by tags.</span>&#8203;<br>
</p>
<p><br>
</p>
<p>Apologies Philippe!&nbsp;I am the confused one here =3D/</p>
<p><br>
</p>
<p>Will append.<br>
</p>
<p><br>
</p>
<p>Thank you very much for&nbsp;the reviews and qemu-devel newbie&nbsp;tips=
 so far. I have&nbsp;felt very welcome.<br>
</p>
<p><br>
</p>
<p>Tony<br>
</p>
<div style=3D"color: rgb(33, 33, 33);"></div>
</body>
</html>

--_000_156518166620126324btcom_--


--===============6182766161198144762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6182766161198144762==--

