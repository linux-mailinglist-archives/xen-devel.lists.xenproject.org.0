Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A5AE614A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023512.1399496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0Ho-00070K-Df; Tue, 24 Jun 2025 09:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023512.1399496; Tue, 24 Jun 2025 09:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0Ho-0006xf-Aq; Tue, 24 Jun 2025 09:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1023512;
 Tue, 24 Jun 2025 09:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uU0Hn-0006xZ-Ao
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:49:51 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2405::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ae5f8e-50e0-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 11:49:49 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PPF6483BC7EA.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 24 Jun
 2025 09:49:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 09:49:45 +0000
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
X-Inumbo-ID: 90ae5f8e-50e0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb3+4o5A6EqwTJ9o0JnzvPNtHVFbaRhkpCiyH9PYui/2pNhGFPtL7dGHHaqcE0NKkU8RDhSeUpl+3WBEalfe05e1SuOzt88lt7A+8VA77SynIGZaAozjyJNEKfO6ule5SYWu/Fo2oX/QnprzKcBA/YgDyiC+XRxn5SsamBDErSvVlFxWdtG1Xt+tV8QbYoplGN5SFDvjPS/6qiPoTObUH90Y38JRZPBq1LRODxOJs1GPtjKQMWuNTuuGSmRnlwiMgHWOfNwCS79299/Dde+JseQin9/rvZ5cxbUnhXGZlG7dGFNLZ1dCKKqx5om2dVavOjH/Dh8KixhP6GUOJzH3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFy317j9jXVo9OnIQPKhKoki6BfP54zlWeEffymTP0g=;
 b=KqZJCo+2ojD7VcwDncj0tH9ktthakcv4NYuMVDxZVyIsLAhGUOM9VdcHFMkL+7fmQNJTskZqljW0FB0xLYddOYyW8h15jeBPjPHbIrX8u4Cxz0HttolPkCxN5i5ukZBFSh2oG8iD2EOgiJubEfNQhS+ebjl/FbkqT/myt2O97oacxWS7T5Ap5TVNVGaMaFuvh3/75rzV5u0yBgzCm+ypXFvwLACccP/sQEBQ9W4qJZhvhuIHylSIZ6gm2QfZuoR4Pn2ON4n8z0Nr3ClhNSVtlNHJLBgVeGFEy9gsF3SC1+UMXwtjZpgIdCgrxjh8/fRNrtldgFOBPXqErhXu6a0Nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFy317j9jXVo9OnIQPKhKoki6BfP54zlWeEffymTP0g=;
 b=VwHpJyAMOy9awOBks0T2qFd46D8c+K/cJ3EWlF80MCoadkCT8voyZ4iZGvl9UXgfrJwv3sEqT8HAx45DNCIzKaE/47Zy9q6BJLq5wnNNa4zQj9T+DUaqeN66dbjNP+XJAama0r4+fajcm7WZVdfILKoDsVSAm6hEq27dDCcokkM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHb23yeMT8YFCMR3kaLDqQP1+DTK7QJCD4AgAme+gA=
Date: Tue, 24 Jun 2025 09:49:45 +0000
Message-ID:
 <BL1PR12MB584989B1F9DF290C15CD2F9EE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <773c448a-d814-458f-ad83-e9740e724408@suse.com>
