Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16017462D
	for <lists+xen-devel@lfdr.de>; Sat, 29 Feb 2020 11:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7z5c-0007hq-Vs; Sat, 29 Feb 2020 10:11:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FbZ=4R=amazon.co.uk=prvs=321034fdd=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7z5a-0007hj-OI
 for xen-devel@lists.xenproject.org; Sat, 29 Feb 2020 10:11:18 +0000
X-Inumbo-ID: d2f04aca-5adb-11ea-b472-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f04aca-5adb-11ea-b472-bc764e2007e4;
 Sat, 29 Feb 2020 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582971077; x=1614507077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h2IOvEY4O/OzuoAZeyBHkRfZZot5Vvc4IBwznHWdQ9c=;
 b=VeI11bH1avzUImThYpRZFdUf/CO2dJ5MmgEPdBjkcUFY0M7CgGxlEEVB
 Io3qlwKdyVIHAYSViU+n4q5FrM57VV1OIPLdALwKOUGsmhyzzhPZ/5z0l
 iy0vHG9ZnKqjZr888aE0CoqZcnR5TuWVaJVYEtuE6FGwjoK+nq//FIi98 A=;
IronPort-SDR: ZBkp4D8Y9KQ1oANaA8s0PGnKv84R7EIVYzSy26pAhM7HffQafhRK4S339ArUj571mO72z7r6Bm
 aOcNuCahBvxQ==
X-IronPort-AV: E=Sophos;i="5.70,499,1574121600"; d="scan'208";a="29665754"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Feb 2020 10:11:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id C5D7AA2D5A; Sat, 29 Feb 2020 10:11:14 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Sat, 29 Feb 2020 10:11:14 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 29 Feb 2020 10:11:13 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 29 Feb 2020 10:11:13 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH 5/6] mm: add 'is_special_page' macro...
Thread-Index: AQHV7jrv9Hc/CsDht0ahZ56tBvdMxagw/x6AgAD1ZHA=
Date: Sat, 29 Feb 2020 10:11:13 +0000
Message-ID: <26c393b4b64d4f53b870d4467491a751@EX13D32EUC003.ant.amazon.com>
References: <20200228132749.2929-1-pdurrant@amazon.com>
 <20200228132749.2929-6-pdurrant@amazon.com>
 <CABfawhkYHX3Z_x8yhbchnOX=s3bBwjNWoBFTQW1R2sEZLJk=4g@mail.gmail.com>
In-Reply-To: <CABfawhkYHX3Z_x8yhbchnOX=s3bBwjNWoBFTQW1R2sEZLJk=4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.141]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 5/6] mm: add 'is_special_page' macro...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+DQo+IFNlbnQ6IDI4IEZlYnJ1YXJ5IDIwMjAgMTk6MzINCj4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IFhlbi1kZXZlbCA8
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNo
QHN1c2UuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdl
aSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbQ0K
PiBEZWVnYW4gPHRpbUB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDUvNl0gbW06IGFk
ZCAnaXNfc3BlY2lhbF9wYWdlJyBtYWNyby4uLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcu
Yw0KPiA+IGluZGV4IDM4MzViYzkyOGYuLmMxNGE3MjRjNmQgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X3NoYXJpbmcuYw0KPiA+IEBAIC04NDIsNyArODQyLDcgQEAgc3RhdGljIGludCBub21pbmF0ZV9w
YWdlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90DQo+IGdmbiwNCj4gPg0KPiA+ICAgICAgLyogU2tp
cCB4ZW4gaGVhcCBwYWdlcyAqLw0KPiANCj4gUGVyaGFwcyBhZGp1c3QgKG9yIHJlbW92ZSkgdGhl
IGNvbW1lbnQ/DQo+DQoNClllcy4gVGhlIGNvbW1lbnQgY2FuIGp1c3QgYmUgZHJvcHBlZCBJIHRo
aW5rLg0KDQogIFBhdWwNCiANCj4gPiAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOw0KPiA+
IC0gICAgaWYgKCAhcGFnZSB8fCBpc194ZW5faGVhcF9wYWdlKHBhZ2UpICkNCj4gPiArICAgIGlm
ICggIXBhZ2UgfHwgaXNfc3BlY2lhbF9wYWdlKHBhZ2UpICkNCj4gPiAgICAgICAgICBnb3RvIG91
dDsNCj4gDQo+IFRoYW5rcywNCj4gVGFtYXMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
