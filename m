Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A1109DFD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:31:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZxO-0005QR-0J; Tue, 26 Nov 2019 12:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+y+=ZS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iZZxM-0005QI-4R
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:28:36 +0000
X-Inumbo-ID: 43608420-1048-11ea-a55d-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.91]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43608420-1048-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 12:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBU1NJRlhbdOqZ2Qwq1w7u3IUjQWhMR1vk3KbqMolWOuPKghSdfvOGKU2hkPMaO1yQjL4/8G6mCszusNcmxddVKLghosNZEjQ+SVe1lhBsDhKmppTHVPkJDiyp4S1tfdl0ARq5rvvT8ne9bs3w6LRL0w5hg8UUX2p/j5nzjJtZrszXFdHLMNN6WcAQ/ht8R9oMwSxAHtb8uCA/eneDOnJuOAWjZ9xsFHzpSO9VepbDsXYTdW0z5yvKIjLPFbR4er0pEOe7xvtYAMyilX1jWyzFICGRkTh5UdYM7CHHDFpWPYQh+hHA4z6LOooMwaU0gqsOSDcZvjwatCcaIiwwSqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAE3YYzL3j42CRekrltPoI+WMeM4gTVIoZmqVDB011k=;
 b=nCctaKOf1Sj1Z4AE3bKqWK6c579uSV0+K34ona5WQeMLbKpt+GP7aLyNSrMd00dRrYBVlh9yS56KMCycxaUS5i3Qf3/9E7ySS1rYQ/XRyytM38hI+utxZFbMY1VTMLkjFd/usotoPWygZ1mYPNEmaimbrFBz+4un8A/rvkZ4ttQSt9l0Yo0SADh7xgBiBEPVD+BBRK4bx+28PpqFeIzZetSaPvSPR0P+5+nmeeiIMnPXTAwEN3Krb2F7VnKHxBjWniDhLo97EdFM1gXcPvh77RKYCwEHQ4Y4OQzsxixz2727q1wvCvYWrEvCohgLUSVkAqtRhbfJCGS3vpu2URv8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAE3YYzL3j42CRekrltPoI+WMeM4gTVIoZmqVDB011k=;
 b=PD3C45K2uPGLQKMVLNsUF6v+z/S7JGwRYvhX1LwJzhLUSPUUvsRSUsqU2DDHdLxSqFdvmA9mFNgoZhcUZ3zfyaNV5ygtA4JeYzEDnz6O9NXrANzYFb2zWOfrqmSGQWmpwlD2rKDO84tVKX9kDOGMTldehG3eK4qw1PsEZarP5qc=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB3715.eurprd02.prod.outlook.com (52.134.80.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 12:28:33 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 12:28:33 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/3] x86/svm: Always intercept ICEBP
