Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A7584F53
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 13:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377469.610692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHNm7-0004Ec-Jo; Fri, 29 Jul 2022 11:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377469.610692; Fri, 29 Jul 2022 11:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHNm7-0004C9-Gx; Fri, 29 Jul 2022 11:03:23 +0000
Received: by outflank-mailman (input) for mailman id 377469;
 Fri, 29 Jul 2022 11:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cBgu=YC=samsung.com=boyoun.park@srs-se1.protection.inumbo.net>)
 id 1oHNm5-0004C0-PJ
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 11:03:22 +0000
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf25664-0f2e-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 13:03:19 +0200 (CEST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220729110315epoutp01e465db6924ee536cf3f372534669e1ee~GR_zbNRsX1538315383epoutp016
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 11:03:15 +0000 (GMT)
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220729110314epcas2p252c9e3f81f25f444a5374254f4978ec2~GR_y9jK441518315183epcas2p2P;
 Fri, 29 Jul 2022 11:03:14 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4LvPkp2Hdwz4x9Pt; Fri, 29 Jul
 2022 11:03:14 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.69.09662.27EB3E26; Fri, 29 Jul 2022 20:03:14 +0900 (KST)
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
X-Inumbo-ID: 0bf25664-0f2e-11ed-924f-1f966e50362f
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220729110315epoutp01e465db6924ee536cf3f372534669e1ee~GR_zbNRsX1538315383epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1659092595;
	bh=/fh523OpBVd/9X+oNoqFOp+hsiuEGxjO7nxFwpXVb10=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=bbz56rbZdTYC1K5athUpxdjeGAo2cUzi/VOa7MgU0R4Gq+9NLYDu4cluFMxzFlqYA
	 7Dh1cVMQ7Uk55WfhxcAZR0gKtfCchkyYSnLJ02TrDOrqPaHts9edeYBUxouCrvzGaw
	 gsHJ0x1e40cfb6VGMwYEwk3gPR/smLTd+sGWStmA=
X-AuditID: b6c32a48-9f7ff700000025be-ab-62e3be72ece4
Mime-Version: 1.0
Subject: Re: [PATCH v1] xen: add late init call in start_xen
Reply-To: boyoun.park@samsung.com
Sender: Boyoun Park <boyoun.park@samsung.com>
From: Boyoun Park <boyoun.park@samsung.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
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
In-Reply-To: <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
Date: Fri, 29 Jul 2022 20:03:13 +0900
X-CMS-MailID: 20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmuW7RvsdJBs/28VosfryL3WLpks1M
	FqdmdTJZLDt8j93iwse9LBbzOw4xWfzc85DNorPrC6vF59mT2SzadlxmtZhxfjGrRePCeIvV
	6+It/i2NsPi4Rtzi+5bJTA4CHmvmrWH0eD15AqPHnaU7GT02repk8zj84QqLR9+WVYwe67dc
	ZfE4fWsWWwBHVLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+A
	rltmDtD9SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIr
	QwMDI1OgwoTsjHVrrjEW9NtVLP14i7WBcZlNFyMnh4SAicS3ZXPZuxi5OIQEdjBKLN/2n7mL
	kYODV0BQ4u8OYRBTWMBG4mZDFUi5kICiROuZhewgtrCArkRP1142EJtNQFvixc1bLCC2iICr
	RM//Z8wgI5kFJrBKnHq3nxliF6/EjPanLBC2tMT25VsZQeZzCgRIrGzVgghrSPxY1gtVLipx
	c/Vbdhj7/bH5jBC2iETrvbNQNYISD37uhopLSTR+OgRVXywxp2892FsSAg2MEjcvXmSCSOhL
	TGmZwwpi8wr4SuxdchrMZhFQlThwZjPUUBeJNc0vwGxmoMeWLXwNDhJmAU2J9bv0QUwJAWWJ
	IxDvMgvwSXQc/ssO8+GOeU+gNqlK/Gp6wQjz7Z6z7VC2h8ThF09YJjAqzkKE8ywku2Yh7FrA
	yLyKUSy1oDg3PbXYqMAEHrXJ+bmbGMEJWctjB+Pstx/0DjEycTAeYpTgYFYS4RUIeJwkxJuS
	WFmVWpQfX1Sak1p8iNEU6MuJzFKiyfnAnJBXEm9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEk
	NTs1tSC1CKaPiYNTqoHJ4JYha+fTD199f3zM89nToOQxSfei7+05bmsvzLlcdsDnu8a1bRsT
	3i78dUSUx7z0bSv/wa+LhT1K10yQab7M/uCaaazBA6E7Gu4uE/JPTsxZ3lCxMNDta9KpaztP
	PD6443nQywaHiGNSaeueSYlH3GjrX3hRI5+j5befRdytB8/vtvmvKhD6KtFdJPvW2mQZQ5fh
	ksN+mQVbVWy/TBQ0Pf7u/X/N1GK5u+fYXplPTHnHeKSx/51y4Zu26W/8qu2952W223xhX7DR
	T66k50JOaa2LQ0PPwaUXKoIvSCxjWtTcfHuF1ZED7X952EtjwxM/Tzh84fX7ua+lz4YZMKgK
	scTt9+zj6V1xMbw/8f9qJZbijERDLeai4kQAwFxdnFEEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220728092237epcms2p53821bba31388763f45b5204d56520c20
References: <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
	<97499212.9948800.1659000157467@mail-kr2-3>
	<88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
	<CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p5>

I really appreciate all the comments and reviews.
I understand that it is hard to add this patch without any usage.

On Fri, 29 Jul 2022,=C2=A0Stefano=20Stabellini:=0D=0A>=C2=A0On=C2=A0Thu,=C2=
=A028=C2=A0Jul=C2=A02022,=C2=A0Jan=C2=A0Beulich=C2=A0wrote:=0D=0A>=C2=A0>=
=C2=A0On=C2=A028.07.2022=C2=A011:22,=C2=A0Boyoun=C2=A0Park=C2=A0wrote:=0D=
=0A>=C2=A0>=C2=A0>=C2=A0Hello,=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=
=A0>=C2=A0This=C2=A0patch=C2=A0added=C2=A0late_initcall=C2=A0to=C2=A0deal=
=C2=A0with=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0some=C2=A0i=
nit=C2=A0functions=C2=A0which=C2=A0should=C2=A0be=C2=A0called=0D=0A>=C2=A0>=
=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0after=C2=A0other=C2=A0init=C2=A0fun=
ctions=C2=A0in=C2=A0start_xen.=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=
=A0>=C2=A0If=C2=A0this=C2=A0patch=C2=A0is=C2=A0added,=0D=0A>=C2=A0>=C2=A0>=
=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0then=C2=A0the=C2=A0original=C2=A0initcall=
=C2=A0in=C2=A0xen=C2=A0will=C2=A0be=C2=A0treated=0D=0A>=C2=A0>=C2=A0>=C2=A0=
=0D=0A>=C2=A0>=C2=A0>=C2=A0as=C2=A0early_initcall=C2=A0and=C2=A0the=C2=A0la=
te_initcall=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0which=C2=
=A0is=C2=A0added=C2=A0by=C2=A0this=C2=A0patch=C2=A0will=C2=A0be=0D=0A>=C2=
=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0called=C2=A0sequentially.=0D=0A=
>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0I=C2=A0cannot=C2=A0send=C2=
=A0patches=C2=A0through=C2=A0git=C2=A0send-email=0D=0A>=C2=A0>=C2=A0>=C2=A0=
=0D=0A>=C2=A0>=C2=A0>=C2=A0due=C2=A0to=C2=A0some=C2=A0security=C2=A0issues=
=C2=A0in=C2=A0my=C2=A0work.=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=
=C2=A0So=C2=A0intead,=C2=A0I=C2=A0just=C2=A0send=C2=A0the=C2=A0patches=C2=
=A0manually.=0D=0A>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0Which=C2=A0is=C2=A0fine=
,=C2=A0but=C2=A0you=C2=A0want=C2=A0to=C2=A0configure=C2=A0your=C2=A0mail=C2=
=A0client=C2=A0such=C2=A0that=C2=A0it=0D=0A>=C2=A0>=C2=A0doesn't=C2=A0mangl=
e=C2=A0the=C2=A0patch.=C2=A0Albeit=C2=A0I=C2=A0see=C2=A0that=C2=A0to=C2=A0c=
over=C2=A0for=C2=A0that=C2=A0at=C2=A0least=0D=0A>=C2=A0>=C2=A0you've=C2=A0a=
lso=C2=A0attached=C2=A0both=C2=A0the=C2=A0patch=C2=A0and=C2=A0a=C2=A0cover=
=C2=A0letter.=C2=A0For=C2=A0a=C2=A0single=0D=0A>=C2=A0>=C2=A0patch=C2=A0a=
=C2=A0cover=C2=A0letter=C2=A0can=C2=A0normally=C2=A0be=C2=A0omitted,=C2=A0b=
ut=C2=A0if=C2=A0you=C2=A0don't=C2=A0then=0D=0A>=C2=A0>=C2=A0even=C2=A0if=C2=
=A0you're=C2=A0sending=C2=A0without=C2=A0=22git=C2=A0send-email=22=C2=A0you=
=C2=A0will=C2=A0want=C2=A0to=C2=A0send=0D=0A>=C2=A0>=C2=A0both=C2=A0as=C2=
=A0separate=C2=A0mails,=C2=A0with=C2=A0the=C2=A0patch=C2=A0being=C2=A0a=C2=
=A0reply=C2=A0to=C2=A0the=C2=A0cover=0D=0A>=C2=A0>=C2=A0letter=C2=A0thread=
=C2=A0root.=0D=0A>=C2=A0=0D=0A>=C2=A0Yeah.=C2=A0Boyoun,=C2=A0if=C2=A0you=C2=
=A0only=C2=A0have=C2=A0a=C2=A0couple=C2=A0of=C2=A0patches=C2=A0then=C2=A0it=
=C2=A0is=C2=A0fine=C2=A0to=0D=0A>=C2=A0send=C2=A0them=C2=A0manually.=C2=A0O=
therwise,=C2=A0if=C2=A0you=C2=A0have=C2=A0many=C2=A0patches,=C2=A0you=C2=A0=
can=C2=A0send=0D=0A>=C2=A0them=C2=A0in=C2=A0attachment=C2=A0as=C2=A0tarball=
=C2=A0and=C2=A0I'll=C2=A0send=C2=A0them=C2=A0all=C2=A0to=C2=A0xen-devel=C2=
=A0using=0D=0A>=C2=A0git-send-email=C2=A0for=C2=A0you=C2=A0(of=C2=A0course=
=C2=A0keeping=C2=A0you=C2=A0as=C2=A0original=C2=A0author=C2=A0and=0D=0A>=C2=
=A0retaining=C2=A0all=C2=A0Signed-off-bys).=0D=0A=0D=0AYou're=20awesome.=20=
Thanks=20you=20so=20much.=20I'm=20still=20requesting=20approvals=20to=20use=
=20git=20send-email.=0D=0AI'll=20let=20you=20know=20if=20I=20have=20to=20se=
nd=20many=20patches=20wihout=20git=20send-email.=0D=0A=0D=0A>=C2=A0>=C2=A0>=
=C2=A0Subject:=C2=A0=5BPATCH=C2=A0v1=5D=C2=A0xen:=C2=A0add=C2=A0late=C2=A0i=
nit=C2=A0call=C2=A0in=C2=A0start_xen=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=
=A0>=C2=A0>=C2=A0This=C2=A0patch=C2=A0added=C2=A0late_initcall=C2=A0section=
=C2=A0in=C2=A0init.data.=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=
=A0The=C2=A0late=C2=A0initcall=C2=A0would=C2=A0be=C2=A0called=C2=A0after=C2=
=A0initcall=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0in=C2=A0th=
e=C2=A0start_xen=C2=A0function.=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=
=A0>=C2=A0Some=C2=A0initializing=C2=A0works=C2=A0on=C2=A0priority=C2=A0shou=
ld=C2=A0be=C2=A0run=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0in=
=C2=A0do_initcalls=C2=A0and=C2=A0other=C2=A0non-prioritized=C2=A0works=0D=
=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0would=C2=A0be=C2=A0run=
=C2=A0in=C2=A0do_late_initcalls.=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=
=C2=A0>=C2=A0To=C2=A0call=C2=A0some=C2=A0functions=C2=A0by=C2=A0late_initca=
ll,=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0then=C2=A0it=C2=A0=
is=C2=A0possible=C2=A0by=C2=A0using=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0=
>=C2=A0>=C2=A0__late_initcall(/*Function=C2=A0Name*/);=0D=0A>=C2=A0>=C2=A0>=
=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0Signed-off-by:=C2=A0Boyoun=C2=A0Park=C2=A0=
<boyoun.park=40samsung.com>=0D=0A>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0So=C2=A0=
I=C2=A0could=C2=A0imagine=C2=A0this=C2=A0patch=C2=A0to=C2=A0be=C2=A0in=C2=
=A0a=C2=A0series=C2=A0where=C2=A0a=C2=A0subsequent=0D=0A>=C2=A0>=C2=A0patch=
=C2=A0then=C2=A0adds=C2=A0an=C2=A0actual=C2=A0use=C2=A0of=C2=A0the=C2=A0new=
=C2=A0functionality.=C2=A0Without=0D=0A>=C2=A0>=C2=A0that=C2=A0what=C2=A0yo=
u're=C2=A0proposing=C2=A0is=C2=A0to=C2=A0add=C2=A0dead=C2=A0code.=0D=0A>=C2=
=A0=0D=0A>=C2=A0Yeah,=C2=A0I=C2=A0think=C2=A0it=C2=A0would=C2=A0be=C2=A0coo=
l=C2=A0to=C2=A0have=C2=A0late=C2=A0initcalls=C2=A0but=C2=A0it=C2=A0makes=C2=
=A0sense=0D=0A>=C2=A0to=C2=A0add=C2=A0them=C2=A0if=C2=A0we=C2=A0have=C2=A0s=
omeone=C2=A0that=C2=A0makes=C2=A0use=C2=A0of=C2=A0them.=0D=0A=0D=0AI=20tota=
lly=20agree=20with=20your=20comments.=20Some=20drivers=20that=20I'm=20devel=
oping=20now=20and=20use=20this=20function=20are=20specific=20to=20my=20hard=
ware=20environment.=0D=0AThus,=20it=20seems=20difficult=20to=20arrange=20th=
em=20in=20the=20near=20future.=0D=0AI=20will=20update=20patches=20if=20I=20=
can=20suggest=20an=20actual=20use.=0D=0A=0D=0A>=C2=A0>=C2=A0>=C2=A0=40=40=
=C2=A0-1964,6=C2=A0+1966,7=C2=A0=40=40=C2=A0void=C2=A0__init=C2=A0noreturn=
=C2=A0__start_xen(unsigned=C2=A0long=C2=A0mbi_p)=0D=0A>=C2=A0>=C2=A0>=C2=A0=
=0D=0A>=C2=A0>=C2=A0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bsp_info=C2=
=A0=3D=C2=A0get_cpu_info_from_stack((unsigned=C2=A0long)bsp_stack);=0D=0A>=
=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0*bsp_info=C2=A0=3D=C2=A0*info;=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=
=C2=A0>=C2=A0>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Jump=C2=A0to=C2=A0the=
=C2=A01:1=C2=A0virtual=C2=A0mappings=C2=A0of=C2=A0cpu0_stack.=C2=A0*/=0D=0A=
>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0asm=C2=A0volatile=C2=A0(=22mov=C2=A0%=5Bstk=5D,=C2=A0%%rsp;=C2=A0j=
mp=C2=A0%c=5Bfn=5D=22=C2=A0::=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=
=A0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=5Bstk=5D=C2=A0=22=
g=22=C2=A0(&bsp_info->guest_cpu_user_regs),=0D=0A>=C2=A0>=C2=A0>=C2=A0=0D=
=0A>=C2=A0>=C2=A0>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=5Bfn=
=5D=C2=A0=22i=22=C2=A0(reinit_bsp_stack)=C2=A0:=C2=A0=22memory=22);=0D=0A>=
=C2=A0>=C2=A0>=C2=A0=0D=0A>=C2=A0>=C2=A0How=C2=A0does=C2=A0this=C2=A0additi=
on=C2=A0of=C2=A0a=C2=A0comment=C2=A0relate=C2=A0to=C2=A0the=C2=A0purpose=C2=
=A0of=C2=A0the=0D=0A>=C2=A0>=C2=A0patch?=0D=0A=0D=0AIt=20seems=20that=20thi=
s=20is=20unintentionally=20added=20while=20updating=20a=20commit=20base.=0D=
=0AI'm=20so=20sorry=20for=C2=A0not=20checking=20thoroughly.=0D=0AI=20will=
=20check=20carefully=20before=20sending=20next=20patches.=0D=0A=0D=0ABoyoun=
=20Park

