Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCEACC040
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003978.1383616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLD0-0007Pq-52; Tue, 03 Jun 2025 06:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003978.1383616; Tue, 03 Jun 2025 06:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLD0-0007Mx-2G; Tue, 03 Jun 2025 06:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1003978;
 Tue, 03 Jun 2025 06:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLCy-0007Mr-8x
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:33:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:200a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c811d1a-4044-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 08:33:09 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB8846.namprd12.prod.outlook.com (2603:10b6:a03:549::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 06:33:03 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 06:33:03 +0000
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
X-Inumbo-ID: 9c811d1a-4044-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvkWMpbt00tH3TQ2/WViuCTdR/amRn0Z7PIlb9zZEjaerxQCSCqU17H2nrmKcg4dDt+3nS7LsKBB2/brxIZ3+fUEnkpe7HAryfupeU74XUb9lgUsc8Lj5sONv3qqo8RsCw266TVO/lv47CfPcl8NySUMbjhHZSyGsypQYNJMGKK/Afz4v6nYnECfiD3fJNj94ABZCuw+yycV5Xtb8X3mu9QKxo3beIQ0FMd1+MFLFID/WmXb5yIabyMbiNi3e2K8+Fqalk2NEboyk1LcyTJpz1griRIFzNV48eSISqo23JUO3oYrcaWBfMbAfvG9ZaTbRzup0ULx+M9+JlN1/gfQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHibUciVhTMqdrtGQoC9wIYjBHXIHzpKrEyjWLC6C+8=;
 b=xHkoMlORXynFnDXcFYxgVxkZlkUX9eVu47DeZ2DyS2BiMg+0yjBGE4eZJd6LSD/Cmo6e7+5tigp3l1JR/351suLNOt37/rJVhyl4Bq0W0QTS2761z302RhQ56dKu1oOykY/ydHYR1n/S0NqaeAscG9o3IBpohoxYot0m9nCRTf+BtCRYpwcEY8mP+vWy33dXhGYYFvL0qK4nkruyH/R+WOa/art6x4CY6hB/gq5HMVrFLu/zya+jOb4fTGi3Cx2JZlc4PChcoj3DqMv95rm8MAcHyeVK3YzzmRK1ktbSoV5t6n0hiRs84QkgmdUnUUlNA6lAjxTLJ2IpyfnU/TPPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHibUciVhTMqdrtGQoC9wIYjBHXIHzpKrEyjWLC6C+8=;
 b=2BzELmmHrgeCf6tibPIDk1YoECAvHxs9yV9LUKMEnigxw3/8Go/n7y+js5r09//y1Et4bIzr1ZXmKBMrWNdB4qVbMaEznjbsNCKtUeGKRIacD7uop4ZxxTw6BMmgvym6tBdGflTmrzWUFFUqSnnFmFdjQKL9yfiRf+NolDAl7YE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3e8391b7-3b3e-4092-9689-ad0c94059571@amd.com>
Date: Tue, 3 Jun 2025 08:33:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] tools/arm: exclude iomem from domU extended
 regions
