Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DE21CCE7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 03:54:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1junfE-0003ZI-Jf; Mon, 13 Jul 2020 01:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulr8=AY=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1junfD-0003ZD-39
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 01:53:51 +0000
X-Inumbo-ID: b17efcf8-c4ab-11ea-b7bb-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b17efcf8-c4ab-11ea-b7bb-bc764e2007e4;
 Mon, 13 Jul 2020 01:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LruRMIOJFrkQOpMYDRd1yBY/0DXM3V6+A1bEDdoxc9RmaRwS9HBRvq5Hoo8xHILQZW5LkamzP69XibMXDNBMw8uz5gAEJZCjk5XcroVB/x0vmXZxf0EdxhDZ+SnC4ga775AoPClrV2YFkPP2nX5x0yQdBA0CQ6qEGFNLiupejdNV+bD+2V/QSs0TVAGo419en+wm72yiZaZTnoWJW5dnfrABUesjhRfwqEmX7KqUr0B+AJ42xNCigcv42m3enWoyH3jYGja6s4+Uxwu+yYH47lKX8iqZVTAzGAR5C7N2Vc6Ez5uwcmuiWJgt3NdYuaqCN3Hfhy0C+p2ZmR5yRSiLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GABxCLbPG/InTruHWRpo4qulx4rYnvByLeP8nYru0E=;
 b=YjkUykQ71iQuSBu4BfIcWg+2KGefoG+bOWCDyA7KR2I5eb3EzcO4TnGTidRM51/GAwwcFHzOhVDLN0P7GSpzxCrbrG5ZUdGpwZ2ACv1y8Ckvp1pIl/sAa0MQVk3zZRT8y9Q0qn8tcjCU8cm+ZOwW/N3TgPeWiiUMUZ3EKH07PmrLdu0xF5h8D3e5oYhrwpBejTMB/TdejTxbDV+dtLxN7l1NoIsKDzgLs6N/WxGevp5Cg2slHo5qMqkjcjBhXYdJhSNAD7vdQ2qyY2k6nzTlfPrqQ/rc379jBqoSjd72nhoCFmOeiZzBlwYHG+DgSZB3lVBaQb2zXQOlwKcMBfQ6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GABxCLbPG/InTruHWRpo4qulx4rYnvByLeP8nYru0E=;
 b=heSq42g8WHT6NiBV2e/XNCtUZpyt80CMWW/KlzGxuWhXKHsOY5GLi5GhgTP2lifKD5lRveY7y65FuZcKKfacA5WFDt+MQOBE9BmSPh58C0EN4mN65PPF51KMh9fOZtD9JyrEYy/jC2TwsFdW1roXU1na/IPUOsPO9cUNhvalgE0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2934.eurprd04.prod.outlook.com (2603:10a6:4:9b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 01:53:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 01:53:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
Thread-Topic: [PATCH] xen: introduce xen_vring_use_dma
Thread-Index: AQHWSgTusARd8c8cRkWwDit233DtZajneYoAgACU6oCAAC7QAIAAEpoAgAAGSwCAAUK2gIABcSaAgAVA3oCAAnnkAIAAQwqAgAA/4wCADeHhAIADsWjQ
Date: Mon, 13 Jul 2020 01:53:46 +0000
Message-ID: <DB6PR0402MB2760A98A427AA48FA325635288600@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
 <20200701172219-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99a7de08-78dc-4b39-c1f7-08d826cf94d4
x-ms-traffictypediagnostic: DB6PR0402MB2934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB293480B64104501E330E226088600@DB6PR0402MB2934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNjTjTjWrIzXfE6ltpWdBR2DeplyC5i9JvzDPZQia160JH+4EpFBFzUBzaTYh+uNrM/VAFmAV3PbNhBJHmw4II1QBugVpSYd+ZkN3p/kF1yaQTw4pm/RfS3uD0WGoDkSTdS79kgwDookFi9BKKxCd10mfxdveukGFFsjh/BIVkUj48h+STYHB61GG8gkXTt6ITZV0OnndJ8ZhM6eTVmusVfqT4VGMIOba0QJ7G5tYI+xecyBwKWGL5LPqc2bRxVYTRFcQlD97nLK37PDGgCUsc7osct3GMyYTmmMbUfTR9BNamWstINU8Hh7Y9Zp4MCrITQOw3eHM8GlxxprJogzeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(2906002)(86362001)(478600001)(8936002)(8676002)(4326008)(83380400001)(71200400001)(26005)(7696005)(33656002)(44832011)(9686003)(55016002)(110136005)(7416002)(6506007)(316002)(54906003)(186003)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Iun8yMXMvh1uJny1TTawzz+RrjDW6kn8ygbIzjr3Mw6Ca8T8w5/hMDadUD5xBFjCFBsj4QPIiReVKRta2T+kh2YkRdvG58bGxrewzphSpr8HT6vhsCU/1QmupGEgZaPVUseO/ppaC+y0yTT/POW9E40JnMMr0/uKZrcYxKazMrOMAZ5quH6xrF2sj8N35RRCDqhDLSO7PVwhVKOtExLwKPDhV3juJVIk4L/5+OAIO7iJ7QreF5xC50QYFLi4bgA8BVNNt2Zqu/LbiiW+hmOWV5wVog8ablQmmxHgJkE0xIk3grgQ7hQoDvcj7g5k+s0oaD80LLjXhzmt3qHbTr4j9jD6/shsyW94xYVPdTW/caw5dVIQXvMhI5QcGOe78Yf5tKAlBryF38etGJEkPrvsO8ReuhJj6/l9q4SeAjyMwFrrWlJ5zkv4Z6OHWS60F8GC4mGuHGqOxZeHW8OwvsxL9Uw/dBc3P99uO6gTD+BH168=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a7de08-78dc-4b39-c1f7-08d826cf94d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 01:53:46.8602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhMchUJ1LWLK4MCDdWLbSri36Ld+/UF1kdGDfCfQG+NsyzpEL7vFL5ZnooxMhdUBejFSfT+ZNO67zUrafCM7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2934
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
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
>=20
> Sorry for the late reply -- a couple of conferences kept me busy.
>=20
>=20
> On Wed, 1 Jul 2020, Michael S. Tsirkin wrote:
> > On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> > > Would you be in favor of a more flexible check along the lines of
> > > the one proposed in the patch that started this thread:
> > >
> > >     if (xen_vring_use_dma())
> > >             return true;
> > >
> > >
> > > xen_vring_use_dma would be implemented so that it returns true when
> > > xen_swiotlb is required and false otherwise.
> >
> > Just to stress - with a patch like this virtio can *still* use DMA API
> > if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
> > as you seem to be saying, you guys should fix it before doing
> > something like this..
>=20
> Yes, DMA API is broken with some interfaces (specifically: rpmesg and tru=
sty),
> but for them PLATFORM_ACCESS is never set. That is why the errors weren't
> reported before. Xen special case aside, there is no problem under normal
> circumstances.
>=20
>=20
> If you are OK with this patch (after a little bit of clean-up), Peng, are=
 you OK
> with sending an update or do you want me to?

If you could help, that would be great. You have more expertise in knowing
the whole picture.

Thanks,
Peng.


