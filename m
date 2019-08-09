Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E088348
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 21:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwAXP-0000ZH-Ab; Fri, 09 Aug 2019 19:26:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AvL5=WF=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hwAXN-0000ZC-Cz
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 19:26:53 +0000
X-Inumbo-ID: a24a57fe-badb-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.89]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a24a57fe-badb-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 19:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ0NKYM3MLgF8laCZxDSxiNaOrXUuMoPJ1A5t8KBllRIpLimYSskTaty+Lmz0MIRhhwqByJpnHdslvRAU1j5nKFFDibX0HwNKPHdHsKhnlKDN6At6HhamRgteCSthw/wllmBVdCVj3Qyra+b6rPwc4K3Hi0uxIceiAaSVXohNgvhSi3YhUlaeU4pssnebcJG6TZkIUTIV9eR+zuWnBbPVlFZxlrxCUoT3QCJPJdB41BudZrH6xJOqJwrdpWWRsmqMB/X3ELgWXLSEPYQoHPyWFZWaYPxbvpZvWcV0jc6MCAsUUCV4tULMc0VXJFNgDQszVbxelg68yqKxahWof/f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdVGnVqsrIwY+2HrkbrGnG2ZVChY8Bawk7fYUiUWLJE=;
 b=Ctkjbs/vFq1zU4By95Vx5i91Vyjqxj8tS/0QyaBXS702UADv3i/bVu8CpfUrmAXm4X8iPOHw3222SOEhapsTT1PFhuq/al2C0qI/LAYBt7/PO358BgJ5YmhzpNx5oCZ51aFNol31FFW5zFpcr0p/BtvI/79WzV5HOBQR3wC+KankXpPJDp9XmeOd8j6n55jyHeuqSFLCzIhxkeKhJlQ4iLQPX/rogtsoFWPOsnamW7MV/TWy0SfqJaafquuUSUJr7zYMOyleK0OO6fHlxOOdhVmIuloA/B9O527R1p37rhpjdB2QpCzDR9Y8hriGsaOXTcgReauObhi4yQH+47utCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdVGnVqsrIwY+2HrkbrGnG2ZVChY8Bawk7fYUiUWLJE=;
 b=GYuI5E4EYo8adZnsfghfg0z2sv6fW6PoAWTbgg6mMF45KMOg92NYpFFF1ukLMcnOpAVQvSKHDXBxmkySuYTc2pBrRb8er3uwj9qY+fo07dWiuyV2XAlvmgVXND0iMZsBwpt93fp3vd6B/5Uabzy489+MqCP6LIjCL6SmoxAT7JrhEyL2sTvP6gjSWBCrv1lZT73ZwXDwq0P5WHwWMW2edtiVxSTk1rlz1/0ht6B6SRfw/4g9gzEV0HYglilSKYkcA9lbbju+DmO0Fzvg0+y94zXWxscApGXLWoiI2kVUFxmK/8CZaz3+XRkUvjjErr10iEN/fuYBrNAf6LYWk8fhww==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5092.eurprd03.prod.outlook.com (20.178.82.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 19:26:47 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 19:26:47 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v3 5/6] xen/arm: introduce nr_spis
