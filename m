Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7E589B26
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 13:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380280.614376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJZFp-0007ye-CV; Thu, 04 Aug 2022 11:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380280.614376; Thu, 04 Aug 2022 11:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJZFp-0007vj-9S; Thu, 04 Aug 2022 11:43:05 +0000
Received: by outflank-mailman (input) for mailman id 380280;
 Thu, 04 Aug 2022 11:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEPH=YI=samsung.com=boyoun.park@srs-se1.protection.inumbo.net>)
 id 1oJZFn-0007vd-Hf
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 11:43:04 +0000
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9455e5e5-13ea-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 13:42:59 +0200 (CEST)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220804114254epoutp0121ec79093eacb81b26cae7b8b6d76ef1~IIZIecp3T0476904769epoutp012
 for <xen-devel@lists.xenproject.org>; Thu,  4 Aug 2022 11:42:54 +0000 (GMT)
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20220804114252epcas2p48a34fc834788cf040f7f65c595d87d3b~IIZHNUdL_0385103851epcas2p4X;
 Thu,  4 Aug 2022 11:42:52 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.70]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Lz6Km2Gt6z4x9Q1; Thu,  4 Aug
 2022 11:42:52 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.18.03852.CB0BBE26; Thu,  4 Aug 2022 20:42:52 +0900 (KST)
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
X-Inumbo-ID: 9455e5e5-13ea-11ed-bd2d-47488cf2e6aa
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220804114254epoutp0121ec79093eacb81b26cae7b8b6d76ef1~IIZIecp3T0476904769epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1659613374;
	bh=3Gv4fUPpAj6aYR5+EmVuCch0amicaY4EXJ+IoAh7vQ4=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=FMDtmhnAkQtYTUTr9DLstw3QmiXztK2H5IsU0jrGiEBsetnaWLFNX8DtX+yzMu6nH
	 UY4IrNNEVC4eU30u7m/mQydmAPOsPZnTkBoPcB0gE9t9nKcwVLqBWTBtKCoqYUcZOt
	 6oI2/UmE+HRqSPocDHwgxUuDC7x2HHfl9HBiRClo=
X-AuditID: b6c32a47-58dff70000000f0c-aa-62ebb0bcbfc5
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] xen: add late init call in start_xen
Reply-To: boyoun.park@samsung.com
Sender: Boyoun Park <boyoun.park@samsung.com>
From: Boyoun Park <boyoun.park@samsung.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
	Beulich <jbeulich@suse.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "wl@xen.org" <wl@xen.org>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Chungwoo Park
	<cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>, Lei Wang
	<lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>, DongJin PARK
	<djpax.park@samsung.com>, Joonjae Lee <joonjae7.lee@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <19295a89-8d89-973e-defe-2a0b063cbde4@xen.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220804114251epcms2p5dba37d2bca23c36f954e380456f37c8e@epcms2p5>
Date: Thu, 04 Aug 2022 20:42:51 +0900
X-CMS-MailID: 20220804114251epcms2p5dba37d2bca23c36f954e380456f37c8e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmqe6eDa+TDJrW8lssfryL3WLpks1M
	FqdmdTJZLDt8j93iwse9LBbzOw4xWfzc85DNorPrC6vF59mT2SzadlxmtZhxfjGrRePCeIvV
	6+It/i2NsPi4Rtzi+5bJTA4CHmvmrWH0eD15AqPHnaU7GT02repk8zj84QqLR9+WVYwe67dc
	ZfE4fWsWWwBHVLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+A
	rltmDtD9SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIr
	QwMDI1OgwoTsjMauw0wFZzQqFq8Wb2Dcp97FyMkhIWAi8W7bHeYuRi4OIYEdjBJdG1+wdDFy
	cPAKCEr83SEMUiMs4CAxd+4/FhBbSEBRovXMQnaIuK5ET9deNhCbTUBb4sXNW2A1IgIBEpc6
	jzOCzGQWaGaVOD1tEgvEMl6JGe1PoWxpie3LtzKC2JwC1hK7tj5mhYhrSPxY1ssMYYtK3Fz9
	lh3Gfn9sPiOELSLReu8sVI2gxIOfu6HiUhKNnw5B1RdLzOlbzw5yhIRAA6PEzYsXmSAS+hJT
	WuaALeMV8JXoe3sPrJlFQFVi0r1JUENdJBY33AOzmYE+W7bwNTMoUJgFNCXW79IHMSUElCWO
	QPzLLMAn0XH4LzvMizvmPYHapCrxq+kFI8y7e862Q9keEodfPGGZwKg4CxHSs5DsmoWwawEj
	8ypGsdSC4tz01GKjAmN43Cbn525iBKdkLfcdjDPeftA7xMjEwXiIUYKDWUmEd4Xl6yQh3pTE
	yqrUovz4otKc1OJDjKZAX05klhJNzgdmhbySeEMTSwMTMzNDcyNTA3MlcV6vlA2JQgLpiSWp
	2ampBalFMH1MHJxSDUza/1zLJgp/PJaokr6p32j3q0kB7+Y4T07Q3WM7eUJly8tdaY+Ma82k
	Rf+u/v339r1Qi8jH1+aW7Hz2kvnC9X+Huvz2HMnu/rWKb5cqh97NGVOP3Lu+Rn31+lkZ72UN
	uh70+/DF/ea3keqtCLtvw6AV4hi/fsetkwuf87k+fSRSz7jRZc+LM//Or/8bs+SmmtMxExdL
	Xi4LeQ1l7pxcFUH7NdVmjZ+6d2k4VjSt+9C2j93W8VrP76Vr1ZY++Nx6/8Cvy4vr36yPD9q1
	XOqp7LGW35OD/844JZDwfu2pdXt/RvSnV96exfBpdlmDkQur8LTpsc4L/E6Ui50wYJzEb/VY
	6o3wdMOE1uOWyTa75G/KKbEUZyQaajEXFScCAIQpHfpSBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220728092237epcms2p53821bba31388763f45b5204d56520c20
