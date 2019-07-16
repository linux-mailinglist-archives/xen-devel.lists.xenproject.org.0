Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBF6A82A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 14:04:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnM93-0007bx-SC; Tue, 16 Jul 2019 12:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K2ev=VN=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnM91-0007bq-Kl
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 12:01:19 +0000
X-Inumbo-ID: 6a8ea90e-a7c1-11e9-8d66-a3d60b171205
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.90]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a8ea90e-a7c1-11e9-8d66-a3d60b171205;
 Tue, 16 Jul 2019 12:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgodckOPJ5In/3ewN/YvOYy+huDpemvLhNy+FaO4b/ac5+GBDbpg5IoeGuJeaFbF84ILSFX/Wxmw/nhDsg9x6WEdEAXTdhUuHZU/509FTuKYO3RDVSdirYcnN44RuVy47WY16c6SYjEKKj2xSdsL2rOmrfOCIaGk3dCSJggiolGsBDtVI4ewR4LQYAirE9IC52bVsglhowTs7bGQDnn1+MX909sBWQVoA8PuQBhceGuGtRPGuCykdYiP6/ra9UbZoQfABPMKqAFd2w/bU34GB2eDOqi/B3oYQ9Mi89L1JEhk4NwZlAmIPfw+hC5EthwS/7jpc84WHS1qwi/B5QRIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT4pUL7Op8cau8E5xnSogVuSDk1SIsK4jUVnbro1BbE=;
 b=oECg7uBJ5b87OoE+iqoEseiCne+nXFCs+Nrj3C2qZBenz97LK7WjdesypyI2sH3RCJ+tcqkodrBH9ajVbKdt2P57pL5ZGp+EmayHwJGsJ9hkXan+s+zQSO4d4kMQrcblROJJaT/TV9D927G8rNWlwIw6kYS/SOWC31ksPKAGSbBK5ybclBLTIfeTEBLg6YrT4ncJuCPXhqIENiaitIraRXL8iz+NCSPzIjNGED24Zc1xlC2IYMldDz/jocKF1htWCi3CvDdxQZD3nQTT/UoaAxWcsW9lBapb6SbngQDUruc60CqmLLyOKAKlZ4SC46fq4aiCVtICAAkKnWMuRvFmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT4pUL7Op8cau8E5xnSogVuSDk1SIsK4jUVnbro1BbE=;
 b=HVknhnVXyW3QR+VuhjJLvv9tJxY5z1SWIsoQQKHLWUMilcZK0b3bXfuNV+FU+bW28JbFPLI7sTQxlmTTBabevPHpKSR+Ie2NGKS9rR+l93RqiL2MeUO0GG//f1datCteGvBl9AIRT+23nzJTMx6AhiVG9wSjqXP9K/hNtcnIicI=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3552.eurprd02.prod.outlook.com (52.134.19.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 12:01:15 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 12:01:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/2] passthrough/amd: Clean iommu_hap_pt_share enabled
 code
