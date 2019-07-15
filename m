Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED530685CD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 10:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwkc-00039y-VE; Mon, 15 Jul 2019 08:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmwkb-00039q-7y
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 08:54:25 +0000
X-Inumbo-ID: 18c2f186-a6de-11e9-83a5-3b315de60ac3
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c2f186-a6de-11e9-83a5-3b315de60ac3;
 Mon, 15 Jul 2019 08:54:21 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 08:54:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 08:34:20 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 08:34:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLQykAz9HOWZyG2SYkwvamhD/njEGhOx2L47BFUDcHm/QWMU3IGSQwL0A/tn6rid34A+vLmZQFD1weOGNVJYreEPZbnYOaLWV47Dhnq+gimSjFXrlPfx3ubU5Y0moSCU8QyJC107MxQJgDFib4zaNvH5FJVfMUkEkG6PYqDrkyl4jh6I5/ZZZX90TAcrS19k7F0DMUk91xvfiulDeZJ4ASW2GRmUknhA97TLFUe5SmGhT0H1OaWn8k4Qf/5F6DxPuPXckt+1Q9hbHcuGP3+WS35elvhaOx6UMyo3c+BVz1ud/mtyNPJaiD84c3Rfxu7JxW+AccGWmYtN3aB6BOGmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1uMY7asc4TqteyDmOd4nTPByM/gEaE6kZ0hJJgNZUA=;
 b=X8a4OkWXxaeQTXTL8uA3kvCFbV6N+LLu2AEYpGHpM/LXOomxmp0t6jsAi84hMfqRdiqpBesat7MTZW3m4DzPmukco0K6joP/jYlVw/V9/h4O1HO9mUMoz2KV5IzNnhqcMXfiws1Ne0cqdZnKbTieA658McgT8fRgEuGHHQXoMzEB/oZMQ5XryC7JQSEHnA68MH3GKlYQOGxwhKabMyltd5SWps8E56kk7V+h1+2TAMSzwL0J+MpAu9qiXGILqJ+q3/SGweBmVQ2c8GBKfV7dqSp0ojXJmD6pZ7CTB2oSYT/UfYaYlayfRiK3aWyVuzb0N27K8OZJOfDUxTFX0iJRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2635.namprd18.prod.outlook.com (20.179.106.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 08:34:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 08:34:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: =?utf-8?B?UGluZ8KzOiBbUEFUQ0ggMS8yXSBjb3JlLXBhcmtpbmc6IGludGVyYWN0IHdp?=
 =?utf-8?Q?th_runtime_SMT-disabling?=
Thread-Index: AQHVOugY6wPFM0x5E0K43CVQk2y/BQ==
Date: Mon, 15 Jul 2019 08:34:19 +0000
Message-ID: <be74e5a9-a3cf-2083-af15-15d6dc7afe41@suse.com>
References: <1ec72a90-76d1-2c81-8d6e-c585ba9ce238@suse.com>
In-Reply-To: <1ec72a90-76d1-2c81-8d6e-c585ba9ce238@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0106.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01ff4928-76e5-4e81-3ec4-08d708ff3ad1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2635; 
x-ms-traffictypediagnostic: DM6PR18MB2635:
x-microsoft-antispam-prvs: <DM6PR18MB2635CDB481161DB9F0D83808B3CF0@DM6PR18MB2635.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(6116002)(26005)(3846002)(54906003)(14454004)(31686004)(305945005)(446003)(53936002)(2616005)(11346002)(14444005)(8936002)(256004)(36756003)(186003)(81156014)(81166006)(316002)(6436002)(52116002)(86362001)(31696002)(6506007)(386003)(76176011)(66066001)(4326008)(53546011)(6916009)(68736007)(476003)(102836004)(66946007)(6486002)(66556008)(66476007)(64756008)(66446008)(478600001)(71190400001)(71200400001)(7736002)(5660300002)(99286004)(25786009)(486006)(6512007)(80792005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2635;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kCyZU+9xNSsZyXpS4wNXbMhG0Y3aD2giiDGr3MH/LeYfjdzzQXQDk8aBRjTryI/4UwsbtTulML73/CsSqMbZgOCJUBwUPMhreTzsvgUWhQw5gtMBEk4ek0dlNTwK5ih96jBAza6Zx1RRVAb+qE4r15zkIO6I2/1nbdMwODlpvMdUSkngVEKodRJxCHDqjI6F1YjgDTS2n/BxOnDLDlQQHlo1CNdQ2Sl4namaVVP3HDbu46dkur84a8oK6JlI9py5uWnJqhGfopw8boxMI2OhyrhX0SacTP1OHSjj0O4BihH9QHaMH6td+mvv4Mkd5rj2mWWP3JDmRJuaWnyE//BhVti2ENCPLDmE+9rK2+d0pBsthnPdWKQK+7RCPJ98pP+0N63TStpV8KYp2Ir2EAMxCkruPaT4xT60icZhwu3nkdI=
Content-ID: <31471332E89DF34C89BA60EFAA0B01A5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ff4928-76e5-4e81-3ec4-08d708ff3ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:34:19.4177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2635
X-OriginatorOrg: suse.com
Subject: [Xen-devel] =?utf-8?q?Ping=C2=B3=3A_=5BPATCH_1/2=5D_core-parking?=
 =?utf-8?q?=3A_interact_with_runtime_SMT-disabling?=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDI3LjA1LjE5
IGF0IDExOjM2LCAgd3JvdGU6DQo+Pj4+PiBPbiAxMi4wNC4xOSBhdCAxMzo0MSwgIHdyb3RlOg0K
Pj4+Pj4+IE9uIDExLjA0LjE5IGF0IDIxOjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4g
d3JvdGU6DQo+Pj4+IE9uIDExLzA0LzIwMTkgMTM6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4gV2hlbiBkaXNhYmxpbmcgU01UIGF0IHJ1bnRpbWUsIHNlY29uZGFyeSB0aHJlYWRzIHNob3Vs
ZCBubyBsb25nZXIgYmUNCj4+Pj4+IGNhbmRpZGF0ZXMgZm9yIGJyaW5naW5nIGJhY2sgdXAgaW4g
cmVzcG9uc2UgdG8gX1BVRCBBQ1BJIGV2ZW50cy4gUHVyZ2UNCj4+Pj4+IHRoZW0gZnJvbSB0aGUg
dHJhY2tpbmcgYXJyYXkuDQo+Pj4+Pg0KPj4+Pj4gRG9pbmcgc28gaW52b2x2ZXMgYWRkaW5nIGxv
Y2tpbmcgdG8gZ3VhcmQgYWNjb3VudGluZyBkYXRhIGluIHRoZSBjb3JlDQo+Pj4+PiBwYXJraW5n
IGNvZGUuIFdoaWxlIGFkZGluZyB0aGUgZGVjbGFyYXRpb24gZm9yIHRoZSBsb2NrIHRha2UgdGhl
IGxpYmVydHkNCj4+Pj4+IHRvIGRyb3AgdHdvIHVubmVjZXNzYXJ5IGZvcndhcmQgZnVuY3Rpb24g
ZGVjbGFyYXRpb25zLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4NCj4+Pj4gSSBjYW4gY2VydGFpbmx5IGFwcHJlY2lhdGUg
dGhlc2UgYXJndW1lbnRzLCBidXQgc3VyZWx5IHRoZSBjb252ZXJzZSBpcw0KPj4+PiB0cnVlLiAg
V2hlbiBTTVQtZW5hYmxlIGlzIHVzZWQsIHRoZSBuZXdseS1vbmxpbmVkIHRocmVhZHMgYXJlIG5v
dw0KPj4+PiBlbGlnaWJsZSB0byBiZSBwYXJrZWQuDQo+Pj4NCj4+PiBBbmQgbm90aGluZyB3aWxs
IGtlZXAgdGhlbSBmcm9tIGdldHRpbmcgcGFya2VkLg0KPj4+DQo+Pj4+IEF0IHRoZSBtb21lbnQs
IHRoaXMgbG9va3MgYXN5bWV0cmljLg0KPj4+DQo+Pj4gSXQgZG9lcywgYnV0IHRoYXQncyBhIHJl
c3VsdCBvZiBjb3JlX3BhcmtpbmcuYyBvbmx5IHJlY29yZGluZyBDUFVzDQo+Pj4gaXQgaGFzIHBh
cmtlZCwgbm90IG9uZXMgaXQgY291bGQgcGFyay4NCj4+DQo+PiBEaWQgbXkgcmVzcG9uc2VzIGFk
ZHJlc3MgeW91ciBjb25jZXJucz8NCj4+DQo+PiBKYW4NCg0KUGluZz8NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
