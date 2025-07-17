Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A06B08D9F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046827.1417212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO9K-0001fG-LQ; Thu, 17 Jul 2025 12:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046827.1417212; Thu, 17 Jul 2025 12:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO9K-0001cH-HX; Thu, 17 Jul 2025 12:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1046827;
 Thu, 17 Jul 2025 12:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ucO9J-0001HA-2l
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:55:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 586cafac-630d-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 14:55:43 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 12:55:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 12:55:36 +0000
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
X-Inumbo-ID: 586cafac-630d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5KKxyAX7Sqx/gxz9059+jf/WsLx9NoQidyDuHgsHZLMFt0f5J5mWXgJ1R/e72Pj05ELefx7fsVUuJqM1qi4l8vzB48Yh8yAqOT+KpBbE07a3Fw0v7iQyuI5sYI3RTL4U1x1GhJ2ipvRSXzRjj6cnQ32Z80cmdklPBnG24IyVYIEi9g5xItlE7Ftwtrs1ljfBB3G58T/R5xCmqfrDdJyHds965+Iy0YDwVGd2BlsmGs/Z9hWM3sSAycZAHMKOIwKleiJ4mMpQo2tqX0FUm6Cf09PqguU+Csl84n6Zc6Ad+twl+m/J1Wb+AyCHo4dm+hHoyIpWsv1GjimvJJlmnWu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQqYpxn0j/GZzcJOOdmEYlYuJYB/gmPlDFNl+Ni+JTA=;
 b=XEylOf/YBfc+g93138dlH5Tuq9OiCF7xyS/wPRPOzGGu97qw8UScwxpyC3VVVPW3n2AaOtei+YWaOydQOsY44UYth4kkMRP+QWdKpIsvzYKyu/96HOHDSPqQzUD3PJMYIgho6ICNgdnhG9UwvA8ShM6koJuQVcYJtsP0QEiNdxkMD7NEqoqV4ZKEPik8L75Oog6wgvaqpA1HlBOudlVy6XGnTyQlEsXbg1OgAvj3wrcgQ0biKQrDLYwmuus7Nk+RKVuRrIeQ6+yLovcMhsUOOqh14saH7HbVcABN0axkWgPacfDlduQ5VgnXIxzDeToWL9Upo7ADgss7PPZ4gxaf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQqYpxn0j/GZzcJOOdmEYlYuJYB/gmPlDFNl+Ni+JTA=;
 b=hFRlHfnqb5dxXAB9Xw1MR8KCw2IySNDYihUkQxdIpsCRFeUO92WMuWr0nACnDOsDpLBFPlOy+p96aAxHLPH8jTq1OksPbOgAcMTzRg0NN0jZdAiF5IG/uGVxXfrjbPFIC1k5K1TXxc3644PljFW4hqXhcbK15hcc2ItQL48Xivg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <58feb201-40e3-4740-aa47-f48c2b61cbb1@amd.com>