References: <19295a89-8d89-973e-defe-2a0b063cbde4@xen.org>
	<alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
	<alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
	<97499212.9948800.1659000157467@mail-kr2-3>
	<88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
	<20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
	<1470588578.9967963.1659494457934@mail-kr2-1>
	<CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p5>

On Wed, 3 Aug 2022, Julien Grall=C2=A0wrote:=0D=0A>=20Hi=C2=A0Boyoun,=0D=0A=
>=20=0D=0A>=20On=C2=A003/08/2022=C2=A003:40,=C2=A0Boyoun=C2=A0Park=C2=A0wro=
te:=0D=0A>>=C2=A0From:=C2=A0Boyoun=C2=A0Park=C2=A0<boyoun.park=40samsung.co=
m>=0D=0A>>=C2=A0Date:=C2=A0Tue,=C2=A015=C2=A0Mar=C2=A02022=C2=A012:57:59=C2=
=A0+0900=0D=0A>>=C2=A0Subject:=C2=A0=5BPATCH=C2=A0v2=C2=A01/2=5D=C2=A0xen:=
=C2=A0add=C2=A0late=C2=A0init=C2=A0call=C2=A0in=C2=A0start_xen=0D=0A>>=C2=
=A0=0D=0A>>=C2=A0This=C2=A0patch=C2=A0added=C2=A0late_initcall=C2=A0section=
=C2=A0in=C2=A0init.data.=0D=0A>>=C2=A0The=C2=A0late=C2=A0initcall=C2=A0woul=
d=C2=A0be=C2=A0called=C2=A0after=C2=A0initcall=0D=0A>>=C2=A0in=C2=A0the=C2=
=A0start_xen=C2=A0function.=0D=0A>=0D=0A>I=C2=A0think=C2=A0this=C2=A0is=C2=
=A0a=C2=A0bit=C2=A0too=C2=A0vague.=C2=A0AFAIU,=C2=A0you=C2=A0want=C2=A0late=
_initcall()=C2=A0to=C2=A0=0D=0A>happen=C2=A0*after*=C2=A0all=C2=A0the=C2=A0=
domains=C2=A0have=C2=A0been=C2=A0created=C2=A0but=C2=A0*before*=C2=A0they=
=C2=A0are=C2=A0=0D=0A>unpaused.=C2=A0Is=C2=A0that=C2=A0correct?=0D=0A>=0D=
=0A>=C2=A0From=C2=A0the=C2=A0previous=C2=A0discussion,=C2=A0I=C2=A0saw=C2=
=A0you=C2=A0said=C2=A0you=C2=A0have=C2=A0drivers=C2=A0needing=C2=A0=0D=0A>t=
o=C2=A0call=C2=A0initlate.=C2=A0Could=C2=A0you=C2=A0briefly=C2=A0explain=C2=
=A0why=C2=A0they=C2=A0can't=C2=A0be=C2=A0called=C2=A0in=C2=A0=0D=0A>initcal=
l?=0D=0A>=0D=0A>>=C2=A0=0D=0A>>=C2=A0Some=C2=A0initializing=C2=A0works=C2=
=A0on=C2=A0priority=C2=A0should=C2=A0be=C2=A0run=0D=0A>>=C2=A0in=C2=A0do_in=
itcalls=C2=A0and=C2=A0other=C2=A0non-prioritized=C2=A0works=0D=0A>>=C2=A0wo=
uld=C2=A0be=C2=A0run=C2=A0in=C2=A0do_late_initcalls.=0D=0A>=0D=0A>IIUC,=C2=
=A0you=C2=A0are=C2=A0saying=C2=A0that=C2=A0do_late_initcalls()=C2=A0was=C2=
=A0introduced=C2=A0for=C2=A0=0D=0A>prioritization=C2=A0purpose.=C2=A0But=C2=
=A0then,=C2=A0there=C2=A0are=C2=A0also=C2=A0a=C2=A0difference=C2=A0in=C2=A0=
=0D=0A>behavior=C2=A0(initcalls=C2=A0happens=C2=A0before=C2=A0creating=C2=
=A0the=C2=A0domains=C2=A0whereas=C2=A0late=C2=A0=0D=0A>happens=C2=A0after).=
=0D=0A>=0D=0A>Therefore,=C2=A0if=C2=A0the=C2=A0priority=C2=A0is=C2=A0the=C2=
=A0only=C2=A0reasons,=C2=A0then=C2=A0I=C2=A0think=C2=A0we=C2=A0should=C2=A0=
=0D=0A>introduce=C2=A0priority=C2=A0within=C2=A0the=C2=A0initcalls.=0D=0A=
=0D=0AWhen=20I=20made=20the=20patch=20for=20the=20first=20time,=20there=20w=
as=20a=20problem=20related=20to=0D=0Amemory=20access=20from=20some=20of=20m=
y=20drivers=20with=20original=20initcall=20which=20is=20not=0D=0Athe=20prob=
lem=20in=20Xen=20mainline.=20But=20it=20is=20resolved=20now,=20so=20for=20m=
y=20case,=0D=0Ait=20seems=20that=20the=20location=20when=20it=20is=20called=
=20is=20more=20important=20now=20as=20you=0D=0Asaid.=20Most=20of=20my=20dri=
vers=20are=20domain-specific=20so=20they=20are=20called=20in=20late=20boot=
=0D=0Atime=20after=20creating=20domains.=0D=0A=0D=0ASimilar=20to=20priority=
=20within=20the=20initcalls,=20I=20think=20it=20could=20be=20subdivided=0D=
=0Aaccording=20to=20the=20functions'=20own=20purposes=20such=20as=20arch_in=
itcall,=0D=0Adevice_initcall,=20and=20others=20in=20Linux=20Kernel.=0D=0A=
=0D=0A>>=C2=A0diff=C2=A0--git=C2=A0a/xen/arch/x86/setup.c=C2=A0b/xen/arch/x=
86/setup.c=0D=0A>>=C2=A0index=C2=A0f08b07b..5dc6654=C2=A0100644=0D=0A>>=C2=
=A0---=C2=A0a/xen/arch/x86/setup.c=0D=0A>>=C2=A0+++=C2=A0b/xen/arch/x86/set=
up.c=0D=0A>>=C2=A0=40=40=C2=A0-1952,6=C2=A0+1952,8=C2=A0=40=40=C2=A0void=C2=
=A0__init=C2=A0noreturn=C2=A0__start_xen(unsigned=C2=A0long=C2=A0mbi_p)=0D=
=0A>>=C2=A0=C2=A0=C2=A0=0D=0A>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0se=
tup_io_bitmap(dom0);=0D=0A>>=C2=A0=C2=A0=C2=A0=0D=0A>>=C2=A0+=C2=A0=C2=A0=
=C2=A0=C2=A0do_late_initcalls();=0D=0A>>=C2=A0+=0D=0A>=0D=0A>It=C2=A0would=
=C2=A0be=C2=A0preferable=C2=A0if=C2=A0the=C2=A0call=C2=A0is=C2=A0done=C2=A0=
roughly=C2=A0at=C2=A0the=C2=A0same=C2=A0place=C2=A0on=C2=A0=0D=0A>all=C2=A0=
architecture.=C2=A0So=C2=A0if=C2=A0it=C2=A0easier=C2=A0for=C2=A0a=C2=A0deve=
loper=C2=A0to=C2=A0know=C2=A0when=C2=A0this=C2=A0will=C2=A0=0D=0A>be=C2=A0c=
alled=C2=A0(e.g.=C2=A0just=C2=A0after=C2=A0serial_endboot()).=0D=0A>=0D=0A>=
If=C2=A0you=C2=A0need=C2=A0to=C2=A0call=C2=A0the=C2=A0function=C2=A0at=C2=
=A0the=C2=A0different=C2=A0place,=C2=A0then=C2=A0I=C2=A0think=C2=A0=0D=0A>t=
his=C2=A0ought=C2=A0to=C2=A0be=C2=A0explained.=0D=0A=0D=0AI=20understand=20=
your=20comments.=20The=20reason=20of=20the=20location=20should=20be=20expla=
ined.=0D=0AI=20also=20checked=20Jan's=20review.=20All=20of=20the=20reviews=
=20including=20yours=20are=20reasonable.=0D=0A=0D=0AIt=20would=20be=20bette=
r=20to=20add=20this=20function=20with=20my=20specific=20drivers=20after=0D=
=0Aremoving=20lots=20of=20unclean=20codes.=20Thank=20you=20for=20all=20of=
=20your=20replies.=0D=0AAlthough=20it=20is=20my=20first=20time=20to=20send=
=20patches=20to=20open-source=20project,=0D=0Ait=20helps=20a=20lot=20to=20u=
nderstand=20what=20kinds=20of=20codes=20are=20appropriate=20to=20be=0D=0Aco=
ntributed.=20I=20will=20make=20new=20thread=20if=20I=20can=20improve=20the=
=20ideas=20and=20patches.=0D=0A=0D=0AWith=20gratitude,=0D=0A=0D=0ABoyoun=20=
Park

