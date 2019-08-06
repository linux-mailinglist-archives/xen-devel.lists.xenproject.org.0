Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47083398
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 16:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv06W-0000no-SI; Tue, 06 Aug 2019 14:06:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XUhE=WC=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hv06V-0000nj-3R
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 14:06:20 +0000
X-Inumbo-ID: 5b5772e3-b853-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.59]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b5772e3-b853-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 14:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSIAsBYj3nr/kWaqq6E9/5CPn9kjV65am/Hq852p9MxIV1eQBmTIJsf0CtB+BUlSEvuP4PPSOqLPbjDpz/f4jhHqyLepduQzcMk67gWLlfSRwutehsSAoWQhQrlFxRJeHygBTSG3HwTyfpuKTTyPNJqSa5ywqHSE6viFY076iCenQrfGorI0Tl8cEsG10v9lex6WwGvLhXgeRgV4DKg6XsfSmHG66HJbVMVpsZwbe85hP8F6aqsI/s71eUSxrSkyrBZW53W6veVSdpb339Xk8FOkOLzuqf+A/vYhnXOFQAPJjDEFiloVMF6NtDIwGangiq+9U5eY8Ae8S0+94GDV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USwkGHX8bk9yTUwN7u7lybKfUbvSszkL5rTgh4XC7Dg=;
 b=V6dH7QoLdwh0wnLkOWzBJp6Nkc0IHKc0bYyBXkYwHy7HiWWv6yAlbTUu84tEzatd3XHNl5UiQBrWLcHDOjOw5bhXQBYnXtaVPqmQj85c8aYLcxLt9agMKwZNnwEWBTBDM7LlPMNv0cAoCX4YsZjg8DgBND/3QAP9I5XPbcm6b+uN7xv5x2d2Y8624GNAFRRTnXkg2L7oCHTRg+aSCWL9NjiXNlc6XwbDGAnzGVwCcRtnWIr+4oetcbtZEV1K9SLq+MwbhYiEufovS5F5IejlVuosYOC7xKMP/6rsFMzCK8IIBJ5UfQgqAokzCKPXnc0t4wCM6RvHPyu9BIkOVLfPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USwkGHX8bk9yTUwN7u7lybKfUbvSszkL5rTgh4XC7Dg=;
 b=aFcNSI5s7Zy4Ju2QiPYqHkSXisxhJAhkBjSZLMkaMeldea241iLaXewLaoK+ZEMgGcHN/W2clSxsybXDLs5SVHg/JlniJ2dJNHeFwfDX6OhImzfOzAjzQR8t/8FHBf5Mx1g80VHD3FuIM4a9KjXc4OC1DjGFeCXqHn6aFJEGJQ0XqxBtYKuraR1B83Dp01xlC6RjZ5zZGU+DfIi0JQ7WVC9vT4hDDPXQthjvt8lku23Na1nuYT6SOsAdwzZKubGxsmlONsWTH28HMqNVy9EQ1lNs5uc4ieq6Kyp2gtbqtf7LCPCO/LZYqxkpUsXBao4eELfMvfUSx0i216tXyt+GXQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4289.eurprd03.prod.outlook.com (20.176.215.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 14:06:15 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 14:06:15 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH v6 1/2] xen/arm: extend fdt_property_interrupts to
 support DomU
Thread-Index: AQHVS4MLBg1XCGX9gUK7fZp9T8tpiabuKTEA
Date: Tue, 6 Aug 2019 14:06:15 +0000
Message-ID: <87v9vagzhl.fsf@epam.com>
References: <20190805114332.15329-1-viktor.mitin.19@gmail.com>
 <20190805114332.15329-2-viktor.mitin.19@gmail.com>
