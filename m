Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA074FB4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:39:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdtb-0007om-5k; Thu, 25 Jul 2019 13:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqdtZ-0007oa-C2
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:34:57 +0000
X-Inumbo-ID: fc95ba06-aee0-11e9-b3f8-276de1adf21f
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc95ba06-aee0-11e9-b3f8-276de1adf21f;
 Thu, 25 Jul 2019 13:34:55 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:34:54 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:32:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXdEM7Oz8+icmgB3vtBb3MAkqd847AzQnKM6HU9UzFkEJAHi7a7vqIEXD6HPnr3P2LXmppIwoha9qisBrqIG8FyTX2HTirO4fOzWUxucrn+i+A0pXzqmQk3BtkgaZEW7oXeKTwfstDlI/RxafyRNnAyBSyvG9Rq/uqRSQVHg5fkmbP2stzrZItkoTpR1Vl7ErVEArt/fYLWXVUlLM+QdEtOUsCmHOVTtDsrQx6zFcqylMFZx7Gcy14g3RfKnGAiE43to7YwSMxo7/GljwqA/cfRVG2K742qNvhesp8oBFluo6ka3XksrZTUNrgbyCZP2LNUlsb0iL57edxxghaigkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85Gdb1u84nQyfIn3TcMtB5hLBwNwv9XF2/n2wt3FSZo=;
 b=nAmxGPRwqz+P01Jd3irc9b69sosXPF4qePeN6ICoxZ5v5EEU//hEAkmAoVO0zVzHAzuzxE7q1xzNNH6oaUlJ9zK4HDYCyNqIYT5wv2qfdwCD7hQfNBuh8qMFdwPq6b7IWmZBnAbR/gtvGtdd/+pVGtrskw592WzAErbCi7M3039VCKUQHffeS3s7KqwZijVwJOlw5KKyu0Vf6GldvXmJCUiFXu4XQ1qPKHr7JojibKuiUhIvbu+ryM76AZKplPLtgNd8io0bme21d3auVoMmU/VwrPwjrBXzVO7oHzaCp/mnMmcai9eloz84lcVzQnlJQyeJvk1rBuw0/pGbrldqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3171.namprd18.prod.outlook.com (10.255.137.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 13:32:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:32:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 08/12] AMD/IOMMU: adjust setup of internal interrupt
 for x2APIC mode
