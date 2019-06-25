Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3452043
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 03:13:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfZxf-00053T-9J; Tue, 25 Jun 2019 01:09:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TZKh=UY=cs.rochester.edu=ejohns48@srs-us1.protection.inumbo.net>)
 id 1hfZxe-00053O-8f
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 01:09:26 +0000
X-Inumbo-ID: df1709c6-96e5-11e9-8980-bc764e045a96
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4c::707])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df1709c6-96e5-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 01:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uofr.onmicrosoft.com; 
 s=selector1-uofr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9cZgch2kgF/cVzEppeBBA14BGqKTeiRNPDkpEZLxIM=;
 b=a9EP6Z2L4HzicEcZ9v0TgiXXQ67W2Pem0afaf5XDFKgTIH7t6/jQsrG/3vcoVN3DBfO+iTtR3ndNHA7josQ534eT1Wp7Gw0R5MjDSfXhs3v61VfCnwx/r0z2ij3jB2VQVRCAN3W7ViSVHUvb9dQBo56YVrcHDD6JlATBV0+2QbM=
Received: from DM6PR07MB6396.namprd07.prod.outlook.com (20.179.69.208) by
 DM6PR07MB6907.namprd07.prod.outlook.com (10.141.160.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 01:09:22 +0000
Received: from DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::2473:cb21:ae79:7b70]) by DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::2473:cb21:ae79:7b70%5]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 01:09:22 +0000
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] How to compile Xen 4.12 with Clang on Linux?
Thread-Index: AQHVJ7i1Je7oKhKK/0GwVBvjeP7EXKalKMIAgAZtCAA=
Date: Tue, 25 Jun 2019 01:09:22 +0000
Message-ID: <d5ae7db2-b260-c58b-43be-f1f82cdfec9f@cs.rochester.edu>
References: <9b1a4ece-91fa-c3ad-c0f1-f749cf61f5f9@cs.rochester.edu>
 <1c7b7a7a-0645-5710-14fe-af90ee6383ef@citrix.com>