In-Reply-To: <20190805114332.15329-2-viktor.mitin.19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8249c8b-3d09-44bd-d8b2-08d71a773ec6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4289; 
x-ms-traffictypediagnostic: AM0PR03MB4289:|AM0PR03MB4289:
x-microsoft-antispam-prvs: <AM0PR03MB4289EA385C7FA120DB9433CAE6D50@AM0PR03MB4289.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(305945005)(256004)(7736002)(446003)(186003)(14444005)(107886003)(6506007)(81166006)(11346002)(4326008)(6512007)(26005)(80792005)(6246003)(2616005)(476003)(2906002)(14454004)(486006)(53936002)(102836004)(478600001)(99286004)(8936002)(8676002)(55236004)(81156014)(76176011)(25786009)(66446008)(64756008)(68736007)(66556008)(76116006)(66476007)(71190400001)(71200400001)(91956017)(66946007)(3846002)(54906003)(66066001)(229853002)(6116002)(316002)(36756003)(6916009)(5660300002)(6486002)(6436002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4289;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eWgOAVGH757PyG9ifzq3Qp3tXAySGLUWLBYrEOyL2BQ4yLqQz6C16t2ccDlqtcxrcgwRmIMlSmZNTKuzNavtEGznoXKwsXhIKf+t91j03OEGPsn45NK0InkbvmpRPLtsgSr74ycIkyL6l37f+gOs1DQwwJJ2hhX55lXwRHBqe/uImTDcbt16VG7RdlE7Y79lvVf1lSfzbElli6t7NndQYDrcXNq6cLyDJkQeo2+QzxJium7r0mN73tM8my2DvPMfrniQluwFNUHvrsWWfPwRzno3IoAR6btT1F/+Z3Qyw08YUKOYNEIEGzW4VXjZXef3EICxRjLof+6RylliH3h72P2IYCCKPdlGlANFw3mamFQ2qS4cjSJqr5kbWE6yfbiwVBwCORb+RL0RAf6uhRJQ+TSkJ1280TQg5/OU1Cjf4Io=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8249c8b-3d09-44bd-d8b2-08d71a773ec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 14:06:15.1394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4289
Subject: Re: [Xen-devel] [PATCH v6 1/2] xen/arm: extend
 fdt_property_interrupts to support DomU
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFZpa3RvciwKClZpa3RvciBNaXRpbiB3cml0ZXM6Cgo+IEV4dGVuZCBmZHRfcHJvcGVydHlf
aW50ZXJydXB0cyB0byBkZWFsIHdpdGggb3RoZXIgZG9tYWluIHRoYW4gdGhlIGh3ZG9tLgo+Cj4g
VGhlIHByb3RvdHlwZSBvZiBmZHRfcHJvcGVydHlfaW50ZXJydXB0cygpIGhhcyBiZWVuIG1vZGlm
aWVkCj4gdG8gc3VwcG9ydCBib3RoIGh3ZG9tIGFuZCBkb21VIGluIG9uZSBmdW5jdGlvbi4KPgo+
IFRoaXMgaXMgYSBwcmVwYXJhdG9yeSBmb3IgdGhlIG5leHQgcGF0Y2ggd2hpY2ggY29uc29saWRh
dGVzCj4gbWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZSIuCj4gT3JpZ2lu
YWwgZ29hbCBpcyB0byBjb25zb2xpZGF0ZSBtYWtlX3RpbWVyIGZ1bmN0aW9ucy4KPgo+IFN1Z2dl
c3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KSSBiZWxpZXZlLCBKdWxp
ZW4gYWxyZWFkeSBhc2tlZCB5b3UgdG8gaW5jbHVkZSBjaGFuZ2VzIGZyb20gcHJldmlvdXMKdmVy
c2lvbnMsIHNvIHJldmlld2VycyBjYW4gdHJhY2sgd2hhdCByZWFsbHkgY2hhbmdlZCBpbiB0aGUg
bmV3IHZlcnNpb24Kb2YgcGF0Y2hlcy4KCkFsc28geW91IG5lZWQgdG8gY29sbGVjdCBSLWIsIEEt
YiAoYW5kIGFueSBvdGhlcikgdGFncyB0aGF0IHlvdSBhbHJlYWR5CnJlY2VpdmVkLiBCdXQgbXkg
Ui1iIHRhZyBpcyBtaXNzaW5nLiBXaGljaCBpcyBnb29kIGluIHRoaXMgcGFydGljdWxhcgpjYXNl
LCBiZWNhdXNlIHlvdSBoYXZlIG1pc3NlZCBjaGFuZ2UgcmVxdWVzdCAoc2VlIGJlbG93KS4KCj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDIwICsrKysrKysrKysrKy0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYwo+IGluZGV4IDRjODQwNDE1NWEuLmJjN2QxN2RkMmMgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCj4gQEAgLTYyMSwxNyArNjIxLDIwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXRfaW50ZXJydXB0KGdpY19pbnRlcnJ1cHRfdCBpbnRlcnJ1cHQsCj4gICAqICAiaW50ZXJydXB0
cyI6IGNvbnRhaW5zIHRoZSBsaXN0IG9mIGludGVycnVwdHMKPiAgICogICJpbnRlcnJ1cHQtcGFy
ZW50IjogbGluayB0byB0aGUgR0lDCj4gICAqLwo+IC1zdGF0aWMgaW50IF9faW5pdCBmZHRfcHJv
cGVydHlfaW50ZXJydXB0cyh2b2lkICpmZHQsIGdpY19pbnRlcnJ1cHRfdCAqaW50ciwKPiArc3Rh
dGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoY29uc3Qgc3RydWN0IGtlcm5l
bF9pbmZvICpraW5mbywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2ljX2ludGVycnVwdF90ICppbnRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBudW1faXJxKQo+ICB7Cj4gICAgICBpbnQgcmVzOwo+ICsg
ICAgdWludDMyX3QgcGhhbmRsZSA9IGlzX2hhcmR3YXJlX2RvbWFpbihraW5mby0+ZCkgPwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGR0X2ludGVycnVwdF9jb250cm9sbGVyLT5waGFuZGxlIDog
R1VFU1RfUEhBTkRMRV9HSUM7Cj4KPiAtICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICJpbnRl
cnJ1cHRzIiwgaW50ciwgc2l6ZW9mIChpbnRyWzBdKSAqIG51bV9pcnEpOwo+ICsgICAgcmVzID0g
ZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsICJpbnRlcnJ1cHRzIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICBpbnRyLCBzaXplb2YgKGludHJbMF0pICogbnVtX2lycSk7CkkgaGF2ZSBtaXNzZWQg
dGhpcywgYnV0IEFuZHJldyBDb29wZXIgbm90ZWQgdGhhdCB0aGVyZSBpcyBleHRyYSBzcGFjZQph
ZnRlciAic2l6ZW9mIiwgd2hpY2ggaXMgbm90IG5lZWRlZC4gUGxlYXNlIHJlbW92ZSBpdC4KCgo+
ICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgIHJldHVybiByZXM7Cj4KPiAtICAgIHJlcyA9IGZk
dF9wcm9wZXJ0eV9jZWxsKGZkdCwgImludGVycnVwdC1wYXJlbnQiLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZHRfaW50ZXJydXB0X2NvbnRyb2xsZXItPnBoYW5kbGUpOwo+ICsgICAg
cmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoa2luZm8tPmZkdCwgImludGVycnVwdC1wYXJlbnQiLCBw
aGFuZGxlKTsKPgo+ICAgICAgcmV0dXJuIHJlczsKPiAgfQo+IEBAIC03MzMsNyArNzM2LDcgQEAg
c3RhdGljIGludCBfX2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwK
PiAgICAgICAqICBUT0RPOiBIYW5kbGUgcHJvcGVybHkgdGhlIGNwdW1hc2s7Cj4gICAgICAgKi8K
PiAgICAgIHNldF9pbnRlcnJ1cHQoaW50ciwgZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lS
UV9UWVBFX0xFVkVMX0xPVyk7Cj4gLSAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhm
ZHQsICZpbnRyLCAxKTsKPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZv
LCAmaW50ciwgMSk7Cj4gICAgICBpZiAoIHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJlczsKPgo+
IEBAIC05NjAsOCArOTYzLDkgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9naWNfbm9kZShjb25z
dCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQsCj4gICAgICByZXR1cm4gcmVzOwo+ICB9Cj4K
PiAtc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsIHZvaWQgKmZkdCkKPiArc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0
IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4gIHsKPiArICAgIHZvaWQgKmZkdCA9IGtpbmZv
LT5mZHQ7Cj4gICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1lcl9p
ZHNbXSBfX2luaXRjb25zdCA9Cj4gICAgICB7Cj4gICAgICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJM
RSgiYXJtLGFybXY3LXRpbWVyIiksCj4gQEAgLTEwMTYsNyArMTAyMCw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQp
Cj4gICAgICBkdF9kcHJpbnRrKCIgIFZpcnQgaW50ZXJydXB0ICV1XG4iLCBpcnEpOwo+ICAgICAg
c2V0X2ludGVycnVwdChpbnRyc1syXSwgaXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7
Cj4KPiAtICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwgaW50cnMsIDMpOwo+
ICsgICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoa2luZm8sIGludHJzLCAzKTsKPiAg
ICAgIGlmICggcmVzICkKPiAgICAgICAgICByZXR1cm4gcmVzOwo+Cj4gQEAgLTEzNzcsNyArMTM4
MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gICAgICBpZiAoIGRldmljZV9nZXRfY2xhc3Mobm9k
ZSkgPT0gREVWSUNFX0dJQyApCj4gICAgICAgICAgcmV0dXJuIG1ha2VfZ2ljX25vZGUoZCwga2lu
Zm8tPmZkdCwgbm9kZSk7Cj4gICAgICBpZiAoIGR0X21hdGNoX25vZGUodGltZXJfbWF0Y2hlcywg
bm9kZSkgKQo+IC0gICAgICAgIHJldHVybiBtYWtlX3RpbWVyX25vZGUoZCwga2luZm8tPmZkdCk7
Cj4gKyAgICAgICAgcmV0dXJuIG1ha2VfdGltZXJfbm9kZShraW5mbyk7Cj4KPiAgICAgIC8qIFNr
aXAgbm9kZXMgdXNlZCBieSBYZW4gKi8KPiAgICAgIGlmICggZHRfZGV2aWNlX3VzZWRfYnkobm9k
ZSkgPT0gRE9NSURfWEVOICkKCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