Thread-Index: AQHVQu1fNn4kSH7XOkGXPZYEvIM4zw==
Date: Thu, 25 Jul 2019 13:32:15 +0000
Message-ID: <af334965-6175-07d7-9821-dde77bd3595a@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
In-Reply-To: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21361a90-c965-420d-d2fd-08d711048200
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3171; 
x-ms-traffictypediagnostic: BY5PR18MB3171:
x-microsoft-antispam-prvs: <BY5PR18MB31716FA4F4FE62C67B864195B3C10@BY5PR18MB3171.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(81166006)(11346002)(26005)(6116002)(478600001)(446003)(256004)(52116002)(186003)(316002)(2501003)(81156014)(476003)(5640700003)(2351001)(5660300002)(3846002)(486006)(2616005)(54906003)(66066001)(8676002)(6436002)(80792005)(66946007)(76176011)(71200400001)(31686004)(86362001)(71190400001)(99286004)(6486002)(8936002)(64756008)(66556008)(53936002)(6506007)(66446008)(2906002)(14454004)(6916009)(102836004)(7736002)(31696002)(6512007)(36756003)(305945005)(68736007)(4326008)(66476007)(14444005)(25786009)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3171;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jeP15zo+sjifINJS2N+MuTKQOomHNcUE66ltal5CRPK5nPhpxiWr8u3Oqz3QlPE+nopQuSTfarWsmyR7ODtDlWGwG/kx20oqAMKmCYDaN2ilGOwK4lh518WYJQkXmp8M1tDL4F0bVYm3uYgiEPWPB+HXAZNDJhpd05k7EL0Z6zfUgPowJ2DTh2H3iJlBFcLBlSN/cv/0irlqs7ESj5LkBxLBjy97MetiIzuHPaHO4wMG2ELTWH79zIISDkBKDFyXO1ZpUChfOUUwwcvTunZQ4IM0LZMVs790OjbgmxsQhkzJTAUlFB5VBIMQZgMaOcEy25BygIV4ZHNBHPZm5ZyRRdZoAY9jkWfpKaZWXWTOB6PjGNroTkhYI1p71bACzdRVogo4jUJcfMwtM2jcz/NYM4HCxDBcL1olBgo3q/i+Ghc=
Content-ID: <A9546990067B154CB6A745386B235251@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 21361a90-c965-420d-d2fd-08d711048200
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:32:15.6497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3171
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 08/12] AMD/IOMMU: adjust setup of internal
 interrupt for x2APIC mode
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

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBleHByZXNzIGFsbCBwb3NzaWJsZSBkZXN0aW5hdGlvbnMg
d2UgbmVlZCB0byBtYWtlDQp1c2Ugb2YgdGhpcyBub24tTVNJLWNhcGFiaWxpdHkgYmFzZWQgbWVj
aGFuaXNtLiBUaGUgbmV3IElSUSBjb250cm9sbGVyDQpzdHJ1Y3R1cmUgY2FuIHJlLXVzZSBjZXJ0
YWluIE1TSSBmdW5jdGlvbnMsIHRob3VnaC4NCg0KRm9yIG5vdyBnZW5lcmFsIGFuZCBQUFIgaW50
ZXJydXB0cyBzdGlsbCBzaGFyZSBhIHNpbmdsZSB2ZWN0b3IsIElSUSwgYW5kDQpoZW5jZSBoYW5k
bGVyLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpS
ZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCkFj
a2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4NCi0tLQ0KdjQ6IFJlLWJh
c2UuDQp2MzogUmUtYmFzZS4NCg0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2luaXQuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQu
Yw0KQEAgLTQ3Miw2ICs0NzIsNDQgQEAgc3RhdGljIGh3X2lycV9jb250cm9sbGVyIGlvbW11X21h
c2thYmxlXw0KICAgICAgLnNldF9hZmZpbml0eSA9IHNldF9tc2lfYWZmaW5pdHksDQogIH07DQog
IA0KK3N0YXRpYyB2b2lkIHNldF94MmFwaWNfYWZmaW5pdHkoc3RydWN0IGlycV9kZXNjICpkZXNj
LCBjb25zdCBjcHVtYXNrX3QgKm1hc2spDQorew0KKyAgICBzdHJ1Y3QgYW1kX2lvbW11ICppb21t
dSA9IGRlc2MtPmFjdGlvbi0+ZGV2X2lkOw0KKyAgICB1bnNpZ25lZCBpbnQgZGVzdCA9IHNldF9k
ZXNjX2FmZmluaXR5KGRlc2MsIG1hc2spOw0KKyAgICB1bmlvbiBhbWRfaW9tbXVfeDJhcGljX2Nv
bnRyb2wgY3RybCA9IHt9Ow0KKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KKw0KKyAgICBpZiAo
IGRlc3QgPT0gQkFEX0FQSUNJRCApDQorICAgICAgICByZXR1cm47DQorDQorICAgIG1zaV9jb21w
b3NlX21zZyhkZXNjLT5hcmNoLnZlY3RvciwgTlVMTCwgJmlvbW11LT5tc2kubXNnKTsNCisgICAg
aW9tbXUtPm1zaS5tc2cuZGVzdDMyID0gZGVzdDsNCisNCisgICAgY3RybC5kZXN0X21vZGUgPSBN
QVNLX0VYVFIoaW9tbXUtPm1zaS5tc2cuYWRkcmVzc19sbywNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTVNJX0FERFJfREVTVE1PREVfTUFTSyk7DQorICAgIGN0cmwuaW50X3R5cGUg
PSBNQVNLX0VYVFIoaW9tbXUtPm1zaS5tc2cuZGF0YSwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBNU0lfREFUQV9ERUxJVkVSWV9NT0RFX01BU0spOw0KKyAgICBjdHJsLnZlY3RvciA9
IGRlc2MtPmFyY2gudmVjdG9yOw0KKyAgICBjdHJsLmRlc3RfbG8gPSBkZXN0Ow0KKyAgICBjdHJs
LmRlc3RfaGkgPSBkZXN0ID4+IDI0Ow0KKw0KKyAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUt
PmxvY2ssIGZsYWdzKTsNCisgICAgd3JpdGVxKGN0cmwucmF3LCBpb21tdS0+bW1pb19iYXNlICsg
SU9NTVVfWFRfSU5UX0NUUkxfTU1JT19PRkZTRVQpOw0KKyAgICB3cml0ZXEoY3RybC5yYXcsIGlv
bW11LT5tbWlvX2Jhc2UgKyBJT01NVV9YVF9QUFJfSU5UX0NUUkxfTU1JT19PRkZTRVQpOw0KKyAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0KK30NCisNCitz
dGF0aWMgaHdfaXJxX2NvbnRyb2xsZXIgaW9tbXVfeDJhcGljX3R5cGUgPSB7DQorICAgIC50eXBl
bmFtZSAgICAgPSAiSU9NTVUteDJBUElDIiwNCisgICAgLnN0YXJ0dXAgICAgICA9IGlycV9zdGFy
dHVwX25vbmUsDQorICAgIC5zaHV0ZG93biAgICAgPSBpcnFfc2h1dGRvd25fbm9uZSwNCisgICAg
LmVuYWJsZSAgICAgICA9IGlycV9lbmFibGVfbm9uZSwNCisgICAgLmRpc2FibGUgICAgICA9IGly
cV9kaXNhYmxlX25vbmUsDQorICAgIC5hY2sgICAgICAgICAgPSBhY2tfbm9ubWFza2FibGVfbXNp
X2lycSwNCisgICAgLmVuZCAgICAgICAgICA9IGVuZF9ub25tYXNrYWJsZV9tc2lfaXJxLA0KKyAg
ICAuc2V0X2FmZmluaXR5ID0gc2V0X3gyYXBpY19hZmZpbml0eSwNCit9Ow0KKw0KICBzdGF0aWMg
dm9pZCBwYXJzZV9ldmVudF9sb2dfZW50cnkoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsIHUzMiBl
bnRyeVtdKQ0KICB7DQogICAgICB1MTYgZG9tYWluX2lkLCBkZXZpY2VfaWQsIGZsYWdzOw0KQEAg
LTcyNiw4ICs3NjQsNiBAQCBzdGF0aWMgdm9pZCBpb21tdV9pbnRlcnJ1cHRfaGFuZGxlcihpbnQN
CiAgc3RhdGljIGJvb2xfdCBfX2luaXQgc2V0X2lvbW11X2ludGVycnVwdF9oYW5kbGVyKHN0cnVj
dCBhbWRfaW9tbXUgKmlvbW11KQ0KICB7DQogICAgICBpbnQgaXJxLCByZXQ7DQotICAgIGh3X2ly
cV9jb250cm9sbGVyICpoYW5kbGVyOw0KLSAgICB1MTYgY29udHJvbDsNCiAgDQogICAgICBpcnEg
PSBjcmVhdGVfaXJxKE5VTUFfTk9fTk9ERSk7DQogICAgICBpZiAoIGlycSA8PSAwICkNCkBAIC03
NDcsMTkgKzc4Myw0MiBAQCBzdGF0aWMgYm9vbF90IF9faW5pdCBzZXRfaW9tbXVfaW50ZXJydXB0
DQogICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TTE9UKGlvbW11LT5iZGYpLCBQQ0lfRlVO
Qyhpb21tdS0+YmRmKSk7DQogICAgICAgICAgcmV0dXJuIDA7DQogICAgICB9DQotICAgIGNvbnRy
b2wgPSBwY2lfY29uZl9yZWFkMTYoUENJX1NCREYyKGlvbW11LT5zZWcsIGlvbW11LT5iZGYpLA0K
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11LT5tc2kubXNpX2F0dHJpYi5wb3Mg
KyBQQ0lfTVNJX0ZMQUdTKTsNCi0gICAgaW9tbXUtPm1zaS5tc2kubnZlYyA9IDE7DQotICAgIGlm
ICggaXNfbWFza19iaXRfc3VwcG9ydChjb250cm9sKSApDQotICAgIHsNCi0gICAgICAgIGlvbW11
LT5tc2kubXNpX2F0dHJpYi5tYXNrYml0ID0gMTsNCi0gICAgICAgIGlvbW11LT5tc2kubXNpLm1w
b3MgPSBtc2lfbWFza19iaXRzX3JlZyhpb21tdS0+bXNpLm1zaV9hdHRyaWIucG9zLA0KLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzXzY0Yml0X2FkZHJl
c3MoY29udHJvbCkpOw0KLSAgICAgICAgaGFuZGxlciA9ICZpb21tdV9tYXNrYWJsZV9tc2lfdHlw
ZTsNCisNCisgICAgaWYgKCBpb21tdS0+Y3RybC5pbnRfY2FwX3h0X2VuICkNCisgICAgew0KKyAg
ICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsNCisNCisgICAg
ICAgIGlvbW11LT5tc2kubXNpX2F0dHJpYi5wb3MgPSBNU0lfVFlQRV9JT01NVTsNCisgICAgICAg
IGlvbW11LT5tc2kubXNpX2F0dHJpYi5tYXNrYml0ID0gMDsNCisgICAgICAgIGlvbW11LT5tc2ku
bXNpX2F0dHJpYi5pc182NCA9IDE7DQorDQorICAgICAgICBkZXNjLT5tc2lfZGVzYyA9ICZpb21t
dS0+bXNpOw0KKyAgICAgICAgZGVzYy0+aGFuZGxlciA9ICZpb21tdV94MmFwaWNfdHlwZTsNCisN
CisgICAgICAgIHJldCA9IDA7DQogICAgICB9DQogICAgICBlbHNlDQotICAgICAgICBoYW5kbGVy
ID0gJmlvbW11X21zaV90eXBlOw0KLSAgICByZXQgPSBfX3NldHVwX21zaV9pcnEoaXJxX3RvX2Rl
c2MoaXJxKSwgJmlvbW11LT5tc2ksIGhhbmRsZXIpOw0KKyAgICB7DQorICAgICAgICBod19pcnFf
Y29udHJvbGxlciAqaGFuZGxlcjsNCisgICAgICAgIHUxNiBjb250cm9sOw0KKw0KKyAgICAgICAg
Y29udHJvbCA9IHBjaV9jb25mX3JlYWQxNihQQ0lfU0JERjIoaW9tbXUtPnNlZywgaW9tbXUtPmJk
ZiksDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11LT5tc2kubXNpX2F0
dHJpYi5wb3MgKyBQQ0lfTVNJX0ZMQUdTKTsNCisNCisgICAgICAgIGlvbW11LT5tc2kubXNpLm52
ZWMgPSAxOw0KKyAgICAgICAgaWYgKCBpc19tYXNrX2JpdF9zdXBwb3J0KGNvbnRyb2wpICkNCisg
ICAgICAgIHsNCisgICAgICAgICAgICBpb21tdS0+bXNpLm1zaV9hdHRyaWIubWFza2JpdCA9IDE7
DQorICAgICAgICAgICAgaW9tbXUtPm1zaS5tc2kubXBvcyA9IG1zaV9tYXNrX2JpdHNfcmVnKGlv
bW11LT5tc2kubXNpX2F0dHJpYi5wb3MsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlzXzY0Yml0X2FkZHJlc3MoY29udHJvbCkpOw0KKyAgICAg
ICAgICAgIGhhbmRsZXIgPSAmaW9tbXVfbWFza2FibGVfbXNpX3R5cGU7DQorICAgICAgICB9DQor
ICAgICAgICBlbHNlDQorICAgICAgICAgICAgaGFuZGxlciA9ICZpb21tdV9tc2lfdHlwZTsNCisN
CisgICAgICAgIHJldCA9IF9fc2V0dXBfbXNpX2lycShpcnFfdG9fZGVzYyhpcnEpLCAmaW9tbXUt
Pm1zaSwgaGFuZGxlcik7DQorICAgIH0NCisNCiAgICAgIGlmICggIXJldCApDQogICAgICAgICAg
cmV0ID0gcmVxdWVzdF9pcnEoaXJxLCAwLCBpb21tdV9pbnRlcnJ1cHRfaGFuZGxlciwgImFtZF9p
b21tdSIsIGlvbW11KTsNCiAgICAgIGlmICggcmV0ICkNCkBAIC04MzcsOCArODk2LDE5IEBAIHN0
YXRpYyB2b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lvbW0NCiAgICAgICAgICBzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNpLmlycSk7DQogIA0KICAgICAg
ICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQotICAgICAgICBzZXRfbXNpX2FmZmluaXR5KGRl
c2MsIE5VTEwpOw0KLSAgICAgICAgc3Bpbl91bmxvY2soJmRlc2MtPmxvY2spOw0KKw0KKyAgICAg
ICAgaWYgKCBpb21tdS0+Y3RybC5pbnRfY2FwX3h0X2VuICkNCisgICAgICAgIHsNCisgICAgICAg
ICAgICBzZXRfeDJhcGljX2FmZmluaXR5KGRlc2MsIE5VTEwpOw0KKyAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZkZXNjLT5sb2NrKTsNCisgICAgICAgIH0NCisgICAgICAgIGVsc2UNCisgICAgICAg
IHsNCisgICAgICAgICAgICBzZXRfbXNpX2FmZmluaXR5KGRlc2MsIE5VTEwpOw0KKyAgICAgICAg
ICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCisNCisgICAgICAgICAgICBhbWRfaW9tbXVf
bXNpX2VuYWJsZShpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsNCisgICAgICAgIH0NCiAg
ICAgIH0NCiAgDQogICAgICBhbWRfaW9tbXVfbXNpX2VuYWJsZShpb21tdSwgSU9NTVVfQ09OVFJP
TF9FTkFCTEVEKTsNCkBAIC04NzgsNyArOTQ4LDkgQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9pb21t
dShzdHJ1Y3QgYW1kX2lvbQ0KICAgICAgICAgIHJldHVybjsNCiAgICAgIH0NCiAgDQotICAgIGFt
ZF9pb21tdV9tc2lfZW5hYmxlKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsNCisgICAg
aWYgKCAhaW9tbXUtPmN0cmwuaW50X2NhcF94dF9lbiApDQorICAgICAgICBhbWRfaW9tbXVfbXNp
X2VuYWJsZShpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7DQorDQogICAgICBzZXRfaW9t
bXVfY29tbWFuZF9idWZmZXJfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7
DQogICAgICBzZXRfaW9tbXVfZXZlbnRfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xf
RElTQUJMRUQpOw0KICANCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9t
bXUtZGVmcy5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRl
ZnMuaA0KQEAgLTQxNiw2ICs0MTYsMjUgQEAgdW5pb24gYW1kX2lvbW11X2V4dF9mZWF0dXJlcyB7
DQogICAgICB9IGZsZHM7DQogIH07DQogIA0KKy8qIHgyQVBJQyBDb250cm9sIFJlZ2lzdGVycyAq
Lw0KKyNkZWZpbmUgSU9NTVVfWFRfSU5UX0NUUkxfTU1JT19PRkZTRVQJCTB4MDE3MA0KKyNkZWZp
bmUgSU9NTVVfWFRfUFBSX0lOVF9DVFJMX01NSU9fT0ZGU0VUCTB4MDE3OA0KKyNkZWZpbmUgSU9N
TVVfWFRfR0FfSU5UX0NUUkxfTU1JT19PRkZTRVQJMHgwMTgwDQorDQordW5pb24gYW1kX2lvbW11
X3gyYXBpY19jb250cm9sIHsNCisgICAgdWludDY0X3QgcmF3Ow0KKyAgICBzdHJ1Y3Qgew0KKyAg
ICAgICAgdW5zaWduZWQgaW50IDoyOw0KKyAgICAgICAgdW5zaWduZWQgaW50IGRlc3RfbW9kZTox
Ow0KKyAgICAgICAgdW5zaWduZWQgaW50IDo1Ow0KKyAgICAgICAgdW5zaWduZWQgaW50IGRlc3Rf
bG86MjQ7DQorICAgICAgICB1bnNpZ25lZCBpbnQgdmVjdG9yOjg7DQorICAgICAgICB1bnNpZ25l
ZCBpbnQgaW50X3R5cGU6MTsgLyogRE0gaW4gSU9NTVUgc3BlYyAzLjA0ICovDQorICAgICAgICB1
bnNpZ25lZCBpbnQgOjE1Ow0KKyAgICAgICAgdW5zaWduZWQgaW50IGRlc3RfaGk6ODsNCisgICAg
fTsNCit9Ow0KKw0KICAvKiBTdGF0dXMgUmVnaXN0ZXIqLw0KICAjZGVmaW5lIElPTU1VX1NUQVRV
U19NTUlPX09GRlNFVAkJMHgyMDIwDQogICNkZWZpbmUgSU9NTVVfU1RBVFVTX0VWRU5UX09WRVJG
TE9XX01BU0sJMHgwMDAwMDAwMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
