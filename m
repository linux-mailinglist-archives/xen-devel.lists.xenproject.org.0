Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1A683A8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 08:45:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmugq-0001mG-HS; Mon, 15 Jul 2019 06:42:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmugo-0001mB-E0
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 06:42:22 +0000
X-Inumbo-ID: a2775b50-a6cb-11e9-b0a7-7707569aeb5d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2775b50-a6cb-11e9-b0a7-7707569aeb5d;
 Mon, 15 Jul 2019 06:42:17 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 06:42:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 06:32:08 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 06:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjECggCurFOIlH+J6H+1HsTnWId9azGT6aVkznLFCIIN9zoXarv51pelLIJP7uuT25rj5uKTRioTzyM6kvZwTOnJfN08tfXiiF+52mYHUveMldJLnXZUJWNCaFFQLd6pW1Pkm5lHbZwE6yd0IwQ36XCkBxH9QqBwvprj4kwuhEfhzL/giEzoY+N0unpuOk+IYsWqL0NwlbS1OjH+7hRTJLC6VWbJz0Kaw5G0UTKODAZka7MXzq4sOyRq58O7vGfdTLYXPYUNRcp/nWflSjN/0Ueb07yevrI2aTz8n1ESw9RaKCHSjyhurHUgY+hYqeZjpaJ6hTEn7YUXd4SU0dfBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXUL4fi+BzGf50U1dD0WHFLE9VoPgEKAODlBvjgGHXM=;
 b=XUimzdwpFX8HD1XQygUjkIK5ElFDY3/Aq/7NPSulPAYKmAu/QfOt+frnrTOVarpNLR3aNFAMK0dFswNkYTMbRl37ux1OePtfFrFKgSqQ4vKPeazLhVfa8FkCrzFpRB7/k87VtphC9ZDXVLu4++WD2EeAPS6wzq1U7SFAVH/gApW+u49054660WhTaZJAVEUHvoyvYrx7RCdjOePNWv1tiyLGuR3FlBTiXBGFYG2us8nuMC/EEFKswx3f+Yu5qipNbdQAl1tv4zeANVkMta9eI3R/o4lEmYr5WvjD83JA5zFE9zKGUUrj6Bog4/bWv5Mm/eTuUuKn25LuWnn4pbxjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2474.namprd18.prod.outlook.com (20.179.104.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 06:32:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 06:32:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v2 1/2] common/grant_table: harden bound
 accesses
Thread-Index: AQHVN+UKfsMu2qLxDkqLQxY1kOPIcKbGq28agASSyAA=
Date: Mon, 15 Jul 2019 06:32:06 +0000
Message-ID: <5d29a68c-3c7b-0ee3-42aa-955db9c8c2e5@suse.com>
References: <1562763277-11674-1-git-send-email-nmanthey@amazon.de>
 <1562763277-11674-2-git-send-email-nmanthey@amazon.de>
 <d68407b5-bbac-ed3c-553a-1d22681eb0ac@suse.com>
 <7e34b82b-14e1-6368-0652-03659a795bed@amazon.de>
In-Reply-To: <7e34b82b-14e1-6368-0652-03659a795bed@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0015.eurprd02.prod.outlook.com
 (2603:10a6:4:29::25) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8eacb88-5151-40f4-f750-08d708ee27e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2474; 