In-Reply-To: <1c7b7a7a-0645-5710-14fe-af90ee6383ef@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:2d::33) To DM6PR07MB6396.namprd07.prod.outlook.com
 (2603:10b6:5:157::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ejohns48@cs.rochester.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.5.53.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb848cb5-37c8-4daf-44f2-08d6f909c1db
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR07MB6907; 
x-ms-traffictypediagnostic: DM6PR07MB6907:
x-microsoft-antispam-prvs: <DM6PR07MB69076EE497E15F79AB91FC85E4E30@DM6PR07MB6907.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(346002)(136003)(396003)(366004)(376002)(31014005)(189003)(199004)(31686004)(11346002)(446003)(102836004)(186003)(71190400001)(75432002)(478600001)(6116002)(25786009)(3846002)(8936002)(110136005)(66946007)(68736007)(26005)(8676002)(316002)(71200400001)(73956011)(81156014)(305945005)(786003)(7736002)(66476007)(5660300002)(66556008)(31696002)(64756008)(66446008)(81166006)(476003)(486006)(66066001)(6436002)(229853002)(53936002)(14444005)(2501003)(6486002)(86362001)(6512007)(256004)(2616005)(386003)(6506007)(14454004)(53546011)(52116002)(2906002)(88552002)(76176011)(99286004)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR07MB6907;
 H:DM6PR07MB6396.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cs.rochester.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YZOGJHYFRh4rvho7E//A6zJ/VRxXaC115WC+YuCANQw8VywUnmUsJiBmWSqqrM31AMpsfcfIEBacHt8SDTRNRp5Ozk0CHHaouSBBomvfSyL424WKutnc0rzyucq/LN+5kJL0VRKIilRFQGhOdhMCVZ8dW2SmRvrGcpxG+dH9nB0oySdQOYhBLDXJhwwNfmN2VfwsnGV+rggllMuwIslIcHMxjR+ncC5lMEcwe1+Q43LSZDUbz6AkI6Q7CDKgjBkg5TBIiVRaKM68DHOfEQjpo8NzJt0z9ix7EexNmsM7WCq1YDvNRtZxzSVQatdwAWa6qMs6AJqf/hYl8/vKJEzHdqXtezfFlo/E5Y00DzxYOqlh7vyHYOhJFIo3PrSQ/unVCHOpq0eiXREYoNsFgCnwCTdclXp5UBb8fGGpotbBcAI=
Content-ID: <66B82140E5DDDC4683D8646E8AC001E2@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: fb848cb5-37c8-4daf-44f2-08d6f909c1db
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 01:09:22.5136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejohns48@ur.rochester.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6907
Subject: Re: [Xen-devel] How to compile Xen 4.12 with Clang on Linux?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yMC8xOSA3OjAxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBYZW4gaXRzZWxmIGRv
ZXNuJ3QgdXNlIGF1dG9jb25mLCBhbmQgbmVlZHMgYSBiaXQgb2YgZXh0cmEgaGVscCBnZXR0aW5n
DQo+IGl0cyBvcHRpb25zIGluIG9yZGVyLsKgIFRoZXJlIGlzIGFuIGV4dHJhIGNsYW5nPXkgdmFy
aWFibGUgd2hpY2ggeW91IG5lZWQNCj4gdG8gcGFzcy4NCj4NCj4geGVuLmdpdCQgbWFrZSAtQyB4
ZW4vIENDPWNsYW5nLTcgY2xhbmc9eQ0KDQpUaGFua3MhIFRoYXQgc2VlbXMgdG8gaGF2ZSB3b3Jr
ZWQuDQoNCk5vdyBJJ3ZlIGdvdCBhIG5ldyBpc3N1ZTogaXQgbG9va3MgbGlrZSBYZW4gaXMgdHJ5
aW5nIHRvIHVzZSBhbiANCm9wdGltaXphdGlvbiBmbGFnIHRoYXQgQ2xhbmcgZG9lc24ndCBsaWtl
Og0KDQotLS0tLS0tLS0tDQpbIDE2JV0gQnVpbGRpbmcgQyBvYmplY3QgY3J5cHRvL0NNYWtlRmls
ZXMvdHBtX2NyeXB0by5kaXIvaG1hYy5vDQpjZCANCi9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVu
LTQuMTIuMC9zdHViZG9tL3RwbV9lbXVsYXRvci14ODZfNjQvYnVpbGQvY3J5cHRvIA0KJiYgL3Vz
ci9iaW4vY2xhbmctN8KgIC1JL29wdC9sb2NhbC9pbmNsdWRlIA0KLUkvaG9tZS9lam9obnM0OC9E
ZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS90cG1fZW11bGF0b3IteDg2XzY0IA0KLUkvaG9tZS9l
am9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS90cG1fZW11bGF0b3IteDg2XzY0L2J1
aWxkIA0KLXN0ZD1jOTkgLURUUE1fTk9fRVhURVJOIC1pc3lzdGVtIA0KL2hvbWUvZWpvaG5zNDgv
RGVza3RvcC94ZW4tNC4xMi4wL3N0dWJkb20vLi4vZXh0cmFzL21pbmktb3MvaW5jbHVkZSANCi1E
X19NSU5JT1NfXyAtREhBVkVfTElCQyAtaXN5c3RlbSANCi9ob21lL2Vqb2huczQ4L0Rlc2t0b3Av
eGVuLTQuMTIuMC9zdHViZG9tLy4uL2V4dHJhcy9taW5pLW9zL2luY2x1ZGUvcG9zaXggDQotaXN5
c3RlbSANCi9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tLy4uL3Rvb2xz
L3hlbnN0b3JlL2luY2x1ZGUgDQotaXN5c3RlbSANCi9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVu
LTQuMTIuMC9zdHViZG9tLy4uL2V4dHJhcy9taW5pLW9zL2luY2x1ZGUveDg2IA0KLWlzeXN0ZW0g
DQovaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS8uLi9leHRyYXMvbWlu
aS1vcy9pbmNsdWRlL3g4Ni94ODZfNjQgDQotVSBfX2xpbnV4X18gLVUgX19GcmVlQlNEX18gLVUg
X19zdW5fXyAtbm9zdGRpbmMgLWlzeXN0ZW0gDQovaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00
LjEyLjAvc3R1YmRvbS8uLi9leHRyYXMvbWluaS1vcy9pbmNsdWRlL3Bvc2l4IA0KLWlzeXN0ZW0g
DQovaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS9jcm9zcy1yb290LXg4
Nl82NC94ODZfNjQteGVuLWVsZi9pbmNsdWRlIA0KLWlzeXN0ZW0gL3Vzci9saWIvZ2NjL3g4Nl82
NC1saW51eC1nbnUvNy9pbmNsdWRlIC1pc3lzdGVtIA0KL2hvbWUvZWpvaG5zNDgvRGVza3RvcC94
ZW4tNC4xMi4wL3N0dWJkb20vbHdpcC14ODZfNjQvc3JjL2luY2x1ZGUgDQotaXN5c3RlbSANCi9o
b21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL2x3aXAteDg2XzY0L3NyYy9p
bmNsdWRlL2lwdjQgDQotSS9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9t
L2luY2x1ZGUgDQotSS9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tLy4u
L3hlbi9pbmNsdWRlIC1tbm8tcmVkLXpvbmUgDQotTzEgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIg
LU8xIC1mbm8tb21pdC1mcmFtZS1wb2ludGVywqAgLW02NCANCi1tbm8tcmVkLXpvbmUgLWZuby1y
ZW9yZGVyLWJsb2NrcyAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIC1tNjQgDQotREJV
SUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkgLVdhbGwgLVdzdHJpY3QtcHJv
dG90eXBlcyANCi1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51c2VkLWxvY2Fs
LXR5cGVkZWZzwqDCoCANCi1mbm8tc3RhY2stcHJvdGVjdG9yIC1mbm8tZXhjZXB0aW9ucyAtV25v
LWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudMKgwqAgDQotV2FsbCAtV2Vycm9yIC1XZXh0cmEg
LVduby11bnVzZWQtcGFyYW1ldGVyIC1XcG9pbnRlci1hcml0aCAtV2Nhc3QtYWxpZ24gDQotV3dy
aXRlLXN0cmluZ3MgLW8gQ01ha2VGaWxlcy90cG1fY3J5cHRvLmRpci9obWFjLm/CoMKgIC1jIA0K
L2hvbWUvZWpvaG5zNDgvRGVza3RvcC94ZW4tNC4xMi4wL3N0dWJkb20vdHBtX2VtdWxhdG9yLXg4
Nl82NC9jcnlwdG8vaG1hYy5jDQpjbGFuZzogZXJyb3I6IG9wdGltaXphdGlvbiBmbGFnICctZm5v
LXJlb3JkZXItYmxvY2tzJyBpcyBub3Qgc3VwcG9ydGVkIA0KWy1XZXJyb3IsLVdpZ25vcmVkLW9w
dGltaXphdGlvbi1hcmd1bWVudF0NCi0tLS0tLS0tLS0NCg0KSSdtIHNlZWluZyB0aGlzIHNhbWUg
ZXJyb3Igb24gb3RoZXIgdHJhbnNsYXRpb24gdW5pdHMgYXMgd2VsbCB3aGVuIEkgcnVuIA0KIm1h
a2UiIHdpdGggbXVsdGlwbGUgdGhyZWFkcyAoLWoyNCkuDQoNCklzIHRoaXMgYW5vdGhlciB0aGlu
ZyBJIGNhbiBmaXggd2l0aCBhIGZsYWcgb3IgZG8gSSBuZWVkIHRvIGRpZyBkZWVwZXI/DQoNClRo
YW5rcywNCkV0aGFuDQoNCi0tIA0KRXRoYW4gSi4gSm9obnNvbg0KQ29tcHV0ZXIgU2NpZW5jZSBQ
aEQgc3R1ZGVudCwgU3lzdGVtcyBncm91cCwgVW5pdmVyc2l0eSBvZiBSb2NoZXN0ZXINCmVqb2hu
czQ4QGNzLnJvY2hlc3Rlci5lZHUNCmV0aGFuam9obnNvbkBhY20ub3JnDQpQR1AgcHVibGljIGtl
eSBhdmFpbGFibGUgZnJvbSBwdWJsaWMgZGlyZWN0b3J5IG9yIG9uIHJlcXVlc3QNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
