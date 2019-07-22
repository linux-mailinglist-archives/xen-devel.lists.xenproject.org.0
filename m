Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3DE6FB20
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTTw-0001fP-4M; Mon, 22 Jul 2019 08:15:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpTTu-0001fK-MC
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:15:38 +0000
X-Inumbo-ID: db757d0c-ac58-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id db757d0c-ac58-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 08:15:38 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 08:15:24 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 08:14:43 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 08:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmNi2Zr8pXvIHVykh1pVd0YQRYe4RpwDUZWpvvyjIHGNiX/hekmNMU6cja3fhnx39zwiOLBaaBH5gwh/ocaB0zuySlL/Fju86onKbMDyrH0PvFMW63Isgc5a7GtuQQpZGS3/+KpNhelEleXAqBV6B3NlZCo2DN/5tkiY99LgfiJGIn8Bzf885B4JLfA3446xcNZid6k1eOY+J2tjavxET2Gp3luWlqxYa5jqj/4eMqVjyJYbXjAMoc9dkbZTvth/3EUbrVqIM54yjhGETBvi8P3xIDXhTGrKFk5roYjCzcWYbJEgFrIssfmGmYiIZfRNFzrwH0wgPoFzZUZJTQlQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmAHMqop5VmDDcjLtjNzHg0Z1qLYAbiRexztSgFJBu8=;
 b=YiSgAPVVnueB+Qj7OfPm72ACbW4s3yV/wOkG+ZJCEO7W1vwCOLqRrLQWHV3FBL+opTsn+R0KOzFK1CmwvJdnOTVLA6LmRBkbkaQeUXQliafUSor4Pcpo/iMFB9WvwHsqjG7hrQpHNW0GPi+GwcGdcLiOnECoX0ndoTmsGQHdEwC4XShg5ZF4YryAEYUKLjO4WGMG1o0IWcDb56tA5k23kt+xchOU4na3DrigBhu4N34cHlayTRg7pUkwjgDu0qj7LoEnJadXO7utEKjNQXY+8AT0WpageT+IiIFmfRHK4nL78WKQJeRLZcBpvQSqMDhz3dYWII7i7tk7fl/7acPqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3436.namprd18.prod.outlook.com (10.255.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:14:42 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 08:14:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] CODING_STYLE: list further brace
 placement exceptions
Thread-Index: AQHVPhMBr+RUGGWe+UK6rQHc+fBEZKbSJ1KAgAQnhoA=
Date: Mon, 22 Jul 2019 08:14:41 +0000
Message-ID: <51ff8f9b-9a49-a9db-75db-8cc1c810ea66@suse.com>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
 <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com> <877e8e2coq.fsf@epam.com>
