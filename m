Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC8223E94
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:50:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwRg3-0000uF-LP; Fri, 17 Jul 2020 14:49:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwRg2-0000uA-Nt
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:49:30 +0000
X-Inumbo-ID: b79a9ba8-c83c-11ea-8496-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b79a9ba8-c83c-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16qJpWuyRsbkhE+DIkPMJSVXRYLtWIcIvHctzxkKtFk=;
 b=PqTz1nZcgpFb3LuPdycKY8tUVFGv/eH+C8LKrK1i5khiOUcHap3b4vUBn2nlgPCZzYiVU8EfhUHNk7UnZP4jO/+EBNxIg7cmako0wl3cE4fVB8/SH3cIDgm3M4BeMWn5FnmpXS0x5Hb1DaHNtYfQGcsNYgXOAb854nAOD6gq0w0=
Received: from MR2P264CA0064.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::28)
 by AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 14:49:28 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::ee) by MR2P264CA0064.outlook.office365.com
 (2603:10a6:500:31::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 14:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:49:27 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Fri, 17 Jul 2020 14:49:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c181b4099ff1cfce
X-CR-MTA-TID: 64aa7808
Received: from 792995244d14.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA540EB2-B182-496B-B0DA-37AC616A7616.1; 
 Fri, 17 Jul 2020 14:49:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 792995244d14.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 14:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFYGPPld2s0pHoquNnzfJR2e9ugJ3hMvGemck1/PtVuKSmapRF5r5PsG6wePg4FcNpIYNw2RkvSXFn/GholnfAnilCIaJXBvwnPCKCHHCZl4pj4PE84isFZo0PnrL3b1Kb1somgknmu7bKA9eXetiUzWFvwEs9sn6WBN3b7bpjISc/muAz9oJ18MqYmYSgpkXF5olGYHH2AQmePsybkydunsUO9FBEWp7PebjPEG95I4206P0+2IMyEvvd1bMf+nsYp0JYY7WPVYuPWc/bLuxzqwcaJKMxenEPAsf5tByDtxyQ3sGwg46KO3cJqUmLi5YEkmub8OQ4W1vVxTDs3EaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16qJpWuyRsbkhE+DIkPMJSVXRYLtWIcIvHctzxkKtFk=;
 b=i0wp2mwMcC+n0wV0V4IMSuMgrr1CydpjCgecqmFgTlaUzQ9tsOlNBnQLcnZl2uVjdzYNK5PWZv0gxWnoXNOVqDrSDTTNdnAfXF1zskot1/Uum71ikuGTOKbIe2DhAJUQI9vShgAeT/Rv+SRZFeg1Y5N1QrxCYX/5X2OhUeOINdZt6nO8Vh4uqje/u4RFVMmMe2EiaViImJA9LrrO4Wks1yEa45h+4dFhrcNKyBOAdQ4fq16s/SnxzfsAY/M0VdAfQ2X3D/E2Mx5brOGHZHxywzxm1fzxzWvdID1J2qIYkjNtwit+Hpn3pxo845uGUyyMN2xpC8iA1sBj/uieKfjeqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16qJpWuyRsbkhE+DIkPMJSVXRYLtWIcIvHctzxkKtFk=;
 b=PqTz1nZcgpFb3LuPdycKY8tUVFGv/eH+C8LKrK1i5khiOUcHap3b4vUBn2nlgPCZzYiVU8EfhUHNk7UnZP4jO/+EBNxIg7cmako0wl3cE4fVB8/SH3cIDgm3M4BeMWn5FnmpXS0x5Hb1DaHNtYfQGcsNYgXOAb854nAOD6gq0w0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5179.eurprd08.prod.outlook.com (2603:10a6:10:e7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 14:49:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 14:49:20 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQCAAAHigIAAAiYA
Date: Fri, 17 Jul 2020 14:49:20 +0000
Message-ID: <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
In-Reply-To: <20200717144139.GU7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e09dab6e-077d-4fcb-0041-08d82a609ae5
x-ms-traffictypediagnostic: DB8PR08MB5179:|AM6PR08MB3317:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33178581CAD71442AF81C2059D7C0@AM6PR08MB3317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nZQUz3DMZJq84WVJDz161Gi+jKG4DSksKnROs/ro/UoztzwGGzqb/bWlyMyRDAk6wcYCMBIIWLdkpoAncietb8Ma37wOoohhh15NoJxi+cguI/hnmgZIhbXBsqQ61fC+lDjgYZe0IdefSQEaYQDEa2A4DUT+M/Ih1flNufCkpclJ94VtB1FpH7P+nl311YjaCjgnjufWj79mDHyHiEpYgexZf+smfB4aR6eRshxaWQNTmuZVxlEeolWnvmspfZgi02dedNiF4ZVAPVcjBq3/smlX/ajh852kX0UWIsLK6k8CKRmPuY94K3NvFa0O/r3HVn6g0nHNZmYO1FDeMFbyXQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(316002)(6512007)(5660300002)(4326008)(36756003)(71200400001)(478600001)(2616005)(2906002)(33656002)(6506007)(186003)(53546011)(8936002)(86362001)(26005)(54906003)(8676002)(6916009)(66476007)(64756008)(66556008)(66946007)(66446008)(76116006)(91956017)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: CC0Jd8tPtrorAQpg6ONoYQ6EydMMO6rvEqQFVrJqQO91N+yURyofFIkzJq4aBaeRTeGrcBYTqwaw+0MhoHYeejFRIFzmp0ntKZQGTLZw3dPiFUK5tTxnD31lgzLIjI5Nj4Vz/4y67uWhVFvJl86DM1CkbhU5mqeJUfvAUiMna94hnaJJlL9s+Q7CuxkRPOCs3zgS0KHN9Cj9XigL0y2bRs5BlUh/lrvsWjP6lodfmphokCpETHVY0OIc4t0z8bLGEmnVOhwJZZaAlNGpzZVzIBpi4CZ91CnQVFq2yMfGkSYWEp+ilzyABlgF5Vw3QFacCuKvVCdNat3Y+baqIStItmk37t/HmJXXaOpPB7AkVnYnYfcCMt5yYkDI5z4FVBlh2HrNw85PIJ+jid8C/KbgbaJ+uhbKIIAUbDVSsgKXRSlI/fg/8yPLB8D0STEncFgMJ+8UUwYF54ybHyQJrYFquukWllP5FUWIz5B9lMq5uluLiBoS23dfE12663tv2y+o
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C544AC97E6FE24D882346475A78198B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5179
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(26005)(186003)(6862004)(2906002)(53546011)(6506007)(4326008)(86362001)(107886003)(70206006)(336012)(70586007)(54906003)(6486002)(36756003)(5660300002)(2616005)(356005)(81166007)(8936002)(316002)(6512007)(36906005)(82310400002)(478600001)(33656002)(8676002)(82740400003)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 248e502d-9a52-4acb-4e1c-08d82a6096b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imNnrvEzC7yiPZBIL75bC1RsvukfWigmDiMcIhI56qM98BZiuYwULBHbrWNk8b6BSFGtj9ILjHL7WY5yUBoTB7qdOnkreeQT2oycF8bP2kGBzlU3wuPyMTnZ1hd1yqg2fh9IzAmnHhJVL/P4Uby7bSdHuU+J5kfqw58cgkgRtC8TXGE/OrYtjpZT6gaK2WST3ydZ4c4OKYCVpA/zpw5St2IeHatXHqgvLeoEb1NblejOFNLiQQvyW0YjYUy25jM4U+7IYiFD0upWDkwuqVp/aAOsJLyRw3BueHWLnBP2Oii3zfXHRJVMSdvFFVCq+uWsCpW5A/J7qLjBO5wzOs8i3XntC+k/uoqsYfJT3F9QXog09Av62wHbl/R+AClCKdpRSeJgP+rHn6BVWgGdaSpmzw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:49:27.5312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e09dab6e-077d-4fcb-0041-08d82a609ae5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3317
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDE2OjQxLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMjoz
NDo1NVBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAx
NyBKdWwgMjAyMCwgYXQgMTY6MDYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gMTcuMDcuMjAyMCAxNTo1OSwgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+Pj4gT24gMTcgSnVsIDIwMjAsIGF0IDE1OjE5LCBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiAxNy4wNy4y
MDIwIDE1OjE0LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4+PiBPbiAxNyBKdWwgMjAy
MCwgYXQgMTA6MTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+
Pj4+IE9uIDE2LjA3LjIwMjAgMTk6MTAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gIyBF
bXVsYXRlZCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiBsaWJ4bDoNCj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4gTGlieGwgaXMgY3JlYXRpbmcgYSB2aXJ0dWFsIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIHRo
ZSBkZXZpY2UgdHJlZSB0byBlbmFibGUgdGhlIGd1ZXN0IE9TIHRvIGRpc2NvdmVyIHRoZSB2aXJ0
dWFsIFBDSSBkdXJpbmcgZ3Vlc3QgYm9vdC4gV2UgaW50cm9kdWNlZCB0aGUgbmV3IGNvbmZpZyBv
cHRpb24gW3ZwY2k9InBjaV9lY2FtIl0gZm9yIGd1ZXN0cy4gV2hlbiB0aGlzIGNvbmZpZyBvcHRp
b24gaXMgZW5hYmxlZCBpbiBhIGd1ZXN0IGNvbmZpZ3VyYXRpb24sIGEgUENJIGRldmljZSB0cmVl
IG5vZGUgd2lsbCBiZSBjcmVhdGVkIGluIHRoZSBndWVzdCBkZXZpY2UgdHJlZS4NCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IEkgc3VwcG9ydCBTdGVmYW5vJ3Mgc3VnZ2VzdGlvbiBmb3IgdGhpcyB0byBiZSBh
biBvcHRpb25hbCB0aGluZywgaS5lLg0KPj4+Pj4+PiB0aGVyZSB0byBiZSBubyBuZWVkIGZvciBp
dCB3aGVuIHRoZXJlIGFyZSBQQ0kgZGV2aWNlcyBhc3NpZ25lZCB0byB0aGUNCj4+Pj4+Pj4gZ3Vl
c3QgYW55d2F5LiBJIGFsc28gd29uZGVyIGFib3V0IHRoZSBwY2lfIHByZWZpeCBoZXJlIC0gaXNu
J3QNCj4+Pj4+Pj4gdnBjaT0iZWNhbSIgYXMgdW5hbWJpZ3VvdXM/DQo+Pj4+Pj4gDQo+Pj4+Pj4g
VGhpcyBjb3VsZCBiZSBhIHByb2JsZW0gYXMgd2UgbmVlZCB0byBrbm93IHRoYXQgdGhpcyBpcyBy
ZXF1aXJlZCBmb3IgYSBndWVzdCB1cGZyb250IHNvIHRoYXQgUENJIGRldmljZXMgY2FuIGJlIGFz
c2lnbmVkIGFmdGVyIHVzaW5nIHhsLiANCj4+Pj4+IA0KPj4+Pj4gSSdtIGFmcmFpZCBJIGRvbid0
IHVuZGVyc3RhbmQ6IFdoZW4gdGhlcmUgYXJlIG5vIFBDSSBkZXZpY2UgdGhhdCBnZXQNCj4+Pj4+
IGhhbmRlZCB0byBhIGd1ZXN0IHdoZW4gaXQgZ2V0cyBjcmVhdGVkLCBidXQgaXQgaXMgc3VwcG9z
ZWQgdG8gYmUgYWJsZQ0KPj4+Pj4gdG8gaGF2ZSBzb21lIGFzc2lnbmVkIHdoaWxlIGFscmVhZHkg
cnVubmluZywgdGhlbiB3ZSBhZ3JlZSB0aGUgb3B0aW9uDQo+Pj4+PiBpcyBuZWVkZWQgKGFmYWlj
dCkuIFdoZW4gUENJIGRldmljZXMgZ2V0IGhhbmRlZCB0byB0aGUgZ3Vlc3Qgd2hpbGUgaXQNCj4+
Pj4+IGdldHMgY29uc3RydWN0ZWQsIHdoZXJlJ3MgdGhlIHByb2JsZW0gdG8gaW5mZXIgdGhpcyBv
cHRpb24gZnJvbSB0aGUNCj4+Pj4+IHByZXNlbmNlIG9mIFBDSSBkZXZpY2VzIGluIHRoZSBndWVz
dCBjb25maWd1cmF0aW9uPw0KPj4+PiANCj4+Pj4gSWYgdGhlIHVzZXIgd2FudHMgdG8gdXNlIHhs
IHBjaS1hdHRhY2ggdG8gYXR0YWNoIGluIHJ1bnRpbWUgYSBkZXZpY2UgdG8gYSBndWVzdCwgdGhp
cyBndWVzdCBtdXN0IGhhdmUgYSBWUENJIGJ1cyAoZXZlbiB3aXRoIG5vIGRldmljZXMpLg0KPj4+
PiBJZiB3ZSBkbyBub3QgaGF2ZSB0aGUgdnBjaSBwYXJhbWV0ZXIgaW4gdGhlIGNvbmZpZ3VyYXRp
b24gdGhpcyB1c2UgY2FzZSB3aWxsIG5vdCB3b3JrIGFueW1vcmUuDQo+Pj4gDQo+Pj4gVGhhdCdz
IHdoYXQgZXZlcnlvbmUgbG9va3MgdG8gYWdyZWUgd2l0aC4gWWV0IHdoeSBpcyB0aGUgcGFyYW1l
dGVyIG5lZWRlZA0KPj4+IHdoZW4gdGhlcmUgX2FyZV8gUENJIGRldmljZXMgYW55d2F5PyBUaGF0
J3MgdGhlICJvcHRpb25hbCIgdGhhdCBTdGVmYW5vDQo+Pj4gd2FzIHN1Z2dlc3RpbmcsIGFpdWku
DQo+PiANCj4+IEkgYWdyZWUgaW4gdGhpcyBjYXNlIHRoZSBwYXJhbWV0ZXIgY291bGQgYmUgb3B0
aW9uYWwgYW5kIG9ubHkgcmVxdWlyZWQgaWYgbm90IFBDSSBkZXZpY2UgaXMgYXNzaWduZWQgZGly
ZWN0bHkgaW4gdGhlIGd1ZXN0IGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBXaGVyZSB3aWxsIHRoZSBF
Q0FNIHJlZ2lvbihzKSBhcHBlYXIgb24gdGhlIGd1ZXN0IHBoeXNtYXA/DQo+IA0KPiBBcmUgeW91
IGdvaW5nIHRvIHJlLXVzZSB0aGUgc2FtZSBsb2NhdGlvbnMgYXMgb24gdGhlIHBoeXNpY2FsDQo+
IGhhcmR3YXJlLCBvciB3aWxsIHRoZXkgYXBwZWFyIHNvbWV3aGVyZSBlbHNlPw0KDQpXZSB3aWxs
IGFkZCBzb21lIG5ldyBkZWZpbml0aW9ucyBmb3IgdGhlIEVDQU0gcmVnaW9ucyBpbiB0aGUgZ3Vl
c3QgcGh5c21hcCBkZWNsYXJlZCBpbiB4ZW4gKGluY2x1ZGUvYXNtLWFybS9jb25maWcuaCkNClNv
IHRoZXkgd2lsbCBhcHBlYXIgYXQgYSBkaWZmZXJlbnQgYWRkcmVzcyB0aGVuIHRoZSBoYXJkd2Fy
ZS4NCg0KQmVydHJhbmQNCg0KPiANCj4gUm9nZXIuDQoNCg==

