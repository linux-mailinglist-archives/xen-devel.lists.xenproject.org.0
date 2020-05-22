Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AA1DE357
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:38:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc47x-0005ym-2w; Fri, 22 May 2020 09:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aod8=7E=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jc47v-0005yh-4J
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:38:03 +0000
X-Inumbo-ID: edc5b072-9c0f-11ea-ae69-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edc5b072-9c0f-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzPfIXO3K/ScES5DMso5xkC2MD69PRxoFgTXLOdu9s4=;
 b=KhCCwgTngd2w27Y9jdnM8ksIiRseirOgTDXOcKbIQw3hnrSgdDnv9Ic7Bp0mpnf58kkVCz1BJYTWz6WxUzaYN3wnNcU4MN/xeYLueGwmG3Nz2kUr2TQJdKVR5tv4zxx+PpkwjWeO3sY+qfKEVq7GdJQldjnUTJyo+Ll/ZBKHDKc=
Received: from AM6P192CA0087.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::28)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.31; Fri, 22 May
 2020 09:37:59 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::6f) by AM6P192CA0087.outlook.office365.com
 (2603:10a6:209:8d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25 via Frontend
 Transport; Fri, 22 May 2020 09:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 09:37:59 +0000
Received: ("Tessian outbound 9eabd37e4fee:v57");
 Fri, 22 May 2020 09:37:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 94b1b538a5c58e36
X-CR-MTA-TID: 64aa7808
Received: from 73cced15552f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8455706F-7F8A-42C8-BEBF-6AC7D0768FA5.1; 
 Fri, 22 May 2020 09:37:53 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73cced15552f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 May 2020 09:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn+QhS4rNJ9hi4FEcBjRGy3XCYgJnQX+gJaEJK93/zWxSmuN7cncZ78AMkepXrO1zqFvOFtFGlSV+0JB1xf+8oiYZ7U4P9SvKzYu8w9mEipCtTsrxtrX0w54wAVV1E5ftxUBE11bC9msrACt11j3GKXxQcWFFqmm3i/7j15Kfro2T2O7wrPelOMl8e7KuvptxKGCMcScUF2Qm5RuauCfMb6O9el74/r+55U6Ek/4NCVX21IsDIIus6pjVtaHBdOB3jENX29b/XKtwkWwNtU/lthQJBGpQqEzCqttAfubyn8DxTIC6aiaWONnPkQF1QYmOmt8HwUyzp29KUxRs7N39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzPfIXO3K/ScES5DMso5xkC2MD69PRxoFgTXLOdu9s4=;
 b=IyhSeZRMM3D9q1dbdIFZGlRy3zJvE6Rb584bcsQ+A/gquNaYdqHLlzpctda2nL5bWQlLlQgNYgjLNsguvX0hdvMxw00gv9M9B0nJ/V0jBIAotCzA09V0KblhPpiiEI/ZbycVItXSQxxmWnyo3NGmafrycQY7/BPaya2+9/99OtZkSD0PdtqB+acKEjgTUZsWvOttBlxGn2wxMktRo17ffufE6djyrArpVmqec9BGWWfD2rH1W64AbivPxXfSGhkgWtVgnu0sOXRPQdI2mbr57YElcHs/KaLy7z1qxi/bzAFUjr82Uo6Z8bwWHSNxrgb0PH4LDFIokknSyLaSGAVMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzPfIXO3K/ScES5DMso5xkC2MD69PRxoFgTXLOdu9s4=;
 b=KhCCwgTngd2w27Y9jdnM8ksIiRseirOgTDXOcKbIQw3hnrSgdDnv9Ic7Bp0mpnf58kkVCz1BJYTWz6WxUzaYN3wnNcU4MN/xeYLueGwmG3Nz2kUr2TQJdKVR5tv4zxx+PpkwjWeO3sY+qfKEVq7GdJQldjnUTJyo+Ll/ZBKHDKc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3819.eurprd08.prod.outlook.com (2603:10a6:10:30::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Fri, 22 May
 2020 09:37:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 09:37:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Topic: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Index: AQHWIr9BT1TmXNUg30iaUVp4td7OCaiz5AWAgAAG4ICAAAjugA==
Date: Fri, 22 May 2020 09:37:51 +0000
Message-ID: <9FBA46AA-9727-4AA9-A23D-B72F5AE9C35C@arm.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
 <20200522090553.eegs4fcltfqjuhzo@debian>
In-Reply-To: <20200522090553.eegs4fcltfqjuhzo@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbeb545b-0543-4d57-3e5d-08d7fe33d08b
x-ms-traffictypediagnostic: DB7PR08MB3819:|DB7PR08MB3177:
X-Microsoft-Antispam-PRVS: <DB7PR08MB31773BAE32F77B6EFC75B0FE9DB40@DB7PR08MB3177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tq9x3672QMwMpmlO2jg4sDXySpjzUws8EY5AzlhFb0MAjBssB4CU8A7h1hu2AiQItBBk9Rxaj+Vxv+uMVFVeGprHRwVxLXylXH9o73RWbXtzzvWNhDDM22esB2E1hnffBPR26fj/2IGt/ZKEwCL6vZxfvzXa3SBEityt6LkmC0EKDFXYtbS1id/YVU7IYVsSsUciCcRc2IjwS2E67UuXkwIKPyg39+LpMa6L1B7oezJjTDXZDcBf/sdiQpVO2Q0tddQMMnHBH0ZSSJZtsFBnbpo1wdWH1MCcOtt5TbOy8Vbc77xr5fuZPVT7Lt43ZmB+
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(186003)(8676002)(6512007)(6916009)(2906002)(26005)(316002)(6486002)(6506007)(54906003)(8936002)(36756003)(66556008)(66446008)(478600001)(4326008)(53546011)(71200400001)(66476007)(5660300002)(86362001)(64756008)(91956017)(2616005)(76116006)(66946007)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mvSk+VAZGCv2p5gS1GBmuVXL+PM6Fbhm33A9jOP3oW1Nc+/fjXewUPWURU+0zG02hkn1xzWKZLarXjQ9PK2+IQ0xsd/QkGBTy+sIiF1sPUhE2rSQAI9ouaE8DrdL6fBW2T4Suygc0z0ofDsvMUHBzUnpdG4JiXaccH5kFcCI1zSk4uzFbVJ4eTNsN5aSFfOyY8BiVpz4atH5Zxhn2bqRogzVBZyFu/8zz7W3u3E1xz97WUWiD50wAEIiYrY0t4ZIpxk3bPHZQFwncB7eQQIJnF7d95Gah9a6Zl+D5O5VnFHPp+RvpsOQHiWZGj6hDqaPGP1ogkTZqsJeJ6tlthJQfz+z9jbTuxv4sv6TCTlhY/ph1gY5FPIEktDTMRzO7cszG3MmGhyVGz8sQgj/q6cMdIgpIU9docOIRAtqN5DrKg2uoB7P0VNWQk/y/tq4XQewlX+2Lg/v+Rex5Z/xQcZoFvQaDvb+n6To+WQ6fsrzXcc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0DA0D9308217C4D889CAE828EBF436A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3819
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(316002)(33656002)(36756003)(82310400002)(54906003)(70206006)(356005)(47076004)(70586007)(336012)(4326008)(6862004)(8676002)(8936002)(53546011)(82740400003)(81166007)(26005)(5660300002)(36906005)(2906002)(86362001)(6486002)(6506007)(6512007)(2616005)(478600001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a244ce4c-4805-4fbd-5cee-08d7fe33cc45
X-Forefront-PRVS: 04111BAC64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ywgG8JuQdKO/ne5c0G9s2dbFINTyNW8/9JRLj6z9C8PXu9M3Rshui8NvY41Md9VIp+50OepNIaW7F4n423WVQ5U9djqlNx/gV+jGuEKtupv0IXKULbcB77tNpe2FRADhiG3qqNRFRnWQBsSl69aYPFEWN2Gti4ZdkecHALnwQcgniN2jXDaoxZT9YfPqbvhCW3luV59RS9Qfh+69FSQzqUGzp6dxkBzPQtW69ORKw0CGCVPQ7wI6A2vwHU3KYUVtAyNTkJDux/iiSLPX8i6kXHb46RByosIwbfIO8srWeBQ8IDPuKSwx64tIfWj1XL0mEivj3MtZeeR6lvTdpT/vtXsUGEWQgCpLG9eKZjsDx2QsBTgOibH3Yu57oN/hrU3Xv+0UFxzsida+F+3lDtRe4ne37tHTGP0etM1qKknEjmTk6/bulfzVR/t4qXuUwnnYlI1Q1HAkMidqXEkv6QStO2AvRa21nvvUHO5zykkwd4HL9ANNRDqqT+z6E77X/sHW9mI3eBXhZGIcqKhBDYHAPg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 09:37:59.0728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeb545b-0543-4d57-3e5d-08d7fe33d08b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCj4gT24gMjIgTWF5IDIwMjAsIGF0IDEwOjA1LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDA4OjQxOjE3QU0gKzAwMDAsIEJl
cnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSwNCj4+IA0KPj4gQXMgYSBjb25zZXF1ZW5jZSBv
ZiB0aGlzIGZpeCwgdGhlIGZvbGxvd2luZyBoYXMgYmVlbiBjb21taXR0ZWQgKEkgZ3Vlc3MgYXMg
YSBjb25zZXF1ZW5jZSBvZiByZWdlbmVyYXRpbmcgdGhlIGNvbmZpZ3VyZSBzY3JpcHRzKToNCj4+
IGRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUgYi90b29scy9jb25maWd1cmUNCj4+IGluZGV4
IDM3NTQzMGRmM2YuLjM2NTk2Mzg5YjggMTAwNzU1DQo+PiAtLS0gYS90b29scy9jb25maWd1cmUN
Cj4+ICsrKyBiL3Rvb2xzL2NvbmZpZ3VyZQ0KPj4gQEAgLTQ2NzgsNiArNDY3OCwxMCBAQCBmb3Ig
bGRmbGFnIGluICRBUFBFTkRfTElCDQo+PiBkbw0KPj4gICAgIEFQUEVORF9MREZMQUdTPSIkQVBQ
RU5EX0xERkxBR1MgLUwkbGRmbGFnIg0KPj4gZG9uZQ0KPj4gK2lmICAhIC16ICRFWFRSQV9QUkVG
SVggOyB0aGVuDQo+PiArICAgIENQUEZMQUdTPSIkQ1BQRkxBR1MgLUkkRVhUUkFfUFJFRklYL2lu
Y2x1ZGUiDQo+PiArICAgIExERkxBR1M9IiRMREZMQUdTIC1MJEVYVFJBX1BSRUZJWC9saWIiDQo+
PiArZmkNCj4+IENQUEZMQUdTPSIkUFJFUEVORF9DUFBGTEFHUyAkQ1BQRkxBR1MgJEFQUEVORF9D
UFBGTEFHUyINCj4+IExERkxBR1M9IiRQUkVQRU5EX0xERkxBR1MgJExERkxBR1MgJEFQUEVORF9M
REZMQUdT4oCdDQo+PiANCj4+IFRoaXMgc2hvdWxkIGJlOg0KPj4gaWYgIFsgISAteiAkRVhUUkFf
UFJFRklYIF07IHRoZW4NCj4+IA0KPj4gQXMgb24gb3RoZXIgY29uZmlndXJlIHNjcmlwdHMuDQo+
PiANCj4+IER1cmluZyBjb25maWd1cmUgSSBoYXZlIG5vdCB0aGUgZm9sbG93aW5nIGVycm9yOg0K
Pj4gLi9jb25maWd1cmU6IGxpbmUgNDY4MTogLXo6IGNvbW1hbmQgbm90IGZvdW5kDQo+PiANCj4+
IFdoaWNoIGlzIGlnbm9yZWQgYnV0IGlzIGFkZGluZyAtTC9saWIgYW5kIC1JL2luY2x1ZGUgdG8g
dGhlIENQUEZMQUdTIGFuZCBMREZMQUdTDQo+PiANCj4+IFdoYXQgc2hvdWxkIGJlIHRoZSBwcm9j
ZWR1cmUgdG8gYWN0dWFsbHkgZml4IHRoYXQgKGFzIHRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9t
IHRoZSBjb25maWd1cmUgc2NyaXB0IHJlZ2VuZXJhdGlvbiBJIGd1ZXNzKSA/IA0KPiANCj4gRG9l
cyB0aGUgZm9sbG93aW5nIHBhdGNoIHdvcmsgZm9yIHlvdT8NCj4gDQo+IGRpZmYgLS1naXQgYS9t
NC9zZXRfY2ZsYWdzX2xkZmxhZ3MubTQgYi9tNC9zZXRfY2ZsYWdzX2xkZmxhZ3MubTQNCj4gaW5k
ZXggMDhmNWM5ODNjYzYzLi5jZDM0YzEzOWJjOTQgMTAwNjQ0DQo+IC0tLSBhL200L3NldF9jZmxh
Z3NfbGRmbGFncy5tNA0KPiArKysgYi9tNC9zZXRfY2ZsYWdzX2xkZmxhZ3MubTQNCj4gQEAgLTE1
LDcgKzE1LDcgQEAgZm9yIGxkZmxhZyBpbiAkQVBQRU5EX0xJQg0KPiBkbw0KPiAgICAgQVBQRU5E
X0xERkxBR1M9IiRBUFBFTkRfTERGTEFHUyAtTCRsZGZsYWciDQo+IGRvbmUNCj4gLWlmIFsgISAt
eiAkRVhUUkFfUFJFRklYIF07IHRoZW4NCj4gK2lmIHRlc3QgISAteiAkRVhUUkFfUFJFRklYIDsg
dGhlbg0KPiAgICAgQ1BQRkxBR1M9IiRDUFBGTEFHUyAtSSRFWFRSQV9QUkVGSVgvaW5jbHVkZSIN
Cj4gICAgIExERkxBR1M9IiRMREZMQUdTIC1MJEVYVFJBX1BSRUZJWC9saWIiDQo+IGZpDQo+IA0K
PiANCj4gWW91IHdpbGwgbmVlZCB0byBydW4gYXV0b2dlbi5zaCB0byByZWdlbmVyYXRlIHRvb2xz
L2NvbmZpZ3VyZS4NCj4gDQoNClllcyB0aGF0IHdvcmtzIG9uIG15IHNpZGUgYW5kIGdlbmVyYXRl
IHRvb2xzL2NvbmZpZ3VyZSB1c2luZyDigJx0ZXN04oCdDQoNCkJ1dCB3aHkgYXJlIHRoZSBbXSBi
ZWluZyByZW1vdmVkIHdoZW4gZ2VuZXJhdGluZyB0b29scy9jb25maWd1cmUgPw0KDQpCZXJ0cmFu
ZA0KDQo+IFdlaS4NCj4gDQo+PiANCj4+IEJlcnRyYW5kDQo+PiANCj4+PiBPbiA1IE1heSAyMDIw
LCBhdCAxMDoyNCwgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4gVGhlIHBhdGggcHJvdmlkZWQgYnkgRVhUUkFfUFJFRklYIHNob3VsZCBiZSBh
ZGRlZCB0byB0aGUgc2VhcmNoIHBhdGgNCj4+PiBvZiB0aGUgY29uZmlndXJlIHNjcmlwdCwgbGlr
ZSBpdCdzIGRvbmUgaW4gQ29uZmlnLm1rLiBOb3QgZG9pbmcgc28NCj4+PiBtYWtlcyB0aGUgc2Vh
cmNoIHBhdGggZm9yIGNvbmZpZ3VyZSBkaWZmZXIgZnJvbSB0aGUgc2VhcmNoIHBhdGggdXNlZA0K
Pj4+IGJ5IHRoZSBidWlsZC4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+PiAtLS0NCj4+PiBQbGVhc2UgcmUtcnVuIGF1
dG9jb25mLnNoIGFmdGVyIGFwcGx5aW5nLg0KPj4+IC0tLQ0KPj4+IG00L3NldF9jZmxhZ3NfbGRm
bGFncy5tNCB8IDQgKysrKw0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+
PiANCj4+PiBkaWZmIC0tZ2l0IGEvbTQvc2V0X2NmbGFnc19sZGZsYWdzLm00IGIvbTQvc2V0X2Nm
bGFnc19sZGZsYWdzLm00DQo+Pj4gaW5kZXggY2JhZDNjMTBiMC4uMDhmNWM5ODNjYyAxMDA2NDQN
Cj4+PiAtLS0gYS9tNC9zZXRfY2ZsYWdzX2xkZmxhZ3MubTQNCj4+PiArKysgYi9tNC9zZXRfY2Zs
YWdzX2xkZmxhZ3MubTQNCj4+PiBAQCAtMTUsNiArMTUsMTAgQEAgZm9yIGxkZmxhZyBpbiAkQVBQ
RU5EX0xJQg0KPj4+IGRvDQo+Pj4gICAgQVBQRU5EX0xERkxBR1M9IiRBUFBFTkRfTERGTEFHUyAt
TCRsZGZsYWciDQo+Pj4gZG9uZQ0KPj4+ICtpZiBbICEgLXogJEVYVFJBX1BSRUZJWCBdOyB0aGVu
DQo+Pj4gKyAgICBDUFBGTEFHUz0iJENQUEZMQUdTIC1JJEVYVFJBX1BSRUZJWC9pbmNsdWRlIg0K
Pj4+ICsgICAgTERGTEFHUz0iJExERkxBR1MgLUwkRVhUUkFfUFJFRklYL2xpYiINCj4+PiArZmkN
Cj4+PiBDUFBGTEFHUz0iJFBSRVBFTkRfQ1BQRkxBR1MgJENQUEZMQUdTICRBUFBFTkRfQ1BQRkxB
R1MiDQo+Pj4gTERGTEFHUz0iJFBSRVBFTkRfTERGTEFHUyAkTERGTEFHUyAkQVBQRU5EX0xERkxB
R1MiXSkNCj4+PiANCj4+PiAtLSANCj4+PiAyLjI2LjINCg0K

