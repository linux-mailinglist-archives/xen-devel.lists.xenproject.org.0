Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D05AE61D8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 12:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023536.1399527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0cd-0004Mf-KJ; Tue, 24 Jun 2025 10:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023536.1399527; Tue, 24 Jun 2025 10:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0cd-0004Jr-HJ; Tue, 24 Jun 2025 10:11:23 +0000
Received: by outflank-mailman (input) for mailman id 1023536;
 Tue, 24 Jun 2025 10:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDMB=ZH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uU0cb-0004Jl-Nw
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 10:11:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2414::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91ec8a8e-50e3-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 12:11:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 10:11:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:11:14 +0000
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
X-Inumbo-ID: 91ec8a8e-50e3-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM/yqeYX2S974vv4kSW193hPJnCJBInTV2+KeV5YEQRf5fF0e7tmDpsxw+8+fn9KznjZktdEAdk0l1zihU3Vt9a4CLL9jMJNBNWh/pV6d9T8oxAL4WDkBX6+Mt1OUU/6HpekUUej1cnpOD3mL0gaJJiQM2Q6r9pLK1UrUkl2+osQ7rQdIZEKSD+rCJs3pVVR2YUKgciRFI74O1jmBtzNnofbkOuUKOSGSO7cTtVp0435LxSvc5PFbccjHQFi3U0VfF035CLE2Nq1Xtbk//35oDnvuHvdatC3HYgv3hr+0PC05jK0G3CDF7XbUJKpksW9t/kxCuQE/doF1MuTtrsIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5K5MpxaxEOgN30+0HCW00YKn24ISJ2DThadpFnV008=;
 b=PMG+deCxJYAlQx5znr3KsHnhx0x4iyVhPfzJ1NskWcfx1UsTrDJN49LZpt2CcuOsw7cVTBUAaMcE72IK1DliDWxAdYbKN0nuocB63FjCH7H69xgdovtAHL89iXSvhL2DZbpS/60I+rJG5WbuT459JLg3IaeGMjAcG4efiXVZ1bulvi2l8FbIv+ESyHuKUZ1LkOM3vh1lhc4BqKppxYeTKKHhtEW7SfKqDH/0553taDPy9xOXPSyAIVvqS6RqjpX9Q57EfSQRoMRgzWbgkLN7dsm1fifIxIjkLaaYHRUm7LB7wvTALu4+BUbH0YtRlm/RR2p0uUZTWd0aHA7m7RKkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5K5MpxaxEOgN30+0HCW00YKn24ISJ2DThadpFnV008=;
 b=B4t+ZUrTX/OhxzmFetRgw35OnU273e+PNd+Rs4T7SoFsOMku5LoPyF0t3RM3WPWI8ent9oVyJNfuRc8Ye0KDJS2ocer4zqmAUzdmdfwIkhuJa768GSsQFeo1yg5ObWPR9EOMU0FLJAPkCl75jQ6FwhfvLBhM4zyZ5KBLfzY6GBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8c35481f-6a2b-4579-9b34-c912cf3bbd14@amd.com>
