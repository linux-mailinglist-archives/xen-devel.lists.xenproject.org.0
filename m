Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FC81897
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubau-000554-6y; Mon, 05 Aug 2019 11:56:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hubas-00054z-I3
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:56:02 +0000
X-Inumbo-ID: fe87c6ed-b777-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fe87c6ed-b777-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 11:56:01 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 11:55:55 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 11:55:25 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 11:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKKQ2kqAWnM/tG2UZU++O/kXjFOpfmylKfh3D+soI1Vt1UJEMaDa4mpU5fdS14i5/ljnJBhTz8bCzHqOmNyn3GhpEsrpWSW51+B6ePUZMNkyjKA+yca4wxRRF06Jo35MNKuidm6F6Dmr+JFFE7OGSiMBFlxTVmtRzgsRF2YcqrBH3uPymqaffeQPZ6h1imCgyadTmOGnkCpVub877/xSFV+h5gbKZw72ZS2cldC1a6ms7rjSwOEU1mvKAU7WqPnv8Iwg3DoLFVzWLQlngH/qwTnVDkT3KB9TKeuxUPp9/kz9Pc7E3FUE6/WH9RYbChuX5pE0PngZw+S5cNKTI/P4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCcbOPg4vuSTvg4s5IrgHje0yFKid6qqmAo7XAHZ/oM=;
 b=SE+4z0nGw2QZXnCjixBMgQ/4IxlIMcAOTd7cUgzFAzJyNlp6LBUQcDOvI4F5R9tbl2vEiZL7BL+Nue2qYM9Y7msNIXlJQU518zg2ka7SJCpeCAPjxGAIMZhpaUFCUhoGo5fx51HEJbrqSEk/eLbgcAj5OfSG3e1EMYN0PUatk6p3NfbcPua7rxI29WlmFfea3oF9a8Hz6qmMSfXptshYzZooGzbRgdUnBii3/kUFzSzx9BwG1aGi/FBgLwL5M2b9o2aGSUZ20/K4HIcx5KeJIb+1SxQVejtr+J/qApkx2lxuVbuCrSrTY0u/sJpVFxyZfQsIL4YPqLMGATf/J9dbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3261.namprd18.prod.outlook.com (10.255.237.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 11:55:23 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 11:55:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH v2] CODING_STYLE: document intended usage of types
Thread-Index: AQHVS3zWhCjk0U9++E+I/4nSrlmXN6bsclmA
Date: Mon, 5 Aug 2019 11:55:23 +0000
Message-ID: <19e1f42b-04bb-bcf6-86ef-42685e5de263@suse.com>
References: <5BFBBD7902000078001FFC9D@prv1-mh.provo.novell.com>
 <1b9eb9f8-1251-1c51-0a7b-4ba4811af205@citrix.com>
In-Reply-To: <1b9eb9f8-1251-1c51-0a7b-4ba4811af205@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0501CA0058.eurprd05.prod.outlook.com
 (2603:10a6:200:68::26) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b8a0f98-24bc-480b-8deb-08d7199bcc11
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3261; 
x-ms-traffictypediagnostic: MN2PR18MB3261:
x-microsoft-antispam-prvs: <MN2PR18MB32614D060A8660CE05F3DED0B3DA0@MN2PR18MB3261.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(189003)(199004)(6436002)(4744005)(31696002)(8936002)(66066001)(7736002)(11346002)(53936002)(305945005)(3846002)(6246003)(25786009)(52116002)(8676002)(36756003)(68736007)(6116002)(6916009)(446003)(316002)(6512007)(478600001)(4326008)(99286004)(102836004)(486006)(31686004)(53546011)(6506007)(386003)(76176011)(14454004)(71200400001)(86362001)(71190400001)(54906003)(6486002)(2616005)(229853002)(476003)(256004)(7416002)(80792005)(66476007)(66556008)(64756008)(66446008)(186003)(2906002)(66946007)(26005)(5660300002)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3261;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SC3kW4Y1hQQ1QNj7enq5gwLJO6J7tQsFvgh9VsR7lrVoDXKSLY1HehkV7sW6sGQZ2ebrFxMCYjReZ34Cg/XSIDPizCDRC0lZUfhSn1QGnhMtwzlVj3L9rZZ9a/nJ9l2VAPbU2VuqmxIebQTA/KRdZgWNyQ5rdaJ5y4joeLofZwlevqs3IGzkvEfdDlMBTDH2Nqz9F9l/QrFHC7BNxazATcuFkmPy7aaWxvbBzmZI8vGO5Lp5yayvdn1GwTK36gKYRJcZkX6k3XZZL6nQl6h0r00Jyx3xT1AM3a2nMhZyQBsxlEIQD6hTvlZZifYL0xPExfK93YDBOkH1yre3HRio4J7e8BZKOPT5zmzeTzzonmAnIN5lV2y7+UBP/ptPejTRTMiPMXU91xJQEBrj6Oo/jxL2tG6XG9e/5nJNUHIOXOs=
Content-ID: <D9857D93E48BE544B587293194970F71@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8a0f98-24bc-480b-8deb-08d7199bcc11
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 11:55:23.2731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3261
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] CODING_STYLE: document intended usage of
 types
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxMjo1OCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gMTEvMjYvMTgg
OTozMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiArRml4ZWQgd2lkdGggdHlwZXMgc2hvdWxk
IG9ubHkgYmUgdXNlZCB3aGVuIGEgZml4ZWQgd2lkdGggcXVhbnRpdHkgaXMNCj4+ICttZWFudCAo
d2hpY2ggZm9yIGV4YW1wbGUgbWF5IGJlIGEgdmFsdWUgcmVhZCBmcm9tIG9yIHRvIGJlIHdyaXR0
ZW4gdG8gYQ0KPj4gK3JlZ2lzdGVyKS4NCj4gDQo+IEknbSBoYXZpbmcgdHJvdWJsZSB1bmRlcnN0
YW5kaW5nIHRoZSBpbnRlbnQgLyBpbXBsaWNhdGlvbnMgb2YgdGhpcyBvbmUuDQo+ICAgQ2FuIHlv
dSBnaXZlIG1lIGFuIGV4YW1wbGUgb2Ygd2hlcmUgeW91J3ZlIHNlZW4gYSBmaXhlZCB3aWR0aCB0
eXBlIHVzZWQNCj4gaW5hcHByb3ByaWF0ZWx5Pw0KDQpHcmVwIHRoZSBjb2RlIGJhc2UgZm9yICJ1
aW50MzJfdCBzaXplIiBmb3IgZXhhbXBsZS4gVGhlc2Ugc2hvdWxkDQooYWxtb3N0PykgYWxsIGJl
IHVuc2lnbmVkIGludCAob3IsIHdoZXJlIG5lY2Vzc2FyeSwgc2l6ZV90KS4gQW5kDQp3aGlsZSB0
aGVyZSBpcyB1aW50X2xlYXN0MzJfdCBJIHRoaW5rIHdlIHNob3VsZCBwcmVmZXINCnVuc2lnbmVk
IGludCBmb3Igc3VjaCBwdXJwb3NlcywgYXMgd2UgZXhwZWN0IHRoaXMgdHlwZSB0byBoYXZlDQph
dCBsZWFzdCAzMiBzaWduaWZpY2FudCBiaXRzIGFueXdheS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