Thread-Index: AQHVO84r6T9zTbFQDUyTB09YmF8j8w==
Date: Tue, 16 Jul 2019 12:01:15 +0000
Message-ID: <20190716120056.1723-2-aisaila@bitdefender.com>
References: <20190716120056.1723-1-aisaila@bitdefender.com>
In-Reply-To: <20190716120056.1723-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cec6edf4-4de1-42d5-ea64-08d709e54df0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3552; 
x-ms-traffictypediagnostic: VI1PR0202MB3552:|VI1PR0202MB3552:
x-microsoft-antispam-prvs: <VI1PR0202MB3552AEFE8F6AE8857EED3BF4ABCE0@VI1PR0202MB3552.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(7736002)(66946007)(66446008)(64756008)(66556008)(66476007)(14454004)(76176011)(486006)(50226002)(6506007)(5660300002)(8676002)(102836004)(386003)(1076003)(2501003)(81166006)(5640700003)(68736007)(8936002)(52116002)(81156014)(66066001)(6436002)(478600001)(6512007)(99286004)(446003)(316002)(6116002)(3846002)(476003)(25786009)(54906003)(2616005)(86362001)(11346002)(6486002)(26005)(6916009)(2351001)(2906002)(36756003)(4326008)(186003)(107886003)(14444005)(53936002)(305945005)(256004)(71190400001)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3552;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YQFIvYz2clx7r3N2s6yZVrn3claCtAGdvZvCxApSg31JuvzRE8dMUkebBAVA6gusiTukCfhOzGZTuH4TroKvPN0xhcpKKESfayzNf+hKW6YxMjG2OY9wYhx4px4agux8GnjFKMjLk2Kw6LC12eTdmzE4sPh9TthqT/55UQWGDPhReOX387wanLrSnI1EgTr81Cd3qTlQV0mkkHtV32AMd9H00TcHJZp0cb1aB3q99Em2B9FrkY2mYhv3kAWhHs0pgcaVRyh1AMc4K1G0uFcIG7FAq2c3ZTvZaeXnrYRsH8SEVQ9fIr+3Bdgt4UW0+tsr8h7QjA00iCGKVPQ3ILZ5xjYlJ5DWfLRIkaKgQB0mJB/GoXh88+ttreIRy2BxQOIlBKe/xGw2U5Wi3VVLGK1DfpO7X/u8o0Bz4C+funJNb8k=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec6edf4-4de1-42d5-ea64-08d709e54df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 12:01:15.8001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3552
Subject: [Xen-devel] [PATCH v3 2/2] passthrough/amd: Clean
 iommu_hap_pt_share enabled code
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
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhpcyBtb21lbnQgSU9NTVUgcHQgc2hhcmluZyBpcyBkaXNhYmxlZCBieSBjb21taXQgWzFd
LgoKVGhpcyBwYXRjaCBjbGVhbnMgdGhlIHVucmVhY2hhYmxlIGNvZGUgZ2FyZGVkIGJ5IGlvbW11
X2hhcF9wdF9zaGFyZS4KClsxXSBjMmJhM2RiMzFlZjJkOWYxZTQwZTdiNmMxNmNmM2JlM2Q2NzFk
NTU1CgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMgICAgICAg
fCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNp
X2FtZF9pb21tdS5jICAgfCAgNCAtLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQt
aW9tbXUtcHJvdG8uaCB8ICAzIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDM1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwppbmRleCBjYmYwMGU5ZTcyLi45
MGNjNzA3NWMyIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
bWFwLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCkBAIC0z
NjQsOSArMzY0LDYgQEAgaW50IGFtZF9pb21tdV9tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBk
Zm5fdCBkZm4sIG1mbl90IG1mbiwKICAgICBpbnQgcmM7CiAgICAgdW5zaWduZWQgbG9uZyBwdF9t
Zm5bN107CiAKLSAgICBpZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQotICAgICAgICByZXR1cm4g
MDsKLQogICAgIG1lbXNldChwdF9tZm4sIDAsIHNpemVvZihwdF9tZm4pKTsKIAogICAgIHNwaW5f
bG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsKQEAgLTQyMCw5ICs0MTcsNiBAQCBpbnQgYW1k
X2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLAogICAgIHVuc2ln
bmVkIGxvbmcgcHRfbWZuWzddOwogICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lv
bW11KGQpOwogCi0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKLSAgICAgICAgcmV0dXJu
IDA7Ci0KICAgICBtZW1zZXQocHRfbWZuLCAwLCBzaXplb2YocHRfbWZuKSk7CiAKICAgICBzcGlu
X2xvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7CkBAIC01NTgsMjggKzU1Miw2IEBAIGludCBh
bWRfaW9tbXVfcmVzZXJ2ZV9kb21haW5fdW5pdHlfbWFwKHN0cnVjdCBkb21haW4gKmRvbWFpbiwK
ICAgICByZXR1cm4gcnQ7CiB9CiAKLS8qIFNoYXJlIHAybSB0YWJsZSB3aXRoIGlvbW11LiAqLwot
dm9pZCBhbWRfaW9tbXVfc2hhcmVfcDJtKHN0cnVjdCBkb21haW4gKmQpCi17Ci0gICAgc3RydWN0
IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Ci0gICAgc3RydWN0IHBhZ2VfaW5mbyAq
cDJtX3RhYmxlOwotICAgIG1mbl90IHBnZF9tZm47Ci0KLSAgICBwZ2RfbWZuID0gcGFnZXRhYmxl
X2dldF9tZm4ocDJtX2dldF9wYWdldGFibGUocDJtX2dldF9ob3N0cDJtKGQpKSk7Ci0gICAgcDJt
X3RhYmxlID0gbWZuX3RvX3BhZ2UocGdkX21mbik7Ci0KLSAgICBpZiAoIGhkLT5hcmNoLnJvb3Rf
dGFibGUgIT0gcDJtX3RhYmxlICkKLSAgICB7Ci0gICAgICAgIGZyZWVfYW1kX2lvbW11X3BndGFi
bGUoaGQtPmFyY2gucm9vdF90YWJsZSk7Ci0gICAgICAgIGhkLT5hcmNoLnJvb3RfdGFibGUgPSBw
Mm1fdGFibGU7Ci0KLSAgICAgICAgLyogV2hlbiBzaGFyaW5nIHAybSB3aXRoIGlvbW11LCBwYWdp
bmcgbW9kZSA9IDQgKi8KLSAgICAgICAgaGQtPmFyY2gucGFnaW5nX21vZGUgPSA0OwotICAgICAg
ICBBTURfSU9NTVVfREVCVUcoIlNoYXJlIHAybSB0YWJsZSB3aXRoIGlvbW11OiBwMm0gdGFibGUg
PSAlI2x4XG4iLAotICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gocGdkX21mbikpOwotICAg
IH0KLX0KLQogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCmluZGV4IDRhZmJjZDE2MDkuLmJlMDc2
MjEwYjYgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lv
bW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwpA
QCAtMzk2LDkgKzM5Niw2IEBAIHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVfaW9tbXVfcGFnZV90YWJs
ZXMoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRv
bV9pb21tdShkKTsKIAotICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApCi0gICAgICAgIHJl
dHVybjsKLQogICAgIHNwaW5fbG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsKICAgICBpZiAo
IGhkLT5hcmNoLnJvb3RfdGFibGUgKQogICAgIHsKQEAgLTU2Niw3ICs1NjMsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGlvbW11X29wcyBfX2luaXRjb25zdHJlbCBfaW9tbXVfb3BzID0gewogICAg
IC5zZXR1cF9ocGV0X21zaSA9IGFtZF9zZXR1cF9ocGV0X21zaSwKICAgICAuc3VzcGVuZCA9IGFt
ZF9pb21tdV9zdXNwZW5kLAogICAgIC5yZXN1bWUgPSBhbWRfaW9tbXVfcmVzdW1lLAotICAgIC5z
aGFyZV9wMm0gPSBhbWRfaW9tbXVfc2hhcmVfcDJtLAogICAgIC5jcmFzaF9zaHV0ZG93biA9IGFt
ZF9pb21tdV9jcmFzaF9zaHV0ZG93biwKICAgICAuZHVtcF9wMm1fdGFibGUgPSBhbWRfZHVtcF9w
Mm1fdGFibGUsCiB9OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2Ft
ZC1pb21tdS1wcm90by5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1w
cm90by5oCmluZGV4IGUwZDVkMjM5NzguLmI4MzJmNTY0YTcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaAorKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgKQEAgLTY2LDkgKzY2LDYgQEAgaW50IF9f
bXVzdF9jaGVjayBhbWRfaW9tbXVfZmx1c2hfaW90bGJfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCwg
ZGZuX3QgZGZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzKTsKIGludCBfX211c3RfY2hlY2sgYW1kX2lvbW11X2Zs
dXNoX2lvdGxiX2FsbChzdHJ1Y3QgZG9tYWluICpkKTsKIAotLyogU2hhcmUgcDJtIHRhYmxlIHdp
dGggaW9tbXUgKi8KLXZvaWQgYW1kX2lvbW11X3NoYXJlX3AybShzdHJ1Y3QgZG9tYWluICpkKTsK
LQogLyogZGV2aWNlIHRhYmxlIGZ1bmN0aW9ucyAqLwogaW50IGdldF9kbWFfcmVxdWVzdG9yX2lk
KHVpbnQxNl90IHNlZywgdWludDE2X3QgYmRmKTsKIHZvaWQgYW1kX2lvbW11X3NldF9pbnRyZW1h
cF90YWJsZShzdHJ1Y3QgYW1kX2lvbW11X2R0ZSAqZHRlLAotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
