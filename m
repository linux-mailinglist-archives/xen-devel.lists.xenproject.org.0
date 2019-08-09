Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6188296
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9gW-00056i-6w; Fri, 09 Aug 2019 18:32:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AvL5=WF=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hw9gU-00056a-Ny
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 18:32:14 +0000
X-Inumbo-ID: 009ed117-bad4-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.73]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 009ed117-bad4-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNuE4BChARoWtdYOZTszM7iPKLCSv8t5NSDJHvqVnSYOcbJMw3KYntbhLzQkTSuG9KkDbx8l/YweE6PwH1lEPdTj2E/mmmEp+jJc4GxamUYFmYHEJsyD9aWiSXgtuTq3hJNX4/WdQG8thoo0QBui5izHqE3BqyABpREfRtgUhX6aDbF+5S9vUZUTpjMdD/I0FlTGlAOOJqoHcqxzHD300KYKLUefraX7IqTe0pUKtbkm798JF4RULrd2Faa/nE74gdsJYsAY+yjTYQGMFrbx6nw1xHKAbyFjGfpujQr6qn/WJYFqfDTlO+ClqazCTx/7to9Gh/JAdwYLX+RlAZ2S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeDNqKnKEHlU5QCeyvV32M/N/3Q2alttFB9u20rsGVo=;
 b=UIwcIZp1oqCgh3hVKQwwEsrqucWDIJJo/xn1dkXvczUxxG4Iv44ncelEyBPXMUryj7MrVAmaqqP0rQJijZ+n/pS4m9TKrVHT/wJkBeBWQdUYIJt0Q5y6bxqCBrbIcp5TN6ZntWJT31dXXDA7p0BYm0ABE7058o4npY4QXRhYNtHwQHVFN1jhj6r0Fwg4vZXjCRK1Ipq1W+WGcGklxtcdKNMZ16S5AsHJ+Gj2iTe12iUMr/NqvqHMHXaNCRzPpYozWLDyZBQIXyikpduSQ9PTyqBvNUsWvfTEt3Qu+eqpuYdSuKBT5QecVE5JOf9wt6ZRRmqgfmDhYDnw3eBa2SX5uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeDNqKnKEHlU5QCeyvV32M/N/3Q2alttFB9u20rsGVo=;
 b=qlFU5o7CdBYlWBQ1nY+gyNxCTYXSVCnGR4Cl2IdrpyA6JESlAy/NBZXdanqa9fXPQmMBuDHXVfgqMvinecbkjE037AmUjkoTFeqL4N7UnawIAG1QTlmC6FBZoX9sqO4fmRbzQrfMCvg50Ym8TBic+gOh5LnNLGag5SWt60m70LJKQ/F7mzaxU56yJwVCfdts178N6hlsE9CBVi3kMmfSwkdwahfKqogl4BchdvDGND4QZNQz/da77/rHgyIr25f0wP2t+qAu4nCY0UQvHi9j634auZv8QomHHi+gpwO4MdGJOhEzngKwQeU62ufRuMWm3a7zspOvygnYFXy7ygweiQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4595.eurprd03.prod.outlook.com (20.176.215.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 18:32:10 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 18:32:10 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v3 4/6] xen/arm: handle "multiboot,device-tree"
 compatible nodes
