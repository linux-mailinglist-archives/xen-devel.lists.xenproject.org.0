Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8F19BD88
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 10:21:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJv3B-0007IC-OI; Thu, 02 Apr 2020 08:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1La=5S=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jJv3A-0007I7-8N
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 08:18:08 +0000
X-Inumbo-ID: 79ff6a88-74ba-11ea-b58d-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::609])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79ff6a88-74ba-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QIskKHJQLPIVNSMR8LT2XHuYRAqL92AqAUdN6HKhc=;
 b=wG9I/Y0UtkF7ePOFDYtYP2tQzpCSEerwhiky1JwVIil+mGCy31m5w8f9bzZOvwB+NSgSp+p4k2hTc6T3Hcttx44k2K0X1UEaoQFlNPoie/L1w8Pj1Al6nXL5oSGJeh5FYCWL3D5sCgPgZQKqb4n5ztUGiumIm2oajqS0HcNPWVU=
Received: from DB8PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:10:100::48)
 by AM6PR08MB3174.eurprd08.prod.outlook.com (2603:10a6:209:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 08:18:03 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::41) by DB8PR06CA0035.outlook.office365.com
 (2603:10a6:10:100::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Thu, 2 Apr 2020 08:18:03 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 08:18:03 +0000
Received: ("Tessian outbound e2c88df8bbbe:v50");
 Thu, 02 Apr 2020 08:18:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85b9c7e96a162aeb
X-CR-MTA-TID: 64aa7808
Received: from a2487f2a0395.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDAFF981-EDD3-4387-B6F4-130CB090BF0F.1; 
 Thu, 02 Apr 2020 08:17:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2487f2a0395.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Apr 2020 08:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgquZ9O/YP/s+uhrBR/I10AXRwsPBYxikxlqyE6w12NFV9gtfYJaLHGE2u0lgcHk12a5ba3n2/5nVrsUcqvA9fY4Z29KwUqaaDqrq7gAk9RGqnvXRDQGmiTAHRift0slY4IsYL3CpTCQY1wmZ4/WD19wkjN/oW19NUkG5nS0wH1Ahwlr+y+rtjYlCi3h+HFR5dBrG6x5nqW5dQ+IaoEwZjrcJUbH44F9mnceCsqHxUcfRXgmgGbVqibVhjtuk4R51zHJmuPgpj7pSRGQP4OAtCTuU5oIgst1b/EEVSh5O/dfUG/iXw/ZU9nsxAwUAEiNFBtLQRLOZi1sxL12Q6UUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QIskKHJQLPIVNSMR8LT2XHuYRAqL92AqAUdN6HKhc=;
 b=CrQ9FQak13jfU0etHoCTdQ6BQXCjlFggQSjmocVqEHwUtcXgWeWTbsaf3gtMfPRTPuyrlicLYevMYqXGZJUKH/XvO8yXsQsBBUPQ7tqgFhI5f3TDvqxKG5Yz3LcO232g9uDSynO7Fs2hxUv4pfsvOi9NIrlL55k2Ck41udjvXdzoHQCJV9atBiBRCOeJmfwOPgIKLNXw6NzOkNHlANPPqnkZPB1OlMscCkrUOzVVZAEeRsvTovoU/tZ8Bo7ZfSekPr+hszv/Ulrupys/5zczR5Nk+YdA/OMqHEZtBnqShLvXMgK+Uh6STH9zBKdoUxshhRV8v0O2NbHwdBEGfNdf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QIskKHJQLPIVNSMR8LT2XHuYRAqL92AqAUdN6HKhc=;
 b=wG9I/Y0UtkF7ePOFDYtYP2tQzpCSEerwhiky1JwVIil+mGCy31m5w8f9bzZOvwB+NSgSp+p4k2hTc6T3Hcttx44k2K0X1UEaoQFlNPoie/L1w8Pj1Al6nXL5oSGJeh5FYCWL3D5sCgPgZQKqb4n5ztUGiumIm2oajqS0HcNPWVU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3452.eurprd08.prod.outlook.com (20.177.120.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Thu, 2 Apr 2020 08:17:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 08:17:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWB8CUPtV45V7pfkaBDuUahGESj6hj8BaAgAAXawCAAH2GAIAA+deA
Date: Thu, 2 Apr 2020 08:17:45 +0000
Message-ID: <760EB332-F1E4-44E0-AB3B-2CEBECDBC1F0@arm.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <A33FEB65-F844-4CA6-BAE0-F0C881CFD381@arm.com>
 <5e788594-93bd-4bf0-1113-5d55a4f5f8bc@xen.org>
In-Reply-To: <5e788594-93bd-4bf0-1113-5d55a4f5f8bc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b50847e4-8c4a-4664-7fb4-08d7d6de5d29
x-ms-traffictypediagnostic: DB7PR08MB3452:|AM6PR08MB3174:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3174F2FD0646F5D6314641259DC60@AM6PR08MB3174.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(26005)(81156014)(186003)(6486002)(478600001)(6916009)(53546011)(5660300002)(2616005)(33656002)(8936002)(81166006)(71200400001)(54906003)(8676002)(4326008)(36756003)(66476007)(66556008)(64756008)(66446008)(6506007)(76116006)(2906002)(6512007)(316002)(86362001)(91956017)(66946007);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HTG7ORIy5V6IrrEAp9paLh7z5Cc5M0YmsXrDWw9tBbG1GNkCjB9jk/LEEwS28yQSPFuR129dir1ywwl9WANRGhBgZwYL/Zpcb+hvLitb+mLWtKFd7su8gTp701vqFRQUMxmkZeOfek1j6FAcli7978RDQT5hoN7RMlJkRC/JjVZIFx2/a/KSs1wqxxrqByLZsZQ6YZZSZPHwUbBuZYhOPHfyE+rsGIvKjGjdvojN7CEAK+DYfSf4o0byNiqnj0Fn67L5t6hLwydtbFoRVhz2waov+ykg0QrWmsv4uLSULK+Mdl/HsLoKY4Ck6lAYHR5M/KUniVPX9zvDk5UXJBB4y5XTZ26kd80+OHXoIAVcpKX/MZ1Ku5lQObVjVKJde2wuB+qbEcSshaRH2Oy/9LmucoKVQ9ldiqES0Wf2yey1iTHZkyH6kZ9VC07Ch5Sz2ufG
x-ms-exchange-antispam-messagedata: l5M3CnZ2FNZG7pKb+BLShrLpC0tpPd7l1sd/G7DG6igFI7+rLrCvuMxguDv/Q1OsLIxi5MPh2qLWXQJKHF739B6GqdVwr2cMz5ehCtyFvpXAFHAKX7x9o9AnURWXqpOdBuSP19N7kBUePNn2FNQYIg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D47431E199E7944B01D3DFEF39D65F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3452
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(186003)(5660300002)(107886003)(86362001)(8676002)(6512007)(6862004)(26005)(36756003)(81156014)(81166006)(4326008)(356004)(316002)(47076004)(54906003)(70586007)(2906002)(53546011)(70206006)(478600001)(26826003)(8936002)(82740400003)(33656002)(6506007)(2616005)(6486002)(336012);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5824f1d-694e-4208-950a-08d7d6de52e8
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: betu3PLIy/v9OfAfmJUzva3qmu/HLMO5IXq7AY+ysSc0JBVgCDFfMumZBwBopbZ3PQjiNHIpmTpMmuDIqNXeVoQD+UOUN1BxRgH8H+ufVZkWlPRK5NDYi8jd1FiVfRd16hQTpahj03gbuRpUa5NmLo/tZQCMASkJZ1xs9lLHg3VLkAlz515gl7U2kJ0CWDjge9MwG3M/38IJthp8an3g7X5brfA3ZQf8VFr/1qQ06Yb35RLHFEckzzmQW8xcvfDBN/wB6ZqrouyxN9m6Fw+Z5OP4Fv3mlxCntXdH/d44TL3ozT2BZ6vt2+al4Jj61NgFXSJlPSzmXGFjlqIBqTVtKITtouZKgFJMF6AniXUiAO8cKZBpAgjVdZ+7G3T1xPpN96+dQFJX1bWRcEOdxAHyIxc6U/y6q1qbHAdEavS1bSF4UFHHI2rcmzVM/LX8Phr4AxbbZRaCXfmypplfpBrnkqFKuXvSDOB2PW+h6lmuwUSLaVrHNycMUT6FBGkKiCcRWUdKWRlcn/Fmc4FYKqIcAw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 08:18:03.0218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50847e4-8c4a-4664-7fb4-08d7d6de5d29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3174
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMSBBcHIgMjAyMCwgYXQgMTg6MjMsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwMS8wNC8yMDIwIDEwOjU0LCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+IE9uIDEgQXByIDIwMjAsIGF0IDA5OjMwLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnIDxtYWlsdG86anVsaWVuQHhlbi5vcmc+PiB3cm90ZToNCj4+PiANCj4+
PiANCj4+PiANCj4+PiBPbiAwMS8wNC8yMDIwIDAxOjU3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+Pj4+IE9uIE1vbiwgMzAgTWFyIDIwMjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+
IEhpIFN0ZWZhbm8sDQo+Pj4+PiANCj4+Pj4+IE9uIDMwLzAzLzIwMjAgMTc6MzUsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+PiBPbiBTYXQsIDI4IE1hciAyMDIwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6DQo+Pj4+Pj4+IHFIaSBTdGVmYW5vLA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMjcv
MDMvMjAyMCAwMjozNCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+Pj4gVGhpcyBp
cyBhIHNpbXBsZSBpbXBsZW1lbnRhdGlvbiBvZiBHSUNEX0lDQUNUSVZFUiAvIEdJQ0RfSVNBQ1RJ
VkVSDQo+Pj4+Pj4+PiByZWFkcy4gSXQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGUgbGF0
ZXN0IHN0YXRlIG9mIGludGVycnVwdHMgb24NCj4+Pj4+Pj4+IG90aGVyIHZDUFVzLiBPbmx5IHRo
ZSBjdXJyZW50IHZDUFUgaXMgdXAtdG8tZGF0ZS4gQSBmdWxsIHNvbHV0aW9uIGlzDQo+Pj4+Pj4+
PiBub3QgcG9zc2libGUgYmVjYXVzZSBpdCB3b3VsZCByZXF1aXJlIHN5bmNocm9uaXphdGlvbiBh
bW9uZyBhbGwgdkNQVXMsDQo+Pj4+Pj4+PiB3aGljaCB3b3VsZCBiZSB2ZXJ5IGV4cGVuc2l2ZSBp
biB0ZXJtcyBvciBsYXRlbmN5Lg0KPj4+Pj4+PiANCj4+Pj4+Pj4gWW91ciBzZW50ZW5jZSBzdWdn
ZXN0cyB5b3UgaGF2ZSBudW1iZXIgc2hvd2luZyB0aGF0IGNvcnJlY3RseSBlbXVsYXRpbmcNCj4+
Pj4+Pj4gdGhlDQo+Pj4+Pj4+IHJlZ2lzdGVycyB3b3VsZCBiZSB0b28gc2xvdy4gTWluZCBzaGFy
aW5nIHRoZW0/DQo+Pj4+Pj4gDQo+Pj4+Pj4gTm8sIEkgZG9uJ3QgaGF2ZSBhbnkgbnVtYmVycy4g
V291bGQgeW91IHByZWZlciBhIGRpZmZlcmVudCB3b3JkaW5nIG9yIGENCj4+Pj4+PiBiZXR0ZXIg
ZXhwbGFuYXRpb24/IEkgYWxzbyByZWFsaXplZCB0aGVyZSBpcyBhIHR5cG8gaW4gdGhlcmUgKG9y
L29mKS4NCj4+Pj4+IExldCBtZSBzdGFydCB3aXRoIEkgdGhpbmsgY29ycmVjdG5lc3MgaXMgbW9y
ZSBpbXBvcnRhbnQgdGhhbiBzcGVlZC4NCj4+Pj4+IFNvIEkgd291bGQgaGF2ZSBleHBlY3RlZCB5
b3VyIGNvbW1pdCBtZXNzYWdlIHRvIGNvbnRhaW4gc29tZSBmYWN0IHdoeQ0KPj4+Pj4gc3luY2hy
b25pemF0aW9uIGlzIGdvaW5nIHRvIGJlIHNsb3cgYW5kIHdoeSB0aGlzIGlzIGEgcHJvYmxlbS4N
Cj4+Pj4+IA0KPj4+Pj4gVG8gZ2l2ZSB5b3UgYSBjb25jcmV0ZSBleGFtcGxlLCB0aGUgaW1wbGVt
ZW50YXRpb24gb2Ygc2V0L3dheSBpbnN0cnVjdGlvbnMgYXJlDQo+Pj4+PiByZWFsbHkgc2xvdyAo
aXQgY291bGQgdGFrZSBhIGZldyBzZWNvbmRzIGRlcGVuZGluZyBvbiB0aGUgc2V0dXApLiBIb3dl
dmVyLA0KPj4+Pj4gdGhpcyB3YXMgZmluZSBiZWNhdXNlIG5vdCBpbXBsZW1lbnRpbmcgdGhlbSBj
b3JyZWN0bHkgd291bGQgaGF2ZSBhIGdyZWF0ZXINCj4+Pj4+IGltcGFjdCBvbiB0aGUgZ3Vlc3Qg
KGNvcnJ1cHRpb24pIGFuZCB0aGV5IGFyZSBub3QgdXNlZCBvZnRlbi4NCj4+Pj4+IA0KPj4+Pj4g
SSBkb24ndCB0aGluayB0aGUgcGVyZm9ybWFuY2UgaW4gb3VyIGNhc2Ugd2lsbCBiZSBpbiBzYW1l
IG9yZGVyIG1hZ25pdHVkZS4gSXQNCj4+Pj4+IGlzIG1vc3QgbGlrZWx5IHRvIGJlIGluIHRoZSBy
YW5nZSBvZiBtaWxsaXNlY29uZHMgKGlmIG5vdCBsZXNzKSB3aGljaCBJIHRoaW5rDQo+Pj4+PiBp
cyBhY2NlcHRhYmxlIGZvciBlbXVsYXRpb24gKHBhcnRpY3VsYXJseSBmb3IgdGhlIHZHSUMpIGFu
ZCB0aGUgY3VycmVudCB1c2VzLg0KPj4+PiBXcml0aW5nIG9uIHRoZSBtYWlsaW5nIGxpc3Qgc29t
ZSBvZiBvdXIgZGlzY3Vzc2lvbnMgdG9kYXkuDQo+Pj4+IENvcnJlY3RuZXNzIGlzIG5vdCBqdXN0
IGluIHRlcm1zIG9mIGNvbXBsaWFuY2UgdG8gYSBzcGVjaWZpY2F0aW9uIGJ1dCBpdA0KPj4+PiBp
cyBhbHNvIGFib3V0IG5vdCBicmVha2luZyBndWVzdHMuIEludHJvZHVjaW5nIGxhdGVuY3kgaW4g
dGhlIHJhbmdlIG9mDQo+Pj4+IG1pbGxpc2Vjb25kcywgb3IgaHVuZHJlZHMgb2YgbWljcm9zZWNv
bmRzLCB3b3VsZCBicmVhayBhbnkgbGF0ZW5jeQ0KPj4+PiBzZW5zaXRpdmUgd29ya2xvYWRzLiBX
ZSBkb24ndCBoYXZlIG51bWJlcnMgc28gd2UgZG9uJ3Qga25vdyBmb3IgY2VydGFpbg0KPj4+PiB0
aGUgZWZmZWN0IHRoYXQgeW91ciBzdWdnZXN0aW9uIHdvdWxkIGhhdmUuDQo+Pj4gDQo+Pj4gWW91
IG1pc3NlZCBwYXJ0IG9mIHRoZSBkaXNjdXNzaW9uLiBJIGRvbid0IGRpc2FncmVlIHRoYXQgbGF0
ZW5jeSBpcyBpbXBvcnRhbnQuIEhvd2V2ZXIsIGlmIGFuIGltcGxlbWVudGF0aW9uIGlzIG9ubHkg
OTUlIHJlbGlhYmxlLCB0aGVuIGl0IG1lYW5zIDUlIG9mIHRoZSB0aW1lIHlvdXIgZ3Vlc3QgbWF5
IGJyZWFrIChjb3JydXB0aW9uLCBjcmFzaCwgZGVhZGxvY2suLi4pLiBBdCB3aGljaCBwb2ludCB0
aGUgbGF0ZW5jeSBpcyB0aGUgbGFzdCBvZiB5b3VyIGNvbmNlcm4uDQo+Pj4gDQo+Pj4+IEl0IHdv
dWxkIGJlIGludGVyZXN0aW5nIHRvIGhhdmUgdGhvc2UgbnVtYmVycywgYW5kIEknbGwgYWRkIHRv
IG15IFRPRE8NCj4+Pj4gbGlzdCB0byBydW4gdGhlIGV4cGVyaW1lbnRzIHlvdSBzdWdnZXN0ZWQs
IGJ1dCBJJ2xsIHB1dCBpdCBvbiB0aGUNCj4+Pj4gYmFjay1idXJuZXIgKGZyb20gYSBYaWxpbngg
cGVyc3BlY3RpdmUgaXQgaXMgbG93IHByaW9yaXR5IGFzIG5vDQo+Pj4+IGN1c3RvbWVycyBhcmUg
YWZmZWN0ZWQuKQ0KPj4+IA0KPj4+IEhvdyBhYm91dCB3ZSBnZXQgYSBjb3JyZWN0IGltcGxlbWVu
dGF0aW9uIG1lcmdlIGZpcnN0IGFuZCB0aGVuIGRpc2N1c3MgYWJvdXQgb3B0aW1pemF0aW9uPyBU
aGlzIHdvdWxkIGFsbG93IHRoZSBjb21tdW5pdHkgdG8gY2hlY2sgd2hldGhlciB0aGVyZSBhcmUg
YWN0dWFsbHkgbm90aWNlYWJsZSBsYXRlbmN5IGluIHRoZWlyIHdvcmtsb2FkLg0KPj4gSGksDQo+
IA0KPiBIaSwNCg0KSGksDQoNCj4gDQo+PiBJIGFtIG5vdCBzdXJlIHRoYXQgcHVzaGluZyBzb21l
dGhpbmcgd2l0aCBhIHBlcmZvcm1hbmNlIGltcGFjdCB0byBsYXRlciBmaXggaXQgaXMgdGhlIHJp
Z2h0IGFwcHJvYWNoIGhlcmUuDQo+PiBUaGUgcGF0Y2ggaXMgYW4gaW1wcm92ZW1lbnQgY29tcGFy
ZWQgdG8gdGhlIGN1cnJlbnQgY29kZSBhbmQgaXQgY2FuIGJlIGZ1cnRoZXIgaW1wcm92ZWQgbGF0
ZXIgdG8gaGFuZGxlIG1vcmUgY2FzZXMgKG90aGVyIGNvcmVzKS4NCj4gDQo+IElmIHlvdSByZWFk
IG15IG90aGVyIGFuc3dlciBvbiB0aGlzIHBhdGNoIHlvdSB3aWxsIHNlZSB0aGF0IHRoaXMgaXMg
Z29pbmcgdG8gaW50cm9kdWNlIGEgZGVhZGxvY2sgaW4gdGhlIGd1ZXN0IHVzaW5nIG11bHRpcGxl
IHZDUFVzLiBIb3cgaXMgaXQgYW4gaW1wcm92ZW1lbnQgY29tcGFyZSB0byB0b2RheT8NCg0KSSBm
dWxseSBhZ3JlZSB3aXRoIHRoZSBmYWN0IHRoYXQgYSBkZWFkbG9jayBldmVuIHdpdGggbG93IHBy
b2JhYmlsaXR5IGlzIGEgbm8tZ28uDQpDdXJyZW50IGltcGxlbWVudGF0aW9uIHJldHVybmluZyBh
bHdheXMgMCBpcyBub3QgY3JlYXRpbmcgdGhpcyBkZWFkbG9jayBjYXNlIGJ1dCBjYW4gbWlzbGVh
ZCBpbiB0aGUgb3RoZXIgd2F5IGxldHRpbmcgb24gQ1BVIHRoaW5rIHRoYXQgdGhlIGludGVycnVw
dCBoYXMgYmVlbiBoYW5kbGVkIGFscmVhZHkgd2hlbiBpdCBoYXMgcG9zc2libHkgbm90IGJlZW4u
DQoNCj4gDQo+PiBJZiB3ZSByZWFsbHkgaGF2ZSB0byBzeW5jIGFsbCB2Q1BVcyBoZXJlLCB0aGlz
IHdpbGwgY29zdCBhIGxvdCBhbmQgdGhlIHJlc3VsdCB3aWxsIHN0aWxsIGJlIHRoZSBzdGF0dXMg
aW4gdGhlIHBhc3QgaW4gZmFjdCBiZWNhdXNlIG5vdGhpbmcgd2lsbCBtYWtlIHN1cmUgdGhhdCBh
dCB0aGUgcG9pbnQgdGhlIGd1ZXN0IGdldHMgYmFjayB0aGUgdmFsdWUgaXQgaXMgc3RpbGwgdmFs
aWQuDQo+IA0KPiBJIGhvcGUgeW91IGFyZSBhd2FyZSB0aGUgcHJvYmxlbSBpcyBleGFjdGx5IHRo
ZSBzYW1lIGluIHRoZSBoYXJkd2FyZS4gQXMgc29vbiBhcyB5b3UgcmVhZCB0aGUgSVNBQ1RJVkVS
LCB0aGVuIHRoZSB2YWx1ZSBtYXkgbm90IGJlIGNvcnJlY3QgYW55bW9yZS4gU28gSSBkb24ndCBz
ZWUgdGhlIGlzc3VlIHRvIGhhdmUgYW4gb3V0ZGF0ZWQgdmFsdWUgaGVyZS4NCg0KTWFpbiBkaWZm
ZXJlbmNlIGJlaW5nIHRoYXQgaW4gdGhlIGhhcmR3YXJlIHlvdSBjYW4gc3RpbGwgcG9sbCBmb3Ig
aXQgYW5kIGJlIHN1cmUgdGhhdCBpdCB3b27igJl0IGVuZCB1cCBpbiB5b3VyIGRlYWRsb2NrLg0K
U28gSSBhZ3JlZSwgd2UgbmVlZCB0byBmaW5kIGEgY2xlYW4gc29sdXRpb24gaGVyZS4NCg0KPiAN
Cj4gQXMgSSBzYWlkIHRvIFN0ZWZhbm8geWVzdGVyZGF5LCBJIHdvdWxkIGJlIGhhcHB5IHRvIGNv
bXByb21pc2UgYXMgbG9uZyBhcyB0aGUgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgaW50cm9kdWNl
IGFuIG91dHJpZ2h0IGRlYWRsb2NrIGluIHRoZSBndWVzdC4NCj4gDQo+IEF0IHRoZSBtb21lbnQs
IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBhcHByb2FjaCB0aGFuIGtpY2sgYWxsIHRoZSB2Q1BVcy4g
RmVlbCBmcmVlIHRvIHN1Z2dlc3QgYSBiZXR0ZXIgb25lLg0KDQpPbmx5IG9uZSB0aGF0IEkgc2Vl
IGlzIHRvIGVuZm9yY2UgYSBzZXJ2aWNlIGludGVycnVwdCB3aGVuIGludGVycnVwdHMgaGF2ZSBi
ZWVuIGhhbmRsZWQgdG8gbWFrZSBzdXJlIHRoYXQgd2UgY2xlYW4gdXAgdGhlIGludGVybmFsIGFj
dGl2ZSBzdGF0dXMgYXMgc29vbiBhcyBpbnRlcnJ1cHQgaGFzIGFjdHVhbGx5IGJlZW4gaGFuZGxl
Lg0KVGhpcyB3b3VsZCBlbnN1cmUgdGhhdCB0aGUgcG9sbGluZyBpcyBiZWhhdmluZyBwcm9wZXJs
eSBmcm9tIHRoZSBndWVzdCBwb2ludCBvZiB2aWV3IGJ1dCB3b3VsZCBwcmV2ZW50IHRoZSBjcm9z
cyBjcHUgc3luYyAoc3RhdHVzIHdpbGwgYmUgcmlnaHQgYXMgc29vbiBhcyB0aGUgaW50ZXJydXB0
IHdpbGwgaGF2ZSBiZWVuIHNlcnZpY2VkKS4NCkJ1dCB0aGUgdHJhZGUgb2ZmIHdpbGwgYmUgYSBi
aWdnZXIgb3ZlcmhlYWQgYnkgZW5mb3JjaW5nIGEgcmV0dXJuIGJhY2sgdG8geGVuIGVhY2ggdGlt
ZSBhbmQgaW50ZXJydXB0IGlzIGhhbmRsZWQgYnkgYSBndWVzdC4NCg0KSSB3aWxsIHRyeSB0byBz
cGVuZCBtb3JlIHRpbWUgb24gdGhpcyBhbmQgZGlzY3VzcyB3aXRoIHRoZSBHSUMgZW5naW5lZXJz
IGF0IEFybSB0byBkaWcgZGVlcGVyIGluIHRoaXMgY2FzZS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

