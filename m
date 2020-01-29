Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F214CE04
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:11:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpsZ-0007mm-Ni; Wed, 29 Jan 2020 16:07:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1G7b=3S=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iwpsY-0007mh-O9
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:07:46 +0000
X-Inumbo-ID: 7b53671c-42b1-11ea-890c-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b53671c-42b1-11ea-890c-12813bfff9fa;
 Wed, 29 Jan 2020 16:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brrh18XASr/FPxW06+fy2dvck19HQ7ZdhqyNW8Srt5RVzLYiFN5joenddq8FZ1DuKWZ/3/F5lSES7VVC59V7MPC8TsB7AhR1LBncxa2Vw+wkpTA6GKYCg9dbpnTjPMSRU/QJ0Z65V0i5K4PZqUiRYxZ8I82FIEP+xo+dMOPdfmYjf32zLUzYLJqAb9su343PwbjzmzpSox6IYBUXIsNH58+Zl9BNfTmqCzrT4fS5HHvF2X5fchDd5BpzN9bAT3kx0DjrbYWoHg0m5CHJtspBxBDk+0Bhh7bgadrWRwIXFoybvjSO8DiOlphBS9UzMWSBGtIt/AbTecYULu3e4jT8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egpBj0puFRNHzj57pAhC2RxY+jNXmY/TzmHzBQs3Eys=;
 b=J6A9TDSsFfQ33NjZz+C8qWkx+Z5kKa8s7PPpdsAARdOwO6x4vTYbGpAm6qLi74cu4ZHbEplNTGiNNWF5mOZ9isGXT3ciVNnG/scbU0K2WNq14Q8VeoEEt45yqvJJQZC/0PRletZhCcKbAQZ3vA5TnttAcylJ+FQEcwsJc4v6X16gjiKzWdvC7Njm9dcY3OV0fDCq8sryyjDLqy0FlmXogPMBsjQjp/XVCb/DSgd+Q30IJ53w3uH8SE0takul5K3u9Mf3YgzgKx8w8knNiewAmfVX3CP9WJZGKHPDF7i5xR/bECQQZGp6JetUUUAyNETxpzIoGAH91h25jo4TnC0m0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egpBj0puFRNHzj57pAhC2RxY+jNXmY/TzmHzBQs3Eys=;
 b=djTj5B6RPvrm1bwGUw22btCVymbdVOlNgHUdoV2Zlv+1FPTpQ2LmqbDeOOeKbw6ELsakJXLYwkboSl7Ybr8I50Jv4ZyfiEUQNgOdMqUvfcKJq4zrNVNbkL6ijxYuHqeKB9FII/EBxe6QHXXPrPs5WJmIt+EBAyLz+Jn+s/2YzFo=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4034.eurprd03.prod.outlook.com (52.135.147.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21; Wed, 29 Jan 2020 16:07:42 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1%5]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 16:07:42 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Thread-Topic: [PATCH] iommu/arm: Don't allow the same micro-TLB to be shared
 between domains
Thread-Index: AQHV1rQn7uvWmtBMUUCKekbfSzRsQagBzvuA
Date: Wed, 29 Jan 2020 16:07:42 +0000
Message-ID: <874kwep7pe.fsf@epam.com>
References: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99bf1325-008e-4ebe-7c5f-08d7a4d55ed6
x-ms-traffictypediagnostic: AM0PR03MB4034:|AM0PR03MB4034:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB40345EA58233DC427D948739E6050@AM0PR03MB4034.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(8936002)(64756008)(66446008)(66556008)(81156014)(81166006)(8676002)(478600001)(76116006)(66476007)(66946007)(4326008)(6486002)(2616005)(86362001)(6512007)(2906002)(71200400001)(6506007)(36756003)(55236004)(316002)(5660300002)(54906003)(6916009)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4034;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fBhC+CKRGm6cuPKjO4ChG9m3QTCHNHDl8CQfKXnkF/9et9DZmCBHWPj5lJCRUev6D5UgUHcVpEoG2TJ4P+YsmhWTUT4SktOOeQNv7LMOn565DKQ3BWixOZHhuq6zA8SEH9BSAEAaBMegl41ehr35OvahrhfN6KIfpSxZhvOudoVyJ1Fe0PR96wslFJ7fhdh0klibQGwQzE+WFzwHqJ+SQBIrufkKf+rCYDhbk/+qLVtunlpzHH6VFnL0BiUUeKMI/wxJUnxQUSB9SXG08S1O/v0tNGsD0+bsNQWFifQh4mdUjwC9NafFqVeBZaIIxAl0FBhg2jv8mFVQ86W2zB2q9/n5a+ARiNFoinUpwxJKhDY59rwsHGnjwVkcjTyhE/0qsvMta8ww+GOp6YIBHxoP1sHLu+7f1J8RaFpdr8XVQsRDdtPSyy3E1elsD2fEVux
x-ms-exchange-antispam-messagedata: KsXFdwJ+jDXLZxcs4A3XdAsp1Ods5jtykarZ37Gerw6Np7YImw+5MVOk0vfVNxY07hc8I4qHgV4SSwdniwVt5DfHKFZuGCqMPL+Kjdhy7cf6xuh9tIZ9kGP80K28KwLDMut/qYyyDus0rLSz5X3oog==
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bf1325-008e-4ebe-7c5f-08d7a4d55ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 16:07:42.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gi37wJ6TsKKDDBNXS3z2JSow+T6OcDFx3Hyfi+f/DDBnI52n2J7xM7w2ZSupmFsdJ6/pYjOP12vVPneomZTv4wlvqasrxxHTpAK0l682uLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4034
Subject: Re: [Xen-devel] [PATCH] iommu/arm: Don't allow the same micro-TLB
 to be shared between domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIE9sZWtzYW5kciwKCk9sZWtzYW5kciBUeXNoY2hlbmtvIHdyaXRlczoKClsuLi5dCj4gQEAg