In-Reply-To: <877e8e2coq.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66314494-19f6-4481-026f-08d70e7ca5d4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3436; 
x-ms-traffictypediagnostic: DM6PR18MB3436:
x-microsoft-antispam-prvs: <DM6PR18MB3436E316D4617E2C57112C49B3C40@DM6PR18MB3436.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(189003)(199004)(54906003)(6116002)(68736007)(86362001)(3846002)(316002)(6486002)(99286004)(6916009)(446003)(31686004)(31696002)(386003)(53546011)(76176011)(6506007)(102836004)(6246003)(25786009)(4326008)(52116002)(476003)(11346002)(2906002)(2616005)(26005)(186003)(66946007)(6512007)(6436002)(66446008)(64756008)(66556008)(66476007)(53936002)(81156014)(8936002)(80792005)(256004)(305945005)(486006)(14454004)(7736002)(7416002)(66066001)(71200400001)(71190400001)(5660300002)(229853002)(8676002)(36756003)(81166006)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3436;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u1wiDjzFDNYJbxQtF4Iq4bXr4JFopQig6rvoeSSfZ1cl8/e1a8626ShhhnI6iRhysHx9LygP7YBHIFdRRKXxbEuC5e7cLf5VPe+2DbTrcm0rwRQYmWXkstZAdaTtNyklYF/3WXORUWV297741/UM936MK1vFu6t3piJFmcE2VfehiGcz0tm+bdzNvf3VqiFlDSPRl/TIGgGXOr50f4GXOGya4ZkY6qSu/Y6RhZE5h+aT2mgCTdYXzSf58TjOgZDoez162rAxzeEics/8mcm3M4XsFN0E5Yutu+lJKKRmE0gNb8R7uwada5BS9gUXKCauUZicMj/3vQU2iU0WHrMXPxB6aanUbn6mtAnn0Lq6mUPDnsP6jz1PM+dhfYfRrqJZhT27mXkRI6Qo3i+JrfS68wcTGHcKOxRvHgGE2VYKnQY=
Content-ID: <4B773C5A459C2B4F92D1C4E071CF4E8A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66314494-19f6-4481-026f-08d70e7ca5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:14:41.8842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3436
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] CODING_STYLE: list further brace
 placement exceptions
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxODo0OCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+IEphbiBCZXVs
aWNoIHdyaXRlczoNCj4+IC0tLSBhL0NPRElOR19TVFlMRQ0KPj4gKysrIGIvQ09ESU5HX1NUWUxF
DQo+PiBAQCAtNjQsOCArNjQsMTMgQEAgQnJhY2luZw0KPj4gICAgLS0tLS0tLQ0KPj4NCj4+ICAg
IEJyYWNlcyAoJ3snIGFuZCAnfScpIGFyZSB1c3VhbGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhl
aXIgb3duLCBleGNlcHQNCj4+IC1mb3IgdGhlIGRvL3doaWxlIGxvb3AuICBUaGlzIGlzIHVubGlr
ZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZA0KPj4gLXVubGlrZSBLJlIuICBkby93aGlsZSBs
b29wcyBhcmUgYW4gZXhjZXB0aW9uLiBlLmcuOg0KPj4gK2Zvcg0KPj4gKy0gdGhlIGRvL3doaWxl
IGxvb3ANCj4+ICstIHRoZSBvcGVuaW5nIGJyYWNlIGluIGRlZmluaXRpb25zIG9mIGVudW0sIHN0
cnVjdCwgYW5kIHVuaW9uDQo+PiArLSB0aGUgb3BlbmluZyBicmFjZSBpbiBpbml0aWFsaXplcnMN
Cj4+ICstIGNvbXBvdW5kIGxpdGVyYWxzDQo+IExvb2tzIGxpa2UgdGhpcyBsZWF2ZXMgdXMgb25s
eSB3aXRoICJpZi9lbHNlIiwgImZvciIsICJzd2l0Y2giIGFuZA0KPiB2YXJpb3VzIGZvcm1zIG9m
ICJmb3JfZWFjaF8qIi4gU28gbWF5YmUgaXQgaXMgd29ydGggdG8gcmV3cml0ZSB0aGlzDQo+IGlu
IHRoZSBvcHBvc2l0ZSBtYW5uZXI/IExpa2UgdGhpczoNCg0KVGhhdCdzIGFuIG9wdGlvbiwgYnV0
IEknbSBub3Qgc3VyZSBJJ2Qgd2FudCB0byBnbyB0aGF0IHJvdXRlLiBOb3RlDQphbHNvIGhvdyB5
b3UgZG9uJ3QgbWVudGlvbiBlLmcuICJhc20iIGFuZCAicmV0dXJuIi4NCg0KPiBCcmFjZXMgKCd7
JyBhbmQgJ30nKSBhcmUgdXN1YWxseSBwbGFjZWQgb24gdGhlIHNhbWUgbGluZSwgZXhjZXB0IHRo
ZQ0KPiBmb2xsb3dpbmcgY2FzZXM6DQo+IA0KPiAgIC0gaWYsIGVsc2UsIGZvciwgc3dpdGNoIHN0
YXRlbWVudHMNCj4gICAtIGZvcl9lYWNoXyogaXRlcmF0b3JzIGxpa2UgZm9yX2VhY2hfdmNwdQ0K
DQpGb3IgdGhlIGxhdHRlciBJIHRoaW5rIHdlIHdhbnQgdG8gc3RpY2sgdG8gbm90IG1hbmRhdGlu
ZyBzdHlsZQ0KZWl0aGVyIHdheTogVGhlcmUncyBhbHJlYWR5IGEgZmFpciBhbW91bnQgb2YgZWl0
aGVyIG9mIHRoZSB0d28NCmxlZ2l0aW1hdGUgZm9ybXMuIEl0J3MgcmVhbGx5IGEgbWF0dGVyIG9m
IHBlcnNvbmFsIHRhc3RlIHdoZXRoZXINCnRvIGNvbnNpZGVyIHRoZXNlIHBzZXVkby1rZXl3b3Jk
cy4NCg0KPj4gK1RoaXMgaXMgdW5saWtlIHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUgYW5kIHVubGlr
ZSBLJlIuICBkby93aGlsZSBsb29wcw0KPiBUaGVyZSBpcyBleHRyYSBzcGFjZSBiZWZvcmUgImRv
L3doaWxlIi4NCg0KTm8uIEluIHN1Y2ggZG9jdW1lbnRzIGl0IGlzIHF1aXRlIGNvbW1vbiB0byBo
YXZlIGRvdWJsZSBibGFua3MNCmFmdGVyIGEgZnVsbCBzdG9wLiBTZWUgZS5nLiB0aGUgb3JpZ2lu
YWwgdGV4dCwgd2hpY2ggaGFkIHR3bw0KaW5zdGFuY2VzIG9mIHRoaXMuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