Thread-Index: AQHVpFGwuhKVZu8KoU+aySaku3gYIqedYWOA
Date: Tue, 26 Nov 2019 12:28:33 +0000
Message-ID: <f25fdcaf-4b81-898e-3a02-45c57c00e3dc@bitdefender.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
In-Reply-To: <20191126120357.13398-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0078.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::19) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2be10777-77fb-4e4f-67df-08d7726c26d7
x-ms-traffictypediagnostic: AM0PR02MB3715:|AM0PR02MB3715:|AM0PR02MB3715:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB3715FE91C0FEE6245F7B61C9AB450@AM0PR02MB3715.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(136003)(376002)(366004)(396003)(189003)(199004)(66946007)(305945005)(7736002)(256004)(64756008)(66556008)(71200400001)(316002)(8936002)(36756003)(99286004)(110136005)(54906003)(81166006)(81156014)(6486002)(71190400001)(31696002)(8676002)(6246003)(86362001)(4326008)(229853002)(6436002)(6116002)(3846002)(26005)(14454004)(31686004)(25786009)(2616005)(6506007)(102836004)(446003)(66066001)(5660300002)(386003)(53546011)(66476007)(478600001)(52116002)(186003)(66446008)(76176011)(2906002)(6512007)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3715;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nQ7ippIO+I7fuB+SWiAAQ7XBOgKKnM/as3diwi5zB3ZFH5tazguVaeTEoUe0n6/a2+Jqsv/PWIMiYF7MBpExcl1kYLeb+xMHqXu2+MbZvLCGvYaY3y+Xbno5sB3B6v2AGnt717syg8RFT4dcZUfDLq4z9sb0UT6UgQtJPpKbvifdeD0GRtn28sCLtOz9lT+jBlxf7DH0KEwX5WOixQ7b7W9mraJoSMZgMoigneTKoeYsiQz0atWqJC/TMoHBKe7ROmTYGN1128IeSjlyQc23JDNckYQ48djpc4aHXTZEjHTfH3M3MPjjJMPbqJsoOqz9CMqfJCs46sna8VYcDa0nyMgkby07ml8krC3eCZnDIiBtlwsxPW+41qdRzzJ5jjThGQlC8U9gAvg4kH0mZ75meHoHA0JmN+xpbD3uLiPUQf9RfU8fxdZ+XAvRQb1w4SgY
Content-ID: <6A12D9AC78CA14469C910ABF07563F7E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be10777-77fb-4e4f-67df-08d7726c26d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 12:28:33.2128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN997Z9R8g6P/4CdQytoOd7Otxafw8/fO9rXJodyDH6Tgws3An8LK0GE8ZpuqEAlD6nncZdLEr3//L0TXwkLHAcgw3Lg/5NfHrD230/Hp0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3715
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI2LjExLjIwMTkgMTQ6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IElDRUJQIGlz
bid0IGhhbmRsZWQgd2VsbCBieSBTVk0uDQo+IA0KPiBUaGUgVk1leGl0IHN0YXRlIGZvciBhICNE
Qi12ZWN0b3JlZCBUQVNLX1NXSVRDSCBoYXMgJXJpcCBwb2ludGluZyB0byB0aGUNCj4gYXBwcm9w
cmlhdGUgaW5zdHJ1Y3Rpb24gYm91bmRhcnkgKGZhdWx0IG9yIHRyYXAsIGFzIGFwcHJvcHJpYXRl
KSwgZXhjZXB0IGZvcg0KPiBhbiBJQ0VCUC1pbmR1Y2VkICNEQiBUQVNLX1NXSVRDSCwgd2hlcmUg
JXJpcCBwb2ludHMgYXQgdGhlIElDRUJQIGluc3RydWN0aW9uDQo+IHJhdGhlciB0aGFuIGFmdGVy
IGl0LiAgQXMgSUNFQlAgaXNuJ3QgZGlzdGluZ3Vpc2hlZCBpbiB0aGUgdmVjdG9yaW5nIGV2ZW50
DQo+IHR5cGUsIHRoZSBzdGF0ZSBpcyBhbWJpZ3VvdXMuDQo+IA0KPiBUbyBhZGQgdG8gdGhlIGNv
bmZ1c2lvbiwgYW4gSUNFQlAgd2hpY2ggb2NjdXJzIGR1ZSB0byBJbnRyb3NwZWN0aW9uDQo+IGlu
dGVyY2VwdGluZyB0aGUgaW5zdHJ1Y3Rpb24sIG9yIGZyb20geDg2X2VtdWxhdGUoKSB3aWxsIGhh
dmUgJXJpcCB1cGRhdGVkIGFzDQo+IGEgY29uc2VxdWVuY2Ugb2YgcGFydGlhbCBlbXVsYXRpb24g
cmVxdWlyZWQgdG8gaW5qZWN0IGFuIElDRUJQIGV2ZW50IGluIHRoZQ0KPiBmaXJzdCBwbGFjZS4N
Cj4gDQo+IFdlIGNvdWxkIGluIHByaW5jaXBsZSBzcG90IHRoZSBub24taW5qZWN0ZWQgY2FzZSBp
biB0aGUgVEFTS19TV0lUQ0ggaGFuZGxlciwNCj4gYnV0IHRoaXMgc3RpbGwgcmVzdWx0cyBpbiBj
b21wbGV4aXR5IGlmIHRoZSBJQ0VCUCBpbnN0cnVjdGlvbiBhbHNvIGhhcyBhbg0KPiBJbnN0cnVj
dGlvbiBCcmVha3BvaW50IGFjdGl2ZSBvbiBpdCAod2hpY2ggZ2VudWluZWx5IGhhcyBmYXVsdCBz
ZW1hbnRpY3MpLg0KPiANCj4gVW5jb25kaXRpb25hbGx5IGludGVyY2VwdCBJQ0VCUC4gIFRoaXMg
ZG9lcyBoYXZlIGEgdHJhcCBzZW1hbnRpY3MgZm9yIHRoZQ0KPiBpbnRlcmNlcHQsIGFuZCBhbGxv
d3MgdXMgdG8gbW92ZSAlcmlwIGZvcndhcmRzIGFwcHJvcHJpYXRlbHkgYmVmb3JlIHRoZQ0KPiBU
QVNLX1NXSVRDSCBpbnRlcmNlcHQgaXMgaGl0LiAgVGhpcyBtYWtlcyB0aGUgYmVoYXZpb3VyIG9m
ICNEQi12ZWN0b3JlZA0KPiBzd2l0Y2hlcyBjb25zaXN0ZW50IGhvd2V2ZXIgdGhlIElDRUJQICNE
QiBjYW1lIGFib3V0LCBhbmQgYXZvaWRzIHNwZWNpYWwgY2FzZXMNCj4gaW4gdGhlIFRBU0tfU1dJ
VENIIGludGVyY2VwdC4NCj4gDQo+IFRoaXMgaW4gdHVybiBhbGxvd3MgZm9yIHRoZSByZW1vdmFs
IG9mIHRoZSBjb25kaXRpb25hbA0KPiBodm1fc2V0X2ljZWJwX2ludGVyY2VwdGlvbigpIGxvZ2lj
IHVzZWQgYnkgdGhlIG1vbml0b3Igc3Vic3lzdGVtLCBhcyBJQ0VCUCdzDQo+IHdpbGwgbm93IGFs
d2F5cyBiZSBzdWJtaXR0ZWQgZm9yIG1vbml0b3JpbmcgY2hlY2tzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KTEdUTS4N
Cg0KUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