Date: Thu, 17 Jul 2025 14:55:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm/mpu: Implement remove_early_mappings for MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <1c3cde21ab1ef1c2d9cadf07472ce2df10d70cf2.1752565274.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1c3cde21ab1ef1c2d9cadf07472ce2df10d70cf2.1752565274.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY5PR12MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: d936d827-ea61-43c9-af85-08ddc531398c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUhmWmJPcVFWTzdaR2wwMTNKUFRFVlhwVUJpNHcvV1AyQ05nZUZiTEJUMHZD?=
 =?utf-8?B?dExKTUp1U1VQZ1paSEhxNmtOVkVDYm5QSHludTFQclF5dmZmNHJPTEUyTnR1?=
 =?utf-8?B?dkk3b2E3R0lUKy83MXZJazFEMFBHZ3JiYmtiV0lqZUNaSCtwcVJabWtZYzUv?=
 =?utf-8?B?TFp4NkdCT0RucWdDQzBZRFRRVDkxWXJ0SlpRbWljVXRBTWdSbXU4S1g5L0M4?=
 =?utf-8?B?bjZJcXNjYno1dzNQaWpQdFhsWThOM0VYOGFhbjM0OFJKbWlhUHVnR2J4dm9G?=
 =?utf-8?B?c1ZFSVVjeHQyN01wd3k0YnFQZ0pKcWdvRUpxckh0eGFLaWFpeGpmNjk3MUp5?=
 =?utf-8?B?dE9tdWRPZWZTTUR4TWtwUlZhSSt5bHoyeXBSbEh3eHhkY0MyVmRaYTJjOEpE?=
 =?utf-8?B?d0V1eEg3bGYzUy9LMk0vL1p6Qzd4SzFra3p5cllndzNVRXdNN1FyaElkSzk3?=
 =?utf-8?B?WDgwZndHam5mbll1TUJPL2FaMW9NZWxPOC9BdSsxWlgrU3dSZmcybHhwelR5?=
 =?utf-8?B?T3RHRStLY2w3QXdsRjY1L2NDcWhneHQrWk5QOVVpdW5XbCtESFV0NVh2TmNx?=
 =?utf-8?B?T0RrRDJLTEFnS204ZENMdlpQT0MyWEIyZkRuRTZMVEdBVFF4VGFXekNpSzFh?=
 =?utf-8?B?VDBmSW9qN3JkN25LNGhLaVlxcDJpc3pzeGJHNk9oVWYzcjJBZDUyS2FoL0pG?=
 =?utf-8?B?YlBqRytKcHc4QnlRSzlWU2RYVVUxUVl1SC9PQ09XYjIrUE5oejYzWDM5bVRu?=
 =?utf-8?B?ekZ6c29qWE0rZ3dqb204SHFWeUdxQU9BWlJWRHhmWGsyY2IwWkRHMVRHZ3B0?=
 =?utf-8?B?MVY2U0tBeEJuNnBYV3JRTXY4dnlaaHd4N29xbERLTTVBSnlnNDJQaU1ZMlkw?=
 =?utf-8?B?TmJDUUlJSzlSWmJIOElwVUk1b0hoM3RWbnExaGlqZWRzeVo4SmFsanZhak9k?=
 =?utf-8?B?eE83L0IwUUdJN0hzWGw0MW9OTitQKzZaTWROYU5PSXlXVWVhbWQxRStHa3dC?=
 =?utf-8?B?Rit6RS85dTFVR2dTQ1BPV0pqekE5NFhpamthN1J5cUxTeElGV29TakNEelg4?=
 =?utf-8?B?ZlFlVTdHRjd2NTEwdUpjaDU5Ky8rOVJQbzZnQTdIdHRuMSt2VDBXeVBXVUNm?=
 =?utf-8?B?WFhJSTdEaGc1djcrNFp0YXRHejFjSE16UEdpaERjSFdCU1BTOENnSkZMQnlz?=
 =?utf-8?B?THFhdHFXNmQ3aEVWK0pzclRUa3BDYXlwRFk2clJHN2ppQ2hRalp2aG90M1ZC?=
 =?utf-8?B?clR0V3MrQ08xWU1LVUw5SjVoODdzK1c1L2pacVdpeEVVYnlmelpNTXNjZk1z?=
 =?utf-8?B?ZXE0MGFYbG9Xb3FkbTJaZEd4UU4zanBvQ0ZXcUhxbEhaQUdHclZjRERnaCto?=
 =?utf-8?B?dVBDTmN4SmF6QjEzeTFrTmRleURRNkxRejZJMy9RWGtVU1N6eTNVeExodWZ6?=
 =?utf-8?B?OS9mOE1HR3N4cWtaSUtlSi9WeE4zdVNKK1NsWjZieW9VYmVOYmd4R2xYeGhh?=
 =?utf-8?B?WGw5WkUzNWUxTjFKbGo5dXNOUG1kN1BqdG1zSFV2eWY0WklzRllZdUxMZXJK?=
 =?utf-8?B?UzhJalNtaW1yL0VaT3VKV0IxZTRURnFyL0Zwb055T3poNk1BQTdvT280TE5z?=
 =?utf-8?B?RStLVW5WcDZFa3NyM3J3bEdWVytmbFRYVzB2cWdrbTBlTVpXelgvUnN3M1Z2?=
 =?utf-8?B?K09aTGgvNDZZSEZLZ1FkSDBZRlJWcnVNWkQvUDEyTmVzU1NFb0xtYWk1elMz?=
 =?utf-8?B?RldLa1NIYk1hS3V4SmxEajZHdzhMUFdZK1piYkFGdUp4VWNGYUdLeklidGpu?=
 =?utf-8?B?RnM1MFdwcFROK0VHR0duc0gzNWh5UjF0ZkRVMlh4TURrMmpmbzNCVW1DVXZi?=
 =?utf-8?B?NzNGaGlkUjBiWitSWm1iZ3NOdmJmUTNFYjNWOCtuOXlodmZuSmZNRWdiOE5p?=
 =?utf-8?Q?0qOTg60lsRE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1V6YXdnOHZwbkdEMjZPTlR3MVE5NGh6cW4xRGJCZ3FqWDVrS3Vub3Nmd0xE?=
 =?utf-8?B?M3pNUWhpVXZVRzFaeS9yN0pFaVJBRkluZDE4RGppWk5xbGQ5NHY5ZC9IdjVB?=
 =?utf-8?B?K2FqaEJmTGgwZGt6WTJPZjE5Q3U5MFg2RzZHM2FqVUM4TEIxRUV2Slk0Zkk2?=
 =?utf-8?B?UVA1YlhYVDB3Q0Y1alNQUnV4L1k5ZnBPVlNlcFdtdTNocjY2M3JEYkNZbzhC?=
 =?utf-8?B?SUwyckttQVRPbmZ4enpSZ0V1cTQ1eFdXaDFMUFZwUk8vT3VmNGhuVzNFMnNL?=
 =?utf-8?B?c3VidjAyZFM3UlQyVW1oUWNMOTJsSzV6NlB1VVJmOThlZU41T1NtZWlFNk0y?=
 =?utf-8?B?cmpnamJFeDRoNTNDdWtLUjhvbUpRN0FMRGFxNXhRaTM3dnoxalZ3NDhoUHdt?=
 =?utf-8?B?UjArM3phMDJFVlFXT1hrY3NwMTRIY1daOU5zNHF1S3dXaEhYRUFuQ1MyUHR0?=
 =?utf-8?B?MFIxWmFPa0JIYkk0UVAyZVVOT01QNmJIdzRQbVpDY0g4NUpoSHBMckdZM0ZX?=
 =?utf-8?B?cmdxK1hNdzdwMStrbmVVaFh3RTQ3aSt3eWlySTVXL01hZXluc2lwbnZkZThW?=
 =?utf-8?B?V0JTQzdMbzhEVG9mbms5UmZ1WDkrMGRGWGZ5cCtYYjEyK3pxSkxmZ2dyblN2?=
 =?utf-8?B?bHFRYjcwQ1U2eWtwSitUQngxdUhKK2MrSGd3NW1rcy9kdjdZNUkrdlM1dlhR?=
 =?utf-8?B?M3VFa045akV0cCs5RWpDbFpUZjBnZzRHWENpZVIvQjJiRWtZODZhMS96REJ6?=
 =?utf-8?B?U2dDcjZYREpsQkc5YzVJN2FIbHA4ZFMrajdQMGpoR0FiYTA2OUpZUHZLdjc0?=
 =?utf-8?B?SE5VRHVEMzRIMldmS2hRM2hYQUhHZU5oNXNXeWVpbFRHa1UxU1R3NGU5SUNq?=
 =?utf-8?B?RW1COUFYbE1udW5xV3U2RUppSlVxdHZsNEZoYWRRSWpaYVNCZU5kb3JSQUM4?=
 =?utf-8?B?bE9MaFpQNDI5cWpFSFA0TkNZLzZKUlhZdDN1OS96ZzcyTzVxUkNHeVlQUG5s?=
 =?utf-8?B?cjJQaFB4NTlHRzI3dTMrWXJOVGdUK3JtdHdoVlZHZUJYakNCM2Roek5mTjht?=
 =?utf-8?B?VzNvL2xWZ2VTUTB4RGswRHpBNzRiOG9qMVRaVHlJeDdRVllVRUVrWXhQcDBt?=
 =?utf-8?B?MGpOaEl0UzB0dktvZFFNVGoralIrQS82Rk1UUjV0OU9PUExCV250UG1McUZu?=
 =?utf-8?B?K2dWeXZMdUwydnkrL0p5TnpIc25pVGFQMVJKMzlHQXEvcWd5dzd4UkJwNS9x?=
 =?utf-8?B?bVJ1SXV0ODNtbUVJaVd3MHZtTE1qdDQrdGp1czBiRld0K1FydTlmZGVxbEFZ?=
 =?utf-8?B?TSs5YjRGY3NraXl1U3pLNDlwdURhbXJmQVJYTGlIMnNNWWZIclZqLzdGOEI4?=
 =?utf-8?B?eEMzRDA2dk9jNFRodHBGdm43cGhnVDJicndKRi82VnFTTjRnTm93cWUrZWdF?=
 =?utf-8?B?UXlCQkM1ZE1TRHhQb09aVm13RE12UlVaWUsvdFZaU09DTDdzeEhyRE4wbWVx?=
 =?utf-8?B?TnJqSFFhWVRGaTc5ZHNEc0RuRDhmMmRwOFltTlI0NkdUUjdGbTV1aWdUR1lm?=
 =?utf-8?B?MkFHSzdUMURJWVhBbUVibW41SWtQTSt5emtBR29EUXhIUGgzalJXMDdkNnRw?=
 =?utf-8?B?anUzVFRUOC9NblE1YVF1cWhoRjRHMlBZaEUzYXJxN2JkbUcvdmNqRjkyTnRo?=
 =?utf-8?B?SC91c1NRdGRQUnRXeGtncUFoSXU3a0xCRGZPVkMwTm9Yc1JEMjk5c1I0cHp0?=
 =?utf-8?B?eXdYWFRVSVZXb1Ezem5PWG1XMXhteTYyM0s4cXJEL2RqMFhLM3lxTXZrRmhN?=
 =?utf-8?B?VnZudUN6UTJxMVJXbHZuVmZ6NEQ4SUlmSHpOaHN3U1dXTmZXRWl4ZHFxSTha?=
 =?utf-8?B?czU0dGVveTZ1OUwrS2hyWTA2UkxTc1pyWnFkaGx0UDRyN3dmM0pVTk54UGZS?=
 =?utf-8?B?R3c2cUxOWDRMTGtRcmNtVi90ZmNTdStkeWJDSGJKeWwyTlZXZ3FnUW9PRWJV?=
 =?utf-8?B?dUhTL054VUVyV3QzQ3pXOXppdWdBYmtpTUYxZWcwMVpyWHkwM2UrSzdUR0Y4?=
 =?utf-8?B?Z3ZkOEp2RWUwQ3RwM2FHd20xc1VrREpNU2tjVTk5aFcySmdlTFFsLzArRzFl?=
 =?utf-8?Q?i2cYreAuryXuFszuMun+iVSme?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d936d827-ea61-43c9-af85-08ddc531398c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:55:36.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDUVEVPJr3fiKHhwIfuMvJlN22zAof0uzyGWNj+p6CGkjPWdOebXZIG/OYhZ4MbL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322



On 15/07/2025 09:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement remove_early_mappings for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1:
> - Add Ayan's R-b
> 
> Changes from v2:
> - Remove full stop
> - Remove sanity check for `mapped_fdt_paddr == INVALID_PADDR`
NIT: Usually such changes should result in dropping tags

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


