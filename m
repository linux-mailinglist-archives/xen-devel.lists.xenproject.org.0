Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A7B037E4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042610.1412671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDaT-00066u-7e; Mon, 14 Jul 2025 07:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042610.1412671; Mon, 14 Jul 2025 07:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDaT-00065N-45; Mon, 14 Jul 2025 07:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1042610;
 Mon, 14 Jul 2025 07:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubDaR-0005pK-1G
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:26:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:200a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7786154-6083-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:26:50 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 14 Jul
 2025 07:26:47 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:26:47 +0000
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
X-Inumbo-ID: e7786154-6083-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr9PjbD8q0QDOoZSVuI+ukp73u4ldB0q16h0lhH92IGHyyQeYTDl4Bv8YyyKDG9js7Al7E7+QhSvlhbA+nQfT3WhU4JwoDtOxanZ/SG33tB3Flmag/Unwr03k+Wk1a5HcBxemqq2TjOW+b4BHZyEoRYcZTTStMxGBpxjll7l4XSN1SKvHjNlSJPR9RZ5rHLI1Ut0ucEJzoqsR8uoZbUPbiUH2fqmPHd8lenBi37zCdQKCoUmM1Aj5Ew+J3DCGY2P294fOTumRwG67aS3svZF/NdGc5FT5TG3+lHXzsaXxDQy8dlBIqsvOlvuwwZDhS/wK/sfWUyx6ysC1vkkQBTjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na+S10sKHAWCdrEawP8P3b7ZKtus1Texgp8Nkz2kr6Y=;
 b=tzjSqNghoAyuG7dnif1mnT0qj6tSjaHMJe6BBkl9dIOQWI2ALfR00HEsCkaXar5wCzvKPQNasUYLmBfD6pUSNpMSXp5yIkBQO7vixWmh5rAhrh0u2DxxN0FUzg06vEMhdxs9lJVE2CRS6zZILvy6o57z5NDVlUQZzIacrzg7QZK74xlY+J04dWiiBC6IZSSgAkFP4IQJ8TLqN8TbpkY9Kj2Gi4Oz2X+CbFi2ghhu0PG2tUu0ubLDvSxVakTVT8FuEfYvx51/vvP2SaUlOOWeI3Z6qvwpdnqh4cgv/bVZpjP3pQ6Mo5qOggTqBMCpfq7FawELs7y3Flu0yBjjyyCZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na+S10sKHAWCdrEawP8P3b7ZKtus1Texgp8Nkz2kr6Y=;
 b=0c9QPNJ2+5Xc7EYJ1zVyG85TqWUOZdrC7lhOR+L8ag56yQR/EYlD7gIaVXZ3JBi9PH3F+YUaZjxwvkdba/kHx3hNayX1SHK2AhtWvkWJkoOL339XQhKhuaT1ATTl7lFwqyj4N8Rmt6OhPfyPPbeS9jEreC2IryyeNOLbTaxx6/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1eedc324-c26f-483a-a592-e4531651f473@amd.com>
