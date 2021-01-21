Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D022FE884
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 12:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72013.129415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XxM-0003mQ-0n; Thu, 21 Jan 2021 11:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72013.129415; Thu, 21 Jan 2021 11:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2XxL-0003m1-Tk; Thu, 21 Jan 2021 11:16:51 +0000
Received: by outflank-mailman (input) for mailman id 72013;
 Thu, 21 Jan 2021 11:16:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDH0=GY=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l2XxK-0003ls-A7
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 11:16:50 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 234345bf-6da9-403e-a3ea-ecd4e7a1b8e8;
 Thu, 21 Jan 2021 11:16:48 +0000 (UTC)
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
X-Inumbo-ID: 234345bf-6da9-403e-a3ea-ecd4e7a1b8e8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611227807;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VklTyZuGizbum6w99L4eNi0wJJjK1EC197pvzbHUKFk=;
  b=CHVclDEbla9H4A+z3LTGAfMXQyJF1Wt5kaYlb8y4Tm1Wz6aeSeTRNmtE
   8SqBevPgm0zuI4eSSACwGwapPC4uZsDv3/+I0MQhhFH4A394+RrNeZplc
   /k9ZK/VOF3/YzWBnDHpaFxYmMB9IhkH4gZ+4QW6HTrMzFtwng8S8VdR1d
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oZHr6zYoxWZOPj3HmHvXgLESmL0ifOxPXxPf0D3rm5dYAZRk07OFg1GNFsEV9ZhURDvQfTsTwn
 7sOuj1Aanne7k9JCEbzUvE5SRmIj+H86Kfe8AjHyEVwPIAWe5Ki/ietJ+PpjrNQ/ML+/mv5xVe
 KjKfdb5wsxAqYlIiODdALtXf9CMyBPplsak4MVCNf7bz38dx/AVyVzcPoHVSa0Gefa1bQ4KdVf
 uZP4V2DNsWRk6d6rF/p2Bwsz38w+OfU/GsWxsCBb6zG0h34gXD+OaJ131bQMSsNP5Zgck+1AjC
 dcA=
X-SBRS: 5.2
X-MesageID: 35756533
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,363,1602561600"; 
   d="scan'208";a="35756533"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyBVFVziHPaqpZi8qsfW8MzsUZXBwOIH6Euoiq/2ho76FgmZa/wN2A41/znA1kOrE9Lz6N+MeZdv+8yIT1n1jiGMsDBBRF9GCjSw0Ts61wbAqPu+r7zXQ0Ul7A0G4qRUOxBDJZeaxVM895Q0gBvOIp4KBYkaJDot9lei1Yp2w2wDtPL21O3nM66zh3bJXxSxKgvpDYd5++8f0HOYdb3gkvbLObxTFjn60kBE8LhnkcMku/q9aHZRgptDQW2AvtRMfJsYns96MGR+iNNy0fVjoKAhSRgs6tUqBCnLZxOU03njnbPf/lqqNrZ2Mjyr318RtaJKBJBi7lBhBYVY0E/EZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yaq+vDv3ZxCd2i5vHysxP6tcHYXnbymqihh2CiKAqNc=;
 b=Gswgh9mMs/Fc6OCHLQcMjsPDVC9bGNGhjcGvf4wIqEAxGmBXm9G7cTUhGsV2Qb28ZZUU9mDYNnr8GvwrgCfRovWAIYIpg4orRF4KJULdFZBBzFMdaf02iy6s+YWd/+8xmcHioLWKZgyf3p/F+tTaW0762SSLeuDsMdqw/kPkpqG2THD3omy4eXYyJC5zjdadjsLywDhpmbJdtAoXPzqz3ru89w+vY91lt3a8svVkw/lYGVdR9DGgVoPz3XfMsRxCr7viy1nBOa175UQMNmuyUu6FPPmXkWo4iMWYmyacFnLOtBGvvwj/6aF+hUfqwIhbUcY7Zj5E8hpLL/0w0ofWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yaq+vDv3ZxCd2i5vHysxP6tcHYXnbymqihh2CiKAqNc=;
 b=jY+jBiL9zmFPoei1Dgk8vLO8IaNFRCXv7tqe9kaw84A3mh9k/AdEZGfml0PR/MqvS98koD57sWxOoduCKpFY+HLJGsrL1MQ80wJZI3lWF+x67KfUqP9rp7xjimc/VYxtMZxMZnb2irdhaJly0nswW8YPMD8DOQvYeDNSg0fjxXY=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 0/2] tools/ocaml/libs/xc: domid control
