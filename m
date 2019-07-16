Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188C6ACF1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQTC-0002SJ-MV; Tue, 16 Jul 2019 16:38:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQTB-0002S2-0y
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:38:25 +0000
X-Inumbo-ID: 1f1fe6c8-a7e8-11e9-844f-f74b66a06d56
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f1fe6c8-a7e8-11e9-844f-f74b66a06d56;
 Tue, 16 Jul 2019 16:38:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:38:20 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:37:05 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgsMoU1fEe1oiAoQytpIp7cyDYBsgj/prOuhRtmGhm3XXsbZmDUJztOKwAn1lELedTy3XKYJ3POxkWufyL2WXuPnWU10oNXrJ/IzImuu9mcGGlG4UvYih99XnziSdlFGaeHA51eh67CApGAjPLUkyIVQDzBWdKL4T46gWUgvaZa+dcwnNO5z4y3rzH0tifvTpRo1/HCLGekHMICzIUIWP4qDWThU1nEi8ymHHBRO2cAItufGQhZR2Ldp+M3wajK1gCSsS4rQhlQ9XlBJkFxjAyXR7kPqN1ALhCmbjzQGcpjbHcnmH81CzUpF/pUzcsvWjLhnWbdZUwSEXnmdn+Z/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDpmXRLgpyo8ZPGmLUhOA5+z6IMq1k8kARFw1z8H3Dk=;
 b=FQz/hTY9wDLLJJDvrRRbI5/W9R0KmlSX9GKbgkZDE7RNMdlkSkHdiLg3WPrKB0+6CN0pLl+fsZy8SAts8ftMPlcnjxsZxqF1dE32Mi1przGqrUA8Na3as/DZfx+/rcoH1gSjIYtbu268NcQAbsQC5YloDpOUa1wYQqy09kfh6lI7i/guOhoeprlVAPiqgVPwFF6AAF0hnsdo3Bc3jFvavAF3bMAsTGvmMdmlw5SyNt/XxJkJ/7g/v+nP6LwQSupewLLgROQfsu/x+CgfXuh9bev4GszFHtjD4vtvasyveeHl94emD6IMUoQm4GsjhAYcMUIaoBRaISLIBG1hj43yDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:37:04 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:37:04 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 05/14] AMD/IOMMU: pass IOMMU to iterate_ivrs_entries()
 callback