Date: Mon, 14 Jul 2025 09:26:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
To: Hari Limaye <Hari.Limaye@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <100cc63353021067e3eae68d092ebd73f484f416.1751464757.git.hari.limaye@arm.com>
 <10c17850-7e53-4547-9ce0-29d58e35ca7e@amd.com>
 <AS2PR08MB8745049622AD6F6D553EAABDE24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <AS2PR08MB8745049622AD6F6D553EAABDE24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0294.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::15) To BL1PR12MB5272.namprd12.prod.outlook.com
 (2603:10b6:208:319::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: b6310986-f80e-4a19-22d8-08ddc2a7ca2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmFUSTBoQnhUM1JXSWpZOGQwbyt6NUtXVk9Kd2hLUytaVVFJdzBuSG5jMVVm?=
 =?utf-8?B?elBlb1B6NXJYbG9hUFMrZTZKcUlrRmhaOWIvT2VkQUxwQUFxNEdXUEhTeEVN?=
 =?utf-8?B?Zk5YVmpwVzRMUFRjR0hmZmtSRmZkdkR0d083U04vVGl6TWdYNE13dFhzbXh3?=
 =?utf-8?B?UjlpSFZjdHM5REVuOGdVbHJEOUVKRmN6MmcvUDRONGc0MEQzSm1TYklvY3oz?=
 =?utf-8?B?aFh2aElXT2RUNS9WdEJOUFRIeGVaMFJDMmNEdzFZeGpDR2EzZm9STXUwdzVa?=
 =?utf-8?B?QSs2YzY4OUxLTSt0a2VXWmR3OWhFRko1RmFZbVNJYUNLaTJNWFdaQUQ0ZzFr?=
 =?utf-8?B?aEtGVGtINDRNcHIvY1UxUUdLcStHOXJDUlAxMjI3Tnd3Q2pDNldnVUd2N25j?=
 =?utf-8?B?dU04aG1ZcmM3dkxUb0hwQmswMGpkYm11UTBCT2NWZDNBS0FLZXpCVkdId2w5?=
 =?utf-8?B?YlplU2FDTkF6aDJxQlRWQThEZHdaTG13dzJsaTdrZTdUaXBGRVQ5N0xlek44?=
 =?utf-8?B?cjJFNXBxSWoxZlpTUi9qWHQ3SEVkN09Ea1c1aFRnUVc2WEYrUEd4TjJkeHJZ?=
 =?utf-8?B?WUFjZHp5SFQ4SVhRV01HSEhHelRyVkdjM2VKbCtJU0d2b2QrWk0xM01jMGlQ?=
 =?utf-8?B?VEk1Wis0dTJybzNPWjVxWGhFOUw4M2grL2ZqU2lNeGh3dHA0N0lQNjhQY0hx?=
 =?utf-8?B?UEQxdzdyWW1jTEJCYm9VRkI3d1lUT20vRVVMNER2TEs5aEdzVjF6T1RwNTM1?=
 =?utf-8?B?VnJpMm1DMFZjdDJLcGFjU2FYNVFkaEx1MzJHUGtwWVNwQnFtQmxqS2kxSzdW?=
 =?utf-8?B?Q21JZjlzWGVpWEI4U3FqOEhDZ1hVSGtKQjBDREdYYXRBblB3SE5HS1poUWx6?=
 =?utf-8?B?am02VnVEWEZ2dXBXRmxicG41K3c1ZmxDNy8yRk91Sk9UTWkwcmUzTXVyNDV2?=
 =?utf-8?B?VUphUFhEbEF4TkVta3V0ZXNnQmh5NVFJeW16Q0JhU0tHbnN1MEJZakxNbUZX?=
 =?utf-8?B?R3VHemQra01ZNlhaaTZVczZGU3JsZm9oRVpLTEhXNzVnUTYvUC9oUkQvcCt6?=
 =?utf-8?B?by9yMnNmSW9xRVBWK1Q4MzlMT2dLbVlxNjRqVzUxaE5nYXdma2UrcVd1ajQ2?=
 =?utf-8?B?cW5hc3lNeC8yNmZWSVBWQjRFcEpiS0oxZW5YekRSSXRoK2pMTG9GdzN6Vy9Q?=
 =?utf-8?B?MVdocy9XRVpoaWttVnNNdjRUWnBGTVRzTGpOWWZITGxEZ215Zm1nelk5Q2o4?=
 =?utf-8?B?QXVWbWRETy9JV2JuWE9GODk0cnpkZWx6d2tvN3lRMnd5MlpYb08zeDZ5alFn?=
 =?utf-8?B?b0JZZm02ZXRkRHRUWGtUUXhkaDYrNEo3bVE0ZU5PbUJLejhja0ZSYzU1dUhl?=
 =?utf-8?B?c1lMb1VibDNYcSsyQUhtempoYmpJbzdvSXJIdzNldWVYek1pUVkxbDhkVHpQ?=
 =?utf-8?B?U0RIWkx2NHB6Unc4WVpXTis0aHNoUVFuWUJ0TjloQ1Arb0U1QlJIYXU0LzA3?=
 =?utf-8?B?cm56b0JRbEJmbzZHWUhYRGJULzFkWDRla2tHdnRDR1ZEV0h3SG1YWGJVTlFp?=
 =?utf-8?B?RmkwUzJRaVZUN0hSSlV1ZWFxY1dFbXdnUmc5dTdJMmw2L2I4Q2Zhc09HOGhM?=
 =?utf-8?B?N1hrNUhjaDdUTHJkZ1RpeGVGazI1TDFpQ0JPalN2dkdBNVdJZTVTcVVyRFBs?=
 =?utf-8?B?Z0JINndpQnZnaU9vaVdIRWdaejFVTndSRUwyaU1oMXlpdk54MWYvTzZtQ2J4?=
 =?utf-8?B?R1FwbDBIZnYySm9ydVJBaVJVakxxbmdxUUVIeDArbUg1OWtjL0oxclhtbkJx?=
 =?utf-8?B?bS9WVTE1Z005UzdlNnRZV2xrR2wwY1JvdTVOR2tUT3hhVFltWS8yclAwNnZW?=
 =?utf-8?B?WUxQbUcwcmJ6VmNrby9TSGhZd0lSRjNpTXdxL1dRbDJwMFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFwNGNoTldRcVR0NTluTHRSMTZQREZGbFdpQ1RUWld1ZzJDaGcraHpITlo4?=
 =?utf-8?B?NXhSUmRMN1Q1MGZYQ0xCMm5ISXplS3RvY0xOQ3RPZm9sem5WWlUyVk1GaG1Z?=
 =?utf-8?B?ZHJDQXBXY3NNM2QxRkxFbXgvK0xUaFBicUFhVVo2dUtnQmFXWExBOXVyL1FZ?=
 =?utf-8?B?ZHllZEFudHNaWG5xRmV4ZkMvdkdIenZwdDljeXVhaFMzSmVLTkpMaE52RlA5?=
 =?utf-8?B?c0NyTGtWSVRTVGpmR3VlNjZUWm5YK1lpcEFacG4vdmZoUkc4UWtUTDMvQzNI?=
 =?utf-8?B?MjlHNndTZi9pSHRnT0dlTG5FSGo0algreXMvS1YxLzRQL0VHN1ZzNVpyZlJE?=
 =?utf-8?B?M2xpWWJGQi9uYlhlY0FFcmpEOW9XdE1Kako4OGppVnpORmFRYXlsNUJYVEhr?=
 =?utf-8?B?NUF6YXI4OXdSSzBNT2ZDV3AxcDBKcndPOUNnbW1UMHlOSmpDU1RjNHVMZkta?=
 =?utf-8?B?elp3M2VlOGR4NCtaZjFUSFVLdXRzR1RYYlZQbzl5aEl4K1Jwb2pXclNOS3M0?=
 =?utf-8?B?MndKd3dvc3VTMXQvOEgxcE9PMWVQNFgyRi9Wdmt6UEhvNXlkakwwVFhrZDNP?=
 =?utf-8?B?clRSZmFzRGVVZ0Zjc0dKTnlGR1M0dUxZV1VvNlF4WHZ1MWRGUHJlOWZqOWpS?=
 =?utf-8?B?djQwRGRnT0FKVGN5bzlURXZvbHd0MW9vYmNsbGd6UWpkUXBTVTdiMHZSMTlU?=
 =?utf-8?B?ZkpRVXVwTUVmRm0xSkxsMklNbk1La0NmbFhkSGNYdWdQa2hyZnNTNzR1SlJT?=
 =?utf-8?B?RzAwcHY3MFhyQnBTTnFjTWE5bnVyMkFhb01BN29UTkJZbWU1N2xRZGJhQXF2?=
 =?utf-8?B?MDdXRThQdmg2TExPbWtOOXoybjdISkthQUpuQk9NKzd3QjZyMEEyZVczRk5C?=
 =?utf-8?B?ZVJXZ3d1M25wWGdKSDRrTDcwODhOaU0vZkZ5dnA4a1QrYnptOHpUTU9zUWZt?=
 =?utf-8?B?Nnk2bXUwWGxqQnlDdGNZRGZRMWNvdlhVZmNyZ0xrYzJaRkU2bzhHRWVGbXl0?=
 =?utf-8?B?VjBSRnVHUnhLRzRTdW1tZEFJd1R5dUF5cGZOZm42dlMyNHFyU21ra3ZSWWUr?=
 =?utf-8?B?RlBXUEZRbXNTeXE0QnJTNTBndmxaeXBQS0lpSjl4aE14TTJJbUtNYXVMRDMv?=
 =?utf-8?B?aUZZYUFPalpJeDlMOUUzWlk3ekIrOFBteXdMQWpSeVUxOXErc3Fvdy9JSmc4?=
 =?utf-8?B?UjYrNjVJdTFPYnJGdGxiM1dBUDViL2kyRmhzTDZIQXZ5V2hjaWlhRjFrYnlM?=
 =?utf-8?B?eVgvWXorL3R0dnlmbjMzYWMxVGNwcTZDZDJYVUxSQm9EQmJJWXYwbkN3SFhD?=
 =?utf-8?B?S3RFK3FCQklKVG1aelBmamFWbGk3T2R3ZDhIWVU2aUJta3ZhTi9YVDVDSDM1?=
 =?utf-8?B?b2l5bnFubGtJT0t2VkNTUExVcDd0elRlRCt3SjVVU0FLY0Q1bXo0eEFybzc5?=
 =?utf-8?B?bCt5bDJ4MFQwRXFSYTJaQlJXczZVRkdRY1FGd3BPcCt0eEUwY0JPK3VxTjl4?=
 =?utf-8?B?S1Z5bCtFZm5wTkIzTjBGTGpVN1lhN01IS0lPUTU1NnFIcktnbDcvcFlFeitv?=
 =?utf-8?B?U21KZWV6NXk1ckVubnRIeEIrQnp0NUFPOU10dUhMRVlGNGdIZ3RUNEFHWUdL?=
 =?utf-8?B?d2dyRGV2MkFoUG5tY0swVmNySUZJWUNxaXRRUzB5WE1ZTmpKNXFCSEttQksy?=
 =?utf-8?B?a2wzZ1BtUWx6RllkYW8vK04wZ29kM09NR3pXZk1SV0dDWndlYm1raXExaEx0?=
 =?utf-8?B?ZnQzVDYwWjQyQU9SRE42T1hlUlQvNVUyU0o4ZXVXWC83RmZzejJ0MllKVm9U?=
 =?utf-8?B?ZTJvMHlxdkRMY21vYmkwekFrQUdiSzZoczNoOVRaNkdCeEpydS9mZlpmSzFW?=
 =?utf-8?B?UHk2d2c5MCtGR0FsS2ZoUnMzVEhRYW9JYW9vcGZnRDJudkh3bk82eTYrZ2x2?=
 =?utf-8?B?THNoV1BpZ0hZcU1hSlVQRW5HU3pzSFZQaUROdlJaT3VTU0ZMODd2aEU5b29G?=
 =?utf-8?B?SDhEVVVsUzViVzB6VkwwcGl4NHptcHowVU52bGQzTEJ6YjlCRng1Vm9XY0Va?=
 =?utf-8?B?bmFZd0Q3S2pkSWZnNk5Sc1BVSmVFNE9MU0FLaVhyZ0ZwVW5EM2lSRWoxWFhD?=
 =?utf-8?Q?du+uUBOH+vJ6FEzwiSaIrl9nA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6310986-f80e-4a19-22d8-08ddc2a7ca2f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:26:47.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5S8KB6lWfXLu1znHUl9iXscuZjLO2RvYvtN26eFjDFoiA9Q5qxLSkj9pDrySFbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540



On 11/07/2025 08:05, Hari Limaye wrote:
> Hi Michal,
> 
>  
> 
> Thank you for reviewing the patch. To answer the following question:
> 
>> > +    /* DTB starting at this address has already been mapped. */
> 
>> When can this happen?
> 
>  
> 
> In xen/arch/arm/setup.c `start_xen` early_fdt_map(fdt_paddr) is called twice,
> 
> before and after `setup_page_tables` - which is a no-op on an MPU system. This
> 
> seemed like the neatest way to handle this - but maybe you'd prefer further
> 
> clarification in the comment here?
Yes, I would like this comment to be improved a bit.

~Michal


