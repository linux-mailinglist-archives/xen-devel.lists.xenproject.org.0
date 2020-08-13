Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D8243948
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 13:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6BHY-0007Ju-1M; Thu, 13 Aug 2020 11:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvId=BX=epam.com=prvs=6494ee471d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1k6BHW-0007Jp-QY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 11:20:27 +0000
X-Inumbo-ID: de0bdc89-cf0f-4d10-bd9c-daa43fe44b7f
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de0bdc89-cf0f-4d10-bd9c-daa43fe44b7f;
 Thu, 13 Aug 2020 11:20:24 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DBAhIo032308; Thu, 13 Aug 2020 11:19:48 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 32vyhf16ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ytoj84cGx07WDOAYCzIkNgAt5bJioV7W5YtrVQQAS/+DhksIreP6wUY2d7IxNw3e1dabLKO/joyhyWebgFQqE7U8FYMt8ZYhPnCqjE5ZIzWeJKfvh6OOtWmbCaoocBhxVDJghXveZhwrRLWUgpYJoUeJivPrrUx1cDSfoZ1X4Jed6KVCVnEtCywv0EJXptrjjIlxNbLZDgnkBtcViT9MIz5xfnuKWrBu18bowc9xWX03oicTJdWZ/BnK5NGg1irxdBljvs2qWsyrCW6lxrzabvSp8t9NDmP8axaAZebkUB8HE2VdtkyqacdQWdZWmR0DlAoyL5JuHkuQCowNN55twA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc8o5Gg9pCw3D3wzThNao2OARb2LAoDAO0TM8iReMrs=;
 b=FA7ZbC6kciQiDieES6zzXHbSBfxZUGb12XnTnuuuSTbWoHlcbY/pT+hwappdevHvqexWw/Bz8Q3o54YGu+tjl6vRVDeK78eNIKpH5yzt/n7WIoLrFXY4aV0JyWHJkdIoz2BQUJsh3tZzWwZ6bc5eQ+LCtWLgiIAm3lqIfD+rBIgFimrNgU9NILIddLJaOJBvfokjHR1rH9cCNDsdKqUQUYGUg4ozdb6KGT2+pO9RFz+mujUN/Rw1GEbte2Iy5nbG5oAd2Rp4R307KczLAP1co92UuESu2fqk5bXsxRQesZhQvPXAEpxgYTIwo/PJxqc4eIXw8dhpotVco9zVWZbrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc8o5Gg9pCw3D3wzThNao2OARb2LAoDAO0TM8iReMrs=;
 b=w0RBY+eABwbLn3WzOKHTQ+/6O47gVx9rhalSLNXWETvTcqRI0v/DAlgzUBuGpVyIziCE00oFTPjIM/iudEjyjQVk+XvLxQ8tI2UJ5bJ0CSCE5TLL7VWkb4nKcKqCVaUImcwC5/+COKOhReKDCguIyo1dXrlnKyPnLBzbzwEGVBF74jfS8ALEQu9QqmcwTjtmInyu8pDWb/LtEDVmpxcJlsOJI60844+BquPe/P2FPh9BUJGiy1dA6ylKrn30TvBeZ+1hIcjNPxuHT4KWjo5Nk4+ACUgIdU5r3kpetdSHTZvtESHa48wY8dYQLaaop8HgjQTTD4jLAVU3rXpLMWUvLg==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4294.eurprd03.prod.outlook.com (2603:10a6:20b:4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 13 Aug
 2020 11:19:44 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9%7]) with mapi id 15.20.3283.018; Thu, 13 Aug 2020
 11:19:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "inki.dae@samsung.com" <inki.dae@samsung.com>, "jy0922.shim@samsung.com"
 <jy0922.shim@samsung.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "kgene@kernel.org"
 <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robdclark@gmail.com"
 <robdclark@gmail.com>, "sean@poorly.run" <sean@poorly.run>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "tomi.valkeinen@ti.com"
 <tomi.valkeinen@ti.com>, "eric@anholt.net" <eric@anholt.net>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de"
 <heiko@sntech.de>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>, "hyun.kwon@xilinx.com"
 <hyun.kwon@xilinx.com>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "michal.simek@xilinx.com"
 <michal.simek@xilinx.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "evan.quan@amd.com" <evan.quan@amd.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>, "tianci.yin@amd.com"
 <tianci.yin@amd.com>, "marek.olsak@amd.com" <marek.olsak@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "andrey.grodzovsky@amd.com"
 <andrey.grodzovsky@amd.com>, "Felix.Kuehling@amd.com"
 <Felix.Kuehling@amd.com>, "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
 "aaron.liu@amd.com" <aaron.liu@amd.com>, "nirmoy.das@amd.com"
 <nirmoy.das@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "abdiel.janulgue@linux.intel.com" <abdiel.janulgue@linux.intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "andi.shyti@intel.com" <andi.shyti@intel.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 18/20] drm/xen: Introduce GEM object functions