x-ms-traffictypediagnostic: DM6PR18MB2474:
x-microsoft-antispam-prvs: <DM6PR18MB24746318C57DECD150AECEEFB3CF0@DM6PR18MB2474.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(199004)(189003)(486006)(81156014)(81166006)(229853002)(54906003)(316002)(8936002)(31686004)(6436002)(6116002)(3846002)(6246003)(6486002)(4326008)(99286004)(6916009)(53936002)(6512007)(5660300002)(71190400001)(71200400001)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(52116002)(31696002)(66066001)(2906002)(76176011)(80792005)(478600001)(8676002)(36756003)(26005)(305945005)(7736002)(25786009)(186003)(11346002)(446003)(68736007)(476003)(2616005)(7416002)(256004)(102836004)(6506007)(53546011)(386003)(5024004)(14444005)(14454004)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2474;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zo/Ba3hI9uMa5pVNuiuI8/LVBCr/S5kXgEN3ntAcgjVvwn7LLacIPSbprYGKmVgqTIWCkUY+1WluCuc4XRlicPljAT7llhOYnQtOjKONe369W2WPU3P+hbcl8Ot8R5XhDtKu9YhMB6bVOFmIL/rVVol9TZalZHl81yEA7nNPZ8h/3L4wqTz30F01TSorblkF5EE20WkKqCpKm8UHRDHZgpdSXB4QgLkGNB7nJM77enKi5C65dxHwWs4Jocar3e4M8BxTFq9bIVjCoKS9168MkEwxSI6ODu+Zg6/MiKgb0rcfcaSf32Zs1tkxLwAuQ8dcKFMY0amJzeTzNcjJFgciUMHd7t23k4/3gXk+dNn0Nx7czuFSkSrC6PVEAfRJkbeqTSxvEBBENcli1hWwNo7iU/51/7SobOK6javEb4hFCrQ=
Content-ID: <660304C28410074DAB70055242F256EE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8eacb88-5151-40f4-f750-08d708ee27e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 06:32:06.2576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2474
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v2 1/2] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, PawelWieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, DavidWoodhouse <dwmw@amazon.co.uk>,
 Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BjoernDoebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDcuMjAxOSAxMDo0MCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBPbiA3LzExLzE5
IDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDEwLjA3LjIwMTkgMTQ6NTQsIE5vcmJl
cnQgTWFudGhleSB3cm90ZToNCj4+PiBHdWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJh
dGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZA0KPj4+IGRhdGEgdG8gdGhlbS4gVGhp
cyBkYXRhIGlzIHVzZWQgYXMgaW5kZXggZm9yIG1lbW9yeSBsb2FkcyBhZnRlciBib3VuZA0KPj4+
IGNoZWNrcyBoYXZlIGJlZW4gZG9uZS4gVG8gYXZvaWQgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5k
IGFjY2Vzc2VzLCB3ZQ0KPj4+IHVzZSB0aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvIHdoZXJl
IGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybw0KPj4+IGJsb2NrX3NwZWN1bGF0aW9uLiBOb3RlLCB0
aGUgYmxvY2tfc3BlY3VsYXRpb24gbWFjcm8gaXMgdXNlZCBvbiBhbGwNCj4+PiBwYXRoIGluIHNo
YXJlZF9lbnRyeV9oZWFkZXIgYW5kIG5yX2dyYW50X2VudHJpZXMuIFRoaXMgd2F5LCBhZnRlciBh
DQo+Pj4gY2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVja3MgdGhhdCBoYXBw
ZW5lZCBiZWZvcmUgYmVjb21lDQo+Pj4gYXJjaGl0ZWN0dXJhbCB2aXNpYmxlLCBzbyB0aGF0IG5v
IGFkZGl0aW9uYWwgcHJvdGVjdGlvbiBpcyByZXF1aXJlZA0KPj4+IGZvciBjb3JyZXNwb25kaW5n
IGFycmF5IGFjY2Vzc2VzLiBBcyB0aGUgd2F5IHdlIGludHJvZHVjZSBhbiBsZmVuY2UNCj4+PiBp
bnN0cnVjdGlvbiBtaWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRhaW4gdmFs
dWVzIGZyb20NCj4+PiBtZW1vcnkgbXVsdGlwbGUgdGltZXMsIHdlIHRyeSB0byBhdm9pZCBzcGVj
dWxhdGl2ZWx5IGNvbnRpbnVpbmcNCj4+PiBleGVjdXRpb24gd2l0aCBzdGFsZSByZWdpc3RlciBk
YXRhIGJ5IG1vdmluZyByZWxldmFudCBkYXRhIGludG8NCj4+PiBmdW5jdGlvbiBsb2NhbCB2YXJp
YWJsZXMuDQo+Pj4NCj4+PiBTcGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4g
Y2FzZSBvbmUgb2YgdGhlIGZvbGxvd2luZw0KPj4+IHByb3BlcnRpZXMgaXMgdHJ1ZToNCj4+PiAg
ICAtIHBhdGggY2Fubm90IGJlIHRyaWdnZXJlZCBieSB0aGUgZ3Vlc3QNCj4+PiAgICAtIHBhdGgg
ZG9lcyBub3QgcmV0dXJuIHRvIHRoZSBndWVzdA0KPj4+ICAgIC0gcGF0aCBkb2VzIG5vdCByZXN1
bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcw0KPj4+ICAgIC0gcGF0aCBjYW5ub3QgYmUgZXhl
Y3V0ZWQgcmVwZWF0ZWRseQ0KPj4gVXBvbiByZS1yZWFkaW5nIEkgdGhpbmsgdGhpcyBsYXN0IGl0
ZW0gaXNuJ3QgZnVsbHkgYXBwbGljYWJsZTogSSB0aGluaw0KPj4geW91IGF0dGFjaCBzdWNoIGFu
IGF0dHJpYnV0ZSB0byBkb21haW4gY3JlYXRpb24vZGVzdHJ1Y3Rpb24gZnVuY3Rpb25zLg0KPj4g
VGhvc2UgYXJlbid0IGV4ZWN1dGVkIHJlcGVhdGVkbHkgZm9yIGEgc2luZ2xlIGd1ZXN0LCBidXQg
ZS5nLiByYXBpZA0KPj4gcmVib290aW5nIG9mIGEgZ3Vlc3QgKG9yIHNldmVyYWwgb25lcykgbWF5
IGFjdHVhbGx5IGJlIGFibGUgdG8gdHJhaW4NCj4+IHN1Y2ggcGF0aHMuDQo+IFRydWUsIGJ1dCBh
IHJlYm9vdGVkIGRvbWFpbiBtaWdodCBjb21lIHVwIG9uIGEgZGlmZmVyZW50IGNvcmUsIHdoaWNo
DQo+IHJlc3VsdHMgaW4gdXNpbmcgZGlmZmVyZW50IGhhcmR3YXJlIHN0cnVjdHVyZXMuIFRoZSAi
cmVwZWF0ZWRseSIgaXMgb3Blbg0KPiB0byBiZSBpbnRlcnByZXRlZCwgSSBhZ3JlZS4gRnJvbSBt
eSB1bmRlcnN0YW5kaW5nLCBpdCBiZWxvbmdzIHRvIHRoZQ0KPiBwcm9wZXJ0aWVzIHRvIGhhdmUg
dG8gcmVsaWFibHkgdGFyZ2V0IGEgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzcy4NCg0K
TG9va3MgbGlrZSB3ZSdyZSB0YWtpbmcgYSBzb21ld2hhdCBkaWZmZXJlbnQgcGVyc3BlY3RpdmUg
aGVyZTogSSBkb24ndA0KdGhpbmsgInJlbGlhYmx5IiBpcyB0aGUgY3JpdGVyaWEgdG8gZ28gYnks
IGJ1dCBpbnN0ZWFkIGl0IHdvdWxkIGJlDQoidGhlcmUncyBhIHJlYXNvbmFibGUgY2hhbmNlIi4g
UGx1cyB0aGUgc21hbGxlciB0aGUgaG9zdCwgdGhlIGxlc3MNCnBvc3NpYmlsaXRpZXMgdGhlcmUg
YXJlIGZvciBjb21pbmcgYmFjayB1cCBvbiBhIGRpZmZlcmVudCBjb3JlLCB5ZXQgaW1vDQp3ZSBz
aG91bGRuJ3QgZmF2b3IgbGFyZ2UgaG9zdHMgaW4gb3VyIGNvbnNpZGVyYXRpb25zLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
