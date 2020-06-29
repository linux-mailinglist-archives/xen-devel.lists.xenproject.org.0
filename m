Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7420CCCC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 08:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpnOT-0003KV-CK; Mon, 29 Jun 2020 06:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNuP=AK=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jpnOS-0003KQ-DK
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 06:35:52 +0000
X-Inumbo-ID: c5b9871c-b9d2-11ea-852f-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5b9871c-b9d2-11ea-852f-12813bfff9fa;
 Mon, 29 Jun 2020 06:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzr/k4oCbcvEW7AiZGYcqOtnZAuZ87sdUvtk2U1+45np+2XqI2wkn+fFSSxJpPvBzvIfY95CTvIOq74St4++o8KZSmmblZNTye/HXpATwTRNThRGDatoR7ljUseNIFLWjftAAYrgrzzhTocZ/TiG3sCYqAeB1r2A0QBTr/A1BuQsislJYxR8T/fhQB79nJpgE5K96HOZEwU801Bn2jlsjNAYE4K+uG3LRDRjpBayLVgvveyp4ZZSzCLH0nB8khiVoZOn2Ld67ikv6ce9mfoHwXG40rdyS7MF+wCGem4kduqbS3hMeLpWkcEFDTQUvYhDSTh8Df04Ob2TLaJwJ8gtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt9aKkcohM+VBBAMcQ1zSn0OzkcLoXfaQdNHqrsc8go=;
 b=I19SIRA9E+ml4KlImtDM2f6dT2GjHOpm/8bQAdGCULUf7DUSebu1q6C/JEQQ0ZoD5czHKgShajRH6E8quwskYdXQrzJfn+BWOHsgk/ylOAEslvjCLUXnqiYfrr31rvAWJsumKBYEoB53GLwvctI0j8ms0CZg5nttGNUPix2ZLACLyf8/jdtFuC95JbVqXotqdhbEoV0cgmf+v07H7UuHofCgk1ft3b8hZnXEyEeIUp23T10ZYTN/LgLHpL7WsN/+yuJc5e+M2O/sjq6bnvSKohrrNhgmA8xyXA7NlZAZkvgt3wCT/sr95qbheSpOaRlE434mT7ymF9kj/VMpYltmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt9aKkcohM+VBBAMcQ1zSn0OzkcLoXfaQdNHqrsc8go=;
 b=AmBn7Z1Vgx95lJz5b3JxDQb7dpR0/wYgFEuq3Qzew0A79iEejI01TsVFHzD149IWXAhzENJq8qJnyaImapEQolKWf0QRGEawwdDBkZNk1rzw+FT+BwyKqToGmCXB7v+rtFqIIzKTJNTMt9LLg+JmWqc28jUbdUiyQym7kw7s8VU=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4764.eurprd04.prod.outlook.com (2603:10a6:10:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 06:35:48 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 06:35:48 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
Thread-Topic: [PATCH] xen: introduce xen_vring_use_dma
Thread-Index: AQHWSgTusARd8c8cRkWwDit233DtZajneYoAgACU6oCAAC7QAIAAEpoAgAAGSwCAAUK2gIABcSaAgAPk6cCAADgrAIAAAH5wgAAC0YCAAABHUA==
Date: Mon, 29 Jun 2020 06:35:48 +0000
Message-ID: <DB6PR0402MB27606A2A6308135D62476D80886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200629022124-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200629023225-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200629023225-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e07dc2d3-9155-49ce-2410-08d81bf6a91d
x-ms-traffictypediagnostic: DB7PR04MB4764:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4764AE24947258994AB8A440886E0@DB7PR04MB4764.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fK08amyxZaUi4JckED6/kpeUqMMw5buBVlalapbUcm+JSQK4QI84PEPgIYnkjkipS0xD9ABwB8ZcXtU/h/Y1OsDKtAVt4k4y7yMsyjn1Oa5BSHHepcIY7m4GIwnbEVNJJuthC4iVCMt+doQZU+ZAh26iGubJ/DeuGuOOXyNv4oM6PLJurQOiHffS1g7sdTacZiTsr+zppsy1C/3VBuisiyRVGG4KfeS0ux+2g8v3UsA7a2J/kgVZnBPHi2P5+10HIdKRjvpPPZ6yxmJFe43F3T3WeOuT1xkhR6Zi6ivDSCaAWVO+op7BLHTy95nrWHskMjgKfYQDmudAalEtAL7cIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(66946007)(8936002)(8676002)(7416002)(9686003)(83380400001)(86362001)(44832011)(26005)(64756008)(2906002)(66556008)(6916009)(4326008)(66476007)(6506007)(66446008)(186003)(76116006)(4744005)(71200400001)(5660300002)(33656002)(478600001)(55016002)(316002)(7696005)(52536014)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 63k2owGulhusPRazW46hh/2a+efDxnw5Ak9iGbwd161buaq9mmMSZvvaGZMS87V5f2GDrg3WF4Oh7JXqPRgBE5SUGQmUoXnhTBOO19GPSMYZt+Lrlj0OpzO0Jql3BMWWSQplbol/Q+Z80+e4LL7EIQWzIhSBfPZjbEjV39ucPFLEIFEwTFsCsyK+6WFjKMeIrepcXL+MG+tAEIdcaugN7F9Y6LGblmbsvcCe/CTmqDsMDIq57bI+0chNC+fJQj24C3V+DPYtwKLJHwkrD0Wc90v8IQhcMJg4hjUp3lDEDbgI6vqOpEIfN4t2Zpxl16NFJ9+EvD5RN4ilnaa84iCF5iOkD+KQIlMPB5ex8az2GvDte+xkV4Mzg2p3SWTOKf0qsk3HKvh74vTDX2Bk1B+Zqsz+Z1harUbTpuDLx2jAEA5kih/aoXOqjQRM5mrc1peNTAo9qYuTNWsaSiK1sRsVD0Qc9Nun+TWq/L5HOWc68O5MhgpgJvac9kppMJ+CTTA4
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07dc2d3-9155-49ce-2410-08d81bf6a91d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 06:35:48.4429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmRyPfTWtT9tmgZRVPpOrkiU+mkQIwuldVriqMockyAX0T7RoLpPgZZtv1zNbSJXKaVO8ByTSQcBW7CQ4G2crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4764
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
>=20
> On Mon, Jun 29, 2020 at 06:25:41AM +0000, Peng Fan wrote:
> > > > > > Anyway, re-reading the last messages of the original thread
> > > > > > [1], it looks like Peng had a clear idea on how to fix the gene=
ral issue.
> > > > > > Peng, what happened with that?
> > > >
> > > > We shrinked the rpmsg reserved area to workaround the issue.
> > > > So still use the dma apis in rpmsg.
> > > >
> > > > But here I am going to address domu android trusty issue using virt=
io.
> > >
> > > My suggestion is to first of all fix DMA API so it works properly.
> >
> > Could you please elaborate more details?
> >
> > You mean the DMA API usage of rpmsg? Or xen domu dma_ops?
> >
> > Thanks,
> > Peng.
>=20
> Not 100% sure but I think xen dma ops.

Sorry to ask again, could you explain more details about what issues
do you see of current xen ARM domu dma_ops?=20
Or Dom0 swiotlb xen dma_ops?

Thanks,
Pen.g

>=20
> --
> MST


