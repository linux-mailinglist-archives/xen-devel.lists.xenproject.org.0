Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CDAFAA1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i801j-0001Hd-NO; Wed, 11 Sep 2019 10:39:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4kzS=XG=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i801i-0001HV-GQ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:39:06 +0000
X-Inumbo-ID: 6037fad2-d480-11e9-ac28-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.112]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6037fad2-d480-11e9-ac28-12813bfff9fa;
 Wed, 11 Sep 2019 10:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgEhSNutkKGeCRcB7cGfqmIS6vhdYfhUwnrCRqqnAyeM4fydV7OSg4MkXv8Ex30WqmsSxziFUefuRZ6RdF9u4gwCRk5bX+smefW3AzLVN4N3IapJVjDUVe2Z35PjkiXTbdDL4EZ4vTFd9INxYdt3ruRAzaLcxavGCopQwtP7XgpfTfvzbsthJI3v/r551FeDj6ZCaLTDleyrP5H2dOpdwYmrUvij5lwZECE0YrGOQOCyN+jIZz+MIv9Ms+Hh1hOTQ+ftZmNFkrRmc2MEjRPkRu2xHCIjuaBsRmPKSHo1wTfew7OUsC0qZE03XWmslTPlILrg/q8miHK/NrzlzALEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaPD6I2leiwhoHX7G3KANSxZ21CUtOVmlQIALIc/mRU=;
 b=MovIxxhiKGW9LbHXgiGlYuTDDh+ZWEWg27KOhBaJC7NQpO5HGU2tPSWBfHSSwY2ctWBaabwN/tb/xCI5CdGzMhvD+0QQUD1Cg1Ld7sUYYDoiROH5+H5YWbVQxM45CIGDEd2jGjJ2NaFQhHA+XCstwLvTEAgUoUrPlF4b6QEARW+YHlSVRjdO2LzDB2YWTZKrSbuz0iT9XeB37yvzT6h/FlVZBToMxfXtvoC0aHp9V7SaH7jeSGTVaE4w/sxDkDmLMg6dkSwBp9+s9v5xQ8pmZXfdES9YChmotYYTF9I74mWMBkzyx/Som9t3eCSTFIqIqYjjHJv0CjpxJmKtjHYdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaPD6I2leiwhoHX7G3KANSxZ21CUtOVmlQIALIc/mRU=;
 b=LVpOEFq1QEweFdpTHmcr3s3p7mRUNfrPO+8XHhHanfRXaXNVNPgcrGgl/Djb9IcvG6UINzuR086BGHR6Jvcql4UTOCu4benb5LIiD6N87Oh4f3MNirCKVSP4pK2nYyBOiXudlCpSM29jRu8doMFhnrMeAmJ3E++9vAGT0OiN970=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5847.eurprd02.prod.outlook.com (10.255.191.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 10:39:03 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 10:39:03 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, Razvan COJOCARU
 <rcojocaru@bitdefender.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>
Thread-Topic: [PATCH v9] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVZyQz09ftstBAgkqLCbI9BLbek6cmQG2AgAALiAA=
Date: Wed, 11 Sep 2019 10:39:02 +0000
Message-ID: <e7330f19-9350-54f2-a066-730f1ab3c145@bitdefender.com>
References: <20190909153508.10847-1-aisaila@bitdefender.com>
 <4ae96ee9-192d-f790-b2cb-9d60a5aab292@suse.com>
In-Reply-To: <4ae96ee9-192d-f790-b2cb-9d60a5aab292@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31)
 To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6137922c-19fe-4499-abce-08d736a44354
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5847; 
x-ms-traffictypediagnostic: AM7PR02MB5847:|AM7PR02MB5847:|AM7PR02MB5847:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5847264110694684B99DD0DBABB10@AM7PR02MB5847.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(396003)(39860400002)(199004)(189003)(66446008)(64756008)(36756003)(25786009)(3846002)(6116002)(2906002)(71190400001)(71200400001)(6512007)(14454004)(14444005)(256004)(2501003)(229853002)(7736002)(6486002)(52116002)(8936002)(66066001)(305945005)(5660300002)(110136005)(66946007)(186003)(54906003)(53936002)(99286004)(4326008)(478600001)(6246003)(66556008)(31686004)(102836004)(446003)(31696002)(86362001)(53546011)(11346002)(2616005)(486006)(76176011)(476003)(6506007)(386003)(6436002)(26005)(316002)(8676002)(81156014)(81166006)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5847;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 17R6ivlZAqHb0Dcbzlkf0sEniiFpnWJSNUaWdiKxOPQKhA5lQ7VZID2b9OGnv+27YIE/7hJGBLB9C6ae61X+w5DvoSzLmalPfNDnb7P7iy9JgJrkozlZWwVF6Cqpv0dzqp7UH7KzAAeIJzqkonbbii/d299Mk2GM8Y3lt1CE6aAH56iKdK6r+qvbaK2dQG/nT0UTNo48OqhstKV7rVYFj/UfiDTOoZHCb+sOHUbzostXduxjT2xrqfeeUkNth5aNCWyQg74CFUBA+4hWU0X1cVqXXbg3tKe5EZE1GlyUHu/sGM9bZKxhiZa4RwaGKtTI0XJKyfwf2vxTPg8fggeLsyFZZGfamBEEeksjQETKOUD7PHBhFOlPMv1AmVqn+tN4ZsWJkdQyzx6qwHcgrgej9wROhAZfhE+Td99NgJQZ4gE=
Content-ID: <7AB40C6D2E672640B7040117408844C4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6137922c-19fe-4499-abce-08d736a44354
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 10:39:03.0084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HPNBMUPBduQN/+zrVfOF+KPIPwKAxV/1VJhNA4s210yIPDxS0418K7F9OBCL0fnISFdPrIrKwsnL5cVLNz2NlpT+MSlFaAkXN1FRACA/PV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5847
Subject: Re: [Xen-devel] [PATCH v9] x86/emulate: Send vm_event from emulate
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
 "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDExLjA5LjIwMTkgMTI6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wOS4y