Date: Tue, 24 Jun 2025 12:11:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/16] arm/vpl011: use vuart_ prefix in vpl011 public
 calls
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-4-dmukhin@ford.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250624035443.344099-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f72275-32ab-4df6-9239-08ddb30773c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3pTTFRGejdqVDFYd0Z2MVJOcnBiK3Buc3ZmcEgrTTNuNGZmcTVKZE9LcHhl?=
 =?utf-8?B?TnNocCt0T2ZvY0xTcXpZaHRwUEphUHU5UHhXdjY3OWZGc0RyRmZIVlUxRTBG?=
 =?utf-8?B?akZXRG8weHRXTlZXQ1k4aHhMeWV5YWpieWNWY2VqMFhBNDVIaGFQRDRoRkEw?=
 =?utf-8?B?MGdBY2hZNGlaNllCQkZReGtsYnZINVRxamtZRTl2UXhOT1FOWUhIM3hBa3J4?=
 =?utf-8?B?Y3lZWnZHYkpwM2NqNHk4QWdHdHlnWVZnYUJFVzhqRXJFdG9XRE8rOU9sb0dv?=
 =?utf-8?B?empUQXRIdWl3SGJuSHZoOVJEQkRyY2NhQnRrWU1FekJieWxHeHRxeGhVd3pG?=
 =?utf-8?B?N2Q4MmlzZUpZbk53M2JwcVJPWjJwbENpMFk5aTQvMmc0NWFRUVdRV240clhs?=
 =?utf-8?B?MmQvaFRXeXJOZzc1Ti9hY3NYMTM0bUtYeGs3RG4rY3M5ZmdncXdGd0ZEVkhq?=
 =?utf-8?B?ZE1QczJSN2t3NC8xTzE2SzJxcGVOVWluUldOWTBsaExJTW40bllMSzg2Smoz?=
 =?utf-8?B?MExwQVIwUlk3K0Qwd25kUGw1dTJzTWkwRFlpMWg3OEhiaUUxTS80ZU5wM3dx?=
 =?utf-8?B?N1paQ0FoY2JBOFVINDFGVW96STlmcGxqazVwRFlBdTNpZjZFWWpyb0xveDNC?=
 =?utf-8?B?aHBaZDFwcXN4ekg0b3Y1NUhyZnZTa0tzcnJrWStGSHhZaTBScldJMG9kdmR3?=
 =?utf-8?B?dDcxMnpzSnZHemc3Q3hZRXVrczBzNHFwZmI4OEpEcm11NVdWVVh5YmZhWmdm?=
 =?utf-8?B?WHdqTXphSGZvOGQyWDA2TlpmeXJnSkdZck1Lc3ArL1IvQVdCOGdzL3BmQ1F4?=
 =?utf-8?B?VDhXaWZWTFhra2Vwa0RJTlpqRnU5ZjBIckxaNU13SXhBL1QxN2VOY0Zoekdw?=
 =?utf-8?B?ZzNPWmNOa3owQVk5QjllZ3NZVExzTDJVTit6bWVwRWFJNHZ6aHA1RGpnVnJr?=
 =?utf-8?B?SDF3OFE3dDB4azdFbnhTWHNyeXk2cmx6NXUvTjJNV3M1d2lVVVFBVThmcVFq?=
 =?utf-8?B?ZXdIQ09FQ24wa0FKK0w4b0VScGpPanBVellFcmZSOW1MQjlaanpWUllOY0xo?=
 =?utf-8?B?aHYrYzdNV2EzaFJnRmpwU0NLeXloTWRZd2ZSdy85M0pUM3lCUmhLL3VocFBp?=
 =?utf-8?B?ZkJpR1NJazYyRWJUY296YVZiTnhpV2o2WEZuM2ZOMHRSWW1LQWVyUjRIa01q?=
 =?utf-8?B?UkYwSXBqdHV5T3AvaVdEOWJDQTQxc1F1N1krR2pBUXZ4L2hBcW9UdkEwTFg5?=
 =?utf-8?B?b2dtMmQ1MW0zTWJ5N2plVTZIZCtHYzJDUmFyUnFqbUdrZHFVWFlLV0pVUWNq?=
 =?utf-8?B?T2l3bm1MRFZhWndzdCtVZy8zQ2sweWd3YzVBOGlJN1NXdkZtODVnbkFZZmR0?=
 =?utf-8?B?NW11blFMRlVrQjJ3Qk1uQkpMVWkvTEV6RWtjSzVkNk8rQTVMZW1nV1doTVkz?=
 =?utf-8?B?UFhydzBTUklwTWZDZ2QvYnNBSGpkTHF1dzBkRjJlRktvTDZjWjY5TjU5NFcw?=
 =?utf-8?B?Z0VSYWE3cG44VWlBNXB2UEtGZk93WkYwYXdMWUthWHFINmJDc0RNT2FJemMx?=
 =?utf-8?B?Y1A2Vks4WW1kazRkUWhvNUhsdDdZemxGL1pzdU5ObW5PcytXYzhuNDZtNUdw?=
 =?utf-8?B?N09FdjB6ZjZpRmJBejJwRW5pR0JJejZkbzdNWk9XekV0OVVFTjB5ejI0WnhJ?=
 =?utf-8?B?bUdHZEhaeUhPSFpPdVJ1QUNXbmZ1bzN4ZVZtY08wOGx5MGxaaVNRcTRIVUxO?=
 =?utf-8?B?dWtDRGwyWlhpZ3lFVmFrdW1DQnExTnpmWWVNWUdMcTA0b0ZuV2V1NFM5Um10?=
 =?utf-8?B?eFdFOGh3SlR0OWxXYXcwQnVXU3NheTVzck9HazByZDRtZE5CTUFVNDJFYUZj?=
 =?utf-8?B?NTI5T0hCMUNWQURWYVIzdFk4emlHcFJhWGZsRWdQcXl1ME1XVTNib2xWK2lV?=
 =?utf-8?Q?NDuHHxYmzUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QisveE9MTVpvZWk4SmpJejFqSDFzQkVISGJTSEJYN2xNNzhLbzJvWXE5TlZJ?=
 =?utf-8?B?QTRmd3FTcS9WUXMvOXowQnVJWTJZc3pCbG1XQ1EzcmZFcWpVZXpFcFkzSWxR?=
 =?utf-8?B?NXNiUGI4VUp6U05BY1doNXhlTzc1dWFMVmlYb1VpRXNYK0dCZEg4KzNyUE1Z?=
 =?utf-8?B?d25uVHV3YzdGbkk1SVVsRVAyY1BPVnFyZjVObkdiZVJyeC9haTZpemZpTldh?=
 =?utf-8?B?MWg2c3NUcVJ1eXhRUGVhYlJDdzV3V2YreTRraU40ak05bjhFYzkyd0dJZ1Ra?=
 =?utf-8?B?V0srK294azgwTjhGaFg0MHFEd3FPRWlYMDA3WExZcm1xUHFBVzlWdEpJdFBs?=
 =?utf-8?B?b3h5K3BMZzVqb0pLZzFXcmpPNUpjOXg2NzBEcDJ0bG4ybU5XNGVGZDV5UVVk?=
 =?utf-8?B?WkJaNENPb1ZPL2xjMyt5OTA3cGdvMXhBK1VsQ1JFVTNnTVl5V3BLQnBOSW94?=
 =?utf-8?B?WUlRYUhkVVpucTBJZlgxaUpMZGN1Syt2bE5SNVB1TXhUSnBHZURneTBER3g3?=
 =?utf-8?B?NGxuUDQ1RTR1M2U1U2dPaXFNcjNJUW5qNEk5Qko4WjNwK2owbktpeVVaSXhZ?=
 =?utf-8?B?SFF4MHQzYTJ3cUJpdGZlS3FPeGN4UUVhMFRFNnpXTDJCbDE0K2g1K2FyUG5z?=
 =?utf-8?B?ZzVEUlMrOEkvUnJ3bHZhcnl0bk5EVnR5TGFaTnN4d2dsZE9mQitpV2ZUT3c5?=
 =?utf-8?B?SFRKRFVxeTdPd0l1Z1VhWnBQV2plTTVqeTNGbTBPaURFbXI0RGp3TlJsSVpn?=
 =?utf-8?B?N1JRMlYxR1NYVEplTXEyTVdoeUd3MXVvYzNQVi8xWXNQclNGcEJEQXEyQnFI?=
 =?utf-8?B?cHFpVDBDZHI3cFpjcmlvcmx4NHNNNllIVXh2cjI0Rm54MlhjWHNwc2RnMnJ6?=
 =?utf-8?B?VDh1WnNpeUNaVGc3SlF0Q3VoVXBDdmJMS21KSFg5T2tPeDUrS1VRY0dDZk54?=
 =?utf-8?B?YnhGa0huWGtGWHJNOTgzNlBVZ2k3VGI5aFJzaWh2Ny80ZnZMSzV4Zm5BYWE4?=
 =?utf-8?B?NlB2cTFZVGxQMmlDdWIwQ0N4YzNuekNaUVdLYmJwOVBQdjhRUEl2dVhlYVAy?=
 =?utf-8?B?OXdDSzJtNERMWk5uVWkrYzI1UDhnY1FBQnVXU05XUC9Oc3ZIejNnTVo2elNm?=
 =?utf-8?B?RHgrQmZKOHNhOG5aemlqQU4xa2tpOWlCbjlLYTBoWitwNUFQZkZWRDc4NitU?=
 =?utf-8?B?aDh4N2JuOEs0RzkzbjRRNDRVQlAxcDJpM2x1bnVsUXNpN2d0WnJjblcxY2RW?=
 =?utf-8?B?Nm5XUGpsUDBoVHhWV3ZiMHZEbmw1d0ozdzhtbTJPYTRqOHNiZjU1amF3djF4?=
 =?utf-8?B?N3Q2SUFWd2RQUHhncUxDeUVvNWk4eE01MlFNL3pnT1ZtN3VrVGtOeXpZS2NT?=
 =?utf-8?B?R3g3RHFkOHZYb3MycHV6UHF3NFRwTy9lM203bnVWVE56Y1B3Q2hxdnBoK3V4?=
 =?utf-8?B?QzMydVA2SjRmaTIrL1prY3JlWEZoT2ppUUc4SElGcUQxbXgvWUszVThTUUs5?=
 =?utf-8?B?SXM1THFCL0NGekk1enRjN3BVc0NibWt4WWtqclZsejJoYXBkNHlpNnptWWpz?=
 =?utf-8?B?MHlJT2VYL3VTc29wa01KL1VRcDRIb0YrUk5tZHM3SUR5bDdNa1NVUGdlNTZy?=
 =?utf-8?B?RjU3UGxpMSsrSGJ4djZUTEkwSXdhQXdrNmZiTmJJSk95Um95YmR1OWhXYk9H?=
 =?utf-8?B?L0ZSYm1tVjlaaVlWaXEyUTF1dGtxSWxjSWUxMWJGcHpHUHgyM0NqZnNkZGR2?=
 =?utf-8?B?Wkc0bkdWZXg5dzd3RDFpcUdYSlZHaGxMV2dwKytkR0x2eUVXWWVDSkk2Nmhk?=
 =?utf-8?B?Wk1STUR3My9LNlluRkRZMktyWVFJcHhnRUV3cU5tZVdRcXRyV3RpNFp3bkpj?=
 =?utf-8?B?ZWp2M2FoY3VOc1VMZWJoRHpaaWtqQU1tRkJEeFoyaTFraXV3WitGREhVeHZy?=
 =?utf-8?B?L2UxejkvVTBpejBOd2ZxTnBCZnNwVXZtc2t0aEU5anRXS0hBckRxcEVoWXda?=
 =?utf-8?B?YU4yNitQVUFXOVp3TnJ1RW1JdDdibzVOWkNLdzZhbmUrcHlOb2RQdzVKYWJR?=
 =?utf-8?B?bkxnU2liVzNhUjAxRWxtWE50Y21lbkVjRlprdUUyUk1XVEFhYUoyYkE0RjJ0?=
 =?utf-8?Q?kPX2tEb+Dm1o3oO+B743ikK70?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f72275-32ab-4df6-9239-08ddb30773c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:11:14.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NfpKsDwlGycGgA68opeDy+6vVyrCmqZXgsIEpvOAhmg+IOZHAD7oPHM3gKqLcnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731



