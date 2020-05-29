Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01181E7807
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeaBV-0002mz-Lz; Fri, 29 May 2020 08:16:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeaBV-0002mu-2b
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:16:09 +0000
X-Inumbo-ID: a5d0da92-a184-11ea-a87e-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5d0da92-a184-11ea-a87e-12813bfff9fa;
 Fri, 29 May 2020 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrDXmiz0l+amY/5J1pxupmFOtEFDeXqRXqpOm0W35Ow=;
 b=ZBhBM1TCxaKizuV6q1H1yypiBZU9p7MZCJMq0CMJuwpUzTA6zI60+EH4MDD/bb4Gf9jPn4WRWeFrWSi6fguXTIMoh+aNDnESBO1mA+VasT7t/JF2dcpfFavJcWD4OzG8+KYPaWgl0cRTa3bYreL/zviICnvXa/DHEl8JfkUZAmQ=
Received: from AM0PR02CA0030.eurprd02.prod.outlook.com (2603:10a6:208:3e::43)
 by AM0PR08MB3650.eurprd08.prod.outlook.com (2603:10a6:208:da::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 08:16:06 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::f6) by AM0PR02CA0030.outlook.office365.com
 (2603:10a6:208:3e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Fri, 29 May 2020 08:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 08:16:05 +0000
Received: ("Tessian outbound 952576a3272a:v57");
 Fri, 29 May 2020 08:16:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: abcf1a27a241ce2f
X-CR-MTA-TID: 64aa7808
Received: from da24b9dfa802.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7A0716F-E345-4147-9814-B80C9B787F68.1; 
 Fri, 29 May 2020 08:16:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da24b9dfa802.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 08:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8EeBOBxCZli9u71R5u+nBP1ixjI09HlMOf/AESpblf50scl0pC3QeMxpAVUWnp8UzikM7wDj1krUFTyzl2JhCeMEg6M8ilkCsu/1eW3gim+B2++COxViMKIub8Ht5ohvJ+ITgMPeRSQBlAFclevyeShYZAHc7QxtHnAw+Vo3+/JvLsUMQRdGSJJ9Z9gRsuWIxItkxhW9Exx+fIe8BqboaiW0nDGZZ4YktE52O0w2gjrhXBjPG599irp1akQncX2tKd7sEkucU8BzNkd0RK67QeZ+WryLfhv0q37R4mEiiouFUdP6ZxLYMyEvhC3fqkcRWtMay0SZKsEZr7j2xNqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrDXmiz0l+amY/5J1pxupmFOtEFDeXqRXqpOm0W35Ow=;
 b=Ussmmiov4wPp1r1exYFWvpt+fPtRNJB0aeSG4BSJFxDQWfGcN9k1l7kp+H2VOZqPeNnSHcLaHi12lYnsgi4LJ53HXitrWKzysN/Vc4L+YIs2uWv5GqbBDi3NoKqJJBGFQ5HF37Zjdg2e/kgBj1FjgJJQZHC8TBSJy9UzaZ+yn6k2bARLa2h220KkpGjCVHCAQfcRIL4ZpAZd8b1bzO8Ev862JV0CdnjhKVENw3NrKsHOFO3fTgFHlEzCOA0rX8g9aqZkTwzwMgymXXnet9wYsZmEDEh3kE0TcroWk6m1dWPGSoqqHh5T73wt5ZEXdP12risyGmOginV0V9LHEU39Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrDXmiz0l+amY/5J1pxupmFOtEFDeXqRXqpOm0W35Ow=;
 b=ZBhBM1TCxaKizuV6q1H1yypiBZU9p7MZCJMq0CMJuwpUzTA6zI60+EH4MDD/bb4Gf9jPn4WRWeFrWSi6fguXTIMoh+aNDnESBO1mA+VasT7t/JF2dcpfFavJcWD4OzG8+KYPaWgl0cRTa3bYreL/zviICnvXa/DHEl8JfkUZAmQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3353.eurprd08.prod.outlook.com (2603:10a6:5:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 08:15:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:15:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai9txeAgAAHJ4CAAB/EgIAA2sQA
Date: Fri, 29 May 2020 08:15:59 +0000
Message-ID: <9BC88255-F0BD-4A1A-BECF-CE30C0B64035@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <20200528165341.GH1195@Air-de-Roger>
 <B0CBD25E-49D8-4AE5-B424-83E9A05FBF58@arm.com>
 <de72ffe2-34a9-0b65-8d66-3f1322258d0c@xen.org>
In-Reply-To: <de72ffe2-34a9-0b65-8d66-3f1322258d0c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c169d545-f744-476d-21a0-08d803a888f0
x-ms-traffictypediagnostic: DB7PR08MB3353:|AM0PR08MB3650:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3650E904B3283152C9CA14F99D8F0@AM0PR08MB3650.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5YRyXe028Ix7AQdcPdxAGZSFN2MN2yiiv9wwB1bHh4QhQzcdj+hAGpyWlhusQVoAwsY5XKAhmWoUd0Edy2MhEpKVibR8ntn65EDzqK51oc2xX8oAYsjnkB/Q/2nnTUC7xBipLx/CHwlAMe6tLQESt4qZemoUwFEeIPWWo0xjOmM9urlAvwjfpavnOjYo6DgDBTIPN3HIEW4oKBw+zPjX4eEjw431s/xSTSP8/nJj8NupHvBIY3VLY25est3NC0M7ODsrDekJ56Bz5wb2N2/lxoBXj16LyDBt6hhpV4HaVMmxtXXky8yj22csEH4Xrr/1m3rCW1EWNQGCFlAur8CupQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(54906003)(5660300002)(7416002)(64756008)(83380400001)(91956017)(66476007)(66946007)(76116006)(66556008)(8936002)(71200400001)(66446008)(36756003)(4326008)(478600001)(86362001)(8676002)(6486002)(6512007)(26005)(6506007)(186003)(2906002)(316002)(33656002)(6916009)(2616005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mSkF3TxmBDTUB57NE2ivxzUWFBPHDU81rT7/5DCA2ZgObfLbQx5XPSKrqpol8oJg5RNSOitOWOyPMmqjkL5p3Tdd5Vpv7Z2xiM+GIftmaXTLqO3ES7yRZQeb2zDi8u27HiQ5CbEPSc2RuDjKujxe0tjIicQjSsYXCgW/659ll6L6x74hBFB8WdTZHU5N9a4r/LAEpC28IYwLSlyxf5xCgc165ib9B0mmHcPPdn+KOGUBwmbU8CnpSFoqebwwTmc0iknNpGVKKqEqrx342xYUtcHhAJNiurjfcPjBu0jpBZ/U8XB+EyrCXwhlYfy4dF7XWRHIgtPjGEJ2ZJXvw8wRTImWwsedt11OXr7HQP4eVBR3T4sd0jS/17HjOwU3fdJHfBqjDPxSIwp4SJc4+rsZsQiKA9H04n7jH8v6uuNRfwHJCa3pChdv8umjPL3qmCbcMEvCKXdjTO8TAMx8dP+m8IipwecyBLqpTRJcoXvldvezNYdg6FEqaBbfuHGoPtL7
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4245DE9CCC0ECB4192B7AB7C79A9A8A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3353
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(336012)(53546011)(186003)(6486002)(36756003)(2906002)(5660300002)(26005)(478600001)(86362001)(6862004)(356005)(82740400003)(8936002)(82310400002)(316002)(54906003)(33656002)(70586007)(70206006)(4326008)(81166007)(6512007)(8676002)(83380400001)(2616005)(36906005)(6506007)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2ed0932-6809-4099-b46f-08d803a88508
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dPDFWA4gn2qiCOgihrc69SdmDRo2fIha6uPW+sHabPF8/qOcRk2OhbbBHc/Z1md5eVuKcc65RR6ZU8CJAcYktcM6rbJ6zGITplT85WYKOpsIEGPjBQ47Awq/sL9rWJXla1LcYu4dohMOrKUhJ+n9QF84Yh4ZY/x+Myv3gYtX23V7FbbKm7nRGD5lnYJvsiZbXDO4SbqSkXklnf1BxmhdiwVX1DNNhOLC+CB3D1Gx/7uCviAyUnwyl1ma7/uVUmpo7AR/4Yv9ow5rHsGHdHA9VmTbMdCO3vz5BysMXKZo4346tD6fYDg5/2odAXLlWUCEgw1s5mMK5HpVL4U+WW17gaNWqvwc3D5oU6FfhiIqmd3OTpRjWguHa4VivJqbThR2mC30qubCkDNYICDTq9lf7A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:16:05.9163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c169d545-f744-476d-21a0-08d803a888f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xen.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjggTWF5IDIwMjAsIGF0IDIwOjEyLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjgvMDUvMjAyMCAxODoxOSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiAwOw0KPj4+PiArfQ0K
Pj4+PiArDQo+Pj4+IGludCBkb21haW5fa2lsbChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+PiB7DQo+
Pj4+ICAgICBpbnQgcmMgPSAwOw0KPj4+PiBAQCAtNzI3LDcgKzc4OCwxMCBAQCBpbnQgZG9tYWlu
X2tpbGwoc3RydWN0IGRvbWFpbiAqZCkNCj4+Pj4gICAgICAgICBpZiAoIGNwdXBvb2xfbW92ZV9k
b21haW4oZCwgY3B1cG9vbDApICkNCj4+Pj4gICAgICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsN
Cj4+Pj4gICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApDQo+Pj4+ICsgICAgICAgIHsNCj4+
Pj4gKyAgICAgICAgICAgIHVubWFwX3J1bnN0YXRlX2FyZWEodiwgMCk7DQo+Pj4gDQo+Pj4gV2h5
IGlzIGl0IG5vdCBhcHByb3ByaWF0ZSBoZXJlIHRvIGhvbGQgdGhlIGxvY2s/IEl0IG1pZ2h0IG5v
dCBiZQ0KPj4+IHRlY2huaWNhbGx5IG5lZWRlZCwgYnV0IHN0aWxsIHNob3VsZCB3b3JrPw0KPj4g
SW4gYSBraWxsaW5nIHNjZW5hcmlvIHlvdSBtaWdodCBzdG9wIGEgY29yZSB3aGlsZSBpdCB3YXMg
cmVzY2hlZHVsaW5nLg0KPj4gQ291bGRu4oCZdCBhIGNvcmUgYmUga2lsbGVkIHVzaW5nIGEgY3Jv
c3MgY29yZSBpbnRlcnJ1cHQgPw0KPiANCj4gWW91IGNhbid0IHN0b3AgYSB2Q1BVIGluIHRoZSBt
aWRkbGUgb2YgdGhlIGNvbnRleHQgc3dpdGNoLiBUaGUgdkNQVSBjYW4gb25seSBiZSBzY2hlZHVs
ZWQgb3V0IGF0IHNwZWNpZmljIHBvaW50IGluIFhlbi4NCg0KT2sNCg0KPiANCj4+IElmIHRoaXMg
aXMgdGhlIGNhc2UgdGhlbiBJIHdvdWxkIG5lZWQgdG8gZG8gbWFza2VkIGludGVycnVwdCBsb2Nr
aW5nIHNlY3Rpb25zIHRvIHByZXZlbnQgdGhhdCBjYXNlID8NCj4gDQo+IEF0IHRoZSBiZWdpbm5p
bmcgb2YgdGhlIGZ1bmN0aW9uIGRvbWFpbl9raWxsKCkgdGhlIGRvbWFpbiB3aWxsIGJlIHBhdXNl
ZCAoc2VlIGRvbWFpbl9wYXVzZSgpKS4gQWZ0ZXIgdGhpcyBzdGVwcyBub25lIG9mIHRoZSB2Q1BV
cyB3aWxsIGJlIHJ1bm5pbmcgb3IgYmUgc2NoZWR1bGVkLg0KPiANCj4gWW91IHNob3VsZCB0ZWNo
bmljYWxseSB1c2UgdGhlIGxvY2sgZXZlcnl3aGVyZSB0byBhdm9pZCBzdGF0aWMgYW5hbHl6ZXIg
dGhyb3dpbmcgYSB3YXJuaW5nIGJlY2F1c2UgeW91IGFjY2VzcyB2YXJpYWJsZSB3aXRoIGFuZCB3
aXRob3V0IHRoZSBsb2NrLiBBIGNvbW1lbnQgd291bGQgYXQgbGVhc3QgYmUgdXNlZnVsIGluIHRo
ZSBjb2RlIGlmIHdlIGdvIGFoZWFkIHdpdGggdGhpcy4NCj4gDQo+IEFzIGFuIGFzaWRlLCBJIHRo
aW5rIHlvdSB3YW50IHRoZSBsb2NrIHRvIGFsd2F5cyBkaXNhYmxlIHRoZSBpbnRlcnJ1cHRzIG90
aGVyd2lzZSBjaGVja19sb2NrKCkgKHRoaXMgY2FuIGJlIGVuYWJsZWQgd2l0aCBDT05GSUdfREVC
VUdfTE9DS1Mgb25seSBvbiB4ODYgdGhvdWdoKSB3aWxsIHNob3V0IGF0IHlvdSBiZWNhdXNlIHlv
dXIgbG9jayBjYW4gYmUgdGFrZW4gaW4gYm90aCBJUlEtc2FmZSBhbmQgSVJRLXVuc2FmZSBjb250
ZXh0Lg0KDQpPayBJIHVuZGVyc3RhbmQgdGhhdC4NCkkgd2lsbCB0YWtlIHRoZSBsb2NrIGhlcmUu
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

