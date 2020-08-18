Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034D2481E9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xwV-0008Qt-4Q; Tue, 18 Aug 2020 09:30:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k7xwT-0008Iy-99
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:30:05 +0000
X-Inumbo-ID: 9e22e25a-0d6f-4dbe-9958-c3018cb9f189
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e22e25a-0d6f-4dbe-9958-c3018cb9f189;
 Tue, 18 Aug 2020 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+hN/ZL+/D4xi/iez+DKYsd8NJlhtV+53iViVMBj6qY=;
 b=WE28M/Hd/SQaz/o/svwMJEwY3NAZrEhM6APTboqakFnTwrMCrQRB9q2kUuuR0whARum+zKPiaURIpM7tbEKRxyOBfTkeNX02TEVbpPCQPNE/4o23KICFV6IC0r+0HuxqBheTrQcHnJ0MlX7cKwBu6bv7mRluF+5roIfDJ8PTgmw=
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by AM0PR08MB3857.eurprd08.prod.outlook.com (2603:10a6:208:104::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 09:30:01 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::72) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 18 Aug 2020 09:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 09:30:01 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Tue, 18 Aug 2020 09:30:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce120489351d0016
X-CR-MTA-TID: 64aa7808
Received: from 83256355b231.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F96BC9D0-093B-4C76-8F24-3BF57FF9FB6C.1; 
 Tue, 18 Aug 2020 09:29:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83256355b231.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 09:29:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh8J4jZK68UfClcPsZ8Bwex1jQAg0jqhbi6++FyGYaZlli1aZgQtIne5/z0tsoCRPZfUPBLi9JqiH8joCEQW0Jb+VzPmletJHFaq729pM813C1wnv986oAshay7oXkY/S2blcGBPZQ0dABS3Twxpb4pIOxUAkHxUtZwgPeGF6uBQ/Z63EX5LKmOgF/qx3+Y+BKkeDt1Abni/jbdFL0ELZ9staNS9moEbW5dgX64pkhDKVftGcuvIL87DZfpkp9V4t4JaZB2V+tCWS+kKpRZvZqevJojLK0/n40OYGpNxZUXT7/gO1hXuX/boEAXZ6szINxxTuqVXpkYxQezBIKN1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+hN/ZL+/D4xi/iez+DKYsd8NJlhtV+53iViVMBj6qY=;
 b=GbpPV+BIKF5S4/UeXnvioO8tSNGkQJnAVfQ0QzobOWRXAUnHf/CgaXZaHWH1BcS+gN3nrmnFKavu04/Bn3RueVTXqdY9a5OXVDl4BTl/7+nG7x2F7lhBB2mCg/zZYjFyKLO7Wkddinc/kc/JtFH0wqfuDGHxTmnxrg649qc8H+HMzvnNLE5fWw4euLOOLKXAFy3vDjypZRmZ1iz5Hu5pPC9j/Cpu295MKZK9Zb99kIQOq3aYPlXJfOeGANi4VVsRyGVzOkDPhJTMuYpxEpOR4SQh7IKaWPLz6QaePYhTn2ktuzu6ltJM0c1TkRMrv7EkGBrM5zqWmewIA21j214OSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+hN/ZL+/D4xi/iez+DKYsd8NJlhtV+53iViVMBj6qY=;
 b=WE28M/Hd/SQaz/o/svwMJEwY3NAZrEhM6APTboqakFnTwrMCrQRB9q2kUuuR0whARum+zKPiaURIpM7tbEKRxyOBfTkeNX02TEVbpPCQPNE/4o23KICFV6IC0r+0HuxqBheTrQcHnJ0MlX7cKwBu6bv7mRluF+5roIfDJ8PTgmw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2438.eurprd08.prod.outlook.com (2603:10a6:4:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Tue, 18 Aug
 2020 09:29:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 09:29:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Paul Durrant
 <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, nd <nd@arm.com>
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Topic: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Index: AQHWZp4X4KUogf6E0E+1j1OVzKuR+6khkG4AgBZ+qACABZ0DAIAAAkgAgAAB6QCAAATRAIAAAegA
Date: Tue, 18 Aug 2020 09:29:52 +0000
Message-ID: <226D798C-4F67-408F-A2AE-45B184418D80@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
 <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
 <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
 <2F8934A8-A334-4D11-A986-71E2081419B9@arm.com>
 <4f2982bb-c352-46a0-da73-58b9db45c28a@xen.org>
In-Reply-To: <4f2982bb-c352-46a0-da73-58b9db45c28a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50a4ec28-d145-459d-f6c2-08d843594820
x-ms-traffictypediagnostic: DB6PR0802MB2438:|AM0PR08MB3857:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3857681DFF2EF7EEDDC3A0109D5C0@AM0PR08MB3857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /qzgIfIC3VwlEj7dKZDzr7nHfzIlEvUdH0RPGQ90kCshA+omwbWMes+y2WuAoECFOSg7qwV+TGclL8+JZ6hSpwcUZ1gusWjuesaghOgIXVKvaC/fP1i49nw2jGEvicsz0sIKPjQsrnyHIzdJT5XDLXHFW3hpYw1kt+lma3y/aJJCydMo5bjhB9B4iu+PHl64YZuu3KVWGlbzz3as+lH/ynzt3eN0Nt3GKxSIss+hcgRgQXDliPha/XUmWC5Ik9+6RanJYbNYgEhGePbcHK7ZgjG4s7dceF44HeqYqEJE4UnGnAjaSUUu1ELIEJ1OePDa2zu97sHq1Vb5hR14mKrGng==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(91956017)(64756008)(4326008)(26005)(8936002)(66946007)(33656002)(316002)(71200400001)(5660300002)(66556008)(83380400001)(186003)(2616005)(76116006)(66476007)(66446008)(36756003)(6916009)(7416002)(86362001)(54906003)(6506007)(2906002)(6486002)(53546011)(6512007)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wW4wWgrfXQC9uOnVX3QUYjDh0NHsIA93go8h+Aux7QN7meqexF23J6UDeUTvmGkz4GUmmhU70bEjdZNSEHV4MWM+WdTNgqzbBDVan4APn/H9YLa6Mt6IGZrDM8oUx7IZgD05bi0Uqb0DKI28AiVpfHVPWMAqMsCh/nMT2h6/ErIIXy3j+E+RdFuMFVgCmVk4FPZ6OVQUJX1+q18/zRHYGD9O2zp442a1S/qssWdCTkoPB65YvoWR4pXjtQrXQlTCsmSCssv1+xFq9OqxFL4s5tDudE1SgquRmNnjCKKx/m1zGyDYsIuMzi1JamikJv6X7cIPmbIYwGmJADTcF4pqNrlwZuVO7ZyvzXHV0tUBK5ABe7fuQBFY65NsunKA6FOWRcIHiN1jCGsHdhEcm7sPj1OGPbxlrbpPhDhdzAuMbW7QSZZIbfBKdEacX5/+Wpz9dzka8XTFfFTysGDlznyGmqRN9eNCey+Bt3V/87ELlynxnybje8Q2RTlvka8g4hdADdwQz9Xq4C4iYBpbeShvVFeQtUuZFimFqEMl3FpqpVhVdj4kla1xer0qn04NxBnk5R0X1x083GMonFhywt57IuhqalFQepNdcRNsZBH63SvVySgP53g1R+1antCsX9LbT/xx0/EO7++kZg1VdY/iyA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <872E41B12681404EA60EB2A18C2912CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2438
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f779aab4-636f-4983-16fc-08d8435942e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 70ZLkzbFoGE8bOH1rfXvM7etDvSI4sDDYI4HcpBnRdvCHykNX57iuQ9JHS9RVWIlCHZIelY0I2BXDyPdCXlnWmYwwpdVpYlpzAwmdQtWiDUst4d9SlRvuiglM4vvzhn8z2ecOk4plmXWt0nQfuuhSpgkPHU/6EjFcxndBjHRr3iekEK6s6EY7J1GgK/gI5EkX8Ik5WySBqqqmtpms1XCHu48OH433zuwHr9JkhzeVegcEH1Twt+xGHFze4Fd4YJXDJeZmclOi3hXGYkImLBtyOJ0u20NxOfzsNZ5UtBWh/e5IIFtgOH7ruutckUv4Rh5WS9xb4NsAn43VxdmJZu0WM42E7tTrxS4UOIJQ3bTCJ9HXovJkcHJtDl5lBpYyQIfGkrqNdiGWEkwOSvzDVdVKA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(4326008)(33656002)(36756003)(70586007)(83380400001)(356005)(81166007)(6486002)(70206006)(336012)(82310400002)(47076004)(86362001)(8676002)(2906002)(8936002)(478600001)(82740400003)(5660300002)(6506007)(53546011)(54906003)(26005)(6512007)(6862004)(2616005)(316002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 09:30:01.4115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a4ec28-d145-459d-f6c2-08d843594820
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3857
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTggQXVnIDIwMjAsIGF0IDEwOjIzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTgvMDgvMjAyMCAxMDowNSwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+PiBPbiAxOCBBdWcgMjAyMCwgYXQgMDk6NTgsIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDE4LzA4
LzIwMjAgMDk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNC4wOC4yMDIwIDIxOjA3
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKYW4sDQo+Pj4+PiANCj4+Pj4+IE9uIDMx
LzA3LzIwMjAgMTI6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDMwLjA3LjIwMjAg
MjA6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9ubHkgYSBmZXcgcGxhY2VzIGFy
ZSBhY3R1YWxseSBpbmNsdWRpbmcgYXNtL2d1ZXN0X2FjY2Vzcy5oLiBXaGlsZSB0aGlzDQo+Pj4+
Pj4+IGlzIGZpbmUgdG9kYXksIGEgZm9sbG93LXVwIHBhdGNoIHdpbGwgd2FudCB0byBtb3ZlIG1v
c3Qgb2YgdGhlIGhlbHBlcnMNCj4+Pj4+Pj4gZnJvbSBhc20vZ3Vlc3RfYWNjZXNzLmggdG8geGVu
L2d1ZXN0X2FjY2Vzcy5oLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gVG8gcHJlcGFyZSB0aGUgbW92ZSwg
ZXZlcnlvbmUgc2hvdWxkIGluY2x1ZGUgeGVuL2d1ZXN0X2FjY2Vzcy5oIHJhdGhlcg0KPj4+Pj4+
PiB0aGFuIGFzbS9ndWVzdF9hY2Nlc3MuaC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEludGVyZXN0aW5n
bHksIGFzbS1hcm0vZ3Vlc3RfYWNjZXNzLmggaW5jbHVkZXMgeGVuL2d1ZXN0X2FjY2Vzcy5oLiBU
aGUNCj4+Pj4+Pj4gaW5jbHVzaW9uIGlzIG5vdyByZW1vdmVkIGFzIG5vLW9uZSBidXQgdGhlIGxh
dHRlciBzaG91bGQgaW5jbHVkZSB0aGUNCj4+Pj4+Pj4gZm9ybWVyLg0KPj4+Pj4+PiANCj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4+
PiANCj4+Pj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+
Pj4+IA0KPj4+Pj4+IElzIHRoZXJlIGFueSBjaGFuY2UgeW91IGNvdWxkIHRha2UgbWVhc3VyZXMg
dG8gYXZvaWQgbmV3IGluY2x1c2lvbnMNCj4+Pj4+PiBvZiBhc20vZ3Vlc3RfYWNjZXNzLmggdG8g
YXBwZWFyPw0KPj4+Pj4gDQo+Pj4+PiBJdCBzaG91bGQgYmUgcG9zc2libGUuDQo+Pj4+PiANCj4+
Pj4+IEhvdyBhYm91dCB0aGlzOg0KPj4+Pj4gDQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNj
ZXNzLmgNCj4+Pj4+IGluZGV4IGI5YTg5YzQ5NTUyNy4uZDhkYmM3Yzk3M2I0IDEwMDY0NA0KPj4+
Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaA0KPj4+Pj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaA0KPj4+Pj4gQEAgLTEsMyArMSw3IEBA
DQo+Pj4+PiArI2lmbmRlZiBBTExPV19JTkNMVURFX0FTTV9HVUVTVF9BQ0NFU1NfSA0KPj4+Pj4g
KyNlcnJvciAiYXNtL2d1ZXN0X2FjY2Vzcy5oIHNob3VsZCBub3QgYmUgaW5jbHVkZWQgZGlyZWN0
bHkiDQo+Pj4+PiArI2VuZGlmDQo+Pj4+PiArDQo+Pj4+PiAgI2lmbmRlZiBfX0FTTV9BUk1fR1VF
U1RfQUNDRVNTX0hfXw0KPj4+Pj4gICNkZWZpbmUgX19BU01fQVJNX0dVRVNUX0FDQ0VTU19IX18N
Cj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3RfYWNj
ZXNzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0X2FjY2Vzcy5oDQo+Pj4+PiBpbmRleCAz
Njk2NzZmMzFhYzMuLmU2NjVjYTNhMjdhZiAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3RfYWNjZXNzLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3RfYWNjZXNzLmgNCj4+Pj4+IEBAIC00LDYgKzQsMTAgQEANCj4+Pj4+ICAgKiBDb3B5cmln
aHQgKGMpIDIwMDYsIEsgQSBGcmFzZXINCj4+Pj4+ICAgKi8NCj4+Pj4+IA0KPj4+Pj4gKyNpZm5k
ZWYgQUxMT1dfSU5DTFVERV9BU01fR1VFU1RfQUNDRVNTX0gNCj4+Pj4+ICsjZXJyb3IgImFzbS9n
dWVzdF9hY2Nlc3MuaCBzaG91bGQgbm90IGJlIGluY2x1ZGVkIGRpcmVjdGx5Ig0KPj4+Pj4gKyNl
bmRpZg0KPj4+Pj4gKw0KPj4+Pj4gICNpZm5kZWYgX19BU01fWDg2X0dVRVNUX0FDQ0VTU19IX18N
Cj4+Pj4+ICAjZGVmaW5lIF9fQVNNX1g4Nl9HVUVTVF9BQ0NFU1NfSF9fDQo+Pj4+PiANCj4+Pj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZ3Vlc3RfYWNjZXNzLmggYi94ZW4vaW5jbHVk
ZS94ZW4vZ3Vlc3RfYWNjZXNzLmgNCj4+Pj4+IGluZGV4IDc1MTAzZDMwYzhiZS4uODE0ZTMxMzI5
ZGU5IDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2d1ZXN0X2FjY2Vzcy5oDQo+
Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZ3Vlc3RfYWNjZXNzLmgNCj4+Pj4+IEBAIC03LDcg
KzcsOSBAQA0KPj4+Pj4gICNpZm5kZWYgX19YRU5fR1VFU1RfQUNDRVNTX0hfXw0KPj4+Pj4gICNk
ZWZpbmUgX19YRU5fR1VFU1RfQUNDRVNTX0hfXw0KPj4+Pj4gDQo+Pj4+PiArI2RlZmluZSBBTExP
V19JTkNMVURFX0FTTV9HVUVTVF9BQ0NFU1NfSA0KPj4+Pj4gICNpbmNsdWRlIDxhc20vZ3Vlc3Rf
YWNjZXNzLmg+DQo+Pj4+PiArI3VuZGVmIEFMTE9XX0lOQ0xVREVfQVNNX0dVRVNUX0FDQ0VTU19I
DQo+Pj4+PiAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4+Pj4gICNpbmNsdWRlIDxwdWJsaWMv
eGVuLmg+DQo+Pj4+IE9uZSBvcHRpb24uIFBlcnNvbmFsbHkgSSdkIHByZWZlciB0byBhdm9pZCBp
bnRyb2R1Y3Rpb24gb2YgeWV0IGFub3RoZXINCj4+Pj4gY29uc3RhbnQsIGJ5IGxldmVyYWdpbmcg
X19YRU5fR1VFU1RfQUNDRVNTX0hfXyBpbnN0ZWFkLg0KPj4+IA0KPj4+IEkgdGhvdWdodCBhYm91
dCBpdCBidXQgaXQgZG9lc24ndCBwcmV2ZW50IG5ldyBpbmNsdXNpb25zIG9mIGFzbS9ndWVzdF9h
Y2Nlc3MuaC4gRm9yIGluc3RhbmNlLCB0aGUgZm9sbG93aW5nIHdvdWxkIHN0aWxsIGNvbXBpbGU6
DQo+Pj4gDQo+Pj4gI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4NCj4+PiANCj4+PiBbLi4u
XQ0KPj4+IA0KPj4+ICNpbmNsdWRlIDxhc20vZ3Vlc3RfYWNjZXNzLmg+DQo+Pj4gDQo+Pj4gSWYg
d2Ugd2FudCB0byBjb21wbGV0ZWx5IHByZXZlbnQgbmV3IGluY2x1c2lvbiwgdGhlbiB3ZSBuZWVk
IGEgbmV3IHRlbXBvcmFyeSBjb25zdGFudC4NCj4+IEkgd291bGQgdGhpbmsgdGhhdCB0aGlzIHdv
dWxkIG5vdCBoYW5kbGUgYWxsIGNhc2VzIGJ1dCB3b3VsZCBhdCBsZWFzdCBwcmV2ZW50IHNvbWVv
bmUgZnJvbSBpbmNsdWRpbmcgZGlyZWN0bHkgdGhlIGFzbSBoZWFkZXIuDQo+IA0KPiBJdCBpcyBu
b3QgZW50aXJlbHkgY2xlYXIgd2hhdCB5b3UgbWVhbiBieSAiaW5jbHVkaW5nIGRpcmVjdGx5IiBn
aXZlbiB0aGF0IG15IGV4YW1wbGUgYWJvdmUgYSBDIGZpbGUgd291bGQgaW5jbHVkZSA8YXNtL2d1
ZXN0X2FjY2Vzcy5oPg0KDQpTb3JyeSwgSSBtZWFudCBoZXJlIGluY2x1ZGluZyBkaXJlY3RseSB0
aGUgYXNtIG9uZSBpbiBhIEMgZmlsZSAod2l0aG91dCB0aGUgeGVuIG9uZSBiZWZvcmUpIGlmIHlv
dSB0ZXN0IA0Kb25seSDigJxpZm5kZWYgX19YRU5fR1VFU1RfQUNDRVNTX0hfX+KAnSBpbiB0aGUg
YXNtIG9uZS4NCg0KPiANCj4gVG8gbWFrZSBpdCBtb3JlIG9idmlvdXMgPHhlbi9ndWVzdF9hY2Nl
c3MuaD4gbWF5IGhhdmUgYmVlbiBpbmNsdWRlZCB2aWEgYW5vdGhlciBoZWFkZXIuDQo+IA0KPiBU
aGUgc29sdXRpb24gc3VnZ2VzdGVkIGJ5IEphbiB3b3VsZCBvbmx5IHByZXZlbnQgdGhlIGZvbGxv
d2luZyBjYXNlOg0KPiANCj4gI2luY2x1ZGUgPGFzbS9ndWVzdF9hY2Nlc3MuaD4NCj4gDQo+IFsu
Li5dDQo+IA0KPiAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPg0KPiANCj4gQnV0IHRoaXMg
c2hvdWxkIG5ldmVyIGhhcHBlbiBnaXZlbiB0aGF0IHdlIHJlcXVlc3QgPHhlbi8qPiB0byBiZSBi
ZWZvcmUgPGFzbS8qPi4NCg0KQnV0IHRoaXMgb25seSBlbmZvcmNlZCBieSByZXZpZXcgKG5vdCBi
eSBhbnkgbWFnaWNzIHdpdGggaWZkZWZzKSwgd2h5IG5vdCBkb2luZyB0aGUgc2FtZSBmb3IgZGly
ZWN0bHkgaW5jbHVzaW9uIG9mIHRoZSBhc20gb25lID8NCg0KPiANCj4+IFRoZSBzb2x1dGlvbiB3
aXRoIHRoZSBkZWZpbmUgYW5kIHVuZGVmIGRvZXMgbm90IGxvb2sgcmVhbGx5IG5pY2UgYW5kIGhl
YWRlcnMgY291bGQgYmVjb21lIHJlYWxseSB1Z2x5IGlmIHdlIHN0YXJ0IGRvaW5nIHRoYXQgZm9y
DQo+PiBhbGwgYXNtIGhlYWRlcnMgdGhhdCBzaG91bGQgbm90IGJlIGluY2x1ZGVkIGRpcmVjdGx5
Lg0KPiANCj4gSXQgaXMgbm90IGJ1dCB0aGF0J3MgdGhlIHByaWNlIHRvIHBheSBpZiB3ZSB3YW50
IHRvIGVuZm9yY2UgdGhlIHJ1bGUuDQoNClRoZW4gaWYgd2Ugd2FudCB0byBlbmZvcmNlIGl0IHdp
dGggYW4gZXJyb3IgZHVyaW5nIGNvbXBpbGF0aW9uLCB5b3VyIHNvbHV0aW9uIGlzIHRoZSBvbmx5
IG9uZSB3b3JraW5nIEkgYWdyZWUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

