Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5FC0523
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpL8-00065a-AD; Fri, 27 Sep 2019 12:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDpL5-00065V-V0
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:27:11 +0000
X-Inumbo-ID: 20b36e24-e122-11e9-bf31-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.49]) by localhost (Halon) with ESMTPS
 id 20b36e24-e122-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpxdPzMWflke9xHR8bkzfolnY/UbqQd6uW7ISzo+YNt06GHmgw+pfHbyZcN/6WOPWkv6d6AxUl2FGLG5TFixM0hJauXEzaP9tjcIZi8QEIF/TVO6ljptW3DSYjDvCqq9+zzs6K1+gt5Ev2jTgzqe5Uq6R6mcMQsV9SVakcFBPAI6s0BNwo7l/0L51dtTlemxrWXTsNkpGsVUuP7RvE1uToo8Eh6XHhJ13ppiQIMjWagHq+Xu8VYB4arrwt/hQXepLlYpsQ494knhcomWxCwRfupGt43Ak0M6/4OXjeqDaAti4WoUErR/BoXGnESH6+yOOKzCWyvxy+s61RV81bSQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlhtfSp1nsC7slwWwNwz8JX3dHSH5JozhFkCVzKM+zE=;
 b=Lhmy7rjCXIAeMuA3N4/rnWSxWziStCkp2dISIAKo6/PAUvBfPB4GquIk/Fr9WLCVd6IQhf5t9qgA9/bXBB7LW+JXoZzd2yDoaVCVxrjmxOe2rhJVmvcx15ATOrlKg4fi2vNHJxxaH2VNMOGWfNf+XHx2hAagK9bDcbOFirdJikQbIkN6foNNG9f4Vh4fBeK3zv+PSKbYonWvrBrq5ByqWW4wMxNQ0OJvBP/GfjBwxpzG2TuDNvoN7To9wIPQwyuCqXIEPrq9aobzXT583449tKNzeOn+wRyDvDTJeO/HOZh4LJJBdNIwfOkGer3jt0dBv02TdNxp3BswaoGJPDVj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlhtfSp1nsC7slwWwNwz8JX3dHSH5JozhFkCVzKM+zE=;
 b=oBLDGp2JhKXnbg9B0Lf1yDN3eS++oyeWct37cwr8ae/GoH418PDM9+wtU3ZEzsym+3wggRFYsWck/Wm54w0dAUmUGyJE9EmMwpPV+upRB7ifuzkyA0f7CawY5jAhCgCQXth9Nrf8613jVrivm6Y2nMY4GAYHa673OIOrGe+6Nvs=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3603.eurprd03.prod.outlook.com (52.134.87.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 12:27:09 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 12:27:09 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework entry/exit
 from the guest path
Thread-Index: AQHVdJmSYNSsXwZ/UE+SD815sb8MBKc/aNGAgAAI4oCAAALbAA==
Date: Fri, 27 Sep 2019 12:27:09 +0000
Message-ID: <87sgoh9b6r.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com> <871rw29d4s.fsf@epam.com>
 <aa4d64a4-98bf-d248-fc2e-c00bc1c76a91@arm.com>
In-Reply-To: <aa4d64a4-98bf-d248-fc2e-c00bc1c76a91@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab31d6c-89ae-486f-5b26-08d743460449
x-ms-traffictypediagnostic: AM0PR03MB3603:|AM0PR03MB3603:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB360396376AB713FCB30A0168E6810@AM0PR03MB3603.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(66476007)(305945005)(36756003)(86362001)(14454004)(478600001)(6436002)(486006)(6512007)(476003)(2616005)(6486002)(25786009)(6246003)(5660300002)(54906003)(71200400001)(316002)(71190400001)(2906002)(64756008)(6116002)(3846002)(256004)(14444005)(8676002)(81166006)(8936002)(81156014)(66066001)(66946007)(4326008)(76116006)(80792005)(55236004)(53546011)(6506007)(76176011)(26005)(102836004)(66556008)(99286004)(446003)(229853002)(11346002)(186003)(6916009)(7736002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3603;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t+ypGLWd0Rs9nVaqfTGHGfhwUQmhUGu2jFsjHDKmDdKrinfORyK/sy/4yrIRDOML3f65iGv5fgcazc5YzVDfYWBhoWN8L5tjEQtbi3trWRp3EsxjjK8/2a7TEyvCAucReVHkku2mirogrusw9xP8cYLMlQx4+IgLpPM4QStlEVdxreyZfqqc8n8iEMKDAWQNhoMhsOt9kN1zdTowIwRctkb3aNCjNsJlbmVsK2TwCX0rikbPa6dacPPFg9URxgY8DluvAKXPyeT7xcxHe/34hpedbkTLd66E8tvcA6OGAAAACO9idvsMqUhsCHMyhe+D7AMOfkhxZCXoRV5IGtb6rseFr7IZ0LgLxD1gMWsfyMngdW8zrXW7qyXxRP50fQvnEH+uN/KzOeyPMIOoQy8jgEhDz6+JrOJMTUqhj0nch7o=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab31d6c-89ae-486f-5b26-08d743460449
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:27:09.3813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCXvIldlNGjgiFC4fca4kugvv01ZdwrOloRNFk21OCInGXE/rZeA4iB7CpKh1fKBFky9zqhmYSnhzr47xi7hnMRw5CayfHsmPKDs2u4rIlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3603
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDI3LzA5LzIwMTkgMTI6NDUsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pgo+PiBKdWxpZW4sCj4KPiBIaS4uLgo+Cj4+IEp1bGllbiBHcmFsbCB3
cml0ZXM6Cj4+Cj4+PiBBdCB0aGUgbW9tZW50LCBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKSBhbmQg
bGVhdmVfaHlwZXJ2aXNvcl90YWlsKCkgYXJlCj4+PiB1c2VkIHRvIGRlYWwgd2l0aCBhY3Rpb25z
IHRvIGJlIGRvbmUgYmVmb3JlL2FmdGVyIGFueSBndWVzdCByZXF1ZXN0IGlzCj4+PiBoYW5kbGVk
Lgo+Pj4KPj4+IFdoaWxlIHRoZXkgYXJlIG1lYW50IHRvIHdvcmsgaW4gcGFpciwgdGhlIGZvcm1l
ciBpcyBjYWxsZWQgZm9yIG1vc3Qgb2YKPj4+IHRoZSB0cmFwcywgaW5jbHVkaW5nIHRyYXBzIGZy
b20gdGhlIHNhbWUgZXhjZXB0aW9uIGxldmVsIChpLmUuCj4+PiBoeXBlcnZpc29yKSB3aGlsc3Qg
dGhlIGxhdHRlciB3aWxsIG9ubHkgYmUgY2FsbGVkIHdoZW4gcmV0dXJuaW5nIHRvIHRoZQo+Pj4g
Z3Vlc3QuCj4+Pgo+Pj4gQXMgcG9pbnRlZCBvdXQsIHRoZSBlbnRlcl9oeXBlcnZpc29yX2hlYWQo
KSBpcyBub3QgY2FsbGVkIGZyb20gYWxsIHRoZQo+Pj4gdHJhcHMsIHNvIHRoaXMgbWFrZXMgcG90
ZW50aWFsbHkgZGlmZmljdWx0IHRvIGV4dGVuZCBpdCBmb3IgdGhlIGRlYWxpbmcKPj4+IHdpdGgg
c2FtZSBleGNlcHRpb24gbGV2ZWwuCj4+Pgo+Pj4gRnVydGhlcm1vcmUsIHNvbWUgYXNzZW1ibHkg
b25seSBwYXRoIHdpbGwgcmVxdWlyZSB0byBjYWxsCj4+PiBlbnRlcl9oeXBlcnZpc29yX3RhaWwo
KS4gU28gdGhlIGZ1bmN0aW9uIGlzIG5vdyBkaXJlY3RseSBjYWxsIGJ5Cj4+PiBhc3NlbWJseSBp
biBmb3IgZ3Vlc3QgdmVjdG9yIG9ubHkuIFRoaXMgbWVhbnMgdGhhdCB0aGUgY2hlY2sgd2hldGhl
ciB3ZQo+Pj4gYXJlIGNhbGxlZCBpbiBhIGd1ZXN0IHRyYXAgY2FuIG5vdyBiZSByZW1vdmVkLgo+
Pj4KPj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbmFtZSBlbnRlcl9oeXBlcnZpc29yX3Rh
aWwoKSBhbmQKPj4+IGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIHRvIHNvbWV0aGluZyBtb3JlIG1l
YW5pbmdmdWwgYW5kIGRvY3VtZW50IHRoZW0uCj4+PiBUaGlzIHNob3VsZCBoZWxwIGV2ZXJ5b25l
IHRvIHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgdGhlIHR3bwo+Pj4gZnVuY3Rpb25zLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+
Pgo+Pj4gLS0tCj4+Pgo+Pj4gSSBoYXZlbid0IGRvbmUgdGhlIDMyLWJpdHMgcGFydCB5ZXQuIEkg
d2FudGVkIHRvIGdhdGhlciBmZWVkYmFjayBiZWZvcmUKPj4+IGxvb2tpbmcgaW4gZGV0YWlscyBo
b3cgdG8gaW50ZWdyYXRlIHRoYXQgd2l0aCBBcm0zMi4KPj4gSSdtIGxvb2tpbmcgYXQgcGF0Y2hl
cyBvbmUgYnkgb25lIGFuZCBpdCBpcyBsb29raW5nIG9rYXkgc28gZmFyLgo+Pgo+Pgo+Pj4gLS0t
Cj4+PiAgIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgIDQgKystCj4+PiAgIHhlbi9hcmNo
L2FybS90cmFwcy5jICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDM4
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50
cnkuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCj4+PiBpbmRleCA0MGQ5ZjNlYzhjLi45
ZWFmYWU1MTZiIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCj4+PiBAQCAtMTQ3LDcgKzE0Nyw3IEBA
Cj4+Pgo+Pj4gICAgICAgICAgIC5pZiBcaHlwID09IDAgICAgICAgICAvKiBHdWVzdCBtb2RlICov
Cj4+Pgo+Pj4gLSAgICAgICAgYmwgICAgICBsZWF2ZV9oeXBlcnZpc29yX3RhaWwgLyogRGlzYWJs
ZXMgaW50ZXJydXB0cyBvbiByZXR1cm4gKi8KPj4+ICsgICAgICAgIGJsICAgICAgbGVhdmVfaHlw
ZXJ2aXNvcl90b19ndWVzdCAvKiBEaXNhYmxlcyBpbnRlcnJ1cHRzIG9uIHJldHVybiAqLwo+Pj4K
Pj4+ICAgICAgICAgICBleGl0X2d1ZXN0IFxjb21wYXQKPj4+Cj4+PiBAQCAtMTc1LDYgKzE3NSw4
IEBACj4+PiAgICAgICAgICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5U
UllfRVhJVCkKPj4+ICAgICAgICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKPj4+ICAgICAg
ICAgICBtb3YgICAgIHgwLCBzcAo+PiBMb29rcyBsaWtlIHRoaXMgbW92IGNhbiBiZSByZW1vdmVk
IChzZWUgY29tbWVuZCBiZWxvdykuCj4+Cj4+PiArICAgICAgICBibCAgICAgIGVudGVyX2h5cGVy
dmlzb3JfZnJvbV9ndWVzdAo+Pj4gKyAgICAgICAgbW92ICAgICB4MCwgc3AKPj4+ICAgICAgICAg
ICBibCAgICAgIGRvX3RyYXBfXHRyYXAKPj4+ICAgMToKPj4+ICAgICAgICAgICBleGl0ICAgIGh5
cD0wLCBjb21wYXQ9XGNvbXBhdAo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5j
IGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+IGluZGV4IGEzYjk2MWJkMDYuLjIwYmEzNGVjOTEg
MTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPj4+IEBAIC0yMDA2LDQ3ICsyMDA2LDQ2IEBAIHN0YXRpYyBpbmxpbmUgYm9v
bCBuZWVkc19zc2JkX2ZsaXAoc3RydWN0IHZjcHUgKnYpCj4+PiAgICAgICAgICAgICAgICBjcHVf
cmVxdWlyZV9zc2JkX21pdGlnYXRpb24oKTsKPj4+ICAgfQo+Pj4KPj4+IC1zdGF0aWMgdm9pZCBl
bnRlcl9oeXBlcnZpc29yX2hlYWQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4+PiArLyoK
Pj4+ICsgKiBBY3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBhZnRlciBleGl0aW5nIHRoZSBn
dWVzdCBhbmQgYmVmb3JlIGFueQo+Pj4gKyAqIHJlcXVlc3QgZnJvbSBpdCBpcyBoYW5kbGVkLgo+
PiBNYXliZSBpdCBpcyBtZSBvbmx5LCBidXQgdGhlIHBocmFzaW5nIGlzIGNvbmZ1c2luZy4gSSBo
YWQgdG8gcmVhZCBpdCB0d28KPj4gdGltZXMgYmVmb3JlIEkgZ2V0IGl0LiBXaGF0IGFib3V0ICJB
Y3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSB3aGVuCj4+IHJhaXNpbmcgZXhjZXB0aW9uIGxl
dmVsIj8gT3IgbWF5YmUgIkFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIHdoZW4KPj4gc3dp
dGNoaW5nIGZyb20gZ3Vlc3QgdG8gaHlwZXJ2aXNvciBtb2RlIiA/Cj4KPiBJcyBpdCBhIHN1Z2dl
c3Rpb24gdG8gcmVwbGFjZSB0aGUgZnVsbCBzZW50ZW5jZSBvciBqdXN0IHRoZSBmaXJzdAo+IGJl
Zm9yZSAoaS5lLiBiZWZvcmUgJ2FuZCcpPwpUaGlzIGlzIGEgc3VnZ2VzdGlvbiBmb3IgdGhlIGZp
cnN0IHBhcnQuCgo+Pgo+Pj4gKyAqLwo+Pj4gK3ZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiBXaXRoIHRoZSBndWVzdF9tb2RlKHJl
Z3MpIGNoZWNrIHJlbW92YWwgLCB0aGlzIGZ1bmN0aW9uIGRvZXMgbm90IHVzZSByZWdzCj4+IGFu
eW1vcmUuCj4KPiBJIGhhdmUgbmVhcmx5IGRvbmUgaXQgd2hpbGUgd29ya2luZyBvbiB0aGUgc2Vy
aWVzLCBidXQgdGhlbiBJIHRob3VnaHQKPiB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciBrZWVwIGFs
bCB0aGUgZnVuY3Rpb25zIGNhbGxlZCBmcm9tIHRoZSBlbnRyeQo+IHBhdGggaW4gYXNzZW1ibHkg
c2ltaWxhci4KVGhpcyBjYW4gc2F2ZSBvbmUgYXNzZW1ibHkgaW5zdHJ1Y3Rpb24gaW4gdGhlIGVu
dHJ5IHBhdGguIEJ1dCBJJ20gbm90CnN1cmUgaWYgaXQgaXMgd29ydGggaXQuIFNvIGl0IGlzIHVw
IHRvIHlvdS4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
