Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661DAA4357
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973385.1361513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1Gw-0003WH-D1; Wed, 30 Apr 2025 06:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973385.1361513; Wed, 30 Apr 2025 06:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1Gw-0003Uo-AE; Wed, 30 Apr 2025 06:50:22 +0000
Received: by outflank-mailman (input) for mailman id 973385;
 Wed, 30 Apr 2025 06:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5DpC=XQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uA1Gu-0003Ui-Oa
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:50:20 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:200a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600917ca-258f-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 08:50:18 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 30 Apr 2025 06:50:14 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 06:50:14 +0000
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
X-Inumbo-ID: 600917ca-258f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/4qxkC7cMrBqDLic32H2pcnk0ZWjNhJvfK6JKGLqQsTP9yiTEkixnyDY0GhwZyx4qeOKmRkvFM+FX2i6MdA7TDwqgrxqpn1AEC2gO6G1gGg5IjWWmoYEq6YHsbhC3gyM+SaBCd8b0AylwFtsPUAedGSSEQBTyTUikQFIS3RY9RQ4gyteiRByE9a2OGgTxnWbRVaYnDCU1+Qiqq8rHxDraezrVa3gwFiRC9gytdrfPXmRdrGl/SUxwVtMS/6CGar1g426puyAYIL08uPwhYis9hhHKrYIxxqR07Mz/nTPcydxWoMdlJm0FthI/sTYdmL3BYx45G2NzmSIvd38tIo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vFprCr29jghU6cT6aS01nLFHBdyMHqOaRktVO2FGW0=;
 b=SVZpSPKQO5lJyvBzAAYEle22nNSqP0Zp+6usghHtcOShdyugJTj/h+aSbQFarBAgsQf/yue7QssLQrwub12MuEQ3oiO2QwGkXy0EdmK60pQiNZiqPlXV6CVT0kAx2iaCGSyz45RDGw4F6bMld6W9EXNzj+LTbYNJp+WxCQtXZW44+E3222IuCw5YWO6nob2T9UsVqBamCSOM3Zbnd5kigzL+FosVLZamZkMOLTq+0ivp5aoUkr3i1urHomB0rodYUKCw+NgPTDwUbr6JKqh+z6aEb08dmmtpncVYRNE1yLqpyb5KuguEdhO0kF0vCh0glTl8sfFl4F3ukW3Lus6T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vFprCr29jghU6cT6aS01nLFHBdyMHqOaRktVO2FGW0=;
 b=D70jRQmKExTicY+IkGdoGL0y2G8eX/9OufZQ61aQcxXxOvyJZaNszv3TNKD4sGgXIA8NJuZJ0MZ1091Ltc2e4BLxb5cZdLNVseACJTeJQqK+2TRWmXo11zOieQ9cUWvG+pqq+9MxHRC8nvjZj2Aie8+Gn2ufBjb1lTtIMhyxCQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6d168c2b-08bd-47ef-a991-8de8c01f406e@amd.com>
