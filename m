Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE1CEEA0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 23:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHarB-0007Dq-IN; Mon, 07 Oct 2019 21:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xf97=YA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHarA-0007Dl-4m
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 21:47:52 +0000
X-Inumbo-ID: 1b3fef44-e94c-11e9-80e3-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b3fef44-e94c-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZuJN+lhg6Jb/8BlKHWvz3vntJM3ORlzwoKlFTRvR/o=;
 b=J8v3EuOK5dwCWE81tblz7sONqgRe2gcjIlUUqlsULC5iJ28yIRxnyNycYYHjmLLMb/U7L/oJIbK/mwqgPkhnJD6mSX5jG+WxXa85M1n+JaX3mWq3WNp1np1Ch4LvvpvBwXO5kIWPh8jE//GtbqKcj8/0LXdnZLOZPmWlq40l5Q0=
Received: from HE1PR0802CA0013.eurprd08.prod.outlook.com (2603:10a6:3:bd::23)
 by VI1PR0802MB2592.eurprd08.prod.outlook.com (2603:10a6:800:ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Mon, 7 Oct
 2019 21:47:46 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by HE1PR0802CA0013.outlook.office365.com
 (2603:10a6:3:bd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Mon, 7 Oct 2019 21:47:46 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 7 Oct 2019 21:47:45 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 07 Oct 2019 21:47:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8dce1c6534f2694
X-CR-MTA-TID: 64aa7808
Received: from df1421a2a628.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B512EBE-DC69-4566-B587-E04C4E2D7EDF.1; 
 Mon, 07 Oct 2019 21:47:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df1421a2a628.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Oct 2019 21:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtYW4CfITW8DKfdCEp1+j1urkblTSgzBQfHJtyUn5vrGdHnjwwIG6kTtT0k617SaXVoiLbOyy076miU7lg74n4el3AwduYEj3wfx9JhV9UevtEn9Net3qFbKvuPcJIlYTaR+9L2za6UqtMvMl3IvF21eVDFHLA0K4ZXVLg585uNARP5udXlvYzTqA73ll32xE6IKDO1y6XOU/TdVWvMuobrq8QhaAGKpOTV1PtGgt9WnTWrVHliMDSyOEMXix+S7CAnYbS9U4kItJcXfjEcFtb82dphNu2Pdytez6pFniqzPGQAny+l5CZmP4tEzgMF9haajvTxiEJYWHnNmBEueDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZuJN+lhg6Jb/8BlKHWvz3vntJM3ORlzwoKlFTRvR/o=;
 b=Cemi1yv4I6zptq3udVeasgRh4Rl17ukYkbYp26ZPVyNmMOKdx00AaQWRssbplIgWIJff2Ury1UtDMGCqd89d6cJZdPfnE3aOXOYlQ7mgJvm0uOTfJ4r94rD0CXJk+inwwuPixvBn2bOjrXD88sZ9E5ZmrNai+RGYsEvphhDkE1bepMiW9mSvU7rvW5AgdsY7SE3YeKCcLauqRS9Gsmj4JfIifIp59C4uaBm1IDBhsNDe+9ftlbc3kMLm5XSZuTR4rjF68rD2kaFyiShv6LAXzwbSQf2nLAGsUKF/RwY+B3sU+HZNSRq510NHjhnpKLlyFzzPHjp0kpcVC4c3Z1ldeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZuJN+lhg6Jb/8BlKHWvz3vntJM3ORlzwoKlFTRvR/o=;
 b=J8v3EuOK5dwCWE81tblz7sONqgRe2gcjIlUUqlsULC5iJ28yIRxnyNycYYHjmLLMb/U7L/oJIbK/mwqgPkhnJD6mSX5jG+WxXa85M1n+JaX3mWq3WNp1np1Ch4LvvpvBwXO5kIWPh8jE//GtbqKcj8/0LXdnZLOZPmWlq40l5Q0=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4394.eurprd08.prod.outlook.com (20.179.44.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 21:47:35 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 21:47:35 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH for-4.13] xen/arm: fix duplicate memory node in DT
Thread-Index: AQHVfVZlYdL+hbUaoka5rKOiNX8fgqdPtvmA
Date: Mon, 7 Oct 2019 21:47:35 +0000
Message-ID: <9d281a7c-a9b9-f710-405f-df8e10657f30@arm.com>
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
 <a65639bc-cae9-85d2-f33c-40dd8e24f6b7@arm.com>
 <alpine.DEB.2.21.1910071426040.13684@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910071426040.13684@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::26) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 951e62a0-0e81-4c55-1dde-08d74b6ffce8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4394:|VI1PR0802MB2592:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB259202C76420ACEF768BC342809B0@VI1PR0802MB2592.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01834E39B7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(199004)(189003)(8676002)(8936002)(6116002)(3846002)(2906002)(25786009)(305945005)(4326008)(81166006)(81156014)(7736002)(476003)(2616005)(478600001)(186003)(256004)(486006)(11346002)(446003)(14444005)(44832011)(6246003)(86362001)(6916009)(66446008)(64756008)(66556008)(66476007)(26005)(31696002)(66066001)(14454004)(76176011)(6436002)(229853002)(52116002)(66946007)(5660300002)(99286004)(6486002)(102836004)(36756003)(53546011)(6506007)(386003)(6512007)(316002)(71200400001)(71190400001)(54906003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4394;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KLvtK5dimBt+OOf5KYTkmUjeSaJeBLkFCmoxW9o9JeTySa57JvLggHCr1LUQl3laPRd+HQsO2k/gh3adsYI8R9nzS9Y6PzyM0qpLIPekW/BuOskK0+ljhGqFCo6yfbZgYnehXElVeJdlIi24p0gFiN8HeYC1iDJI5r6rF2+2dK1sFZwx0Rf3aMQCX0dLJUyEUGFYtzk5wKlTbbVGgJshEYX84Hr+KFkFHVrU1CmThgrmTgUVtgFvvQRUbRcvfH0fYneuqGLqEk/D7cttyTnvBly6ZdBxuH3uzM/nBLZ9HV5nAMUlX9+/ach2AOxcuY+CAkVkIdZLdJO5bA87vkiQyWkgphqQf9GeHFFRmLQ/t1bzg9keQR9+Knt7/bURBhJvV9dNU/BG1YHgENMFPSn/INmEIAYbApx0EMv+/gAExlQ=
x-ms-exchange-transport-forked: True
Content-ID: <B70F53F257BDC245BBE71ACAFE893F33@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4394
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(14454004)(81166006)(8676002)(81156014)(36756003)(54906003)(47776003)(66066001)(26826003)(50466002)(316002)(8936002)(5660300002)(25786009)(305945005)(7736002)(76176011)(31686004)(229853002)(6116002)(476003)(6506007)(3846002)(76130400001)(126002)(53546011)(22756006)(336012)(386003)(356004)(478600001)(11346002)(86362001)(23676004)(70586007)(107886003)(70206006)(6246003)(2486003)(102836004)(99286004)(186003)(6486002)(6862004)(446003)(4326008)(63350400001)(2906002)(31696002)(486006)(26005)(436003)(2616005)(6512007)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2592;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 714e27b9-b48b-4cbd-b7d1-08d74b6ff723
NoDisclaimer: True
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEhkEpHfgToT1RRVBgTtwQC0BXga4Fr9/O0FFcCQRfGWYIrb1WRF9o1woEB0j4zC2Y0u46VaFgET+UL+RNh7MoR5yDQiWAdiSoJ1RXAbTExuLTBDTUTUg07OYdPsQBuM4QWr6I9hNgcQqAod2/DWnnQqoVVg1+aSae/nf0rsbLEZFdBwTmy6MKOFonQSVNwo9TiodlqnFua3RvGNbhHMcOTx5/KUGh8eKvC0M9nzhtCYcBruOF7TlOva4YU1mUFINl3gYCckmspdmuU1bRVX4SPu+3dPSw9Mg+hl1qbeECgGyHUo+y9XNU1icSY6/qqxc+ny3mShNIYGUJ/AEzHAX8tbjJIuBX8o3AOrNB7YnN9QOcNQtgUMFKl3M3uOnUG6mZj6Zk7KTULQEcGop/0LNSwiYwOkz2SwzhJF/9dUp8w=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 21:47:45.2247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951e62a0-0e81-4c55-1dde-08d74b6ffce8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2592
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDA3LzEwLzIwMTkgMjI6MzAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gTW9uLCA3IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAwNS8xMC8yMDE5
IDAwOjA5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gV2hlbiByZXNlcnZlZC1tZW1v
cnkgcmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkZXZpY2UgdHJlZSwgZG9tMA0KPj4+
IGlzIHN0YXJ0ZWQgd2l0aCBtdWx0aXBsZSBtZW1vcnkgbm9kZXMuIEVhY2ggbWVtb3J5IG5vZGUg
c2hvdWxkIGhhdmUgYQ0KPj4+IHVuaXF1ZSBuYW1lLCBidXQgdG9kYXkgdGhleSBhcmUgYWxsIGNh
bGxlZCAibWVtb3J5IiBsZWFkaW5nIHRvIExpbnV4DQo+Pj4gcHJpbnRpbmcgdGhlIGZvbGxvd2lu
ZyB3YXJuaW5nIGF0IGJvb3Q6DQo+Pj4NCj4+PiAgICAgT0Y6IER1cGxpY2F0ZSBuYW1lIGluIGJh
c2UsIHJlbmFtZWQgdG8gIm1lbW9yeSMxIg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUg
cHJvYmxlbSBieSBhcHBlbmRpbmcgYSAiQDx1bml0LWFkZHJlc3M+IiB0byB0aGUNCj4+PiBuYW1l
LCBhcyBwZXIgdGhlIERldmljZSBUcmVlIHNwZWNpZmljYXRpb24sIHdoZXJlIDx1bml0LWFkZHJl
c3M+IG1hdGNoZXMNCj4+PiB0aGUgYmFzZSBvZiBhZGRyZXNzIG9mIHRoZSBmaXJzdCByZWdpb24u
DQo+Pj4NCj4+PiBSZXBvcnRlZC1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90
eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQo+Pj4NCj4+PiAtLS0NCj4+Pg0KPj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMNCj4+PiBpbmRleCA5MjFiMDU0NTIwLi5hNGMwN2RiMzgzIDEwMDY0NA0K
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYw0KPj4+IEBAIC02NDYsMTYgKzY0NiwyMiBAQCBzdGF0aWMgaW50
IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4NCj4+PiAqZCwNCj4+
PiAgICAgICAgaW50IHJlcywgaTsNCj4+PiAgICAgICAgaW50IHJlZ19zaXplID0gYWRkcmNlbGxz
ICsgc2l6ZWNlbGxzOw0KPj4+ICAgICAgICBpbnQgbnJfY2VsbHMgPSByZWdfc2l6ZSAqIG1lbS0+
bnJfYmFua3M7DQo+Pj4gKyAgICAvKiBQbGFjZWhvbGRlciBmb3IgbWVtb3J5QCArIGEgMzItYml0
IG51bWJlciArIFwwICovDQo+Pj4gKyAgICBjaGFyIGJ1ZlsxOF07DQo+Pj4gICAgICAgIF9fYmUz
MiByZWdbTlJfTUVNX0JBTktTICogNCAvKiBXb3JzdCBjYXNlIGFkZHJjZWxscyArIHNpemVjZWxs
cyAqL107DQo+Pj4gICAgICAgIF9fYmUzMiAqY2VsbHM7DQo+Pj4gICAgICAgICAgQlVHX09OKG5y
X2NlbGxzID49IEFSUkFZX1NJWkUocmVnKSk7DQo+Pj4gKyAgICAvKiBOb3RoaW5nIHRvIGRvICov
DQo+Pg0KPj4gVGhpcyBhIGRlcGFydHVyZSBmcm9tIHRoZSBjdXJyZW50IHNvbHV0aW9uIHdoZXJl
IGEgbm9kZSB3aWxsIGJlIGNyZWF0ZWQgd2l0aA0KPj4gbm8gInJlZyIgcHJvcGVydHkuIEkgdGhp
bmsgdGhpcyBjaGFuZ2Ugb2YgYmVoYXZpb3Igc2hvdWxkIGF0IGxlYXN0IGJlDQo+PiBkZXNjcmli
ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlmIG5vdCBpbXBsZW1lbnRlZCBpbiBhIHNlcGFyYXRl
IHBhdGNoLiBCdXQuLi4NCj4+DQo+Pj4gKyAgICBpZiAoIG1lbS0+bnJfYmFua3MgPT0gMCApDQo+
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pg0KPj4gLi4uIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0
byBpZ25vcmUgaXQuIFRoZSBjYWxsZXIgbW9zdCBsaWtlbHkgbWVzc2VkIHVwIHRoZQ0KPj4gYmFu
a3MgYW5kIHdlIHNob3VsZCBpbnN0ZWFkIHJlcG9ydCBhbiBlcnJvci4NCj4gDQo+IEkgYWRtaXQg
aXQgd2Fzbid0IG15IGludGVudGlvbiB0byBjaGFuZ2UgdGhlIGN1cnJlbnQgYmVoYXZpb3IuIEFz
IEkgd2FzDQo+IGxvb2tpbmcgdGhyb3VnaCB0aGUgY29kZSBJIG5vdGljZWQgdGhhdCB3ZSBjYWxs
IG1ha2VfbWVtb3J5X25vZGUgZm9yDQo+IGJvdGggbm9ybWFsIG1lbW9yeSBhbmQgcmVzZXJ2ZWRf
bWVtb3J5LiBPZiBjb3Vyc2UsIHJlc2VydmVkX21lbW9yeSBjb3VsZA0KPiBoYXZlIG5vIGJhbmtz
LiBTbyBJIHRob3VnaHQgaXQgd291bGQgYmUgZ29vZCB0byBjaGVjayB3aGV0aGVyIHRoZXJlIGFy
ZQ0KPiBhbnkgYmFua3MgYmVmb3JlIGNvbnRpbnVpbmcgYmVjYXVzZSBub3cgd2UgYXJlIGdvaW5n
IHRvIGFjY2Vzcw0KPiBtZW0tPmJhbmtbMF0uc3RhcnQsIHdoaWNoIHdvdWxkIGJlIGEgbWlzdGFr
ZSBpZiB0aGVyZSBhcmUgbm8gYmFua3MuDQoNCk9rLCBzbyB0aGlzIG5vdCB0aGVvcml0aWNhbCBi
dWcgYXMgSSBmaXJzdCB0aG91Z2h0IGJ1dCBhIHJlYWwgYnVnIG9uIA0KcGxhdGZvcm0gd2hlcmUg
RFQgZG9lcyBub3QgaGF2ZSByZXNlcnZlZC1yZWdpb25zIG5vZGUuDQoNCkluIHRoaXMgY2FzZSwg
dGhpcyBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCBhcyB0aGlzIGlzIG5vdyAyIA0KZGlm
ZmVyZW50IGJ1Z3Mgc29sdmVkIGluIG9uZSBwYXRjaC4NCg0KPiANCj4gSW4gcmVnYXJkcyB0byB5
b3VyIGNvbW1lbnQgYWJvdXQgcmV0dXJuaW5nIGVycm9yLCB3ZSBjb3VsZCByZXR1cm4gRU5PRU5U
LA0KPiBob3dldmVyIHdlIHdvdWxkIGFsc28gaGF2ZSB0byBoYW5kbGUgRU5PRU5UIGVzcGVjaWFs
bHkgYXQgdGhlIGNhbGxlcg0KPiBzaWRlIChoYW5kbGVfbm9kZSkuIE9yIHdlIHdvdWxkIGhhdmUg
dG8gYWRkIGEgY2hlY2sgaWYgKCBtZW0tPm5yX2JhbmtzID4NCj4gMCkgdG8gYXZvaWQgY2FsbGlu
ZyBtYWtlX21lbW9yeV9ub2RlIHdoZW4gbnJfYmFua3MgaXMgemVyby4NCg0KSSB3b3VsZCBtdWNo
IHByZWZlciBpZiB3ZSBjaGVjayBtZW0tPm5yX2JhbmtzID4gMCBmb3IgcmVzZXJ2ZWQtcmVnaW9u
cyANCmJlZm9yZSBoYW5kLg0KDQpCb3RoIHdpbGwgbmVlZCBhICJGaXhlczoiIHRvIGtlZXAgdHJh
Y2sgb2YgdGhlIG9yaWdpbmFsIHBhdGNoLg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