LTQzNCwxOSArNDM1LDQ1IEBAIHN0YXRpYyB2b2lkIGlwbW11X3RsYl9pbnZhbGlkYXRlKHN0cnVj
dCBpcG1tdV92bXNhX2RvbWFpbiAqZG9tYWluKQo+ICB9Cj4gIAo+ICAvKiBFbmFibGUgTU1VIHRy
YW5zbGF0aW9uIGZvciB0aGUgbWljcm8tVExCLiAqLwo+IC1zdGF0aWMgdm9pZCBpcG1tdV91dGxi
X2VuYWJsZShzdHJ1Y3QgaXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbiwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHV0bGIpCj4gK3N0YXRpYyBpbnQgaXBtbXVf
dXRsYl9lbmFibGUoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHV0bGIpCj4gIHsKPiAgICAgIHN0cnVj
dCBpcG1tdV92bXNhX2RldmljZSAqbW11ID0gZG9tYWluLT5tbXU7Cj4gKyAgICB1aW50MzJfdCBk
YXRhOwpKdXN0IG5pdHBpY2tpbmc6IEkgYmVsaWV2ZSwgdGhhdCAiaW11Y3RyIiBpcyBiZXR0ZXIg
bmFtZSB0aGFuICJkYXRhIi4KCj4gKwo+ICsgICAgLyoKPiArICAgICAqIFdlIG5lZWQgdG8gcHJl
dmVudCB0aGUgdXNlIGNhc2VzIHdoZXJlIGRldmljZXMgd2hpY2ggdXNlIHRoZSBzYW1lCj4gKyAg
ICAgKiBtaWNyby1UTEIgYXJlIGFzc2lnbmVkIHRvIGRpZmZlcmVudCBYZW4gZG9tYWlucyAobWlj
cm8tVExCIGNhbm5vdCBiZQo+ICsgICAgICogc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRv
bWFpbnMsIHNpbmNlIGl0IHBvaW50cyB0byB0aGUgY29udGV4dCBiYW5rCj4gKyAgICAgKiB0byB1
c2UgZm9yIHRoZSBwYWdlIHdhbGspLgo+ICsgICAgICogQXMgZWFjaCBYZW4gZG9tYWluIHVzZXMg
aW5kaXZpZHVhbCBjb250ZXh0IGJhbmsgcG9pbnRlZCBieSBjb250ZXh0X2lkLAo+ICsgICAgICog
d2UgY2FuIHBvdGVudGlhbGx5IHJlY29nbml6ZSB0aGF0IHVzZSBjYXNlIGJ5IGNvbXBhcmluZyBj
dXJyZW50IGFuZCBuZXcKPiArICAgICAqIGNvbnRleHRfaWQgZm9yIGFscmVhZHkgZW5hYmxlZCBt
aWNyby1UTEIgYW5kIHByZXZlbnQgZGlmZmVyZW50IGNvbnRleHQKPiArICAgICAqIGJhbmsgZnJv
bSBiZWluZyBzZXQuCj4gKyAgICAgKi8KPiArICAgIGRhdGEgPSBpcG1tdV9yZWFkKG1tdSwgSU1V
Q1RSKHV0bGIpKTsKSSBjYW4gc2VlIHRoYXQgdGhpcyBjb2RlIGlzIG5vdCBjb3ZlcmVkIGJ5IHNw
aW5sb2NrLiBTbywgSSBiZWxpZXZlLAp0aGVyZSBjYW4gYmUgYSByYWNlIGNvbWRpdGlvbiwgd2hl
biB0aGlzIHJlZ2lzdGVyIGlzIGJlaW5nIHJlYWQgb24gdHdvCkNQVXMgc2ltdWx0YW5lb3VzbHku
Cgo+ICsgICAgaWYgKCBkYXRhICYgSU1VQ1RSX01NVUVOICkKPiArICAgIHsKPiArICAgICAgICB1
bnNpZ25lZCBpbnQgY29udGV4dF9pZDsKPiArCj4gKyAgICAgICAgY29udGV4dF9pZCA9IChkYXRh
ICYgSU1VQ1RSX1RUU0VMX01BU0spID4+IElNVUNUUl9UVFNFTF9TSElGVDsKPiArICAgICAgICBp
ZiAoIGRvbWFpbi0+Y29udGV4dF9pZCAhPSBjb250ZXh0X2lkICkKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIGRldl9lcnIobW11LT5kZXYsICJNaWNyby1UTEIgJXUgYWxyZWFkeSBhc3NpZ25l
ZCB0byBJUE1NVSBjb250ZXh0ICV1XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgIHV0bGIsIGNv
bnRleHRfaWQpOwo+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICB9Cj4g
KyAgICB9Cj4gIAo+ICAgICAgLyoKPiAgICAgICAqIFRPRE86IFJlZmVyZW5jZS1jb3VudCB0aGUg
bWljcm8tVExCIGFzIHNldmVyYWwgYnVzIG1hc3RlcnMgY2FuIGJlCj4gLSAgICAgKiBjb25uZWN0
ZWQgdG8gdGhlIHNhbWUgbWljcm8tVExCLiBQcmV2ZW50IHRoZSB1c2UgY2FzZXMgd2hlcmUKPiAt
ICAgICAqIHRoZSBzYW1lIG1pY3JvLVRMQiBjb3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBtdWx0aXBs
ZSBYZW4gZG9tYWlucy4KPiArICAgICAqIGNvbm5lY3RlZCB0byB0aGUgc2FtZSBtaWNyby1UTEIu
Cj4gICAgICAgKi8KPiAgICAgIGlwbW11X3dyaXRlKG1tdSwgSU1VQVNJRCh1dGxiKSwgMCk7Cj4g
LSAgICBpcG1tdV93cml0ZShtbXUsIElNVUNUUih1dGxiKSwgaXBtbXVfcmVhZChtbXUsIElNVUNU
Uih1dGxiKSkgfAo+ICsgICAgaXBtbXVfd3JpdGUobW11LCBJTVVDVFIodXRsYiksIGRhdGEgfAo+
ICAgICAgICAgICAgICAgICAgSU1VQ1RSX1RUU0VMX01NVShkb21haW4tPmNvbnRleHRfaWQpIHwg
SU1VQ1RSX01NVUVOKTsKPiArCj4gKyAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAgLyogRGlzYWJs
ZSBNTVUgdHJhbnNsYXRpb24gZm9yIHRoZSBtaWNyby1UTEIuICovCj4gQEAgLTY3MSw3ICs2OTgs
MTIgQEAgc3RhdGljIGludCBpcG1tdV9hdHRhY2hfZGV2aWNlKHN0cnVjdCBpcG1tdV92bXNhX2Rv
bWFpbiAqZG9tYWluLAo+ICAgICAgICAgIGRldl9pbmZvKGRldiwgIlJldXNpbmcgSVBNTVUgY29u
dGV4dCAldVxuIiwgZG9tYWluLT5jb250ZXh0X2lkKTsKPiAgCj4gICAgICBmb3IgKCBpID0gMDsg
aSA8IGZ3c3BlYy0+bnVtX2lkczsgKytpICkKPiAtICAgICAgICBpcG1tdV91dGxiX2VuYWJsZShk
b21haW4sIGZ3c3BlYy0+aWRzW2ldKTsKPiArICAgIHsKPiArICAgICAgICBpbnQgcmV0ID0gaXBt
bXVfdXRsYl9lbmFibGUoZG9tYWluLCBmd3NwZWMtPmlkc1tpXSk7Cj4gKwo+ICsgICAgICAgIGlm
ICggcmV0ICkKPiArICAgICAgICAgICAgcmV0dXJuIHJldDsKSSBjYW4ndCBzZWUgZXJyb3IgcGF0
aCB3aGVyZSBpcG1tdV91dGxiX2Rpc2FibGUoKSB3b3VsZCBiZSBjYWxsZWQgZm9yCmFscmVhZHkg
ZW5hYmxlIHVUTEJzLiBJcyB0aGlzIG5vcm1hbD8KCj4gKyAgICB9Cj4gIAo+ICAgICAgcmV0dXJu
IDA7Cj4gIH0KCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
