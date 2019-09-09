Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B27AD79C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HSl-0007C3-Jl; Mon, 09 Sep 2019 11:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cFqR=XE=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i7HSj-0007Bn-QA
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:04:01 +0000
X-Inumbo-ID: 870890e4-d2f1-11e9-978d-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::704])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 870890e4-d2f1-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 11:04:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8Q3mpRQ3Bj2O650w6Uqb0DssOj2EkXQz/yaAllcx1jqIT2Z/AYJJDhh9yi0bD47ZV0G4V2FSUVLiGQr2e0F+xg/pCL0xzosvspNi53gs3NUMdEMCmTnKdauWNqFjZ70mLTVvD913u9LhpBt/xPQkFKiArm26sGO5HVMlJGAR6yzLYOkglpAL+r54fg+3INIENUhtPpn/RPYfCi5FhaYwbdRN5ZOnJ0FMiUY7QKSCHM1egxtZyLNlOZXPX5nkCpj3o+SjZAmX2holyvYDGBVFaPaN0IXtkzZ755RSRoCRqZhZqeSgqHwPE+utMb+kjTYF25PO75XwD80LQsw1f8BVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxkzwnkHTD6obctfvif9k7k6duIrBumSddEj7Dbp8vk=;
 b=PkwTiG94YECcR2DbPcd7JSZtVX4b6H/Mm6oZ82yWdG+6pOshfZF/lTupCGhMHvPKn4TrHGTHPDnRcKJewp+hksMeBtOm4CbwD5Scank40wwBwOGZZs8TpnhVJEBTzlmitXEVs2oq4GksqI/Nyg4mSwE4gJEoToEGDOEb8QQwtpfdsIQCL9W0Sn8yWdl63EiXlBFQKUhgfUUbkEQ1+QQMN4E02s8UUZUQ4FYZEFxBHsDxuHSTIQxDpkX3ERV4S0u9e8KVeoqd3M2KFdbZin6kVzy8a+3+HjYw/9zfCt9OeLXZ6hZVX/XVMd1g3bx4kGmYa6crdAzY3DcSYsUr25+eSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxkzwnkHTD6obctfvif9k7k6duIrBumSddEj7Dbp8vk=;
 b=dwXLddvMOBa4VGFB3HUUhcUCF8KBd3/UkZfCDyS6yjRLmcJ6KGxVrc7609t1wsrBLRFpsBGHuL+i+tdLop7aUhdyd6KQVGNY87aWjI2gEt11jGEpQ2t03Sk/GdKhSIs42HuMvNF/B3upmmGufJ3l4F6mPSiZB6orjPPBvJdFaz0=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5864.eurprd02.prod.outlook.com (10.141.172.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 11:03:59 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 11:03:59 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVYmAUwzAuH5cfgUOJUZVAs8B/2acez52AgASJFgD//9szgIAAA+eA
Date: Mon, 9 Sep 2019 11:03:59 +0000
Message-ID: <749faa64-7b23-0149-ca0f-00ebd2754943@bitdefender.com>
References: <20190903140112.18806-1-aisaila@bitdefender.com>
 <569c7674-4c6e-765a-4071-884bca7d0412@suse.com>
 <7fca65bb-8936-b8c9-80df-3be4675c7b42@bitdefender.com>
 <047d5951-c922-8111-aa39-2bb0bebc5721@suse.com>
In-Reply-To: <047d5951-c922-8111-aa39-2bb0bebc5721@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30)
 To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e1beac-4c87-4bf1-1703-08d735156a9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5864; 
