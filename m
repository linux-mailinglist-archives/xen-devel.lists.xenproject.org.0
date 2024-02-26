Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BAE866F56
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685404.1066045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXga-0005zn-3g; Mon, 26 Feb 2024 09:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685404.1066045; Mon, 26 Feb 2024 09:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXga-0005xg-0i; Mon, 26 Feb 2024 09:54:12 +0000
Received: by outflank-mailman (input) for mailman id 685404;
 Mon, 26 Feb 2024 09:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fECz=KD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1reXgY-0005xa-MA
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:54:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb6ba74c-d48c-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 10:54:08 +0100 (CET)
Received: from DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) by
 SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 09:54:05 +0000
Received: from DS0PR12MB9448.namprd12.prod.outlook.com
 ([fe80::640c:7a82:230:eea4]) by DS0PR12MB9448.namprd12.prod.outlook.com
 ([fe80::640c:7a82:230:eea4%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 09:54:05 +0000
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
X-Inumbo-ID: fb6ba74c-d48c-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZbInYWXd8GZELS2afBvr4sj04D4spKNoCsBw1YA8v3PqbSk/xZs/htxFD9kelijIEHcKsMxKX8ArTUM3KiCmFuxbw6Lq1Gy5V0aU4ROGbL13shYaF/D3wq8m5UZhpTdNV8Gr9M/yCaFWsJ1QkHVz2+VM7IIiKAEjvpqVY7MC0IYezAmb5g8reGCzwyBGhKpKEWzrqil5CTI3VaNA87kV3EBcVI6Prd+ljgCYGBmTTtT8PjOozR9RCmqoW110BmicigTwtZfI65SbEx1u0xou+O2zNCpNTZ6YAh19DDrVyC/ANZT4Y/di9n21OWNUIk1ErP/8D/FCZE4KWT/O3TQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY+M8Q39ASiwK9mzUUf8Hg0KQYd25uiWciIka+VsBCA=;
 b=a05YZhMUKLwJJ1QD53zFjWWP1rN6dUw2gmg48cRElOv4i/T8a1kVH2dmn0TtHKIS57Sx+xMEMjloo70bTtv0L5L4nG72cs2/vaU07qUyWbCRVLKZ6E0C5vnVMWKdIT3p5FDf66k7/v77VO/lftFZBJlBuK4EozcXmb4gMfytIGxL/4mNyd9DjPj7s1KmqZx/WGSU8wjte6ZoSGiOpps9w3DhpNIqOTacgZxEjWthDm3/0KJhJcdSqGUQB2bt+O9UMMX3Pm+kOuCONhCjUeAM12L+j/Z+kWcECv6zOFmt92pSK7WrVfwxjiNavGC8ku7yj2/fQHf6VfMsEQI20RHz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY+M8Q39ASiwK9mzUUf8Hg0KQYd25uiWciIka+VsBCA=;
 b=YcSrINnW0biFpEx8i2mKfj0CD+kRyYphufkwfwn2RfhA6fafmItvfr6baQIku0SYJh7UgeZH+Izsw2bnvqIK8vaQhwZqSVdReQvnHClFTk8lPMjBCLSqytB3kipvC5MOXlhG0qD8V9G7rOjaUNbhSuSmZMz+Mvkw2BMOEFh5gVI=
From: "Wang, Henry" <Xin.Wang2@amd.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Thread-Topic: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Thread-Index: AQHaaGAnRoGRN1vAm06vXBNQgKmm5rEcXbUAgAAC7lA=
Date: Mon, 26 Feb 2024 09:54:04 +0000
Message-ID:
 <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
 <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
In-Reply-To: <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=b0971ed1-3c37-4d11-9197-15f40cb44849;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-26T09:46:39Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB9448:EE_|SN7PR12MB7980:EE_
x-ms-office365-filtering-correlation-id: f4f50496-b6c8-449e-f46f-08dc36b0de30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /ZuqbD2troct+gaTDvnBtR+og50CO/DsJ3PYg7W2DPmBKO4zmnpNfXdOYNWGtZfcbqGzCHtjOHvSiDI7Uzz1UVWtIMPvT4BDw/vjIzN8t8KOJb+Ac1GB35+E0bs6gtw4qN8H0rcKXEQu4h6zSwZAQ3va/hbQnmrinfegYuOojlwCW8SIrQsz3zHgH3W/JT2OHRgogvsUlTP73xTfqgURvskT03N9kqDMLUe6r1/BiMa9Yi4VGlaPzhKgH2u0kP9WNpdssk6apuT/7lbS3UgNLBE/RKDEoEb3QFfSZx5GcQcuwnDATIrIqMVJ1Moh0xjIgln6slAvx1mfBuWcmVEiK5lLU4Gxyg63SCjX7BCT6elbF7MvR4UNu4abF1M8pcHETM5JZa3LbQ6+i2qBw1+v8nRWrnjBi2WQ3j9Sag4qZB/O3nBO7VWPX6kiiU2NZPzHRYnjgPNY7FHTvrzRAj0sJKAOZMyQVNHr5t58ZmoJslK+TsObAlDGa2XsyivkzOFjMq2HeTFQLbmktTN0cM0E61IjRK69VIihMTz5WuYdRc028bl1m0Lv9gCu4jdfuKrqPTL0YcFK14GM72EwA4U8xy8XN++39TKgLx9OGl2nDIq4uhGp1p29NBEdA7XUZhmMULV4ACYYmHc9GmLGLjZROT2FqCD0YhkrfS8jJQQzaGvLwK0Q7MIzT4ix4uMPJFnxp7HMOifnq1ZYDm8V7qBlnQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB9448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmY0ZVd6eTVrbmpuU2ZNOFlwbkdtcEJKaWxjZ1ZhTlFPeHp1VnYrMFZWQU1U?=
 =?utf-8?B?WXJQbnYzM3BrckRISmNwc1poVFNPVFlHbmFpVU93TVFkMWhVeitOM0JYL2hl?=
 =?utf-8?B?dDBKTENzSDk1d09GdUgwclpwTmtaVkFkd3RwT3E2cWtuSnNreWE3Wjd2YjRu?=
 =?utf-8?B?eEZGd2pxNjc1dyt1Wm1id2gxN0plYVFSZU1uNnZ5RDlsNVFraFVhSmNtM1RR?=
 =?utf-8?B?VFhocHkreDlsUjhVUWg2V3QvNEJGaEcvMFRpbFVJUUhWeUcrOXFvcmFkNVlW?=
 =?utf-8?B?V2tuMDlVZUNSVzBzWmNPMnM4OHkrblNIQUdocUN3WGtrMlFEZlcveUM2SGNo?=
 =?utf-8?B?M1dPRWVYVjgvcXBCMDFKUGRxeWcrc3ROKy9sWEdqSGltckE1d3J5LytTd09h?=
 =?utf-8?B?VGg1ZVg4TldTMDIrWXhMcEVNU2pYWXZTTXpHNGtqUWFXWmYwdVlSTi9EZ05t?=
 =?utf-8?B?MDNBS2IxQ3FBODVCQm1RZVpFVmRza21mejdsamlJWHdUQkY5RkNZUmdtb0Yx?=
 =?utf-8?B?ZUVtNHE4dVd5MWZzdlRSenp0QXRRaWpXNGZRZk5ScGUrRG9mdWRCaWlhNFJi?=
 =?utf-8?B?Nks5R3Mwd3BFbXhaUHBqU1ljNVRvaE1FM2s2ZC8yazhyMnp1dFJrVEtoeEI3?=
 =?utf-8?B?RXIwNXkzVVZaQnNIZWdZbUZPRGRWb3JUbm9HU290N0d6RkxDN05qY1p5YldH?=
 =?utf-8?B?MFRNQVRmZEhiV2ZwNy8rSEpkcUlZbldOMHZPTjg4d2MrTEY5Y0M2bUQzaC9P?=
 =?utf-8?B?d2xweTBIM2lFY2VSUEFrWmkvb1lYcDFlN2lhNXBhY0RPeTZKUXNKQWVpWjd0?=
 =?utf-8?B?ckQyeXMvTWgyODJDcHFqUTdPeVFkN2FlcWZJZ3ZIejJNbXdrS2owZG5vTUVj?=
 =?utf-8?B?QzRkQWZBN01GS3V5VUdYN25Ld3lNZmZzRGJDQXA0OFg0QjNGTUdEazNVd0Jt?=
 =?utf-8?B?TytLNFZHaGtaTkJXMXlpNkE4cmFOMDh0T1JUc3FRT21sOHJGdEM5NXBaRkxu?=
 =?utf-8?B?Z1ZnaExjUVV1SDlWUk5RdDAzaVdhcVdNUXJaYlZDbTZLY2RzVWI3TVZFN0hh?=
 =?utf-8?B?OXdqY1ZXNkcvOHhlaXRWdHY5bzRrUTMwQWx4ZUYwQ3NvRVBzRFR6ODd3ZFZF?=
 =?utf-8?B?MmFFN1dBY1oyQ2RaWkUwYWlKb2ZJTWErT3RjUjdNcnRXTC9lYmpRL1REZU0w?=
 =?utf-8?B?ZTRwQS9tUHQxRUVscXdvTDZOZmo1UXdzRWpXa3hxN2ZreTF0R25zKzhtUGZT?=
 =?utf-8?B?dWNnUmRKRm9mRjhTWnRaeFYwdlNoZGRsY1Q4aVk4VnlRRmV0Q2hmOFRqSnl4?=
 =?utf-8?B?QjhtRWtpMUJWQUFUV3QwNExHWHhLYXJkSG5YVG1CZ0ZaZ1hjZ3M3UE5TblU2?=
 =?utf-8?B?THVjYlRCN1RCQVA2QURMbWt4REpvbnZUUVllbi9ISHoyZTNhUDJidkc1aE0w?=
 =?utf-8?B?dUlTeVUrR2Q1TVg3ZjhzZ3grTGxXVnRydmdPVkV2eWNqTkhhM3RaSFNvcmNL?=
 =?utf-8?B?aGt4T0NQQlJLUGxRbG8yOTNoRVdQdEFCNGVKeXhVcHdKU1BQenNSaDRoaVVl?=
 =?utf-8?B?c0IxYUsxeVIwSVR1dFpGRlNEdWFadndVQlBkdnpnWCtHcFFXK0dnWDJORENM?=
 =?utf-8?B?aXNDSHkwalZUWUZZNThrZUU5eDI0UXpQZTZlM0hLS3YxTXh2TDBQZjZmTDFJ?=
 =?utf-8?B?czZ0ODZ4YXVISWR1bmJtS2VCZWJBTmV1bHFiSjNsN0lZWTZYbTh4UEo5TGhF?=
 =?utf-8?B?eTJUOS9TTjErdmRscVBFM01uc1JDYzg2U2hhUkNQMG00YUFNK0wyQ1ptQmNH?=
 =?utf-8?B?Q0xsLzd0dE05SUtSQWNrVHJwNEs2YUduSmN2RjRvc3dSWmg0TGlwbGUwWEJW?=
 =?utf-8?B?eHVBMVN6ZEdWRVpLVWM1dVlvMGp2VnRSb05PdFRad0hndHhUYzhpTUk4Nnhs?=
 =?utf-8?B?OHhiMGd3Y2V4aVRXOFAzUk5YV0tGckZxTEQ0NGlJVWpjSTBSNUJ1V051ZzZo?=
 =?utf-8?B?Y1RCN1FGVkF5cEp0aHpIcFM0c2k3bzc5UDVvcUFTQWxjdWFLNmMwYk5yRGV6?=
 =?utf-8?B?MklRemRSS2NKYk5mcWxZTXRtWUE2WE5aYlljU1E3Q2pkb0VxTlNSWU1tNGln?=
 =?utf-8?Q?c8xA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB9448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f50496-b6c8-449e-f46f-08dc36b0de30
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 09:54:04.9338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SA6itqHnv2xfh3w3qNNgz2m14x+rlTonoM/Uqw4j1UZSG3w+t18NCGKVDo9qIFbL/dChPAX9ylbJ/Wk7cOttFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIE1pY2hhbCwNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4vYXJtOiBT
ZXQgY29ycmVjdCBwZXItY3B1IGNwdV9jb3JlX21hc2sNCj4NCj4gSGkgSGVucnksDQo+DQo+IE9u
IDI2LzAyLzIwMjQgMDQ6MDEsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTog
SGVucnkgV2FuZyA8eGluLndhbmcyQGFtZC5jb20+DQo+IE5JVDogWW91IGZpcnN0IHNlbnQgdGhp
cyBwYXRjaCBhcyBwYXJ0IG9mIE5VTUEgc2VyaWVzOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvMjAyMzExMjAwMjU0MzEuMTQ4NDUtMTYtDQo+IEhlbnJ5LldhbmdAYXJtLmNv
bS8NCj4gU2hvdWxkbid0IHlvdSByZXRhaW4gdGhlIEFybSdzIGF1dGhvcnNoaXA/DQoNCkFoIGdv
b2QgcG9pbnQsIGluIGZhY3QgSSBkb24ndCByZWFsbHkga25vdywgc2luY2UgSSBiYXNpY2FsbHkg
cmV3cm90ZQ0KdGhlIHBhdGNoIEkgdGhvdWdodCBpdCBpcyBub3QgcmVhbGx5IG5lZWRlZC4gSSB3
aWxsIGFkZCBpdCBiYWNrIGluIHYyIHNpbmNlDQp5b3UgbWVudGlvbmVkIHRoaXMuDQoNCj4gPiAt
LS0NCj4gPiAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyB8IDYgKysrKystDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+ICsgICAgLyog
UEUgbm90IGltcGxlbWVudGVkIHVzaW5nIGEgbXVsdGl0aHJlYWRpbmcgdHlwZSBhcHByb2FjaC4g
Ki8NCj4gPiArICAgIGlmICggc3lzdGVtX2NwdWluZm8ubXBpZHIubXQgPT0gMCApDQo+IERvIHdl
IG5lZWQgdGhpcyBjaGVjaz8gSXQgbXQgd2FzIHRydWUsIGNwdV9zaWJsaW5nX21hc2sgd291bGQg
YmUgaW5jb3JyZWN0DQo+IGFueXdheSAoaXQgd291bGQgc3RpbGwgYmUgMSkuDQoNCkkgYWRkZWQg
dGhpcyBjaGVjayBmb3IgcGxheWluZyBzYWZlLCBiZWNhdXNlIEkgb25seSB3YW50IHRvIGRvIHRo
ZSBjb3JyZWN0IHRoaW5nDQppbiB0aGlzIHBhdGNoIGFuZCBhdm9pZCBtYWtlIHRoaW5ncyB3b3Jz
ZSBmb3IgTVQgY2FzZS4gV2l0aCB0aGlzIHBhdGNoLCBub24tTVQNCmNhc2UgY2FuIGJlIGltcHJv
dmVkIGFuZCB0aGUgTVQgY2FzZSBpcyByZW1haW4gdW5jaGFuZ2VkLg0KDQpCdXQgSSBhZ3JlZSB3
aXRoIHlvdSwgYW5kIEkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IGlmIEkgY2FuIHJ1biBhIE1U
IHNldHVwIGFuZA0KZmluaXNoIHRoZSAiZWxzZSIgcGFydCB3aXRoIHRoaXMgcGF0Y2ggb3IgZm9s
bG93LXVwcy4gRG8geW91IGtub3cgbWF5YmUgcWVtdSBjYW4NCmFsbG93IG1lIHRvIGVtdWxhdGUg
YSBNVCBzZXR1cCBzbyB0aGF0IEkgY2FuIGZpeCBpdCBwcm9wZXJseSBpbiB2Mj8gVGhhbmtzIQ0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+DQo+IH5NaWNoYWwNCg==