Thread-Index: AQHVTj7LDIH+uezJn0iD5FIKsJhUMKbzJQOA
Date: Fri, 9 Aug 2019 18:32:10 +0000
Message-ID: <87k1bmgpg6.fsf@epam.com>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-4-sstabellini@kernel.org>
In-Reply-To: <20190808231242.26424-4-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aed8c83-80a2-4d42-c92e-08d71cf7e414
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4595; 
x-ms-traffictypediagnostic: AM0PR03MB4595:|AM0PR03MB4595:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB45953D73A8FFD043DD20B9B6E6D60@AM0PR03MB4595.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(81156014)(81166006)(486006)(4326008)(476003)(11346002)(8676002)(2616005)(66476007)(66556008)(6246003)(14454004)(5660300002)(478600001)(36756003)(64756008)(66446008)(66066001)(3846002)(6506007)(6116002)(54906003)(6512007)(305945005)(7736002)(76116006)(66946007)(91956017)(55236004)(53936002)(102836004)(14444005)(256004)(26005)(80792005)(76176011)(6916009)(71200400001)(71190400001)(6436002)(6486002)(446003)(229853002)(2906002)(99286004)(25786009)(316002)(186003)(8936002)(86362001)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4595;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IUVTNv1RB0/NF7Glp0ti3UYWG39Wy+Jib9RL132HZjwgHeDRYvkee3xgcY1GBUiUhr8R5d6OxDV3FgRTPfh56hIWkvH1028zD9/d5Koab2142M07hcZjtL7rKGPZoCA+TsHID36Y1L4I8sZOmssH54+Gd1wrFelqNqAoN0UgVQVytFKyLNpZ70YrzBMXMjY4K0alHHpYzWUgX+eY+UqIS4YA5IpWNWysSzC/nQ+zQCUuqHeI3B5j/8YZZxJowt5Lj50B9+nRhA3uH0njsw7RwKOmK/uEFlwbUc3kxEpiNxQDTb1dCz7GqMtakeuCsIP/vB6fBA4FRy8PU7cuhzXovImsrMu043f7VAlT+Mj2Y9IfE8GggHwfgLZ6hRWR5Ma/Cq2GrN2phTsIko/t+T2m3//+ufAO8dZGu64YBvS3xio=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aed8c83-80a2-4d42-c92e-08d71cf7e414
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 18:32:10.4588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fkVQdMqmeGCO1YXtvzaU4G9fdBED+i2E7bxff0Mogp7GNA33Ob5/DKYIU5itrUPAOqLbSnUQxKbF0IhZAxJ1D+ObJwqmk7g6Cjq+Ij5wPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4595
Subject: Re: [Xen-devel] [PATCH v3 4/6] xen/arm: handle "multiboot,
 device-tree" compatible nodes
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Achin.Gupta@arm.com" <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cgo+IERldGVjdCAibXVsdGlib290LGRldmljZS10
cmVlIiBjb21wYXRpYmxlIG5vZGVzLiBBZGQgdGhlbSB0byB0aGUgYm9vdG1vZAo+IGFycmF5IGFz
IEJPT1RNT0RfR1VFU1RfRFRCLiAgSW4ga2VybmVsX3Byb2JlLCBmaW5kIHRoZSByaWdodAo+IEJP
T1RNT0RfR1VFU1RfRFRCIGFuZCBzdG9yZSBhIHBvaW50ZXIgdG8gaXQgaW4gZHRiX2Jvb3Rtb2R1
bGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlu
eC5jb20+Cj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gcmVuYW1lIEJPT1RNT0RfRFRCIHRv
IEJPT1RNT0RfR1VFU1RfRFRCCj4gLSByZW5hbWUgbXVsdGlib290LGR0YiB0byBtdWx0aWJvb3Qs
ZGV2aWNlLXRyZWUKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgIHwgIDIgKysK
PiAgeGVuL2FyY2gvYXJtL2tlcm5lbC5jICAgICAgIHwgMTIgKysrKysrKysrKystCj4gIHhlbi9h
cmNoL2FybS9zZXR1cC5jICAgICAgICB8ICAxICsKPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1
cC5oIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYwo+IGluZGV4IDg5MWI0YjY2ZmYuLjRlZTFiYzMxNGUgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMK
PiBAQCAtMjA1LDYgKzIwNSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX211bHRpYm9v
dF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gICAgICAgICAga2luZCA9IEJPT1RN
T0RfUkFNRElTSzsKPiAgICAgIGVsc2UgaWYgKCBmZHRfbm9kZV9jaGVja19jb21wYXRpYmxlKGZk
dCwgbm9kZSwgInhlbix4c20tcG9saWN5IikgPT0gMCApCj4gICAgICAgICAga2luZCA9IEJPT1RN
T0RfWFNNOwo+ICsgICAgZWxzZSBpZiAoIGZkdF9ub2RlX2NoZWNrX2NvbXBhdGlibGUoZmR0LCBu
b2RlLCAibXVsdGlib290LGRldmljZS10cmVlIikgPT0gMCApCj4gKyAgICAgICAga2luZCA9IEJP
T1RNT0RfR1VFU1RfRFRCOwo+ICAgICAgZWxzZQo+ICAgICAgICAgIGtpbmQgPSBCT09UTU9EX1VO
S05PV047Cj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0va2VybmVsLmMgYi94ZW4vYXJj
aC9hcm0va2VybmVsLmMKPiBpbmRleCAzODliZWYyYWZhLi45OTdhODcxZjYyIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS9rZXJuZWwuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwo+
IEBAIC00MjUsNyArNDI1LDcgQEAgaW50IF9faW5pdCBrZXJuZWxfcHJvYmUoc3RydWN0IGtlcm5l
bF9pbmZvICppbmZvLAo+ICAgICAgc3RydWN0IGJvb3Rtb2R1bGUgKm1vZCA9IE5VTEw7Cj4gICAg
ICBzdHJ1Y3QgYm9vdGNtZGxpbmUgKmNtZCA9IE5VTEw7Cj4gICAgICBzdHJ1Y3QgZHRfZGV2aWNl
X25vZGUgKm5vZGU7Cj4gLSAgICB1NjQga2VybmVsX2FkZHIsIGluaXRyZF9hZGRyLCBzaXplOwo+
ICsgICAgdTY0IGtlcm5lbF9hZGRyID0gMCwgaW5pdHJkX2FkZHIgPSAwLCBkdGJfYWRkciA9IDAs
IHNpemU7Ckl0IGlzIHVuY2xlYXIgZm9yIG15IHdoeSBhcmUgeW91IGluaXRpYWxpemUgdGhvc2Ug
dmFyaWFibGVzIHdpdGggMAoKPiAgICAgIGludCByYzsKPiAgCj4gICAgICAvKiBkb21haW4gaXMg
TlVMTCBvbmx5IGZvciB0aGUgaGFyZHdhcmUgZG9tYWluICovCj4gQEAgLTQ2OSw2ICs0NjksMTYg
QEAgaW50IF9faW5pdCBrZXJuZWxfcHJvYmUoc3RydWN0IGtlcm5lbF9pbmZvICppbmZvLAo+ICAg
ICAgICAgICAgICAgICAgaW5mby0+aW5pdHJkX2Jvb3Rtb2R1bGUgPSBib290X21vZHVsZV9maW5k
X2J5X2FkZHJfYW5kX2tpbmQoCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEJPT1RNT0RfUkFN
RElTSywgaW5pdHJkX2FkZHIpOwo+ICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgIGVsc2Ug
aWYgKCBkdF9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAibXVsdGlib290LGRldmljZS10cmVl
IikgKQo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAgICB1MzIgbGVuOwo+ICsgICAg
ICAgICAgICAgICAgY29uc3QgX19iZTMyICp2YWw7Cj4gKwo+ICsgICAgICAgICAgICAgICAgdmFs
ID0gZHRfZ2V0X3Byb3BlcnR5KG5vZGUsICJyZWciLCAmbGVuKTsKRG8geW91IG5lZWQgdG8gY2hl
Y2sgcmV0dXJuIHZhbHVlIHRoZXJlPwoKPiArICAgICAgICAgICAgICAgIGR0X2dldF9yYW5nZSgm
dmFsLCBub2RlLCAmZHRiX2FkZHIsICZzaXplKTsKPiArICAgICAgICAgICAgICAgIGluZm8tPmR0
Yl9ib290bW9kdWxlID0gYm9vdF9tb2R1bGVfZmluZF9ieV9hZGRyX2FuZF9raW5kKAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBCT09UTU9EX0dVRVNUX0RUQiwgZHRiX2FkZHIpOwo+ICsgICAg
ICAgICAgICB9Cj4gICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ICAgICAgICAgIH0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4v
YXJjaC9hcm0vc2V0dXAuYwo+IGluZGV4IDIxNTc0NmE1YzMuLmY5M2E4YmVkMDQgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+
IEBAIC0zNDcsNiArMzQ3LDcgQEAgY29uc3QgY2hhciAqIF9faW5pdCBib290X21vZHVsZV9raW5k
X2FzX3N0cmluZyhib290bW9kdWxlX2tpbmQga2luZCkKPiAgICAgIGNhc2UgQk9PVE1PRF9LRVJO
RUw6ICByZXR1cm4gIktlcm5lbCI7Cj4gICAgICBjYXNlIEJPT1RNT0RfUkFNRElTSzogcmV0dXJu
ICJSYW1kaXNrIjsKPiAgICAgIGNhc2UgQk9PVE1PRF9YU006ICAgICByZXR1cm4gIlhTTSI7Cj4g
KyAgICBjYXNlIEJPT1RNT0RfR1VFU1RfRFRCOiAgICAgcmV0dXJuICJEVEIiOwo+ICAgICAgY2Fz
ZSBCT09UTU9EX1VOS05PV046IHJldHVybiAiVW5rbm93biI7Cj4gICAgICBkZWZhdWx0OiBCVUco
KTsKPiAgICAgIH0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCj4gaW5kZXggOGJmM2Q1OTEwYS4uNWFhZjA3YmY5
NyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKPiArKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL3NldHVwLmgKPiBAQCAtMTYsNiArMTYsNyBAQCB0eXBlZGVmIGVudW0g
ewo+ICAgICAgQk9PVE1PRF9LRVJORUwsCj4gICAgICBCT09UTU9EX1JBTURJU0ssCj4gICAgICBC
T09UTU9EX1hTTSwKPiArICAgIEJPT1RNT0RfR1VFU1RfRFRCLAo+ICAgICAgQk9PVE1PRF9VTktO
T1dOCj4gIH0gIGJvb3Rtb2R1bGVfa2luZDsKCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBB
TQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
