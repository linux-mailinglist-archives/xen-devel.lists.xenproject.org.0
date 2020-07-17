Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9C223FF3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 17:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwSeW-0007SN-Tc; Fri, 17 Jul 2020 15:52:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwSeU-0007SI-V0
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 15:51:59 +0000
X-Inumbo-ID: 71b543aa-c845-11ea-8496-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71b543aa-c845-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lItZYZJBVOe6opiwwJHC8qPt80unMpfxU7ICJXTWOFc=;
 b=vjMciu3tsbMoQOIXU0Mv45ilJch18txgSriBUyqC/zpE2L4Ra37c7AIBz+DE7rGhM7KHKVx8ADmmC+3szaWPDctEDK0boYbz78czsYUIRfW5iHDGEIM5KUmGPwJVPGGKTGIzTAzrSKaITx4Xv0J09wMGMp2xjK0FzYpfxvJCgzQ=
Received: from AM6P194CA0105.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::46)
 by VI1PR0801MB1774.eurprd08.prod.outlook.com (2603:10a6:800:4e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 15:51:55 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::18) by AM6P194CA0105.outlook.office365.com
 (2603:10a6:209:8f::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 15:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 15:51:54 +0000
Received: ("Tessian outbound c83312565ef4:v62");
 Fri, 17 Jul 2020 15:51:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bdf83e4f1ab6e7b0
X-CR-MTA-TID: 64aa7808
Received: from ba2958c1b620.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27408F25-4CD1-454A-B11B-BC1A0DBA9C12.1; 
 Fri, 17 Jul 2020 15:51:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba2958c1b620.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 15:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASC/3lORlshQOaOGO9p2Kz+tt2Lo/nbgHi+3uOQYgyfC++F8IESgJNOC7a/Aj7FBztFR0TNSLwUIzsbYCIef3U/p7GahDn89TQwjHCcmDfUlefiQrBBoe96nfQutJKLk4FqgZS8Jmz1kgFHrP1K4oCqXHLSDQvrjjUcsWjq+CHXCvsr6a3h8VM/SBSRxH0saSOJB0MgG6eduNHLxBFJauFlLn8nafE22wLITRfS06iy1CJ/rv/dGgv0x4lNzjIUak3wr5CJc+jhhSMoatc0ICrFb+fnf6QKxbu5Cgdqme+aiEPZC+P5DylnjtvgCMER95J7lNIHbWQWliMchCS1IQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lItZYZJBVOe6opiwwJHC8qPt80unMpfxU7ICJXTWOFc=;
 b=f0c1T2b8pEaJNxvizHuKValGQS3WWvGZOza56ro+bzbG8gcQvtuPCP7bRc/yIb5FPf48QtRs82BztnbWPNP+0WY1gydYmJ7MJ2UonCNrQIh6IYTO9tDCqib9ynXfxZ+mwvaqLRCa1qQPVDMaEbpkhjCf8V1kFu/OzVd3vKCAmpk96L54eIUWn3rhBlwFHYx4gObkTxkf+UHGiAVvUjvl0hVE5KYfr71OamsNLQv8ZibvbZebo/QrRKga1q/XoFiRlDKDmIqmraYLGBMZU4LPFejiJDCg4f2LNkY2l/FjVm//Bh0z/8vHQQuTEnjzMDhDh1+vqSG9kpYmdZciPMQQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lItZYZJBVOe6opiwwJHC8qPt80unMpfxU7ICJXTWOFc=;
 b=vjMciu3tsbMoQOIXU0Mv45ilJch18txgSriBUyqC/zpE2L4Ra37c7AIBz+DE7rGhM7KHKVx8ADmmC+3szaWPDctEDK0boYbz78czsYUIRfW5iHDGEIM5KUmGPwJVPGGKTGIzTAzrSKaITx4Xv0J09wMGMp2xjK0FzYpfxvJCgzQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2296.eurprd08.prod.outlook.com (2603:10a6:4:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 15:51:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 15:51:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQCAAAHigIAAAiYAgAAEaYCAAAVDgIAAAeSAgAAF4gA=
Date: Fri, 17 Jul 2020 15:51:47 +0000
Message-ID: <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
References: <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
In-Reply-To: <20200717153043.GX7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c33937b7-c667-49cc-d16d-08d82a695482
x-ms-traffictypediagnostic: DB6PR0802MB2296:|VI1PR0801MB1774:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB17741D9C70442F9FF3548B949D7C0@VI1PR0801MB1774.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QUeIUN+UyotUrC8xJ1QJS0ABY+mzQOUYSpZ0XH1zVKA1goaV5wF24Cob6VRee07VwsdNBAT3sX3Z+mcvnj6cZcevP9vqOBPT+jVeRLMSXaD+NTG3GT7yCdRv7i3gaKmYiAkTaBzYYzh00rV3Gxl5Lna2fw8FnwXk7lnrLiSBx7dM5KPmldiM6AtqqaJz/YIfNhu54ECiKRY1mDi9KPynYek70XHeItO/TtaB+jy+jUcVfkVLykJ1HaCbkirtm9zsNdiVHJuQvEQbtL5gslozNnL3f6iM2OhAWDmx4WSJBtazldT7BDAP56WqB1PEab7XMzJp50WmlTNWELt/fk8Rmg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(8676002)(316002)(6512007)(64756008)(66556008)(66476007)(66446008)(6916009)(36756003)(8936002)(66946007)(53546011)(6506007)(2616005)(478600001)(5660300002)(71200400001)(6486002)(26005)(2906002)(4326008)(33656002)(54906003)(86362001)(76116006)(91956017)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DGN1J/eSPG5aXF77j3QiL1WJGcQ+ktX20IwBZGuE4o8TJeL16O9SpRanqc6nceS1B5hX5W0DB/7x0bvmAH4dYNaDBmxVcbkBs/buv2XxRZMj6QNH5tqeHNvtMsSRNrTtt05eGjj3gRTTp7hM1X7G3MJvRaZ7HE9/pOi2Y7mLfS+8BD20Lkh5bbmaUFL35k1F8AKpKCS5lEK4QUpE8XBqqm1Uy2/3pjMqx1/ldmDWgL1anmsUrcbbuMoxjR+P3Zorah33LmD0yioa7MGAjk11naXFDrLqzRCDzGF57LBk5ShB46jYGkQdHf8kiMB1ISGHCCIV102dHT4masVAU2FN2zMewFxE6ngjQNsLu8aYpRdw1vDsgl6LlV59BDavNsddvaiJlAowuiYdweRdcNA74pTpiGCJFD+IeDt3zWn1ay/CUmEABoEHPSPRTr6DKPVvoFuvdkzksWWs3HWiSP/RdCdD5cxD923u6Er6olx20vC9Ro7fzCbNJeJItgb7mGeC
Content-Type: text/plain; charset="utf-8"
Content-ID: <49530C698045634C89CD21DEB1C60E23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2296
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(356005)(33656002)(107886003)(2906002)(8936002)(8676002)(6506007)(53546011)(4326008)(47076004)(5660300002)(81166007)(36756003)(82740400003)(6512007)(336012)(478600001)(70206006)(316002)(6862004)(82310400002)(6486002)(186003)(36906005)(70586007)(2616005)(26005)(86362001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ba38a0b9-5054-4b40-7a3c-08d82a695056
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: envoUApaWeuoMF8YB5ilCo09Dv//8cVTZwAz0hzctmfbSwadUaBMRms2Y11832C0oaM1Z2F5r0fx390zLIad3aYAsQvB1v7bsVJdvmBKdlAcYnotfsyDCNKWrw/SQgl13emgoGLhuRkFFFRpZLFgSBEYGkG5lDtgsM6xXkyz3HXOP6JO8hxNlpHrb+wtU9bf4IFhCiQLyGnYPjq71IPRkd0bDnRzjKK3BFRldAm8f/Fd+qOwJyHz0GYcbQVtiW4BnB/i/4VdpyHAmdlN2xbFpbAe05BhI8FQoYmcCAGKBgm6n63en6bngBpjTzLQpYpQwi6qg+kmeJAjkuTG3HPKydS5WNHIP7IbGoXu0DXTCNuBuo7To71AhWRJqrv3x+B+fRR/7oh2FWuUXlR4/YyQjg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 15:51:54.9647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33937b7-c667-49cc-d16d-08d82a695482
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1774
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

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDE3OjMwLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMzoy
Mzo1N1BNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAx
NyBKdWwgMjAyMCwgYXQgMTc6MDUsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMjo0OToyMFBN
ICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiAx
NyBKdWwgMjAyMCwgYXQgMTY6NDEsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgMDI6MzQ6
NTVQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiANCj4+Pj4+PiANCj4+
Pj4+Pj4gT24gMTcgSnVsIDIwMjAsIGF0IDE2OjA2LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTcuMDcuMjAyMCAxNTo1OSwgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gT24g
MTcgSnVsIDIwMjAsIGF0IDE1OjE5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIDE3LjA3LjIwMjAgMTU6MTQsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTA6MTAsIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBPbiAxNi4w
Ny4yMDIwIDE5OjEwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiAjIEVtdWxhdGVk
IFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhsOg0KPj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
Pj4+IExpYnhsIGlzIGNyZWF0aW5nIGEgdmlydHVhbCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiB0
aGUgZGV2aWNlIHRyZWUgdG8gZW5hYmxlIHRoZSBndWVzdCBPUyB0byBkaXNjb3ZlciB0aGUgdmly
dHVhbCBQQ0kgZHVyaW5nIGd1ZXN0IGJvb3QuIFdlIGludHJvZHVjZWQgdGhlIG5ldyBjb25maWcg
b3B0aW9uIFt2cGNpPSJwY2lfZWNhbSJdIGZvciBndWVzdHMuIFdoZW4gdGhpcyBjb25maWcgb3B0
aW9uIGlzIGVuYWJsZWQgaW4gYSBndWVzdCBjb25maWd1cmF0aW9uLCBhIFBDSSBkZXZpY2UgdHJl
ZSBub2RlIHdpbGwgYmUgY3JlYXRlZCBpbiB0aGUgZ3Vlc3QgZGV2aWNlIHRyZWUuDQo+Pj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+Pj4+IEkgc3VwcG9ydCBTdGVmYW5vJ3Mgc3VnZ2VzdGlvbiBmb3IgdGhp
cyB0byBiZSBhbiBvcHRpb25hbCB0aGluZywgaS5lLg0KPj4+Pj4+Pj4+Pj4gdGhlcmUgdG8gYmUg
bm8gbmVlZCBmb3IgaXQgd2hlbiB0aGVyZSBhcmUgUENJIGRldmljZXMgYXNzaWduZWQgdG8gdGhl
DQo+Pj4+Pj4+Pj4+PiBndWVzdCBhbnl3YXkuIEkgYWxzbyB3b25kZXIgYWJvdXQgdGhlIHBjaV8g
cHJlZml4IGhlcmUgLSBpc24ndA0KPj4+Pj4+Pj4+Pj4gdnBjaT0iZWNhbSIgYXMgdW5hbWJpZ3Vv
dXM/DQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBUaGlzIGNvdWxkIGJlIGEgcHJvYmxlbSBhcyB3
ZSBuZWVkIHRvIGtub3cgdGhhdCB0aGlzIGlzIHJlcXVpcmVkIGZvciBhIGd1ZXN0IHVwZnJvbnQg
c28gdGhhdCBQQ0kgZGV2aWNlcyBjYW4gYmUgYXNzaWduZWQgYWZ0ZXIgdXNpbmcgeGwuIA0KPj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kOiBXaGVuIHRo
ZXJlIGFyZSBubyBQQ0kgZGV2aWNlIHRoYXQgZ2V0DQo+Pj4+Pj4+Pj4gaGFuZGVkIHRvIGEgZ3Vl
c3Qgd2hlbiBpdCBnZXRzIGNyZWF0ZWQsIGJ1dCBpdCBpcyBzdXBwb3NlZCB0byBiZSBhYmxlDQo+
Pj4+Pj4+Pj4gdG8gaGF2ZSBzb21lIGFzc2lnbmVkIHdoaWxlIGFscmVhZHkgcnVubmluZywgdGhl
biB3ZSBhZ3JlZSB0aGUgb3B0aW9uDQo+Pj4+Pj4+Pj4gaXMgbmVlZGVkIChhZmFpY3QpLiBXaGVu
IFBDSSBkZXZpY2VzIGdldCBoYW5kZWQgdG8gdGhlIGd1ZXN0IHdoaWxlIGl0DQo+Pj4+Pj4+Pj4g
Z2V0cyBjb25zdHJ1Y3RlZCwgd2hlcmUncyB0aGUgcHJvYmxlbSB0byBpbmZlciB0aGlzIG9wdGlv
biBmcm9tIHRoZQ0KPj4+Pj4+Pj4+IHByZXNlbmNlIG9mIFBDSSBkZXZpY2VzIGluIHRoZSBndWVz
dCBjb25maWd1cmF0aW9uPw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBJZiB0aGUgdXNlciB3YW50cyB0
byB1c2UgeGwgcGNpLWF0dGFjaCB0byBhdHRhY2ggaW4gcnVudGltZSBhIGRldmljZSB0byBhIGd1
ZXN0LCB0aGlzIGd1ZXN0IG11c3QgaGF2ZSBhIFZQQ0kgYnVzIChldmVuIHdpdGggbm8gZGV2aWNl
cykuDQo+Pj4+Pj4+PiBJZiB3ZSBkbyBub3QgaGF2ZSB0aGUgdnBjaSBwYXJhbWV0ZXIgaW4gdGhl
IGNvbmZpZ3VyYXRpb24gdGhpcyB1c2UgY2FzZSB3aWxsIG5vdCB3b3JrIGFueW1vcmUuDQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBUaGF0J3Mgd2hhdCBldmVyeW9uZSBsb29rcyB0byBhZ3JlZSB3aXRoLiBZ
ZXQgd2h5IGlzIHRoZSBwYXJhbWV0ZXIgbmVlZGVkDQo+Pj4+Pj4+IHdoZW4gdGhlcmUgX2FyZV8g
UENJIGRldmljZXMgYW55d2F5PyBUaGF0J3MgdGhlICJvcHRpb25hbCIgdGhhdCBTdGVmYW5vDQo+
Pj4+Pj4+IHdhcyBzdWdnZXN0aW5nLCBhaXVpLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgYWdyZWUgaW4g
dGhpcyBjYXNlIHRoZSBwYXJhbWV0ZXIgY291bGQgYmUgb3B0aW9uYWwgYW5kIG9ubHkgcmVxdWly
ZWQgaWYgbm90IFBDSSBkZXZpY2UgaXMgYXNzaWduZWQgZGlyZWN0bHkgaW4gdGhlIGd1ZXN0IGNv
bmZpZ3VyYXRpb24uDQo+Pj4+PiANCj4+Pj4+IFdoZXJlIHdpbGwgdGhlIEVDQU0gcmVnaW9uKHMp
IGFwcGVhciBvbiB0aGUgZ3Vlc3QgcGh5c21hcD8NCj4+Pj4+IA0KPj4+Pj4gQXJlIHlvdSBnb2lu
ZyB0byByZS11c2UgdGhlIHNhbWUgbG9jYXRpb25zIGFzIG9uIHRoZSBwaHlzaWNhbA0KPj4+Pj4g
aGFyZHdhcmUsIG9yIHdpbGwgdGhleSBhcHBlYXIgc29tZXdoZXJlIGVsc2U/DQo+Pj4+IA0KPj4+
PiBXZSB3aWxsIGFkZCBzb21lIG5ldyBkZWZpbml0aW9ucyBmb3IgdGhlIEVDQU0gcmVnaW9ucyBp
biB0aGUgZ3Vlc3QgcGh5c21hcCBkZWNsYXJlZCBpbiB4ZW4gKGluY2x1ZGUvYXNtLWFybS9jb25m
aWcuaCkNCj4+PiANCj4+PiBJIHRoaW5rIEknbSBjb25mdXNlZCwgYnV0IHRoYXQgZmlsZSBkb2Vz
bid0IGNvbnRhaW4gYW55dGhpbmcgcmVsYXRlZA0KPj4+IHRvIHRoZSBndWVzdCBwaHlzbWFwLCB0
aGF0J3MgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQgb24gQXJtDQo+Pj4gQUZBSUNUPw0K
Pj4+IA0KPj4+IERvZXMgdGhpcyBzb21laG93IHJlbGF0ZSB0byB0aGUgcGh5c2ljYWwgbWVtb3J5
IG1hcCBleHBvc2VkIHRvIGd1ZXN0cw0KPj4+IG9uIEFybT8NCj4+IA0KPj4gWWVzIGl0IGRvZXMu
DQo+PiBXZSB3aWxsIGFkZCBuZXcgZGVmaW5pdGlvbnMgdGhlcmUgcmVsYXRlZCB0byBWUENJIHRv
IHJlc2VydmUgc29tZSBhcmVhcyBmb3IgdGhlIFZQQ0kgRUNBTSBhbmQgdGhlIElPTUVNIGFyZWFz
Lg0KPiANCj4gWWVzLCB0aGF0J3MgY29tcGxldGVseSBmaW5lIGFuZCBpcyB3aGF0J3MgZG9uZSBv
biB4ODYsIGJ1dCBhZ2FpbiBJDQo+IGZlZWwgbGlrZSBJJ20gbG9zdCBoZXJlLCB0aGlzIGlzIHRo
ZSBYZW4gdmlydHVhbCBtZW1vcnkgbWFwLCBob3cgZG9lcw0KPiB0aGlzIHJlbGF0ZSB0byB0aGUg
Z3Vlc3QgcGh5c2ljYWwgbWVtb3J5IG1hcD8NCg0KU29ycnkgbXkgYmFkLCB3ZSB3aWxsIGFkZCB2
YWx1ZXMgaW4gaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCwgd3JvbmcgaGVhZGVyIDotKQ0KDQpC
ZXJ0cmFuZA0KDQoNCj4gDQo+IFJvZ2VyLg0KDQo=

