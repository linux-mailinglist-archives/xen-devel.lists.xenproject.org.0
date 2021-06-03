Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B03996A4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 02:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136307.252787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaqv-0002hL-Po; Thu, 03 Jun 2021 00:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136307.252787; Thu, 03 Jun 2021 00:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaqv-0002fT-Mf; Thu, 03 Jun 2021 00:04:49 +0000
Received: by outflank-mailman (input) for mailman id 136307;
 Thu, 03 Jun 2021 00:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iI76=K5=wdc.com=prvs=781f10532=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1loaqu-0002fI-6F
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 00:04:48 +0000
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00218d20-561c-4b5a-83a6-6b6f4852c95e;
 Thu, 03 Jun 2021 00:04:44 +0000 (UTC)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:04:41 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB4327.namprd04.prod.outlook.com (2603:10b6:a02:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 00:04:40 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:04:40 +0000
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
X-Inumbo-ID: 00218d20-561c-4b5a-83a6-6b6f4852c95e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622678684; x=1654214684;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=JsHf/1Axy8NIVPTHTN8VhWztYXay/VLRowokpLJcqck=;
  b=IeuzuMtn6lfL12Y1oyTV7D9z8zsjbu3Y3VjFGQJ+xx/viSR2zu5G5MZK
   MuyxAGMW1S960jpgE7SnmI7gBuwLfmkTbqYMy5QjEtaoj00NPpRgWbm7N
   bGgHBkPh3BfjU6eOm1C4GzOswBDl2ppmRlFXqqwiYYKqfx7kNLOHd9WU1
   rjMkTM1pLniGsDGuFRNDXx0tEI+sn6WyFKGJRmaGwJl1oJt/F1IjZxXIu
   nBmgz7ntQAnyX+X11ai2zWnZSLCStIKvG3deHR3EDVGOYBWUVrD+qbbq4
   S2yDXRka9hmTgAD5/0scVlmDyZf5D4sC57ReMtfIKH3SoP9nxGFeiHKV6
   g==;
IronPort-SDR: ebw43mH2wu2FVzDe3CjkBzn4Ei7G+EjMxL1XQCiLGvLghtxtAihVBK60Ry4k6dJZoGvWftqxQx
 JOxIS3UCpRN2nS4HH4Wm62h5r/EXDr2IleQUWCOCR/JGpCBywEbCpx/GYC9uZQTvIzMAY/7JSH
 sPxA5KUAkpdsPbOLkpRJC2kmm7YhOtUaHvJAMReu8KGWbm59+VPjQl1w6dFeYukHysBBSKN2Ve
 8tYhz5vOkifIjUqABb5q55MhEGp3sZwGNZ6DgKlv6nCCuBkSJ9uc0nsucgyRpJuUIvp3lIHZjf
 jfg=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="169781069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJtQMdjSGlU9zr7fdXms/aNN47eZTdSoCBCApcEL0PtASUgfDfjCMYlhPRY2y/zV+Z3iq18wmyi5mg7g9hQBZtxY8a+JUDw6cltEpo0kPEsJXnXgMrkMfkxOMVG+nbm45hM0P/cSF67WJoB8NAmVNCZrP2V3w8dArnTEctQvjUHw4ztJFDnfHnWz0hu3t/rw2kFdhMPPw5c2UlAdm4B6eGVpkMNMseBHX456sIBh6q7gSvBKf/WrFFvXR1s+W5q9k5fKeQro308nYH0hS+wXct/3AKNtYWFIN7vg/XYnWUW9VJs/kfDOdqNy7kZjsSrDGCLhTzHly6rsiSn1Fc+ogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsHf/1Axy8NIVPTHTN8VhWztYXay/VLRowokpLJcqck=;
 b=aiP/54PxULlNoM6n6CQST4W7itbWct2dQDVGYay6LJjpl0DmNR2kDWKxRyITK4KYcXlhF6NwBKHn0M8FWqEcmKugUlRkjqzcA1OZNnrLyO/perxG9Y/8ACbvopDrm+c7T/biR6C+31kP0FC9DaWpyxrNOIJXTzWCxieo2RYdG5VmDFpMnzKKYOOdNj8I7eZTQWurbBwyz3KzSQohh8826lf2gpO5tidl6DtL9gRFxgOOf5QhVa2KZG4pcx0AQ1RU07kvUc6QtuLfcG9KuMV7CxmCSyQ5LZc28cf672Fh4xAwxN3Hs2qeN//ntn+13mMkaeOiA4JIQ+mMYSsAAZtEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsHf/1Axy8NIVPTHTN8VhWztYXay/VLRowokpLJcqck=;
 b=o4MEyHLHCXSgfcOLN7a4YzvzZiYc16wAMNH0jfPpwWdUV6uxnuENNm5NmTY/yTjM3r9ZaQhLqSs6XktKzW4AGIJUzaLmSgfRZVcSLGLMYuEM+1NfY+4xSVk4n5MpJZBirmaOkr0h1X1u0gaRZewleJMLc/NczpwD60eNGIJy7f0=
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, Geoff
 Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>
Subject: Re: [PATCH 15/30] blk-mq: remove blk_mq_init_sq_queue
Thread-Topic: [PATCH 15/30] blk-mq: remove blk_mq_init_sq_queue
Thread-Index: AQHXV3xQMWTzcORnaU+ja3Jg+8O85A==
Date: Thu, 3 Jun 2021 00:04:40 +0000
Message-ID:
 <BYAPR04MB49655D481F62EC6B18851664863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-16-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bfcc48e-3abd-4db8-6f0e-08d926232f0a
x-ms-traffictypediagnostic: BYAPR04MB4327:
x-microsoft-antispam-prvs:
 <BYAPR04MB432747C9EA426342BA62CB17863C9@BYAPR04MB4327.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:264;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OwlTDekL7hwVlX3yba8Ek1cv4FkIZ+J/j/U7PpRxk3Z6zrPfxqaRQ/6AiAWI6itDIedVIjJ4P/W6bUX39lZ2ip5zMIJKqh/05UJFiYDK0MHvhs3zwpQfoEuMcStyuc+BhYT3uhZsYNCV5TRGsPl1mVdrHDJHNUK/lnYUVaNq18zgAKrkZgWciffi+4Ct4NP+FrvuKJBY09IU/uEQS7jNKhjCPUomKvV4IDaGxtSLwTxeAClzhi4eQiw0GPVya7qEaQM/q/ln+bNXhz/29w0KskRN8mdsz1KsHZK5Wi7y9lhhkhJxVlIpGkSQQi1C/wH9xLSHMVY/czRUmhemuQgI9mrZwrqEYSxFRBZqYF9nBuYYojd5+NfTx96l5e8yF1s1RLlX/9qJOVMIHDexCFN+i31dlDA7DF0dmZ2/iCAPgohvaeWovxNq4Rs8fLhuGKQZRGCJImFLnh1O6su/FnWQpmXnnZG2pvixy+xVS9twADWMTZjrp+bazYZMMY9QOvtp8cHrJEmOs3NgxMOurOKVxCnY+S08l+wpqukQTwR+6u4/Fs7Q3dxoc5sjB5wMCN76ZDTbK5jXcT2Ri36g36QMsPSeemPqnZuApkpWXEteLkc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(33656002)(5660300002)(4326008)(76116006)(71200400001)(478600001)(26005)(558084003)(54906003)(110136005)(7696005)(86362001)(6506007)(53546011)(316002)(66446008)(66946007)(8676002)(7416002)(2906002)(8936002)(55016002)(38100700002)(9686003)(52536014)(186003)(66476007)(64756008)(122000001)(7406005)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?sXBdSKO61Lf02B48FKieGFHblhseRbF1S8+N01teottA2vv4FPCBtM2yB9?=
 =?iso-8859-1?Q?XuUTpza0ekK5nusUHt5kCqfwFN2O5ZfWqhm/HvpU5wbrVuAM6CRKSv1Q8o?=
 =?iso-8859-1?Q?493jUsBfFTaybWgE3BvjmA6N1jgye1ieRrBSOhD5nIzKRyFhegA+arODHA?=
 =?iso-8859-1?Q?FlH2T0XVxASIf6HpXWyyUjimqoacoHO43o+zvqgY9LAMiLl6sZTx5ykxLI?=
 =?iso-8859-1?Q?9toJguC0kpLfGurgmQOEsXj0AoM56Q+PN9b0PMkSX2Q1c8ScDaODM/7SBE?=
 =?iso-8859-1?Q?8PTOuPFzV+yaoiBD8f80N7tu7GhurIw3pG7Bg9AFQGYDhQD2WU26b58w2I?=
 =?iso-8859-1?Q?Gv3dw8qEAzgviFHj13iNNw4xEqq2tRmkz3QVUXXytYrXqVEafD+G9VJqbB?=
 =?iso-8859-1?Q?s52QR5HjBEj5lGencIoh5Cl6NhjU4kNoZinCLbd9EjobJvldk5IsU5W0v7?=
 =?iso-8859-1?Q?g7VIGxQMLLy+r1hAQPlEcRk2Wg1fhSDZktBP3O0h06bevoCyqvJozek6BP?=
 =?iso-8859-1?Q?6LAuU3XD9WVsw2mscsTfLxgIaSIt61R4l0ZA1+zhETsef7TZJ2DNPYoU9I?=
 =?iso-8859-1?Q?FFOknBNl7/2GAJunTPtDmm4XfaUNWAlnBmcy60CWi6KAWSJ5SZSPuADbyr?=
 =?iso-8859-1?Q?SNSZpjVZoL19+6Nr814QO2QrDqrd+dqS9rsKQeA7YOBvI7lQ0pMsM/XzGA?=
 =?iso-8859-1?Q?8pXBgAk7nzszU9rWKNVit7794Fq1L3m2LgiQnipR3sVfjrDHZft59UCLn+?=
 =?iso-8859-1?Q?fy53ydFRCfRjXgZ3RP/S3WJKMlOYT7n82HMEwGJinb/62Bf6SEa32rvTRa?=
 =?iso-8859-1?Q?FTwCf5r1mrCWYpqg4FwfMxekYF3n+eFwNBx0KrzUtYQd2mPslvonATonaq?=
 =?iso-8859-1?Q?C4IPG+mOSIQ81l3txem1E+R3J1wqtctKPY78n8yzz/Oq8OSwmwsOhok0NX?=
 =?iso-8859-1?Q?zdSnsADCpPu7b8GWyo5qAbD0EqGLRaEK+xJ0gRau6IveMgKPfeq0sc9Gc0?=
 =?iso-8859-1?Q?gI6LxtYoLRuSYQq6eHsUVCLBkWI5ovkh1UD8wFwszHN1qDKKxAnUXO1FP+?=
 =?iso-8859-1?Q?WxWMRPNwY+4YLTuI7AowSIZ1cdWwy5/WFsVaQ6i4PJUYE82JiEYOt+DbnV?=
 =?iso-8859-1?Q?ssV0J3WQW1yxgCaVSMpmWTxHoP6ixIG+fQ/CNfSM2Az13sEt8eC0ifz5Mu?=
 =?iso-8859-1?Q?kYX/IW2WXIstjvnGTqmoxxnjCKrBiBfsTBewNwain3nS5c6Kl5irUNkpug?=
 =?iso-8859-1?Q?xXIiDzf7Crei3NiCtcPCOKUhQoIDYvZryCIcOZfJ4ZF6lM+w/EIVOrZc09?=
 =?iso-8859-1?Q?Ilaz4K/hgpGq0m7v1MG+JZzmQarf8efzkXl7zSU1311foEViZpmHCaX4If?=
 =?iso-8859-1?Q?mTD76Vxg88?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfcc48e-3abd-4db8-6f0e-08d926232f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:04:40.1871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PssMItytFcPuGJZL4oAW8jZKgJiD9CYlBtcjsvIe6eLx9/MAyQgmZKucAPLHbZG6UuQiJ2t+88piZpNQvn93QypCEVRt8ai9TDU7EOe+9+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4327

On 6/1/21 23:55, Christoph Hellwig wrote:=0A=
> All users are gone now.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
=0A=

