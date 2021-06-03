Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AF3996D0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 02:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136323.252809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loawK-0004jO-OF; Thu, 03 Jun 2021 00:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136323.252809; Thu, 03 Jun 2021 00:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loawK-0004gF-KC; Thu, 03 Jun 2021 00:10:24 +0000
Received: by outflank-mailman (input) for mailman id 136323;
 Thu, 03 Jun 2021 00:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iI76=K5=wdc.com=prvs=781f10532=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1loawI-0004g9-Jp
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 00:10:22 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63065a2a-1822-4784-a8ce-814f9914e375;
 Thu, 03 Jun 2021 00:10:20 +0000 (UTC)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:10:11 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (52.135.233.89) by
 BYAPR04MB3861.namprd04.prod.outlook.com (52.135.214.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Thu, 3 Jun 2021 00:10:09 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:10:09 +0000
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
X-Inumbo-ID: 63065a2a-1822-4784-a8ce-814f9914e375
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622679019; x=1654215019;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=wST4v/KFEgsD+AHxp1B4bWyFrtO8jdP6tx0B6ojMsIk=;
  b=Frm1x8/pTrXp4nPxXGLuIO4P8ItJIPrCN46Q5/J5od09/hvLjK4h6wgm
   E7jqhfx3z9wk04M+Ne5WHCZO9P4ddU2r5pZQ+cfJFnwEDGe157cYO+wbl
   G0KtJBtkVh/lQPcTBcDXCjFcZTLuRWT2B5Qm+q2b2U73s8OrtI2uG+AkX
   Vi9kyZ6T/lEc7XfhfbEwvWzKhiGVg1zWoBcY1I/LOZZXOJVjECrKqrM8U
   Z+JaeNHV3rojmfduPnDyIhiTPgY79T7gqx6kFYkgSC7QZDDWIjRmlXOiE
   nPRqNOdWNHA3nIqUq4o1DYzgGfNN7F1GXHvIPxwhGsN1RMOXDi8nQersu
   A==;
IronPort-SDR: ZmknQuXoCnqDkfa8f/gIpbwcqsW3uxFIdkG6PulXIRgvre/V1WSuqDOxsKpr7HB12BBnz5bTJF
 dpg6fDUUhyjirRV+af+X4alFqYTr5oUWRrXWqVj5ekEdtvmwVj+iPCU5w8TuqpEHShe0SuLgiL
 quXXMMlt2JVZSIA7aAtVVNAi8tyYF+2kfYxk/N6iv7SP/zPHjRDhX0CIr4+aYsc1qKQWQ2lLfF
 1pwuG0X1Xj5/5yCDRAXWwP39oIHSazLjYk9RroQcS6fksS9XrRo0mCaN9h0b4MGo5ClYyMYoxw
 /BM=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="170510803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZLkwwoAD3gpyISBgdewagHua+umfTEXtt8fAoIQQxNtn3TUom7xGUlGVNuipekFI0LrGCtbcCOV6ybf7lgaQdxpzQZR7FVbCDUnIbEpwTImjwvqO023nPEx8LkjaRijDWaljEKaXFOI89FOGmhTA1ygVl97J+abx4sdYDQy420hpP9+vDjvGyTPwXanYpLR0hZXd9vvDvSATaLjkEu8cVVSuhNewa1/xZkA9X79wGbXzFcqw7097MX0VwzkbSAZekKsjiqEIxKXEcqBecIiFNnG3hTuRkfpOoLt8e2lK42q47i2H47OOOqTv3q0niqmFkO4WW5SeUHAE3ZC+SGdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=Y1+gV6oRpNBiL21Ns+WNrmpjHEagZm1EmHeba536kJYVWO5YSDDjpQIWIuLpb/3RvlQI9ysc82/v+EAZfxTla36zoWNGankQMBKMakzWzWLF8qF7Bun2UCq2wwVPc6rREOtUZmR7z/cUzttOUByKjIb8I5fernx5zRfxxA0bNHO9j9ueuOUG3qC5VaPB9CUJsQkNOKC0NOJw7DMV3X4v7VciGfv1irqIiISjpB70d4Kn94PTHhXF418Z75v06CxeAaguvL+ehlq4PJPP+jZmTlpeiW+8JGSTZTQTl3IYrSNZ/Uzx8MRTX8va8QvEquSLHkjRJY3Z6dJX1QWjQp+bAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=KgmidU1Fw+7vpB9Uzsgux34KRcjT0kIms8M8fzVN0CdXWWJ12qjVA20G/kSPLgv3NQ7/mFf9/CEh7zLOM35fNA87mB0+qfmluO0klyMoHw+EtkWs6uJNOr7IH6rYQcWAMIBIdNmK16NxQlvi8bCPYnuCbqX9TTBnDgMXkIhqF6Y=
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, Denis
 Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh
	<tim@cyberelk.net>, Geoff Levand <geoff@infradead.org>, Ilya Dryomov
	<idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang
	<jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mike Snitzer
	<snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov
	<oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>
Subject: Re: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Topic: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Index: AQHXV3xgq8Qh2KPeAkCUNVGDF6BX9g==
Date: Thu, 3 Jun 2021 00:10:09 +0000
Message-ID:
 <BYAPR04MB4965DDD0F4479F5B492A30D2863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-21-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 410c689a-bed7-4693-4767-08d92623f325
x-ms-traffictypediagnostic: BYAPR04MB3861:
x-microsoft-antispam-prvs:
 <BYAPR04MB3861AC0DB66ED1C3B922E6C3863C9@BYAPR04MB3861.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aSCUd3+tO2dW2W0V3W+l+z6iJa3IoJNFdybg9gYTu9cedQ5lLVvPpm91O+dgVW8ql8UgQUxU6WWy+SnXx4hkRSkEbO+Bh9nDVmSGwmMOGkQ1nHjaRH0AmmcUwOEgU8PZj0bie3HHe1HkTiR9t6S8uH0KYFxKuxPIpGACKfziR9SdgoJQgLBMsLpbcl/XMriIfz/BZePIx+YXeYb0iTZg1zQtisRQ8BHOzvcW9ojTtcViOSd0wEtiPtkPj9ECItd8k4g/tUkuJBZ4Atf6k6pkELhctJZ8WJ42PKiGHu8LVUlUFVPDN2VXhagXLymt7dDZFFWHppkOKUONGWiIdwRpSsODUHoao48cLNskAR6ZEXegvXyqzYYouET3Q0OIYmUwslAg8gnSfVyx+RA2Rzpr2haw1NRfeR8epVcIitoaVUWk4+eJMy/yHTuFQy6ansUVygucOFjq4n5CAbUDWG6Ze00DEqPbx1sGyplv+rZCuJ3RE45DyM89gvL+b6fQ1xcV3jiGTFdg5yKmctnZmapwoPLqBzlIAqKUQandH72F1kQ2EMY5/mqgVQY/NPHh71VFoA/EQHV29oPgt9v0n+SjOM12CltqYJUFiycBsklsHDQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6916009)(55016002)(9686003)(86362001)(52536014)(54906003)(8936002)(316002)(26005)(33656002)(122000001)(83380400001)(6506007)(7406005)(5660300002)(2906002)(66946007)(71200400001)(76116006)(4326008)(66556008)(66476007)(66446008)(64756008)(38100700002)(8676002)(7416002)(186003)(478600001)(7696005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?tOMRmQzBu9HBrmE54pFYwQCAZwjNFQViLIYp42OXhgbm6VKfnHeKq6ibJR?=
 =?iso-8859-1?Q?XVtDPmSP9FYrKIi5HErHCnz8ZolVYTOTq88vxqGNp5E8WT++gvcDXHWzfQ?=
 =?iso-8859-1?Q?7F22uB4d6Y7jZld1kooNlgaZuhcOZcWVK5jZsiQX+Vnu5A/I0GM6g6pXG/?=
 =?iso-8859-1?Q?fANsvMtPVZl4OWLL2+zaMRzi0z4pS0r4jQpoJHOglAaZtuCNoz9bScDYZd?=
 =?iso-8859-1?Q?AEvlPDPcaU86D30vRAfxCysnlB1/4/Jt1MXUWHSmp8VPpBXRNLlDGEqQxm?=
 =?iso-8859-1?Q?yjCAb9tCYwQfYIz6bHAigje3Yd7B2eiHgPvxT0MqDL2+eflNzyXrCr3o6r?=
 =?iso-8859-1?Q?8UyJSz27O4zzS/20AtH04M+SPYCu8ZwG+hkW9ykY/xrisflV8VjyxJNEKP?=
 =?iso-8859-1?Q?syxQYvDaTwngygKAaCnYFDz2soLqZOyR3u63/D5w2gGDjyoVdakYkl5JrT?=
 =?iso-8859-1?Q?9Vs+HX399Av3uvglcvTgN0NDHBSxG2r2hLTZQIlfUdcTJgqbjEEbTzHh6i?=
 =?iso-8859-1?Q?f5IcKkyHFjcXOS8rdDFlqyJhhOXgloM0oDOXQcVVqLJJYYU8BsOfyIdyIu?=
 =?iso-8859-1?Q?pUOu2kZO3V6uNs6z5PMGZkekzt+S0uxCreJuGgQrKkBZMs48NO+3sbdnsU?=
 =?iso-8859-1?Q?4c6IMFPVWUid+K4P+Y26m0ZmGTZvgHW7EkcU3dFejhLkpHrBxNr4AXEZ2R?=
 =?iso-8859-1?Q?4TZn363tV9qBc7iYebk3NLvLRw3CV5c7IR84da+AVEFOGpO1yX+IYrvoJb?=
 =?iso-8859-1?Q?t7O3F27g+Q5KnNOqFYGbyqb35w7zFyF8QHTbKK8sldGZ2gqzSOBQY3lCLE?=
 =?iso-8859-1?Q?apO2p5Ip0z38niJbY5R/NGjElnkFYxnVQfDKaCjVIIGmhZWgLnu4hiOqzo?=
 =?iso-8859-1?Q?L8+IQB2+pqtlGfnUlBmSIzDBc3+49PFeL2MsQlwM5E9n1hY9qPOUyqbmET?=
 =?iso-8859-1?Q?rpcgr9YIpy7KXg0uR2TRn+2BeJzIBgIqtRJywgwZgA+B8CJ3RwFWYeL1n/?=
 =?iso-8859-1?Q?hY7Q7ycu4z8lPJyJAlsshldtZCy3E1sv89KZsNPETY4AQEr3vHlaaun+xd?=
 =?iso-8859-1?Q?vgyqfQ9WCG1L8tMRnzKsqh3RlrakY3XIEVU8StpIxjZlCsJpMf83zURXip?=
 =?iso-8859-1?Q?9D/f68Z33Hy6P74gkVsgSBM+9qbr+SvWM25poIJijA7qHdhsegGFjmiBA1?=
 =?iso-8859-1?Q?lGWdWKKQOqEX8dKOfdNFEOHYdtB9duMlsdbxaXtMAssT2AMavt2G7XtQ6I?=
 =?iso-8859-1?Q?isoClhWwp/3vVg6ae+fZei/Sg1PoAPAHoD6EWQaKtiyFmWRy4+3YFr/Q13?=
 =?iso-8859-1?Q?HTATyFL9dJB3hIn1M5qIgz0y2yIG8dpT5nMVQTnH8b/gBTJhn1ETaotnmi?=
 =?iso-8859-1?Q?ckYH8Sgs2Z?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c689a-bed7-4693-4767-08d92623f325
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:10:09.2084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: csvqD0vw659M62vyGjnjyxGD18c3A93cKZHc7kill9AefsspYbo6IxhVdXG3I88JuR8UAroB3qRvmH2ffepP66pf7ZnPFJxPeY8tuhTHcyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3861

On 6/1/21 23:56, Christoph Hellwig wrote:=0A=
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and=0A=
> request_queue allocation.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
> ---=0A=
>  drivers/block/null_blk/main.c | 11 +++++------=0A=
>  1 file changed, 5 insertions(+), 6 deletions(-)=0A=
>=0A=
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.=
c=0A=
> index d8e098f1e5b5..74fb2ec63219 100644=0A=
> --- a/drivers/block/null_blk/main.c=0A=
> +++ b/drivers/block/null_blk/main.c=0A=
> @@ -1851,13 +1851,12 @@ static int null_add_dev(struct nullb_device *dev)=
=0A=
>  =0A=
>  		rv =3D -ENOMEM;=0A=
=0A=
Is above initialization needed ?=0A=
=0A=
>  		nullb->tag_set->timeout =3D 5 * HZ;=0A=
> -		nullb->q =3D blk_mq_init_queue_data(nullb->tag_set, nullb);=0A=
> -		if (IS_ERR(nullb->q))=0A=
> -			goto out_cleanup_tags;=0A=
> -		nullb->disk =3D alloc_disk_node(1, nullb->dev->home_node);=0A=
> -		if (!nullb->disk)=0A=
> +		nullb->disk =3D blk_mq_alloc_disk(nullb->tag_set, nullb);=0A=
> +		if (IS_ERR(nullb->disk)) {=0A=
> +			rv =3D PTR_ERR(nullb->disk);=0A=
>  			goto out_cleanup_disk;=0A=
> -		nullb->disk->queue =3D nullb->q;=0A=
> +		}=0A=
> +		nullb->q =3D nullb->disk->queue;=0A=
>  	} else if (dev->queue_mode =3D=3D NULL_Q_BIO) {=0A=
>  		rv =3D -ENOMEM;=0A=
>  		nullb->disk =3D blk_alloc_disk(nullb->dev->home_node);=0A=
=0A=