Date: Wed, 30 Apr 2025 08:50:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f14a397-de10-4e5a-e471-08dd87b34280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUtyR1dFWDV4b1VWN0tFMktHd1BxZlRxemI4UkhhT3hoNjRKM0RmempjUVFI?=
 =?utf-8?B?blB1ejlKNFU5aklPZGZrQ1RaYStQb2MyeHBsTFpqZ2N0Vm80VTBxTGIzcTkx?=
 =?utf-8?B?NUV0cjB3NTNzQ2FqcStPN0daWkhiZHRMdkc2UllBN0ZKMlNUdGl6UGVKR0Vj?=
 =?utf-8?B?eUJXNHVNeFA3MjBvaGYwdHhRamFPemxjZTF0RGNyUVl4OUtTNkNpRm0vaDhR?=
 =?utf-8?B?clZIditpZTlXQXRKM1J0R2RUTWpseStqcUR5Z25mZVJCOW5EazRQNFRGMjlh?=
 =?utf-8?B?cEtnam9XTmtGbmZUU3JxZTZaclZLdUxxSTd1S2VyM1JpS1ZSbmtSdE9GNG1Y?=
 =?utf-8?B?TkFSajF3VUhCaStieU1vVWFLdmpWeTN1L0VuR2s5TTZyMVNjcWs5bVBMUkE4?=
 =?utf-8?B?NGFQTjJoNjVFdXZXZ3I2c0lMMVJpZmxZcGRUTFM0c0hNVkJ0enZWeHJJV1VK?=
 =?utf-8?B?akpUdjJTM1ZFK283Zk1McnREWnY5OVBUdTg0QVJZd1d6UHZkelY3RWhDNGdE?=
 =?utf-8?B?ejZ6QmVzdjgrYVBiMFBWZFVNLzRyR0dQOGROd1NBUDBYS1ltOEJ6TnczUkk4?=
 =?utf-8?B?RnRRMWV1bjNNaCt3NW9CbXRuTVFPeHVpUkk1ci9zckNzK1ZieHNBRGJsRzVt?=
 =?utf-8?B?VldEVlNIeFk3bUVLaWFaNEFISDl2M0Z3VXBHUTNReU53V0tUM2FOa1ZpWlBi?=
 =?utf-8?B?VkRabENCK2FoVFFDZkRvQWxOczhZOTFZdllqNUJISnFuQVlDM1VUSE5jVm5i?=
 =?utf-8?B?TThrQUN2Y2Q3cHNoQllRS3h3MnNpd21Wa3BqSzVuTnBsRzFMU1ZzWlN2dUlL?=
 =?utf-8?B?RS8wZ3pxZ2I1TGNUWlRhYlJiVWF2bHdnUXVJNCtqUUV5czVxSnRTY3BwTVpi?=
 =?utf-8?B?Rm0xV1pQSUJUa2JDT0NhTW5lMnNhSENTTG9RSVNkcGF0eTJHSUQ2dXd5Rmdj?=
 =?utf-8?B?d1VQbVdBNitUcktyQUl5V3c0UklsWUc5VTI0RFlhbXZweFBhZXY1eVhwSVNt?=
 =?utf-8?B?Mi9meEh0QUt2TUJqUVhGaVhlZjlhU21hTWZ1MWRsWk9CcWFFa09scnY5emU5?=
 =?utf-8?B?S2xzTFB2M2NUR29HMUM5Y2xTU1gxRjRteGJIU1REYVFYclNOR2ZDQ2M4V1lO?=
 =?utf-8?B?ZjU0bzg1RVo1dUVSaW8wYkxnejk1TlJENHhwdHhSUFFLQzBTRUYxQ2tiSTFn?=
 =?utf-8?B?K1ZDbnBHQXpzeEpxYUw2aDl2d013MDk3VGlOTTNvVXFzQXllaTF3bWdDQjRp?=
 =?utf-8?B?NGtybnBBVkhtSFk1VDNuWmlxNmpjWDNPdlBrWEZ0ZFR6MnBWOXJ6bk5qVHFw?=
 =?utf-8?B?VmF1Um5ROVVXcy9iTUxzb0VXYUQrT3hOWS9namVHUEZjNDlLTWM5Zi9tcGtE?=
 =?utf-8?B?SHZ4YmlmZkEzZnBGcWd4aHNYc1BWN0RPUElKSmZySWlBNGhiNGtHd3pBWkww?=
 =?utf-8?B?N2srZklXaXA2SEhyMUU1M2ZYcVg0dGtsYVBpbzF4aEl0RDQ5ZzNYZHBDbjVy?=
 =?utf-8?B?dFdrdUFITU9pR0RDaEdBYmZqeDllcDlJNjdlOVAyd1NJQWxCNlIram53L1hH?=
 =?utf-8?B?WHBZYXVHVzZ2NElDSWhNZ0VpZEsxeXQydWczZGRmNkdGY0ZiSWMwMXkva1lh?=
 =?utf-8?B?TUNwZGpEUUowNnpycGd6OC9FNGlFWFpxZUVJd3R4UTJxRDExTVR5bHphNFMr?=
 =?utf-8?B?ZGF2NGt6NnVTU1c5aWJQSVNybEZoeTQ1d0RiWVQxUERYcW9Pemgva3lTSUJx?=
 =?utf-8?B?VlFNNjF3czBuK2Fud3V6VHNRODBsdVlEQldVNmY4ZXJJVFBpcVIxTUxqbmQz?=
 =?utf-8?B?TElUTG02bHhaemNGSncwQWV1Q2xDbmJIQ29xd29BVDNRdDZITHhWempaK2dr?=
 =?utf-8?B?VzBLdUpXTkF4dVZkQUpibzA4ellBNGFLczQ4akViWkVSdjRzaWRvSnpjcTBJ?=
 =?utf-8?Q?e4uvU8GvEio=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnNvUkthVEtMb2x0S2paMXhIenZDTDRjN1YrZUVoR2o1Wmt1Tkl0c1dUTnV4?=
 =?utf-8?B?Ymw0M2tPOFlEdmxoNzhVQkc3WnRCOFhNejdleE9ta0FHeEpGb3JlU3Qvbnk5?=
 =?utf-8?B?MGdrMEV5VHoyblBzRVJvU2hGaVlnWGdiVjE4SHVVeFZXY25ubmQvVS9xdVhs?=
 =?utf-8?B?STI5ZFpCckJXQTlza05wZVo0eEFTK0M2Y2dNMFVyT0dJOGx0c2NjcXNKbXB6?=
 =?utf-8?B?OVRxWmM2RVJ0Y2RKRFRZaWhCdVN4MXVxR0VQaW8zN1krYmQwUnpvcVpWTnJC?=
 =?utf-8?B?Z1V0a3lFaUlEckVyV3N3V25rK3MxeXZIeUhHODIzZnlzd1NrWnJBY3ZTdUlu?=
 =?utf-8?B?NllHbTVXb0dqUXNKZWpJU2xpUFIxUkVWaXFBcWRGb0xya1B6c1k5WS83WVcz?=
 =?utf-8?B?VVZVT1ZFVUFlRkRKejB2RDJmTzNQMGE4NmJ0R3h4bDJMK1Y1K1BIdkI3a1BL?=
 =?utf-8?B?cGVqR1pDM1NsbEVKQnFyMUUyY2xZV00zM2tqTkkwWnBqSmk0K240NER5V1Fs?=
 =?utf-8?B?aTRDKzdEWVBxMWVoM0dVdVNIZC96V2w5dmRQRlcvRXVEWElqbG50eEZRd0x2?=
 =?utf-8?B?V3pVNmNYOUJDaE5rK2JycmU0UmpzeTc1UWxKTTlvMlpPUkZSdzlSc3Fic2k0?=
 =?utf-8?B?bWIrSDR1eXpsNW9FLzlFT3g2bVp5cGpZRGIyL2RwTm1NbWRNU2xPY0h3aHk1?=
 =?utf-8?B?a0liOVljYm5VcW00SG43TVM3dlZBMk5IWkZ3ampJUHc2bkZpUzFpWDhmUzJx?=
 =?utf-8?B?eE1Kb0twK1JmTGRJaGppWnJsQ2lhUUpSdU5aaDVsREY5TDJIeFpCM0xRaTRt?=
 =?utf-8?B?M3VUWHBvMDVvMGJrTkNZU1kyNGVwTG1oNFAyZW00aEEzc1luRTZTaVZZYWRh?=
 =?utf-8?B?U3ZITlA2Nk9WZ3JKNlVxV0VzVGIzcGZWVEhXV0JnYVIyb0h6RlNaRzlCMnFl?=
 =?utf-8?B?SldqMTc1Qm9yQTlTOHI4R1ZXaWtOVm01aDNCcGZEcGc5SkxPdS9DUEZwc28v?=
 =?utf-8?B?eXlJQVBUcHM1S3Y0ek9KbGtVUi9oL0Vkcm85TVhhTE80MHoxb2Uya0Juclc3?=
 =?utf-8?B?cDNZVWVoTFJWenFkYkRqYnVDRzBqOU04cGpSUFIxaVRPZXE3enVLbVM5RWQ4?=
 =?utf-8?B?YXRKYnpidzJ1Y0NIMC9YbHI2RkZyUUJNT3VHbEo5VGloVmRTM2xscE9KTndO?=
 =?utf-8?B?QXJBMFQzUkhjdng1LzRNWjZLSnYvcHB4S0VLR1lOSEFPVGplQnRpVCs3Z0do?=
 =?utf-8?B?N1ZWWDFtMStFV0g5bEtkMVlkZmJ5UHhUTFNlNXlqbEsrUnB4WWF2WGJybkVp?=
 =?utf-8?B?bFpib3RBQW9keHh6eTF5NllYL0ZwN0VlTkZlMnQzUEJXRWM1QWFpWnFmMTNa?=
 =?utf-8?B?THFGK1YzVk9yT3hRcm8veG1XTDd1ZXFWRGpXaG9vUmI4dFpXZkRBL1hoSkNa?=
 =?utf-8?B?eVZJK2tSek5rVm11VVlick4xWEFCNXE0RVpWczBOS2ZRbFNQbVhMc3VORmgw?=
 =?utf-8?B?U0xSaFlIa2JhYWRSZDRjV2IyOG1ENmt3NjFWdXg2NnZtMGtTZkxBZkNpRFVW?=
 =?utf-8?B?NzNLMUU2MTZDSnJaQTczeDdWS1JCTmtHRjVOL2VYejFEZGxERWlhZStJN2JI?=
 =?utf-8?B?VG9mdVRIdVFkb0xFcjhQbTVBRzVzWGNZRWhmcXVES2xHUXFXRzArb01KQTNq?=
 =?utf-8?B?eTVLUXdMQzdnYTBoSFRrZ0EzSmhPeFVrWGtLOVVZMXVTMFdscHA2MFZFdGdF?=
 =?utf-8?B?U3M1OENHeS9tWktxQ0pZWU1XZ2dNVUJGTWhmbUNnR0pZamh4c01JdWcxQXhI?=
 =?utf-8?B?OElWWkZZU3UwZ1dnbnNvWndyWmZ1dnRSZFZ5WkZ1V3BjRVEyZ3o0QmxpSm1J?=
 =?utf-8?B?Y2IwazZjeURXZ1E1aUxSZjJwOFdHL2RVaEVoa2E3dEZSdXJpT1E0VmU3b21h?=
 =?utf-8?B?VDVjSWtDUmNQdWVaVEYxTlpBeHpSN0UrS3VuUkhsM2dIamFzRlhhWWZaR2c3?=
 =?utf-8?B?WTMzWW5Hc1Z4czRzL1JRZWpCVEU3ZzJiSDk4bUplYzFnTjNUTmx1MGtVVWVX?=
 =?utf-8?B?S2cydXRuRjVCMDJVdW5RK2ZtV2crcFVEWERWMHlIeXRpbDlXOW1zQVdZTEJX?=
 =?utf-8?Q?AG9t1mrTomR/kC1EGYs9oj3+L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f14a397-de10-4e5a-e471-08dd87b34280
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:50:14.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir5m3uKQae9SByo2827tXZ4zAxApfsJRW/umS5s5I3tDNpxgYRB8OF1t3MkQDZ+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560



On 29/04/2025 17:20, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the aarch64 armv8-r architecture.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