MDE5IDE3OjM1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEEvRCBiaXQgd3Jp
dGVzIChvbiBwYWdlIHdhbGtzKSBjYW4gYmUgY29uc2lkZXJlZCBiZW5pZ24gYnkgYW4gaW50cm9z
cGVjdGlvbg0KPj4gYWdlbnQsIHNvIHJlY2VpdmluZyB2bV9ldmVudHMgZm9yIHRoZW0gaXMgYSBw
ZXNzaW1pemF0aW9uLiBXZSB0cnkgaGVyZSB0bw0KPj4gb3B0aW1pemUgYnkgZmlsdGVyaW5nIHRo
ZXNlIGV2ZW50cyBvdXQuDQo+PiBDdXJyZW50bHksIHdlIGFyZSBmdWxseSBlbXVsYXRpbmcgdGhl
IGluc3RydWN0aW9uIGF0IFJJUCB3aGVuIHRoZSBoYXJkd2FyZSBzZWVzDQo+PiBhbiBFUFQgZmF1
bHQgd2l0aCBucGZlYy5raW5kICE9IG5wZmVjX2tpbmRfd2l0aF9nbGEuIFRoaXMgaXMsIGhvd2V2
ZXIsDQo+PiBpbmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBs
ZWdpdGltYXRlbHkgY2F1c2UgYW4NCj4+IEVQVCBmYXVsdCBvZiBpdHMgb3duIHdoaWxlIGFjY2Vz
c2luZyBhIF9kaWZmZXJlbnRfIHBhZ2UgZnJvbSB0aGUgb3JpZ2luYWwgb25lLA0KPj4gd2hlcmUg
QS9EIHdlcmUgc2V0Lg0KPj4gVGhlIHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVt
dWxhdGlvbiwgd2hpbGUgaWdub3JpbmcgRVBUIHJlc3RyaWN0aW9ucw0KPj4gZm9yIHRoZSB3YWxr
IHBhcnQsIGFuZCB0YWtpbmcgdGhlbSBpbnRvIGFjY291bnQgZm9yIHRoZSAiYWN0dWFsIiBlbXVs
YXRpbmcgb2YNCj4+IHRoZSBpbnN0cnVjdGlvbiBhdCBSSVAuIFdoZW4gd2Ugc2VuZCBvdXQgYSB2
bV9ldmVudCwgd2UgZG9uJ3Qgd2FudCB0aGUgZW11bGF0aW9uDQo+PiB0byBjb21wbGV0ZSwgc2lu
Y2UgaW4gdGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUgdG8gdmV0byB3aGF0ZXZlciBpdCBpcyBk
b2luZy4NCj4+IFRoYXQgd291bGQgbWVhbiB0aGF0IHdlIGNhbid0IGFjdHVhbGx5IHByZXZlbnQg
YW55IG1hbGljaW91cyBhY3Rpdml0eSwgaW5zdGVhZA0KPj4gd2UnZCBvbmx5IGJlIGFibGUgdG8g
cmVwb3J0IG9uIGl0Lg0KPj4gV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVudCIgY2FzZSB3aGls
ZSBlbXVsYXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUNCj4+IGV2ZW50IG91dCBhbmQg
dGhlbiBzdXNwZW5kIHRoZSBlbXVsYXRpb24gKHJldHVybiBYODZFTVVMX1JFVFJZKS4NCj4+IEFm
dGVyIHRoZSBlbXVsYXRpb24gc3RvcHMgd2UnbGwgY2FsbCBodm1fdm1fZXZlbnRfZG9fcmVzdW1l
KCkgYWdhaW4gYWZ0ZXIgdGhlDQo+PiBpbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZl
bnQgYW5kIHJlc3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlDQo+PiBpbnN0cnVjdGlvbiBhdCBS
SVAgd2lsbCBiZSBmdWxseSBlbXVsYXRlZCAod2l0aCB0aGUgRVBUIGlnbm9yZWQpIGlmIHRoZQ0K
Pj4gaW50cm9zcGVjdGlvbiBhcHBsaWNhdGlvbiBhbGxvd3MgaXQsIGFuZCB0aGUgZ3Vlc3Qgd2ls
bCBjb250aW51ZSB0byBydW4gcGFzdA0KPj4gdGhlIGluc3RydWN0aW9uLg0KPj4NCj4+IEEgY29t
bW9uIGV4YW1wbGUgaXMgaWYgdGhlIGhhcmR3YXJlIGV4aXRzIGJlY2F1c2Ugb2YgYW4gRVBUIGZh
dWx0IGNhdXNlZCBieSBhDQo+PiBwYWdlIHdhbGssIHAybV9tZW1fYWNjZXNzX2NoZWNrKCkgZGVj
aWRlcyBpZiBpdCBpcyBnb2luZyB0byBzZW5kIGEgdm1fZXZlbnQuDQo+PiBJZiB0aGUgdm1fZXZl
bnQgd2FzIHNlbnQgYW5kIGl0IHdvdWxkIGJlIHRyZWF0ZWQgc28gaXQgcnVucyB0aGUgaW5zdHJ1
Y3Rpb24NCj4+IGF0IFJJUCwgdGhhdCBpbnN0cnVjdGlvbiBtaWdodCBhbHNvIGhpdCBhIHByb3Rl
Y3RlZCBwYWdlIGFuZCBwcm92b2tlIGEgdm1fZXZlbnQuDQo+Pg0KPj4gTm93IGlmIG5wZmVjLmtp
bmQgPT0gbnBmZWNfa2luZF9pbl9ncHQgYW5kIGQtPmFyY2gubW9uaXRvci5pbmd1ZXN0X3BhZ2Vm
YXVsdF9kaXNhYmxlZA0KPj4gaXMgdHJ1ZSB0aGVuIHdlIGFyZSBpbiB0aGUgcGFnZSB3YWxrIGNh
c2UgYW5kIHdlIGNhbiBkbyB0aGlzIGVtdWxhdGlvbiBvcHRpbWl6YXRpb24NCj4+IGFuZCBlbXVs
YXRlIHRoZSBwYWdlIHdhbGsgd2hpbGUgaWdub3JpbmcgdGhlIEVQVCwgYnV0IGRvbid0IGlnbm9y
ZSB0aGUgRVBUIGZvciB0aGUNCj4+IGVtdWxhdGlvbiBvZiB0aGUgYWN0dWFsIGluc3RydWN0aW9u
Lg0KPj4NCj4+IEluIHRoZSBmaXJzdCBjYXNlIHdlIHdvdWxkIGhhdmUgMiBFUFQgZXZlbnRzLCBp
biB0aGUgc2Vjb25kIGNhc2Ugd2Ugd291bGQgaGF2ZQ0KPj4gMSBFUFQgZXZlbnQgaWYgdGhlIGlu
c3RydWN0aW9uIGF0IHRoZSBSSVAgdHJpZ2dlcnMgYW4gRVBUIGV2ZW50Lg0KPj4NCj4+IFdlIHVz
ZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIHRvIGludGVyY2VwdCByL3cgYWNjZXNzIGFuZA0K
Pj4gX19odm1fY29weSgpIHRvIGludGVyY2VwdCBleGVjIGFjY2Vzcy4NCj4gDQo+IEp1c3QgbGlr
ZSBzYWlkIGZvciB2OCAtIHRoaXMgZG9lc24ndCBsb29rIHRvIG1hdGNoIHRoZSBpbXBsZW1lbnRh
dGlvbi4NCj4gDQo+PiBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KCkgY2FuIHJldHVybiBmYWxz
ZSBpZiB0aGVyZSB3YXMgbm8gdmlvbGF0aW9uLA0KPj4gaWYgdGhlcmUgd2FzIGFuIGVycm9yIGZy
b20gbW9uaXRvcl90cmFwcygpIG9yIHAybV9nZXRfbWVtX2FjY2VzcygpLg0KPj4gUmV0dXJuaW5n
IGZhbHNlIGlmIHAybV9nZXRfbWVtX2FjY2VzcygpIGZhaWxzIGlzIG5lZWRlZCBiZWNhdXNlIHRo
ZSBFUFQNCj4+IGVudHJ5IHdpbGwgaGF2ZSByd3ggbWVtb3J5IGFjY2VzcyByaWdodHMuDQo+IA0K
PiBJIGhhdmUgdG8gYWRtaXQgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVhc29uaW5n
LCBidXQgSQ0KPiBndWVzcyBJIHNob3VsZCBsZWF2ZSBpdCB0byB0aGUgVk0gZXZlbnQgbWFpbnRh
aW5lcnMgdG8ganVkZ2UuDQo+IEluIHBhcnRpY3VsYXIgaXQncyB1bmNsZWFyIHRvIG1lIHdoeSBw
Mm1fZ2V0X21lbV9hY2Nlc3MoKQ0KPiBmYWlsdXJlIHdvdWxkIGltcGx5IHJ3eCBhY2Nlc3MuDQo+
IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vZW11bGF0ZS5jDQo+PiBAQCAtNTQ0LDEwICs1NDQsMTEgQEAgc3RhdGljIHZvaWQg
Kmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICAgICAgc3RydWN0IGh2bV9lbXVsYXRlX2N0
eHQgKmh2bWVtdWxfY3R4dCkNCj4+ICAgew0KPj4gICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBj
dXJyZW50Ow0KPj4gLSAgICB2b2lkICplcnIsICptYXBwaW5nOw0KPj4gKyAgICB2b2lkICplcnIg
PSBOVUxMLCAqbWFwcGluZzsNCj4gDQo+IEFzIGFsc28gc2FpZCBkdXJpbmcgdjggcmV2aWV3LCBJ
IGRvbid0IHRoaW5rIHRoaXMgKGFuZCB0aGUgcmVsYXRlZCkNCj4gY2hhbmdlcyBpcyBuZWVkZWQg
YW55bW9yZSBub3cgdGhhdCB5b3UndmUgbW92ZWQgeW91ciBuZXcgZ290byBpbnRvDQo+IHRoZSBs
b29wLg0KDQpJIHRob3VnaHQgaXQgaXMgc2ltcGxlciB0byBpbml0IGVyciB3aXRoIE5VTEwgYnV0
IHlvdSBhcmUgcmlnaHQgdGhlcmUgaXMgDQpubyBuZWVkIGZvciB0aGlzIGluIHRoaXMgcGF0Y2gu
IEkgd2lsbCByZXZlcnQgdGhlIGNoYW5nZXMuDQoNCj4gDQo+PiBAQCAtMjE1LDYgKzIxNyw3OSBA
QCB2b2lkIGh2bV9tb25pdG9yX2ludGVycnVwdCh1bnNpZ25lZCBpbnQgdmVjdG9yLCB1bnNpZ25l
ZCBpbnQgdHlwZSwNCj4+ICAgICAgIG1vbml0b3JfdHJhcHMoY3VycmVudCwgMSwgJnJlcSk7DQo+
PiAgIH0NCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBTZW5kIG1lbW9yeSBhY2Nlc3Mgdm1fZXZlbnRz
IGJhc2VkIG9uIHBmZWMuIFJldHVybnMgdHJ1ZSBpZiB0aGUgZXZlbnQgd2FzDQo+PiArICogc2Vu
dCBhbmQgZmFsc2UgZm9yIHAybV9nZXRfbWVtX2FjY2VzcygpIGVycm9yLCBubyB2aW9sYXRpb24g
YW5kIGV2ZW50IHNlbmQNCj4+ICsgKiBlcnJvci4gQXNzdW1lcyB0aGUgY2FsbGVyIHdpbGwgY2hl
Y2sgYXJjaC52bV9ldmVudC0+c2VuZF9ldmVudC4NCj4+ICsgKg0KPj4gKyAqIE5PVEU6IHAybV9n
ZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGlmIHRoZSBlbnRyeSB3YXMgbm90IGZvdW5kIGluIHRo
ZSBFUFQNCj4+ICsgKiAoaW4gd2hpY2ggY2FzZSBhY2Nlc3MgdG8gaXQgaXMgdW5yZXN0cmljdGVk
LCBzbyBubyB2aW9sYXRpb25zIGNhbiBvY2N1cikuDQo+PiArICogSW4gdGhpcyBjYXNlcyBpdCBp
cyBmaW5lIHRvIGNvbnRpbnVlIHRoZSBlbXVsYXRpb24uDQo+PiArICovDQo+PiArYm9vbCBodm1f
bW9uaXRvcl9jaGVja19lcHQodW5zaWduZWQgbG9uZyBnbGEsIGdmbl90IGdmbiwgdWludDMyX3Qg
cGZlYywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBraW5kKQ0KPiAN
Cj4gV2h5IGRpZCB5b3UgY2hvb3NlIHRvIGhhdmUgImVwdCIgaW4gdGhlIG5hbWUgYW5kIGFsc28g
bWVudGlvbiBpdA0KPiBpbiB0aGUgY29tbWl0PyBJcyB0aGVyZSBhbnl0aGluZyBpbiBoZXJlIHdo
aWNoIGlzbid0IGdlbmVyaWMgcDJtPw0KDQpUaGUgbmFtZSB3YXMgc3VnZ2VzdGVkIGJ5IFJhenZh
biBDb2pvY2FydS4gSSBoYXZlIG5vIHByZWZlcmVuY2UgaW4gdGhlIA0KbmFtZS4gTWF5YmUgVGFt
YXMgY2FuIHN1Z2dlc3QgYSBnb29kIG9uZS4NCg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+
IEBAIC0yMTIsOCArMjEyLDkgQEAgYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVjayhwYWRkcl90IGdw
YSwgdW5zaWduZWQgbG9uZyBnbGEsDQo+PiAgICAgICB9DQo+PiAgICAgICBpZiAoIHZtX2V2ZW50
X2NoZWNrX3JpbmcoZC0+dm1fZXZlbnRfbW9uaXRvcikgJiYNCj4+ICAgICAgICAgICAgZC0+YXJj
aC5tb25pdG9yLmluZ3Vlc3RfcGFnZWZhdWx0X2Rpc2FibGVkICYmDQo+PiAtICAgICAgICAgbnBm
ZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhICkgLyogZG9uJ3Qgc2VuZCBhIG1lbV9ldmVu
dCAqLw0KPj4gKyAgICAgICAgIG5wZmVjLmtpbmQgPT0gbnBmZWNfa2luZF9pbl9ncHQgKSAvKiBk
b24ndCBzZW5kIGEgbWVtX2V2ZW50ICovDQo+PiAgICAgICB7DQo+PiArICAgICAgICB2LT5hcmNo
LnZtX2V2ZW50LT5zZW5kX2V2ZW50ID0gdHJ1ZTsNCj4gDQo+IFNpbmNlIEknbSBiZWluZyBwdXp6
bGVkIGV2ZXJ5IHRpbWUgSSBzZWUgdGhpczogVGhlIGNvbW1lbnQgYW5kDQo+IHRoZSBsaW5lIHlv
dSBhZGQgbG9vayB0byBiZSBpbiBjdXJpb3VzIGRpc2FncmVlbWVudC4gRG8geW91DQo+IHBlcmhh
cHMgd2FudCB0byBleHRlbmQgaXQgdG8gaW5jbHVkZSBzb21ldGhpbmcgbGlrZSAicmlnaHQNCj4g
YXdheSIsIG9yIG1ha2UgaXQgZS5nLiAidHJ5IHRvIGF2b2lkIHNlbmRpbmcgYSBtZW0gZXZlbnQi
Pw0KPiBQZXJzb25hbGx5IEkgdGhpbmsgaXQgd291bGRuJ3QgaHVydCB0byBldmVuIG1lbnRpb24g
dGhlICJ3aHkiDQo+IGhlcmUuDQoNCkkgYWdyZWUsIEkgd2lsbCB1cGRhdGUgdGhhdCBjb21tZW50
Lg0KDQpUaGFua3MsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