Thread-Topic: [PATCH v2 0/2] tools/ocaml/libs/xc: domid control
Thread-Index: AQHW7+bmJvGO37PoO0KsXsEMB9+vxg==
Date: Thu, 21 Jan 2021 11:16:44 +0000
Message-ID: <MWHPR03MB244523A4F41852F64B7856FDF6A19@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>,<cover.1610748224.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88cd6e0f-5ad0-4266-fe60-08d8bdfe0948
x-ms-traffictypediagnostic: CO2PR03MB2135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR03MB2135CAC307D9DC53BA4CD9CBF6A19@CO2PR03MB2135.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: znh+5Gh/Jv7E8i47rQHME/p9JVkpja9zOcF2wp7k7nZeFVXowvqH272b6Zl3XAeGMekoVoXLYxW35HEDJW6wVL7O2ho+pI2xakfUVGw7wiEuxWD4NA7qTZqBB8RjVwWbEIZMew06X3QDgpn+CjZox90oW81GaR2YJy875tAhKw1PxZRHFYw/fUx70lH7bcXG2XY+kuQR0bKz95PKBXCLpQf0wyXNbzdMGBfrd/nJqN6LlvFGUlBezOvNT7k3UEGMN0ohqzZJlI1T8gC+RGkAdMV8WY/zFVBYn4e/uv2bGXdWDDndBPHCEswuf/1TVm6e+a4COdkmXv6Gd9JPm/RAoraxbyPRuO4UgZctFBcwPTS99Xvv9gffLYoX9lIQiccRu9ViKfuMHTguJ6hhw1B3C1iEKkP9DL7JuS5i4HJQaWhLmozrBIEhqETX8S+gavW/RSI7B1V5uHXRHL9gu3uzbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(83380400001)(66946007)(44832011)(8676002)(64756008)(4326008)(52536014)(6506007)(53546011)(26005)(76116006)(66476007)(8936002)(186003)(91956017)(5660300002)(86362001)(7696005)(33656002)(478600001)(66556008)(966005)(54906003)(2906002)(71200400001)(316002)(55016002)(110136005)(66446008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?4ZYbG7wWaWrFphoGg5aARqbfnuLRwn1kQ9ui5Fj9I8PdIJcErTHo3JyTjP?=
 =?iso-8859-1?Q?ZAyBTDdPPTrB4ynZigObqSy9rIcmswZlSyca4Z7KrgJS7atzObESXKw0in?=
 =?iso-8859-1?Q?zQafli3dg6bsw3Vjkm5bOUMSAqss7HE8rSxXlh+7rBFsfmapkpi2o3oHoZ?=
 =?iso-8859-1?Q?nk5M0rjJAjL7hIY3vtxK5xLpprldYMVVSt4vefL+dgNEgBJXORI6LNtLab?=
 =?iso-8859-1?Q?ohguB+i488A8PDBnzUwOYpN6Z3R0/ykUu0XPNX2lbYCwGZoft8ajRfF1Sq?=
 =?iso-8859-1?Q?D31sa7w3HLl8Hnx6A0ivk4BWZmWGspzh4aMeG4B4NHg1b45e1Yq+Iwustq?=
 =?iso-8859-1?Q?E128d9azTwU2AM7U7J9U4qnCp+2yuNTQe4mxzkKZY80tDbrYZyFFAQde56?=
 =?iso-8859-1?Q?Zuyrp/yHPdp/HGynM4ypSpfKV5wIWWdFsAYOO/gD8gPsYGYhYUOrPsacW/?=
 =?iso-8859-1?Q?qDVB4Rnws+droP1LGBw0BA/m+zUBFsPjGIzizd+diqWSsEJh7kPH6irHfK?=
 =?iso-8859-1?Q?BK/YGyzaon3t389Z89HJG+TTJjnj9U9HR3nWRtVp3uAOGAsk5vnQTT++17?=
 =?iso-8859-1?Q?FlVDEDw1w/eo/wqmcXCPiIp/06NNvd9YcW4ZzYoSlVNEXup2Hgm9Dc6jGt?=
 =?iso-8859-1?Q?qvyFbMH360PbryZRh15jAXIq4Nt6iB+cRyY/ORnD0mIXI77kaNw0pp77tv?=
 =?iso-8859-1?Q?xOLW0sTK8MEfAmq0yXqu80b5PKuRJw+Nlab+5oy5Sd2VJbwSb/yZAm+hqM?=
 =?iso-8859-1?Q?fvnCMLJFcim9MilJ1vSDr/sBPdWxY+yL4KC/VDRqnJAvb9iYB5RrQNDLOK?=
 =?iso-8859-1?Q?VbHsTv/ZryeHVdK83qkecMdlnsXOqIOavhNUPTZIjjASjN3g6U09vGVL3m?=
 =?iso-8859-1?Q?nuDMeF5Pye/B+3pTN9cfEd35Tll2w1707f7PA66A+XLcMn2yRc7/0fY4no?=
 =?iso-8859-1?Q?zNxzNM0Ay5vej14sRsjHgABDBOM2iY53RRtofa+hRsmuzQZC9TnrYcZfXq?=
 =?iso-8859-1?Q?G7MFo70Fdy0uSqwtw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cd6e0f-5ad0-4266-fe60-08d8bdfe0948
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 11:16:44.7536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QMPQX2OLtIbYroNqNxYjT8nrzmZ19dbzpUwmrR7ZGkJxA6OVHKNermvshWaQ3qmH6EFdT7UyNye2jwCiI+7gMcpyhk344PWfNX7vrUKdmPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2135
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

I'm providing some feedback on https://github.com/edwintorok/xen/pull/1

________________________________________
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>
Sent: 15 January 2021 22:28
To: xen-devel@lists.xenproject.org
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu
Subject: [PATCH v2 0/2] tools/ocaml/libs/xc: domid control

For debugging/testing purposes we want to be able to control the domid
from the XAPI toolstack too. Xen supports this since a long time.

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1


Edwin T=F6r=F6k (2):
  tools/ocaml/xenstored: trim txhistory on xenbus reconnect
  tools/ocaml/libs/xc: backward compatible domid control at domain
    creation time

 tools/ocaml/libs/xc/xenctrl.ml      | 5 ++++-
 tools/ocaml/libs/xc/xenctrl.mli     | 4 ++--
 tools/ocaml/libs/xc/xenctrl_stubs.c | 6 +++---
 tools/ocaml/xenstored/connection.ml | 2 +-
 tools/ocaml/xenstored/history.ml    | 4 ++++
 tools/ocaml/xenstored/process.ml    | 4 ++--
 6 files changed, 16 insertions(+), 9 deletions(-)

--
2.29.2


