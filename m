Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A549F74BD0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqb8m-00020r-N1; Thu, 25 Jul 2019 10:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqb8k-00020g-JG
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:38:26 +0000
X-Inumbo-ID: 4bbc4334-aec8-11e9-ab0e-9f549fe02792
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bbc4334-aec8-11e9-ab0e-9f549fe02792;
 Thu, 25 Jul 2019 10:38:24 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:38:13 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:24:42 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5rmwRPeeupfFq+o/l+t9xOhE8xO1U/jmgpxayJQ359jwmeVpL/A0Q+wgfQWGfI0uFm20C6qTMoCGUVS5VmE24COTc/9NK/Gp2/9brOPySitQlwOpIfY3etbjge/+IuJ3TIHx/1u9StXONLd0a4SUQ8KvNIipHgBDv6+mzpErGCqboUWLhS3NAb8FvTZx1p0qCrYBVzdPVvl9iACoEuDprWVn4kfQTug1xLtECNLsuRvhumZxWCAvgn5GIECZB/MO4ZLRLMvz5uDI+X/PQqbhEH3mpizthIsECOmRVN1HgYwgzXCQzkvyOeN889TEUY+x+LIqjBfTKfN67SMvUtRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgTcgxs3oIivK93rdz367y1sfPvyA4LedEVTy0ErDyA=;
 b=cLRDu2Z24LIfUloqiWXnodwaiTG3AgJOrrswo+6siO6dxCG8ZU0piRsI5gU8Tiqy6HHcdwm/5rykLy1ePTGqI5eN0HR6hJ8PzMAYqrWojuKTrO7NdTtJB1y96dWiSv8pE5kgk6H7na424Ke+5AzFwiJRRmP3rNbrL5DfgXhN3mkNE1lTLXHdm+5S+ZP4CPBmKuiM94fhcz/knwTOHFViqk1ZwUwlU6J1nSwPDyDRtOymMEk+wNUWUpdmc5JDFOlBuOGS1Q4W9JX7ioBa5iPy3WfkBPmRxWcI87+IhbaRf+oPdpkUafL065UvMa1ViKRgGyO/OHyx/T4BFyvNB68gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3403.namprd18.prod.outlook.com (10.255.174.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 10:24:40 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:24:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQXCgF1lCD39zc0iIIjzc0uoVFaba8J0AgAAuXaCAAARzAA==
Date: Thu, 25 Jul 2019 10:24:40 +0000
Message-ID: <5410c036-5c7c-b2a7-1908-336fdb7b4959@suse.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-2-paul.durrant@citrix.com>
 <20190725092242.m675tevc5wudzaw5@Air-de-Roger>
 <f19d582bd08c41a79cfe04bf72b8ef37@AMSPEX02CL03.citrite.net>
In-Reply-To: <f19d582bd08c41a79cfe04bf72b8ef37@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:4:91::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7aea666-dd0c-4dac-fec1-08d710ea4d4d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3403; 
x-ms-traffictypediagnostic: DM6PR18MB3403:
x-microsoft-antispam-prvs: <DM6PR18MB3403BBA1A8CB55740B11A970B3C10@DM6PR18MB3403.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(13464003)(54906003)(6916009)(8936002)(478600001)(52116002)(25786009)(6246003)(86362001)(6436002)(229853002)(36756003)(3846002)(6116002)(68736007)(6512007)(256004)(31696002)(6486002)(7416002)(76176011)(53546011)(6506007)(66946007)(316002)(66556008)(26005)(7736002)(66476007)(386003)(64756008)(66446008)(305945005)(31686004)(476003)(11346002)(486006)(2906002)(80792005)(2616005)(66066001)(99286004)(186003)(71190400001)(4326008)(81156014)(81166006)(71200400001)(102836004)(14454004)(446003)(53936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3403;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BEDA/rBfG9+3jIcNrFOATltvFyOBtJiUtFjFRzqbz6mUdII3WsCy5CD9n0Mf+jkx/dUz2rv3Nb5L+MwyQqDOZ6Jo+y9H+a57a1utola3OvZk1t5QE2AModtti2QHaerDeMPV0EcOZg8ULLY1iGCSxxxIM8NfGu45OaTRBr5jqgRG9zGfim4pG/9yVAC13g71o8OwIe7fI3L7F2QG4IXHsRJnl2ryB8oSJ3Ll2alEdYPsQgD9mk1jb3XFTeRWZJtfyxlgTKbKMDJN5vj1gwXS8zqaWqCld3eBcMW1YWj8Huuskc2CiYPbPjtzvzN/pOUHmPXItjy4YzS+ugklCUfQNyzvX1y8gD2o2TS/Y6inHD0LM0dXcIt0T2JLYg2YjdBrk5Us+LcIA1kLCrizHuKsBkutQDO1m5+f1oJH0I9ghWo=
Content-ID: <F99513366254B34CB063492197D887C5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aea666-dd0c-4dac-fec1-08d710ea4d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:24:40.2982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3403
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxMjoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+PiBTZW50OiAyNSBKdWx5IDIwMTkgMTA6MjMNCj4+IFRvOiBQYXVsIER1cnJhbnQg
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47DQo+PiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBB
bmRyZXcNCj4+IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29u
IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Ow0K
Pj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMS82XSBk
b21haW46IHN0YXNoIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGZsYWdzIGluIHN0cnVjdCBkb21h
aW4NCj4+DQo+PiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwNTowNjowNFBNICswMTAwLCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+Pj4gVGhlc2UgYXJlIGNhbm9uaWNhbCBzb3VyY2Ugb2YgZGF0YSB1
c2VkIHRvIHNldCB2YXJpb3VzIG90aGVyIGZsYWdzLiBJZg0KPj4+IHRoZXkgYXJlIGF2YWlsYWJs
ZSBkaXJlY3RseSBpbiBzdHJ1Y3QgZG9tYWluIHRoZW4gdGhlIG90aGVyIGZsYWdzIGFyZSBubw0K
Pj4+IGxvbmdlciBuZWVkZWQuDQo+Pj4NCj4+PiBUaGlzIHBhdGNoIHNpbXBseSBjb3BpZXMgdGhl
IGZsYWdzIGludG8gYSBuZXcgJ2NyZWF0ZWZsYWdzJyBmaWVsZCBpbg0KPj4+IHN0cnVjdCBkb21h
aW4uIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGRvIHRoZSByZWxhdGVkIGNsZWFuLXVwIHdvcmsu
DQo+Pg0KPj4gVGhhbmtzIQ0KPj4NCj4+IEp1c3Qgb25lIG5hbWluZyBjb21tZW50ICh3aGljaCBp
cyBzdWJqZWN0IHRvIHRhc3RlIEkgZ3Vlc3MpLg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+IGluZGV4IGI0
MGM4ZmQxMzguLmVkYWUzNzJjMmIgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+IEBAIC0zMDgsNiAr
MzA4LDcgQEAgZW51bSBndWVzdF90eXBlIHsNCj4+Pg0KPj4+ICAgc3RydWN0IGRvbWFpbg0KPj4+
ICAgew0KPj4+ICsgICAgdW5zaWduZWQgaW50ICAgICBjcmVhdGVmbGFnczsNCj4+DQo+PiBDYW4g
eW91IG5hbWUgdGhpcyBqdXN0IGZsYWdzIG9yIG9wdGlvbnMgb3Igc29tZSBzdWNoICh3aXRob3V0
IHRoZQ0KPj4gY3JlYXRlIHByZWZpeCkuIElNTyBhZGRpbmcgdGhlIGNyZWF0ZSBwcmVmaXggbWFr
ZXMgaXQgbG9vayBsaWtlIGENCj4+IGZpZWxkIG9ubHkgdXNlZCBkdXJpbmcgZG9tYWluIGNyZWF0
aW9uLCB3aGlsZSBpdCdzIG5vdCB0aGUgY2FzZS4NCj4gDQo+IEkgZ3Vlc3MgbmFtaW5nIGl0IHNp
bXBseSAnZmxhZ3MnIHdvdWxkIGJlIG9rIGNvdXBsZWQgd2l0aCBhIGNvbW1lbnQNCj4gaW4gdGhl
IGhlYWRlciBzdGF0aW5nIHRoYXQgdGhlIGZpZWxkIGlzIG1lcmVseSBhIGNvcHkgb2YgdGhlIGRv
bWFpbg0KPiBjcmVhdGUgZmxhZ3MuIEFueW9uZSBlbHNlIGdvdCBvcGluaW9ucyBvbiB0aGlzPw0K
DQpXZSB1c2UgImZsYWdzIiB0b28gb2Z0ZW4gaW1vLiBXaGF0IGFib3V0ICJvcHRpb25zIiBhcyBz
dWdnZXN0ZWQgYnkNClJvZ2VyLCBvciAic2V0dGluZ3MiPw0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