In-Reply-To: <773c448a-d814-458f-ad83-e9740e724408@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PPF6483BC7EA:EE_
x-ms-office365-filtering-correlation-id: 18c4064e-c234-49b1-0eff-08ddb304734f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTJXOE1YckptMmtmMHNmUWcvV0VTbkZZL2NOUVlIejVpblpIOExtV0hPYmxj?=
 =?utf-8?B?TUlMa2svQU9yazZ0NnNqSUtsU3JNNUxQdzBjQ1JhNVhZdjFqY1IvR2ZrKzE4?=
 =?utf-8?B?cjNyVVhjV1JCc0IvMEw5VEhVT051VmF2SDc4ai90eEpnUU9oWm5zaFFacE5v?=
 =?utf-8?B?dGFoaHNEVTlDeE1XeHJkVHBQekJyT1Y4ZlIxbE40Mlh5b0NCTVV5Y0pqY1R4?=
 =?utf-8?B?Zmw5UFJEbmh2ZzdEamxGNEJCTUFLOFFrbFFDSlc4OGMraDN6U04yaHVObDF0?=
 =?utf-8?B?WDI2M1FvU2pWMUh1R0tpRnlZcTY2WUZZMGIwdGJicy81eHJLUXNDV085U1VS?=
 =?utf-8?B?eDk3UENHWGZ1WVJZN3JqV1dDamZqS2tUaHR0NEkyNS9IVWxWcEs3NnNsdU9a?=
 =?utf-8?B?ZytDK3pVaDNFTHhJd2hFZXh4MjRQd1VWaGdDOTh1dUFndHFmTm9EeEtDOExU?=
 =?utf-8?B?VkJCS1hiRzZnSi8zWE5aL1ZTUzZxc2RkRXpDcUNMYnh2QVBqWVVWREp6MDlu?=
 =?utf-8?B?TzBtNEVMaXZkaWJnQUo0REFFRlRkSkpyNG9aWXkyM1VrWGcyWXZobjY2Z1Fn?=
 =?utf-8?B?b2gwZkZIWnBOZU9tQ2R5czdFaFBHR21pT1NtZzE1MTRrNDVwc0pOSnZ5b3lD?=
 =?utf-8?B?YitKR2Q3a3VjQ3hLMU1JUzgxeUFCZWkwdXFOWlBmVFc5SUd5WDgwVnM0NWdj?=
 =?utf-8?B?YUpOZEF0bWIxb1dXTHI3V3F6Y0VZcWJkd2Zrd0s3cG5xQllWSUJGUUVUd3dK?=
 =?utf-8?B?RDlLVzl5amFvcEVvSVc2RGxxakRzRG1kbnpZeXB3N2N2MFZTMmQrVTk5OEY5?=
 =?utf-8?B?UXVNeGd2K21CQkpySERRdW15K3Y1QU5jMk45QXM2ZVgza1pkL3RoTnYwRG1V?=
 =?utf-8?B?NXhYRVR1b2M3Z3ZpZlR5OE1ZSnJiWWIvN2RPbjg0MC90TzhrbE1WTUJjNjJt?=
 =?utf-8?B?cXlZSHYxMGxmUUpCcVZyZUkwMEwrbDdzT0cvTlZXTXNYN09tK3o0VWZHVCtn?=
 =?utf-8?B?UWpXV1ZtY1hyOU9QNS85ZFZIeWlsVWN6SXhoNlRadVNudmJZVCtuU05IUjVG?=
 =?utf-8?B?Uks1czA4ZGJHWnJHN0o1MVB4ajhqdnlxOUh6TGdWTFpTN0tRdlFTOFdvRlUv?=
 =?utf-8?B?Ni9Pc1p3RnpIMDJNd0F0Vk5DZTN3MmMrMnRSVGQwaEE5NHNUM0Q5d0NxQzBr?=
 =?utf-8?B?akJmdkxYamU0dS8yNkpiRm5OZ0VBKzZPc01MbmVhRHBMUkxWSkdUbXVMSUxm?=
 =?utf-8?B?ZG9BSzMyYjV1SmoydWI0ODEvbTVMUHpHdUE4amZBM0pFZlVMV0poeURpZnJB?=
 =?utf-8?B?MlVKdzgzK2NDVnpZQlFpV3ZaQVlxeEdDQ2tYTHFpNnVRb245akZmUUtoZkZI?=
 =?utf-8?B?UTV4YTU0YUhKMTAxTDRwUHlid1VlZ001d3RIWjFBZkc3NXpqOGExRVhNV1N5?=
 =?utf-8?B?UmpPR3dqZTNFSVdzSEhrTE5rLzU5WWlMUkkrZXlYSnJCTVlySlNQS2EwZjFj?=
 =?utf-8?B?MDdoSldzMDErNnpjWFAxTWYxNkQ4d1BNLzJwR1FQRUdyM0t2UlZmd1RoRXN5?=
 =?utf-8?B?dStmUTFiWVFVUm1WL2JZaW9pd3BXMCswTkhnM2s3dlFYV09Va0svZkVZZC9s?=
 =?utf-8?B?WmN4TVc0STQ2T1FTdXg5c083V0ZUcjIxNkRTQ1h6ZVlnUU9MOTJnMkxCTXdX?=
 =?utf-8?B?N3piUk4zWWJwa1BhVFpGUG13Ujljc0hGS0tIeEJoRDR1RTN5MlJ3c3pmcHFr?=
 =?utf-8?B?QVJhTE1hTTJyaDhvYnA5Nkd1RzR2Q2tRMzhDRGVqVzhYbC9WNzBIcmhwYUhs?=
 =?utf-8?B?LzFHMFJYaWd1dHppZjVPMFhJc25IankydmVDc21ialZHaGE5bytWNWhIZDdt?=
 =?utf-8?B?aGVGeVF4YzdEYzBBcG5CbWlPTEFaWFVtOWQ4eW5qMzM4SVBGRE5qdm1SeVRp?=
 =?utf-8?B?YjRVd3NBZ2s0b0UwQWZYemMrakFpMEN5UzBFYVlPaU5wSE9jN0ZBakdtZGRN?=
 =?utf-8?Q?9MFEuMg+3+Mzt255Glshv3WlwC4dTk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RW5BWEFwMnVMcW5IdlUzbitNczJkYk9WaXF1TWIzYTZDT0lRN1dBYU12WWhQ?=
 =?utf-8?B?NVhkK0FWUmFycVcraFJDTUhqVDFQUjdtMFA0Wm1kbVNjdDRERUd2M1pFR1FC?=
 =?utf-8?B?Titpc250eGdoZDB4ZDNjUVBHWS9xNHF2dy9PUnN4S1VzR215U2pzb1RNMHRD?=
 =?utf-8?B?ZWlzUEJXMWdGTXY1cDZ2WHJNRDBtWEFkRldDTVRpZGdUVDlROW9EYlk3dmxx?=
 =?utf-8?B?TURtVTVzbXZPcDBvOUZzU0ZmcXlXQm9nanQ5a1E4MldNTTJSbzZ4TU9CTlll?=
 =?utf-8?B?T3NvRXFsU0lzMVFtcnhrbGN1TjdESFFVR25aZzcrTHEzcnY3d2N4STdIL0hv?=
 =?utf-8?B?L0x0RXJRZ0JPNEFFUytpSzBuUHhjK1JhMEZiVDFBWHFkMGpIVjVLcnFabTRp?=
 =?utf-8?B?ZWlPZHZFRGhoTlQ2bzI2cnU4REJNaU01MWlzSUlaY29EUnYwdDJDT2VDYVFY?=
 =?utf-8?B?cEVkRUJ2VzNpQk00b2l3T0x5M01PN2RoMGtBRkRZcWlrQmhGcUxRMFFRQkFs?=
 =?utf-8?B?bGpaTWgzVUtQQUp2VEFZRmZJSkJIUnFtcXdpYy9JUTU5eURCYWhLaDZYUWNT?=
 =?utf-8?B?eUovZ2JueWZBWUxqa3QxSlBnQ0dub0RhSjI5eFVNR01QOTZPVFJwR0FweGJO?=
 =?utf-8?B?U0pqNUt1UitkcC9hSGdoM2lDWEc5K3dIMWxyNmNsVlo4WW84Q0xWT0NRK3Z2?=
 =?utf-8?B?SjZqTEV6eVpST1dsNG9oaG5UU05RMndiWTNZWngvemtBZTZ6WDNGNEM5OEhx?=
 =?utf-8?B?THRVOGVBaml1VmUvUmNtK0hwUnVwbUtaT3BOQUdRVDllSk5aOFZuWkN6SlQ3?=
 =?utf-8?B?K1hJdnMzd0FVQUhGNzYzNU4wODZaeDk0MThRbEh4Y1Jmc1pScm44ZG92MVA1?=
 =?utf-8?B?eWs0a3FCb0RLcWkzOHpxMDVBWXN5YjUvcWRtRXR1cUFHcmpJeVYwNUJ2aWRu?=
 =?utf-8?B?ekV3UDNVVWk1bHJPWk51Y2hZalZTejA5Qy9PV1I0VWd1RHFuZmNVNHN0RU5C?=
 =?utf-8?B?TFVHTFlnWVhLSng0SDZMWGhVKzB4TXZVeUxvZ1hrWkRWQ2tCYy9ReXNIMC95?=
 =?utf-8?B?ampPRTJtWlN0all5UHM1WVF0SmMwYUVZSTFlRFNtK3AxR2JEU1FhNXZJY1Nx?=
 =?utf-8?B?d1piSVl4V3dMMGVIUDJLN1VkT2JOU25nOElWN204bGtTZVlocUxZMXRPZWR0?=
 =?utf-8?B?aXlWMnR4c0dCaXBpM2JkUWVwL1RMSTh5c1k5a1hWYnBXMzRIT1VtcC9UZ3Jw?=
 =?utf-8?B?Qm1DUEJ6Y2Z2aHRQZGVvYlIzRUlVYWpPbldrSTV4VHFqbTk0c3NKNkNlTThN?=
 =?utf-8?B?UWxvQ0dadUNZanhnOUV3NVZQQW1KSXhwbWQ3K2RuR0FoK240VHV5M3owQmxw?=
 =?utf-8?B?L0swaXlvSndyYkUxRFA4TmtDMVRkeWVKbHc2RUVhTk5lTWtSbXZUSUFCS3Zp?=
 =?utf-8?B?cmMvVFoxay9aaE0ra0kzakFXcnZ3NnpaVXBzdDQ4Ri9Cdk9QNWxUU1A5MTBN?=
 =?utf-8?B?NDYxVzlnQkJBOGR6cHJOMXNWN09KdjJvYTVra3B0clhuTnJ4Z1E0Vyt3dW1s?=
 =?utf-8?B?dDNxdkkzQTJOSXEwcUpPTHdFV25kdE54cTFuYWd5NzRTay8zL1I0YXk0K0o2?=
 =?utf-8?B?VHBjS1BudGZnZ1BUdGNQSXRCZi9nK09MdWsrVzlENVI5OU0xd21zM1lUL3dK?=
 =?utf-8?B?dy9PMWg2Rm9nT1l2N094K2JEakN6RGtBT1lsSm5ST1N2bG9mTGhpNTcvQ1Fk?=
 =?utf-8?B?QVhCQllmK3RRY1djVG81Y0c4SUJXZUlxUzVxRzRsM0lLc1plTHVzM2FtcWZW?=
 =?utf-8?B?Y2FETHJGNXdmaElmZVJ5SFpTZjEvV3phbExiTTBvU2dDMTJBM1lMcGh0VkQx?=
 =?utf-8?B?WVd0alQ0MEM5TkNKOVFTWE8zRWRQQ1BVQkJaRmhPK2VaaHM3UGJVcEJFbDJo?=
 =?utf-8?B?NUk0ZnZrUDdKT0NkUVE4T0IvSE9tbDVCV1ExQzd4c1ViN3VxZXAxcVhxbTdi?=
 =?utf-8?B?QVErYk9rNlgyVWpRY08rZXQvdFJCSXdZekZRdkZUVTBxRTZKTFU5SWNwZTJ5?=
 =?utf-8?B?cGg2ZHZuajM4ckJRQmRNZXZjbWxmMWRreTdjUU9CbUpPUk1LR3k3RHlRNHZx?=
 =?utf-8?Q?isAo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE4D8507D7C3FC498D9A989ABD63F133@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c4064e-c234-49b1-0eff-08ddb304734f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:49:45.2175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HX/1Q9VsqSFQe8lAYCcU94MiGeL4AVZSvbG4qGQoz9/C2SZix0m7/yIGaXAcAxT9v0dAe2fsQ8UdF5OZYMYbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6483BC7EA