Thread-Index: AQHVO/Sz16sGhQZEPkWqLoV/Wa6O1A==
Date: Tue, 16 Jul 2019 16:37:04 +0000
Message-ID: <e2072315-7c8c-2f82-99f4-795cc93f1fa8@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0801CA0045.eurprd08.prod.outlook.com
 (2603:10a6:4:2b::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8321b756-cba0-4b8d-66ca-08d70a0bd587
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB31641ED1A2DA306A47826D13B3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(52314003)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l9ppkDaTBt0N0GaZ/BGpoEmmcxHXxacdPb7u2lihlapbJWyuyu7rd9wkgwq5E/KbaoEw2CyQZu1sLsEAut1e3zqSnwboJHUAOloc1AE7MMicylCkPyKsKB10IkCY7O7MTeSXultnnCKgl1oBco4PRUNVNPB16rYhexOH2T3LvYqaHzng7zjUg1tph4Nxr6rU4Ux8JRv9gZsCZzq2VWS+8wGik9W28WtBcY+FHkQNDiGGExyILiz6B9QjBEIddJMpQaHpQf3LyFJ5dIepyHwKi/AVCHHKrhd29WbQl8MBX2/NzBO1GkKJ3ZXwrax+WUx2gaNwHiZAH0naQ3kuc1p5A3b23DWUFZTX9n7jkG0pRR81PkDiIw9IpIorro0aIg7mlpKbii3c2iSOPmd/aX+vrHNJFgJxz8hbPnncL0bDReY=
Content-ID: <9650ED2855C8DE498B5EF0AA33D7F7E2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8321b756-cba0-4b8d-66ca-08d70a0bd587
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:37:04.0532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 05/14] AMD/IOMMU: pass IOMMU to
 iterate_ivrs_entries() callback
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCB1c2VycyB3aWxsIHdhbnQgdG8ga25vdyBJT01NVSBwcm9wZXJ0aWVzIChzcGVjaWZpY2Fs
bHkgdGhlIElSVEUNCnNpemUpIHN1YnNlcXVlbnRseS4gTGV2ZXJhZ2UgdGhpcyB0byBhdm9pZCBw
b2ludGxlc3MgY2FsbHMgdG8gdGhlDQpjYWxsYmFjayB3aGVuIElWUlMgbWFwcGluZyB0YWJsZSBl
bnRyaWVzIGFyZSB1bnBvcHVsYXRlZC4gVG8gYXZvaWQNCmxlYWtpbmcgaW50ZXJydXB0IHJlbWFw
cGluZyB0YWJsZXMgKGJvZ3VzbHkpIGFsbG9jYXRlZCBmb3IgSU9NTVVzDQp0aGVtc2VsdmVzLCB0
aGlzIHJlcXVpcmVzIHN1cHByZXNzaW5nIHRoZWlyIGFsbG9jYXRpb24gaW4gdGhlIGZpcnN0DQpw
bGFjZSwgdGFraW5nIGEgc3RlcCBmdXJ0aGVyIHdoYXQgY29tbWl0IDc1NzEyMmMwY2YgKCdBTUQv
SU9NTVU6IGRvbid0DQoiYWRkIiBJT01NVXMnKSBoYWQgZG9uZS4NCg0KQWRkaXRpb25hbGx5IHN1
cHByZXNzIHRoZSBjYWxsIGZvciBhbGlhcyBlbnRyaWVzLCBhcyBhZ2FpbiBib3RoIHVzZXJzDQpk
b24ndCBjYXJlIGFib3V0IHRoZXNlIGFueXdheS4gSW4gZmFjdCB0aGlzIGVsaW1pbmF0ZXMgYSBm
YWlyIGJpdCBvZg0KcmVkdW5kYW5jeSBmcm9tIGR1bXAgb3V0cHV0Lg0KDQpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCnYzOiBOZXcuDQotLS0NClRC
RDogQWxvbmcgdGhlIGxpbmVzIG9mIGF2b2lkaW5nIHRoZSBJUlQgYWxsb2NhdGlvbiBmb3IgdGhl
IElPTU1VcywgaXMNCiAgICAgIHRoZXJlIGEgd2F5IHRvIHJlY29nbml6ZSB0aGUgbWFueSBDUFUt
cHJvdmlkZWQgZGV2aWNlcyBtYW55IG9mDQogICAgICB3aGljaCBjYW4ndCBnZW5lcmF0ZSBpbnRl
cnJ1cHRzIGFueXdheSwgYW5kIGF2b2lkIGFsbG9jYXRpb25zIGZvcg0KICAgICAgdGhlbSBhcyB3
ZWxsPyBJdCdzIDMyayBwZXIgZGV2aWNlLCBhZnRlciBhbGwuIEFub3RoZXIgb3B0aW9uIG1pZ2h0
DQogICAgICBiZSBvbi1kZW1hbmQgYWxsb2NhdGlvbiBvZiB0aGUgdGFibGVzLCBidXQgcXVpdGUg
cG9zc2libHkgd2UnZCBnZXQNCiAgICAgIGludG8gdHJvdWJsZSB3aXRoIGVycm9yIGhhbmRsaW5n
IHRoZXJlLg0KDQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5j
DQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5jDQpAQCAtNjUs
NyArNjUsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGFkZF9pdnJzX21hcHBpbmdfZW50cg0KICAg
ICAgLyogb3ZlcnJpZGUgZmxhZ3MgZm9yIHJhbmdlIG9mIGRldmljZXMgKi8NCiAgICAgIGl2cnNf
bWFwcGluZ3NbYmRmXS5kZXZpY2VfZmxhZ3MgPSBmbGFnczsNCiAgDQotICAgIGlmIChpdnJzX21h
cHBpbmdzW2FsaWFzX2lkXS5pbnRyZW1hcF90YWJsZSA9PSBOVUxMICkNCisgICAgLyogRG9uJ3Qg
bWFwIGFuIElPTU1VIGJ5IGl0c2VsZi4gKi8NCisgICAgaWYgKCBpb21tdS0+YmRmID09IGJkZiAp
DQorICAgICAgICByZXR1cm47DQorDQorICAgIGlmICggIWl2cnNfbWFwcGluZ3NbYWxpYXNfaWRd
LmludHJlbWFwX3RhYmxlICkNCiAgICAgIHsNCiAgICAgICAgICAgLyogYWxsb2NhdGUgcGVyLWRl
dmljZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlICovDQogICAgICAgICAgIGlmICggYW1kX2lv
bW11X3BlcmRldl9pbnRyZW1hcCApDQpAQCAtODEsOCArODUsOSBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgYWRkX2l2cnNfbWFwcGluZ19lbnRyDQogICAgICAgICAgICAgICBpdnJzX21hcHBpbmdzW2Fs
aWFzX2lkXS5pbnRyZW1hcF9pbnVzZSA9IHNoYXJlZF9pbnRyZW1hcF9pbnVzZTsNCiAgICAgICAg
ICAgfQ0KICAgICAgfQ0KLSAgICAvKiBBc3NpZ24gSU9NTVUgaGFyZHdhcmUsIGJ1dCBkb24ndCBt
YXAgYW4gSU9NTVUgYnkgaXRzZWxmLiAqLw0KLSAgICBpdnJzX21hcHBpbmdzW2JkZl0uaW9tbXUg
PSBpb21tdS0+YmRmICE9IGJkZiA/IGlvbW11IDogTlVMTDsNCisNCisgICAgLyogQXNzaWduIElP
TU1VIGhhcmR3YXJlLiAqLw0KKyAgICBpdnJzX21hcHBpbmdzW2JkZl0uaW9tbXUgPSBpb21tdTsN
CiAgfQ0KICANCiAgc3RhdGljIHN0cnVjdCBhbWRfaW9tbXUgKiBfX2luaXQgZmluZF9pb21tdV9m
cm9tX2JkZl9jYXAoDQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQpAQCAt
MTA2OSw3ICsxMDY5LDggQEAgaW50IGl0ZXJhdGVfaXZyc19tYXBwaW5ncyhpbnQgKCpoYW5kbGVy
KQ0KICAgICAgcmV0dXJuIHJjOw0KICB9DQogIA0KLWludCBpdGVyYXRlX2l2cnNfZW50cmllcyhp
bnQgKCpoYW5kbGVyKSh1MTYgc2VnLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKSkNCitpbnQgaXRl
cmF0ZV9pdnJzX2VudHJpZXMoaW50ICgqaGFuZGxlcikoY29uc3Qgc3RydWN0IGFtZF9pb21tdSAq
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaXZyc19t
YXBwaW5ncyAqKSkNCiAgew0KICAgICAgdTE2IHNlZyA9IDA7DQogICAgICBpbnQgcmMgPSAwOw0K
QEAgLTEwODIsNyArMTA4MywxMiBAQCBpbnQgaXRlcmF0ZV9pdnJzX2VudHJpZXMoaW50ICgqaGFu
ZGxlcikoDQogICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgIHNlZyA9IElWUlNfTUFQUElO
R1NfU0VHKG1hcCk7DQogICAgICAgICAgZm9yICggYmRmID0gMDsgIXJjICYmIGJkZiA8IGl2cnNf
YmRmX2VudHJpZXM7ICsrYmRmICkNCi0gICAgICAgICAgICByYyA9IGhhbmRsZXIoc2VnLCBtYXAg
KyBiZGYpOw0KKyAgICAgICAgew0KKyAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11ID0gbWFwW2JkZl0uaW9tbXU7DQorDQorICAgICAgICAgICAgaWYgKCBpb21tdSAmJiBt
YXBbYmRmXS5kdGVfcmVxdWVzdG9yX2lkID09IGJkZiApDQorICAgICAgICAgICAgICAgIHJjID0g
aGFuZGxlcihpb21tdSwgJm1hcFtiZGZdKTsNCisgICAgICAgIH0NCiAgICAgIH0gd2hpbGUgKCAh
cmMgJiYgKytzZWcgKTsNCiAgDQogICAgICByZXR1cm4gcmM7DQotLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvaW9tbXVfaW50ci5jDQpAQCAtNjE3LDcgKzYxNyw3IEBAIHZvaWQgYW1kX2lvbW11X3Jl
YWRfbXNpX2Zyb21faXJlKA0KICB9DQogIA0KICBpbnQgX19pbml0IGFtZF9pb21tdV9mcmVlX2lu
dHJlbWFwX3RhYmxlKA0KLSAgICB1MTYgc2VnLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqaXZyc19t
YXBwaW5nKQ0KKyAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgc3RydWN0IGl2cnNf
bWFwcGluZ3MgKml2cnNfbWFwcGluZykNCiAgew0KICAgICAgdm9pZCAqdGIgPSBpdnJzX21hcHBp
bmctPmludHJlbWFwX3RhYmxlOw0KICANCkBAIC02OTMsMTQgKzY5MywxNSBAQCBzdGF0aWMgdm9p
ZCBkdW1wX2ludHJlbWFwX3RhYmxlKGNvbnN0IHUzDQogICAgICB9DQogIH0NCiAgDQotc3RhdGlj
IGludCBkdW1wX2ludHJlbWFwX21hcHBpbmcodTE2IHNlZywgc3RydWN0IGl2cnNfbWFwcGluZ3Mg
Kml2cnNfbWFwcGluZykNCitzdGF0aWMgaW50IGR1bXBfaW50cmVtYXBfbWFwcGluZyhjb25zdCBz
dHJ1Y3QgYW1kX2lvbW11ICppb21tdSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqaXZyc19tYXBwaW5nKQ0KICB7DQogICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KICANCiAgICAgIGlmICggIWl2cnNfbWFwcGluZyApDQogICAgICAgICAg
cmV0dXJuIDA7DQogIA0KLSAgICBwcmludGsoIiAgJTA0eDolMDJ4OiUwMng6JXU6XG4iLCBzZWcs
DQorICAgIHByaW50aygiICAlMDR4OiUwMng6JTAyeDoldTpcbiIsIGlvbW11LT5zZWcsDQogICAg
ICAgICAgICAgUENJX0JVUyhpdnJzX21hcHBpbmctPmR0ZV9yZXF1ZXN0b3JfaWQpLA0KICAgICAg
ICAgICAgIFBDSV9TTE9UKGl2cnNfbWFwcGluZy0+ZHRlX3JlcXVlc3Rvcl9pZCksDQogICAgICAg
ICAgICAgUENJX0ZVTkMoaXZyc19tYXBwaW5nLT5kdGVfcmVxdWVzdG9yX2lkKSk7DQotLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2FtZC1pb21tdS5oDQpAQCAtMTI5LDcgKzEyOSw4IEBAIGV4dGVybiB1OCBpdmhkX3R5cGU7DQog
IA0KICBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqZ2V0X2l2cnNfbWFwcGluZ3ModTE2IHNlZyk7DQog
IGludCBpdGVyYXRlX2l2cnNfbWFwcGluZ3MoaW50ICgqKSh1MTYgc2VnLCBzdHJ1Y3QgaXZyc19t
YXBwaW5ncyAqKSk7DQotaW50IGl0ZXJhdGVfaXZyc19lbnRyaWVzKGludCAoKikodTE2IHNlZywg
c3RydWN0IGl2cnNfbWFwcGluZ3MgKikpOw0KK2ludCBpdGVyYXRlX2l2cnNfZW50cmllcyhpbnQg
KCopKGNvbnN0IHN0cnVjdCBhbWRfaW9tbXUgKiwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKSk7DQogIA0KICAvKiBpb21tdSB0YWJsZXMg
aW4gZ3Vlc3Qgc3BhY2UgKi8NCiAgc3RydWN0IG1taW9fcmVnIHsNCi0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaA0KKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oDQpAQCAtOTgsNyArOTgsOCBAQCBzdHJ1Y3Qg
YW1kX2lvbW11ICpmaW5kX2lvbW11X2Zvcl9kZXZpY2UoDQogIC8qIGludGVycnVwdCByZW1hcHBp
bmcgKi8NCiAgaW50IGFtZF9pb21tdV9zZXR1cF9pb2FwaWNfcmVtYXBwaW5nKHZvaWQpOw0KICB2
b2lkICphbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFibGUodW5zaWduZWQgbG9uZyAqKik7DQot
aW50IGFtZF9pb21tdV9mcmVlX2ludHJlbWFwX3RhYmxlKHUxNiBzZWcsIHN0cnVjdCBpdnJzX21h
cHBpbmdzICopOw0KK2ludCBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZSgNCisgICAgY29u
c3Qgc3RydWN0IGFtZF9pb21tdSAqLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKTsNCiAgdm9pZCBh
bWRfaW9tbXVfaW9hcGljX3VwZGF0ZV9pcmUoDQogICAgICB1bnNpZ25lZCBpbnQgYXBpYywgdW5z
aWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHZhbHVlKTsNCiAgdW5zaWduZWQgaW50IGFtZF9p
b21tdV9yZWFkX2lvYXBpY19mcm9tX2lyZSgNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
