Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363903996B4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 02:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136314.252798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loas6-0003JM-4g; Thu, 03 Jun 2021 00:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136314.252798; Thu, 03 Jun 2021 00:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loas6-0003HO-1N; Thu, 03 Jun 2021 00:06:02 +0000
Received: by outflank-mailman (input) for mailman id 136314;
 Thu, 03 Jun 2021 00:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iI76=K5=wdc.com=prvs=781f10532=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1loas4-0003H3-BB
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 00:06:00 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edbeb396-b890-4a14-b2c6-599446b55e16;
 Thu, 03 Jun 2021 00:05:56 +0000 (UTC)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:05:49 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5333.namprd04.prod.outlook.com (2603:10b6:a03:c2::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 00:05:45 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:05:45 +0000
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
X-Inumbo-ID: edbeb396-b890-4a14-b2c6-599446b55e16
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622678754; x=1654214754;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
  b=kQ82Iu7hNbuhEAq2/85szvtD6O3kPbZWPpwckFWJpyEx6NNiG9tssUDh
   TrqjqAkwzjfIANQ7lif3+rtrXmbl6rSxy/VkxxtKjdEHj2TpGRlTCxnZh
   SjOklb49QffbEGotm1gc0aRO0AZc5qope/CTlhQRbFvH1wTPSnnxypsTB
   INUR++cB5q0xfF+/wc/NYEqWM+krIITfQpizeOr1LEaup6nM3XSwBVP+m
   Hj5ybL7UiYeeJAmXgbRr5KiyUvksgBqmqyIghdQRwhYNo2/IaCAxJ1Mxv
   nAd4isueXbn1eiyduQYFy7Vuir2YVXUFPn4MldrU4SawAnH8ght3BnSkP
   g==;
IronPort-SDR: yNidBVFfwP0++LZUETizwUBWEU+SN5FJSRje8d9L3HA9a4QVTuJ3JBJOnr3MIi9gFTJe/8eecu
 HStTZQKFFUCbQwS4FUr96K24Njy6EXoKXzzXdWil6RMp1mlvcZyH5L6EDrJGcuEI01DwcwTsMT
 pRAfIqTK9lzGNov0fGAd7mAjRIWGxXGtRygQBcLpHsPQyNrNh8eAPm4B6p63N0/Pve4ZLw44Aj
 5F+OH4wmt0QavYeTsh/8Wr2SfC0JwqhvrqLnTzBDcRmyBvK+vFVgn0C8tK5FZvqYFuYnCi5Zm1
 nbw=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="175227080"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3farpPa7W2fK3OCqmeUNYp+1WtoYCwnIe0Eyf8Gl9wK74y8kMwubTUPkPw87CpKGPTkcsCJA9J9RAqWtkUv0UsxxqhLAK8cWomOg9Z8zyFWkNN88YJ683LYV5ZYV8pbUm37peQBiPXd9wVZQI6BV8Q2Mk0dx1jpu9xXV42LBxVyNxRkheUvOrmRJ/9MRHFnsDVqos7b2uq+tIZK9XE9JliB7EBArVO2kasvYJfSumxfor6O+1vK0XHfm+mw/xkcErs4ghhwSLe4cIBVMajW0UxCTW3in0EIueBnaojQ8cfbavKhj5EpsgJ9OMufl55s65UFOw5crSiQWgCh+1b94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=SPf+169lZ4Rranyg6WH1JdhKDbAUaSshGdESKcqMmPHBbGpcq4V+phPl//qpeaC/DYlbh/8EhDzLHLeTEC+zWwoElyVp0Xi/AlW2/g0q2DrNxFSuHTWLBDNBeuU06i5v8Q99Pa3asHmqtqixTbxSC4f7rD3RpxOi9nZpQlptzvl/DuFwfPz1DeIX6f3+BG8I3nMxnfttIi60y3JhEM5xLf42wULnrsSEE2oj9mncz+uFj6xtd40VfngSmGBqLZ+gSPB/xc4YwVeUViYnUg+wtKXYBVgJF1Cv1LcybuW+jK+/MSMv1IzrVd2Gb7Y8Hf/7C3TFAvDRPaTQiM6cnkPQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=T+9a36hknCdvo2DPcnesnvQMhfho0Y0/EomLU5TO6dseSuE6OY42Ze5Cj51HfkCMU5dmKIdReUI5CcZqgM2t4/b0A3tomrcyTgMQ6g2QEB6b9szGMpVgTyTO334vQO/8TC2/JufqTsB97FPKYxMSfZ5pugNqxbTTzQXPdatyHjY=
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
Subject: Re: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Topic: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Index: AQHXV3xaE0d6OBaU4E62oTiV05BSaQ==
Date: Thu, 3 Jun 2021 00:05:45 +0000
Message-ID:
 <BYAPR04MB49659E527FE3E41660BF8589863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-19-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
x-ms-traffictypediagnostic: BYAPR04MB5333:
x-microsoft-antispam-prvs:
 <BYAPR04MB5333C6D28F1EA2185F1A07B4863C9@BYAPR04MB5333.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PgVZpMqfBZsayGo6qHKvJ/SMB0aIT/hImnkZMDwIUFSs6fwOxe2azCZGsLYYbvBVkWrtWNrUFQJJzeMe3yYffc8YIVjA4vJhqd1Caf+JQrgRrW8iANW1Fa/HwaSNBqVMprKX3CCOr3cy1gDErClF4rDG2tsRuQIz2DZ3wl4lpipsRdWqfqfDlvSHTzPfY8HoDivgfEAPOqwhWAHjZq+glqlqQNx5ZuMHtvR23EDC4vpH/CigaR+TRxEQ1bhZnCzeXwSFOfClGAgqWJfg/YHx/QfV8bngLaMNrTL2snvIV7C4DvRbbyIzJWr1cYbirk42HHX09WrOtimpQWxEpl3MisB8trOfqX2JC4rdBvIjkUaD0Gu3Vd4tNq18VIg+f9BmBccbQ2EtncSTV4CHGdMbjwxBRIamRH6tg8R50QDEz0qRt2ydIbwr9cXW2KR46pgExiN/N5aOQNkcSCw02up2UrfqPreq+/AlBpqOOFH0QCZjF3KTAPdUTp8qjmEkDht0hhnuAIkkoYSevA85lQXGgxc8PooKuHlGX+GrZERL5amiEUT9pgFbBzsgSZjY3DhUCUiugbACiQpYZej9ts05kLxaCUEKkshvgopZWtO9nZk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(52536014)(8936002)(55016002)(9686003)(8676002)(478600001)(110136005)(54906003)(83380400001)(76116006)(66476007)(2906002)(64756008)(66946007)(38100700002)(122000001)(5660300002)(66556008)(66446008)(71200400001)(26005)(4326008)(53546011)(86362001)(186003)(7696005)(6506007)(33656002)(7406005)(7416002)(558084003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?5if6RR5+OJsZpshEstylBHTMiQTdBTwGqtBjzZ62XGcAt8S+WMU1R6WAr1?=
 =?iso-8859-1?Q?a51eNNNlEJ+VJlKHkoSqcgo2gIBhqaOpnahoP2sexcbCNSfIQ/mT23Hhrc?=
 =?iso-8859-1?Q?CcZvGJdjc6rYcwPcGxufFVIXA4VuS9ph3bVkXwT1KWFzecVa9v7sRZjstV?=
 =?iso-8859-1?Q?M52hDeZD+OF2CXi5MCN0ahoxnPtEEWQo3uJ627FGCuiWRxi9hBI4zHAyQD?=
 =?iso-8859-1?Q?n4L880UPigYemTZh2skZ2GRBM3EuXNgIf5eMrwx4/9GRA3thA3Vs6/Srr5?=
 =?iso-8859-1?Q?mGAI4xuVrUjS5kqBdndpNixJAX1SDSM/c5pjrP6MwNVZHaAJQaWiqd/HSt?=
 =?iso-8859-1?Q?qjXLVs9eg3uXezDIMZbbFb3XlhgYLwr4Kg+u+oojFoO86BfCoFfj1SZaLK?=
 =?iso-8859-1?Q?3Bh6HvFLoxKb6fnftF5GncLxb2klSGgVkwEBvxlUdRyF5hLfy0GDhWEiwn?=
 =?iso-8859-1?Q?yvPwGUF1+TCCnVDjIV4TQiM/anB4IJYj7Pz6AgJfWV68HWhWQrmXTYHpFh?=
 =?iso-8859-1?Q?CcLN8OXPeqiXrlUWuJSE+dkeXO0N/nWPs0Ztuv7AkzgDScv3MyeGOeHz3Z?=
 =?iso-8859-1?Q?Ao7F5TJClVo4s6Ru7csKZuy6fY4JU8hhN96B8/sDqt2aBqhr72Hc2stfoq?=
 =?iso-8859-1?Q?cWadzIwd6WVVg+F9M77H9ekG9yiSizSPk2biwRViJxMsn4pztStuwmqKi1?=
 =?iso-8859-1?Q?t83Qs/txRM7vkASOivFSKQe302k3TlOukOSYea41yEa1Pz3i6oIZnZefgv?=
 =?iso-8859-1?Q?NSQw9pYu9oSKGJ25XiFKSTq/j7vSbzks171YHmv9mcMt6wP8yl4LLXxCen?=
 =?iso-8859-1?Q?JXD+BD+GKbVnjs7pZSk99T99q+VCUnMr02tJUq6IfIA+Cq6AX93Q0L3v0A?=
 =?iso-8859-1?Q?qDn95YKDo18n5brnbC8adwYqFb9BWS7i9plCtUA5iAEgQG7cWDB/J/zCCE?=
 =?iso-8859-1?Q?6bE/YfhBuXNi264x616FmYWOFFz2gRTXVHBrqOmgFcjq+xeiwfUiLM3iIc?=
 =?iso-8859-1?Q?vQ1xF8dWT4I98ziJWB64LXJLu3oqZn592OlCv+12XP7AcL+hRIAMmaOLMh?=
 =?iso-8859-1?Q?+DjXC7TFUoHipM+C9D1rO1BB4cTG/35uwiag5HrH7/d45WzZmSsapFV0/+?=
 =?iso-8859-1?Q?eJTfrX8aYrolI4CV0AKZjhKyK1qJrHy2Iy3J4immKeUbAWIyN75+vD6817?=
 =?iso-8859-1?Q?SqCiq4gw9a0EywODdNX5I5vEzTROvlrHITNzRWZn3S0uJZceVLoeMQyUCr?=
 =?iso-8859-1?Q?1vuXs9xwNnyBoHWVfCBl3SNUv4bBHzezF7+hWC4DnOm+Vdn6CRvP+5sOy8?=
 =?iso-8859-1?Q?lJJ8x7HTy3feCkYVRWQwWhhN2a0eI7ohaqFaqoodESTjPUs1PcbecmVk6E?=
 =?iso-8859-1?Q?yOGxfM+lRI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:05:45.3613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZUf1SLT6UbGI1jPGaANmbjvJ+IN4ZVHUWumZOErHa4bTyMMnyBgRVRLyXW59SgP4r+36OBdgMCcwGD5GqSUCjl5bim8WN/7KVvAoUqr5pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5333

On 6/1/21 23:56, Christoph Hellwig wrote:=0A=
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and=0A=
> request_queue allocation.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
=0A=

