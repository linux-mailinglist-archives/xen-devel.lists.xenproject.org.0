Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F892223C1A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQCD-00084l-Ht; Fri, 17 Jul 2020 13:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQCC-00084g-QA
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:14:36 +0000
X-Inumbo-ID: 75ac27e6-c82f-11ea-b7bb-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75ac27e6-c82f-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGlWvLunnNEPD3F17cNmd24B3IWMU6l8zKXPOJpOy4c=;
 b=44XBSM3Wa6VjJ7JdhrY47XlqGj7JZWmmRCJw3trt9DYgw+m1t3uHlIc0FOQse+SNHFjp2APB79UXBry4fa884RRuQu/7u8cULxIh4sGU0NrvcZ7iyaA6XV/RaZuV3GlcIhX2p0Yzk2/T2aZXpVfLx38rzs7TRp1v8Guy2A7Gv5Y=
Received: from AM6PR10CA0032.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::45)
 by AM6PR08MB5045.eurprd08.prod.outlook.com (2603:10a6:20b:e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 13:14:34 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::3b) by AM6PR10CA0032.outlook.office365.com
 (2603:10a6:209:89::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 13:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:14:33 +0000
Received: ("Tessian outbound 7de93d801f24:v62");
 Fri, 17 Jul 2020 13:14:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 637464a434bbbee5
X-CR-MTA-TID: 64aa7808
Received: from c0f236bb3e6e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 741FE4C6-8D78-4DFF-A975-D5A554EBA72F.1; 
 Fri, 17 Jul 2020 13:14:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0f236bb3e6e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4W89KzXozt+dp0K8D6k+A1VviZCAzLtsdeGYi0QclUukekfsnuNpoMu6husxI+k5KmmjEJ70fhlAuTGO99tx2tJ87XYlHqNW7gSXyA7OTwQq44sTbV0y7eSmr9reXLrf0Q3PdMCW2wIy/3WEWW1LAc2skqmHh2Lrc9XbPMGAVV1SNzAdyWv0wxyO1ClpV0irzrbd9kl1vNfqn8xu6MPn89fJ8aAh0AZJm1Qo1Jmc2LYNDcOBNq29gyk5zndChiG2qtWdjSASMXUy9bebE3mM9yO4vV/AVmukkBFdTL7jNNrrPp1faWnjQdA5daDROU7arh+7plb3tPWeTL0ryJEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGlWvLunnNEPD3F17cNmd24B3IWMU6l8zKXPOJpOy4c=;
 b=ck3RF6traEq3h0MygKJ3UvUdoGZJC2Ic/XzmV9Qcnhv72GJ+1WPxA/Rkyr88d0SasUVlHvRCRMaBAuX9NlAa5wuNIyEefQe0Es+oM4KTgXX1TPiWOhDsViV3IrXwJXhMzwkMmeomWUuuPE2w8tzcl1dckiL90EH13xR0HiDmhV0XHZ38eZ8qPGk+6d4ptg+R0JU6f8HRFUsXBwqHs3R1jS5dq/qbgfp08zEkUWJ1IG3NqApnHIqGFrSbFJSL/p0dJOaPo6D4ySNbYwI9X2doD5ifDUonoJBVt4nZ3IrsMcyr/gnLKN4kyPfpD/lJDxBKxhTen8cmBJUdIF7TzfapGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGlWvLunnNEPD3F17cNmd24B3IWMU6l8zKXPOJpOy4c=;
 b=44XBSM3Wa6VjJ7JdhrY47XlqGj7JZWmmRCJw3trt9DYgw+m1t3uHlIc0FOQse+SNHFjp2APB79UXBry4fa884RRuQu/7u8cULxIh4sGU0NrvcZ7iyaA6XV/RaZuV3GlcIhX2p0Yzk2/T2aZXpVfLx38rzs7TRp1v8Guy2A7Gv5Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3515.eurprd08.prod.outlook.com (2603:10a6:10:50::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 13:14:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 13:14:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWA
Date: Fri, 17 Jul 2020 13:14:25 +0000
Message-ID: <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
In-Reply-To: <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:d5e3:98:5df0:fb15]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b3d741c-b10f-4463-6c35-08d82a5358df
x-ms-traffictypediagnostic: DB7PR08MB3515:|AM6PR08MB5045:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5045D1D7E033625A53B281DD9D7C0@AM6PR08MB5045.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QD1AU8fybUrO2/OvhxnnWUQiMNS6xAfWhV5iGZg+2dyCrDYtpzNgZxx4Ss/eLy0LWzBd8TlRurjIn+78hY2qq1i5ZsC1Kyzb/AFoPwdPKSW8ppSOcVXuUxceuhVU94Pgkl0PlylZtowPSbyMmOolMqFsbp34Ysg417qc9odOCgv4rogZShyf54CMT7TkJEC4ngbHiGwyqC65zm22xCSH5m2wSpaKKVoyhEj7G+voN22XG6FCSNL61hjk4zEU1Yn2HGp58LYmVakZ8hangIdyFX7srhhsacTKPYVlyy5+CQ8NSzlcT0slclK49mehbSSpj3+/No4WmDQFHg5r8nVQuQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(33656002)(54906003)(8936002)(8676002)(66476007)(66556008)(64756008)(66946007)(66446008)(186003)(498600001)(6506007)(53546011)(4326008)(2906002)(2616005)(76116006)(91956017)(6916009)(36756003)(6486002)(6512007)(86362001)(5660300002)(71200400001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Y9TSmBLfSaFlSJhC0DLv6mG/M4ElwgSD6R4r1rtz301CC2nE9IZpyKBC9e5fK2u6BqCAgAklq6YQ/JSHexlbQUZAwDWRC6W7pv7qymn/4Mxoq/zAYhKSJsTUd06gASBOtdZL+13Az7bIcgltuS2pmVCzcGJ/57bOR/hBPEFvLKn3B9dBuuEZZSNFJHKgY7Rfci/ROrYGzdOTv/D9oapPyNuOkgFVD1PKVBKSNWI6HvOKeweI4VARdc9kiqNQTX8aPVKlsVFHi0JjtAEqbVmXUDVLZNe+D4pIxZLAF51t4CiPgb8DMITfvFFZkENrFDwthTn9uMYi6OohKIOdBr4V5c2p+jdAButdOvA4wxaXtGQnAVaJWTa5LOTTe7563U/e07r6qvdQki5E5bRgtTG7geyBeJ5o6EoRjFDzcV9dYLHUXFOd6HgOMX5hV9gaLk3gtBtibhtv4IuWkziIOEoRWRyvALaWaqT/oAoDk8jrl0EsPms4+0K1neDyhq9ZscVq1J1IpK3zZFly9YW4fyfnU6euftaQUYsnYIjr6CGCWQA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E631FCF5DA73FB468672B83581ABFE65@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3515
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(107886003)(70586007)(8936002)(6506007)(5660300002)(2616005)(4326008)(82740400003)(2906002)(36756003)(186003)(8676002)(53546011)(70206006)(336012)(6862004)(26005)(47076004)(33656002)(83380400001)(316002)(82310400002)(356005)(6512007)(81166007)(6486002)(478600001)(54906003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3966fed9-2f39-45d2-9973-08d82a535429
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMMK21H4Gda01ubTRpqjaAaMK5SuFSzSSxqo+bd5E85IKqhoL971Vj483+sq+d0ghltRFdskZ/LyUcPXSgHXgHKMX1LYoY4+2/IkW6ykiPppdw+shkWuavqgZt7DZ21a6avZpP/eLRlEHgYn6A2infi4SMG0Aq5a45G0OWrYImXwEa0iA/HM8LBcbELN2TPD9n0YPyn3NVV9I8O/z3xIpGzAFHsGJSg40Ii7D2D5o5K/HRbUjnZqnH8PszB4zG1woi81xZ6Sqm9TgvOi/VZbqHudeEqR9xW3vS9okUhbkiOgrV+RCXBpcLkUfg4OxT1cR7J6/6V2iqpoJdE1uIFLGrxEAQN1MzaB0VIQOX0OFDyVMv1ySOauWTEYVPm4tv4IyySPFGusuAkORDiKmf5nVw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:14:33.3135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d741c-b10f-4463-6c35-08d82a5358df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5045
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDEwOjEwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTYuMDcuMjAyMCAxOToxMCwgUmFodWwgU2luZ2ggd3Jv
dGU6DQo+PiAjIERpc2NvdmVyaW5nIFBDSSBkZXZpY2VzOg0KPj4gDQo+PiBQQ0ktUENJZSBlbnVt
ZXJhdGlvbiBpcyBhIHByb2Nlc3Mgb2YgZGV0ZWN0aW5nIGRldmljZXMgY29ubmVjdGVkIHRvIGl0
cyBob3N0LiBJdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGhhcmR3YXJlIGRvbWFpbiBv
ciBib290IGZpcm13YXJlIHRvIGRvIHRoZSBQQ0kgZW51bWVyYXRpb24gYW5kIGNvbmZpZ3VyZSB0
aGUgQkFSLCBQQ0kgY2FwYWJpbGl0aWVzLCBhbmQgTVNJL01TSS1YIGNvbmZpZ3VyYXRpb24uDQo+
PiANCj4+IFBDSS1QQ0llIGVudW1lcmF0aW9uIGluIFhFTiBpcyBub3QgZmVhc2libGUgZm9yIHRo
ZSBjb25maWd1cmF0aW9uIHBhcnQgYXMgaXQgd291bGQgcmVxdWlyZSBhIGxvdCBvZiBjb2RlIGlu
c2lkZSBYZW4gd2hpY2ggd291bGQgcmVxdWlyZSBhIGxvdCBvZiBtYWludGVuYW5jZS4gQWRkZWQg
dG8gdGhpcyBtYW55IHBsYXRmb3JtcyByZXF1aXJlIHNvbWUgcXVpcmtzIGluIHRoYXQgcGFydCBv
ZiB0aGUgUENJIGNvZGUgd2hpY2ggd291bGQgZ3JlYXRseSBpbXByb3ZlIFhlbiBjb21wbGV4aXR5
LiBPbmNlIGhhcmR3YXJlIGRvbWFpbiBlbnVtZXJhdGVzIHRoZSBkZXZpY2UgdGhlbiBpdCB3aWxs
IGNvbW11bmljYXRlIHRvIFhFTiB2aWEgdGhlIGJlbG93IGh5cGVyY2FsbC4NCj4+IA0KPj4gI2Rl
ZmluZSBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgICAgICAgIDI1DQo+PiBzdHJ1Y3QgcGh5c2Rl
dl9wY2lfZGV2aWNlX2FkZCB7DQo+PiAgICB1aW50MTZfdCBzZWc7DQo+PiAgICB1aW50OF90IGJ1
czsNCj4+ICAgIHVpbnQ4X3QgZGV2Zm47DQo+PiAgICB1aW50MzJfdCBmbGFnczsNCj4+ICAgIHN0
cnVjdCB7DQo+PiAgICAJdWludDhfdCBidXM7DQo+PiAgICAJdWludDhfdCBkZXZmbjsNCj4+ICAg
IH0gcGh5c2ZuOw0KPj4gICAgLyoNCj4+ICAgICogT3B0aW9uYWwgcGFyYW1ldGVycyBhcnJheS4N
Cj4+ICAgICogRmlyc3QgZWxlbWVudCAoWzBdKSBpcyBQWE0gZG9tYWluIGFzc29jaWF0ZWQgd2l0
aCB0aGUgZGV2aWNlIChpZiAqIFhFTl9QQ0lfREVWX1BYTSBpcyBzZXQpDQo+PiAgICAqLw0KPj4g
ICAgdWludDMyX3Qgb3B0YXJyW1hFTl9GTEVYX0FSUkFZX0RJTV07DQo+PiAgICB9Ow0KPj4gDQo+
PiBBcyB0aGUgaHlwZXJjYWxsIGFyZ3VtZW50IGhhcyB0aGUgUENJIHNlZ21lbnQgbnVtYmVyLCBY
RU4gd2lsbCBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UgYmFzZWQgb24gdGhpcyBzZWdtZW50
IG51bWJlciBhbmQgZmluZCB0aGUgaG9zdC1icmlkZ2UgY29ycmVzcG9uZGluZyB0byB0aGlzIHNl
Z21lbnQgbnVtYmVyLiBBdCB0aGlzIHN0YWdlIGhvc3QgYnJpZGdlIGlzIGZ1bGx5IGluaXRpYWxp
emVkIHNvIHRoZXJlIHdpbGwgYmUgbm8gaXNzdWUgdG8gYWNjZXNzIHRoZSBjb25maWcgc3BhY2Uu
DQo+PiANCj4+IFhFTiB3aWxsIGFkZCB0aGUgUENJIGRldmljZXMgaW4gdGhlIGxpbmtlZCBsaXN0
IG1haW50YWluIGluIFhFTiB1c2luZyB0aGUgZnVuY3Rpb24gcGNpX2FkZF9kZXZpY2UoKS4gWEVO
IHdpbGwgYmUgYXdhcmUgb2YgYWxsIHRoZSBQQ0kgZGV2aWNlcyBvbiB0aGUgc3lzdGVtIGFuZCBh
bGwgdGhlIGRldmljZSB3aWxsIGJlIGFkZGVkIHRvIHRoZSBoYXJkd2FyZSBkb21haW4uDQo+IA0K
PiBIYXZlIHlvdSBoYWQgYW55IHRob3VnaHRzIGFib3V0IERvbTAgcmUtYXJyYW5naW5nIHRoZSBi
dXMgbnVtYmVyaW5nPw0KPiBUaGlzIGlzLCBhZmFpY3QsIGEgc3RpbGwgb3BlbiBpc3N1ZSBvbiB4
ODYgYXMgd2VsbC4NCg0Kbm8gdGhhdOKAmXMgbm90IHNvbWV0aGluZyB3ZSBsb29rZWQgaW50by4g
QnV0IGluIHRoZW9yeSBpZiB0aGlzIGlzIGRvbmUgYnkgTGludXggYmVmb3JlIFhlbiBlbnVtZXJh
dGlvbiB0aGlzIHdpbGwgd29yay4gSWYgYSBkb21haW4gaXMgdHJ5aW5nIHRvIGRvIHRoaXMgd2Ug
aGF2ZSB0byBsb29rIGlmIHdlIGNhbiBzb21laG93IHN1cHBvcnQgdGhpcyBpbiBWUENJIGJ1dCB0
aGF0IGlzIHNvbWV0aGluZyB3ZSBkaWQgbm90IGNvbnNpZGVyIHNvIGZhci4gDQoNCj4gDQo+PiBM
aW1pdGF0aW9uczoNCj4+ICogV2hlbiBQQ0kgZGV2aWNlcyBhcmUgYWRkZWQgdG8gWEVOLCBNU0kg
Y2FwYWJpbGl0eSBpcyBub3QgaW5pdGlhbGl6ZWQgaW5zaWRlIFhFTiBhbmQgbm90IHN1cHBvcnRl
ZCBhcyBvZiBub3cuDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBwcmV0dHkgc2V2ZXJlIGxpbWl0
YXRpb24sIGFzIG1vZGVybiBkZXZpY2VzIHRlbmQgdG8NCj4gbm90IHN1cHBvcnQgcGluIGJhc2Vk
IGludGVycnVwdHMgYW55bW9yZS4NCg0KU29ycnkgdGhpcyBpcyBub3Qgd2hhdCB3ZSBtZWFudC4g
V2Ugd2lsbCBhZGQgTVNJIHN1cHBvcnQgYnV0IGFzIG9mIG5vdyB0aGlzIGlzIG5vdCBpbXBsZW1l
bnRlZCBvciBkZXNpZ25lZC4g4oCcTGltaXRhdGlvbnPigJ0gbWVhbnMgY3VycmVudGx5IG5vdCBz
dXBwb3J0ZWQgYnV0IHdlIHdpbGwgd29yayBvbiBpdCBvbiBhIHNlY29uZCBzdGVwLg0KDQo+IA0K
Pj4gIyBFbXVsYXRlZCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiBsaWJ4bDoNCj4+IA0KPj4gTGli
eGwgaXMgY3JlYXRpbmcgYSB2aXJ0dWFsIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZp
Y2UgdHJlZSB0byBlbmFibGUgdGhlIGd1ZXN0IE9TIHRvIGRpc2NvdmVyIHRoZSB2aXJ0dWFsIFBD
SSBkdXJpbmcgZ3Vlc3QgYm9vdC4gV2UgaW50cm9kdWNlZCB0aGUgbmV3IGNvbmZpZyBvcHRpb24g
W3ZwY2k9InBjaV9lY2FtIl0gZm9yIGd1ZXN0cy4gV2hlbiB0aGlzIGNvbmZpZyBvcHRpb24gaXMg
ZW5hYmxlZCBpbiBhIGd1ZXN0IGNvbmZpZ3VyYXRpb24sIGEgUENJIGRldmljZSB0cmVlIG5vZGUg
d2lsbCBiZSBjcmVhdGVkIGluIHRoZSBndWVzdCBkZXZpY2UgdHJlZS4NCj4gDQo+IEkgc3VwcG9y
dCBTdGVmYW5vJ3Mgc3VnZ2VzdGlvbiBmb3IgdGhpcyB0byBiZSBhbiBvcHRpb25hbCB0aGluZywg
aS5lLg0KPiB0aGVyZSB0byBiZSBubyBuZWVkIGZvciBpdCB3aGVuIHRoZXJlIGFyZSBQQ0kgZGV2
aWNlcyBhc3NpZ25lZCB0byB0aGUNCj4gZ3Vlc3QgYW55d2F5LiBJIGFsc28gd29uZGVyIGFib3V0
IHRoZSBwY2lfIHByZWZpeCBoZXJlIC0gaXNuJ3QNCj4gdnBjaT0iZWNhbSIgYXMgdW5hbWJpZ3Vv
dXM/DQoNClRoaXMgY291bGQgYmUgYSBwcm9ibGVtIGFzIHdlIG5lZWQgdG8ga25vdyB0aGF0IHRo
aXMgaXMgcmVxdWlyZWQgZm9yIGEgZ3Vlc3QgdXBmcm9udCBzbyB0aGF0IFBDSSBkZXZpY2VzIGNh
biBiZSBhc3NpZ25lZCBhZnRlciB1c2luZyB4bC4gDQpSZWdhcmRpbmcgdGhlIG5hbWluZywgSSBh
Z3JlZS4gV2Ugd2lsbCByZW1vdmUgdGhlIHBjaV8gcHJlZml4IGhlcmUuIA0KPiANCj4+IEEgbmV3
IGFyZWEgaGFzIGJlZW4gcmVzZXJ2ZWQgaW4gdGhlIGFybSBndWVzdCBwaHlzaWNhbCBtYXAgYXQg
d2hpY2ggdGhlIFZQQ0kgYnVzIGlzIGRlY2xhcmVkIGluIHRoZSBkZXZpY2UgdHJlZSAocmVnIGFu
ZCByYW5nZXMgcGFyYW1ldGVycyBvZiB0aGUgbm9kZSkuIEEgdHJhcCBoYW5kbGVyIGZvciB0aGUg
UENJIEVDQU0gYWNjZXNzIGZyb20gZ3Vlc3QgaGFzIGJlZW4gcmVnaXN0ZXJlZCBhdCB0aGUgZGVm
aW5lZCBhZGRyZXNzIGFuZCByZWRpcmVjdHMgcmVxdWVzdHMgdG8gdGhlIFZQQ0kgZHJpdmVyIGlu
IFhlbi4NCj4+IA0KPj4gTGltaXRhdGlvbjoNCj4+ICogT25seSBvbmUgUENJIGRldmljZSB0cmVl
IG5vZGUgaXMgc3VwcG9ydGVkIGFzIG9mIG5vdy4NCj4+IA0KPj4gQkFSIHZhbHVlIGFuZCBJT01F
TSBtYXBwaW5nOg0KPj4gDQo+PiBMaW51eCBndWVzdCB3aWxsIGRvIHRoZSBQQ0kgZW51bWVyYXRp
b24gYmFzZWQgb24gdGhlIGFyZWEgcmVzZXJ2ZWQgZm9yIEVDQU0gYW5kIElPTUVNIHJhbmdlcyBp
biB0aGUgVlBDSSBkZXZpY2UgdHJlZSBub2RlLiBPbmNlIFBDSQlkZXZpY2UgaXMgYXNzaWduZWQg
dG8gdGhlIGd1ZXN0LCBYRU4gd2lsbCBtYXAgdGhlIGd1ZXN0IFBDSSBJT01FTSByZWdpb24gdG8g
dGhlIHJlYWwgcGh5c2ljYWwgSU9NRU0gcmVnaW9uIG9ubHkgZm9yIHRoZSBhc3NpZ25lZCBkZXZp
Y2VzLg0KPj4gDQo+PiBBcyBvZiBub3cgd2UgaGF2ZSBub3QgbW9kaWZpZWQgdGhlIGV4aXN0aW5n
IFZQQ0kgY29kZSB0byBtYXAgdGhlIGd1ZXN0IFBDSSBJT01FTSByZWdpb24gdG8gdGhlIHJlYWwg
cGh5c2ljYWwgSU9NRU0gcmVnaW9uLiBXZSB1c2VkIHRoZSBleGlzdGluZyBndWVzdCDigJxpb21l
beKAnSBjb25maWcgb3B0aW9uIHRvIG1hcCB0aGUgcmVnaW9uLg0KPj4gRm9yIGV4YW1wbGU6DQo+
PiAJR3Vlc3QgcmVzZXJ2ZWQgSU9NRU0gcmVnaW9uOiAgMHgwNDAyMDAwMA0KPj4gICAgCVJlYWwg
cGh5c2ljYWwgSU9NRU0gcmVnaW9uOjB4NTAwMDAwMDANCj4+ICAgIAlJT01FTSBzaXplOjEyOE1C
DQo+PiAgICAJaW9tZW0gY29uZmlnIHdpbGwgYmU6ICAgaW9tZW0gPSBbIjB4NTAwMDAsMHg4MDAw
QDB4NDAyMCJdDQo+IA0KPiBUaGlzIHN1cmVseSBpcyBwbGFubmVkIHRvIGdvIGF3YXkgYmVmb3Jl
IHRoZSBjb2RlIGhpdHMgdXBzdHJlYW0/IFRoZQ0KPiByYW5nZXMgcmVhbGx5IHNob3VsZCBiZSBy
ZWFkIG91dCBvZiB0aGUgQkFScywgYXMgSSBzZWUgdGhlDQo+ICJsaW1pdGF0aW9ucyIgc2VjdGlv
biBmdXJ0aGVyIGRvd24gc3VnZ2VzdHMsIGJ1dCBpdCdzIG5vdCBjbGVhcg0KPiB3aGV0aGVyICJs
aW1pdGF0aW9ucyIgYXJlIGl0ZW1zIHRoYXQgeW91IHBsYW4gdG8gdGFrZSBjYXJlIG9mIGJlZm9y
ZQ0KPiBzdWJtaXR0aW5nIHlvdXIgY29kZSBmb3IgcmV2aWV3Lg0KDQpkZWZpbml0ZWx5IHllcy4g
QXMgc2FpZCBiZWZvcmUgdGhlIGxpbWl0YXRpb25zIGFyZSBpbiB0aGUgUkZDIHdlIHdpbGwgc3Vi
bWl0IGJ1dCB3ZSB3aWxsIHdvcmsgb24gdGhhdCBhbmQgcmVtb3ZlIHRob3NlIGxpbWl0YXRpb25z
IGJlZm9yZSBzdWJtaXR0aW5nIHRoZSBmaW5hbCBjb2RlIGZvciByZXZpZXcuIA0KDQpCZXJ0cmFu
ZCBhbmQgUmFodWwNCg0KPiANCj4gSmFuDQo+IA0KDQo=

