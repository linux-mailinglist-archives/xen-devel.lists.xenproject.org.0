Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D606CDE3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5E6-0001px-Nx; Thu, 18 Jul 2019 12:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho5E5-0001ps-79
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:09:33 +0000
X-Inumbo-ID: e4d96da4-a954-11e9-b311-db4e1f42e415
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4d96da4-a954-11e9-b311-db4e1f42e415;
 Thu, 18 Jul 2019 12:09:30 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 12:09:26 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 12:09:04 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 12:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3P+lZo38KLykUSjpQ4jhy86Qk7BdAXOZL3qxudt9qWl4Tmn5VHqDmS/PAcrWZAgrUpY4xPnppt0p+IOB5FXEhbjFzFwS8HCZ9GScSTJG8yTxkze5554WIJi1eccPvA3soJFgzvgOnTsUk3D5SnN9oA+50suY56OZ1SGh8hwZcIIEEwDNyhiP9QW9FVjXGk+Z8/XxGM5DtzUTRC3QGVZpadfoDbbLQSYTV9u0pMnvUQf/JsPMTLP22z9GLDcKpE0dvmT6upjyJUmvU4ITsiT/itZnBDxB3SW8uUPCQ7K2md7lFPLDrLIUW6B5dAbReJp82FrAjmJMeGBaLMyo+PPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3z27VVnjn9HoLPvt55VCDJkdkK9awO3fbiyKSMacpc=;
 b=JoIrsN1QncGiWIhIFVdieqxbwFkefn9btD99dmdIyJOnNy8/+o0KeDUImdQDxz4bL7GFWWyCaOPh4Ej+VkkPrsaUB0YMwr3ml1WdMFbr3nlujdtdNGvhwWHoZ2kRpqyBbGU44qyQSZaQZROo4TOIjibzFbiBzb6R+85qg0EejqTh4INggd1nJoJ6lCAeHiWNcdewVBRDtTMFfbWIEy0tzbnPiUQJkdiN6nZaTZqtVVQsbyXgeLNdnJYZ8FxEJ5ZDlSV1RouAm5oiRdWs25Q5T+hqX+QrtYE4Tq1b9zkR7ria7wzob1i+NWLBL9D5jRL3TfFc/FsvFN1r52MG9bMErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2796.namprd18.prod.outlook.com (20.179.50.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 12:09:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 12:09:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v3 1/2] common/grant_table: harden bound
 accesses
Thread-Index: AQHVOI9EFD+2Co2LEUukceT0T/LFJ6bQUgiA
Date: Thu, 18 Jul 2019 12:09:02 +0000
Message-ID: <b70d3c83-d7c8-e8a3-f587-e5a7cca8ca0d@suse.com>
References: <1562921502-20137-1-git-send-email-nmanthey@amazon.de>
 <1562921502-20137-2-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1562921502-20137-2-git-send-email-nmanthey@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0201CA0031.eurprd02.prod.outlook.com
 (2603:10a6:4:3f::41) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a03546e-cb34-44a8-43ec-08d70b78b8d9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2796; 
