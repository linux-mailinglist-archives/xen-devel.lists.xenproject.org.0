Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF215A893D1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951966.1347569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zed-00078D-DE; Tue, 15 Apr 2025 06:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951966.1347569; Tue, 15 Apr 2025 06:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zed-00076j-AO; Tue, 15 Apr 2025 06:20:19 +0000
Received: by outflank-mailman (input) for mailman id 951966;
 Tue, 15 Apr 2025 06:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbqe=XB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4Zeb-00076d-Ud
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:20:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11b2666-19c1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 08:20:15 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 06:20:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 06:20:10 +0000
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
X-Inumbo-ID: b11b2666-19c1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnFEeav797WKBme6IDnSzsXwTu0sYMbrFAZBQIyyS2yiE96zB07odTmntuf71CHEiLlW69QuUbXF5nxVWawJ/xAU1Jtb27kLF8cI8wvmW1/vj3Em72YJoTQdKS8EgdYJbDVaeXSF9qo3zatClpQzPiAAlbe6hYHIFhxfy9fVWHWfhXn/LPlCluIm1hrGg6FCHWa7uHj0gQ5JshsmEjheg2OKZ6E9qnhkePs3CzfxSIOrG9P+dJHuQNRBZVmU+XrR865XNZNJ0YR1O0UvBk6zaevpCkjJ4sKILl3r1JzjukwNa+WKpxGO5q7oE2CeBw5cPKP67P1tm8GnQ6jvzfdW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKob0HwFJmBHhrRE47Bo4dQdBsq+8eR39upUjcpBgQs=;
 b=gG/kivv1/cbgcsko1EIeobhecvQN4+5bn69eauOGh8wcXZEVCc6QsUHw+yaV74Ag8w+afIoRheS2XA89dk13DhEYfNgF/66nczRfiEdqCfvMvJSV6mRQ5+1ZVM91CuoGMwH5JI6qHj4Ep+6pab+PQsJ7Pd8GeW0uJNPXTLFHp3ARSSlGa7Ho8kz7nWvGYsClhbvc5WdCRIjJLK/mx8P16Xm/szvntk1buKqIw2wdPT9pLMfK1b4+nV/2O6Idaw5BSjgwwxVTyDJI56Cvd34Ly2k9OxSe+HvQVmIFdRQ1Vh1ILCR0ov2TlNtgVHdWGhR8/B5IBJuhfG3OESP00+P8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKob0HwFJmBHhrRE47Bo4dQdBsq+8eR39upUjcpBgQs=;
 b=bbz39wkRkFrNtRHweea/L7Zi191XTVFxiRONx4bJOLoaBj9UiNDcTRyGi4Nb2EDver+ELdv2zPzBSkmLdvPrcM8pNLKiUk/OVzDAXGv9qP5nNzkP+MUK8yqza+qOc8avGngF8JK7cJa64M8/UgfHlSjFMPA7UqpyV6Lbewp9Xsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <63dd5390-c143-491c-a727-0dc00220391f@amd.com>
