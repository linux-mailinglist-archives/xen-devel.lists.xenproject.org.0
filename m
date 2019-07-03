Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD745E37A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 14:08:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hie16-0007Ug-HP; Wed, 03 Jul 2019 12:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hie14-0007Ub-Uf
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 12:05:38 +0000
X-Inumbo-ID: ddecfa68-9d8a-11e9-91b9-ff0a5194ccb6
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddecfa68-9d8a-11e9-91b9-ff0a5194ccb6;
 Wed, 03 Jul 2019 12:05:37 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 12:05:30 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 12:04:39 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 12:04:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3379.namprd18.prod.outlook.com (10.255.136.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 12:04:37 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 12:04:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] x86: suppress XPTI-related TLB flushes when possible
Thread-Index: AQHVMZd8pzxdv6yBEke5NzY7LaNciw==
Date: Wed, 3 Jul 2019 12:04:37 +0000
Message-ID: <ed400a4e-3929-e433-7c49-6b02c50faa00@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0087.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7329d6e-567b-430e-e6ac-08d6ffae9eb3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3379; 
x-ms-traffictypediagnostic: BY5PR18MB3379:
x-microsoft-antispam-prvs: <BY5PR18MB3379BA82902EC6D546298D52B3FB0@BY5PR18MB3379.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(53936002)(52116002)(6436002)(5640700003)(6512007)(7736002)(2351001)(102836004)(6486002)(68736007)(6506007)(8936002)(14454004)(80792005)(26005)(31686004)(72206003)(305945005)(54906003)(386003)(3846002)(8676002)(316002)(81166006)(186003)(2501003)(81156014)(486006)(66476007)(14444005)(66066001)(36756003)(476003)(2616005)(4326008)(256004)(99286004)(73956011)(2906002)(5660300002)(71190400001)(64756008)(71200400001)(6116002)(66446008)(6916009)(66556008)(66946007)(25786009)(478600001)(31696002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3379;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MKx8p0wHxutXCrZh/14DhwU3aS4fFBvVohmzkDBOrN464cI/wUGvtEjvn504CId3jYWFXiP9t4TydTUaN9d4DOMg3l5m4a5ZY5q8hR1t/0+waAaIZaC4fBdmXYZV7zVDL4ZBK8qOjYUQ+A8y1qeFQVaMwk6dcthfpXQqBlegsq1wdBrBAiZVrpADShwL3wj0iFutM00y32363KxdnxP9sh+Nm5kSmlRjQwM6QPvE6wOwf+qWpZhHIT8nhggLWJWlpf+yNK805Z2oGAEMyWR0CituVHktn68kssTsnpJ+DhdruSV2wAuM6zHQyt1Jtirx3TbofFim2/EyY11fvY9nv6lF8b7GNfrLSgSIJTUs0MYaiesTeXBSGCptorHAXKNHyVlhLJ4oFJMOVmnVe3lsPPeiQycihYZKhJq1wKopKaw=
Content-ID: <A5A952F68F87EE498F75286EBB104B35@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e7329d6e-567b-430e-e6ac-08d6ffae9eb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 12:04:37.3904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3379
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3] x86: suppress XPTI-related TLB flushes when
 possible
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB0aGVyZSdzIG5vIFhQVEktZW5hYmxlZCBQViBkb21haW4gYXQgYWxsLCB0aGVyZSdzIG5v
IG5lZWQgdG8gaXNzdWUNCnJlc3BlY3RpdmUgVExCIGZsdXNoZXMuIEhhcmR3aXJlIG9wdF94cHRp
XyogdG8gZmFsc2Ugd2hlbiAhUFYsIGFuZA0KcmVjb3JkIHRoZSBjcmVhdGlvbiBvZiBQViBkb21h
aW5zIGJ5IGJ1bXBpbmcgb3B0X3hwdGlfKiBhY2NvcmRpbmdseS4NCg0KQXMgdG8gdGhlIHN0aWNr
eSBvcHRfeHB0aV9kb211IHZzIGluY3JlbWVudC9kZWNyZW1lbnQgb2Ygb3B0X3hwdGlfaHdkb20s
DQp0aGlzIGlzIGRvbmUgdGhpcyB3YXkgdG8gYXZvaWQNCihhKSB3aWRlbmluZyB0aGUgZm9ybWVy
IHZhcmlhYmxlLA0KKGIpIGFueSByaXNrIG9mIGEgbWlzc2VkIGZsdXNoLCB3aGljaCB3b3VsZCBy
ZXN1bHQgaW4gYW4gWFNBIGlmIGEgRG9tVQ0KICAgICB3YXMgYWJsZSB0byBleGVyY2lzZSBpdCwg
YW5kDQooYykgYW55IHJhY2VzIHVwZGF0aW5nIHRoZSB2YXJpYWJsZS4NCkZ1bmRhbWVudGFsbHkg
dGhlIFRMQiBmbHVzaCBkb25lIHdoZW4gY29udGV4dCBzd2l0Y2hpbmcgb3V0IHRoZSBkb21haW4n
cw0KdkNQVS1zIHRoZSBsYXN0IHRpbWUgYmVmb3JlIGRlc3Ryb3lpbmcgdGhlIGRvbWFpbiBvdWdo
dCB0byBiZQ0Kc3VmZmljaWVudCwgc28gaW4gcHJpbmNpcGxlIERvbVUgaGFuZGxpbmcgY291bGQg
YmUgbWFkZSBtYXRjaCBod2RvbSdzLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQotLS0NCnYzOiBSZS1iYXNlLg0KdjI6IEFkZCBjb21tZW50IHRvIHNw
ZWNfY3RybC5oLiBFeHBsYWluIGRpZmZlcmVuY2UgaW4gYWNjb3VudGluZyBvZiBEb21VDQogICAg
IGFuZCBod2RvbS4NCi0tLQ0KVEJEOiBUaGUgaGFyZHdpcmluZyB0byBmYWxzZSBjb3VsZCBiZSBl
eHRlbmRlZCB0byBvcHRfcHZfbDF0Zl8qIGFuZCAoZm9yDQogICAgICAhSFZNKSBvcHRfbDFkX2Zs
dXNoIGFzIHdlbGwuDQoNCi0tLSBhL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jDQorKysgYi94ZW4v
YXJjaC94ODYvZmx1c2h0bGIuYw0KQEAgLTIxOCw3ICsyMTgsNyBAQCB1bnNpZ25lZCBpbnQgZmx1
c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkDQogICAgICAgICAgICAgICAgICAgKi8NCiAgICAgICAg
ICAgICAgICAgIGludnBjaWRfZmx1c2hfb25lKFBDSURfUFZfUFJJViwgYWRkcik7DQogICAgICAg
ICAgICAgICAgICBpbnZwY2lkX2ZsdXNoX29uZShQQ0lEX1BWX1VTRVIsIGFkZHIpOw0KLSAgICAg
ICAgICAgICAgICBpZiAoIG9wdF94cHRpX2h3ZG9tIHx8IG9wdF94cHRpX2RvbXUgKQ0KKyAgICAg
ICAgICAgICAgICBpZiAoIG9wdF94cHRpX2h3ZG9tID4gMSB8fCBvcHRfeHB0aV9kb211ID4gMSAp
DQogICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICAgaW52cGNpZF9mbHVz
aF9vbmUoUENJRF9QVl9QUklWIHwgUENJRF9QVl9YUFRJLCBhZGRyKTsNCiAgICAgICAgICAgICAg
ICAgICAgICBpbnZwY2lkX2ZsdXNoX29uZShQQ0lEX1BWX1VTRVIgfCBQQ0lEX1BWX1hQVEksIGFk
ZHIpOw0KLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jDQorKysgYi94ZW4vYXJjaC94ODYv
cHYvZG9tYWluLmMNCkBAIC0yNzIsNiArMjcyLDkgQEAgdm9pZCBwdl9kb21haW5fZGVzdHJveShz
dHJ1Y3QgZG9tYWluICpkKQ0KICAgICAgZGVzdHJveV9wZXJkb21haW5fbWFwcGluZyhkLCBHRFRf
TERUX1ZJUlRfU1RBUlQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdEVF9MRFRf
TUJZVEVTIDw8ICgyMCAtIFBBR0VfU0hJRlQpKTsNCiAgDQorICAgIG9wdF94cHRpX2h3ZG9tIC09
IElTX0VOQUJMRUQoQ09ORklHX0xBVEVfSFdET00pICYmDQorICAgICAgICAgICAgICAgICAgICAg
ICFkLT5kb21haW5faWQgJiYgb3B0X3hwdGlfaHdkb207DQorDQogICAgICBYRlJFRShkLT5hcmNo
LnB2LmNwdWlkbWFza3MpOw0KICANCiAgICAgIEZSRUVfWEVOSEVBUF9QQUdFKGQtPmFyY2gucHYu
Z2R0X2xkdF9sMXRhYik7DQpAQCAtMzEwLDcgKzMxMywxNiBAQCBpbnQgcHZfZG9tYWluX2luaXRp
YWxpc2Uoc3RydWN0IGRvbWFpbiAqDQogICAgICAvKiA2NC1iaXQgUFYgZ3Vlc3QgYnkgZGVmYXVs
dC4gKi8NCiAgICAgIGQtPmFyY2guaXNfMzJiaXRfcHYgPSBkLT5hcmNoLmhhc18zMmJpdF9zaGlu
Zm8gPSAwOw0KICANCi0gICAgZC0+YXJjaC5wdi54cHRpID0gaXNfaGFyZHdhcmVfZG9tYWluKGQp
ID8gb3B0X3hwdGlfaHdkb20gOiBvcHRfeHB0aV9kb211Ow0KKyAgICBpZiAoIGlzX2hhcmR3YXJl
X2RvbWFpbihkKSAmJiBvcHRfeHB0aV9od2RvbSApDQorICAgIHsNCisgICAgICAgIGQtPmFyY2gu
cHYueHB0aSA9IHRydWU7DQorICAgICAgICArK29wdF94cHRpX2h3ZG9tOw0KKyAgICB9DQorICAg
IGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiBvcHRfeHB0aV9kb211ICkNCisgICAgew0K
KyAgICAgICAgZC0+YXJjaC5wdi54cHRpID0gdHJ1ZTsNCisgICAgICAgIG9wdF94cHRpX2RvbXUg
PSAyOw0KKyAgICB9DQogIA0KICAgICAgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGQpICYmIHVz
ZV9pbnZwY2lkICYmIGNwdV9oYXNfcGNpZCApDQogICAgICAgICAgc3dpdGNoICggQUNDRVNTX09O
Q0Uob3B0X3BjaWQpICkNCi0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYw0KKysrIGIveGVu
L2FyY2gveDg2L3NwZWNfY3RybC5jDQpAQCAtODUsMTAgKzg1LDEyIEBAIHN0YXRpYyBpbnQgX19p
bml0IHBhcnNlX3NwZWNfY3RybChjb25zdA0KICANCiAgICAgICAgICAgICAgb3B0X2VhZ2VyX2Zw
dSA9IDA7DQogIA0KKyNpZmRlZiBDT05GSUdfUFYNCiAgICAgICAgICAgICAgaWYgKCBvcHRfeHB0
aV9od2RvbSA8IDAgKQ0KICAgICAgICAgICAgICAgICAgb3B0X3hwdGlfaHdkb20gPSAwOw0KICAg
ICAgICAgICAgICBpZiAoIG9wdF94cHRpX2RvbXUgPCAwICkNCiAgICAgICAgICAgICAgICAgIG9w
dF94cHRpX2RvbXUgPSAwOw0KKyNlbmRpZg0KICANCiAgICAgICAgICAgICAgaWYgKCBvcHRfc210
IDwgMCApDQogICAgICAgICAgICAgICAgICBvcHRfc210ID0gMTsNCkBAIC0xODcsNiArMTg5LDcg
QEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vfc3BlY19jdHJsKGNvbnN0DQogIH0NCiAgY3VzdG9t
X3BhcmFtKCJzcGVjLWN0cmwiLCBwYXJzZV9zcGVjX2N0cmwpOw0KICANCisjaWZkZWYgQ09ORklH
X1BWDQogIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF94cHRpX2h3ZG9tID0gLTE7DQogIGludDhf
dCBfX3JlYWRfbW9zdGx5IG9wdF94cHRpX2RvbXUgPSAtMTsNCiAgDQpAQCAtMjUzLDYgKzI1Niw5
IEBAIHN0YXRpYyBfX2luaXQgaW50IHBhcnNlX3hwdGkoY29uc3QgY2hhcg0KICAgICAgcmV0dXJu
IHJjOw0KICB9DQogIGN1c3RvbV9wYXJhbSgieHB0aSIsIHBhcnNlX3hwdGkpOw0KKyNlbHNlIC8q
ICFDT05GSUdfUFYgKi8NCisjIGRlZmluZSB4cHRpX2luaXRfZGVmYXVsdChjYXBzKSAoKHZvaWQp
KGNhcHMpKQ0KKyNlbmRpZiAvKiBDT05GSUdfUFYgKi8NCiAgDQogIGludDhfdCBfX3JlYWRfbW9z
dGx5IG9wdF9wdl9sMXRmX2h3ZG9tID0gLTE7DQogIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9w
dl9sMXRmX2RvbXUgPSAtMTsNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmgN
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmgNCkBAIC00Myw3ICs0MywxOCBA
QCBleHRlcm4gYm9vbCBic3BfZGVsYXlfc3BlY19jdHJsOw0KICBleHRlcm4gdWludDhfdCBkZWZh
dWx0X3hlbl9zcGVjX2N0cmw7DQogIGV4dGVybiB1aW50OF90IGRlZmF1bHRfc3BlY19jdHJsX2Zs
YWdzOw0KICANCisjaWZkZWYgQ09ORklHX1BWDQorLyoNCisgKiBWYWx1ZXMgLTEsIDAsIGFuZCAx
IGhhdmUgdGhlIHVzdWFsIG1lYW5pbmcgb2YgIm5vdCBlc3RhYmxpc2hlZCB5ZXQiLA0KKyAqICJk
aXNhYmxlZCIsIGFuZCAiZW5hYmxlZCIuIFZhbHVlcyBsYXJnZXIgdGhhbiAxIGluZGljYXRlIHRo
ZXJlJ3MgYWN0dWFsbHkNCisgKiBhdCBsZWFzdCBvbmUgc3VjaCBkb21haW4gKG9yIHRoZXJlIGhh
cyBiZWVuKS4gVGhpcyB3YXkgWFBUSS1zcGVjaWZpYyBUTEINCisgKiBmbHVzaGVzIGNhbiBiZSBh
dm9pZGVkIHdoZW4gbm8gWFBUSS1lbmFibGVkIGRvbWFpbiBpcy93YXMgYWN0aXZlLg0KKyAqLw0K
ICBleHRlcm4gaW50OF90IG9wdF94cHRpX2h3ZG9tLCBvcHRfeHB0aV9kb211Ow0KKyNlbHNlDQor
IyBkZWZpbmUgb3B0X3hwdGlfaHdkb20gZmFsc2UNCisjIGRlZmluZSBvcHRfeHB0aV9kb211IGZh
bHNlDQorI2VuZGlmDQogIA0KICBleHRlcm4gaW50OF90IG9wdF9wdl9sMXRmX2h3ZG9tLCBvcHRf
cHZfbDF0Zl9kb211Ow0KICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
