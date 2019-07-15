Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8068720
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 12:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmyKR-0002c2-86; Mon, 15 Jul 2019 10:35:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmyKP-0002bx-ES
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 10:35:29 +0000
X-Inumbo-ID: 4292903f-a6ec-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4292903f-a6ec-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 10:35:27 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 10:35:24 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 10:35:12 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 10:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6QrRRHgVmpaHwR5a86HXqruDyMSSpPczLFDwENrSpvzFuDHvWlYwJU0QZWsbVtioMhHXwggiQ+eIcTG0vvIoTHWaAQoqtR1p0QmXwhxCNaYzNGDm7YjSlBe2d3rfO4S0xW2CIR/jmXPGXSQ50dWzqFHpARwElRkfAceOR05W7fEdL9wLLxRadzINjWKUbFELI5cjLnwYeY+292+O4dxE1oq/6Oi8eM3eir6LPSN/+7JG0PFfh6cgX4InSwdC+msr3nAeQfiR8qGpLnp1T/MQBU4BFBoJtLIxTWstTaArUVoOcNhq0TpWCdIPuuWAuK+aNUKcItR+dFJco9PsiZrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P98ajWSvzMrYIlpir5/UWclTb2KKiKzTfhDaLdIkde8=;
 b=eSwvoj0EtTlbFCvq2TFHV96cngj5sHYzP4qNscs4ahIrWKIFLxYBG7ZdAkXqiBRNHozbPhaeJK302HLv0XuPUKxBknKKIEkmc7nwWYlvtLLSrNMELZO/mm9QibWOXkt3Vn6BntKpfhdZSpqS4cFQ60a5hKxyLKM3jA1ldueOxustyDzyWnyqOnLy1iQMMPtthhxOEWDHhUWRX/O3s4lYXm0OkzFZgMyH5Td8IWZLKH4fy4sJFlRqfD5l9UCSxtf+AlUeSPJv/v2JBzeMtxA6P5aDXPYPN6cH9fWNpRODeN9Q7VPgq9CUDRduPbSU1YVtR3mdtHUy4tsrnPffVYQsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3372.namprd18.prod.outlook.com (10.255.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 10:35:11 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 10:35:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/dom0-build: fix build with clang5
Thread-Index: AQHVOvj6+Q8sMST8H0euZPd/xzIlPw==
Date: Mon, 15 Jul 2019 10:35:11 +0000
Message-ID: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:5:16::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af0482b8-dc8c-43fc-0796-08d709101d30
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM6PR18MB3372; 
x-ms-traffictypediagnostic: DM6PR18MB3372:
x-microsoft-antispam-prvs: <DM6PR18MB3372CA39FAF9CE197F6FE936B3CF0@DM6PR18MB3372.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(486006)(81156014)(81166006)(54906003)(316002)(8936002)(3846002)(99936001)(31686004)(6436002)(6116002)(6486002)(2351001)(4326008)(99286004)(6916009)(5640700003)(53936002)(6512007)(5660300002)(71190400001)(71200400001)(86362001)(66446008)(64756008)(66556008)(66476007)(66616009)(66946007)(31696002)(52116002)(2906002)(2501003)(66066001)(80792005)(478600001)(36756003)(8676002)(26005)(305945005)(7736002)(25786009)(68736007)(476003)(2616005)(186003)(256004)(102836004)(14454004)(6506007)(386003)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3372;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6ZM74Fkyd206ujM2lG0VCPFmromqwM3OBNAy9fsmmYGKa2CDLRsx/z+uAc3fV2rWDAdMRxY9sJRKWWPLNnvZYSSLVPTuJSquFCOhgomyUzHOVBM3lyKAgI2v8VpqMXGllGZ8RD5s6kruU/6e/qX5NxZJkc0yzMHhj9daZvW44xGg7Dstmw7ZpYbB+WiMwib7Y7/UTs3mh/mQzzD3Hv55WGTqjzOr6Ah2H+7QEo8qYW5vQ/jbuHp67Z4OsfmmSdYI/LUHHtptgayrSERFTUHaVdrQtnJb9oipXTAxA8n5dNt7E0yN0EqVTBZx1i6Tv+V+pSeYT2mJwC6s7m5R3jt9MsKuuPJBIZBgKCULoTGTW79dZRpS6XXsrmsyEuigMEkkbK+9WBP6Zw4Tp5nXYGNSFSyH23VRSQiIL6bQ93KDD7c=
Content-Type: multipart/mixed;
 boundary="_002_ef6702128257b960a3cb9363cf076033susecom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af0482b8-dc8c-43fc-0796-08d709101d30
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 10:35:11.0837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3372
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_ef6702128257b960a3cb9363cf076033susecom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <34A2F70C6F2ED4479B8861B725CFB716@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

V2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcw0KDQpkb20wX2J1
aWxkLmM6MzQ0OjI0OiBlcnJvcjogdXNlIG9mIGxvZ2ljYWwgJyYmJyB3aXRoIGNvbnN0YW50IG9w
ZXJhbmQgWy1XZXJyb3IsLVdjb25zdGFudC1sb2dpY2FsLW9wZXJhbmRdDQogICAgIGlmICggIWRv
bTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgXiAgfn5+fn5+fn5+fn5+fn5+fn5+DQpkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2Ug
JyYnIGZvciBhIGJpdHdpc2Ugb3BlcmF0aW9uDQogICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBD
T05GSUdfRE9NMF9NRU1bMF0gKQ0KICAgICAgICAgICAgICAgICAgICAgICAgXn4NCiAgICAgICAg
ICAgICAgICAgICAgICAgICYNCmRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25z
dGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYg
Q09ORklHX0RPTTBfTUVNWzBdICkNCiAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KMSBlcnJvciBnZW5lcmF0ZWQuDQoNCk9idmlvdXNseSBuZWl0aGVyIG9mIHRo
ZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJlLiBPZGRseQ0KZW5vdWdoIHN3YXBw
aW5nIHRoZSBvcGVyYW5kcyBvZiB0aGUgJiYgaGVscHMsIHdoaWxlIGUuZy4gY2FzdGluZyBvcg0K
cGFyZW50aGVzaXppbmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJpYW50IGxvb2tzIHRv
IGJlIHRoZSB1c2Ugb2YNCiEhIG9uIHRoZSBjb25zdGFudC4NCg0KU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQpJJ20gb3BlbiB0byBnb2luZyB0aGUg
ISEgb3IgeWV0IHNvbWUgZGlmZmVyZW50IHJvdXRlLiBObyBtYXR0ZXIgd2hpY2gNCm9uZSB3ZSBj
aG9vc2UsIEknbSBhZnJhaWQgaXQgaXMgZ29pbmcgdG8gcmVtYWluIGd1ZXNzd29yayB3aGF0IG5l
d2VyDQooYW5kIGZ1dHVyZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCBjaG9rZSBvbi4NCg0KLS0t
IGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYw0KKysrIGIveGVuL2FyY2gveDg2L2RvbTBfYnVp
bGQuYw0KQEAgLTM0MSw3ICszNDEsNyBAQCB1bnNpZ25lZCBsb25nIF9faW5pdCBkb20wX2NvbXB1
dGVfbnJfcGFnDQogICAgICB1bnNpZ25lZCBsb25nIGF2YWlsID0gMCwgbnJfcGFnZXMsIG1pbl9w
YWdlcywgbWF4X3BhZ2VzOw0KICAgICAgYm9vbCBuZWVkX3BhZ2luZzsNCiAgDQotICAgIGlmICgg
IWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQ0KKyAgICBpZiAoIENPTkZJR19E
T00wX01FTVswXSAmJiAhZG9tMF9tZW1fc2V0ICkNCiAgICAgICAgICBwYXJzZV9kb20wX21lbShD
T05GSUdfRE9NMF9NRU0pOw0KICANCiAgICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGRv
bTBfbm9kZXMgKQ0K

--_002_ef6702128257b960a3cb9363cf076033susecom_
Content-Type: text/plain; name="clang5-build.patch"
Content-Description: clang5-build.patch
Content-Disposition: attachment; filename="clang5-build.patch"; size=1484;
	creation-date="Mon, 15 Jul 2019 10:35:11 GMT";
	modification-date="Mon, 15 Jul 2019 10:35:11 GMT"
Content-ID: <5765E3D5D7C13E4689B33336A3F8383D@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

eDg2L2RvbTAtYnVpbGQ6IGZpeCBidWlsZCB3aXRoIGNsYW5nNQoKV2l0aCBub24tZW1wdHkgQ09O
RklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcwoKZG9tMF9idWlsZC5jOjM0NDoyNDogZXJyb3I6
IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9yLC1XY29u
c3RhbnQtbG9naWNhbC1vcGVyYW5kXQogICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19E
T00wX01FTVswXSApCiAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+fn5+fn5+fn5+fn5+
CmRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHVzZSAnJicgZm9yIGEgYml0d2lzZSBvcGVyYXRp
b24KICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQogICAgICAg
ICAgICAgICAgICAgICAgIF5+CiAgICAgICAgICAgICAgICAgICAgICAgJgpkb20wX2J1aWxkLmM6
MzQ0OjI0OiBub3RlOiByZW1vdmUgY29uc3RhbnQgdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKICAg
IGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQogICAgICAgICAgICAg
ICAgICAgICAgfl5+fn5+fn5+fn5+fn5+fn5+fn5+fgoxIGVycm9yIGdlbmVyYXRlZC4KCk9idmlv
dXNseSBuZWl0aGVyIG9mIHRoZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJlLiBP
ZGRseQplbm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUg
ZS5nLiBjYXN0aW5nIG9yCnBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3RoZXIgd29ya2FibGUg
dmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCiEhIG9uIHRoZSBjb25zdGFudC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkknbSBvcGVuIHRv
IGdvaW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQgcm91dGUuIE5vIG1hdHRlciB3aGlj
aApvbmUgd2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0IGlzIGdvaW5nIHRvIHJlbWFpbiBndWVzc3dv
cmsgd2hhdCBuZXdlcgooYW5kIGZ1dHVyZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCBjaG9rZSBv
bi4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bTBfYnVpbGQuYwpAQCAtMzQxLDcgKzM0MSw3IEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRvbTBf
Y29tcHV0ZV9ucl9wYWcKICAgICB1bnNpZ25lZCBsb25nIGF2YWlsID0gMCwgbnJfcGFnZXMsIG1p
bl9wYWdlcywgbWF4X3BhZ2VzOwogICAgIGJvb2wgbmVlZF9wYWdpbmc7CiAKLSAgICBpZiAoICFk
b20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkKKyAgICBpZiAoIENPTkZJR19ET00w
X01FTVswXSAmJiAhZG9tMF9tZW1fc2V0ICkKICAgICAgICAgcGFyc2VfZG9tMF9tZW0oQ09ORklH
X0RPTTBfTUVNKTsKIAogICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGRvbTBfbm9kZXMg
KQo=

--_002_ef6702128257b960a3cb9363cf076033susecom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_ef6702128257b960a3cb9363cf076033susecom_--

