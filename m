Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F06CEAE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:16:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6E3-0007ea-Ge; Thu, 18 Jul 2019 13:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho6E1-0007eV-JF
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:13:33 +0000
X-Inumbo-ID: bbb4d856-a95d-11e9-8f24-ff062939fc6a
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbb4d856-a95d-11e9-8f24-ff062939fc6a;
 Thu, 18 Jul 2019 13:13:30 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 13:12:47 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 13:12:24 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 13:12:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVBAz3Ae0ziNbBH48w9KWLjk0NxeCbRflthROi0P+W0UvtsgAejtjzjhwGEsxTeu++6bx8tw7euhn+L33UtMpQY9fcrC369VwPunvk/MiVif23BHUTn7b3HoxnTXukQr3nIhfP64/nfCGuwk6WPDchBuUXS1iPxbdOsA7siwr+cfnws5asNZua+lLzpySVuMJQWkeU4OKd6C1C+v8gut7T5PUAtzBdFVJjsLDZcVniMcpDJg/pd/F+Zt4NEBSFjb5ruZX2omkQFSUgrq0Wkym6ZcojsSGY+FbYPHMGRipULlA9g3mxFvAkCyhfvm1EGYXPjfZiG4XFAAYAja32fZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0puy6EN6RI1btYvBm9rKZFesWiDxxDH2vTnmweYDac=;
 b=O7S2qVUoSjJTT7LfqmeznDGpkpG+1paN5ERwG+7S1VqnYsASSTak5AItQ1lPQP3weDfUWY9QNTevtvlpJ5Yf1pW5LSBaCydrGle+2mVFAer6Rrfojoxa89DujGX92juK/1BjC7HnluQxtgRhpnDP2nMmUuMMgVtAH6mJes86G0Y1a2phZZV2Yu8GeUOTZ99ld1TkeM2ecqsryWp5wJP92yrETKKofIhBGHBwa9EGyPNyImmxxuYNHm3vpk24sGSgu8pT346PBbxGUpQl4bStA4jsT7UefX/nIwAdXit3AYWnGLE1Pf/vhApNm2OxYhk9uix5p/pliLnn7zlSCUP3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2523.namprd18.prod.outlook.com (20.179.105.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 13:12:23 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:12:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluAgAAkhnuAAARMgA==
Date: Thu, 18 Jul 2019 13:12:23 +0000
Message-ID: <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
In-Reply-To: <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0028.eurprd02.prod.outlook.com
 (2603:10a6:8:1::41) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 844d4b0b-4e8b-4d64-a6c4-08d70b819258
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2523; 
x-ms-traffictypediagnostic: DM6PR18MB2523:
x-microsoft-antispam-prvs: <DM6PR18MB252383A74F41D86F2C0DFBBEB3C80@DM6PR18MB2523.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(189003)(199004)(53546011)(4326008)(386003)(6506007)(486006)(316002)(8676002)(71190400001)(71200400001)(2906002)(6512007)(66476007)(66946007)(478600001)(76176011)(476003)(2616005)(31696002)(6916009)(11346002)(6486002)(6436002)(86362001)(446003)(256004)(14444005)(229853002)(54906003)(6246003)(66066001)(64756008)(66446008)(66556008)(26005)(31686004)(186003)(14454004)(68736007)(36756003)(80792005)(81166006)(305945005)(99286004)(5660300002)(52116002)(81156014)(8936002)(6116002)(102836004)(53936002)(7736002)(3846002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2523;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nxvmw1FgqwAjFdB21SH3Y1w4z+wAfflfvQqYPHTcqoZ229KerdeyEPLo4LXUhWcOuPkXM7f/ogw4HQ+rNcWorePv5g14iSr0JQYTtRrFBOJ1mX73cLlCO/Dmubem68dNAj8QerkaoxKrtK+bat7f6cGj/7gh4rXUC1zZTH6ncbrNUtJUeJwnMmEQdPOvOa/lzYKbg9VtNhFD8qPjKLcEbE6b2OpFRwx832jehliSgQtBSP6KrBIbSccoM96vz934aFbH/pDtXrPV92MDDrlhLzPVykPFIBEQn6Tj6+lxrp8lcjUjY86DWh+EVdQ7nLmWT6QLCsDazsnHaJYFaIBlOhcJUoLvL820v/+9A7q/1brRUiYO6deKMlqtLabvJyhd7puQ/MytvxxaBDE7v6pzFUTmrpESWXUBfVxQ4uolNnM=
Content-ID: <8C46329BF4421044827DE40CED53F831@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d4b0b-4e8b-4d64-a6c4-08d70b819258
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:12:23.1074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2523
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNDo1NSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA0OjQ3IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+PiBPbiAxNy4wNy4yMDE5IDIxOjMzLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4g
QEAgLTkwMCw2ICs4OTUsNyBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4g
KnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsDQo+Pj4gICAgICAgIHAybV90eXBlX3Qg
c21mbl90eXBlLCBjbWZuX3R5cGU7DQo+Pj4gICAgICAgIHN0cnVjdCB0d29fZ2ZucyB0ZzsNCj4+
PiAgICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Igcmk7DQo+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IHB1dF9jb3VudCA9IDA7DQo+Pj4NCj4+PiAgICAgICAgZ2V0X3R3b19nZm5zKHNkLCBzZ2ZuLCAm
c21mbl90eXBlLCBOVUxMLCAmc21mbiwNCj4+PiAgICAgICAgICAgICAgICAgICAgIGNkLCBjZ2Zu
LCAmY21mbl90eXBlLCBOVUxMLCAmY21mbiwgMCwgJnRnKTsNCj4+PiBAQCAtOTY0LDE1ICs5NjAs
NiBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2Zu
LCBzaHJfaGFuZGxlX3Qgc2gsDQo+Pj4gICAgICAgICAgICBnb3RvIGVycl9vdXQ7DQo+Pj4gICAg
ICAgIH0NCj4+Pg0KPj4+IC0gICAgLyogQWNxdWlyZSBhbiBleHRyYSByZWZlcmVuY2UsIGZvciB0
aGUgZnJlZWluZyBiZWxvdyB0byBiZSBzYWZlLiAqLw0KPj4+IC0gICAgaWYgKCAhZ2V0X3BhZ2Uo
Y3BhZ2UsIGRvbV9jb3cpICkNCj4+PiAtICAgIHsNCj4+PiAtICAgICAgICByZXQgPSAtRU9WRVJG
TE9XOw0KPj4+IC0gICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsNCj4+
PiAtICAgICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhmaXJzdHBnKTsNCj4+PiAtICAgICAg
ICBnb3RvIGVycl9vdXQ7DQo+Pj4gLSAgICB9DQo+Pj4gLQ0KPj4+ICAgICAgICAvKiBNZXJnZSB0
aGUgbGlzdHMgdG9nZXRoZXIgKi8NCj4+PiAgICAgICAgcm1hcF9zZWVkX2l0ZXJhdG9yKGNwYWdl
LCAmcmkpOw0KPj4+ICAgICAgICB3aGlsZSAoIChnZm4gPSBybWFwX2l0ZXJhdGUoY3BhZ2UsICZy
aSkpICE9IE5VTEwpDQo+Pj4gQEAgLTk4NCwxMyArOTcxLDE0IEBAIHN0YXRpYyBpbnQgc2hhcmVf
cGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwNCj4+
PiAgICAgICAgICAgICAqIERvbid0IGNoYW5nZSB0aGUgdHlwZSBvZiBybWFwIGZvciB0aGUgY2xp
ZW50IHBhZ2UuICovDQo+Pj4gICAgICAgICAgICBybWFwX2RlbChnZm4sIGNwYWdlLCAwKTsNCj4+
PiAgICAgICAgICAgIHJtYXBfYWRkKGdmbiwgc3BhZ2UpOw0KPj4+IC0gICAgICAgIHB1dF9wYWdl
X2FuZF90eXBlKGNwYWdlKTsNCj4+PiArICAgICAgICBwdXRfY291bnQrKzsNCj4+PiAgICAgICAg
ICAgIGQgPSBnZXRfZG9tYWluX2J5X2lkKGdmbi0+ZG9tYWluKTsNCj4+PiAgICAgICAgICAgIEJV
R19PTighZCk7DQo+Pj4gICAgICAgICAgICBCVUdfT04oc2V0X3NoYXJlZF9wMm1fZW50cnkoZCwg
Z2ZuLT5nZm4sIHNtZm4pKTsNCj4+PiAgICAgICAgICAgIHB1dF9kb21haW4oZCk7DQo+Pj4gICAg
ICAgIH0NCj4+PiAgICAgICAgQVNTRVJUKGxpc3RfZW1wdHkoJmNwYWdlLT5zaGFyaW5nLT5nZm5z
KSk7DQo+Pj4gKyAgICBCVUdfT04oIXB1dF9jb3VudCk7DQo+Pj4NCj4+PiAgICAgICAgLyogQ2xl
YXIgdGhlIHJlc3Qgb2YgdGhlIHNoYXJlZCBzdGF0ZSAqLw0KPj4+ICAgICAgICBwYWdlX3NoYXJp
bmdfZGlzcG9zZShjcGFnZSk7DQo+Pj4gQEAgLTEwMDEsNyArOTg5LDkgQEAgc3RhdGljIGludCBz
aGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNo
LA0KPj4+DQo+Pj4gICAgICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovDQo+Pj4gICAgICAg
IHB1dF9wYWdlX2FsbG9jX3JlZihjcGFnZSk7DQo+Pj4gLSAgICBwdXRfcGFnZShjcGFnZSk7DQo+
Pj4gKw0KPj4+ICsgICAgd2hpbGUgKCBwdXRfY291bnQtLSApDQo+Pj4gKyAgICAgICAgcHV0X3Bh
Z2VfYW5kX3R5cGUoY3BhZ2UpOw0KPj4+DQo+Pj4gICAgICAgIC8qIFdlIG1hbmFnZWQgdG8gZnJl
ZSBhIGRvbWFpbiBwYWdlLiAqLw0KPj4+ICAgICAgICBhdG9taWNfZGVjKCZucl9zaGFyZWRfbWZu
cyk7DQo+Pj4gQEAgLTExNjUsMTkgKzExNTUsMTMgQEAgaW50IF9fbWVtX3NoYXJpbmdfdW5zaGFy
ZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4gICAgICAgIHsNCj4+PiAgICAgICAgICAgIGlm
ICggIWxhc3RfZ2ZuICkNCj4+PiAgICAgICAgICAgICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJv
eShwYWdlLCBkLCBnZm5faW5mbyk7DQo+Pj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFn
ZSk7DQo+Pj4gKw0KPj4+ICAgICAgICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2socGFnZSk7
DQo+Pj4gKw0KPj4+ICAgICAgICAgICAgaWYgKCBsYXN0X2dmbiApDQo+Pj4gLSAgICAgICAgew0K
Pj4+IC0gICAgICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkb21fY293KSApDQo+Pj4gLSAg
ICAgICAgICAgIHsNCj4+PiAtICAgICAgICAgICAgICAgIHB1dF9nZm4oZCwgZ2ZuKTsNCj4+PiAt
ICAgICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChkKTsNCj4+PiAtICAgICAgICAgICAgICAgIHJl
dHVybiAtRU9WRVJGTE9XOw0KPj4+IC0gICAgICAgICAgICB9DQo+Pj4gICAgICAgICAgICAgICAg
cHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOw0KPj4+IC0gICAgICAgICAgICBwdXRfcGFnZShwYWdl
KTsNCj4+PiAtICAgICAgICB9DQo+Pj4gKw0KPj4+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBl
KHBhZ2UpOw0KPj4+ICAgICAgICAgICAgcHV0X2dmbihkLCBnZm4pOw0KPj4+DQo+Pj4gICAgICAg
ICAgICByZXR1cm4gMDsNCj4+DQo+PiAuLi4gdGhpcyAobWFpbiwgYXMgSSBndWVzcyBieSB0aGUg
dGl0bGUpIHBhcnQgb2YgdGhlIGNoYW5nZT8gSSB0aGluaw0KPj4geW91IHdhbnQgdG8gZXhwbGFp
biB3aGF0IHdhcyB3cm9uZyBoZXJlIGFuZC9vciB3aHkgdGhlIG5ldyBhcnJhbmdlbWVudA0KPj4g
aXMgYmV0dGVyLiAoSSdtIHNvcnJ5LCBJIGd1ZXNzIGl0IHdhcyB0aGlzIHdheSBvbiBwcmlvciB2
ZXJzaW9ucw0KPj4gYWxyZWFkeSwgYnV0IGFwcGFyZW50bHkgSSBkaWRuJ3Qgbm90aWNlLikNCj4g
DQo+IEl0J3Mgd2hhdCB0aGUgcGF0Y2ggbWVzc2FnZSBzYXlzIC0gY2FsbGluZyBwdXRfcGFnZV9h
bmRfdHlwZSBiZWZvcmUNCj4gbWVtX3NoYXJpbmdfcGFnZV91bmxvY2sgY2FuIGNhdXNlIGEgZGVh
ZGxvY2suIFNpbmNlIG5vdyB3ZSBhcmUgbm93DQo+IGhvbGRpbmcgYSByZWZlcmVuY2UgdG8gdGhl
IHBhZ2UgdGlsbCB0aGUgZW5kIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZQ0KPiBleHRyYSBnZXRf
cGFnZS9wdXRfcGFnZSBsb2dpYyB3aGVuIHdlIGFyZSBkZWFsaW5nIHdpdGggdGhlIGxhc3RfZ2Zu
Lg0KDQpUaGUgdGl0bGUgc2F5cyAicmVvcmRlciIgd2l0aG91dCBhbnkgIndoeSIuDQoNCkphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
