Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C46ACF9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQVZ-0003Yi-IG; Tue, 16 Jul 2019 16:40:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQVX-0003YO-W4
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:40:52 +0000
X-Inumbo-ID: 7674bbd8-a7e8-11e9-a28f-9bf4870c7cf3
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7674bbd8-a7e8-11e9-a28f-9bf4870c7cf3;
 Tue, 16 Jul 2019 16:40:47 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:40:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:39:35 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:39:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWYe5LDA8PWOGecz6TyYmBoRiVW7TgNYkGutA9dcQ8HBK8B6iPWfZ3cL/0wfcVji4wdYmGrJHjXmZCI2Y1iJu5hgxzWasEFyCDXMS11Ap3b7AOgBser+FVCp8i4VQzNW6o4p3l43WUEgNNfo4K/oHZkcDy+Bqeun47AeYdW+7u76pzKzHa4usdZyT3iI6irjmOB6TwePwx2B5jAfetjS9d46WrSAR3yjgFPTx+ngvcWstM61QHoS/qzRmHvFcYpSbNY9qaud3m5ROUoviaH07L0bG6KSriKvzS2WDj2VNM9ox554zaftVz9h0Ol4CKmvjSnA3d6eGtDgljn6UgLQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxes9v8C+Gg1gKRqCsaXZ38/3MLl/kAblAkIFsIcG2w=;
 b=Lmhq0mtUZmoZVN5KXioS5lkV5HURI4K2zLIb9VbEztKjGDu7eMmv0hXJj9vTYXzZkjx7c5eV/d/kEuq0JCpHzXl/cSquleGQEaAIzestmsQ7qxC0ciGY+sbL6qKnd1pZIAfbAVRrlcROiCl8MDYwdcgX2czzOXcw8EOpDeq5JbpYXlIhMEpIMGTKsSrX7oL0yS2i43PXG/IqzRdH2RYy3hEAlA+wPTsQ4BHsjSmcG6JsU20itfBIOCLe+L/Cll9fpwMcEBwjAsyuNBx6ypaWuztxr+K9/fm+jSTOB6DEIhpW3nH7s6683Au4fxEZbn7UwnBQIV7rYWANOuA9azSXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:39:34 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:39:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 10/14] AMD/IOMMU: allow enabling with IRQ not yet set
 up
Thread-Index: AQHVO/UMDuJQrxKu50asDLRP151iRw==
Date: Tue, 16 Jul 2019 16:39:34 +0000
Message-ID: <a2548d39-29c2-1afd-619d-ace67c4d61d6@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::15)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de420d15-db38-4267-ee0e-08d70a0c2f1c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB3164F9B28A381ED6CC983DAEB3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7rlDc6YdhBRwSIveJ753uAnX2Vy2UMehGONGc0WYko/1lGsvhCMPWOkrpWitEMnSF5PNLjboeEsPtZhtS7dL7yPxxws5CJ8xKql6pjG4zpIBtWDC/1LXyNFDNx8GPzUx/V0nXhqdMaYwi4v1H1xrvxUY2foNf6Z2ZsWs2qIEkkuB8BhuYqyQxyIkCYyjS7hnfaLe0gFizQvmGFp5MFgsGAgTpZsvAJkgpKk5jfo95f8QC664hgC6zqJPD5v0sGJOxUbCoRBcx2WcFY7GfN0GkOu/makTa3mQvfGEWqezAGCcWGZs/1ywwmJCBnhcSU2fAo0bBTpTCqJvFwJCbIsylY6MY2YQXJd+qtd2l215O3BIVzAWuZ4E05dbIu+jis/G3O3Qab2cqtMMJckFIJa00MLdljgwfeuFhRJGsL+oc98=
Content-ID: <F61DB13FD2AE73499F9BC2C6E2679C2F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de420d15-db38-4267-ee0e-08d70a0c2f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:39:34.3604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 10/14] AMD/IOMMU: allow enabling with IRQ not
 yet set up
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

RWFybHkgZW5hYmxpbmcgKHRvIGVudGVyIHgyQVBJQyBtb2RlKSByZXF1aXJlcyBkZWZlcnJpbmcg
b2YgdGhlIElSUQ0Kc2V0dXAuIENvZGUgdG8gYWN0dWFsbHkgZG8gdGhhdCBzZXR1cCBpbiB0aGUg
eDJBUElDIGNhc2Ugd2lsbCBnZXQgYWRkZWQNCnN1YnNlcXVlbnRseS4NCg0KU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQotLS0NCnYzOiBSZS1iYXNlLg0KDQotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQorKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQpAQCAtODE0LDcgKzgxNCw2IEBAIHN0
YXRpYyB2b2lkIGFtZF9pb21tdV9lcnJhdHVtXzc0Nl93b3JrYXINCiAgc3RhdGljIHZvaWQgZW5h
YmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQ0KICB7DQogICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOw0KLSAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7DQogIA0KICAgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmlvbW11LT5sb2NrLCBmbGFncyk7DQogIA0KQEAgLTgzNCwxOSArODMzLDI3
IEBAIHN0YXRpYyB2b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lvbW0NCiAgICAgIGlmICgg
aW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApDQogICAgICAgICAgcmVnaXN0ZXJfaW9tbXVf
cHByX2xvZ19pbl9tbWlvX3NwYWNlKGlvbW11KTsNCiAgDQotICAgIGRlc2MgPSBpcnFfdG9fZGVz
Yyhpb21tdS0+bXNpLmlycSk7DQotICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQotICAgIHNl
dF9tc2lfYWZmaW5pdHkoZGVzYywgTlVMTCk7DQotICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2Nr
KTsNCisgICAgaWYgKCBpb21tdS0+bXNpLmlycSA+IDAgKQ0KKyAgICB7DQorICAgICAgICBzdHJ1
Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNpLmlycSk7DQorDQorICAg
ICAgICBzcGluX2xvY2soJmRlc2MtPmxvY2spOw0KKyAgICAgICAgc2V0X21zaV9hZmZpbml0eShk
ZXNjLCBOVUxMKTsNCisgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCisgICAgfQ0K
ICANCiAgICAgIGFtZF9pb21tdV9tc2lfZW5hYmxlKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJM
RUQpOw0KICANCiAgICAgIHNldF9pb21tdV9odF9mbGFncyhpb21tdSk7DQogICAgICBzZXRfaW9t
bXVfY29tbWFuZF9idWZmZXJfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsN
Ci0gICAgc2V0X2lvbW11X2V2ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VO
QUJMRUQpOw0KICANCi0gICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5wcHJfc3VwICkNCi0g
ICAgICAgIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5B
QkxFRCk7DQorICAgIGlmICggaW9tbXUtPm1zaS5pcnEgPiAwICkNCisgICAgew0KKyAgICAgICAg
c2V0X2lvbW11X2V2ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJMRUQp
Ow0KKw0KKyAgICAgICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5wcHJfc3VwICkNCisgICAg
ICAgICAgICBzZXRfaW9tbXVfcHByX2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VO
QUJMRUQpOw0KKyAgICB9DQogIA0KICAgICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5ndF9z
dXAgKQ0KICAgICAgICAgIHNldF9pb21tdV9ndWVzdF90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11
LCBJT01NVV9DT05UUk9MX0VOQUJMRUQpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
