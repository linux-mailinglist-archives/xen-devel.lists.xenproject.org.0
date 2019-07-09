Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C0636C3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 15:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkpzj-0001Se-3v; Tue, 09 Jul 2019 13:17:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExLo=VG=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hkpzh-0001SZ-NY
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 13:17:18 +0000
X-Inumbo-ID: debe94a5-a24b-11e9-8980-bc764e045a96
Received: from GCC01-DM2-obe.outbound.protection.outlook.com (unknown
 [40.107.84.100]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id debe94a5-a24b-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 13:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhn4mQ+/lEz5ODPkVHE3ROLEyssrrPnlradDMMob9V4Di6U4XTrlzCyPj1IHg3w+VuNw5hNlyxY6R8PNnrE/hAb/QOXpPhJTEI4N/Xo0Ki6CcKgLzpR5BT6zdrVP42+yhYv+1GdMa/odkJeO1o1nRzPe4wbCR7w5Jz0Tk7m75eTFWeeR7cyEpFFm1fjUdfG5dTTnapP6aIlRilVuXw/aaatC/Rr/B5MER0XZILTYdkvNeXyqP4Wh6mJct+Akhxr/7gvhtxy9ufvD4fKmMkfqelBTjepRYrbnIAIDJMhO07P2ZzlUVwIhKlXaov6FlZJiDrRenF9H+xi4HJo9Vg73Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxQHcaISl484CpSeooDGkydEoHmVUY9GQ0Hidx9QnYs=;
 b=Dg34JB0nX9dWPrnPjZsr6Kl6aICADGynIG1kCk5Q4yDwIRp2XG3LuflndLOefomOgx6egzoVzPQ2/N+K2SVzzW4yQY5MnqUmqBa2Z/1zPDAC+fG7tQf+LfEGaV4z+1ycjEu6GARyb302bjChhws0yrTqDzJtFL82TWtRXxQ8WOkYXvGJGd5g2Nkx4e8sSE5NbxGYBBqOBJyO3sX7sFpi0b0MYX/RdBQkJKiihU01thHSOTZ1UW/gwTYQFxt9mhX6HiwJ4SRwmNH7SD+fdTmqIkB5rSQtU8+6ACZb03waObcSLS5Eyi1rm5Db53fmltlpeb8ITLvM0YbsazZkqow+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=starlab.io;dmarc=pass action=none
 header.from=starlab.io;dkim=pass header.d=starlab.io;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxQHcaISl484CpSeooDGkydEoHmVUY9GQ0Hidx9QnYs=;
 b=tNMplGQ8gKhNS4OKTnf+MYLzMKD/evxZmGB5zP3mXXER78PvQX4fAE4wuLIJZWtTpg6QSZonATlJrG/KfaHo/45GVFoMJHdta44ZN/if69jx3J+JNSl3k8pciMmot4uOfKl5efcCdXkc3JRVCHlTasP/OISzGO79vg9x0Y7o/Jk=
Received: from BL0PR0901MB3203.namprd09.prod.outlook.com (20.177.243.158) by
 BL0PR0901MB2449.namprd09.prod.outlook.com (52.132.19.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 13:17:13 +0000
Received: from BL0PR0901MB3203.namprd09.prod.outlook.com
 ([fe80::317f:a059:9fd3:dcf]) by BL0PR0901MB3203.namprd09.prod.outlook.com
 ([fe80::317f:a059:9fd3:dcf%5]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 13:17:13 +0000
From: Will Abele <will.abele@starlab.io>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH 0/1] Dom0less guest device tree format
Thread-Index: AQHVNCT8i/e9XHQvKUuqip9pKzLNp6a95d0AgAAAdQD//+zngIADfVwAgAD4XIA=
Date: Tue, 9 Jul 2019 13:17:13 +0000
Message-ID: <20190709131708.z64dbkau54m3fnvb@starlab.io>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
 <20190706211048.uvilbrefroxroli3@starlab.io>
 <alpine.DEB.2.21.1907081552310.3099@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1907081552310.3099@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:404:10a::25) To BL0PR0901MB3203.namprd09.prod.outlook.com
 (2603:10b6:208:8e::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=will.abele@starlab.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [207.229.155.139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8caafb6-2f1f-4e3b-9a29-08d7046fc161
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BL0PR0901MB2449; 
x-ms-traffictypediagnostic: BL0PR0901MB2449:
x-microsoft-antispam-prvs: <BL0PR0901MB2449DA29EE9C9CD615BDCA00F6F10@BL0PR0901MB2449.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39830400003)(396003)(346002)(376002)(189003)(199004)(51914003)(6486002)(66946007)(73956011)(66066001)(66476007)(66556008)(64756008)(66446008)(71190400001)(71200400001)(6436002)(14454004)(74482002)(1076003)(229853002)(2906002)(25786009)(99286004)(53936002)(52116002)(6116002)(3846002)(4326008)(7736002)(81156014)(8676002)(81166006)(6246003)(305945005)(5660300002)(6512007)(14444005)(256004)(6916009)(186003)(2616005)(76176011)(386003)(6506007)(53546011)(26005)(508600001)(44832011)(102836004)(486006)(476003)(11346002)(446003)(316002)(68736007)(54906003)(86362001)(36756003)(8936002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR0901MB2449;
 H:BL0PR0901MB3203.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xqFnNmIKkMV37JAFPXspt1LayinsCwQaMK/C7bzVBenjKr+Hxlj3BZiIv9hvl5xW046O0CMbDidmoNvD9ckaTK6IZ6Z1ETV+Dy0aCBZMquQMxrXZisnndyzB2iY02QIisH+JqBBVs5fhMT7/l1vQSmtPvikp3zLxnKCe17t2e1jK9OM8nBcCrbDGD/bigxOwa3NjgCya4yDkdXT8AQbDbqcSnKiVIzKlLhHrjSz7GPeazFI1WG3bQCGTbOabVfiQQgFK86NQ6af/QP3xYq7/Y+AH6MMzkN37girV2jZDgchOr85ToxNzqXIgSvz1/oH40LZAKc0XrQcPz2IMW9ugmuu6k2AlimRPExUv9o208tIHhhnjUh+ViR1iSvz99Oq9ZJ+zw1mHs90CW3Motjx7BDMk8fk+bqtnoHWFg0MNBik=
Content-ID: <B03C5B55F4977D45B83EA129C68A62B6@namprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b8caafb6-2f1f-4e3b-9a29-08d7046fc161
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:17:13.0883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0901MB2449
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <Julien.Grall@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDA3LzA4LzIwMTkgMTc6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gU2F0
LCA2IEp1bCAyMDE5LCBXaWxsIEFiZWxlIHdyb3RlOg0KPiA+IFRoZSAwNy8wNi8yMDE5IDE4OjE5
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gT24gMDYvMDcvMjAx
OSAxOToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
IE9uIDA2LzA3LzIwMTkgMTk6MDIsIFdpbGwgQWJlbGUgd3JvdGU6DQo+ID4gPiA+PiBGcm9tOiBX
aWxsIEFiZWxlIDx3aWxsLmFiZWxlQHN0YXJsYWIuaW8+DQo+ID4gPiA+Pg0KPiA+ID4gPj4gSGks
DQo+ID4gPiA+IA0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+PiBJJ3ZlIGJlZW4gdXNp
bmcgZG9tMGxlc3MgWGVuIG9uIHRoZSBIaWtleSA5NjAgd2l0aCBhIDQuMTQgTGludXggDQo+ID4g
PiA+PiBLZXJuZWwuIEkgaGFkDQo+ID4gPiA+PiB0cm91YmxlIGdldHRpbmcgdGhlIDQuMTQgTGlu
dXggS2VybmVsIHRvIGJvb3QgYXMgYSBkb20wbGVzcyBkb21VIA0KPiA+ID4gPj4gYmVjYXVzZSBp
dCB3YXMNCj4gPiA+ID4+IG1pc2ludGVycHJldGluZyB0aGUgZGV2aWNlIHRyZWUgdmVyc2lvbi4g
TGludXggNC4xNCBhbmQgZWFybGllciANCj4gPiA+ID4+IGludGVycHJldCBkZXZpY2UNCj4gPiA+
ID4+IHRyZWVzIHdpdGggYSAiLyIgaW4gdGhlIHJvb3Qgbm9kZSBhcyB2ZXJzaW9uIDE2LiBYZW4g
cHJvZHVjZXMgYSANCj4gPiA+ID4+IHZlcnNpb24gMTcNCj4gPiA+ID4+IGRldmljZSB0cmVlLCBz
byB0aGUgcm9vdCBub2RlIG5lZWRzIHRvIGJlICIiIHRvIHdvcmsgd2l0aCA0LjE0IGFuZCANCj4g
PiA+ID4+IGVhcmxpZXIgTGludXgNCj4gPiA+ID4+IEtlcm5lbHMuIExpbnV4IDQuMTUgYW5kIGxh
dGVyIGFzc3VtZSB0aGF0IHRoZSB2ZXJzaW9uIGlzIDE3LCBzbyB0aGlzIA0KPiA+ID4gPj4gcGF0
Y2ggZG9lcw0KPiA+ID4gPj4gbm90IGhhdmUgYW55IGltcGFjdC4NCj4gPiA+ID4+DQo+ID4gPiA+
PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IG1vcmUgaW5mb3JtYXRpb24gb3Ig
aGF2ZSANCj4gPiA+ID4+IHN1Z2dlc3Rpb25zIGZvcg0KPiA+ID4gPj4gb3RoZXIgd2F5cyB0byBo
YW5kbGUgdGhpcy4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGVyZSB0
aGUgdmVyc2lvbiBjb21lcyBmcm9tLiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCANCj4gPiA+ID4g
aG93IHlvdSBpbmZlcnJlZCB0aGF0IFhlbiBpcyBjcmVhdGluZyBhIHZlcnNpb24gMTcgZGV2aWNl
LXRyZWUuDQo+ID4gPiA+IA0KPiA+ID4gPiBEbyB5b3UgaGF2ZSBsaW5rIHRvIHRoZSBwYXJhZ3Jh
cGggaW4gdGhlIHNwZWNpZmljYXRpb25zPw0KPiA+ID4gDQo+ID4gPiBBbHNvLCBwbGVhc2UgZXhw
YW5kIHdoYXQgaXMgdGhlIGV4YWN0IGVycm9yLiBTbyB3ZSBjYW4gdW5kZXJzdGFuZCANCj4gPiA+
IHdoZXRoZXIgdGhpcyBpcyB0aGUgcmlnaHQgZml4Lg0KPiA+ID4gDQo+ID4gPiBDaGVlcnMsDQo+
ID4gPiANCj4gPiA+IC0tIA0KPiA+ID4gSnVsaWVuIEdyYWxsDQo+ID4gDQo+ID4gLS0gDQo+ID4g
DQo+ID4gSGkgSnVsaWVuLA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHByb21wdCByZXNwb25z
ZS4NCj4gPiANCj4gPiBJIHNhaWQgaW4gbXkgbWVzc2FnZSB0aGF0IExpbnV4IHdhcyBpbnRlcnBy
ZXRpbmcgdGhlIGRldmljZSB0cmVlIGFzIHZlcnNpb24gMTYuDQo+ID4gTG9va2luZyB0aHJvdWdo
IHRoZSBjb2RlIGFnYWluLCBJIHJlYWxpemUgaXQgd2FzIGJlaW5nIGludGVycHJldGVkIGFzIGVh
cmxpZXINCj4gPiB0aGFuIDE2LiBBcyBtZW50aW9uZWQgaW4gTGludXggY29tbWl0IGE3ZTRjZmIw
YTdjYTQ3NzNlN2QwZGQxZDljMDE4YWIyN2ExNTM2MGUsDQo+ID4gTGludXggaGFkIGFscmVhZHkg
YnJva2VuIHN1cHBvcnQgZm9yIEZEVCB2ZXJzaW9ucyBlYXJsaWVyIHRoYW4gMTYuDQo+ID4gcG9w
dWxhdGVfbm9kZSgpIGluIGRyaXZlcnMvb2YvZmR0LmMgd291bGQgc3RvcCBwYXJzaW5nIHRoZSBm
ZHQgYXQgdGhlIHJvb3Qgbm9kZQ0KPiA+IGlmIGl0IHRob3VnaHQgdGhlIGZkdCB2ZXJzaW9uIHdh
cyBlYXJsaWVyIHRoYW4gMTYuDQo+ID4gDQo+ID4gWGVuIHNldHMgdGhlIEZEVCB2ZXJzaW9uIHRv
IDE3IGluIGZkdF9jcmVhdGUoKS4NCj4gPiANCj4gPiBUaGUgaXNzdWUgSSB3YXMgaGF2aW5nIHdh
cyB0aGF0IExpbnV4IHBhbmlja2VkIHdoaWxlIGluaXRpYWxpemluZyBpbnRlcnJ1cHRzDQo+ID4g
YmVjYXVzZSBpdCBjb3VsZCBub3QgZmluZCBhbiBpbnRlcnJ1cHQgY29udHJvbGxlci4gSXQgY291
bGRuJ3QgZmluZCB0aGUNCj4gPiBpbnRlcnJ1cHQgY29udHJvbGxlciBiZWNhdXNlIGl0IGRpZG4n
dCBwcm9jZXNzIHRoYXQgcGFydCBvZiB0aGUgZGV2aWNlIHRyZWUuDQo+IA0KPiBUaGFuayB5b3Us
IFdpbGwhIEFuZCBpdCBpcyBncmVhdCB0byBoZWFyIHRoYXQgeW91IGFyZSB1c2luZyBkb20wbGVz
cyA6KQ0KPiANCj4gSSBjb3VsZG4ndCBmaW5kIHRoZSBzcGVjaWZpYyByZWZlcmVuY2UgdG8gdGhl
IHNwZWMsIGJ1dCBJIGNvdWxkIHZlcmlmeQ0KPiB0aGF0IHRoZSBwYXRjaCBmaXhlcyB0aGUgaXNz
dWUgZm9yIExpbnV4IDQuMTQsIHdoaWxlIGl0IGlzIHVubmVlZGVkIGZvcg0KPiBuZXdlciBMaW51
eCB2ZXJzaW9ucyAodGhleSBzdGlsbCB3b3JrIHdpdGggdGhlIHBhdGNoKS4gQWxzbyB3ZSBhbHJl
YWR5DQo+IHN0YXJ0IGVtcHR5IGRldmljZSB0cmVlIHVzaW5nICIiIGluc3RlYWQgb2YgIi8iIGlu
IGEgZmV3IG90aGVyIHBsYWNlcy4gSQ0KPiB3b3VsZCBsb3ZlIHRvIGhhdmUgdGhlIHJpZ2h0IHJl
ZmVyZW5jZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhvdWdoLg0KPiANCj4gRllJIHdlIGFsc28g
aGF2ZSBhbm90aGVyIGluc3RhbmNlIG9mIGZkdF9iZWdpbl9ub2RlKGZkdCwgIi8iKSBpbg0KPiB4
ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYyB0aGF0IG5lZWRzIGZpeGluZyBhbmQgY291
bGQgYmUgZG9uZSBpbg0KPiB0aGlzIHBhdGNoLg0KDQpUaGFua3MsIFN0ZWZhbm8hIEkgcmVhbGx5
IGFwcHJlY2lhdGUgYWxsIG9mIHlvdXIgd29yayBvbiBkb20wbGVzcy4gV2UncmUgdmVyeQ0KZXhj
aXRlZCB0byB1c2UgaXQuDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBvdGhlciBpbnN0
YW5jZS4gSSdsbCBmaXggdGhhdCwgY2hhbmdlIHRoZSBjb21taXQNCm1lc3NhZ2UgdG8gcmVmZXJl
bmNlIHRoZSBzcGVjLCBhbmQgc2VuZCBhIHYyIGluIGEgbW9tZW50Lg0KDQpUaGFua3MsDQpXaWxs
DQoNCi0tIA0KV2lsbCBBYmVsZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
