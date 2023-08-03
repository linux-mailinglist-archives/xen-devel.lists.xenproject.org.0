Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F476DD5D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 03:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575927.901486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNKa-0002Z0-Gm; Thu, 03 Aug 2023 01:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575927.901486; Thu, 03 Aug 2023 01:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNKa-0002XM-Dm; Thu, 03 Aug 2023 01:40:48 +0000
Received: by outflank-mailman (input) for mailman id 575927;
 Thu, 03 Aug 2023 01:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tn0Q=DU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qRNKZ-0002XG-4U
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 01:40:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe12::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2f5f4f3-319e-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 03:40:44 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9818.eurprd08.prod.outlook.com (2603:10a6:102:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Thu, 3 Aug
 2023 01:40:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 01:40:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c2f5f4f3-319e-11ee-b267-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAOf11muDPiVnMIUhhLHEA7WJU+eB4P7IiIkIvHc9s5vH0dfOWMCtsfiS6H+yKf7kwQPdAitWvufZnV5OUFDhcEHD/b4phjfWzaYgpGZwdRfLRhilxOBgMrG0RXih8+2Z/7qevsWnqREbo63ZZWzzlImukjj61mlzFcKJEg36eSv84/82pbEbeu9jGWv3Kfp0PPgMPNY1y3t5jtX6zlSyV5OBYztDiz5v9hhkbps/eCEeHIXnHvTSn26pU/zV4yl14ivrxyjoTeBSQqNnCStCItyNIzoX7DbPxiZ3t4qoHEK2Z+w4U+vmCEnTaESp4iX3qxVHU2ojoghHkgUXptfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TalCKGhmv8pur2cReg9h8iMB+kbTlhu4a28bwsjAXY0=;
 b=lTU4l+wFBN61ohfiKktY4JOwtdGjth0ij447YYtAXE0//G6NIPmw82h9y4MRKMygs3ut2d3MeJ4aT9XT1oq4Q1/Jvxv8x7Fzor874SDktPOzpmqD5pzoI60vDUus197uASyG7gTfIlzhFjFa43CSGNo+kqtRNvnd1xX+/UoadpNo5GUOes+GT7WbGVF5TQ0Qd1Ov+MPoVaD8ndOehSfVTDf17Fo8SzP5WjNBiKmA1vOxoct4wJA52f85mLCdRNPx5L+M/hRpjHjhgqgDBIRAd/0EpN5i4kSQr3WQWsmQam4RZ2F/pPRfLjn2N/OUMdDUsbwUlJxKgSt0mf+EiPsLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TalCKGhmv8pur2cReg9h8iMB+kbTlhu4a28bwsjAXY0=;
 b=vkmUfdVEfLWlAPdxCRs8CrhfbhIGkfv/UFD6wvTj1yC3tNMQdV+qTfhG4kNdCS0yOQ9QoSodeavRta7PuJF4ci/RRVguQjv9DdQ0+1NGp/jAkNA9mQLQOSk+HFMbLSh4z1ED7ehh4s1BxYxBXZGAHhaht+Ymh4B7e6CRf4h309Q=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxJNabMSouWTajUmNjHUgHUELYa/WhhowgADuEQCAAFUFoA==
Date: Thu, 3 Aug 2023 01:40:40 +0000
Message-ID:
 <AS8PR08MB7991BC2D8AAC933CE77F4DE79208A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
 <AS8PR08MB799102916C8CA24C276DB51A920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <7afba030-48f2-baaf-02f9-dae84107a620@apertussolutions.com>
In-Reply-To: <7afba030-48f2-baaf-02f9-dae84107a620@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5AB0CE3F1013594EAA0BA62AF7527390.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|PAVPR08MB9818:EE_
x-ms-office365-filtering-correlation-id: 7d3b0012-e107-4f0a-b4b3-08db93c2a4e8
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w3OtiOyvHicy0P22wxa/zETrdUBSMtqdIix6IIz146IqgXvWKwGxPSr2RYrTCPguekRJsy+6jbL/UTF5XRbI445Ci6NOBDlXZkQeIT6m377gGzBWEvd/lncG0TzhptrHdDEOEXaITKRs5ZvfFaghihmJHP7R3CgaRxpRIC2RAElAbOLKuFufCaOGeaWNPhUmaN4JILswdrl4uSipXOO31BVPwQsxg8OE02QislG25vM4Z7x3wYn6UQy/1sUeGKu8TnWNapJCMMUebdG//Zdiv0rVQBmlxPN3QgBQFSlYCm3Q3LM0ruczl6wU0d2StyV4LqtGC6nvBdu+1UphzjzIJNMvMzpg/MPacbmhNBzyML8Fe+6YjWBTzlx46fgv7P29EcKWFjwIbiN34RCLJn2YFZvgYNdXckmURm7eFwIpd5G0ru2inI7fl3M152cP5XT6TLHOXy5D8C//WxQ3ZiWwIxtxPIzWiPEySkZ0K3eDrD7axl2OkVdNyiH63Nf99IlDUwZsMs8Mq14NoxaTNJ6bREIkbCimt/desaP7rfQddi+9uw2pVccOATIGR/A+oLRtEuHCokMIKZ4rPka0Yq0t0/xdqpY+1akJX6ACWBxc7nEi79l65skMY3KgbfczeO2h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(66946007)(64756008)(86362001)(66446008)(66476007)(66556008)(7696005)(71200400001)(52536014)(76116006)(9686003)(2906002)(4326008)(54906003)(110136005)(55016003)(33656002)(478600001)(83380400001)(38100700002)(41300700001)(122000001)(5660300002)(8676002)(8936002)(26005)(38070700005)(6506007)(186003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnVCczZUUjhVMzRtTWwyYjVFOUdTMjlXRDNGb2VrcFBnazRpU1ZxR3Y1UWMz?=
 =?utf-8?B?N3ltODJVRlZaWnl6emVaVDcyQTQyMk5qTFh6SGRoN2o3WnE2RjA5NENTcjM0?=
 =?utf-8?B?UlM4VUtqNlVlaVNNZ2NOa1N2TS9WZlBVaVJVTzFISXdzMkpOVG9GNTllNGUy?=
 =?utf-8?B?K2pLOVAxYVU2S0JKUjVYSFZRTHVtOU5McEs2czUwTzdpbWQ2L0FTdEo1MjZt?=
 =?utf-8?B?cmUwK3VPWnlBZUV2dzdzenJ1S1ZvTUVPV3dyaWpUd3I4akdsdE11eVVaTTNL?=
 =?utf-8?B?MlZsaFdIVDNDNG1SODdLMWpMZGJuaWc2SmF0UjlpWVNuQlZ3ZHM1T3V6dVF5?=
 =?utf-8?B?OGhQQTVFTWh6eWV0ZmFjWmFEOFZjV0JwVGhDL3h6TmMxbzRZbXNEV3hKWVpv?=
 =?utf-8?B?K3pPd3I3UDNyWXppOElKL0p0SDlHUW5ZbXpvZzk0WkYrU3dON3Rlb2plRDk4?=
 =?utf-8?B?WDByVk9KUm84K2h0VG1EbXdMSndIVnBYZFovWGNSeUMwUXk1ZHZ4bTh1aThQ?=
 =?utf-8?B?NlFkT0tibFErUEhWUnFBa3JaRE9OUkR6NlhtUWZ5TVVGQUxZWmNsT0dvSTNV?=
 =?utf-8?B?WGx6elVLbGwybFdwTkF0NFprT0NrYm8yS0x1Q29HaWJibEJva1RvbDNZTnhM?=
 =?utf-8?B?RS9LVFgxbldNUy9JQmpENWNCZUFramZBMzBEdnhkajFRZjZQNmlYcUtqeUVr?=
 =?utf-8?B?VDlLZW1sVzl1b0NnUHV3aUR2Yyt0WVdNUXIrSnpTcWZKWnM0UnFBcURhejhF?=
 =?utf-8?B?dDZERWRPMHYybi83a09uUUdxYTBiS05SRFlMRjhiV2QvcTVvVFlENDlCNmIz?=
 =?utf-8?B?UEQwUm9WOE45bmpMc0MrMTJJL1p1WW5Oa2poM2VRdEozTVdZbjJPa2N5WjJ4?=
 =?utf-8?B?MmxzT1BKeS84cjJBSkxkcnB6THlWMTR1OTg5alBEQzBZWHNSTnNTVTFRRWps?=
 =?utf-8?B?bFBlWXA5c1Erb3F2MTRDWElSZWFyRy9EY0FMQS9acTdDV1h2YkZOSkJRWGU5?=
 =?utf-8?B?cHhLVlBDZE9IdkE2L1R0UWxvUUVjbmNMay8zZU43TkdvOWhZVVpMdEpCNkUx?=
 =?utf-8?B?R081TW10T0g3b1pFeUR3dlg1ZTBjNFFtbUt0SlRBN3QrN2J3bml2dFBvMVRI?=
 =?utf-8?B?ejhqSFpMQUg4NCt6N0tFVndIdEY3UXJwQmdZei9aZlE3ZDYvMFdqc2NIOVZs?=
 =?utf-8?B?UElFcHBpNThJRjBZNTc4NkJMQThSd3poMzZMM0N2dkZ1RkVyTVVKMFdxQTh6?=
 =?utf-8?B?Mm9pcGI5QXFoVytnYkJPTnZHbFhYZDFneEFBWWhiRXhRNjhZRHNIaks4M3hE?=
 =?utf-8?B?WFpRMnovMUM1RWVveGlBanpuRXM3anJGOWF4TkpTN1laNHBLS3hHYUk5cEl4?=
 =?utf-8?B?dTdGTitCQ3Y2SU9udWJpMU52ckdJYUxQMy91QTFMNGNLdVFhZmJFazJpc0h6?=
 =?utf-8?B?d1JzWmpOT0Z5TUNTTVpkQWlFOVJkRWNGdDZSSk1qMVNvQnp2VWJ5cVAxL2ZK?=
 =?utf-8?B?NXVLUllWYnBvM0htN2EwR1d6NVRyUncrWVlMNExiQWF3MXZEVDVPdFU4b2Q2?=
 =?utf-8?B?cmhGUzJrdnIzVlh3T1NQZC9kMVFGamg1QjJrY0xxQUdBTGtlay9pV01kcGgx?=
 =?utf-8?B?RUllL0JUWDY3U2Z2Z1QyV3VZNWhMS2FWQXNLZGZrejZhMHRvRG85am4xUi9J?=
 =?utf-8?B?cE1rMXcxV0hnUDJVajBUdVFhOGF1RUJrNHdtNDBMK3U0Nk5CRG9FekQ0aHN1?=
 =?utf-8?B?NDhTeG9xRmgxUkw4bHJjMU45blQrRVA0WkIzMEVCUngvdndhLzg2aUNtc1dM?=
 =?utf-8?B?MFVxSUQwUzcxSlFVZ1dwWEF3NmE0NVFHUnozVHRBK1RvUTZCS0ErMDFxbzdB?=
 =?utf-8?B?b0MvNFZTN0NUUSsyeDB2SlRYQkc0Zk13ZUY5WVR6M01nY1E2NWQ5cTRPQnNN?=
 =?utf-8?B?WlU2enk2UWM4Mnp5Z2pRVlpjb2FRMjc3NERoNUY2SXNVbkI4aFBIbTF1SkZ1?=
 =?utf-8?B?aTFiWFozd25iWmlTZkY2MjgyQWF2cmlhNnBlbDR1Vll5amxSeHVTVDNYYUVo?=
 =?utf-8?B?aWtSbHVlVzVsSjlwMmJPb203ZW41UjlFVWdGUDVXenIwVTNpU2luREticTN4?=
 =?utf-8?Q?aPURhcB3GkAvB3/zmFodWcPJP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3b0012-e107-4f0a-b4b3-08db93c2a4e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 01:40:40.2550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVvNs6d/kBJV9wpiKqPwKxKfO3lrTnLb1r/GKryR8dDonrFEjy5DQldF9pToJQnP9u6p5E+PdhY9jyKBgzzKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818

SGkgRGFuaWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBmZHQ6IG1ha2UgZmR0IGhhbmRsaW5nIHJldXNhYmxlIGFjcm9zcyBhcmNo
DQo+ID4gbWFrZTogKioqIFtNYWtlZmlsZToxODM6IF9fc3ViLW1ha2VdIEVycm9yIDINCj4gPiBt
YWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2plbmtpbnMvd29ya3NwYWNlL2Fpcy14ZW5iaXRzLQ0K
PiB4ZW4vbGF5ZXJzL3hlbi94ZW4nDQo+ID4NCj4gPiBUaGUgc3RhZ2luZyBpdHNlbGYgcGFzc2Vk
IHRoZSBDSSBjaGVjay4gRGlkIEkgbWlzcyBzb21lIGNvbnRleHQgdG8gbWFrZQ0KPiA+IHRoaXMg
cGF0Y2ggd29ya3M/IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBzb21lIGhpbnRzPyBUaGFua3Mg
aW4gYWR2YW5jZSENCj4gDQo+IE5vcGUgeW91IGFyZSBjb3JyZWN0LCBJIG5vdyBuZWVkIHRvIGdv
IGJhY2sgYW5kIGxvb2sgaWYgSSBzZW50IHBhdGNoZXMNCj4gb3V0IG9mIHRoZSB3cm9uZyBicmFu
Y2ggb3IgaWYgSSByZWFsbHkgZGlkIG1pc3MgY2xlYW5pbmcgdXAgdGhlIG9yaWdpbmFsDQo+IGRl
Y2xhcmF0aW9ucyBpbiB0aGUgQXJtIHRyZWUuIEkgZmFpcmx5IGNvbmZpZGVudCBJIG1hZGUgc3Vy
ZSBnaXRsYWItY2kNCj4gcGFzc2VkIGJlZm9yZSBJIGN1dCB0aGUgcGF0Y2hlcyBmb3Igc2VuZGlu
ZywgDQoNCkkgdGhpbmsgc28sIGFzIEkgc2F3IHNvbWV0aGluZyByZWxhdGVkIHRvIHRoZSBHaXRs
YWItQ0kgcnVubmVycyBkaXNjdXNzaW9uDQppbiBJUkMgeWVzdGVyZGF5Lg0KDQo+IGJ1dCBzaW5j
ZSBJIGhhZCB0aHJlZQ0KPiBkaWZmZXJlbnQgc2VyaWVzIGluIGZsaWdodCwgSSBtYXkgaGF2ZSBn
b3R0ZW4ganVtYmxlZC4gQXBvbG9naWVzIGZvciB0aGUNCj4gdW5uZWNlc3NhcnkgY2h1cm4gaGVy
ZS4NCg0KTm8gcHJvYmxlbSBhdCBhbGwsIEkgYW0gbW9yZSB0aGFuIGhhcHB5IHRvIGRvIHRoZSB0
ZXN0IGZvciB5b3VyDQp2MiBzZXJpZXMgb25jZSBpdCBpcyBpbiB0aGUgbWFpbGluZyBsaXN0IDop
KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBWL3IsDQo+IERhbmllbCBQLiBTbWl0
aA0KDQo=

