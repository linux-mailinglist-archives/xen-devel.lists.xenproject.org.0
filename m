Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25549D0315
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 23:52:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHxKd-0001jo-JM; Tue, 08 Oct 2019 21:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N428=YB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHxKb-0001jj-Qb
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 21:47:45 +0000
X-Inumbo-ID: 41a64cfe-ea15-11e9-80e3-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41a64cfe-ea15-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KprLqd0S/lLFtjIA8SgNilU/FPdmxQo0J7dus25eneI=;
 b=xTEvarC+DlqGvOkZb64mqm2j13/ToHU66mKxKFt7aWk77+AOv9vYFsF6XERk3ge2MZpIr/DYb7BsuTwz0AHlt9K2N0ZrS1ni8s/CBt8UQnDXRorICFXPWTgJBuwIYOaYq/EM5jvptY837TUN3CWMoHbSF1rV4StInjvFY2SQ6Mw=
Received: from VE1PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:803:104::38)
 by HE1PR0801MB1690.eurprd08.prod.outlook.com (2603:10a6:3:7f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 21:47:39 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VE1PR08CA0025.outlook.office365.com
 (2603:10a6:803:104::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 21:47:39 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 21:47:37 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 08 Oct 2019 21:47:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f94d77a4d9a596dd
X-CR-MTA-TID: 64aa7808
Received: from c11de77ce644.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DDC271C-1E22-43A0-83AE-A131E5C1C22A.1; 
 Tue, 08 Oct 2019 21:47:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c11de77ce644.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 08 Oct 2019 21:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSs4gy4zxQsmVlpiAaW5NzudcN/c62N0/92tY8FHmWvCdeEEfPOyyry66Vg3XMV8pFoGknBD8SmjPON76cVfUAXTNcDAbBKknQRYgYzOfLCk6m5RDpWI678tygtrg2HkdJPJzXZCnbpJ9cWCbrrM97d+AKeArgqox6HDZx7aU+wKpBgekUKf2c1dhIBORO8BqfH4aks3jeurrevW4zQ5sGsLorLXQ+I0oSbVAR1jxs5gGqf9JJe3jyCMK8rQnBLVh1/LrwhQ0jPSKmM2edFkq2vhTMjzCBLBRA7NuS+RZ0BmF4WMv6tCTUwXkmY4XbXcRauYpyOcW3UJDdDs7yV6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KprLqd0S/lLFtjIA8SgNilU/FPdmxQo0J7dus25eneI=;
 b=ApvMlDx2xH8qEeQPOra3Sd0F5p0v/AgkJXlMo1mj/109TfpxKFt53kq0MqCI4burDT4DKdsyHCQq32SgiZxoWkN1POHpYHRmSb0mefuBE0tlQdFslhMDzW6YG9Y8Ml0bDCO4/hYqPYp0dwn7RB3KQg4kbFT67Ey4fXeu9FA1AFjBuiiZAx3wC9+U1FrzCY98ymmP7VF4NGpmuZjhafMbHXui/orBFCerzJCRDmNy+qGM6f8AnBxet3ehHuOtq30K4rtDD1hteCWs7qjp4aYwsbG48MRVQMnvmpTrF0gukUl/4XmBXrjzlrIFMZhOLh42JDcik4lBo5TPbX2Wfd2EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KprLqd0S/lLFtjIA8SgNilU/FPdmxQo0J7dus25eneI=;
 b=xTEvarC+DlqGvOkZb64mqm2j13/ToHU66mKxKFt7aWk77+AOv9vYFsF6XERk3ge2MZpIr/DYb7BsuTwz0AHlt9K2N0ZrS1ni8s/CBt8UQnDXRorICFXPWTgJBuwIYOaYq/EM5jvptY837TUN3CWMoHbSF1rV4StInjvFY2SQ6Mw=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4522.eurprd08.prod.outlook.com (20.179.44.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 21:47:28 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 21:47:27 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 1/3] xen/arm: fix buf size in make_cpus_node
Thread-Index: AQHVfXXRNk9E99Hf7kidrU8cl9fL76dQqSwAgACXyYCAAAgQgA==
Date: Tue, 8 Oct 2019 21:47:27 +0000
Message-ID: <cdf96832-6a51-d44c-fd00-eba411f414c2@arm.com>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
 <20191008011501.21038-1-sstabellini@kernel.org>
 <06903f95-0135-c392-3e44-9a9928a3a6de@arm.com>
 <alpine.DEB.2.21.1910081413160.13684@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910081413160.13684@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ed67cb74-364e-4da2-f614-08d74c392287
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4522:|HE1PR0801MB1690:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1690AA57F517CC3DAA12CC54809A0@HE1PR0801MB1690.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(6486002)(66556008)(66476007)(54906003)(64756008)(76176011)(305945005)(7736002)(6506007)(4326008)(229853002)(6246003)(186003)(99286004)(66446008)(8936002)(66946007)(386003)(53546011)(81166006)(8676002)(102836004)(6916009)(81156014)(2906002)(26005)(6116002)(3846002)(6436002)(52116002)(31686004)(316002)(6512007)(44832011)(478600001)(71200400001)(86362001)(5660300002)(66066001)(71190400001)(31696002)(14454004)(476003)(25786009)(2616005)(11346002)(36756003)(446003)(256004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4522;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: yEFbTX5MTpMAfxo8vK98l+vKuuje/V/tj3p8gixQTMpcDgzrih3ZeMKYyPV4A+r2kUqFLzy0EaqH+sfSij1Upw/mOS8nY3+dDvn/g85uiRobxpzEKVh460LdCX/e4972MgheaF/3JNSMYWq3wkmTshRvbky3qLoOTioeMEsqhAoAWoUhBW+GzRA6VbjqXGI1lxjxHKotmpxoYRKU5OmIyOe3kCMGE+v/+KSDSN5ARKMaSfbPJfa1nuKglQQHaFAKHdf1jrENY2amTyYalFepP5SRL7kVASWBjS6IfE0S9N3gSQwER5WxWFYFY2eIY1fG4teWyylmCKWLJNqHhQLNOmFZkGy+offAf4qUQBHJKzmjObj83Ga0JtWeLMKkUsQhj/Amdb3KoGqdsNuiGV0qGqPd87u76reKyqubzza7mEQ=
x-ms-exchange-transport-forked: True
Content-ID: <EF7AA460CA5E1142B477930707B84D48@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4522
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(6512007)(186003)(76176011)(99286004)(23676004)(63350400001)(446003)(26005)(229853002)(11346002)(2616005)(486006)(25786009)(2486003)(7736002)(22756006)(102836004)(478600001)(54906003)(26826003)(76130400001)(4326008)(6246003)(70206006)(70586007)(305945005)(8936002)(31686004)(316002)(47776003)(53546011)(6506007)(386003)(81166006)(36906005)(5660300002)(8676002)(6862004)(50466002)(6116002)(3846002)(81156014)(107886003)(436003)(336012)(31696002)(14454004)(6486002)(126002)(36756003)(356004)(2906002)(86362001)(66066001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1690;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0245ffd1-ed4c-492b-2cf8-08d74c391cc0
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BJvlOTBO/wOZhUN79jcNcCqelmgLrZ4XXUs1iaOnj1drSvxor6fxaRx2MIf3dp6LG96uC7ELKKd2H3Th6bnsriQr7Nly+mgU5vdHPEWYtVj9S92o1lXjJWCskAsNu86y8YCcanVmAyXtCvfevvafIsEF7ppHcArXO2U0itgDjF8goCyaXtNMSnS4lt4kf7wZwm8wq2m45+MZozDOPBf1+TtPpEtLgEMLsNngbDkG/EoEA/UTi4OtigE8H36MGdujS4d6Y8nsd2sPTVjIy8NGUX505IfyIpiIPfP59r2mwrpNg1IZFfpgC6ePNeIrljKhAedTTCf/IszAPZvfpHQD52xdmCXVwqJXxt76roO4/7cI6xBnvcd9YR2NWvu1yiZLk9ChwHkcaYg0fIWtF0LVyCV8dQIysl+0lEdp4Mm6ZE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 21:47:37.1356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed67cb74-364e-4da2-f614-08d74c392287
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1690
Subject: Re: [Xen-devel] [PATCH v2 1/3] xen/arm: fix buf size in
 make_cpus_node
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KT24gMDgvMTAvMjAxOSAyMjoxOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBUdWUsIDggT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDEw
LzgvMTkgMjoxNCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IFRoZSBzaXplIG9m
IGJ1ZiBpcyBjYWxjdWxhdGVkIHdyb25nbHk6IHRoZSBudW1iZXIgaXMgNjRiaXQsIG5vdCAzMmJp
dC4NCj4+DQo+PiBXaGlsZSB0aGUgdmFyaWFibGUgbXBkaXJfYWZmIGlzIDY0LWJpdCwgd2Ugb25s
eSB3cml0ZSB0aGUgZmlyc3QgMzItYml0IGluIHRoZQ0KPj4gcHJvcGVydHkgcmVnICgjYWRkcmVz
cy1jZWxscyA9PSAxIGFuZCBmZHRfcHJvcGVydHlfY2VsbCgpKS4gU28gd2hhdCBuZWVkcyB0bw0K
Pj4gYmUgbW9kaWZpZWQgaXMgdGhlIGZvcm1hdCBoZXJlLg0KPj4NCj4+IEFsc28sIGxvb2tpbmcg
dGhlIENQVSBiaW5kaW5ncyAoc2VlDQo+PiBsaW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2NwdXMueWFtbCksIHRlY2huaWNhbGx5IG9ubHkgdGhlDQo+PiBiaXRzIFsy
MzowXSBvZiB0aGUgbXBpZHIgc2hvdWxkIGJlIHVzZWQuIFRoZSByZXN0IGlzIHplcm9lZC4NCj4+
DQo+PiBUaGlzIGlzIG9rIGJlY2F1c2UgdmNwdWlkX3RvX3ZhZmZpbml0eSgpIGlzIGFsd2F5cyBy
ZXR1cm5pbmcgYSB2YWx1ZSBmb2xsb3dpbmcNCj4+IHRoZSByZXF1aXJlbWVudHMgYWJvdmUuIEhv
d2V2ZXIsIGZvciBjb3JyZWN0bmVzcywgdGhpcyBtYXkgd2FudCB0byBiZSBmaXhlZC4NCj4gDQo+
IEl0IGxvb2tzIGxpa2UgaXQgd291bGQgYmUgYmVzdCB0byBjaGFuZ2UgbXBkaXJfYWZmIHRvIHVp
bnQzMl90IGFuZA0KPiBjaGFuZ2UgdmNwdWlkX3RvX3ZhZmZpbml0eSB0byByZXR1cm4gYSB1aW50
MzJfdC4NCg0KdmNwdWlkX3RvX3ZhZmZpbml0eSBpcyBtZWFudCB0byByZXR1cm4gdGhlIEFGRngg
Yml0cyBvZiB0aGUgTUlEUiAoc28gDQozMi1iaXQgb24gQXJtMzIgYW5kIDY0LWJpdCBvbiBBcm02
NCkuIFdlIGFyZSBvbmx5IHVzaW5nIEFGRjAgYW5kIEFGRjEsIA0Kc28gdGhlIHJlc3QgaXMgemVy
b2VkLiBCdXQgdGhpcyBkb2VzIG5vdCBtZWFuIHdlIHNob3VsZCBzd2l0Y2ggdG8gMzItYml0Lg0K
DQpJZiB3ZSB3YW50IHRvIGNoYW5nZSB0aGUgaW50ZXJmYWNlIHRoZW4sIGl0IHNob3VsZCBiZSBy
ZWdpc3Rlcl90IGFuZCBub3QgDQozMi1iaXQuDQoNCkhvd2V2ZXIsIEkgZGlkbid0IHN1Z2dlc3Qg
dG8gc3dpdGNoIHRvIDMyLWJpdCBidXQgdG8gdHJhbnNmZXIgdGhlIGJpdHMgDQpbMjM6MF0gdG8g
YSB2YXJpYWJsZSBhbmQgcG9zc2libHkgY2hlY2sgdGhhdCB0aGUgcmVzdCBpcyAwLg0KDQpNYXli
ZSBzb21ldGhpbmcgbGlrZToNCg0KdWludDMyX3QgcmVnOw0KDQpyZWcgPSBtcGlkcl9hZmYgJiBH
RU5NQVNLKDIzLCAwKTsNCi8qIFdlIG9ubHkgYXJlIGFibGUgdG8gZGVhbCB3aXRoIEFGRnswLCAx
LCAyfSBzdG9yZWQgaW4gYml0cyBbMjM6MF0gYXQgDQp0aGUgbW9tZW50ICovDQppZiAoIHJlZyAh
PSBtcGlkcl9hZmYgKQ0Kew0KICAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBoYW5kbGUg
TVBJRFIgQUZGSU5JVFkgMHglIlBSSXg2NCJcbiIsIA0KbXBpZHJfYWZmKTsNCiAgIHJldHVybiAt
RUlOVkFMOw0KfQ0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
