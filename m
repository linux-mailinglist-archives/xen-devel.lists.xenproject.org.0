Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF868DB83B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 22:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLCJF-0003vj-U7; Thu, 17 Oct 2019 20:23:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g/FX=YK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iLCJF-0003ve-0i
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 20:23:45 +0000
X-Inumbo-ID: 03393f86-f11c-11e9-93d7-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03393f86-f11c-11e9-93d7-12813bfff9fa;
 Thu, 17 Oct 2019 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkqfuJIRFtOc/WuBj9XC36tyiRcssujp/v5blAyZ9ZI=;
 b=idXY94qA9/2BIp09+rnZrFb3vnJzSNKKlS2FWXcAP3qWCiHN8Nr/gmCXIsudeLs/K+MvOAA0k6X9XH0erBYXGbGRb4fJJFrtACpeb6Obfyr0ZLqNlSCBifPUIZ5S+OSz4U55V0jM9bK/1JLhExJjutMCnGSflVsgkKYa19xnQRs=
Received: from VI1PR08CA0150.eurprd08.prod.outlook.com (2603:10a6:800:d5::28)
 by AM6PR08MB3270.eurprd08.prod.outlook.com (2603:10a6:209:50::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 20:23:39 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0150.outlook.office365.com
 (2603:10a6:800:d5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 20:23:39 +0000
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
 15.20.2305.15 via Frontend Transport; Thu, 17 Oct 2019 20:23:37 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 17 Oct 2019 20:23:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1fe2227591bbbbe
X-CR-MTA-TID: 64aa7808
Received: from 3e20ea8d28c3.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 292AB378-8992-4414-ADEF-B8C00348EF4F.1; 
 Thu, 17 Oct 2019 20:23:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e20ea8d28c3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Oct 2019 20:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/s79G3TQ1m6+X2CIajiygDPLci/ma5V0HripDrKj+s35fCXgHHx4awHM0tZpByJxqiiyYIdt0cEye/qj+t3xv4BYhyx9dCxExjL6NFXsUMqNfs8siThOiFA8nKSW5isb3A6BOuaNKkDKbeMBv6N0mUfYzz6uL6rZvkeOti/D55r0B0gi1AZDVnJ+rNzi+RVxzl386mTGSuI7sJqeyroFUv6LHAPQ9EjrjRwvS8GXgKmSQwiNr1djrkzi0iWyKema5ekdSnHREf4wFjPDi16GraAxVvkbDJDzO6Sk3KXa3BP6+bZgTskiDcEAe3urZXpVkmlGn6bj7b/czsVS/ASOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkqfuJIRFtOc/WuBj9XC36tyiRcssujp/v5blAyZ9ZI=;
 b=nbdb2A+ToNnT0m93dHHstlZOc5tERp3uiZbXEQYmrLQMhlmVcSHretpsjEpGwUr5SK2P5DiIJ2sGwxyrkDWtW8IMqceyNpwWBmK8x2JIDQAcmrkJTLkQAgaKRzGg6eaiJUlA1naC2NE8aHKUzQBRYM2F+0l2U2WW/iQeQuBvH7FhE/q/tvDxKBfoD89pnUKKgQBCX//eq+l+t8FM/I8XYFX0TMhRz0pQg8a8RBuFIjGVU3SgNMrcnI+fP4hLdfhCGm5E4eoOpFiTt6rTJ6o53nLB7YHgscSPjVNesh/aVkq1AYcRDt/c3zBpmP8yaf9cn12UvRQwuiqKf/Wb15RnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkqfuJIRFtOc/WuBj9XC36tyiRcssujp/v5blAyZ9ZI=;
 b=idXY94qA9/2BIp09+rnZrFb3vnJzSNKKlS2FWXcAP3qWCiHN8Nr/gmCXIsudeLs/K+MvOAA0k6X9XH0erBYXGbGRb4fJJFrtACpeb6Obfyr0ZLqNlSCBifPUIZ5S+OSz4U55V0jM9bK/1JLhExJjutMCnGSflVsgkKYa19xnQRs=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4556.eurprd08.prod.outlook.com (20.179.42.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 17 Oct 2019 20:23:21 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 20:23:21 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Brian Woods <brian.woods@xilinx.com>
Thread-Topic: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
 overlap
Thread-Index: AQHVftqpGyCF495J3kWN1K0obwmWaKdUFMKAgAGTigCAABT/gIAAAiKAgAAT6YD///1PgIAI2o+AgACe5YCAAAmfgA==
Date: Thu, 17 Oct 2019 20:23:21 +0000
Message-ID: <ad8d8045-3162-ab83-8e7a-f808333ba6bf@arm.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
 <20191011180612.GA19987@xilinx.com>
 <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
 <20191011190751.GB19987@xilinx.com>
 <729fbca8-9a9c-8764-9f9d-c24140d9bb68@arm.com>
 <20191017194853.GB6184@xilinx.com>
In-Reply-To: <20191017194853.GB6184@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::23) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ca675792-dd23-4bf3-53cc-08d7533fe423
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4556:|AM6PR08MB3270:
X-Microsoft-Antispam-PRVS: <AM6PR08MB327094950BF75F523CBED7D7806D0@AM6PR08MB3270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01930B2BA8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(229853002)(476003)(6506007)(6246003)(44832011)(6486002)(53546011)(386003)(486006)(25786009)(6436002)(5660300002)(478600001)(54906003)(31696002)(86362001)(316002)(6116002)(2616005)(11346002)(2906002)(446003)(3846002)(6512007)(8936002)(14454004)(6916009)(66946007)(81156014)(31686004)(66476007)(66556008)(256004)(66446008)(64756008)(14444005)(8676002)(7736002)(99286004)(305945005)(52116002)(76176011)(26005)(4326008)(186003)(81166006)(66066001)(36756003)(71190400001)(102836004)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4556;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2HI8lvV0YLzvJeexmVYkCVYM2VayxXLcmr0J3JYZ9k1Qf2NemyJZMef7d7iTHodchmtdxblX9GN7rGrgDbmf3xbvN4s/O7jOAbKz1nVP+xdxeCv/u0T4RtkOWiLnwzaXivPOwLlsgjNVHm6NENfdwrBskLICWy6Ptk/MV1yDD2A1hv8GMNiW3eLJcfEPe6SWGxUctKxk/oEWHeVkQNKy3X7bzKCCOy7uNpPHTqWpqMMNF8bTrVLMNfkVh9s+zjXm0HDm4AUs9k47bYRevH3tFqgrs18dolZ/1oKIrzYxsCqG4B0mCfGm0++rBk5VUcC01yz459IXPaGnT7cORsyA8rS1YRvpnfks3svBAU4k7QzelJClhbuCHSCHwnPpAUBbl7KpYTEgNNqd1LXQu1h/xXqEsKzR1Mjn/1TaLuxXHHg=
x-ms-exchange-transport-forked: True
Content-ID: <1FB7EA840C20974B8FCDAA3EF19CAA22@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4556
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(23676004)(6506007)(336012)(63350400001)(26826003)(446003)(6246003)(11346002)(436003)(476003)(70206006)(36906005)(316002)(26005)(2906002)(50466002)(386003)(126002)(6512007)(14454004)(76176011)(36756003)(478600001)(186003)(5660300002)(102836004)(53546011)(25786009)(99286004)(2486003)(4326008)(6486002)(66066001)(7736002)(486006)(6116002)(356004)(305945005)(107886003)(31696002)(86362001)(76130400001)(3846002)(229853002)(8676002)(81166006)(8936002)(81156014)(2616005)(31686004)(70586007)(14444005)(54906003)(6862004)(47776003)(22756006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3270;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d63f7d23-56dc-4a6b-d049-08d7533fda5c
NoDisclaimer: True
X-Forefront-PRVS: 01930B2BA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4L2PH9NfkJBwhr0SHALGc8NhhJIA254zDffFxxvsZMA/vV/KxBi/tkdKht90LpKZjf1rgWXgrL1X/Z78cxmOSX/NPn3mJ6Bvs8m74pCkms/4qfWQOT0a86UNKbKYoFoF8+xNQXkd5isgr09vNyApwsSC8DG5vbUxrO4L55P1u+0k6H9Dkt22pcOu4KvXmGC7AliY56SJYVtbJ8GvjFkVG7I8kk3rx+l03PqBZqGTmz7S3ty6aVX/vdHlfLtP8kXAQWXk0VM56MzOVD2ti0swXNYM0kRhDGOFc4JJZEBqW+j/fJcYDnRA36Tkt5q6QrV7KsAYWJF9FuI/jCI2/wrc1i20We5tXMvqQkwU1HeCz3315JCIMeROnbvVY/ey6WuqXXZUwC+h8U/jVgudk0A1p4FxpczTWHdjdXwFS8rQBXI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 20:23:37.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca675792-dd23-4bf3-53cc-08d7533fe423
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3270
Subject: Re: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
 overlap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDE3LzEwLzIwMTkgMjA6NDgsIEJyaWFuIFdvb2RzIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAxNywgMjAxOSBhdCAxMDoyMDoxMUFNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
PiBIaSwNCj4+DQo+PiBTb3JyeSBmb3IgdGhlIGxhdGUgYW5zd2VyLg0KPj4NCj4+IE9uIDExLzEw
LzIwMTkgMjA6MDcsIEJyaWFuIFdvb2RzIHdyb3RlOg0KPj4+IFdoaWNoIGlzIHdoeSBJIHdhbnRl
ZCB0byBwdXQgaXQgd2hlcmUgaXQgd2FzIGluIHRoZSBwYXRjaC4gIFdoZXJlIHRoZQ0KPj4+IHVz
ZXIgd291bGQgc2VlIHRoZSB3YXJuaW5nIGFmdGVyIHRoZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
bWVtb3J5DQo+Pj4gbW9kdWxlcyB3ZXJlIHByaW50ZWQgKGFuZCBmYWlyIGVhcmx5KS4NCj4+DQo+
PiBJIGhhZCBhIHRoaW5rIGFib3V0IGl0LCBkdW1waW5nIHRoZSBtb2R1bGVzIGluZm9ybWF0aW9u
cyBiZWZvcmUgaXMgdXNlZnVsIGlmDQo+PiB5b3Uga25vdyB0aGF0IHlvdSBoYXZlIG9uZSBtb2R1
bGUgbWF4IHBlciBraW5kLiBTbyB5b3UgYXZvaWQgdG8gcHJpbnQgdGhlDQo+PiBtb2R1bGVzIGFk
ZHJlc3Mvc2l6ZSBpbiB0aGUgd2FybmluZy4NCj4+DQo+PiBIb3dldmVyLCBpdCBpcyBwb3NzaWJs
ZSB0byBoYXZlIG11bHRpcGxlIGtlcm5lbCBtb2R1bGUgKGFzIGxvbmcgYXMgdGhleQ0KPj4gZG9u
J3QgaGF2ZSB0aGUgc2FtZSBzdGFydCBhZGRyZXNzKSwgeW91IGNvdWxkIGVuZCB1cCB3aXRoIHRo
ZSBmb2xsb3dpbmcNCj4+IG1lc3NhZ2U6DQo+Pg0KPj4gIldBUk5JTkc6IG1vZHVsZXMgS2VybmVs
IGFuZCBLZXJuZWwgb3ZlcmxhcCINCj4+DQo+PiBUbyBtYWtlIHRoZSBtZXNzYWdlIG1vcmUgbWVh
bmluZ2Z1bCwgd2Ugd291bGQgbmVlZCB0byBwcmludCB0aGUgbW9kdWxlcw0KPj4gYWRkcmVzcy9z
aXplLiBUaGVyZWZvcmUsIEkgZG9uJ3QgdmlldyB0aGF0IGl0IGlzIGltcG9ydGFudCB0byBjaGVj
aw0KPj4gb3ZlcmxhcHBpbmcgaW4gZWFybHlfcHJpbnRfaW5mbygpLiBJbiB0aGlzIGNhc2UgSSB3
b3VsZCBmYXZvciBhbnkgY29kZSB0aGF0DQo+PiBkb24ndCBhZGQgYSBkb3VibGUgZm9yIGxvb3Au
DQo+IA0KPiBXZWxsLCBhZGRpbmcgdGhhdCBpbmZvcm1hdGlvbiB3b3VsZCBiZSBlYXN5IGVub3Vn
aCBhbmQgY2hlYXAuICBJdCB3b3VsZA0KPiBtYWtlIGl0IG11bHRpbGluZSBwcmlua3RrIHRob3Vn
aDoNCj4gV0FSTklORzogbWVtb3J5IG1vZHVsZXMgb3ZlciBsYXA6DQo+IAlzdGFydF9hZGRyLWVu
ZF9hZGRyOiBtb2R1bGVuYW1lDQo+IAlzdGFydF9hZGRyLWVuZF9hZGRyOiBtb2R1bGVuYW1lDQoN
CldoeSBkbyB5b3UgbmVlZCBhIG11bHRpbGluZT8gQSBzaW5nbGUgODAtY2hhcmF0ZXJzIHNob3Vs
ZCByZWFsbHkgYmUgDQpzdWZmaWNpZW50Lg0KDQo+IA0KPiBJZiB3ZSdyZSBub3QgZG9pbmcgdGhh
dCB0aG91Z2gsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBhIGluaXRkYXRhDQo+IGJvb2wg
dGhhdCBjaGVja3MgaXQgaW4gYWRkX2Jvb3RfbW9kdWxlKCkgYW5kIHRoZW4gcHJpbnRzIGEgc2lt
cGxlDQo+IHdhcm5pbmcgdGhhdCB0aGVyZSdzIGEgbWVtb3J5IG1vZHVsZSBvdmVybGFwIGluIGVh
cmx5X3ByaW50X2luZm8oKT8NCj4gVGhhdCB3YXkgdGhlcmUncyBubyBuZXN0ZWQgZm9yIGxvb3Ag
YW5kIGl0IGdldHMgcHJpbnRlZCB3aGVyZSBhbGwgdGhlDQo+IGFkZHJlc3NlcyBnZXQgcHJpbnRl
ZCAoc28geW91IGNhbiBhY3R1YWxseSBmaWd1cmUgb3V0IHdoZXJlIHRoZSBvdmVybGFwDQo+IGlz
KS4NClBsZWFzZSBuby4gVGhlcmUgYXJlIG5vIG5lZWQgdG8gYWRkIGEgYm9vbCBqdXN0IGZvciB0
aGUgc2FrZSBvZiBnZXR0aW5nIA0KYWxsIHRoZSBwcmludCB0b2dldGhlci4NCg0KVGhlIG1vcmUg
dGhhdCBpZiB5b3UgcHJpbnQgYWxsIHRoZSBpbmZvcm1hdGlvbiBhcyBJIHN1Z2dlc3RlZCBhYm92
ZSwgeW91IA0KZG9uJ3QgbmVlZCB0byBoYXZlIGl0IHByaW50ZWQgYnkgZWFybHlfcHJpbnRfaW5m
bygpLg0KDQpUbyBiZSBob25lc3QsIEkgcmVhbGx5IGRvbid0IHRoaW5rIHRoaXMgaXMgWGVuIGpv
YiB0byBjaGVjayB0aGF0IHlvdSANCnNwZWNpZnkgeW91ciBtb2R1bGVzIGNvcnJlY3RseS4gVGhl
cmUgYXJlIG90aGVyIHdheSB0byBzY3JldyB1cCB5b3VyIA0KZGV2aWNlLXRyZWUgYW55d2F5IChs
aWtlIG92ZXJsYXAgaW4gbWVtb3J5IGJhbmtzIG9yIHJlc2VydmVkIHJlZ2lvbi4uLikuDQoNClRo
ZSBtb2R1bGVzIG92ZXJsYXAgY2FuIHJlYWxseSBvbmx5IGhhcHBlbiBpZiB5b3UgdHJ5IHRvIGhh
dmUgeW91ciBEVCANCnByZS1nZW5lcmF0ZWQgYW5kIGRvbid0IGJvdGhlciB0byB1c2UgdGhlIGJv
b3Rsb2FkZXIgKFUtYm9vdC9HcnViKSANCnNjcmlwdCB0byBnZW5lcmF0ZSB5b3VyIERUL21vZHVs
ZXMuDQoNCj4gDQo+PiBXaGlsZSB0aGlua2luZyBhYm91dCB0aGlzIGNhc2UsIGl0IG1hZGUgbWUg
cmVhbGl6ZSB0aGF0IHdlIG9ubHkgY2hlY2sgdGhlDQo+PiBzdGFydCBhZGRyZXNzIHRvIGNvbnNp
ZGVyIGEgbWF0Y2guIFRoaXMgbWVhbnMgaWYgdGhlIHNpemUgaXMgZGlmZmVyZW50LCB0aGVuDQo+
PiBpdCB3aWxsIGJlIGlnbm9yZWQuIEkgdGhpbmsgd2Ugb3VnaHQgdG8gdGhyb3cgYXQgbGVhc3Qg
d2FybmluZyBmb3IgdGhpcyBjYXNlDQo+PiBhcyB3ZWxsLg0KPj4NCj4+IFdvdWxkIHlvdSBtaW5k
IHRvIGhhdmUgYSBsb29rPw0KPiANCj4gV2hlbiB5b3Ugc2F5IHN0YXJ0aW5nIGFkZHJlc3MsIGRv
IHlvdSBtZWFuIGxpa2UgaW4gdGhlIG9yZ2luYWwgcGF0Y2g/DQo+IElmIHNvLCB0aGVyZSdzIG5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGluIGNoZWNraW5nIHRoZSBzdGFydHMgb2YgbiBvbiBtIGFuZA0K
PiBtIG9uIG4gdGhlbiBjaGVja2luZyB0aGUgc3RhcnQgYW5kIGVuZCBvZiBuIG9uIG0uDQoNCk5v
LiBJIG1lYW50IHRoYXQgeW91IGNvdWxkIGhhdmUgYSBkZXZpY2UtdHJlZSBkZXNjcmliaW5nIHR3
byBtb2R1bGVzIA0Kc3RhcnRpbmcgYXQgdGhlIHNhbWUgYWRkcmVzcywgYnV0IHdpdGggYSBkaWZm
ZXJlbnQgc2l6ZS4NCg0KU2VlIHRoZSBjaGVjayBpbiBhZGRfYm9vdF9tb2R1bGUoKSB0byBzZWUg
aWYgYSBtb2R1bGUgYWxyZWFkeSBleGlzdCBvZiANCnRoZSBzYW1lIGtpbmQuDQoNCkNoZWVycywN
Cg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