x-ms-traffictypediagnostic: AM7PR02MB5864:|AM7PR02MB5864:|AM7PR02MB5864:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5864442C4E07594B758BCA84ABB70@AM7PR02MB5864.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(256004)(6486002)(11346002)(66476007)(14444005)(8936002)(186003)(8676002)(81156014)(81166006)(14454004)(36756003)(76176011)(305945005)(229853002)(478600001)(86362001)(54906003)(316002)(5660300002)(7736002)(25786009)(31696002)(6512007)(2906002)(102836004)(53936002)(6246003)(52116002)(2616005)(66066001)(6116002)(3846002)(476003)(26005)(71190400001)(386003)(486006)(4326008)(99286004)(53546011)(6436002)(71200400001)(66946007)(31686004)(6506007)(66446008)(446003)(66556008)(64756008)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5864;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2TDHe9XPpNGTQZrR2muLKDKQZ8+BOGAizlBtLr4LhXsHGKeueaxu11bY3e6wKlNzwLpxgMQASWh5BjydcY2o7YPTkwlCZ/sXuFSE5AnFsHlq+QNRh3IZQsck0YKNhsG1j0cstWVZLRYZl78d+XkJB3P6qVO/+5fJWw+3+V/ChrIMXcaOum8hrAQmy8lwRQAt0S23gMA1Z7HLkAjejrwKhMR8a8VLm8gRDwtvR1/+NYNmr45YJ+i6GOha4CFVIyE2VQB2VvkPQN3ZgEw4m4NF6tdpBC3LJrS2uWqVwPHhv77zLyq4w+E2M5Aa4KwarhR/r3B6LvLlBKVHjhnqMFRS+R7MN3r4tyMDSwnlyWXu51HtMqTb0RmmYpNJn9OHq1eHr8Zx6RGpr/2mD0GE46PSEdyR70xp3241WGoTQxwYcIo=
Content-ID: <8689FFCCD0B2FA4AAF102E4AB42B875F@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e1beac-4c87-4bf1-1703-08d735156a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 11:03:59.6293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NP4QpDL+c6LVjvzQ6adUK7EJAsllgYWS7iGFho7eUSYGzDjP9oYgKGiD8sFHmO2LOtt2PO9NDeVr2CKCHuNltpmzDAPVxTcYy9+2V0RT7x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5864
Subject: Re: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA5LjA5LjIwMTkgMTM6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wOS4y
MDE5IDEyOjAxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDA2LjA5LjIw
MTkgMTg6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMTkgMTY6MDEsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiAgICAgICAgfQ0KPj4+PiArICAgIC8q
IENoZWNrIGlmIGVueSB2bV9ldmVudCB3YXMgc2VudCAqLw0KPj4+DQo+Pj4gImFueSIgYW5kIHBs
ZWFzZSBhZGQgYmxhbmsgbGluZSBhaGVhZCBvZiB5b3VyIGFkZGl0aW9uLg0KPj4NCj4+IEkgd2ls
bCBjb3JyZWN0IHRoaXMuDQo+Pg0KPj4+DQo+Pj4+ICsgICAgaWYgKCBlcnIgKQ0KPj4+PiArICAg
ICAgICBnb3RvIG91dDsNCj4+Pg0KPj4+IEFuZCB3YWl0IC0gd2h5IGRvZXMgdGhpcyBzaXQgYWZ0
ZXIgdGhlIGxvb3A/IElzIHRoYXQgYSByZS1iYXNpbmcNCj4+PiBtaXN0YWtlIGZyb20gd2hlbiB5
b3UgaGFkIHB1dCBvbiB0b3Agb2YgbXkgdW5jb21taXR0ZWQgcGF0Y2g/DQo+Pg0KPj4gVGhpcyBp
cyBkb25lIHRvIHNraXAgdGhlIG1hcHBpbmcgcGFydCBkb3duIHRoZSBsaW5lLiBJZiB0aGVyZSBp
cyBhbg0KPj4gZXJyb3IgdGhlbiB3ZSBoYXZlIHRvIHJldHVybiBfaXRfIGFuZCBub3QgdGhlIG1h
cHBpbmcuDQo+IA0KPiBCdXQgYWZ0ZXIgcmUtYmFzaW5nIHlvdSBjb3VsZCAoYW5kIGhlbmNlIGlt
byBzaG91bGQpICJnb3RvIG91dCINCj4gcmlnaHQgZnJvbSB0aGUgY29kZSBibG9iIHlvdSBhZGQg
dG8gdGhlIGxvb3AuIFdoaWNoIHdvdWxkIHRoZW4NCj4gYWxzbyBlbGltaW5hdGUgdGhlIG5lZWQg
Zm9yIG90aGVyICJlcnIiIHJlbGF0ZWQgYWRqdXN0bWVudHMgeW91DQo+IG1ha2UuDQo+IA0KDQpT
byB5b3Ugd2FudCBtZSB0byBoYXZlIHRoaXMgcGF0Y2ggYmFzZSBvbiB5b3VyICh4ODYvSFZNOiBj
b3JyZWN0IA0KaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKSBmb3IgbXVsdGktcGFnZSBjYXNlKSBw
YXRjaC4gT2ssIEkgY2FuIGRvIHRoYXQgDQppbiB0aGUgbmV4dCB2ZXJzaW9uIGJ1dCB0aGVuIGl0
IHdpbGwgbWFrZSB0aGUgcGF0Y2hlcyBkZXBlbmRlbnQgYW5kIG1pbmUgDQp3aWxsIGhhdmUgdG8g
Z28gaW4gYWZ0ZXIgYWxsIGlzIHJlc29sdmVkIGluIHlvdXIgcGF0Y2ggYW5kIHRoYXQgY291bGQg
DQp0YWtlIHNvbWUgdGltZS4NCg0KQ291bGQgSSBwcm9wb3NlIHRvIGhhdmUgdGhlIGdvdG8gbW92
ZWQgaW4gdGhlIGxvb3AgYW5kIHdoZW4geW91ciBwYXRjaCANCmlzIHJlYWR5IHRvIG1lcmdlIGp1
c3QgcmVwbGFjZSB0aGUgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7IHdpdGgNCnVwZGF0
ZV9tYXBfZXJyKGVyciwgflg4NkVNVUxfUkVUUlkpOyA/DQoNClRoYW5rcywNCkFsZXgNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