Thread-Index: AQHVTj7LWqlMOydw20KDZhiZwZuBxKbzNEYA
Date: Fri, 9 Aug 2019 19:26:47 +0000
Message-ID: <87imr6gmx5.fsf@epam.com>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-5-sstabellini@kernel.org>
In-Reply-To: <20190808231242.26424-5-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe054cf-18dd-4003-677e-08d71cff856d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5092; 
x-ms-traffictypediagnostic: AM0PR03MB5092:|AM0PR03MB5092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5092276AB32CBB7A8563C21CE6D60@AM0PR03MB5092.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(26005)(55236004)(76176011)(478600001)(6506007)(186003)(6916009)(86362001)(8676002)(4326008)(8936002)(66066001)(80792005)(99286004)(71190400001)(76116006)(66946007)(102836004)(14454004)(71200400001)(91956017)(6116002)(64756008)(6512007)(66556008)(81156014)(66476007)(305945005)(81166006)(6486002)(2906002)(53936002)(476003)(486006)(316002)(256004)(446003)(229853002)(11346002)(66446008)(36756003)(5660300002)(54906003)(25786009)(6246003)(6436002)(3846002)(2616005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5092;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FFs2nNYqwQwQKUMpidWF7Wb+DjUb1uw5CqYMwcxo9Oq8s+1Npg/eOIckV0MbkI2w36flGDFuVWm7RR5KXjoagjJiVHvJB3Od3d2aTFMt5x3vZxf79UAUz2IBFd9j6MxQkyER6WcrYA8lMbnmD58eO0KtoypSq3hjZX3TCRHWlIZU/j4YY+WwIKOXpXbPumdn8bmV+jhTSP0yibtLKa5ynnl59Kqvj73TZRJAfsZj7vVj1fnGdBaem/ozjtSX8vgayYo6wPhU8z9BIDUd/ucXG7PyJbhlm9XVuGA4WVekzdRyz88/y/noqzWDPOe3zIWM6iyQKEBeA+w5c9VQP3j8AKgAQcJ2KZEvjVIlARJLeDnKo6dblJ1PyHDdSKebgf3GgW2LCKY8l8qx1Tp4A3sGfaKfX+nJAJcMlNRC8qwOzBI=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe054cf-18dd-4003-677e-08d71cff856d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 19:26:47.5879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xw+4VgQN29PDX4g/o6XapDG/WCLuCJiF03piCwPcvBJA4efN9BeYnMGAhsBqhxd8SgGDQ+Nc9i2MIanmwvcUry+6eEKVXMourG+U7jlwMx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5092
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: introduce nr_spis
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Achin.Gupta@arm.com" <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBXZSBkb24ndCBoYXZlIGEg
Y2xlYXIgd2F5IHRvIGtub3cgaG93IG1hbnkgdmlydHVhbCBTUElzIHdlIG5lZWQgZm9yIHRoZQo+
IGJvb3QgZG9tYWlucy4gSW50cm9kdWNlIGEgbmV3IG9wdGlvbiB1bmRlciB4ZW4sZG9tYWluIHRv
IHNwZWNpZnkgdGhlCj4gbnVtYmVyIG9mIFNQSXMgdG8gYWxsb2NhdGUgZm9yIHRoZSBkb21haW4u
Cj4KPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwsIHdoZW4gYWJzZW50LCB3ZSdsbCB1c2UgdGhl
IHBoeXNpY2FsIG51bWJlciBvZgo+IGdpYyBsaW5lcyBmb3IgZG9tMGxlc3MgZG9tYWlucywganVz
dCBsaWtlIGZvciBkb20wLiBHaXZlbiB0aGF0IGRvbTBsZXNzCj4gVk1zIGFyZSBtZWFudCBmb3Ig
c3RhdGljIHBhcnRpdGlvbmluZyBzY2VuYXJpb3Mgd2hlcmUgdGhlIG51bWJlciBvZiBWTXMKPiBp
cyB2ZXJ5IGxvdywgaW5jcmVhc2VkIG1lbW9yeSBvdmVyaGVhZCBzaG91bGQgbm90IGJlIGEgcHJv
YmxlbSwgYW5kIGl0Cj4gaXMgcG9zc2libGUgdG8gbWluaW1pemluZyBpdCBieSB1c2luZyAibnJf
c3BpcyIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhp
bGlueC5jb20+ClJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNo
dWtAZXBhbS5jb20+Cgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBpbXByb3ZlIGNvbW1pdCBt
ZXNzYWdlCj4gLSBpbnRyb2R1Y2UgbnJfc3Bpcwo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgfCA3ICsrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCAwMDU3YTUwOWQxLi5mYzRl
NWJjNGNhIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0yMjcwLDcgKzIyNzAsNiBAQCB2b2lk
IF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkKPiAgICAgICAgICBzdHJ1Y3QgZG9tYWluICpkOwo+
ICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBkX2NmZyA9IHsKPiAgICAg
ICAgICAgICAgLmFyY2guZ2ljX3ZlcnNpb24gPSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfTkFUSVZF
LAo+IC0gICAgICAgICAgICAuYXJjaC5ucl9zcGlzID0gMCwKPiAgICAgICAgICAgICAgLmZsYWdz
ID0gWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IHwgWEVOX0RPTUNUTF9DREZfaGFwLAo+ICAgICAg
ICAgICAgICAubWF4X2V2dGNobl9wb3J0ID0gLTEsCj4gICAgICAgICAgICAgIC5tYXhfZ3JhbnRf
ZnJhbWVzID0gNjQsCj4gQEAgLTIyODAsMTMgKzIyNzksMTMgQEAgdm9pZCBfX2luaXQgY3JlYXRl
X2RvbVVzKHZvaWQpCj4gICAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9k
ZSwgInhlbixkb21haW4iKSApCj4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAKPiAtICAgICAg
ICBpZiAoIGR0X3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAidnBsMDExIikgKQo+IC0gICAgICAg
ICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBHVUVTVF9WUEwwMTFfU1BJIC0gMzIgKyAxOwo+IC0K
PiAgICAgICAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiY3B1cyIsICZkX2Nm
Zy5tYXhfdmNwdXMpICkKPiAgICAgICAgICAgICAgcGFuaWMoIk1pc3NpbmcgcHJvcGVydHkgJ2Nw
dXMnIGZvciBkb21haW4gJXNcbiIsCj4gICAgICAgICAgICAgICAgICAgIGR0X25vZGVfbmFtZShu
b2RlKSk7Cj4gIAo+ICsgICAgICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJu
cl9zcGlzIiwgJmRfY2ZnLmFyY2gubnJfc3BpcykgKQo+ICsgICAgICAgICAgICBkX2NmZy5hcmNo
Lm5yX3NwaXMgPSBnaWNfbnVtYmVyX2xpbmVzKCkgLSAzMjsKPiArCj4gICAgICAgICAgZCA9IGRv
bWFpbl9jcmVhdGUoKyttYXhfaW5pdF9kb21pZCwgJmRfY2ZnLCBmYWxzZSk7Cj4gICAgICAgICAg
aWYgKCBJU19FUlIoZCkgKQo+ICAgICAgICAgICAgICBwYW5pYygiRXJyb3IgY3JlYXRpbmcgZG9t
YWluICVzXG4iLCBkdF9ub2RlX25hbWUobm9kZSkpOwoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBh
dCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
