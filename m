Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA8B6186
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:38:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXIc-0001EV-LN; Wed, 18 Sep 2019 10:35:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gAYA=XN=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iAXIb-0001EQ-DN
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:35:01 +0000
X-Inumbo-ID: f70131e8-d9ff-11e9-b299-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::71b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70131e8-d9ff-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 10:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n72YCXdnntsgzHUyEHhnfErc+OvU6PSn1j0yU8iNEmOR2ygTAeawwmR0VvftaxqGLuu51/BveasC/smruXzeX7y1UVun/Zk79aCSu6S+TfN1nJp09icyan6IjwWrW+EHR2fT/Q/UYIMNIH0b0jN1+Nx+MSpJoibsGiFbWE7kcg+YcZYakIiSb+t6Gq1DpBHN4omTxkQqryMRDvgd0FHCx5Vvi9jkm3+bsCxGt0omaA6HaZ2VqTcyfXOZzkmVVyEbfE0MsNCulIrd2Qn3UiBhVyv6prvyHSoEs7Tc3hW8WA/UNDdUmZOsWpLCqArjqsfVXYyRCaENgskKII5X3D/gpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InLOt0+4Jm3EBoybIVmezWyp6/ZPaBOe1k9WOdZHpUA=;
 b=BaUSPOFUsxo/l32xUcsEsf9vudSqAXJIzJlRIsDPVqk+ovPVqT76fVTCCMUEBbUIXdQI+vHvSld96NHn9qmPlEqtirJgcXcfc51aWAAdcDT7Te20clf/ALA4qwcD8yePNEuKdWY3vVUXvpFLgP3eWSe86CjB6DMu1gjs0wjWFn0n6LW45WwfZdcwMGOvxve2JWWriDvoLy9unX1JKpgWqpNHxBrIx9uETbBLiNRCHL09Lq105z4ZeC+rUcQp0/uSXtcWRoW07+MljmInMzM8F1NjApbnQrwto2qCp9TJwJVhovoP9zlAOOul+e+GTk4tTC1/wipjTQto4P6PVztsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InLOt0+4Jm3EBoybIVmezWyp6/ZPaBOe1k9WOdZHpUA=;
 b=Sdpuc/5oZMLMqSJFC0Z9N9J39bMD6z2uV92i5oQ4922cCpdVVOnb0VQUZ6Oebq+ijA6qv+pto20qJoFo6OUeaiWAR1idduRpSUMx/GzGwtu3zBeNiUjFLNcqZy4MWnr8WZ3t2PZ2/2beQOi4AdR6w08RN+dS8UtrOUnjcRwd5Fs=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5928.eurprd02.prod.outlook.com (10.141.174.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Wed, 18 Sep 2019 10:34:58 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 10:34:58 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgCAAATfAIAAl0IA///RXgCAAAyQAIABOHCAgAANPoA=
Date: Wed, 18 Sep 2019 10:34:58 +0000
Message-ID: <451aaca8-73c7-86d7-949d-2c48654555eb@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
 <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
 <ec4138bc-687c-17db-038a-a882c6307f6f@suse.com>
In-Reply-To: <ec4138bc-687c-17db-038a-a882c6307f6f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::39) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7af03753-e025-48c4-daf7-08d73c23da51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR02MB5928; 
x-ms-traffictypediagnostic: AM7PR02MB5928:|AM7PR02MB5928:|AM7PR02MB5928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5928330716E0506F24888B73AB8E0@AM7PR02MB5928.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(71190400001)(71200400001)(229853002)(3846002)(2616005)(31686004)(14454004)(6116002)(478600001)(8936002)(81166006)(81156014)(99286004)(486006)(256004)(14444005)(66066001)(6246003)(8676002)(6486002)(186003)(66946007)(66556008)(66446008)(66476007)(26005)(6436002)(64756008)(6512007)(5660300002)(7736002)(110136005)(305945005)(54906003)(316002)(52116002)(11346002)(25786009)(386003)(86362001)(4326008)(102836004)(76176011)(446003)(2906002)(53546011)(36756003)(476003)(31696002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5928;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h43DSpddc7jgtE+L1KDst/axoHdb4jwv3pNLt3rEl0z2hN6zk6hexaL0FgXzETkYVHeRf4bX6Xm8+mEkgETKMa5BYmYaG4LMCdsvNu+r4SAMcoEWZoMcSXR6KtQDzsDnFD6+n5HyWWsiI67VTXtnBgfnkd2qnfTunHlWoyVC1vYDGKQ07U34bg2Exy68ERZwFvNMqNAg89cy+mEZwzfS/TdO140VyHUx7CZ6QzXcI2/mG6IlY2zspUiutZmE03n/7fax4s27x5jdO9CPvtRPi/GtctzNWbyKqB/2w5yZyU47wVtXoVkzmuP8kDcZs60SsLT1dMrC+6u9acDj1aUREuN1LnqyDsrX6g9vSMgCjpJ4QQc0k2N6Iins5hvyrze4kTOPtXYj5Ik0qefr9Rw+lzKHJQQMFxJh79ispMxtXmI=
Content-ID: <0D6E733E19A8FA4CBAF295D8E8C970B5@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af03753-e025-48c4-daf7-08d73c23da51
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 10:34:58.1774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojVg809gtJ9JYf6ReU/hOOBv9RrrIRJ0AtGUq7JaqBoQIpJJ35JdkQaSZdCBovmbETQhQ0iTDKVH/f7vl6iyRy/lIraDuDFOvCUO0C0YeMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5928
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
 "wl@xen.org" <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjA5LjIwMTkgMTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4y
MDE5IDE3OjA5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+PiBPbiBUdWUsIFNlcCAxNywgMjAx
OSBhdCA4OjI0IEFNIFJhenZhbiBDb2pvY2FydQ0KPj4gPHJjb2pvY2FydUBiYnUuYml0ZGVmZW5k
ZXIuYml6PiB3cm90ZToNCj4+Pg0KPj4+IE9uIDkvMTcvMTkgNToxMSBQTSwgQWxleGFuZHJ1IFN0
ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+Pj4+PiArYm9vbCBodm1fbW9uaXRvcl9jaGVja19wMm0o
dW5zaWduZWQgbG9uZyBnbGEsIGdmbl90IGdmbiwgdWludDMyX3QgcGZlYywNCj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBraW5kKQ0KPj4+Pj4+Pj4gK3sNCj4+
Pj4+Pj4+ICsgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzczsNCj4+Pj4+Pj4+ICsgICAgdm1fZXZl
bnRfcmVxdWVzdF90IHJlcSA9IHt9Ow0KPj4+Pj4+Pj4gKyAgICBwYWRkcl90IGdwYSA9IChnZm5f
dG9fZ2FkZHIoZ2ZuKSB8IChnbGEgJiB+UEFHRV9NQVNLKSk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+
PiArICAgIEFTU0VSVChjdXJyZW50LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50KTsNCj4+Pj4+
Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCA9
IGZhbHNlOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBpZiAoIHAybV9nZXRfbWVtX2FjY2Vz
cyhjdXJyZW50LT5kb21haW4sIGdmbiwgJmFjY2VzcywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWx0cDJtX3ZjcHVfaWR4KGN1cnJlbnQpKSAhPSAwICkNCj4+Pj4+Pj4+
ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4+Pj4gLi4uIG5leHQgdG8gdGhlIGNhbGwgaGVy
ZSAoYnV0IHRoZSBtYWludGFpbmVycyBvZiB0aGUgZmlsZSB3b3VsZA0KPj4+Pj4+PiBoYXZlIHRv
IGp1ZGdlIGluIHRoZSBlbmQpLiBUaGF0IHNhaWQsIEkgY29udGludWUgdG8gbm90IHVuZGVyc3Rh
bmQNCj4+Pj4+Pj4gd2h5IGEgbm90IGZvdW5kIGVudHJ5IG1lYW5zIHVucmVzdHJpY3RlZCBhY2Nl
c3MuIElzbid0IGl0DQo+Pj4+Pj4+IC0+ZGVmYXVsdF9hY2Nlc3Mgd2hpY2ggY29udHJvbHMgd2hh
dCBzdWNoIGEgInZpcnR1YWwiIGVudHJ5IHdvdWxkDQo+Pj4+Pj4+IHBlcm1pdD8NCj4+Pj4+PiBJ
J20gc29ycnkgZm9yIHRoaXMgbWlzbGVhZGluZyBjb21tZW50LiBUaGUgY29kZSBzdGF0ZXMgdGhh
dCBpZiBlbnRyeSB3YXMNCj4+Pj4+PiBub3QgZm91bmQgdGhlIGFjY2VzcyB3aWxsIGJlIGRlZmF1
bHRfYWNjZXNzIGFuZCByZXR1cm4gMC4gU28gaW4gdGhpcw0KPj4+Pj4+IGNhc2UgdGhlIGRlZmF1
bHRfYWNjZXNzIHdpbGwgYmUgY2hlY2tlZC4NCj4+Pj4+Pg0KPj4+Pj4+IC8qIElmIHJlcXVlc3Qg
dG8gZ2V0IGRlZmF1bHQgYWNjZXNzLiAqLw0KPj4+Pj4+IGlmICggZ2ZuX2VxKGdmbiwgSU5WQUxJ
RF9HRk4pICkNCj4+Pj4+PiB7DQo+Pj4+Pj4gICAgICAgICAqYWNjZXNzID0gbWVtYWNjZXNzW3Ay
bS0+ZGVmYXVsdF9hY2Nlc3NdOw0KPj4+Pj4+ICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4gfQ0K
Pj4+Pj4+DQo+Pj4+Pj4gSWYgdGhpcyBjbGVhcnMgdGhpbmcgdXAgSSBjYW4gcmVtb3ZlIHRoZSAi
Tk9URSIgcGFydCBpZiB0aGUgY29tbWVudC4NCj4+Pj4+IEknbSBhZnJhaWQgaXQgZG9lc24ndCBj
bGVhciB0aGluZ3MgdXA6IEknbSBzdGlsbCBsb3N0IGFzIHRvIHdoeQ0KPj4+Pj4gImVudHJ5IG5v
dCBmb3VuZCIgaW1wbGllcyAiZnVsbCBhY2Nlc3MiLiBBbmQgSSdtIGZ1cnRoZXIgbG9zdCBhcw0K
Pj4+Pj4gdG8gd2hhdCB0aGUgY29kZSBmcmFnbWVudCBhYm92ZSAoZGVhbGluZyB3aXRoIElOVkFM
SURfR0ZOLCBidXQNCj4+Pj4+IG5vdCByZWFsbHkgdGhlICJlbnRyeSBub3QgZm91bmQiIGNhc2Us
IHdoaWNoIHdvdWxkIGJlIElOVkFMSURfTUZODQo+Pj4+PiBjb21pbmcgYmFjayBmcm9tIGEgdHJh
bnNsYXRpb24pIGlzIHN1cHBvc2VkIHRvIHRlbGwgbWUuDQo+Pj4+Pg0KPj4+PiBJdCBpcyBzYWZl
IGVub3VnaCB0byBjb25zaWRlciBhIGludmFsaWQgbWZuIGZyb20gaG9zdHAyIHRvIGJlIGENCj4+
Pj4gdmlvbGF0aW9uLiBUaGVyZSBpcyBzdGlsbCBhIHNtYWxsIHByb2JsZW0gd2l0aCBoYXZpbmcg
dGhlIGFsdHAybSB2aWV3DQo+Pj4+IG5vdCBoYXZpbmcgdGhlIHBhZ2UgcHJvcGFnYXRlZCBmcm9t
IGhvc3RwMm0uIEluIHRoaXMgY2FzZSB3ZSBoYXZlIHRvIHVzZQ0KPj4+PiBhbHRwMm1fZ2V0X2Vm
ZmVjdGl2ZV9lbnRyeSgpLg0KPj4+DQo+Pj4gSW4gdGhlIGFic2VuY2Ugb2YgY2xlYXIgZ3VpZGFu
Y2UgZnJvbSB0aGUgSW50ZWwgU0RNIG9uIHdoYXQgdGhlIGhhcmR3YXJlDQo+Pj4gZGVmYXVsdCBp
cyBmb3IgYSBwYWdlIG5vdCBwcmVzZW50IGluIHRoZSBwMm0sIHdlIHNob3VsZCBwcm9iYWJseSBm
b2xsb3cNCj4+PiBKYW4ncyBhZHZpY2UgYW5kIGNoZWNrIHZpb2xhdGlvbnMgYWdhaW5zdCBkZWZh
dWx0X2FjY2VzcyBmb3Igc3VjaCBwYWdlcy4NCj4+DQo+PiBUaGUgU0RNIGlzIHZlcnkgY2xlYXIg
dGhhdCBwYWdlcyB0aGF0IGFyZSBub3QgcHJlc2VudCBpbiB0aGUgRVBUIGFyZSBhDQo+PiB2aW9s
YXRpb246DQo+Pg0KPj4gMjguMi4yDQo+PiBBbiBFUFQgcGFnaW5nLXN0cnVjdHVyZSBlbnRyeSBp
cyBwcmVzZW50IGlmIGFueSBvZiBiaXRzIDI6MCBpcyAxOw0KPj4gb3RoZXJ3aXNlLCB0aGUgZW50
cnkgaXMgbm90IHByZXNlbnQuIFRoZSBwcm9jZXNzb3INCj4+IGlnbm9yZXMgYml0cyA2MjozIGFu
ZCB1c2VzIHRoZSBlbnRyeSBuZWl0aGVyIHRvIHJlZmVyZW5jZSBhbm90aGVyIEVQVA0KPj4gcGFn
aW5nLXN0cnVjdHVyZSBlbnRyeSBub3IgdG8gcHJvZHVjZSBhDQo+PiBwaHlzaWNhbCBhZGRyZXNz
LiBBIHJlZmVyZW5jZSB1c2luZyBhIGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3Mgd2hvc2UNCj4+IHRy
YW5zbGF0aW9uIGVuY291bnRlcnMgYW4gRVBUIHBhZ2luZy1zdHJ1Yy0NCj4+IHR1cmUgdGhhdCBp
cyBub3QgcHJlc2VudCBjYXVzZXMgYW4gRVBUIHZpb2xhdGlvbiAoc2VlIFNlY3Rpb24gMjguMi4z
LjIpLg0KPj4NCj4+IDI4LjIuMy4yDQo+PiBFUFQgVmlvbGF0aW9ucw0KPj4gQW4gRVBUIHZpb2xh
dGlvbiBtYXkgb2NjdXIgZHVyaW5nIGFuIGFjY2VzcyB1c2luZyBhIGd1ZXN0LXBoeXNpY2FsDQo+
PiBhZGRyZXNzIHdob3NlIHRyYW5zbGF0aW9uIGRvZXMgbm90IGNhdXNlIGFuDQo+PiBFUFQgbWlz
Y29uZmlndXJhdGlvbi4gQW4gRVBUIHZpb2xhdGlvbiBvY2N1cnMgaW4gYW55IG9mIHRoZSBmb2xs
b3dpbmcNCj4+IHNpdHVhdGlvbnM6DQo+PiDigKIgVHJhbnNsYXRpb24gb2YgdGhlIGd1ZXN0LXBo
eXNpY2FsIGFkZHJlc3MgZW5jb3VudGVycyBhbiBFUFQNCj4+IHBhZ2luZy1zdHJ1Y3R1cmUgZW50
cnkgdGhhdCBpcyBub3QgcHJlc2VudCAoc2VlDQo+PiBTZWN0aW9uIDI4LjIuMikuDQo+IA0KPiBJ
J20gbm90IHN1cmUgaWYgLyBob3cgdGhpcyBoZWxwcyAob3RoZXIgdGhhbiB0byBhbnN3ZXIgUmF6
dmFuJ3MNCj4gaW1tZWRpYXRlIHF1ZXN0aW9uKTogSXQgd2FzIGZvciBhIHJlYXNvbiB0aGF0IEkg
dGFsa2VkIGFib3V0DQo+ICJ2aXJ0dWFsIiBlbnRyaWVzLCBlLmcuIG9uZXMgdGhhdCB3b3VsZCBi
ZSB0aGVyZSBpZiB0aGV5IGhhZA0KPiBiZWVuIHByb3BhZ2F0ZWQgYWxyZWFkeS4gQWxiZWl0IHBy
b3BhZ2F0ZWQgb25lcyBwcm9iYWJseSBhcmVuJ3QNCj4gYSBnb29kIGNhc2UgaGVyZSwgc2luY2Ug
dGhvc2UgZG9uJ3QgaGF2ZSBkZWZhdWx0X2FjY2Vzcw0KPiBwZXJtaXNzaW9ucyBhbnl3YXkuDQo+
IA0KPiBCdXQgYW55d2F5IC0gd2hhdCBteSBvcmlnaW5hbCByZW1hcmsgaGVyZSB3YXMgYWJvdXQg
d2FzIHRoZQ0KPiAobWlzc2luZykgZGlzdGluY3Rpb24gb2YgdGhlIGRpZmZlcmVudCBmYWlsdXJl
IG1vZGVzIG9mDQo+IHAybV9nZXRfbWVtX2FjY2VzcygpLiBGb3IgZXhhbXBsZSBJJ2QgZXhwZWN0
IGEgR0ZOIG1hcHBpbmcNCj4gdG8gcGh5c2ljYWwgbWVtb3J5IGFjY2VzcyB0byB3aGljaCBpcyBl
bXVsYXRlZCB0byBnbyB0aGUNCj4gLUVTUkNIIHJldHVybiBwYXRoLCBkdWUgdG8gSU5WQUxJRF9N
Rk4gY29taW5nIGJhY2suIFlldCBzdWNoDQo+IEdGTnMgc3RpbGwgb3VnaHQgdG8gaGF2ZSBhY2Nl
c3MgY29udHJvbHMgKGF0IGxlYXN0IGluIHRoZW9yeSkuDQo+IA0KDQpJIGFncmVlIHdpdGggdGhp
cyBhbmQgSSB0aGluayB0aGV5IHNob3VsZCBiZSB0cmVhdGVkIGFzIFhFTk1FTV9hY2Nlc3Nfbi4N
CklmIGV2ZXJ5b25lIGlzIE9LIHdpdGggdGhpcyBJIHdpbGwgYWRkIGEgLUVTUkNIIHBhdGggdGhh
dCB1c2VzIA0KWEVOTUVNX2FjY2Vzc19uIGFzIGFjY2Vzcy4NCg0KQWxleA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