Date: Tue, 15 Apr 2025 08:20:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] xen/arm: Move some of the functions to common file
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
 <20250414164514.588373-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250414164514.588373-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f1bb44-3f7a-4577-ef4e-08dd7be59363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkdBd3hpZk1LQ2NQSW9iRFVlWk43dGhteHV6SW1zWHVHcUpMYXBGSktISitv?=
 =?utf-8?B?cHk4R3dpU1dLVkhPamZRdlFOZndaalEvcHdiNncwd25yQjIzcG45Y2VlYzRS?=
 =?utf-8?B?ZHlmbWtTNjdCMXhhWHFBdWZUd0J1UFBzSkdxZ1Y4ejZtMDJsNENhc2lYanRH?=
 =?utf-8?B?NFJLcDFMdmMwMzM1Mno2V3h3K3h1STBNY3puQXJEL0k3d1RqTXpPdnBSQ1JI?=
 =?utf-8?B?V1E4aGdHdXFZbmtoU21ROEZQZ2ZYWHBwelRPRElZZWwrNFFQcWNCbzlBK2Ur?=
 =?utf-8?B?bHA1SXgzbFJ2WWFYNmxweDYyYnBZSEx0emh0NE85Nm54WXJHN1FURW1MRmdV?=
 =?utf-8?B?QmNSa2Y2aU56Yi92SlBGQ1pJUHcxOXRJcnAwdlJkMm1oVUZvVDAxTFp4Nmdh?=
 =?utf-8?B?NFB2bVI3Sy85WGE4eVpNbnFJYWxoVmFUWkl5VUtyK2ZzaHpRZ3RjTUZkNkZX?=
 =?utf-8?B?bTNLUWRwSExQWnJ6TkxmemJjWGRDbmQxR3UySlYxSW1adytaa3AyUFExV3c4?=
 =?utf-8?B?RGRkUXhmeE0zZFdIRVdxMlBCbytyQWxSc3Z3UlFGMHJGR1hKSENrMGV0M1Nj?=
 =?utf-8?B?SzNYMzkrVWtOWGF6SE5nQ3NXNE03cFN0SFk1dkRMUjY2QWdqMXdSZnZ4aWlB?=
 =?utf-8?B?dThYc3hQbVNnNDhjT0VkTWJJNXg4a0VMODEzejFMZlZIaDcxTXpnN1ZqYTJD?=
 =?utf-8?B?eE9DTmVicEhBR0ZoUTZLNDRrYXM5aE5WUHV3QTQvVVdTTE5ZMFc1NDNyU3Iv?=
 =?utf-8?B?Vmw2WHhRdmZvNFBham9SRmJQaEZFREttNU1lWWJ2RDZwdDZueXNLdXJHSHFO?=
 =?utf-8?B?WU9vN2lxaC9IUE5JSm9Jc0FsUGswV2xTeHhGenRSWFVrV1ZHT2ZkdjJtS3Jh?=
 =?utf-8?B?VUdEdHdWa3RBQ0VodG8wNGUwc05tdmNvQkNFSXlXQzI0ZGxyK004L3dsejJZ?=
 =?utf-8?B?R293c3hMa2xKU25jRzI3NXhSSUkwUkp2TWdoR3RicXRVeG80bDhYQmgzekJk?=
 =?utf-8?B?bmFWS1RVT2lQL2JQeEsyTUpTQzRSdHEyKzJNUzYrOTdxcmFBL1hpRnk4WkFJ?=
 =?utf-8?B?enVuS0NjYUFCU2Q1MGFXZUR2SWxhWE5LUW90dFVxazd5TnBoSzRvbjRVeTVi?=
 =?utf-8?B?Rndsd0tNc1Y3NW5GVWJ0V2hrVFp1REE5MWdNVTk4a2Y4eTVuTkIzM1ZoTzdy?=
 =?utf-8?B?WHF4c2NZSGJUc2JLZnZ3SWpkYjVGUXBnRm1xZTNuWkl6MVV1NG5ETnlnb0dz?=
 =?utf-8?B?Z0JSNDkzZWRnTXFhY1owc1lQVGRUTzBCV1RSd1NGb0tjTEh2R0NDUWdrbnpW?=
 =?utf-8?B?UU5uVTlVcXlHZ0JXMy8wMWh3aTNJL2dveTdOeVV6dFBmdzlhbXdYN2dUSkNk?=
 =?utf-8?B?dk5aOG5MWXB1ZlNvV3hTTGgzZjZ3TXZSWDlibHRaUHZrekFiUStMUHp5anNl?=
 =?utf-8?B?MCtzYTVBaTNuMXVXRXZ4dktaRzRHZ01uT09BSGhvT0xBOGdiZUI3N2pkQUFV?=
 =?utf-8?B?azhIbFRXVnlITzU1c0JFbTFMQmRJakpwUk5uTmsrb2lkZFJ4aWFNRkladk5C?=
 =?utf-8?B?bG1KeFE5aXlNYXlNbXJISVV6STRuRkJ1TVdOdlZWQkV0cnQ0akdBcHk1RmtK?=
 =?utf-8?B?S3N3dXVieE9VRzhPL1l6VUJQTTdFbUdJUVBCVW9CRnpWVkptU3AvaVhDdStO?=
 =?utf-8?B?QXpwVko0K2ZNTE9CTzg5bVd5THI5Uk8yakwrY3hpNWNhMnpNdVVaYlhHNU5Y?=
 =?utf-8?B?ZmhHaDFHME1vYXAza0JiRkVWdW9reE83c014OEY2QVlVRVJxcEtyL3BORjZt?=
 =?utf-8?B?eEZXdjdUR2ZhMEhteFBHSmJoZ2huNEU5VERhV0RxR096cEFJMkxPM0tSd0hq?=
 =?utf-8?B?SnljUHNqK3UrMUV0UytoZHZMcHhLUmZvZ2QzelN0YUVhbmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmpPTS9uazgxVTgyWUw4SHRqbzdhWXRaUzhIOXVTbGc5MVlGcHo1bHNFN0hQ?=
 =?utf-8?B?enUxSHg2WWwvWTMwVzJ0anZqZENwT00rNTJyZjhCWWtQU3U0aVBESVMzVElv?=
 =?utf-8?B?UUJ6YXl1RzlWMEI2U0cramZPc0hHLzJtN3BXOEVzUFNuUlV5YkwzM2M1bk1u?=
 =?utf-8?B?d1k1VFgwblM1eEZOT3lGWjBWQVBFQndpbk9rdEVDWUpCVXBINnMxL2Vud1Vy?=
 =?utf-8?B?OW5zVkdsTU1HbDNJRHRCYWs0UjFlcUhyUEZoQmFIbmpqaHV0c3dZbklJRzlk?=
 =?utf-8?B?MUhTLy9hK3pjT2pMQ1lrRHhIZFN1NDJVQU5UQ3NoeWQzL1Faa0tMRXZ3ZDR1?=
 =?utf-8?B?d1MyWVIxVGE3cVp3OWh0NktpTXhja1Q2eUNwSmxOUS9tT0Y3cW81VG4wbDZB?=
 =?utf-8?B?Qmg3M1hWRWlmNmh5YytOTTkyNXN3WXVhQ0ZwZ1RPcksvcXFHNVpKZE9rdzlo?=
 =?utf-8?B?bCtsWXFGczA3cmhBRlhwb1ZlOE5VM1lxVkFJSjBKcWFIS2t4cEZ4THp4WTZs?=
 =?utf-8?B?Nnc4emdVcXp6aGUvYzg0c1BkYURKNFdEcnVrQ0FMMmVIK21vMzM1NmxQb0pv?=
 =?utf-8?B?ZmRSQUh0c1kyKzBLWThOVEJaeS9FV01NNXFYSFpCcFJ1SEdadlB5WEFwbUlY?=
 =?utf-8?B?MlBZS2F4VEhzNEszLytMM1doTC9SQmhvYVhrV1g1dVpZenNlalMzbE9PQ21x?=
 =?utf-8?B?T1FUNzI0ajZidnVlNm1GTTFTK1k2V0JrYS95WGlDcW1RdkFtWjlDdGRZVSsz?=
 =?utf-8?B?WEdnazFUdHR2VU83Sm1OS2p6OWh1SFJVYk9XampURXdiUWRDTHRqUEhlT0Zm?=
 =?utf-8?B?VURrUUM0cmtCYzhxWDFDc1pqVXhzVkhBVjVkWUd4b2Vya1huWHpzS21Fdi9y?=
 =?utf-8?B?cnhHSk45bEs1dy9yK2ZKTy9RZXZvTEhOVzV1aVZTdWc1cGZlUW5GeEI5RFBG?=
 =?utf-8?B?YjdVNHIvOTRTTkxVdWVkNEsyeVh6Vkx5UGsraUIxWlFvY1lJMVpDb3VlOWxO?=
 =?utf-8?B?ZnVYZmxnUlRoWWVaMUEzWHhlMXZJZExvU1FOejY2Z1VaS1cxUlZ5YU5INnNs?=
 =?utf-8?B?bm42NTd0eVhKbkZPTzh5TmZ3U20yWVBScXRSSktvb3NwVktNMnhpOEZVZjJW?=
 =?utf-8?B?WGU1VXJ0dFN6MGFvRnB5U04yZlI2eXJMMHY3YXp1WVFIeVQ1b1BwYzA2ZnVP?=
 =?utf-8?B?MUE4bFlsYVpuREtQa0IrKzNUTzVRd0MyMnlueFV4eGQ4MkFSR2o4SU84a1RH?=
 =?utf-8?B?c0IrLzlSMVZEU0E3NElHNzdiSm1xdlBRUDR6QjkvWHRqaGsvM1Ayb0FmdUsw?=
 =?utf-8?B?Y3N0RytiRHJRNkpkek1BYlY3NklSYm9tcHNxQ05pWGpPallKei9PaVBUMW8y?=
 =?utf-8?B?VmRDeDZzTzBjaXcxMEtOTWNUSmtaL1hqamJuOHQxU1gveWtYYjczOHpXdFlG?=
 =?utf-8?B?amVrQkZJbElzN3lrSGhXcXNra3c0azR5LzBjOUJzNCtacEZKaDlQTFcvejdW?=
 =?utf-8?B?bFlyRVhGSGM1RFhtZWh6NmFUOXRINE1PdzFEQUN1UitCNUI0d0hQS0FmTUhx?=
 =?utf-8?B?RFh5c3pCMDk4M3ZWb1U2OC9NYjJMZ0NmUXNDUVl1eHh0b0dkQXNqUVhPODFJ?=
 =?utf-8?B?YWgraU1nalR0SUJZWDc5eWlhTng4WnM1amZHYUU1cjluUVlydWd2T2toa09P?=
 =?utf-8?B?VlBDY2dGTGU0YWxBU1lLaklIN3VBSWppc0xWUDVGWStEbTBxbHRYL0xIMVlQ?=
 =?utf-8?B?R2VyYWNwUS9WWFhsZnNTTXhmdHJuM21vZGtBMmpNQno1L3NYVlJiYi9mb1hI?=
 =?utf-8?B?Y0FwWUgwbmoxdk5yYVVGcTBNeUF2VVd0MTFwV3QxL0FrMkNWcjIrejNybU9l?=
 =?utf-8?B?dytuTG1jVGFQNUtFZGRiUlgrVTBsMGZ1RmFnUENMdkx1cS90K01uZG1acFM2?=
 =?utf-8?B?RG1PL0Z0dEN6ODdkMXFYU3hqTXliQmZDcDBmSmQ3bzQwM2w5RkxuSmkvbTk1?=
 =?utf-8?B?d2JlWnU1blkvaHhYeFNYdk4xUTJHUjU5RjhPOHJ1dWxvcDhLODZwckR3Vk1K?=
 =?utf-8?B?RU1WOG8yOWxrQlU5S0s0VUhzeTJkNkkwbEYzTGt0d3VtUEVkZXpWelJ4czFv?=
 =?utf-8?Q?38EyuOVG4Gp9jQWnTnatvUSQe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f1bb44-3f7a-4577-ef4e-08dd7be59363
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:20:10.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuofOUiAmFvcmyDeYcDk3becwVdg4+7GySo2gHW7XnnyGjA8qyIgtQBvM56rCdea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356



On 14/04/2025 18:45, Ayan Kumar Halder wrote:
> regions.inc is added to hold the common earlyboot MPU regions configurations
> between arm64 and arm32.
> 
> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
> arm64. Thus, they have been moved to regions.inc.
Despite my numerous remarks about the commit message style, you did not change
it in this patch even though you were respinning the series. For the future,
please fix remarks in all the patches.

The series is now reviewed. I'll wait a day before committing.

~Michal


