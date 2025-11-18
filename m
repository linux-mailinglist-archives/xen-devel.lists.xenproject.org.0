Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB2C67C3C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164409.1491377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFSo-0007LU-B9; Tue, 18 Nov 2025 06:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164409.1491377; Tue, 18 Nov 2025 06:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFSo-0007Ja-7l; Tue, 18 Nov 2025 06:45:18 +0000
Received: by outflank-mailman (input) for mailman id 1164409;
 Tue, 18 Nov 2025 06:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLFSm-0007Ij-GN
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:45:16 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22fcc094-c44a-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:45:15 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:45:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:45:11 +0000
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
X-Inumbo-ID: 22fcc094-c44a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVaUPxCZJakHHcn/EzT+dY1uM/zTcv8em3TteGf/ZyQMXOgKaGXpVzLx7flF0PJOhtqdTzsg0IZvC4K7mHoBIr/ZVLde5wjB9DiRji2OLTRHql18GE9xUGxdyI+2YDkQefzkDpTeCeW0vnLmh16rgloyRtopnE2fMvnJC/ktxqMXgbpag99DUjTkLOiLu5AcWwRQ4vzSZ3xAB2WbgM6YWdFTTluFP1gfMOx7V1pVBoBAhoo9PpNV1JeNzouAL3ex4lb5UhWJvCoOcEuLbgg27LlGFaiLis2MJLEyRjPVOERzCzT5K4Vj7FSZ+H5mBotJQOUygfVef/4O2bLjhJQ9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz/NXBOCuBLoFhjBSCbJgSh6bH16gW64n/sylWndD7Y=;
 b=OyKod8H9RdqWtrajSiRH3ZJRhS4Rg6913iYDsYdVCQE2NFgAtHMIII5Im17oB7igSPDn/mJ24efy7SRTa5DBGKl8+cz/QSoZQGUsXYw+RyI3OBSvybnBQfG5mddQT/yw4eWSJDc/+e6RDM/CRv2n+L6McOs2v3u3SVXf7DugVnOV+BPrEo4GTaJ6slBUM8oRPGqX387/x3vfuLA3aqMWSGrhDMl19gBJ335WnKO9xskGkO5OJrocFJ3XE2qiny2g994nrc6uBb3oISaFbwA/rsvkLpKvPh0AV6p1zbkVzDUhVlrioCM7JkVomUEVEWwtGDc4zYIw+4KRj+7xc/lPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz/NXBOCuBLoFhjBSCbJgSh6bH16gW64n/sylWndD7Y=;
 b=AyKRM0/fFMUUI3cc6lFJvCRlVqeK0YfTFSim5ke5udGFqminuboFk2sjMLxRTqxpUDjq6ciZoGkQFm6hEAbdlbg2lhx7UGNv0IeRJjGpBAoy/+zg7SQRo8bI7vzgWLg+KR/YaXymURsoLNXitVsbM4HqRXZ8taZeuNpljDGzijQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT conditional
 upon CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT conditional
 upon CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqgC80pLf2zKEG1m+/WaQbSMLTay4MAgB0wHeA=
Date: Tue, 18 Nov 2025 06:45:11 +0000
Message-ID:
 <DM4PR12MB8451BC18FAF3D9B97F84B604E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-28-Penny.Zheng@amd.com>
 <af8eb5b1-80fd-477c-9b50-29041ae93088@suse.com>