x-ms-traffictypediagnostic: DM6PR18MB2796:
x-microsoft-antispam-prvs: <DM6PR18MB2796E5F026AD1E729B9BE8B9B3C80@DM6PR18MB2796.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(80792005)(478600001)(76176011)(14454004)(66066001)(8676002)(186003)(52116002)(31696002)(476003)(446003)(25786009)(7736002)(2616005)(68736007)(2906002)(6512007)(11346002)(305945005)(26005)(6506007)(6436002)(31686004)(3846002)(6246003)(6486002)(36756003)(386003)(4326008)(486006)(81156014)(229853002)(316002)(54906003)(81166006)(66476007)(53546011)(102836004)(256004)(71190400001)(6116002)(86362001)(66946007)(66556008)(64756008)(66446008)(71200400001)(14444005)(7416002)(5660300002)(99286004)(6916009)(8936002)(53936002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2796;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +VK9Pg49ee4uYCLVsT1TWWcTYpVS/WKay2q6bPZGKZ/AxU2Dk9iByOhFJOLmcCZ5ldduab9PHvgMbqrpLBr7n2rIIdYCtU5tdrznafysJYcE3tuZFHmkPpxgb/CPg2Awg6HQRRGZ2s12izWGImBPqbSVeP25vMqDH1QG6BodQCWzFBmbPHt3eX9KJBO9ROcFELxzapod9+svCWYyryob60nVJ6qXZsHk067oC3Xy/blzwmrd//4XXCR+rH7ucUjQ2t1MWBzeEsO2qbcEOnLqSGxkfiHiM8/H2EbocQzoFvEA2EmoFF83acS7QeQYNbe+cVAA6pyfTnNO2icdRM/aUQ862zqeQ3xFD+SAP3mPD7hFSdukeD8yBJ4GVZX81ahcA048uRhpWA3wIt6ZbBDvktNnLBj5AsgMmf9GyEFyU9k=
Content-ID: <C36B53CA98DBCF409AEBA9F52CC720A2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a03546e-cb34-44a8-43ec-08d70b78b8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:09:02.3360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2796
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v3 1/2] common/grant_table:
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDcuMjAxOSAxMDo1MSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBHdWVzdHMgY2Fu
IGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxl
ZA0KPiBkYXRhIHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkg
bG9hZHMgYWZ0ZXIgYm91bmQNCj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMsIHdlDQo+IHVzZSB0aGUgYXJyYXlfaW5kZXhf
bm9zcGVjIG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybw0KPiBibG9ja19zcGVj
dWxhdGlvbi4gTm90ZSwgdGhlIGJsb2NrX3NwZWN1bGF0aW9uIG1hY3JvIGlzIHVzZWQgb24gYWxs
DQo+IHBhdGggaW4gc2hhcmVkX2VudHJ5X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcy4gVGhp
cyB3YXksIGFmdGVyIGENCj4gY2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVj
a3MgdGhhdCBoYXBwZW5lZCBiZWZvcmUgYmVjb21lDQo+IGFyY2hpdGVjdHVyYWwgdmlzaWJsZSwg
c28gdGhhdCBubyBhZGRpdGlvbmFsIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQNCj4gZm9yIGNvcnJl
c3BvbmRpbmcgYXJyYXkgYWNjZXNzZXMuIEFzIHRoZSB3YXkgd2UgaW50cm9kdWNlIGFuIGxmZW5j
ZQ0KPiBpbnN0cnVjdGlvbiBtaWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRh
aW4gdmFsdWVzIGZyb20NCj4gbWVtb3J5IG11bHRpcGxlIHRpbWVzLCB3ZSB0cnkgdG8gYXZvaWQg
c3BlY3VsYXRpdmVseSBjb250aW51aW5nDQo+IGV4ZWN1dGlvbiB3aXRoIHN0YWxlIHJlZ2lzdGVy
IGRhdGEgYnkgbW92aW5nIHJlbGV2YW50IGRhdGEgaW50bw0KPiBmdW5jdGlvbiBsb2NhbCB2YXJp
YWJsZXMuDQo+IA0KPiBTcGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4gY2Fz
ZSBvbmUgb2YgdGhlIGZvbGxvd2luZw0KPiBwcm9wZXJ0aWVzIGlzIHRydWU6DQo+ICAgLSBwYXRo
IGNhbm5vdCBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0DQo+ICAgLSBwYXRoIGRvZXMgbm90IHJl
dHVybiB0byB0aGUgZ3Vlc3QNCj4gICAtIHBhdGggZG9lcyBub3QgcmVzdWx0IGluIGFuIG91dC1v
Zi1ib3VuZCBhY2Nlc3MNCj4gICAtIHBhdGggY2Fubm90IGJlIGV4ZWN1dGVkIHJlcGVhdGVkbHkN
Cg0KSSBub3RpY2UgdGhpcyBzZW50ZW5jZSBpcyBzdGlsbCB0aGVyZSB3aXRob3V0IG1vZGlmaWNh
dGlvbi4gSWYgeW91DQpkb24ndCB3YW50IHRvIGRyb3AgaXQgKGFuZCB0aGVuIHBlcmhhcHMgbWFr
ZSBjaGFuZ2VzIHRvIGEgZmV3IG1vcmUNCnBhdGhzKSwgY2FuIHdlIGF0IGxlYXN0IHNldHRsZSBv
biBhIGxlc3MgZmlybSBzdGF0ZW1lbnQgbGlrZSAicGF0aA0KaXMgdW5saWtlbHkgdG8gYmUgZXhl
Y3V0ZWQgcmVwZWF0ZWRseSBpbiByYXBpZCBzdWNjZXNzaW9uIj8NCg0KPiBPbmx5IHRoZSBjb21i
aW5hdGlvbiBvZiB0aGUgYWJvdmUgcHJvcGVydGllcyBhbGxvd3MgdG8gYWN0dWFsbHkgbGVhaw0K
PiBjb250aW51b3VzIGNodW5rcyBvZiBtZW1vcnkuIFRoZXJlZm9yZSwgd2Ugb25seSBhZGQgdGhl
IHBlbmFsdHkgb2YNCj4gcHJvdGVjdGl2ZSBtZWNoYW5pc21zIGluIGNhc2UgYSBwb3RlbnRpYWwg
c3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kDQo+IGFjY2VzcyBtYXRjaGVzIGFsbCB0aGUgYWJvdmUg
cHJvcGVydGllcy4NCj4gDQo+IFRoaXMgY29tbWl0IGFkZHJlc3NlcyBvbmx5IG91dC1vZi1ib3Vu
ZCBhY2Nlc3NlcyB3aG9zZSBpbmRleCBpcw0KPiBkaXJlY3RseSBjb250cm9sbGVkIGJ5IHRoZSBn
dWVzdCwgYW5kIHRoZSBpbmRleCBpcyBjaGVja2VkIGJlZm9yZS4NCj4gUG90ZW50aWFsIG91dC1v
Zi1ib3VuZCBhY2Nlc3NlcyB0aGF0IGFyZSBjYXVzZWQgYnkgc3BlY3VsYXRpdmVseQ0KPiBldmFs
dWF0aW5nIHRoZSB2ZXJzaW9uIG9mIHRoZSBjdXJyZW50IHRhYmxlIGFyZSBub3QgYWRkcmVzc2Vk
IGluIHRoaXMNCj4gY29tbWl0LiBIZW5jZSwgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vz
c2VzIG1pZ2h0IHN0aWxsIGJlDQo+IHBvc3NpYmxlLCBmb3IgZXhhbXBsZSBpbiBnbnR0YWJfZ2V0
X3N0YXR1c19mcmFtZV9tZm4sIHdoZW4gY2FsbGluZw0KPiBnbnR0YWJfZ3Jvd190YWJsZSwgdGhl
IGFzc2VydGlvbiB0aGF0IHRoZSBncmFudCB0YWJsZSB2ZXJzaW9uIGVxdWFscw0KPiB0d28gbWln
aHQgbm90IGhvbGQgdW5kZXIgc3BlY3VsYXRpb24uDQo+IA0KPiBUaGlzIGlzIHBhcnQgb2YgdGhl
IHNwZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOb3Ji
ZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4NCg0KV2l0aCB0aGUgYWJvdmUgdGFrZW4g
Y2FyZSBvZiBieSBzb21lIHJlLXdyaXRpbmcNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
