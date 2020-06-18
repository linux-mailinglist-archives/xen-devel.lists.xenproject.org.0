Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EBF1FFEA7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm41P-0000D7-1B; Thu, 18 Jun 2020 23:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jm41N-0000D1-7V
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:32:37 +0000
X-Inumbo-ID: fd5bcba4-b1bb-11ea-bca7-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd5bcba4-b1bb-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 23:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIHikpxl1ZW4T/vNKEKLhVhunksozaIlIhG9VUla23z1tpJLbrsOV2plvwxfCYd227Nf2ahl2dT7Q+XdAh3RPgM3ICVC0Cxpcr1O4fAclTbLj8LiVs35hJtMa11tDchOcwRp2S1Bex3ncLqd9uqiWWBLMFtKTL2cEnsJUykaHYTVyKFB740pojIyevAVXDdInwA1yP8CueZ6qo0HNJQefhK3AK54WGB9Mbb7F9id4a5Yy3VRs/U05EGzbrJfsXO+EsqV/QXF3/a2vqrIgsl0zEc1pl2epU2EZ3pr/QWhIQtzlAHMH8LRYdg/YcsLsCQHwp14/WJ1FGY2HLrB9wTRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7hZM8c+yFgdJK1pVUcrcRMzanV6KtMbZ2wsOksde2w=;
 b=f+zHVpkHAtNfeDz3totfozPP1JJtty14bksJcf4Kekm0fUISURX6HFrIj244WdSS2EXrzToIipc70/WhX7wxqTyytcxGz8I0DGa1e382TjlLTNe/EHmEmC1GWNfe+1Xts4JFkWV8g30KuukoBvfgf6QK/qD3SdUdcbWoxBouF3boaVUlE0B8mkZolTskydtkia4Gt1HlVdvhwS4uUwBZu8E+upznsY8+N/2Wk+1P9yB35NXoXJcV4DWQ1NjBczOxpVScl9ozil279ssE3JCo9TmL7V5UxoYfpyL2nOv4LP4TiBsLxwYYFCBIJa080Thxhs2h1akf+yBxXxNZkn9w9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7hZM8c+yFgdJK1pVUcrcRMzanV6KtMbZ2wsOksde2w=;
 b=JumNNtQQ6FsONdwCOq8h8bEhrjzvap5qWSnFMl73aNkSlZN89ZQzOnmATvZkZoHWN5hpunE+YQ1wGfpg03TXHEqThsOm6GmeCspSGePypVija/KUNVflEDS5vKYrMEgeepVF6TkhZWA/acHuhDIJ/AO4YUya1SUVq1JZXJZQljwKrZOqkjXv+0CcFZtOCjW/aaBAq5jaRIIxhpDEPCHFGaZStl5xB1zcXFBZgq50WPHg2tFuFr0T0cgdGAYG0zKDKv/6NPAPVsqvgCyLrL0F4Wnh8bcP6uzL4qmhzi3a/vZMAjNDioZ1Uh29v78G7KL9Ma1UvHDReIIGjEUswoRS/w==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB5005.eurprd03.prod.outlook.com (2603:10a6:803:b7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 23:32:34 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 23:32:34 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL
 address
Thread-Index: AQHWLLcTxhZtogukPEOG78aedSZTLajL0lyAgBNTToCAABJigA==
Date: Thu, 18 Jun 2020 23:32:34 +0000
Message-ID: <871rmc2bn2.fsf@epam.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
 <alpine.DEB.2.21.2006181523070.14005@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006181523070.14005@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd550ef5-9a10-4c6d-a38a-08d813dfe0cb
x-ms-traffictypediagnostic: VI1PR03MB5005:
x-microsoft-antispam-prvs: <VI1PR03MB50059C653EB0B0C1C1475FEBE69B0@VI1PR03MB5005.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzb9BgE26ZRg+FoY1M6xMjggH52/Eh+RROdUpKOJLquiMQCsJvBRyeWwqbMYDbgGQim//buIGjDadex8XpxFgYP1v1lmbBvWoJ7M60vExKuPEqu1TYg+Tcthg7r8EQXABPtAgYOeS9N/rM+CpyGI1UeQZSjUtcXsLE88SqqImUYAH6yPr7dGHxYIbpWMpI5zCHXvf4qmyCVJcTGmd1d1SiiuV9Wh40Pbp8F0oJ8ajksM+9itOcI71jg3pCSG8Ld4yM0qo6DQbSst1O7rVS4nagknd9PVMXKRonrnfX6bhdACMo9QYh7d7WGXasoiuqKYlYTSVnknyaJKrDiAkMG/5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(2906002)(6506007)(26005)(6486002)(5660300002)(8936002)(8676002)(71200400001)(55236004)(186003)(36756003)(4326008)(6916009)(66946007)(86362001)(54906003)(316002)(4744005)(478600001)(76116006)(91956017)(66476007)(64756008)(66556008)(2616005)(66446008)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YzMe4UQAbMOSRi/lhioQmhZNjUlgNYR/fjATCQx6icSlLlwK2ww/hhGDKBN9YQNaPFlx11mHDB6Xhu+R5+ELpXpwBgNC0VfhCJLahz7hJTpa5r9/XV43is4dPr9e4YAKtuYXh+t4j15kYo69TEHpIh7BAqLVsoDHvemMH+j7LzVlosffCZPiwDknYOpvGbDxI8DM2Y2kTi6LTrPt9b4zYgitR5mDiDAmdx+7Jraoq7AGDmddqO6KC2TAsnTgQsmAwpQmZtBOFkobB5q0t8jWmKt4BBJU4z01n//sdCf2mGCVcTWu/Q+A70+bfpIek8oMUVbbLjg6e3k5rGxy9PdUW0GkeqSK0vQq/iBXhRrit5JD9pYQB8ddErWl6/2f6h6zGHNiIR+oC3IJZffFFs4uqPhmfQUDZSXKIOIX+pgqB91cLBzIdxOqKeHisqAHpXBjklp7+xzMM/imEvn0nd1lf9ncLRJnQ+e9NKbg1VjYyN0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd550ef5-9a10-4c6d-a38a-08d813dfe0cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 23:32:34.1442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRmg1Fmn9LXOzcVlhsvEVqg/8Trfp0LDk2DtqYl4MY5DbYXXR4xI3VJGoeJl/8XT1cvVhn1eEGX2ww1nJVgffNWJXZCeDUU8y2YyNjP4YoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5005
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amazon.com" <pdurrant@amazon.com>, "julien@xen.org" <julien@xen.org>,
 "xadimgnik@gmail.com" <xadimgnik@gmail.com>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hi Stefano,

Stefano Stabellini writes:

> Hi Paul, Julien, Volodymyr,
>
> This is another bug fix that I would like to get in 4.14. It doesn't
> look like we need any changes to this patch, assuming that it is
> accurate to the spec.
>
> It would be nice if Volodymyr could provide more info on the spec side,
> but honestly I trust his experience on this.

I'm sorry for the delay. Julien asks very good and deep questions and
it sometimes requires deep research, to fully and correctly answer to
them. This was exactly that case. I'll answer timely to the next e-mails.

--=20
Volodymyr Babchuk at EPAM=