In-Reply-To: <af8eb5b1-80fd-477c-9b50-29041ae93088@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T03:21:45.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA0PR12MB7002:EE_
x-ms-office365-filtering-correlation-id: da28e4d6-a842-44ea-d869-08de266e05ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHVaWU1YSVBZRDk0S2VpWVR6cDM0V3hCMy96aHZvRDVJL3JhdUhzOFJTUnR5?=
 =?utf-8?B?MUxtTGRvS3hLRjZDTGFJTGFzVkNNSjlPRndKS3JOVXFaUHN2cFk4MjJvOGlw?=
 =?utf-8?B?eG1SWVJJRmdSNEhZbEhLVXE4aisyTk9oUVZucW9WMHB0eGk1YmVJYzM5WVFI?=
 =?utf-8?B?aisySHc5S0FvRHNBMWJiYnc2QUplRldOU1ZwbmVpbldlbmc2K1JVamxCUHdw?=
 =?utf-8?B?NDJRcmxITW1pY05abHpxaklrZ3dSdEVSSUJMTnRuVmg3N2drelFnMWIwRUxU?=
 =?utf-8?B?WmZXRVlweWhuTWNlVmRHT25WTlFsUGc1ODUyMnhHY0VFTEZTWWRHVU9QcXRI?=
 =?utf-8?B?N0g5RG1CNHQ0WU95eUFEZnI0RXdVakFuQVBpT1BWelFNczVsZE1uYnJuUGFI?=
 =?utf-8?B?WjAxQzcvem8rVU50U3IrRTBBRldWaWVMRTdpTVZBdHRzZ3RxTCsrSlB0Tkd0?=
 =?utf-8?B?OVYrMFF1eE5paWZobUZxZEZUUVZNbHRqSUQ4aUl6a0twdm9SZ29XQ3FzTTUr?=
 =?utf-8?B?cCt3ems4cXpQc2tJSEZ3VVhxZzdCSUxmRVBDUFVHN1kzT1FMQnRGRFNNQ0hQ?=
 =?utf-8?B?Q3JsaThVOXBQdVhSZ0hzWlZJNW52ZTM5ODFIdGpvWkhEMmZSUXd3QVZqempB?=
 =?utf-8?B?eVI1SFZ2MEZFUU1FcHkrcjRvTVVtNGIvbHpGOXZJNmN1bWhGV1Noeml1NHg4?=
 =?utf-8?B?U1ZyRmhIcDBVaXB0bCtjdFZTMi92MHQ2elppMDlCOC9iNWZBRUtkL3JOL0Iz?=
 =?utf-8?B?T1RLQ1JYMTlQaTRBZ0k0ZHRBSUFEV252MHE2OHpSL0VJUlpLNUlMSW0waDc5?=
 =?utf-8?B?bUlNNk9GeHlCdTFGQVg4dk9oTlZKc3BxbUlUTEZSVllhVU94WXgvY2RTWUR2?=
 =?utf-8?B?Zks3S2Y2aTFIcCs3Zk5mOG1LZzZKcDZvRVdhdGdUN3B3TCtTUlFFUDgwOUxY?=
 =?utf-8?B?S0xVSUdpZUVtTU1MNFdpVDJRMWxxdG1QQ1B0VEt5S3diZzhQSVByanNkY0dH?=
 =?utf-8?B?SDNadFRwMktYRXdjZlZvZzcwdndhMS9ualZ4L1Q3dC9LeEt0RUlYZlBZc3ZV?=
 =?utf-8?B?UHI4YjJWK3BnbjRRcGkwZW0yQ2FCMEF2dTI2UmxnaUloSXovSUd5UncrQXhu?=
 =?utf-8?B?NTlSc1YxM0FnMlhZZVMzaHhUbFgrUE5wbURwSVpJSHFvVHJlUzNGa1NJYzJ6?=
 =?utf-8?B?enM1SVdqMjZyYUw1T0dteUQvRkc2M0NxMkJQWGhYOGRNZndkNDFjamZ0V3My?=
 =?utf-8?B?SCtRSkZDbWxmQ241YXJRYjZXWE93QlVHUnYwSFp6cUNvUUZEY1o5UTl0YXFJ?=
 =?utf-8?B?M05VVUdXdFlRRjlLQnVockgyQktRdjZsYnhVUUpQV0s2UGhWZlg3dkRmNVI3?=
 =?utf-8?B?dEJza2Z0dGtYeDBjbHBEU2VzdnJGUTVwRDBsWHlIVlpCM2UzTnl4OGtWWmt2?=
 =?utf-8?B?UHlrbXhmdFp1OG5IR3ZML3dsUW5kSVNyRjNUMjBLS1JBQkZmaXNCaERMZ3dr?=
 =?utf-8?B?VGdOZjVKQzZwQzBpS3FsL2FFMjJRdDg1aythMnZWL2VWZEdGYUtVZlJ1Nkpx?=
 =?utf-8?B?WG50T0g3NlpqM0pNVk91ckd4ejFmRWRod3gwTVhQaXAzRUtEbEZyWVVnWlJR?=
 =?utf-8?B?M0dOU3N1QTcweU1IaHgrNVRiUktzWjd4dTB2cXpqZmhpWVdodkgxL2hJZmV4?=
 =?utf-8?B?V0tRSFpnTGJ6cTlJVDNxL0NTNkpJUERQaGdlSnVFRFlTVDMrdWRyNEVKQi9K?=
 =?utf-8?B?MU1hK0pjbXkzY0VHTzNMRjlQZElFZVVuZC9xalpVK0Q0RVJsQytIWUVZajc4?=
 =?utf-8?B?bGY4citya2dKTlowZmh2L0JmeVpDWUFGcTBFcUY5eWNiSld2SDJPUXFPc2h6?=
 =?utf-8?B?Q2NZTzhEVUhta1kwMFB0QkFBamlybXkyeWNnN3Fnd3pCN2hJY0hSTERFMnNX?=
 =?utf-8?B?dStHenFGYWowTDl4NERuMCt6M3duSlo4Q1V0UldvcDFiTjc4SzhmL0pxbms3?=
 =?utf-8?B?dU9zemlZOUx4M052NlRQd1RHcHJuNjYvM2tQdEg0YmkwTTB1Mm5JR01RdUZ2?=
 =?utf-8?Q?5Ljsnx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzNjN0FabUlaMm84TnVSYm9rcW93R3o3dUo1c0lkUVFOK3hVbTZrU3ZFMGdw?=
 =?utf-8?B?S25BTldPQ09EK0trUE5waVk2SEJvZkYwRUZ2WGhBcDJBaDVoL2wxNytWL1RG?=
 =?utf-8?B?bWg0MDJIYzRwTEhqZVRlWFY5Q0lYWXkyMk9EUS81Y2h1bkpESXZxY3FXN3VI?=
 =?utf-8?B?R0JUYzZFYlJrbkozTTBtOWdEZXE1WmRrZE9mYUV4OVNianNScU9rSG1iOC9V?=
 =?utf-8?B?NC84dlJiVDZHQTRxZ0RuVkpxYnJ4VEpYcHpkOUk0Wm54RGxCNUJLNTd1UDNn?=
 =?utf-8?B?MVVQM2UxdVB5NEJOV1VpVVp4T1ZQb3RsUXpvZ0hiY3BVcjFlVGVUR0cwUjBp?=
 =?utf-8?B?dUlJK0hKV05Kck0zVFlISFYxTFZlWU9lMTcyM3hIelV0K1RBUGJBaXN0MkpN?=
 =?utf-8?B?RWdOSFhjNi9JdTJNY29tRmpOalU1dGFFMSsxV2JGVFNMQkxrSFIzVGo2bW5m?=
 =?utf-8?B?YWI3N1R2WU5Uemo1a3dCMEZwU01LSmt5aGJybFRaeHVpZ0tmZFZBMVdZU3ND?=
 =?utf-8?B?QmI3UmtZQ1JMVTAzZ1daOWl4a2JyK0pMb05uaW9yMzB4R0xJZ2s5SEhUa09n?=
 =?utf-8?B?ZlkrWXJyc0JkeitDdldPYW91cVBjWi9aUWJ4ZXR2a1Z1dEhyWUx4a2N6dmIv?=
 =?utf-8?B?blJRT1JOR2Y0TnFLYmVBREtnYjBNSjVyL3FZbmlWNW53YkNJTmkzbTlDVjJN?=
 =?utf-8?B?UGRBeEUwWEtuSG1jc3JYLzk3dnpSU1hzTVF2K3V4MTFGSDNMampYZWNBOFdN?=
 =?utf-8?B?TmhXd2l6YStVRDA0Rk10a2NDRnNzRU40d1h6YnhpeTFjbVZPOG5NQUV5blZz?=
 =?utf-8?B?TnM1VVJVdkFhWTc5ZjZmemZhSGoydWtWZU1lVUlmWSs4eVoxWWdoaTR5dXRW?=
 =?utf-8?B?eGp1STAzdElGVGZNZFpWUUxzOU42Mll4US9OeXJjOXVIOWNnTk5DNndmL0RT?=
 =?utf-8?B?V3ZrcVFQL2hHd1VIdlFjOUN0VjBmT0xoRGhtd3Nmek9NWTRaWVJDTk4zd2M5?=
 =?utf-8?B?dHA4anpwS1d6MkZ5OGFvWmxHS0p0YnMyc2V2MVVHN1BKTllZbFo2TTBZS2s5?=
 =?utf-8?B?TXBiTE9hclNRSFIwWUlzbzVQLytWKzBiOHg3SVFCY25MM0RQeTA1ODRlbHFr?=
 =?utf-8?B?WU1qODlwdWo3QkhDY3N4MlJMZUJIUloyVVBCOEl3a1pUU0RnZnlFVUVPUmZk?=
 =?utf-8?B?UXlyWjFFR0dISVczNk93bkNQY3FTYTh2VkdoQldrMHZIK0hqbmh6ZTFHQWg3?=
 =?utf-8?B?bFdJeVNkMUxBK2s0TDY2dFZhYXZ6dmcyZUdOdzNJRGxNWGM1OStIT1p4SHlM?=
 =?utf-8?B?M2pxcXpVdXl2TzVNdGNsakc3NUcrZE44a1Vtb3dYUmJTMXFHWktCV3pRRDRE?=
 =?utf-8?B?L2dZMFZtMDNJRGJ6dTdvUlNTRzZGWG9FYWZReWsxYW05dXprRW9sUmdTb0ha?=
 =?utf-8?B?aWpLSXRMNWtLR1JpYWlseWxFU1FTczg5djAyQzA2bGN4U3o0anFTOHk1dnZS?=
 =?utf-8?B?UUtnVWI5OVhSLzEyV3VYM2ZzNGVtc0lBa0hIeVBuZ2ZWaVI4eXR0UnpxYk9N?=
 =?utf-8?B?SnBLTXBOd0gwOG5BRjBnaTlDN0lLK1F3V2U4enFpUnJWTlRrb0MrRHFmdmpC?=
 =?utf-8?B?T2ZqT2xuRHBXSGo5Y0NBSjRkMWNDdXNwbDBQWGQ3M2N4LzRsMlQzcFJONW1Z?=
 =?utf-8?B?bXhvOGVHd1dWckpNdjhVcFFXd3V3Z1R2REpiNWFlNWQxY1Ayc2ZkK2RwaW1y?=
 =?utf-8?B?NzRNNld5Z1RaQUdUaE45RFp4cjFJbmErSFRIUmNQbWwyWm8yTkhPcDNkQWpu?=
 =?utf-8?B?NUhGQ20xYnEwZGRRWVJDRlcvOTFWd29CVFlIZVV6S0hmNEZmbm1ySVQzN244?=
 =?utf-8?B?ZDR1NThJMi9MWGNCWWcyalBYQkpnSW80UUdUd2ovcU5XQ2tyNGZ6MGhYd1V3?=
 =?utf-8?B?TSs4LzhYMjJCZkhXZE5YTzg0MW1WazFwaTEzeUJjK0h5NjJ5LzYxZ3RLbmw1?=
 =?utf-8?B?bDZ1NDVRRUJ4VlFnSzdETkU5UmNEUS9GdEJFR2tlM0FKc1dxQmM2cXhUVjd3?=
 =?utf-8?B?Q094R0RhaHljTDZGU0pGbS82M1l2eXc2S3V5eDExNk5Ha2daY0Z6NkF3dnJt?=
 =?utf-8?Q?iH+g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da28e4d6-a842-44ea-d869-08de266e05ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:45:11.6238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+z1uoIZuDDMg4r9klSWdHY2ZKYg+iEdcpcWZpAgBYUegobsgdofrsw81wgZvspNLWjmzpYXhMBErn7O4PArUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAy
MDI1IDk6MzUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDI3LzI4XSB4ZW4vZG9tY3Rs
OiBtYWtlIEhWTV9QQVJBTV9JREVOVF9QVA0KPiBjb25kaXRpb25hbCB1cG9uIENPTkZJR19NR01U
X0hZUEVSQ0FMTFMNCj4NCj4gT24gMTMuMTAuMjAyNSAxMjoxNSwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gSGVscGVyIGRvbWN0bF9sb2NrX3thY3F1aXJlLHJlbGVhc2V9IGlzIGRvbWN0bF9sb2Nr
LCB3aGljaA0KPiA+IEhWTV9QQVJBTV9JREVOVF9QVCB1c2VzIHRvIGVuc3VyZSBzeW5jaHJvbml6
YXRpb24gYW5kIGhlbmNlIGJlaW5nIGENCj4gdG9vbHN0YWNrLW9ubHkgb3BlcmF0aW9uLg0KPiA+
IFNvIHdlIHNoYWxsIG1ha2UgSFZNX1BBUkFNX0lERU5UX1BUIGNvbmRpdGlvbmFsIHVwb24NCj4g
PiBDT05GSUdfTUdNVF9IWVBFUkNBTExTLCByZXR1cm5pbmcgLUVPUE5PVFNVUFAgd2hlbg0KPiBN
R01UX0hZUEVSQ0FMTFM9bi4NCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPg0KPiBJIGZlYXIgdGhpcyBpc24ndCBxdWl0ZSB3aGF0IEkgc3Vn
Z2VzdGVkLiBUaGUgcGFyYW0gZ2V0L3NldCBhcmUgWFNNX1RBUkdFVCwgaS5lLg0KPiBjYW4gYmUg
dXNlZCBieSBETSBhcyB3ZWxsLiBUaGUgcGFydGljdWxhciBvbmUgaGVyZSBzaG91bGRuJ3QgYmUg
dXNlZCBieSBhIERNLCBidXQNCj4gdGhhdCdzIGEgZGlmZmVyZW50IHF1ZXN0aW9uLiBTaW1pbGFy
bHkgaW4gcHJpbmNpcGxlIHRoZSBQVkggRG9tMCBidWlsZGluZyBjb2RlIHNob3VsZA0KPiBiZSBh
YmxlIHRvIHVzZSB0aGlzIHBhdGg7IGl0IGRvZXNuJ3QgcmlnaHQgbm93IGluIGZhdm9yIG9mIHNv
bWUgb3Blbi0gY29kaW5nLg0KPg0KPiBXaGF0IGlpcmMgSSBkaWQgc3VnZ2VzdCB3YXMgdGhhdCB0
aGUgc2VyaWFsaXphdGlvbiBpc24ndCBuZWVkZWQgd2hlbiBubyBkb21jdGwgY2FuDQo+IGJlIHVz
ZWQgdG8gb3RoZXJ3aXNlIGFsdGVyIChyZWxldmFudCkgZ3Vlc3Qgc3RhdGUuDQoNCkFoLCB0cnVl
LCBzZXJpYWxpemF0aW9uIGlzbid0IG5lZWRlZCB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLCBhcyBu
byBkb21jdGwtb3AgY291bGQgYWx0ZXIgdGhlIGd1ZXN0IHN0YXRlIGF0IHRoZSBzYW1lIHRpbWUu
DQpUaGVuIG1heWJlIGFkZGluZyBJU19FTkFCTEVEKCkgY2hlY2tpbmcgaXMgZW5vdWdoOg0KYGBg
DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMNCmluZGV4IDVhNTA3MjFiZDAuLjRlMWIzZWU1ZjQgMTAwNjQ0DQotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2h2bS5jDQorKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQpAQCAtNDMyNCw3
ICs0MzI0LDcgQEAgc3RhdGljIGludCBodm1fc2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsIHVp
bnQzMl90IGluZGV4LCB1aW50NjRfdCB2YWx1ZSkNCiAgICAgICAgICAqIHRoZSBkb21jdGxfbG9j
ay4NCiAgICAgICAgICAqLw0KICAgICAgICAgcmMgPSAtRVJFU1RBUlQ7DQotICAgICAgICBpZiAo
ICFkb21jdGxfbG9ja19hY3F1aXJlKCkgKQ0KKyAgICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJ
R19NR01UX0hZUEVSQ0FMTFMpICYmICFkb21jdGxfbG9ja19hY3F1aXJlKCkgKQ0KICAgICAgICAg
ICAgIGJyZWFrOw0KDQogICAgICAgICByYyA9IDA7DQpAQCAtNDMzNCw3ICs0MzM0LDggQEAgc3Rh
dGljIGludCBodm1fc2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGluZGV4LCB1
aW50NjRfdCB2YWx1ZSkNCiAgICAgICAgICAgICBwYWdpbmdfdXBkYXRlX2NyMyh2LCBmYWxzZSk7
DQogICAgICAgICBkb21haW5fdW5wYXVzZShkKTsNCg0KLSAgICAgICAgZG9tY3RsX2xvY2tfcmVs
ZWFzZSgpOw0KKyAgICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19NR01UX0hZUEVSQ0FMTFMp
ICkNCisgICAgICAgICAgICBkb21jdGxfbG9ja19yZWxlYXNlKCk7DQogICAgICAgICBicmVhazsN
CiAgICAgY2FzZSBIVk1fUEFSQU1fRE1fRE9NQUlOOg0KICAgICAgICAgLyogVGhlIG9ubHkgdmFs
dWUgdGhpcyBzaG91bGQgZXZlciBiZSBzZXQgdG8gaXMgRE9NSURfU0VMRiAqLw0KYGBgDQoNCj4N
Cj4gSmFuDQo=

