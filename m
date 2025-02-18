Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC13A3977E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891173.1300251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKFn-0002m4-2f; Tue, 18 Feb 2025 09:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891173.1300251; Tue, 18 Feb 2025 09:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKFm-0002kQ-VL; Tue, 18 Feb 2025 09:50:58 +0000
Received: by outflank-mailman (input) for mailman id 891173;
 Tue, 18 Feb 2025 09:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=90y7=VJ=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tkKFl-0002Tw-DL
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 09:50:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2613::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ea679e-eddd-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 10:50:55 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9610.eurprd03.prod.outlook.com (2603:10a6:20b:596::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 09:50:53 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 09:50:53 +0000
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
X-Inumbo-ID: d8ea679e-eddd-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi20X9+xZHNh+eDcyN4zNue3751mqpu+B5LDz/+8y5DiohTQrOhJEL1QuPUf1hOwNF9RPfbS5d//f26LiS4Sw49nzzvkp/vrVk5+jcBHkXuO/HA2Hw7xiVwuNg13+FFk1yTeH68FNtkamKyJMzaJl62G7/ofISrG9fJn3MeANr0GJa1bclwOGBCiyXFfuioN1FPeV+HA56KZmYFzEbAsCq37LTaYscU1aekTteqoJaAJcMiRc47gWGB13rv/Z8rFASAkWofSr0qGzKdeB5Hx+vgzvO/p8aAkqcQr4J4XwkmjcD1DgR7itdmkv2biKccGWgLH19P1Kd3wYxHZNdeKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j9BLFoEIzIKPySarG9cml6mbqo+D7Q3lrAEQ0SRiyk=;
 b=MmAKY4Zskw/nBk437BF8yXLowz8pziJf0Y7zWQ8yji7NeWXi3oiDDUREX5uQN+hb8CfKmDlNHeSm0IN2Nr/P90sVKiYdUk7E/eroOQcebeLOF+Y3fb4LZ1RyDQtm66aKogcaIpelfVk13twr3kNCxJpF/gP1QDZLE4m1HAwRxsX+rW3V+YnBfOJ6B2JkMmh0kDvQ3FKHXg62/h9cgybY5r/FMspYTsFevV8X3GrrCtBSOCa6pWX5foGOVCZOpD6Z6vmeqmodeeIH3pdytIECUIf1Y3nyr3dYjvPrYigt3b0ohfwL9tD0+0opSY+Aw/DXSH6O/2uLR+cmoeYccv7rcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j9BLFoEIzIKPySarG9cml6mbqo+D7Q3lrAEQ0SRiyk=;
 b=khDkSJ8HI5+b8btsXX+viJO+srSP9fOmM1Ad+WdxSpe6aQpF/s29f+jiuv0aQF1Jfw+UO+2Jh59CzGu7ID/Chm7VfWs6JtdBbzJnER0EMh0EAk3MHG4cOVMIufl0rvoEzLOa+NGRLJ4yiFDmq66yq8Jq4qfA78RqKIKAvzwuEaR/WX1MSusroIBtDKg4rmb1C0/YRg/XBAY2APmc2Zt1C9ACkJ2sHLk8zb4swIWoHDcKAO4UXDWVUgdcV48OBklGZtN1zPZGWAFiAJVtaJ+3gH1TNkffG/G401brD6wHnr5RDSwsgPs1rXTXtdBDaGhs1B1UBqyFJgI58Rah7Hl6ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <3830152c-6229-47fc-b77e-2190d328d9cd@epam.com>
Date: Tue, 18 Feb 2025 11:50:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250214125505.2862809-1-grygorii_strashko@epam.com>
 <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
 <e5c63216-d22f-429c-b6c3-082e0984a9a3@epam.com>
 <a3e9f238-2a19-4015-8443-113f22ffbbf7@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a3e9f238-2a19-4015-8443-113f22ffbbf7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: a86ed8ed-e5c9-4c45-bb18-08dd5001bbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFU2RFk4em9KbG80d0w4aHRIWHhqU1BnbFd1QkgxSFFFN1c0d2hBZldreG5q?=
 =?utf-8?B?ancyNEI5RUJDUDNIMjdIUDFkb0oxbTBwYXNtZmh3L0Z4anoySE1INUdsVjFa?=
 =?utf-8?B?SWVkeE1VVXVsVWhnQWFqd0lEcjFDZWNLN2cxRlJKRFkyc1hqSWJhV1E3TkxG?=
 =?utf-8?B?SmZ3OGpIbnova2J0ZnhsTjhmQ0JzUER0WGQyM2RBa2NZanVqb0xRY01weWRi?=
 =?utf-8?B?djR3Wm1aM2hhUUVGU1ZQNWp6Wmg5UkJwSE1pZmZPdnI5UDRuR0QyVFVUYVlF?=
 =?utf-8?B?dm9kK01BalUrR2xHcnc2OU9jR0k5RkxKNkV5eXpKYmlkdld0NGlHSjZKblRv?=
 =?utf-8?B?M0VXSTdYZTRjVWJ2bXFhUGtlbnc2TlVDWkUyRGJFejVZelZLUGRqWXZNOFBl?=
 =?utf-8?B?OEVUaEZWYXlsclNHSlliUkwwbCtsbUkwVVljS3cxVTc5R0R3bFByWlREaks4?=
 =?utf-8?B?Y2JXSGwrNk5iNDdxOEhSdDE0c1lKOHNXMWQ3eTgxbWV4cHV4L21kK3BwS05u?=
 =?utf-8?B?OGZCcWdCeWxrdWNEUGRNYlAvZE5tRTh0WVpISWRSYWxYaTMwUXY3L0ZGWm9s?=
 =?utf-8?B?d1dlMmRFbGE2OWozTnRqZE8xSFkwWGNwREhrbEQwUDh5SSszNExLZ2orQlEv?=
 =?utf-8?B?NzE3bnJPZzdFMUtQckRrc0NsUUhEekhPOWx1SGdvZHJIRWZIMmVSOWtYZzYy?=
 =?utf-8?B?UzRZY3lhT0drUHRReEc1Vm5OcGxBZHBxKzZVSUpweVRXUGNGejNGY09DZVZm?=
 =?utf-8?B?RG44QzdFd0JmTmszVGN3d0ZXNmh3a3ovWTl2OWQ2UldDbG5GRitxbkFURyt1?=
 =?utf-8?B?MTIxR0dSWTl4ekI0YVR3VVBMZURYU3lrS0Nxa2FjRjZRWnpyTFNLdUxNWVhk?=
 =?utf-8?B?dUxabVBEaU9mR1IxU0VvRU5IOUNIdXZHTFRwZDJZdVptS1hWYUJkT2IvOFVG?=
 =?utf-8?B?OTJ1Z0JSSzlNSURYQVJqcm1FTVlDMFhmaGYwWEZuOXR0VHQwVXJTdnFwb0w0?=
 =?utf-8?B?VGVBeGFzajBhWG90ZHV6Z3J5YjVxVDJ2ZkxxUk53UFBxZ1lwQ0JscCtOYTBG?=
 =?utf-8?B?OEF3WDJNZmNDWkFrZldFRzBSVVBDc1RzK3VUV0hLOGJ0Wmx5QXBlOFliUFZZ?=
 =?utf-8?B?V01OTktpbFJ0aWtBNjF6OHllVU9PZERhZXpydjB2UVl5ZVp1SlB3VmlnaXRN?=
 =?utf-8?B?aHdmOUxwMXk4YTRXSzl5VDNsYjVHb1hZUDVLSTIvTlo3S2NFMHdzRG82ZDZ1?=
 =?utf-8?B?UjVMV2NCbUJUeVVxUnBZdDVockdHS0dCbG4rTk83VlJqQnNMWFZsTndEVEJ2?=
 =?utf-8?B?Yis3SFF1SmNaNlY2c1luaGg2ZnJYMEFLR1ZmenpHUHliVzRrenl5eThibi9m?=
 =?utf-8?B?MW9Hc2oyUUxxangrK2lKVUV1S3VvUTVOOVRBeUNLMUhnY013bnlBUG52SXBw?=
 =?utf-8?B?RjRPVy9JbXhPNG5Rc1NsVGRnWUNYaG9PeVJCRUZIUStPWmx1S3BUZTBnN29a?=
 =?utf-8?B?VlBUL1h2bEVkM3dJNEtKbXc5dmF4dTdqR0E0ODhvZzRxSTU1elAwNlFpWTVQ?=
 =?utf-8?B?TWlmNWJ3TXhNMGxLL0FuK0tmSGhXSDBlUUh5Q0cyY0JEWU9RenZPNmRmdzYx?=
 =?utf-8?B?Yk54OU51RDRNQUtadzl0c2tyY205WW52VWdoWTJCbmFRSzJ3MTNaSmlBVkFy?=
 =?utf-8?B?UkhWSExubGpnME9JVytGV3JiZDNjOVgzd21uaTB4Q0pGemxBc093RGEwK3o4?=
 =?utf-8?B?YWZCc0pHYnRZZ2RpOFE5UUZZYkpHOWx3bm9mb1VyOUtYcEdqMFp5KzBQZ2Q0?=
 =?utf-8?B?ak9CeHR5dDZ0RjJOOTVseGxEZW1wRFlUZitZUmxDbUJnVm8zVWpubXpjQnpw?=
 =?utf-8?Q?MmiqrsrST7s54?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWdndmVvRU1idXFOVjE1S1FDOHZxdmlIZFYxYXZERm9RbStXNGprSkt2NWZa?=
 =?utf-8?B?V3R1eFdmOERXT0lxeFk4aGNkNmtTNXJFdDV6cTdsTEdmOGc0OGVpMXBIaTdk?=
 =?utf-8?B?bkJoMWV5TGdWYjNOMmFEaXJjR1owd1BiK2Z3b0FZSWJlOUUxaVlpYmdwT0k1?=
 =?utf-8?B?K3ZEZktEdWpZdHZ4Y2pFUkFrVmpxanVhTEdPeG1vUmc1SkFUQ2dOdTlXU2or?=
 =?utf-8?B?TTMrRFNOM2ErY2F4U2diOXM1Nkw2azV6OFB6bGRuSzZZeUtyWkVIbTJNTTVV?=
 =?utf-8?B?WlVYNFNYWU82WnpPeDJVSkRaby9Tc0pXUlE4MUdPd2FxcUdiRUFETVFuOVN2?=
 =?utf-8?B?UjFxbnhDNFdTbWdyYVEwbkdxNWJ2MFE2WXhEL21YS3RYRlhaR1NJaTNmR1RL?=
 =?utf-8?B?YkFxWTZycUVydVVCZ3hGMktxMTNpTWlMbVp1VDRwRjhOV3hGZy9IdEoxTG1I?=
 =?utf-8?B?Z3pZaUJEQ3doNjBRWHI2OHJIK0pDbGJmenhZMStpVzJNOExlcTRSdjNSVkU2?=
 =?utf-8?B?S05ma1dsV0V6dnVLVk9xNVJ6RlBZTHZEUHdQRXhMb2NRbXF1d2ZqRHFFc0lK?=
 =?utf-8?B?SG9ZSXkzU2xrLytMNjY5T0grM3BYWnJraXJDblp5dHJ0eHFES3pvQ1NmOUxw?=
 =?utf-8?B?V3lXdzFUajBIQkkzK1VRaUZJYXR4R2VIc3g0ajl0NDlKYzNYZGlVNTFHNk1X?=
 =?utf-8?B?TEpVNkI2cjBSbHpBUURFdE1oVHlzd0lrTFRXYVBmS1c5a00xQXdHM1hWVlM2?=
 =?utf-8?B?elplVllHenUzeUw0UXYvS1EzREk4d3d6QjFrWFdIVUg0NHVtVndORnVJdUMw?=
 =?utf-8?B?OTVuY1ZQNkhQdG0rNzJ5bVQ2OEV1MFFIQXl1YmJnYmJkdFFBM1NEcFUxYzhv?=
 =?utf-8?B?OUZIeURHblI5U3NYdTZ2M2dRWE42MjlHMjFCMjNFUUZ5RmpMa0llNTFMTjVG?=
 =?utf-8?B?Rk5TK2UycXE5ZWIySUloRUNOTjVXUzBjb0xaNzM3SE1GNVF6TDZWdzl6Wmlz?=
 =?utf-8?B?ajVPdEc0aVY5SXN4OC8yamI4MlJRRmpiYVpKN0I5MmdtWDBma0llTGxTTDNk?=
 =?utf-8?B?TEFlcjVKYU9SSlhlL2MzVEFtZ2N2MDlTUkppQ2RDT051OEk1K2pwUFRIU3VL?=
 =?utf-8?B?T0RoZG5rUXFTQjJrOTYwclN4bmVuS2YvOGxZcHBWeHJCRWNwb1E3WHg5dnRT?=
 =?utf-8?B?dUgvQUFsUHpUanRIWEswS3pXNHExdzBMUTJRdnFvTmNLYitaVjNKSml0cTBk?=
 =?utf-8?B?RGdFeXhnakYrWDdHWWJoOFNWcmR2RUtlbnN2YlI5ZjBCL08yS1lZWFBMVjRY?=
 =?utf-8?B?MjVKc1pkc0RrRnlDVUl2QWVNd0s3YkNJYUlYTWJHSm1CUVkwM0ZPZlM3dXJX?=
 =?utf-8?B?NTdQNHNXNkJtR3JGcmsxbVUzbHpDalR6cE5NS296TWRVSXpiMjlKaHIxOFVV?=
 =?utf-8?B?OUREak1kN3RNY3ZZNC9RMlU3ck45cTJ5V0lOUlloMGVTb1AySGRXNXBZNCtp?=
 =?utf-8?B?ZE1DMERwTXAzSnhUbHkvZGNKQ3F4TUltZkxZNGJqTklBZjlocWxPZ0JpeXhW?=
 =?utf-8?B?R0RSeWlYcEgwcDh4SGV6VGF4UVpyY3Z6Zm9lRzV0MGJJdk9FUFpyL0wzcm52?=
 =?utf-8?B?NVgvN0orSXp0L1JaUHQvWkhsNmRjTml3QVZtTTk0aWVxWnVHNXJYS2ZHRGN1?=
 =?utf-8?B?Z1Q0R3pLZG1DNzA4QTdtM2NoYUtFMjlCZ1N1QXpFZyttS1JROXQ3dkcwdHJX?=
 =?utf-8?B?ZzdMMStNdHZqdklqMXlWUENndzlLZzRGbkNIKzRRYzBKdEJUeVUvNnVneXNX?=
 =?utf-8?B?UWc4SnMzSE5xOXV5Nm1vWDlLVXBjUHlqTGxKWVppeG1mWXZGTDZpMU4rL01n?=
 =?utf-8?B?VFdXTWwxQzUzUHNXamNkUjd6VFRzUlFDS3A3QklnYUFXbERuTmp2RE5VcGdp?=
 =?utf-8?B?LzhleUZ2ZzlGQXIrd2RGZDlCNVpMKzExdXJKRWFQSkd0UzBsbG5heGptWVhK?=
 =?utf-8?B?YmpPNyswM1owWDBvdFBhanBOKzlwUGl1VUNZSjJsTHE0MTd6QXVQSWtLY25n?=
 =?utf-8?B?S0NZaldoRkRDS3pGcEtHQ3dKUFM3M2hoRTgxZFk4eC9DY0pIaGNlUW9HL3ZT?=
 =?utf-8?B?M2orN3FrcGptYnl4bnliYi84WWtmVStwNUxCQVpBMUVWeFdleTNvZVIxRndi?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86ed8ed-e5c9-4c45-bb18-08dd5001bbaa
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:50:53.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlA5ualqjJYnL7oPZM7v5QI/hspAA25EUEmsgkYtPt+aQmcsTVzZuFqZB9XH9nSLpMEe0bIC5+kdk+cbtxAOjKDwyU4mZXbGWmu/H1VC3eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9610

Hi Andrew, Julien,

On 14.02.25 16:25, Andrew Cooper wrote:
> On 14/02/2025 2:10 pm, Grygorii Strashko wrote:
>>>>
>>>> For example, requested range:
>>>>     00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will
>>>> configure
>>>> e6140 e6142 nr=3 instead.
>>>
>>> I am not sure what 'nr' is referring to here.
>>
>> Sorry, will change to "num_pages"?
> 
> I agree Xen needs to be better (and by that, I mean consistent and
> clear), but there are subtle bugs with most approaches like this.
> 
> Any exclusive bound, as well as counts like this need $n+1 bits of
> arithmetic when you want to describe the boundaries of the space.
> 
> There is also a boundary condition for counts.  What map_foo(x, 0) mean?
> 
> Real hardware uses "last" for describing boundaries (x86 specifically
> calls this "limit" in the ISA, but it's a trick used by other
> architectures too).  Unlike "end", it's clearly an inclusive bound.
> 
> Personally, I'd like to see Xen switch to "start, last" pairs.  It's
> unambiguous and has fewest boundary cases.

I'm preparing for re-sending the changes with applied Julien's comments,
but I'd like to ask for clarification, as I'm not fully understand if I need to
perform any other actions regarding above comment, or not. Sorry.

BR,
-grygorii