On 24/06/2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use generic names prefixed with 'vuart_' in public PL011 emulator data
> structures and functions.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/dom0less-build.c     |  4 ++--
>  xen/arch/arm/domain.c             |  3 ++-
>  xen/arch/arm/domctl.c             | 14 +++++++------
>  xen/arch/arm/include/asm/vpl011.h | 20 ------------------
>  xen/arch/arm/vpl011.c             | 24 +++++++++++-----------
>  xen/drivers/char/console.c        |  6 ++----
>  xen/include/xen/vuart.h           | 34 ++++++++++++++++++++++++++++++-
>  7 files changed, 59 insertions(+), 46 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 7c1b59750fb5..11b8498d3b22 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -216,7 +216,7 @@ int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
As can be seen here ...

>       */
>      if ( kinfo->arch.vpl011 )
>      {
> -        rc = domain_vpl011_init(d, NULL);
> +        rc = vuart_init(d, NULL);
we end up with init_vuart() and vuart_init(). That's quite confusing. Maybe
domain_vuart_init() or alike?

>          if ( rc < 0 )
>              return rc;
>      }
> @@ -247,7 +247,7 @@ void __init arch_create_domUs(struct dt_device_node *node,
>           * d->arch.vpl011.irq. So the logic to find the vIRQ has to
>           * be hardcoded.
>           * The logic here shall be consistent with the one in
> -         * domain_vpl011_init().
> +         * vuart_init().
>           */
>          if ( flags & CDF_directmap )
>          {
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index be58a23dd725..68297e619bad 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -11,6 +11,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> +#include <xen/vuart.h>
>  
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
> @@ -1072,7 +1073,7 @@ int domain_relinquish_resources(struct domain *d)
>           * Release the resources allocated for vpl011 which were
>           * allocated via a DOMCTL call XEN_DOMCTL_vuart_op.
>           */
> -        domain_vpl011_deinit(d);
> +        vuart_exit(d);
IMO, deinit is more meaningful here.

>  
>  #ifdef CONFIG_IOREQ_SERVER
>          ioreq_server_destroy_all(d);
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index ad914c915f81..dde25ceff6d0 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -14,6 +14,7 @@
>  #include <xen/mm.h>
>  #include <xen/sched.h>
>  #include <xen/types.h>
> +#include <xen/vuart.h>
>  #include <xsm/xsm.h>
>  #include <public/domctl.h>
>  
> @@ -30,10 +31,11 @@ static int handle_vuart_init(struct domain *d,
>                               struct xen_domctl_vuart_op *vuart_op)
>  {
>      int rc;
> -    struct vpl011_init_info info;
> -
> -    info.console_domid = vuart_op->console_domid;
> -    info.gfn = _gfn(vuart_op->gfn);
> +    struct vuart_params params = {
> +        .console_domid = vuart_op->console_domid,
> +        .gfn = _gfn(vuart_op->gfn),
> +        .evtchn = 0,
> +    };
>  
>      if ( d->creation_finished )
>          return -EPERM;
> @@ -41,10 +43,10 @@ static int handle_vuart_init(struct domain *d,
>      if ( vuart_op->type != XEN_DOMCTL_VUART_TYPE_VPL011 )
>          return -EOPNOTSUPP;
>  
> -    rc = domain_vpl011_init(d, &info);
> +    rc = vuart_init(d, &params);
>  
>      if ( !rc )
> -        vuart_op->evtchn = info.evtchn;
> +        vuart_op->evtchn = params.evtchn;
>  
>      return rc;
>  }
> diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
> index be64883b8628..5c308cc8c148 100644
> --- a/xen/arch/arm/include/asm/vpl011.h
> +++ b/xen/arch/arm/include/asm/vpl011.h
> @@ -59,26 +59,6 @@ struct vpl011 {
>      evtchn_port_t evtchn;
>  };
>  
> -struct vpl011_init_info {
> -    domid_t console_domid;
> -    gfn_t gfn;
> -    evtchn_port_t evtchn;
> -};
> -
> -#ifdef CONFIG_HAS_VUART_PL011
> -int domain_vpl011_init(struct domain *d,
> -                       struct vpl011_init_info *info);
> -void domain_vpl011_deinit(struct domain *d);
> -int vpl011_rx_char_xen(struct domain *d, char c);
> -#else
> -static inline int domain_vpl011_init(struct domain *d,
> -                                     struct vpl011_init_info *info)
> -{
> -    return -ENOSYS;
> -}
> -
> -static inline void domain_vpl011_deinit(struct domain *d) { }
> -#endif
>  #endif  /* _VPL011_H_ */
>  
>  /*
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index cafc532cf028..2cf88a70ecdb 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -134,7 +134,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>  
>  /*
>   * vpl011_read_data_xen reads data when the backend is xen. Characters
> - * are added to the vpl011 receive buffer by vpl011_rx_char_xen.
> + * are added to the vpl011 receive buffer by vuart_putchar.
>   */
>  static uint8_t vpl011_read_data_xen(struct domain *d)
>  {
> @@ -571,9 +571,9 @@ static void vpl011_data_avail(struct domain *d,
>  }
>  
>  /*
> - * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
> + * vuart_putchar adds a char to a domain's vpl011 receive buffer.
>   */
> -int vpl011_rx_char_xen(struct domain *d, char c)
> +int vuart_putchar(struct domain *d, char c)
How can putchar refer to RX? By definition putchar() is used to print data to
STDOUT. Here we receive a character and put it in the RX FIFO.

~Michal


