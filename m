Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F914A54C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdFxV-0000DM-60; Tue, 18 Jun 2019 15:23:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kstG=UR=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdFxT-0000DH-SV
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 15:23:39 +0000
X-Inumbo-ID: 0b33e555-91dd-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b33e555-91dd-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVcTjGjEzvA1wyZyuZRNXKr2ktwMfNc/0oRBwa1YD3g=;
 b=QN3rOthKQuAAW0kWsFDzBr0OwLjwNFtur608V5J/Ow2Zga0YlYbSDy4qT306jKYzl7P6z4jcirCxP/LxBCWnl475t0pYMaMJBDB4bqzeWgtClupUDaMV+WI0GLL6iV7UxRszH2/kPyX9VkeYA9rlOOVWgYY4+u68p5VzURODXnQWsF3N4kh5KPtnTMkETQgWf8bH84C0NLbjJdhSzckOLLekgIGmfUA2mnnDKBQaM2/EgmuaurPbvDyW4e6lwUmnzfrMZ4vPYmJHtCkbguBIOqFPKiW8nbQA28VQxMVGtQMo6eDeyE0XbYxfFVitEyhxY3r6B2kjMXxiaORmCYZ1ww==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5025.eurprd03.prod.outlook.com (20.178.22.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 15:23:36 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Tue, 18 Jun 2019
 15:23:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
Thread-Index: AQHVIIYF6TDvIT4pIEiasF2jZbMN/KadGvGAgAQzegCAABkhAIAAHDoAgAANhYCAAAFAgA==
Date: Tue, 18 Jun 2019 15:23:35 +0000
Message-ID: <87sgs67w94.fsf@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com> <87v9x36sz1.fsf@epam.com>
 <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com> <87tvcn6k4r.fsf@epam.com>
 <341c19fc-76fc-0890-b808-8b157872b6cf@arm.com>
In-Reply-To: <341c19fc-76fc-0890-b808-8b157872b6cf@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf9d5eb7-a17c-4a41-10a1-08d6f400eeaa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5025; 
x-ms-traffictypediagnostic: AM0PR03MB5025:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB5025C2EEFD7E286D8D0B71BFE6EA0@AM0PR03MB5025.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(376002)(39860400002)(366004)(189003)(199004)(5660300002)(3846002)(66556008)(6506007)(14444005)(256004)(478600001)(446003)(14454004)(476003)(2616005)(186003)(66946007)(486006)(71200400001)(66476007)(73956011)(55236004)(91956017)(26005)(64756008)(76116006)(53546011)(99286004)(11346002)(71190400001)(7736002)(305945005)(86362001)(76176011)(2906002)(8676002)(81166006)(229853002)(6116002)(8936002)(81156014)(6436002)(6246003)(53936002)(54906003)(102836004)(66446008)(36756003)(6306002)(6512007)(316002)(6916009)(25786009)(72206003)(966005)(80792005)(4326008)(6486002)(68736007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5025;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TQ86fxOMpw2s/50PO/uQjtkBFvdF5T0MRYv4Fcyu4fGRFSXBWTGakNLCps8i5uE6l54Z4I3s7vKtsjzsm/2IqxsRNpfH8rs2W0QbOl52i2qwWJNMKyWj5Jib13MiVVOToSMcq7xVHVKWt8OHyzme6UHjQW3+aci8H/7s2Pe7VK8SwZliE9POgHrQ2OCVzzbbQ4yoA1p/UWHptOqThFTfsBPMqoPONSWNxvO4RWNXrF1VP/ZRCTQyRkyu+9o2UQdXuERZk1PLUfkuflUJlrtefc+b1ZJzaZAjubK0eMVAid/FR1n+Mkb6nLrG4Tb/wPt9iVaT1d13WUCiPFXj3/xeBCPYK04D11oiHmDuiSNugDLgw6BrNrWVhmK10VK8B6BC8mjir4iHSduHrzHYY346ooh1nI15U7VdZAF9hu3rvr0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9d5eb7-a17c-4a41-10a1-08d6f400eeaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 15:23:35.9434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5025
Subject: Re: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDYvMTgvMTkgMzozMCBQTSwgVm9sb2R5bXlyIEJh
YmNodWsgd3JvdGU6Cj4+Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBPbiAxOC8w
Ni8yMDE5IDEyOjE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pgo+Pj4+IEhpIEp1bGll
biwKPj4+Cj4+PiBIaSwKPj4+Cj4+Pj4KPj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4+Pj4g
Kwo+Pj4+Pj4gKz1pdGVtIEI8b3B0ZWU+Cj4+Pj4+PiArCj4+Pj4+PiArQWxsb3cgYSBndWVzdCB0
byB1c2UgT1AtVEVFLiBOb3RlIHRoYXQgYSB2aXJ0dWFsaXphdGlvbi1hd2FyZSBPUC1URUUKPj4+
Pj4+ICtpcyByZXF1aXJlZCBmb3IgdGhpcy4gSWYgdGhpcyBvcHRpb24gaXMgc2VsZWN0ZWQsIGd1
ZXN0IHdpbGwgYmUgYWJsZQo+Pj4+Pgo+Pj4+PiBPT0ksIHdoYXQgaGFwcGVuIGlmIE9QLVRFRSBk
b2VzIG5vdCBzdXBwb3J0IHZpcnR1YWxpemF0aW9uLiBXaWxsIFhlbgo+Pj4+PiBmb3JiaWQgdG8g
dXNlIGl0Pwo+Pj4+IFllcywgWGVuIHdpbGwgZ2V0IGFuIGVycm9yIGZyb20gT1AtVEVFIGR1cmlu
ZyBkb21haW4gY29uc3RydWN0aW9uLiBUaGlzCj4+Pj4gd2lsbCBsZWFkIHRvIGRvbWFpbiBjcmVh
dGlvbiBmYWlsdXJlLgo+Pj4KPj4+IFRoaXMgaXMgYSBiaXQgb2RkLiBJdCBtZWFucyB3ZSBoYXZl
IG5vIHdheSB0byBrbm93IGluIGFkdmFuY2Ugd2hldGhlcgo+Pj4gT1AtVEVFIHdpbGwgYmUgYWJs
ZSB0byBjcmVhdGUgYSBjbGllbnQuCj4+IFllcy4gVGhlcmUgY2FuIGJlIGF0IGxlYXN0IHR3byBy
ZWFzb25zIGZvciB0aGlzOgo+PiAxLiBPUC1URUUgaXMgYnVpbHQgd2l0aG91dCB2aXJ0dWFsaXph
dGlvbiBzdXBwb3J0IGF0IGFsbAo+PiAyLiBPUC1URUUgaGF2ZSBubyByZXNvdXJjZXMgZm9yIGEg
bmV3IGd1ZXN0Cj4+Cj4+PiBJbiBvdGhlciB3b3JkLCB3aGVuIHRoZQo+Pj4gbWVkaWF0b3IgaXMg
YnVpbHQgaW4gWGVuLCBhbGwgZXhpc3Rpbmcgc2V0dXAgd2l0aCBPUC1URUUgKGFuZAo+Pj4gbm8t
dmlydHVhbGl6YXRpb24pIHdpbGwgZmFpbC4KPj4gUmlnaHQuIElmIHVzZXIgcHJvdmlkZXMgRFRC
IHdpdGggJ29wdGVlJyBub2RlLCBidXQgT1AtVEVFIGlzIGJ1aWxkIHdpdGhvdXQKPj4gdmlydHVh
bGl6YXRpb24gc3VwcG9ydCwgRG9tMCB3aWxsIG5vdCBiZSBjcmVhdGVkLiBUaGlzIGNhbiBiZSBm
aXhlZCBieQo+PiBhZGRpbmcgbmV3IGNhcGFiaWxpdHkgZmxhZyBpbnRvIE9QLVRFRSwgdGhhdCB0
ZWxscyBYZW4gYWJvdXQKPj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydC4gRm9yIHNvbWUgcmVhc29u
IEkgbWlzc2VkIHRoaXMgd2hlbiBJIGltcGxlbWVudGVkCj4+IFZNIHN1cHBvcnQgaW4gT1AtVEVF
IDooCj4+Cj4+PiBNeSBleHBlY3RhdGlvbiBpcyBYZW4gc2hvdWxkIGJlIGFibGUgdG8ga25vdyB3
aGV0aGVyIHRoZSBtZWRpYXRvciBjYW4gYmUgdXNlZC4KPj4gSSBuZWVkIHRvIGltcGxlbWVudCBh
ZGRpdGlvbmFsIGNhcGFiaWxpdHkgZmxhZyBpbiB0aGUgT1AtVEVFLiBUaGlzIGlzCj4+IG5vdCBz
byBoYXJkLCBidXQgaXQgd2lsbCBiZSBhdmFpbGFibGUgb25seSBpbiB0aGUgbmV4dCByZWxlYXNl
LiBGb3Igbm93LAo+PiB3ZSBjYW4gZG9jdW1lbnQgdGhpcyBsaW1pdGF0aW9uIHNvbWV3aGVyZS4K
Pgo+IElzIE9QLVRFRSBhbHJlYWR5IHJlbGVhc2VkIHdpdGggdmlydHVhbGl6YXRpb24/IElmIG5v
dCwgd2hlbiB3aWxsIGl0IGJlPwpZZXMsIE9QLVRFRSAzLjUuMCB3YXMgcmVsZWFzZWQgb24gMjYg
QXByaWwgMjAxOSBhbmQgaXQgaW5jbHVkZXMKdmlydHVhbGl6YXRpb24gc3VwcG9ydC4KCj4+Cj4+
Pj4KPj4+Pj4+ICt0byBhY2Nlc3MgdG8gdGhlIHJlYWwgT1AtVEVFIE9TIHJ1bm5pbmcgb24gdGhl
IGhvc3QuIEd1ZXN0IGNyZWF0aW9uCj4+Pj4+Cj4+Pj4+IHMvcmVhbC8vIGl0IGlzIHJlZHVuZGFu
dCB3aXRoIHRoZSByZXN0IG9mIHRoZSBzZW50ZW5jZS4gSG93ZXZlciwgaXQKPj4+Pj4gZG9lcyBu
b3QgcmVhbGx5IGFuc3dlciB0byB0aGUgcXVlc3Rpb24gcmVnYXJkaW5nIGlzb2xhdGlvbi4KPj4+
PiBZb3VyIGFzc3VtcHRpb24gaXMgY29ycmVjdCAtIE9QLVRFRSBwcm92aWRlcyBpc29sYXRpb24g
b24gaXRzIHNpZGUuCj4+Pj4KPj4+Pj4KPj4+Pj4+ICt3aWxsIGZhaWwgaWYgT1AtVEVFIGhhdmUg
bm8gcmVzb3VyY2VzIGZvciBhIG5ldyBndWVzdC4gTnVtYmVyIG9mIHN1cHBvcnRlZAo+Pj4+Pj4g
K2d1ZXN0cyBkZXBlbmRzIG9uIE9QLVRFRSBjb25maWd1cmF0aW9uLgo+Pj4+Pgo+Pj4+PiBIb3cg
YWJvdXQgdGhlIGZvbGxvd2luZyBkZXNjcmlwdGlvbiAoY29ycmVjdCBtZSBpZiBteSB1bmRlcnN0
YW5kaW5nIGlzCj4+Pj4+IHdyb25nKToKPj4+Pj4KPj4+Pj4gIkFsbG93IGEgZ3Vlc3QgdG8gYWNj
ZXNzIHRoZSBob3N0IE9QLVRFRSBPUy4gWGVuIHdpbGwgbWVkaWF0ZSB0aGUKPj4+Pj4gYWNjZXNz
IHRvIE9QLVRFRSBhbmQgdGhlIHJlc291cmNlIGlzb2xhdGlvbiB3aWxsIGJlIHByb3ZpZGVkIGRp
cmVjdGx5Cj4+Pj4+IGJ5IE9QLVRFRS4gT1AtVEVFIGl0c2VsZiBtYXkgbGltaXQgdGhlIG51bWJl
ciBvZiBndWVzdHMgdGhhdCBjYW4KPj4+Pj4gY29uY3VycmVudGx5IHVzZSBpdC4gVGhpcyByZXF1
aXJlcyBhIHZpcnR1YWxpemF0aW9uLWF3YXJlIE9QLVRFRSBmb3IKPj4+Pj4gdGhpcyB0byB3b3Jr
Lgo+Pj4+Pgo+Pj4+PiBUaGlzIGZlYXR1cmUgaXMgYSBCPHRlY2hub2xvZ3kgcHJldmlldz4uIgo+
Pj4+IFRoYXQncyBtdWNoIGJldHRlciB0aGFuIG15IHZlcnNpb24uIFRoYW5rIHlvdS4KPj4+Pgo+
Pj4+PiBIb3cgY2FuIGEgdXNlciBrbm93IHdoZXRoZXIgT1AtVEVFIHN1cHBvcnRzIHZpcnR1YWxp
emF0aW9uPyBJcyBpdAo+Pj4+PiBjb25maWd1cmFibGUgYXQgYnVpbGQ/Cj4+Pj4gWWVzLCB0aGVy
ZSBpcyBhIHNwZWNpYWwgY29uZmlndXJhdGlvbiBvcHRpb24gQ0ZHX1ZJUlRVQUxJWkFUSU9OLiBU
aGlzIGlzCj4+Pj4gY292ZXJlZCBpbiBPUC1URUUgZG9jdW1lbnRhdGlvbiBhdCBbMV0KPj4+Pgo+
Pj4+IFsxXSBodHRwczovL29wdGVlLnJlYWR0aGVkb2NzLmlvL2FyY2hpdGVjdHVyZS92aXJ0dWFs
aXphdGlvbi5odG1sCj4+Pgo+Pj4gRG8gd2UgZXhwZWN0IHRoZSBsaW5rIHRvIGJlIHN0YWJsZT8g
SWYgc28sIHRoZW4gSSB0aGluayBhIGxpbmsgaW4gdGhlCj4+PiBkb2N1bWVudGF0aW9uIHdvdWxk
IGJlIHVzZWZ1bC4KPj4gVGhpcyBpcyB0aGUgb2ZmaWNpYWwgT1AtVEVFIGRvY3VtZW50YXRpb24u
IFNvLCB5ZXMsIGl0IHNob3VsZCBiZSBzdGFibGUuCj4+IEkgY2FuIHB1dCB0aGlzIGxpbmsgaW50
byB0aGUgY29kZSBzb21ld2hlcmUuCj4KPiBJIHdvdWxkIGFkZCB0aGUgbGluayBpbiB0aGUgeGwg
ZG9jdW1lbnRhdGlvbiBhbmQgYWxzbyBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZSBvZiBwYXRjaCAj
Mi4gSSBjYW4gZG8gdGhlIGxhdGVyIG9uIGNvbW1pdC4KSXQgd291bGQgYmUgZ3JlYXQuIFRoYW5r
IHlvdS4KCgotLSAKQmVzdCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
