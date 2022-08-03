Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56385885E1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 04:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379505.612992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4Jq-0000vA-Hh; Wed, 03 Aug 2022 02:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379505.612992; Wed, 03 Aug 2022 02:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4Jq-0000sO-EW; Wed, 03 Aug 2022 02:41:10 +0000
Received: by outflank-mailman (input) for mailman id 379505;
 Wed, 03 Aug 2022 02:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhsF=YH=samsung.com=boyoun.park@srs-se1.protection.inumbo.net>)
 id 1oJ4Jo-0000sB-4C
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 02:41:08 +0000
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b60dbab2-12d5-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 04:41:04 +0200 (CEST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220803024100epoutp0365f3f40a2adf17f0bee0caf06ae9f059~HtWtK_3sH1449614496epoutp03N
 for <xen-devel@lists.xenproject.org>; Wed,  3 Aug 2022 02:41:00 +0000 (GMT)
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220803024059epcas2p23b711231673480d9d164f17c98094ba1~HtWslRurq2641226412epcas2p2l;
 Wed,  3 Aug 2022 02:40:59 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4LyGLy47Brz4x9Pw; Wed,  3 Aug
 2022 02:40:58 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.3F.09662.A30E9E26; Wed,  3 Aug 2022 11:40:58 +0900 (KST)
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
X-Inumbo-ID: b60dbab2-12d5-11ed-924f-1f966e50362f
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220803024100epoutp0365f3f40a2adf17f0bee0caf06ae9f059~HtWtK_3sH1449614496epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1659494460;
	bh=vCZJVKX58LWE4JO96MPUCDYJhKq/SaJiyKAKpj+bR7Q=;
	h=Date:Subject:Reply-To:From:To:CC:In-Reply-To:References:From;
	b=vfTcKvd4E0uxYMKzurZna1wGatEz/4hSfd2MiJg53QsDefBqdAz9mNcBra69RCwGw
	 La1/Ijm+TkNOLRB3gwVKpt4nq65HU8x0D/GWht/r8URqFb35h4Bz+tDaOa1TwcFDMF
	 7RaeAxSIL+zHvj8FAUXJLYyIBrhek5KI/vxEHeDg=
X-AuditID: b6c32a48-9f7ff700000025be-e7-62e9e03a92e9
Date: Wed, 03 Aug 2022 11:40:57 +0900
Message-ID: <1470588578.9967963.1659494457934@mail-kr2-1>
Mime-Version: 1.0
Subject: [PATCH v2 1/2] xen: add late init call in start_xen
Reply-To: boyoun.park@samsung.com
Sender: Boyoun Park <boyoun.park@samsung.com>
From: Boyoun Park <boyoun.park@samsung.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
	Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "wl@xen.org"
	<wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, Chungwoo Park
	<cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>, Lei Wang
	<lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>, DongJin PARK
	<djpax.park@samsung.com>, Joonjae Lee <joonjae7.lee@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
X-CMS-MailID: 20220803024057epcms2p8023b3e48176f0dcbb3f2ecdb08c0c92c
Content-Type: multipart/mixed;
	boundary="----=_Part_9967962_701826072.1659494457934"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDJsWRmVeSWpSXmKPExsWy7bCmua7Vg5dJBisWyFgsfryL3WLpks1M
	FqdmdTJZLDt8j93iwse9LBbzOw4xWfzc85DNorPrC6vF59mT2SzadlxmtZhxfjGrRePCeIvV
	6+It/i2NsPi4Rtzi+5bJTA4CHmvmrWH0eD15AqPHnaU7GT02repk8zj84QqLR9+WVYwe67dc
	ZfE4fWsWWwBHVLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+A
	rltmDtD9SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIr
	QwMDI1OgwoTsjJ8rVzEXrKur2LzrAlMD456qLkYODgkBE4npB2W6GLk4hAR2MEqsnPmRsYuR
	k4NFQFVi0p8b7CA2r4ClxK7GZkaQel4BQYm/O4RBwsICNhKXV+wDKxESUJRoPbOQHSKuK9HT
	tZcNxGYT0JZ4cfMWC4gtIqAvsel2I1gNs8AyVomVL3lBbAkBXokZ7U9ZIGxpie3Lt4KdwCkQ
	IPHs+yRGiLiGxI9lvcwQtqjEzdVv2WHs98fmQ9WISLTeOwtVIyjx4OduqLiUROOnQ1D1xRJz
	+tazg/wrIdDAKHHz4kUmiIS+xJSWOawQtovEvinLGCEODZO4fvM+OySslCWOQPzCLMAn0XH4
	LzvM/TvmPYEaoyrxq+kFI8wve862Q9keEodfPGGBhHMjs8SeP4vZJjAqzEIE6Swk2yBsbYll
	C18zg5QwC2hKrN+lDxFWk5jS/4UNwo6VaO04BVWuKDGl+yH7Akb2VYxiqQXFuempxUYFJvDE
	kJyfu4kRnPS1PHYwzn77Qe8QIxMH4yFGFaDeRxtWX2CUYsnLz0tVEuG94/I8SYg3JbGyKrUo
	P76oNCe1+BCjKTBNTGSWEk3OB+ajvJJ4QxNLAxMzM0NzI1MDcyVxXq+UDYlCAumJJanZqakF
	qUUwfUwcnFINTMfXiNh1zWBSfb/EXNHGStR//S2n+hKnntrSxoh3r94IzvbUSoz0VdjNl71V
	U81wilDfRbmbH3ofvfQ7Mr+Vq/NAZLPptu4FeydfvKt3YtL52HsqX0secZzaP9mJ7foU3SKf
	JVUtVSdvG5y4n9z+z+7x65O9XixH4hUd/58ICXY806GUdv4fczPr92MnlonOnm8cz7zNYcmM
	YI935gYtXn/PRinLZbz5xqy7tuzitECh+jxtD1fbqr+v1F53es3Z4x608lFi1nsRnw8tD1Y/
	jwrpd2lbtn+z1d3ZMabf7xWu0vhgO7/8l1Zzn0PXfLnfDWELQ+S2H922rHSVxmFjWR435eRr
	y2/kHe9/suZBlhJLcUaioRZzUXEiAICJgOOPBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220728092237epcms2p53821bba31388763f45b5204d56520c20
References: <alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
	<alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
	<97499212.9948800.1659000157467@mail-kr2-3>
	<88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
	<20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
	<CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p8>

------=_Part_9967962_701826072.1659494457934
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Thank you for your reply. I will seriously consider contributing
platform specific drivers. Currently, I make a sample usage by applying thi=
s
to a function in start_xen. I think functions in start_xen could be reduced
for readability and understandability.
These patches are just one of my suggestion. So feel free to reject it.

On Sat, 30 Jul 2022, Stefano=C2=A0Stabellini=20wrote:=0D=0A>=20On=C2=A0Fri,=
=C2=A029=C2=A0Jul=C2=A02022,=C2=A0Boyoun=C2=A0Park=C2=A0wrote:=0D=0A>>=C2=
=A0I=C2=A0really=C2=A0appreciate=C2=A0all=C2=A0the=C2=A0comments=C2=A0and=
=C2=A0reviews.=0D=0A>>=C2=A0I=C2=A0understand=C2=A0that=C2=A0it=C2=A0is=C2=
=A0hard=C2=A0to=C2=A0add=C2=A0this=C2=A0patch=C2=A0without=C2=A0any=C2=A0us=
age.=0D=0A>>=C2=A0=0D=0A>>=C2=A0On=C2=A0Fri,=C2=A029=C2=A0Jul=C2=A02022,=C2=
=A0Stefano=C2=A0Stabellini:=0D=0A>>>=C2=A0On=C2=A0Thu,=C2=A028=C2=A0Jul=C2=
=A02022,=C2=A0Jan=C2=A0Beulich=C2=A0wrote:=0D=0A>>>>=C2=A0On=C2=A028.07.202=
2=C2=A011:22,=C2=A0Boyoun=C2=A0Park=C2=A0wrote:=0D=0A>>>>>=C2=A0Subject:=C2=
=A0=5BPATCH=C2=A0v1=5D=C2=A0xen:=C2=A0add=C2=A0late=C2=A0init=C2=A0call=C2=
=A0in=C2=A0start_xen=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0This=C2=A0patch=C2=A0=
added=C2=A0late_initcall=C2=A0section=C2=A0in=C2=A0init.data.=0D=0A>>>>>=C2=
=A0=0D=0A>>>>>=C2=A0The=C2=A0late=C2=A0initcall=C2=A0would=C2=A0be=C2=A0cal=
led=C2=A0after=C2=A0initcall=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0in=C2=A0the=
=C2=A0start_xen=C2=A0function.=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0Some=C2=A0i=
nitializing=C2=A0works=C2=A0on=C2=A0priority=C2=A0should=C2=A0be=C2=A0run=
=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0in=C2=A0do_initcalls=C2=A0and=C2=A0other=
=C2=A0non-prioritized=C2=A0works=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0would=C2=
=A0be=C2=A0run=C2=A0in=C2=A0do_late_initcalls.=0D=0A>>>>>=C2=A0=0D=0A>>>>>=
=C2=A0To=C2=A0call=C2=A0some=C2=A0functions=C2=A0by=C2=A0late_initcall,=0D=
=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0then=C2=A0it=C2=A0is=C2=A0possible=C2=A0by=
=C2=A0using=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0__late_initcall(/*Function=C2=
=A0Name*/);=0D=0A>>>>>=C2=A0=0D=0A>>>>>=C2=A0Signed-off-by:=C2=A0Boyoun=C2=
=A0Park=C2=A0<boyoun.park=40samsung.com>=0D=0A>>>>=C2=A0=0D=0A>>>>=C2=A0So=
=C2=A0I=C2=A0could=C2=A0imagine=C2=A0this=C2=A0patch=C2=A0to=C2=A0be=C2=A0i=
n=C2=A0a=C2=A0series=C2=A0where=C2=A0a=C2=A0subsequent=0D=0A>>>>=C2=A0patch=
=C2=A0then=C2=A0adds=C2=A0an=C2=A0actual=C2=A0use=C2=A0of=C2=A0the=C2=A0new=
=C2=A0functionality.=C2=A0Without=0D=0A>>>>=C2=A0that=C2=A0what=C2=A0you're=
=C2=A0proposing=C2=A0is=C2=A0to=C2=A0add=C2=A0dead=C2=A0code.=0D=0A>>>=C2=
=A0=0D=0A>>>=C2=A0Yeah,=C2=A0I=C2=A0think=C2=A0it=C2=A0would=C2=A0be=C2=A0c=
ool=C2=A0to=C2=A0have=C2=A0late=C2=A0initcalls=C2=A0but=C2=A0it=C2=A0makes=
=C2=A0sense=0D=0A>>>=C2=A0to=C2=A0add=C2=A0them=C2=A0if=C2=A0we=C2=A0have=
=C2=A0someone=C2=A0that=C2=A0makes=C2=A0use=C2=A0of=C2=A0them.=0D=0A>>=C2=
=A0=0D=0A>>=C2=A0I=C2=A0totally=C2=A0agree=C2=A0with=C2=A0your=C2=A0comment=
s.=C2=A0Some=C2=A0drivers=C2=A0that=C2=A0I'm=C2=A0developing=C2=A0now=C2=A0=
and=C2=A0use=C2=A0this=C2=A0function=C2=A0are=C2=A0specific=C2=A0to=C2=A0my=
=C2=A0hardware=C2=A0environment.=0D=0A>>=C2=A0Thus,=C2=A0it=C2=A0seems=C2=
=A0difficult=C2=A0to=C2=A0arrange=C2=A0them=C2=A0in=C2=A0the=C2=A0near=C2=
=A0future.=0D=0A>>=C2=A0I=C2=A0will=C2=A0update=C2=A0patches=C2=A0if=C2=A0I=
=C2=A0can=C2=A0suggest=C2=A0an=C2=A0actual=C2=A0use.=0D=0A>=20=0D=0A>=20I=
=C2=A0totally=C2=A0understand=C2=A0custom=C2=A0setups=C2=A0and=C2=A0non-ups=
treamable=C2=A0configurations=0D=0A>=20and=C2=A0I=C2=A0have=C2=A0certainly=
=C2=A0some=C2=A0of=C2=A0them=C2=A0myself.=0D=0A>=20=0D=0A>=20However,=C2=A0=
I=C2=A0just=C2=A0wanted=C2=A0to=C2=A0let=C2=A0you=C2=A0know=C2=A0that=C2=A0=
we=C2=A0are=C2=A0fine=C2=A0with=C2=A0accepting=0D=0A>=20platform=C2=A0speci=
fic=C2=A0drivers=C2=A0in=C2=A0Xen=C2=A0where=C2=A0it=C2=A0makes=C2=A0sense,=
=C2=A0for=C2=A0instance:=0D=0A>=20=0D=0A>=20-=C2=A0Renesas=C2=A0IPMMU-VMSA=
=C2=A0found=C2=A0in=C2=A0R-Car=C2=A0Gen3/Gen4=C2=A0SoCs=C2=A0(an=C2=A0IOMMU=
=C2=A0driver)=0D=0A>=20xen/drivers/passthrough/arm/ipmmu-vmsa.c=0D=0A>=20=
=0D=0A>=20-=C2=A0Xilinx=C2=A0EEMI=C2=A0firmware=C2=A0interface=C2=A0=22medi=
ator=22=C2=A0in=C2=A0Xen=C2=A0(power=C2=A0management)=0D=0A>=20xen/arch/arm=
/platforms/xilinx-zynqmp-eemi.c=0D=0A=0D=0AFrom:=20Boyoun=20Park=20<boyoun.=
park=40samsung.com>=0D=0ADate:=20Tue,=2015=20Mar=202022=2012:57:59=20+0900=
=0D=0ASubject:=20=5BPATCH=20v2=201/2=5D=20xen:=20add=20late=20init=20call=
=20in=20start_xen=0D=0A=0D=0AThis=20patch=20added=20late_initcall=20section=
=20in=20init.data.=0D=0AThe=20late=20initcall=20would=20be=20called=20after=
=20initcall=0D=0Ain=20the=20start_xen=20function.=0D=0A=0D=0ASome=20initial=
izing=20works=20on=20priority=20should=20be=20run=0D=0Ain=20do_initcalls=20=
and=20other=20non-prioritized=20works=0D=0Awould=20be=20run=20in=20do_late_=
initcalls.=0D=0A=0D=0ATo=20call=20some=20functions=20by=20late_initcall,=0D=
=0Athen=20it=20is=20possible=20by=20using=0D=0A__late_initcall(/*Function=
=20Name*/);=0D=0A=0D=0ASigned-off-by:=20Boyoun=20Park=20<boyoun.park=40sams=
ung.com>=0D=0A---=0D=0A=20xen/arch/arm/setup.c=20=20=20=7C=202=20++=0D=0A=
=20xen/arch/arm/xen.lds.S=20=7C=202=20++=0D=0A=20xen/arch/x86/setup.c=20=20=
=20=7C=202=20++=0D=0A=20xen/arch/x86/xen.lds.S=20=7C=202=20++=0D=0A=20xen/c=
ommon/kernel.c=20=20=20=20=7C=209=20++++++++-=0D=0A=20xen/include/xen/init.=
h=20=7C=203=20+++=0D=0A=206=20files=20changed,=2019=20insertions(+),=201=20=
deletion(-)=0D=0A=0D=0Adiff=20--git=20a/xen/arch/arm/setup.c=20b/xen/arch/a=
rm/setup.c=0D=0Aindex=2085ff956..332a207=20100644=0D=0A---=20a/xen/arch/arm=
/setup.c=0D=0A+++=20b/xen/arch/arm/setup.c=0D=0A=40=40=20-1063,6=20+1063,8=
=20=40=40=20void=20__init=20start_xen(unsigned=20long=20boot_phys_offset,=
=0D=0A=20=20=20=20=20/*=20Hide=20UART=20from=20DOM0=20if=20we're=20using=20=
it=20*/=0D=0A=20=20=20=20=20serial_endboot();=0D=0A=20=0D=0A+=20=20=20=20do=
_late_initcalls();=0D=0A+=0D=0A=20=20=20=20=20if=20(=20(rc=20=3D=20xsm_set_=
system_active())=20=21=3D=200=20)=0D=0A=20=20=20=20=20=20=20=20=20panic(=22=
xsm:=20unable=20to=20switch=20to=20SYSTEM_ACTIVE=20privilege:=20%d=5Cn=22,=
=20rc);=0D=0A=20=0D=0Adiff=20--git=20a/xen/arch/arm/xen.lds.S=20b/xen/arch/=
arm/xen.lds.S=0D=0Aindex=201e986e2..215e2c3=20100644=0D=0A---=20a/xen/arch/=
arm/xen.lds.S=0D=0A+++=20b/xen/arch/arm/xen.lds.S=0D=0A=40=40=20-163,6=20+1=
63,8=20=40=40=20SECTIONS=0D=0A=20=20=20=20=20=20=20=20__presmp_initcall_end=
=20=3D=20.;=0D=0A=20=20=20=20=20=20=20=20*(.initcall1.init)=0D=0A=20=20=20=
=20=20=20=20=20__initcall_end=20=3D=20.;=0D=0A+=20=20=20=20=20=20=20*(.init=
calllate.init)=0D=0A+=20=20=20=20=20=20=20__late_initcall_end=20=3D=20.;=0D=
=0A=20=0D=0A=20=20=20=20=20=20=20=20.=20=3D=20ALIGN(4);=0D=0A=20=20=20=20=
=20=20=20=20__alt_instructions=20=3D=20.;=0D=0Adiff=20--git=20a/xen/arch/x8=
6/setup.c=20b/xen/arch/x86/setup.c=0D=0Aindex=20f08b07b..5dc6654=20100644=
=0D=0A---=20a/xen/arch/x86/setup.c=0D=0A+++=20b/xen/arch/x86/setup.c=0D=0A=
=40=40=20-1952,6=20+1952,8=20=40=40=20void=20__init=20noreturn=20__start_xe=
n(unsigned=20long=20mbi_p)=0D=0A=20=0D=0A=20=20=20=20=20setup_io_bitmap(dom=
0);=0D=0A=20=0D=0A+=20=20=20=20do_late_initcalls();=0D=0A+=0D=0A=20=20=20=
=20=20if=20(=20bsp_delay_spec_ctrl=20)=0D=0A=20=20=20=20=20=7B=0D=0A=20=20=
=20=20=20=20=20=20=20info->spec_ctrl_flags=20&=3D=20=7ESCF_use_shadow;=0D=
=0Adiff=20--git=20a/xen/arch/x86/xen.lds.S=20b/xen/arch/x86/xen.lds.S=0D=0A=
index=208930e14..c90c7b0=20100644=0D=0A---=20a/xen/arch/x86/xen.lds.S=0D=0A=
+++=20b/xen/arch/x86/xen.lds.S=0D=0A=40=40=20-250,6=20+250,8=20=40=40=20SEC=
TIONS=0D=0A=20=20=20=20=20=20=20=20__presmp_initcall_end=20=3D=20.;=0D=0A=
=20=20=20=20=20=20=20=20*(.initcall1.init)=0D=0A=20=20=20=20=20=20=20=20__i=
nitcall_end=20=3D=20.;=0D=0A+=20=20=20=20=20=20=20*(.initcalllate.init)=0D=
=0A+=20=20=20=20=20=20=20__late_initcall_end=20=3D=20.;=0D=0A=20=0D=0A=20=
=20=20=20=20=20=20=20*(.init.data)=0D=0A=20=20=20=20=20=20=20=20*(.init.dat=
a.rel)=0D=0Adiff=20--git=20a/xen/common/kernel.c=20b/xen/common/kernel.c=0D=
=0Aindex=20f8134d3..5a3d037=20100644=0D=0A---=20a/xen/common/kernel.c=0D=0A=
+++=20b/xen/common/kernel.c=0D=0A=40=40=20-369,7=20+369,7=20=40=40=20void=
=20add_taint(unsigned=20int=20flag)=0D=0A=20=7D=0D=0A=20=0D=0A=20extern=20c=
onst=20initcall_t=20__initcall_start=5B=5D,=20__presmp_initcall_end=5B=5D,=
=0D=0A-=20=20=20=20__initcall_end=5B=5D;=0D=0A+=20=20=20=20__initcall_end=
=5B=5D,=20__late_initcall_end=5B=5D;=0D=0A=20=0D=0A=20void=20__init=20do_pr=
esmp_initcalls(void)=0D=0A=20=7B=0D=0A=40=40=20-385,6=20+385,13=20=40=40=20=
void=20__init=20do_initcalls(void)=0D=0A=20=20=20=20=20=20=20=20=20(*call)(=
);=0D=0A=20=7D=0D=0A=20=0D=0A+void=20__init=20do_late_initcalls(void)=0D=0A=
+=7B=0D=0A+=20=20=20=20const=20initcall_t=20*call;=0D=0A+=20=20=20=20for=20=
(=20call=20=3D=20__initcall_end;=20call=20<=20__late_initcall_end;=20call++=
=20)=0D=0A+=20=20=20=20=20=20=20=20(*call)();=0D=0A+=7D=0D=0A+=0D=0A=20=23i=
fdef=20CONFIG_HYPFS=0D=0A=20static=20unsigned=20int=20__read_mostly=20major=
_version;=0D=0A=20static=20unsigned=20int=20__read_mostly=20minor_version;=
=0D=0Adiff=20--git=20a/xen/include/xen/init.h=20b/xen/include/xen/init.h=0D=
=0Aindex=200af0e23..48210ee=20100644=0D=0A---=20a/xen/include/xen/init.h=0D=
=0A+++=20b/xen/include/xen/init.h=0D=0A=40=40=20-68,11=20+68,14=20=40=40=20=
typedef=20void=20(*exitcall_t)(void);=0D=0A=20=20=20=20=20const=20static=20=
initcall_t=20__initcall_=23=23fn=20__init_call(=22presmp=22)=20=3D=20fn=0D=
=0A=20=23define=20__initcall(fn)=20=5C=0D=0A=20=20=20=20=20const=20static=
=20initcall_t=20__initcall_=23=23fn=20__init_call(=221=22)=20=3D=20fn=0D=0A=
+=23define=20__late_initcall(fn)=20=5C=0D=0A+=20=20=20=20const=20static=20i=
nitcall_t=20__initcall_=23=23fn=20__init_call(=22late=22)=20=3D=20fn=0D=0A=
=20=23define=20__exitcall(fn)=20=5C=0D=0A=20=20=20=20=20static=20exitcall_t=
=20__exitcall_=23=23fn=20__exit_call=20=3D=20fn=0D=0A=20=0D=0A=20void=20do_=
presmp_initcalls(void);=0D=0A=20void=20do_initcalls(void);=0D=0A+void=20do_=
late_initcalls(void);=0D=0A=20=0D=0A=20=23endif=20/*=20__ASSEMBLY__=20*/=0D=
=0A=20=0D=0A--=20=0D=0A2.7.4=0D=0A=0D=0ABoyoun=20Park
------=_Part_9967962_701826072.1659494457934
Content-Type: application/octet-stream
Content-Disposition: attachment;
	filename="v2-0001-xen-add-late-init-call-in-start_xen.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZmQ1OGFjODY3OTE4OWE4Nzg2MDllNDViNGJjZTFlNzhkZWU0ODQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8NWZkNThhYzg2NzkxODlhODc4NjA5ZTQ1YjRiY2Ux
ZTc4ZGVlNDg0OC4xNjU5NDkyODE4LmdpdC5ib3lvdW4ucGFya0BzYW1zdW5nLmNvbT4KRnJvbTog
Qm95b3VuIFBhcmsgPGJveW91bi5wYXJrQHNhbXN1bmcuY29tPgpEYXRlOiBUdWUsIDE1IE1hciAy
MDIyIDEyOjU3OjU5ICswOTAwClN1YmplY3Q6IFtQQVRDSCB2MiAxLzJdIHhlbjogYWRkIGxhdGUg
aW5pdCBjYWxsIGluIHN0YXJ0X3hlbgoKVGhpcyBwYXRjaCBhZGRlZCBsYXRlX2luaXRjYWxsIHNl
Y3Rpb24gaW4gaW5pdC5kYXRhLgpUaGUgbGF0ZSBpbml0Y2FsbCB3b3VsZCBiZSBjYWxsZWQgYWZ0
ZXIgaW5pdGNhbGwKaW4gdGhlIHN0YXJ0X3hlbiBmdW5jdGlvbi4KClNvbWUgaW5pdGlhbGl6aW5n
IHdvcmtzIG9uIHByaW9yaXR5IHNob3VsZCBiZSBydW4KaW4gZG9faW5pdGNhbGxzIGFuZCBvdGhl
ciBub24tcHJpb3JpdGl6ZWQgd29ya3MKd291bGQgYmUgcnVuIGluIGRvX2xhdGVfaW5pdGNhbGxz
LgoKVG8gY2FsbCBzb21lIGZ1bmN0aW9ucyBieSBsYXRlX2luaXRjYWxsLAp0aGVuIGl0IGlzIHBv
c3NpYmxlIGJ5IHVzaW5nCl9fbGF0ZV9pbml0Y2FsbCgvKkZ1bmN0aW9uIE5hbWUqLyk7CgpTaWdu
ZWQtb2ZmLWJ5OiBCb3lvdW4gUGFyayA8Ym95b3VuLnBhcmtAc2Ftc3VuZy5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL3NldHVwLmMgICB8IDIgKysKIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgfCAyICsr
CiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgIHwgMiArKwogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyB8
IDIgKysKIHhlbi9jb21tb24va2VybmVsLmMgICAgfCA5ICsrKysrKysrLQogeGVuL2luY2x1ZGUv
eGVuL2luaXQuaCB8IDMgKysrCiA2IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCmluZGV4IDg1ZmY5NTYuLjMzMmEyMDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC0xMDYzLDYgKzEwNjMs
OCBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
LAogICAgIC8qIEhpZGUgVUFSVCBmcm9tIERPTTAgaWYgd2UncmUgdXNpbmcgaXQgKi8KICAgICBz
ZXJpYWxfZW5kYm9vdCgpOwogCisgICAgZG9fbGF0ZV9pbml0Y2FsbHMoKTsKKwogICAgIGlmICgg
KHJjID0geHNtX3NldF9zeXN0ZW1fYWN0aXZlKCkpICE9IDAgKQogICAgICAgICBwYW5pYygieHNt
OiB1bmFibGUgdG8gc3dpdGNoIHRvIFNZU1RFTV9BQ1RJVkUgcHJpdmlsZWdlOiAlZFxuIiwgcmMp
OwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hl
bi5sZHMuUwppbmRleCAxZTk4NmUyLi4yMTVlMmMzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKQEAgLTE2Myw2ICsxNjMsOCBA
QCBTRUNUSU9OUwogICAgICAgIF9fcHJlc21wX2luaXRjYWxsX2VuZCA9IC47CiAgICAgICAgKigu
aW5pdGNhbGwxLmluaXQpCiAgICAgICAgX19pbml0Y2FsbF9lbmQgPSAuOworICAgICAgICooLmlu
aXRjYWxsbGF0ZS5pbml0KQorICAgICAgIF9fbGF0ZV9pbml0Y2FsbF9lbmQgPSAuOwogCiAgICAg
ICAgLiA9IEFMSUdOKDQpOwogICAgICAgIF9fYWx0X2luc3RydWN0aW9ucyA9IC47CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGYw
OGIwN2IuLjVkYzY2NTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC0xOTUyLDYgKzE5NTIsOCBAQCB2b2lkIF9faW5pdCBub3Jl
dHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogCiAgICAgc2V0dXBfaW9fYml0
bWFwKGRvbTApOwogCisgICAgZG9fbGF0ZV9pbml0Y2FsbHMoKTsKKwogICAgIGlmICggYnNwX2Rl
bGF5X3NwZWNfY3RybCApCiAgICAgewogICAgICAgICBpbmZvLT5zcGVjX2N0cmxfZmxhZ3MgJj0g
flNDRl91c2Vfc2hhZG93OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hl
bi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXggODkzMGUxNC4uYzkwYzdiMCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0y
NTAsNiArMjUwLDggQEAgU0VDVElPTlMKICAgICAgICBfX3ByZXNtcF9pbml0Y2FsbF9lbmQgPSAu
OwogICAgICAgICooLmluaXRjYWxsMS5pbml0KQogICAgICAgIF9faW5pdGNhbGxfZW5kID0gLjsK
KyAgICAgICAqKC5pbml0Y2FsbGxhdGUuaW5pdCkKKyAgICAgICBfX2xhdGVfaW5pdGNhbGxfZW5k
ID0gLjsKIAogICAgICAgICooLmluaXQuZGF0YSkKICAgICAgICAqKC5pbml0LmRhdGEucmVsKQpk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXJuZWwuYyBiL3hlbi9jb21tb24va2VybmVsLmMKaW5k
ZXggZjgxMzRkMy4uNWEzZDAzNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYworKysg
Yi94ZW4vY29tbW9uL2tlcm5lbC5jCkBAIC0zNjksNyArMzY5LDcgQEAgdm9pZCBhZGRfdGFpbnQo
dW5zaWduZWQgaW50IGZsYWcpCiB9CiAKIGV4dGVybiBjb25zdCBpbml0Y2FsbF90IF9faW5pdGNh
bGxfc3RhcnRbXSwgX19wcmVzbXBfaW5pdGNhbGxfZW5kW10sCi0gICAgX19pbml0Y2FsbF9lbmRb
XTsKKyAgICBfX2luaXRjYWxsX2VuZFtdLCBfX2xhdGVfaW5pdGNhbGxfZW5kW107CiAKIHZvaWQg
X19pbml0IGRvX3ByZXNtcF9pbml0Y2FsbHModm9pZCkKIHsKQEAgLTM4NSw2ICszODUsMTMgQEAg
dm9pZCBfX2luaXQgZG9faW5pdGNhbGxzKHZvaWQpCiAgICAgICAgICgqY2FsbCkoKTsKIH0KIAor
dm9pZCBfX2luaXQgZG9fbGF0ZV9pbml0Y2FsbHModm9pZCkKK3sKKyAgICBjb25zdCBpbml0Y2Fs
bF90ICpjYWxsOworICAgIGZvciAoIGNhbGwgPSBfX2luaXRjYWxsX2VuZDsgY2FsbCA8IF9fbGF0
ZV9pbml0Y2FsbF9lbmQ7IGNhbGwrKyApCisgICAgICAgICgqY2FsbCkoKTsKK30KKwogI2lmZGVm
IENPTkZJR19IWVBGUwogc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG1ham9yX3Zl
cnNpb247CiBzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbWlub3JfdmVyc2lvbjsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pbml0LmggYi94ZW4vaW5jbHVkZS94ZW4vaW5p
dC5oCmluZGV4IDBhZjBlMjMuLjQ4MjEwZWUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9p
bml0LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2luaXQuaApAQCAtNjgsMTEgKzY4LDE0IEBAIHR5
cGVkZWYgdm9pZCAoKmV4aXRjYWxsX3QpKHZvaWQpOwogICAgIGNvbnN0IHN0YXRpYyBpbml0Y2Fs
bF90IF9faW5pdGNhbGxfIyNmbiBfX2luaXRfY2FsbCgicHJlc21wIikgPSBmbgogI2RlZmluZSBf
X2luaXRjYWxsKGZuKSBcCiAgICAgY29uc3Qgc3RhdGljIGluaXRjYWxsX3QgX19pbml0Y2FsbF8j
I2ZuIF9faW5pdF9jYWxsKCIxIikgPSBmbgorI2RlZmluZSBfX2xhdGVfaW5pdGNhbGwoZm4pIFwK
KyAgICBjb25zdCBzdGF0aWMgaW5pdGNhbGxfdCBfX2luaXRjYWxsXyMjZm4gX19pbml0X2NhbGwo
ImxhdGUiKSA9IGZuCiAjZGVmaW5lIF9fZXhpdGNhbGwoZm4pIFwKICAgICBzdGF0aWMgZXhpdGNh
bGxfdCBfX2V4aXRjYWxsXyMjZm4gX19leGl0X2NhbGwgPSBmbgogCiB2b2lkIGRvX3ByZXNtcF9p
bml0Y2FsbHModm9pZCk7CiB2b2lkIGRvX2luaXRjYWxscyh2b2lkKTsKK3ZvaWQgZG9fbGF0ZV9p
bml0Y2FsbHModm9pZCk7CiAKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KIAotLSAKMi43LjQK
Cg==

------=_Part_9967962_701826072.1659494457934--