To: Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-7-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2506021738380.1147082@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2506021738380.1147082@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:10:be::24) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ2PR12MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff1ec9a-6341-4cc5-2dc7-08dda2687e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRoYWlxOC8vVEtaNXRrc2ZiUGJkK25jcGVCRHM4bGFpNjVQYWJvOWExaTRw?=
 =?utf-8?B?WTY5YnpzSXJJbE9zTEFlSkRPNWl3OUZYaVFnZ29HMTFZNFFnS3RQUnlVWk5j?=
 =?utf-8?B?dTczaVhlRlBGakR4dnNBa1Q2aDV6K29VczNqZWUyNUUwMksrV2VlV091TnA1?=
 =?utf-8?B?V2dWNDBFY0JkNE9Ra1p2dmRRRVpYd2VEQ0h0VTZUV2p4MENKS0RVbW5Wamw3?=
 =?utf-8?B?V0J6enlhdVV1TExjV2dFeE5Ub2ZGbXpzYlh3VEc2OUF6Y1ZhSlB6djhWR3Rk?=
 =?utf-8?B?STVzMlFBTFhGdnZoTzcycitEdVpMbDBRdjNQVUlUYWdVZkR0eEJuRlA0QXRI?=
 =?utf-8?B?SkNIUHFLRStjV0c3MWVKYlV1VkVDNXo0VmFibWE2S0xDOXQweUV6RTUrU3lI?=
 =?utf-8?B?K2h6dGUxV2FYc29HVndpUGpjZEFhWktmajVpbFd4QkFNWjh4M2duaW0xUm5h?=
 =?utf-8?B?WngyTExiRCtmZkVZUXZsNEZGNEwwRHNTaVUxM3d6c05TcnV3Q0ZEUlozMmQr?=
 =?utf-8?B?aFZwTS9iSTlmK0RiUDNBMEw2eXhOMjM4MTZpSzRUZnRPUG1zejljbllFRGlo?=
 =?utf-8?B?eEtvazlwa09tRmlOMzBDa3I0VVo4N0dHR3laZGxNVHB5b2NyRGY3RW1UcWY5?=
 =?utf-8?B?YVd6bXFvTUNoemc0T1kvcVd3ZGQ5NU5jSSttWlhsL2VKcnhLeE5jSjJMZStZ?=
 =?utf-8?B?dTZGM2VCdm5yYkVPUFFhS04yNEE1YnZGWVRaWUZrUnpmM0JKOVcvNmRzS0xk?=
 =?utf-8?B?cXlqVmwrR2ZJTEJiREtTNGNQYTVYSnFCS25rYVdkTHJtbGdLQWZrTGtBVDhQ?=
 =?utf-8?B?THB6RjdaeVpiZVN3N3BBZk5EMGFlQncwUkFQM1liLy9SR2RzS3Q5eVg0cUR5?=
 =?utf-8?B?U2FDYXFlclV1QjBJZkowdGk4eXRUclRtYmxMVEg0Y21JWjAwekNacDBTRWNC?=
 =?utf-8?B?R3cyRWQvRnRiY08vYjc3cnhHUHB1L2YwQ3NtZUZBSzE1YjZvNjVSdXllRjUx?=
 =?utf-8?B?Q2o2Z2hJMlo5em9rdFU5NDgyd1lSYnBjT3FvOE9kNzhJd1dwcGJJY1lkMDAw?=
 =?utf-8?B?OStqM2xSZ2RkNDdUSEYwWU5SbkVBcTliUXN2am5nSVRoMlVuVWJHdDByTmY3?=
 =?utf-8?B?WmM1TmVRdUxLV2NzbCtma1RjOTM5OU9UMG5UbVdPOERLcnYzejZPWjZjakRt?=
 =?utf-8?B?cjdhbzBmWXZUN2crRDRNdEczNkM0WkdDbmpwUktwKzBEQ3BMM1luTDF0Nklu?=
 =?utf-8?B?Vm5jVzAxSXBaR1ZIVVpGY0hhUFBoRkhkYmdHNHVmSVlZbTBVRFI5UWNPWHNQ?=
 =?utf-8?B?NWFldWZoOVNPd3lVZWc2ZjF4UXhHdTBhMkJJM0wwYjBhS1oxa3FsTVg2R2h5?=
 =?utf-8?B?Vm5FTjdSMDZSQWRJYTROVDMwZW1kTWF0TDhmNG4xUDFqQzVhT0o1c2VZWXA5?=
 =?utf-8?B?d2J6dkpNTjZhNHZrNVZWV2ZGeGRVUmJPaWNSRnV5MjU5RWgyZ3JubnFqU0lH?=
 =?utf-8?B?Z3BOcFFzMnh5NEZOVW45YTVDa3VJU21yLzNyT2hTT1RtTGRERXp3cWJra1dk?=
 =?utf-8?B?eStTdzJOcXJEbTJ4NlUrSUgwNXJpMmpITDJtWnB0d1dQckcrZnNHVmk4RHlN?=
 =?utf-8?B?Z2R6cnNhbTJ6UjRTZGV4MlY5QVpsWlhmcWRnRlVGcHUwL2k1WnVHSTQyNkp4?=
 =?utf-8?B?elhWeGFYTzFEcmdJUUJDbzg2d09CTUhTMFVmVnNTd1dXd29CUCtUKzgzb0NK?=
 =?utf-8?B?OE42cWVYSjMyL21mSGJ4UmYzSDhMQVdjeElUVUpPZjZoelBDOEVybFB3MU5J?=
 =?utf-8?B?WFJ0Sm01RGhwRkNvNmMvWmRvZXM4MFdxOXNhMHhVdjYxTUVQZW9QcUdjNm1i?=
 =?utf-8?B?Y1QvUVV0Q0RZNlF6THRoQzVPeDNmMGtLbnZxOGNuY291V1JFT1NRdkR0blBY?=
 =?utf-8?Q?HfL4XJCsZgA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmV1WVFoSmwrd3lPbE93SFlMK1plY2hCNVBlT1ZoS1Q2Z1pGYXBnNWVaQjRD?=
 =?utf-8?B?NTQyd0kyL1B2bWxuWG1Ra1hSV0RzTzUxbzJ2MTBZT3VrOFEyT0c1eFFaUDFB?=
 =?utf-8?B?SFd4dkQ0QklheE5paGxsSDFCZTgxZFR6ZmRuWS9PNU90bjFmc1F0ck52YjRM?=
 =?utf-8?B?c2ZPZjl1MXp5YVBxWjYvTEJIaXRXaitPdjNCLzFKMHV5eE1yRGx3NEpTSU1M?=
 =?utf-8?B?bkMxTXYwNm5yWm5FQjhKaTdQQWlsTmtnbjhzSVBZZGprQzFrVm1qaSs1SHgx?=
 =?utf-8?B?d0pXVllHeG5UdTRJNWxlR0x3N0QxakVmVWNzdS9HZitadGMyRWx2T0xtdXNF?=
 =?utf-8?B?Y2VOamF5RXlzUzZyLzBKR3hKbjRLbXNobjVWUk42bzNLQXVBOTdseW5icGo3?=
 =?utf-8?B?Y29PTGExTjMxR0tBQzJUdnR3UGJ0QkhjcEpiWlhYd3RxT0c5ZkxWbkRtTTVM?=
 =?utf-8?B?QVVyUDRTSkxLM0M5YlZ4ZWlzMDV6R3lRNTRCQkRheTF0ZFhFdVBVZTFIOFEv?=
 =?utf-8?B?MittYVkrZFo2TmZGUzFmUko1bmN4aElHb0FNYzRxOXhoanh6eEhIZ2swV2Nx?=
 =?utf-8?B?TW5GSFFrdkhCd1N5eXBMclQ5cWtPblBOWVgzOHIyWG1TRkdRNFNHbUxGa1lr?=
 =?utf-8?B?V3ZhYnVFdmFQZG9DcVB2MmJ2dnoxT0U5SHJLMUhiSmhrRm5LbTg0RUlRNS91?=
 =?utf-8?B?Z3Zqb1RuaUdSYzJqYkhFdW5tWkxCR252WDlQa1V6VWZ2bEQwRkRMQVFZSUJt?=
 =?utf-8?B?QzJ2QzBrZ1JRUzU1bzBqY3NKNndQNzlEWUdqZkFWRkJnZWtJSmxYZGllc3Zn?=
 =?utf-8?B?eE50ckJXUkRpYm1hTG05TFFZYUtGR1hEWGxxbVdUYU43Zk9KS2pEMXEwU1NQ?=
 =?utf-8?B?R0JubnRTcEphYXMrOW90L2cvZWlDVEVENlMxdjFqbDlrd0lXNkw4TXdUbXFE?=
 =?utf-8?B?WnVXOVRrd1A3NnFidXlodVRHNDBlVHk0TTRpUXp1bWVKWTBrSXErSW45L0NF?=
 =?utf-8?B?R3lDMVNrL0s5ZnE1L0tOQ3lGcitsVU53aTRWcFJJditrUHN2dytNNmVNRThC?=
 =?utf-8?B?U1FmSFhoOHhPUG5OQ05VOHlNbGVGVGNoZStuNzJ3OTNZZXRsMHRrVStVYU4r?=
 =?utf-8?B?STVMcXJ1cUxGd3p6TnBQWnpsUnd0ZlNhNGczNVpDVURRSXJ0VXpVK0VJOGpz?=
 =?utf-8?B?ZXhUQjZVakN5VVdUMnAyVlNJWi9GRDVraExIcmJLTnVKYlFXamJWOE5tTUEr?=
 =?utf-8?B?d3Z4anVFVUNhS3lwcEtFOStINCtoS281UUtJZE1iS2VqQmNNRS9MRFJ3VWxj?=
 =?utf-8?B?TDdncUpTZWo5YWpYTDJMT3BNaXJlbjNjT05heDgwdnVoVkViR0dvRWwzbXEy?=
 =?utf-8?B?RGlZeVdrb1I3TVZlNzQxNUJqOXNpK0lhK2JzSnFIQXFnRFRscVR6N1dHdDhv?=
 =?utf-8?B?RXFuRjdqdDVOSmtzOGZCUDE1VFVUVzdVZGNEZWQxRzdPa2pRZExoa24rSlBt?=
 =?utf-8?B?Z2o1RU9GblppQXRyaFRNMVUra3VaeWdhU0NpQ0NkMUl5cG9Qb01abXRSNTFB?=
 =?utf-8?B?b1BGUmpZSHJHUVpBS3o2N2R3d0xmNS9Ia0hoR0FkTExVVkQwU3ZtbTAyU2gw?=
 =?utf-8?B?bCtlTEpwWGh3YWp4U1Y4bGtQS0hoSkIrbGRYWWxqd0hQLzZIaDJtTW91ak5C?=
 =?utf-8?B?QWYvbm5MVHNXbTlRbkViUXplR1lCQmpMcnRqbDcwdlo1OWRaT2VJNzZaOGla?=
 =?utf-8?B?TEVYZzdiSnVRbEd6ZFdJTTBlNW9UUHFOV2dwd1laRzlNc3hleEN4SDRaNjBB?=
 =?utf-8?B?Q1VLYU9GYy9nN2xmT3FGdy9weGErT3FFWklRVk5EbkNqM1J2TlpsSXQzMHpM?=
 =?utf-8?B?T0NmM2VjaXFkVWNXeWFYbmRCZG9FZEFnUitncWowMlpTcmMxTlRzZ2hRL2JZ?=
 =?utf-8?B?YklSNE9tcVNrV1pnVWRmR2IyN3VXVmN0U2txQWgwTzRFMUl5RTN6dEZUN0Yy?=
 =?utf-8?B?Y01qMGZ5NWl1aUEyakEya21EYTdidU0rRytRU0tTY1l1MngyOUFnZE5XcldP?=
 =?utf-8?B?UWRsaUFMOEZXc25DYXBhVlFZRzczL0VSMEgza0drcEl5VGxROCtEQmp2WmhQ?=
 =?utf-8?Q?DPBA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff1ec9a-6341-4cc5-2dc7-08dda2687e1d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:33:03.5721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EdMzB2/g4PWo8JLh2vzCOwY7DDe54qQ5mADWaVdLHpWCEQzA57YmhODNoj6X0QM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8846