Thread-Topic: [PATCH 18/20] drm/xen: Introduce GEM object functions
Thread-Index: AQHWcUzwRlAvqlodBUmjrM9igZrPiqk15K+A
Date: Thu, 13 Aug 2020 11:19:44 +0000
Message-ID: <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-19-tzimmermann@suse.de>
In-Reply-To: <20200813083644.31711-19-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98c2df7f-79af-4148-ee6b-08d83f7ac817
x-ms-traffictypediagnostic: AM6PR03MB4294:
x-microsoft-antispam-prvs: <AM6PR03MB42948483A47DA7E7FF20A061E7430@AM6PR03MB4294.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9OuhwFxQyiR1r6WZCNoxvlXl+F4BeIHs0Lj7XIYCOMfjlBUvc5wx2AH3cjVee20NCw2z2cPzZ66ecnTR62GJzmNWY8h8LSmhhC/EsaiBe0DBD2OfrRcKJAT4hamZv2xqu3XMDY6/N716vxoQ8fp7BqbbQbIDCLa6KvKOARS0o2KWYxXwggf2rh3Z4TMmiBtUgvIk8eryhP305FHCtCAkHlKgq8qasIbIPBMwIY3hW23rQo+9HVzXRQQYsnqfTqyMMVE2X6wNsxG5m6ioY6ZblXGROvXJZlZX1Zm5fQD2yiFyx/T9McHKZt6C1RvPJcolYPLatWRukLV4k9PA/9VbSZwEpt3OcTTDIS93rscyCcpYbHBB+xFV1WyOX/f4hJur
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR03MB6325.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(4326008)(76116006)(7406005)(316002)(7416002)(6512007)(54906003)(7366002)(66946007)(110136005)(478600001)(6506007)(53546011)(64756008)(86362001)(66476007)(2906002)(8676002)(66446008)(66556008)(71200400001)(8936002)(6486002)(31696002)(26005)(5660300002)(1191002)(186003)(31686004)(83380400001)(36756003)(2616005)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RE/ytRISihDqVWLNAbZa6AMa6DykADf3L3prJiKeO9tLqyEL6pS7z6d7YS/5xwHDeDnKCuUMAUmNfHTLmpHstKw4/sCkLIAw55CLJasWUweCRGjRetUQX23J26TgBD/3q2hA+QG2a44++Ls8adHHKalvWZWDn281MI14G54ooFjzYTb1CoYbryKGXOxahysDtcfCSiaMSrC6WABHJkkf6gYfccHAzJMIiaMW9sYyJRML3v9o4BkX9/DtM5QFLa2ZCOQeqKWhPY9jcLPYo8K/HC7vabBlWXoXJmrw4avg7Gdr9wagIg3ESoB/dKSGWQOT3cM+HB5sLxxHaiuv16rgMNbqMTNhYQvuGVWu6Yg+sJOvNxDbEStBRe/tuvuBnI7ozGt+r2+JNK5UywIbuXtD12UAOe+aM5uJxsOoXGefBlaXFbgRH9WdPmrjtIS2HphZvjKFIPRlY9RScte8D1bScGUcLYqflfIw+LQ0S8AGQ9LoOQM8dKyWpHwc7GO+AbyLxT1ZmLLBeJ+I5PMqJc0k95MxFi4ueOcymKFCKNtfckT5jweqr2mtlrsTaEmc5dzsPQVDY42C+4nZspiabPTq7k3I0wzwW9xn6wWhbuLhoh+xI97P9riZFZygqwzUUj254yzRx2ZF3X1qCi5s/u/zlA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <73B83228210C8B4092A3A2E420A1C72C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c2df7f-79af-4148-ee6b-08d83f7ac817
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 11:19:44.5649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf3Ju+H72OtC//NmTqgcZeFyfKALyi2YcwCTi756Jif6gg6QmkKzaeMSl8qoWK868gGdtmA2N9qB0vAvmyjlq1MS3Eh0vEaiNq869roKrHvQDdr2jkXV8UZTYjjxWvux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4294
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_10:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130085
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDgvMTMvMjAgMTE6MzYgQU0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiBH
RU0gb2JqZWN0IGZ1bmN0aW9ucyBkZXByZWNhdGUgc2V2ZXJhbCBzaW1pbGFyIGNhbGxiYWNrIGlu
dGVyZmFjZXMgaW4NCj4gc3RydWN0IGRybV9kcml2ZXIuIFRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhl
IHBlci1kcml2ZXIgY2FsbGJhY2tzIHdpdGgNCj4gcGVyLWluc3RhbmNlIGNhbGxiYWNrcyBpbiB4
ZW4uIFRoZSBvbmx5IGV4Y2VwdGlvbiBpcyBnZW1fcHJpbWVfbW1hcCwNCj4gd2hpY2ggaXMgbm9u
LXRyaXZpYWwgdG8gY29udmVydC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udC5jICAgICB8IDEyICstLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udC5oICAgICB8ICAyICsrDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgMTUgKysrKysrKysrKysrKysrDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmMNCj4gaW5kZXggM2U2NjBmYjExMWIzLi5iZDlhZjE4NzVhZjEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+IEBAIC00MzMsNyArNDMz
LDcgQEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbHAsDQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHZvaWQgeGVu
X2RybV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
DQo+ICt2b2lkIHhlbl9kcm1fZHJ2X2ZyZWVfb2JqZWN0X3VubG9ja2VkKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKQ0KDQpDYW4gd2UgcGxlYXNlIGhhdmUgbmFtaW5nIGNvbnNpc3RlbnQgYW5k
IG5hbWUgaXQgYXMNCg0KeGVuX2RybV9mcm9udF9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQgb3Ig
YW55IG90aGVyIG5hbWUgaWYgdGhpcyBzZWVtcyB0byBiZSB0b28gbG9uZywNCg0KYnV0IHN0YXJ0
aW5nIHdpdGggeGVuX2RybV9mcm9udF8gYXMgdGhlIHJlc3Qgb2YgZXhwb3J0ZWQgZnVuY3Rpb25z
Pw0KDQpXaXRoIHRoaXMsDQoNCkFja2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRy
DQoNCj4gICB7DQo+ICAgCXN0cnVjdCB4ZW5fZHJtX2Zyb250X2RybV9pbmZvICpkcm1faW5mbyA9
IG9iai0+ZGV2LT5kZXZfcHJpdmF0ZTsNCj4gICAJaW50IGlkeDsNCj4gQEAgLTQ4MSwyMiArNDgx
LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHhlbl9kcm1fZGV2X2Zv
cHMgPSB7DQo+ICAgCS5tbWFwICAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX21tYXAsDQo+
ICAgfTsNCj4gICANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qg
eGVuX2RybV9kcnZfdm1fb3BzID0gew0KPiAtCS5vcGVuICAgICAgICAgICA9IGRybV9nZW1fdm1f
b3BlbiwNCj4gLQkuY2xvc2UgICAgICAgICAgPSBkcm1fZ2VtX3ZtX2Nsb3NlLA0KPiAtfTsNCj4g
LQ0KPiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciB4ZW5fZHJtX2RyaXZlciA9IHsNCj4gICAJ
LmRyaXZlcl9mZWF0dXJlcyAgICAgICAgICAgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQg
fCBEUklWRVJfQVRPTUlDLA0KPiAgIAkucmVsZWFzZSAgICAgICAgICAgICAgICAgICA9IHhlbl9k
cm1fZHJ2X3JlbGVhc2UsDQo+IC0JLmdlbV92bV9vcHMgICAgICAgICAgICAgICAgPSAmeGVuX2Ry
bV9kcnZfdm1fb3BzLA0KPiAtCS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgID0geGVuX2RybV9k
cnZfZnJlZV9vYmplY3RfdW5sb2NrZWQsDQo+ICAgCS5wcmltZV9oYW5kbGVfdG9fZmQgICAgICAg
ID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsDQo+ICAgCS5wcmltZV9mZF90b19oYW5kbGUg
ICAgICAgID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsDQo+ICAgCS5nZW1fcHJpbWVfaW1w
b3J0X3NnX3RhYmxlID0geGVuX2RybV9mcm9udF9nZW1faW1wb3J0X3NnX3RhYmxlLA0KPiAtCS5n
ZW1fcHJpbWVfZ2V0X3NnX3RhYmxlICAgID0geGVuX2RybV9mcm9udF9nZW1fZ2V0X3NnX3RhYmxl
LA0KPiAtCS5nZW1fcHJpbWVfdm1hcCAgICAgICAgICAgID0geGVuX2RybV9mcm9udF9nZW1fcHJp
bWVfdm1hcCwNCj4gLQkuZ2VtX3ByaW1lX3Z1bm1hcCAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRf
Z2VtX3ByaW1lX3Z1bm1hcCwNCj4gICAJLmdlbV9wcmltZV9tbWFwICAgICAgICAgICAgPSB4ZW5f
ZHJtX2Zyb250X2dlbV9wcmltZV9tbWFwLA0KPiAgIAkuZHVtYl9jcmVhdGUgICAgICAgICAgICAg
ICA9IHhlbl9kcm1fZHJ2X2R1bWJfY3JlYXRlLA0KPiAgIAkuZm9wcyAgICAgICAgICAgICAgICAg
ICAgICA9ICZ4ZW5fZHJtX2Rldl9mb3BzLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmggYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQu
aA0KPiBpbmRleCBmOTJjMjU4MzUwY2EuLjkzZTYwYzFkYjU1MCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmgNCj4gQEAgLTE2MCw0ICsxNjAsNiBAQCBpbnQgeGVuX2RybV9m
cm9udF9wYWdlX2ZsaXAoc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAqZnJvbnRfaW5mbywNCj4g
ICB2b2lkIHhlbl9kcm1fZnJvbnRfb25fZnJhbWVfZG9uZShzdHJ1Y3QgeGVuX2RybV9mcm9udF9p
bmZvICpmcm9udF9pbmZvLA0KPiAgIAkJCQkgaW50IGNvbm5faWR4LCB1NjQgZmJfY29va2llKTsN
Cj4gICANCj4gK3ZvaWQgeGVuX2RybV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopOw0KPiArDQo+ICAgI2VuZGlmIC8qIF9fWEVOX0RSTV9GUk9OVF9I
XyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jDQo+IGluZGV4IGYw
Yjg1ZTA5NDExMS4uN2IzMTVjMDhiY2ZjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250X2dlbS5jDQo+IEBAIC01Niw2ICs1NiwxOSBAQCBzdGF0aWMgdm9pZCBnZW1fZnJl
ZV9wYWdlc19hcnJheShzdHJ1Y3QgeGVuX2dlbV9vYmplY3QgKnhlbl9vYmopDQo+ICAgCXhlbl9v
YmotPnBhZ2VzID0gTlVMTDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZt
X29wZXJhdGlvbnNfc3RydWN0IHhlbl9kcm1fZHJ2X3ZtX29wcyA9IHsNCj4gKwkub3BlbiAgICAg
ICAgICAgPSBkcm1fZ2VtX3ZtX29wZW4sDQo+ICsJLmNsb3NlICAgICAgICAgID0gZHJtX2dlbV92
bV9jbG9zZSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3RfZnVuY3MgeGVuX2RybV9mcm9udF9nZW1fb2JqZWN0X2Z1bmNzID0gew0KPiArCS5mcmVlID0g
eGVuX2RybV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQsDQo+ICsJLmdldF9zZ190YWJsZSA9IHhl
bl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJsZSwNCj4gKwkudm1hcCA9IHhlbl9kcm1fZnJvbnRf
Z2VtX3ByaW1lX3ZtYXAsDQo+ICsJLnZ1bm1hcCA9IHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1lX3Z1
bm1hcCwNCj4gKwkudm1fb3BzID0gJnhlbl9kcm1fZHJ2X3ZtX29wcywNCj4gK307DQo+ICsNCj4g
ICBzdGF0aWMgc3RydWN0IHhlbl9nZW1fb2JqZWN0ICpnZW1fY3JlYXRlX29iaihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPiAgIAkJCQkJICAgICBzaXplX3Qgc2l6ZSkNCj4gICB7DQo+IEBAIC02
Niw2ICs3OSw4IEBAIHN0YXRpYyBzdHJ1Y3QgeGVuX2dlbV9vYmplY3QgKmdlbV9jcmVhdGVfb2Jq
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCWlmICgheGVuX29iaikNCj4gICAJCXJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOw0KPiAgIA0KPiArCXhlbl9vYmotPmJhc2UuZnVuY3MgPSAmeGVu
X2RybV9mcm9udF9nZW1fb2JqZWN0X2Z1bmNzOw0KPiArDQo+ICAgCXJldCA9IGRybV9nZW1fb2Jq
ZWN0X2luaXQoZGV2LCAmeGVuX29iai0+YmFzZSwgc2l6ZSk7DQo+ICAgCWlmIChyZXQgPCAwKSB7
DQo+ICAgCQlrZnJlZSh4ZW5fb2JqKTs=