T24gMjAyNS82LzE4IDIyOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaS5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+PiBAQCAtMTkzLDYgKzE5MywzMyBA
QCBzdGF0aWMgdm9pZCBjZl9jaGVjayBtYXNrX3dyaXRlKA0KPj4gICAgICBtc2ktPm1hc2sgPSB2
YWw7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2koc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVuc2ln
bmVkIGludCBlbmQsIHNpemU7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBj
aTsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG1zaV9wb3MgPSBwZGV2LT5tc2lfcG9zOw0K
Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3RybCA9IG1zaV9jb250cm9sX3JlZyhtc2lfcG9z
KTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhbXNpX3BvcyB8fCAhdnBjaS0+bXNpICkNCj4+ICsgICAg
ICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAgICBpZiAoIHZwY2ktPm1zaS0+bWFza2luZyApDQo+
PiArICAgICAgICBlbmQgPSBtc2lfcGVuZGluZ19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2kt
PmFkZHJlc3M2NCk7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgICAgIGVuZCA9IG1zaV9tYXNrX2Jp
dHNfcmVnKG1zaV9wb3MsIHZwY2ktPm1zaS0+YWRkcmVzczY0KSAtIDI7DQo+PiArDQo+PiArICAg
IHNpemUgPSBlbmQgLSBjdHJsOw0KPj4gKw0KPj4gKyAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lz
dGVycyh2cGNpLCBjdHJsLCBzaXplKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICBy
ZXR1cm4gcmM7DQo+IA0KPiBUaGlzIGlzIGEgZGlmZmljdWx0IG9uZTogSXQncyBub3QgYSBnb29k
IGlkZWEgdG8gc2ltcGx5IHJldHVybiBoZXJlLCB5ZXQNCj4gYXQgdGhlIHNhbWUgdGltZSB0aGUg
aGFuZGxpbmcgb2YgdGhlIHJlZ2lzdGVyIHdlJ3JlIHVuYWJsZSB0byByZW1vdmUgbWF5DQo+IHN0
aWxsIHJlcXVpcmUgZS5nLiAuLi4NCj4gDQo+PiArICAgIFhGUkVFKHZwY2ktPm1zaSk7DQo+IA0K
PiAuLi4gdGhpcy4gVGhlcmUgbWF5IHRoZXJlZm9yZSBiZSBtb3JlIHdvcmsgcmVxdWlyZWQsIHN1
Y2ggdGhhdCBpbiB0aGUNCj4gZW5kIHdlJ3JlIGFibGUgdG8gLi4uDQo+IA0KPj4gKyAgICByZXR1
cm4gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsIGN0
cmwsIDIsIE5VTEwpOw0KPiANCj4gLi4uIHRyeSB0aGlzIGF0IGxlYXN0IG9uIGEgYmVzdCBlZmZv
cnQgYmFzaXMuDQo+IA0KPiBNb3JlIGdlbmVyYWxseTogSSBkb24ndCB0aGluayBmYWlsdXJlIGhl
cmUgKG9yIGluIG90aGVyIC5jbGVhbnVwIGhvb2sNCj4gZnVuY3Rpb25zKSBtYXkgZ28gZW50aXJl
bHkgc2lsZW50bHkuDQpEb2VzIGJlbG93IG1lZXQgeW91ciBtb2RpZmljYXRpb24gZXhwZWN0YXRp
b25zPw0KDQogICAgcmMgPSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgY3RybCwgc2l6ZSk7
DQogICAgaWYgKCByYyApDQogICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiByZW1v
dmUgbXNpIGhhbmRsZXJzIGZhaWwgcmM9JWRcbiIsDQogICAgICAgICAgICAgICBwZGV2LT5kb21h
aW4sICZwZGV2LT5zYmRmLCByYyk7DQoNCiAgICBYRlJFRSh2cGNpLT5tc2kpOw0KDQogICAgLyoN
CiAgICAgKiBUaGUgZHJpdmVyIG1heSBub3QgdHJhdmVyc2UgdGhlIGNhcGFiaWxpdHkgbGlzdCBh
bmQgdGhpbmsgZGV2aWNlDQogICAgICogc3VwcG9ydHMgTVNJIGJ5IGRlZmF1bHQuIFNvIGhlcmUg
bGV0IHRoZSBjb250cm9sIHJlZ2lzdGVyIG9mIE1TSQ0KICAgICAqIGJlIFJlYWQtT25seSBpcyB0
byBlbnN1cmUgTVNJIGRpc2FibGVkLg0KICAgICAqLw0KICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0
ZXIodnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsIGN0cmwsIDIsIE5VTEwpOw0KICAgIGlmICgg
cmMgKQ0KICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogYWRkIGR1bW15IG1zaSBj
dHJsIGhhbmRsZXIgZmFpbCByYz0lZFxuIiwNCiAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwg
JnBkZXYtPnNiZGYsIHJjKTsNCg0KICAgIHJldHVybiByYzsNCg0KPiANCj4gSmFuDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