On 03/06/2025 02:38, Stefano Stabellini wrote:
> I plan to commit this patch, unless someone objects
AFAICT there is a new revision (v3) that has pending comments:
https://lore.kernel.org/xen-devel/20250513195452.699600-1-stewart.hildebrand@amd.com/

~Michal

> 
> On Thu, 8 May 2025, Stewart Hildebrand wrote:
>> When a device is passed through to a xl domU, the iomem ranges may
>> overlap with the extended regions. Remove iomem from extended regions.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Not sure if we need a Fixes: tag, but if we do:
>> Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")
>>
>> v1->v2:
>> * no change
>> ---
>>  tools/libs/light/libxl_arm.c | 118 +++++++++++++++++++++++++++++------
>>  1 file changed, 99 insertions(+), 19 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 75c811053c7c..8ae16a1726fc 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -798,6 +798,8 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>>      return 0;
>>  }
>>  
>> +#define MAX_NR_EXT_REGIONS   256
>> +
>>  static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>                                  const libxl_version_info *vers)
>>  {
>> @@ -821,7 +823,7 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>>       */
>>      res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>>                                         GUEST_ROOT_SIZE_CELLS,
>> -                                       GUEST_RAM_BANKS + 1);
>> +                                       MAX_NR_EXT_REGIONS + 1);
>>      if (res) return res;
>>  
>>      /*
>> @@ -1517,17 +1519,29 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
>>  
>>  #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
>>  
>> -static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>> +static int compare_iomem(const void *a, const void *b)
>> +{
>> +    const libxl_iomem_range *x = a, *y = b;
>> +
>> +    if (x->gfn < y->gfn)
>> +        return -1;
>> +    if (x->gfn > y->gfn)
>> +        return 1;
>> +    return 0;
>> +}
>> +
>> +static int finalize_hypervisor_node(libxl__gc *gc,
>> +                                    libxl_domain_build_info *b_info,
>> +                                    struct xc_dom_image *dom)
>>  {
>>      void *fdt = dom->devicetree_blob;
>> -    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
>> -        bankend[GUEST_RAM_BANKS];
>> +    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
>>      uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>> -                  (GUEST_RAM_BANKS + 1)];
>> +                  (MAX_NR_EXT_REGIONS + 1)];
>>      be32 *cells = &regs[0];
>>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> -    unsigned int i, len, nr_regions = 0;
>> +    unsigned int i, j, len, nr_regions = 0;
>>      libxl_dominfo info;
>>      int offset, rc;
>>  
>> @@ -1542,20 +1556,90 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>>      if (info.gpaddr_bits > 64)
>>          return ERROR_INVAL;
>>  
>> +    qsort(b_info->iomem, b_info->num_iomem, sizeof(libxl_iomem_range),
>> +          compare_iomem);
>> +
>>      /*
>>       * Try to allocate separate 2MB-aligned extended regions from the first
>>       * and second RAM banks taking into the account the maximum supported
>>       * guest physical address space size and the amount of memory assigned
>>       * to the guest.
>>       */
>> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> -        region_base[i] = bankbase[i] +
>> +    for (i = 0; i < GUEST_RAM_BANKS && nr_regions < MAX_NR_EXT_REGIONS; i++) {
>> +        struct {
>> +            uint64_t start;
>> +            uint64_t end; /* inclusive */
>> +        } unallocated;
>> +        uint64_t size = 0;
>> +
>> +        unallocated.start = bankbase[i] +
>>              ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
>>  
>> -        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
>> -        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
>> -        if (bankend[i] > region_base[i])
>> -            region_size[i] = bankend[i] - region_base[i] + 1;
>> +        unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
>> +        unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
>> +
>> +        if (unallocated.end > unallocated.start)
>> +            size = unallocated.end - unallocated.start + 1;
>> +
>> +        if (size < EXT_REGION_MIN_SIZE)
>> +            continue;
>> +
>> +        /* Exclude iomem */
>> +        for (j = 0; j < b_info->num_iomem && nr_regions < MAX_NR_EXT_REGIONS;
>> +             j++) {
>> +            struct {
>> +                uint64_t start;
>> +                uint64_t end; /* inclusive */
>> +            } iomem;
>> +
>> +            iomem.start = b_info->iomem[j].gfn << XC_PAGE_SHIFT;
>> +            iomem.end = ((b_info->iomem[j].gfn + b_info->iomem[j].number)
>> +                         << XC_PAGE_SHIFT) - 1;
>> +
>> +            if (iomem.end >= unallocated.start
>> +                && iomem.start <= unallocated.end) {
>> +
>> +                if (iomem.start <= unallocated.start) {
>> +                    unallocated.start = iomem.end + 1;
>> +
>> +                    if (iomem.end >= unallocated.end)
>> +                        /* Complete overlap, discard unallocated region */
>> +                        break;
>> +
>> +                    /* Beginning overlap */
>> +                    continue;
>> +                }
>> +
>> +                if (iomem.start > unallocated.start) {
>> +                    assert(unallocated.end > unallocated.start);
>> +                    size = iomem.start - unallocated.start;
>> +
>> +                    if (size >= EXT_REGION_MIN_SIZE) {
>> +                        region_base[nr_regions] = unallocated.start;
>> +                        region_size[nr_regions] = size;
>> +                        nr_regions++;
>> +                    }
>> +
>> +                    unallocated.start = iomem.end + 1;
>> +
>> +                    if (iomem.end >= unallocated.end)
>> +                        /* End overlap, discard remaining unallocated region */
>> +                        break;
>> +                }
>> +            }
>> +        }
>> +
>> +        if (unallocated.end > unallocated.start
>> +            && nr_regions < MAX_NR_EXT_REGIONS)
>> +        {
>> +            size = unallocated.end - unallocated.start + 1;
>> +
>> +            if (size >= EXT_REGION_MIN_SIZE) {
>> +                region_base[nr_regions] = unallocated.start;
>> +                region_size[nr_regions] = size;
>> +                nr_regions++;
>> +            }
>> +        }
>>      }
>>  
>>      /*
>> @@ -1565,16 +1649,12 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>>      set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>>                GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>  
>> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> -        if (region_size[i] < EXT_REGION_MIN_SIZE)
>> -            continue;
>> -
>> +    for (i = 0; i < nr_regions; i++) {
>>          LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
>> -            nr_regions, region_base[i], region_base[i] + region_size[i]);
>> +            i, region_base[i], region_base[i] + region_size[i]);
>>  
>>          set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>>                    region_base[i], region_size[i]);
>> -        nr_regions++;
>>      }
>>  
>>      if (!nr_regions)
>> @@ -1626,7 +1706,7 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>>  
>>      }
>>  
>> -    res = finalize_hypervisor_node(gc, dom);
>> +    res = finalize_hypervisor_node(gc, &d_config->b_info, dom);
>>      if (res)
>>          return res;
>>  
>> -- 
>> 2.49.0
>>
>>
> 


