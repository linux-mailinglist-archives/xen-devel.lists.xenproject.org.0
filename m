Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567946A6AE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKrm-0000Nf-Vd; Tue, 16 Jul 2019 10:39:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnKrl-0000Na-DD
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:39:25 +0000
X-Inumbo-ID: f939a51d-a7b5-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f939a51d-a7b5-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 10:39:23 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 10:35:32 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 10:37:40 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 10:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQfO8/C3qR2Bw8bUqccit1GOmMQi+G/FacubVeDSZHzZ/3sl+Kvol5NJy++3O/otM6xOfN8sda4QRIQh+bhsKf5k0vcv5ptcJVhpk5KHAxmLaxJ5Cn1jGBSEIj3OquoLeG5qUehHtG7Dj4fDLbHIIUGN7Ba0E/T7alKhnXFMrD5vfR6jh4ZRnJyJJdUw1PXMVk4ps8TEsktogBnWQMvofuqoZO9Y1lGZo7mG5U8+HyoBCPjmqXIbPkwUH37H5/CFndzvjKYZLXeqr4RBI0U/VYOGFvJdmbQ5wYXLa/rXiBB73JAn3dOSolwXN4wGcd410sJeFWcXzPSNqCprtT1cPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIy8WRbdIzTVSDwLpP3JOpzuq5EmeP3OTJl6RQ+VQI4=;
 b=W90/dbkaC1j4HAVCbuoIihixfLyCw2LiOPafieMe8ikPxiT5yeYmmes87AyFJ94wCuQnXMhDZWlfgwFrBwZFFaK1SAsPgyRxZqXxbLbJUwwH93NsgwzakhPGdqMZXa6EDLO0KRd09ewScFtVL+BfqTySWdZhCk/wpJHfx1W/M8n8w6bk6ArkZhyoe1GvrN41TL8SL8359SM/XcHKwWNz/sSDFqo/I1/ksKCRAjSjTPny4zqj4wcwS7w+ITr5dKRQRBiFQlh/yb0mytVnX3MetWDwiQNDSIpxxrXg4TzU807q8ND6cE3g9DpYlUijYYEQMGxjJqf3adHaRrqiK5kxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2906.namprd18.prod.outlook.com (20.179.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 10:37:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 10:37:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant
 <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/4] iommu: introduce iommu_groups
Thread-Index: AQHVO7+5rqBhdjdwYEadjO/an1ZP4qbNCoHvgAAC7oA=
Date: Tue, 16 Jul 2019 10:37:38 +0000
Message-ID: <2063f979-633e-b214-b3f9-8380e7666950@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-4-paul.durrant@citrix.com>
 <ebd58c3e-d973-3c59-c37b-4cae15165025@citrix.com>
In-Reply-To: <ebd58c3e-d973-3c59-c37b-4cae15165025@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::11) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37ec622e-de80-4d33-686c-08d709d99f71
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2906; 
x-ms-traffictypediagnostic: DM6PR18MB2906:
x-microsoft-antispam-prvs: <DM6PR18MB29063CA25E4A47411382AC92B3CE0@DM6PR18MB2906.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(199004)(189003)(6116002)(3846002)(4326008)(26005)(7736002)(64756008)(14454004)(186003)(66476007)(305945005)(2906002)(66556008)(99286004)(66946007)(81156014)(6512007)(8936002)(66446008)(2501003)(71190400001)(8676002)(81166006)(7416002)(76176011)(80792005)(6436002)(316002)(6246003)(256004)(6486002)(86362001)(478600001)(5660300002)(71200400001)(486006)(53936002)(386003)(53546011)(6506007)(54906003)(229853002)(110136005)(2616005)(102836004)(476003)(446003)(31686004)(36756003)(66066001)(52116002)(68736007)(4744005)(25786009)(31696002)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2906;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +IxXTJmqGRu/XYtxjtqJWBjs9a8omDQp4enJUdiJYxy/Atj7434GW2vC1lSGrBEs1XPgZdyBwSyBKdBdoYpxNByh9TesaRWUs6FQL/0rzgT9CEX3AHcHfkDhnsoTyerYOCEQDa0UB1L3KKCYUDHhY8B+9qYp7KvkC9gRM5HiLUOoCfRxvOMGIDi7z8JMZEXfBP1yiYo7ZddrZgxmu3NxgvFQgRB82h02PX4sGd5k3loaJnEnzkjlOTdmZHK4wvJewOfp4pxeRmwQYeMvFPUt7l18uSB4CepMyHxI6EACdngbGVDM5xw+C1IYmd1qVwQ+5Eg7CKBX0dAI8kQrDaVxoPIalBDWYWoq7h3UtEK0r8wrITzvGo9dDKFZQMgZ3CZLSZksPRLwBuZ76a1Aq2I1GRLWYyP5phAOUrGbUXgP4tA=
Content-ID: <23797C15182A9449A205607392708219@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ec622e-de80-4d33-686c-08d709d99f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 10:37:38.6116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2906
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 3/4] iommu: introduce iommu_groups
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxMToxNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gK2ludCBpb21tdV9ncm91cF9hc3NpZ24o
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHZvaWQgKmFyZykNCj4+ICt7DQo+PiArICAgIGNvbnN0IHN0
cnVjdCBpb21tdV9vcHMgKm9wcyA9IGlvbW11X2dldF9vcHMoKTsNCj4+ICsgICAgaW50IGlkOw0K
Pj4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycDsNCj4+ICsNCj4+ICsgICAgaWYgKCAhb3Bz
LT5nZXRfZGV2aWNlX2dyb3VwX2lkICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4g
KyAgICBpZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9pZChwZGV2LT5zZWcsIHBkZXYtPmJ1cywg
cGRldi0+ZGV2Zm4pOw0KPj4gKyAgICBpZiAoIGlkIDwgMCApDQo+PiArICAgICAgICByZXR1cm4g
LUVOT0RBVEE7DQo+PiArDQo+PiArICAgIGdycCA9IGdldF9pb21tdV9ncm91cChpZCk7DQo+PiAr
ICAgIGlmICggIWdycCApDQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsg
ICAgaWYgKCBpb21tdV92ZXJib3NlICkNCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAi
QXNzaWduICUwNHg6JTAyeDolMDJ4LiV1IC0+IElPTU1VIGdyb3VwICV4XG4iLA0KPiANCj4gTm8g
dW5hZG9ybmVkIGhleCBudW1iZXJzIHBsZWFzZS7CoCBUaGlzIGlzIGEgcmVjaXBlIGZvciBjb25m
dXNpb24gZHVyaW5nDQo+IGRlYnVnZ2luZy4NCj4gDQo+IEVpdGhlciAlI3gsIG9yICV1LCBhbmQg
bmVlZHMgdG8gYmUgZml4ZWQgb24gY29tbWl0IGlmIHdlIGdvIHdpdGggdGhhdCByb3V0ZS4NCg0K
SSBhc3N1bWUgKGhvcGUpIHRoYXQgeW91IG1lYW4gdGhpcyBmb3IgdGhlIHJpZ2h0IG1vc3QgbnVt
YmVyIG9ubHk7IGl0J3Mgbm90DQplbnRpcmVseSB1bmFtYmlndW91cyBmcm9tIHlvdXIgcmVwbHku
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
