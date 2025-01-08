Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23FA05C27
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 13:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867248.1278701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVZz-0005oZ-HG; Wed, 08 Jan 2025 12:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867248.1278701; Wed, 08 Jan 2025 12:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVZz-0005my-D9; Wed, 08 Jan 2025 12:54:35 +0000
Received: by outflank-mailman (input) for mailman id 867248;
 Wed, 08 Jan 2025 12:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vVY=UA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tVVZy-0005ms-77
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 12:54:34 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2407::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33e27df-cdbf-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 13:54:31 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 12:54:23 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 12:54:22 +0000
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
X-Inumbo-ID: b33e27df-cdbf-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghcv89W6XS5WW6wOMxzdpoouA4AWkKrvYaGTXpl5zCGtJVoTpuk5Hq9rS4mPQE2NAP6BHj6S8xyXVcZqyj/Cy3kXVO1u//lE8VFojUbCGTFzB/VTiuVFnlecpk5oSrpGjyOOOwcpyhcgMcSR+yTBJj5R2PwrpkAKAvmC9UscFZp02cIOAjbWnoqvHA3qfB0mxtShFJUPAQ6yc9Ewq5IW9P6++p0wmH5BF54jpyn04Ps2Iax/6fJoWjzyFZJjnjaY0agAw3iUKxeiZYSH4ul+VJAy82RGZsNpvGO2JUVnc5fR33Ymm7V4GSZrOeqoyQrZS2FpZk4zyvFfb6pNvOmZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaGIXQKjf385dVqMCPpd/f/1g6kbtGXFSsuzfot7uj0=;
 b=x6LwIIV1tTLmRC5xIxqQpXY98xcm5eTY8eeAu55lbPKRVxpczEZJwx76fgKwgm7ApXQ+ScEnVN7lQR9Z926HYuSpgpcy6x80chOqrmVqMzo44kit2rA2S5xGpGheiNbHdnuSFdJ79ivaBod+sbvuii+rpM/YKac83PVwXV3p3dYFwlRTM8JGYN42bBDXmkoJXNUyD/V0quGulzutHa5cdiy4/EgfNbm+PxubM9UOShzs3bzEVljAetrlC23zK8ilFzvL81exWPedP/bxttT5S6VfrJvsU2ux8auZd9JGJfpymPgCGi2xdQQjBqi9Ku6DePJOrxL+TzZHbKD+1VX0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaGIXQKjf385dVqMCPpd/f/1g6kbtGXFSsuzfot7uj0=;
 b=xY+G0JtJHgp+sDLt4BkAD1gdYEHnBB5lzDyDEDZUD9N7J2lIKrUzlIWOlJ5jpn0mg9Xk8ESJU3ObJYNw+wGKpgxEEhE4jDa6dbUyKjc+/lNJUtxQzlDt0vwKAWLb9ZJ4+BWQnL80opWrlYvRDMi30LN6NrOxPlM55RrTFVEN0zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f377f3dd-c367-4ab9-bdd6-705aa5970cbb@amd.com>
Date: Wed, 8 Jan 2025 12:54:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: fusa: Add dom0less domain configuration
 requirements
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20241219105640.3294591-1-ayan.kumar.halder@amd.com>
 <7402DB1D-61F6-467C-89BD-6985A6817362@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7402DB1D-61F6-467C-89BD-6985A6817362@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 57813f41-1f9d-4d56-4ce3-08dd2fe392d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3ZlTE9LaDJiVEwzdC9GRG9ray92aEMxSnNiWTg3aWtRTkl0MFVPdXpUa2xm?=
 =?utf-8?B?T0NmUkY0MXNjOThWaXlRYXA5SkQ5a1N2WFhMclVXcldFeGlFVVpXY0dzUy9t?=
 =?utf-8?B?Y0dKWXVUeDV0WlVJN1RxRU1ia2tPUHpSZldlZnlZMWR5YWJxYUxZZHlYdnZ2?=
 =?utf-8?B?aUdLakFBcUdaMVo4eVN4cXlqV3ZCeFRjaUtJTzNXMU93S2R0ekdTbjBZUU5K?=
 =?utf-8?B?YWI5WmFhKzdqd0ZMVEVObjhLN1k2ak1YUGpaaVczcUEydUN2ZnlCUkFIMGFD?=
 =?utf-8?B?ZUk3T3VXKzJGZlcrdi9BY0N6TEZRYnFVVzR2U2hTRm14VE1zZm8xUGFTaUM0?=
 =?utf-8?B?MnFmNTZTWGJwOFZZWVR4VUV4TGczQ09sQTd3TTN5WEtmeitmVVcvWURQOGpq?=
 =?utf-8?B?MFd6azMzdTRlbHhsejJLYmpvSitBcVRlZm8wT21sSEVOak1KaW9LTjcxTmpZ?=
 =?utf-8?B?bmpvVGRtSUJEbkZWekIyUnE0WjkxNmVWdXk5Wm9vL0pJL1ZvWEFscnB6VGtO?=
 =?utf-8?B?emtkNHNCOHlTaVFtQVc5VFhQbHZjNmx5OEI4cXFQYXZmRHY2a0lWbXhsRThD?=
 =?utf-8?B?VVd6ZHVMb2VPd3BydzRjRlVoNkFCMkhsMTJsdUp1SVlkaElNMFNqZWRTV0tJ?=
 =?utf-8?B?TXozNkczU3pDdlltYXdPd00yRXE4MUNMNWJTb1FGL1Bicko2Qi8yU29memV1?=
 =?utf-8?B?d0sxVU1oTEV6aGtoVDc1b2VKYTNOVy9OSDBTZ3o1a093dGh1ZElYSlBTZCs2?=
 =?utf-8?B?a2tXNGFBZzRhTHFxQUFJT3dZaDNJeVozTnhZcjhoR1I3MUxJMXBrcUFyOE5J?=
 =?utf-8?B?YjZDQk5GQnBHd29KQ2xLMkFTVFBiMWtVMVROdEQ3UjlrdXVHeU1hN2FhQXRF?=
 =?utf-8?B?c1BSRml1YTVwZHpxeTY0K1FpNlBaTlNZTkJmRW56TnVSdmdRRUxJNHVqMWRG?=
 =?utf-8?B?SUZQd2RVT2NZSWg3SlkwWitSNGZyMHJ3eGhkekR4dEloS1ZMUHd2U2dnSGxE?=
 =?utf-8?B?QlR1d05YVXIrS2VpTHhadlY3akRFWHc2ZTFZY1BJZG9EKzZTMkVUWmFNTXdn?=
 =?utf-8?B?OFc2UnFPQlZnOE5XeWtMUS8xWng0ZWc4SUwzWkkvc0xva3lDaE56SHJ5MnBN?=
 =?utf-8?B?MzQ2VDdFVDFyalR1bmNVeE0wTkxQM0ZqaGlVbENNVytEZzJLakF2VEpZMFlZ?=
 =?utf-8?B?U0c1c0NIOHB2UnNteG1xT1BBSVNkODkyVE9DQzdxRXpsYTh4WWZmL2dRSWZE?=
 =?utf-8?B?eEhoT2xmWW5vRm90N1hjTlByTFhKNTk0M0NEeThXZGJoaXFnWTFqV3ZNV0Vi?=
 =?utf-8?B?RG16VmFTYmdyNzEyR05jVEJRZkJPQmhDalpyZG9kRWwvTTFFdkFBbEVOWU5M?=
 =?utf-8?B?RzNTeG45TVFGODAxTUlydHN2QktQZHZ6anduWjVMSnplSFZUeGhjcVdUVmRv?=
 =?utf-8?B?TFRWNERUcWJVTGx3RHVXWklTRjl3emErUy9uQmNYR0sreEF6dkM3cDNLaDE4?=
 =?utf-8?B?Z24xQ3hnZzhiSjlnRkdZc0QveFZZUUt1NjRQV0tvNEE5WFozQVhibG1MVUt2?=
 =?utf-8?B?b0cvempaZ0RJYWhpVkd2a1BQb1RZdnpKQjhJUHBaS2dTSWE3WldoWXdqTjZH?=
 =?utf-8?B?aVBMU1NLTTFqN1d6MEdGQTN3UWM0U25DZWcwaEdOQXlyU29sZ1pmOEdFaHRx?=
 =?utf-8?B?WjlaazZlQnJVY1NJSnlheHIzcWtXdXdvK3duZmZhOUVFRFNBS01qcVVSUWkz?=
 =?utf-8?B?MkVKTXZRb0VsYXl2RFFKenlZblF0OHNLK2swVjdHS2ZBaHJWU09pZnNMVjlG?=
 =?utf-8?B?VEh3K0VyM2VHc0w4ZktXUVBVRk44TFFkdVB4b2hMUUxzcWw5RnB4aWZJOVVT?=
 =?utf-8?Q?HEvhGIe1O69LN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGMvRXhzL2RZMTlQZWNRVUpwS2V0WFVqd1Y3S2ZTSlFFZ3NYbTdhV1lnTkJz?=
 =?utf-8?B?SnlIM3hxRndCaDJZdlp1T1NtRjlWdHFLSGFiYVFZV1FNZXFpaGRWVFRIcW45?=
 =?utf-8?B?cnd3blpyWk4zajEwZGVKZVlEdGI1b0tsb1ppbnpMcHczbVQ0MVFRNk8zTjFL?=
 =?utf-8?B?MHQxSXZsZzdiSFBLc0VVUDlsSVQ0R01nNDdTV2kwZWVWWUVDK1IzVllkbkZO?=
 =?utf-8?B?QVhCVVUrTGhsMXAwV01lM2xRQ1pENkE0TEk5OXJqeHJ1NmdMR2NBZVlLM0d6?=
 =?utf-8?B?UUNBeXAyUTRhb3h3MVVJOTg5L01Ia0NHOWovV3k2ZC9hYzZDaXZVZ0pRdzRG?=
 =?utf-8?B?RlVORmtaTGdsUTRUdXg4OVNKZTE5SjVKYXhJbHhYZU9Ja2ZieUJQU29xalJU?=
 =?utf-8?B?TnhMYTZlcVRGNDlweWc4QlVsYlpwbitDazVWcUZPY1RNa1RtWFk1clNEbW5U?=
 =?utf-8?B?VW1aSzAxTUJ1NXp5ZDgzV0RQdHlXRnZPTDI0R3A2MzRBTG1sYkh5Zm54YXJi?=
 =?utf-8?B?OFh1bGFVVWxIVGxUZGZPeGlDS1pwNXVEK3BvS2FRV0I5Y3VFL3J3aXV3Z1l3?=
 =?utf-8?B?NTlUTjFaSVNabDdPeWdOUU5NbzR3blFEQjZOUHMva1poTEFtaGR1MlN5eFB4?=
 =?utf-8?B?alVWNW1vM0RKWWx6cnVOS3FhQklKUndOS0NuQ2ozd1ZkcUQxaitzbWtvYXBK?=
 =?utf-8?B?b0xvS2tzT1VBQVlGQVF5VmdFQlNhNHNTL3VuUDlNVmRmUFA1b1FzL3RMTCtl?=
 =?utf-8?B?dCtreTZ1MEptRERWSWZhTStVb0VkckVDTExFYnpyYi93dnAyUldleUFSelJH?=
 =?utf-8?B?L3JhNFBHV1R2d2RzdGRKOTcyclZycldGWGNmU3J6emRPTkwyWkR0Q2dPU0pa?=
 =?utf-8?B?VGtFM3l3b0l2UWZ1V3ZnUVpqdm9TYjJuakJzVUpmTzhicmFkQVY2L3FTMU5w?=
 =?utf-8?B?b2lsQUhGOHIwR2tQUExQVXpTOUpOK2JpQjRPc3hOeURHVEdrUytsYTMyL3lk?=
 =?utf-8?B?bmN5QnJvSFFjSm1aei9tVFJvT2FuZ0hjTExDcUF0Qm12QjNzODZreUZiMUhn?=
 =?utf-8?B?elNTVXhGSStoS1VPcjdmcUVCNDJkQVRPNTl5WUVWQ0cxRDcwWENVZG5yR3hE?=
 =?utf-8?B?U3lMVDJrYW9PY1hac0xOeTlsSHR5cENqL2hLNzRFSzRoWWY4YVMxY2N5Ykli?=
 =?utf-8?B?TjZmclhXRzNiQWRvUk4vM0FrUExQUW5TS0RZM2ZpWjNmK0RGbE9Qd2RPdTBY?=
 =?utf-8?B?R2xOVHl1U3FPOVUxOVVvRkhZQkdlUlhDNksxR3NtT1UvQXJuNVg0ZjZZN0RV?=
 =?utf-8?B?MkoyWGdPU25LUytYTnhpM1AyWU9RNm1pZmtsaWZjU2dmT0x5bi9zYWRZNnpU?=
 =?utf-8?B?K0lXemhpeU5JWEtSd0s0SUNpTkpUVTBOMERyY1JXZ3dOTUVGWEtlMWpvdGhT?=
 =?utf-8?B?TGV0TWovbnhDYXNhN2NPWnU5NVQ0TkJzRFV1cml3S2JrMExpakxPZmx6NFlD?=
 =?utf-8?B?cUVpeGhTVlF4QUxNZVlsdjdEOWF2RjJERDVZamtsejZ5aFVmVzU5Yjd2UWxY?=
 =?utf-8?B?Qk92NWtRelZJWnk1UXpxMWFtbjZkTE0wVmRRazRUeFZlbGRPVlJOcm5lZDhk?=
 =?utf-8?B?dTRRODV4bVRJdDduSFRyWjRkT0dvc1JxVUUvUjkraS9zRG1QK0xMbnBuSjhT?=
 =?utf-8?B?UXM4TFg4RHBXb0FCN2JZdGUvT2tVcHBKQm5ydTU0amNYWFE2UGpsNy91b214?=
 =?utf-8?B?YWNYeXZBZlBZZ3dsbitnQm51VldwWFVPK2pTaENpMk1DMXJVbWk2MForNFNF?=
 =?utf-8?B?NTZLM0NoUGpHdlNhT01YR1U2eHVyR2cwYmI0WWo3eDlSMGVMOTUvRDl5RDlo?=
 =?utf-8?B?QkEvemJJNGk3SFdXL3VTWXJ0bk9BRUQxNitGUXNTRS9pUUNyMzZQN2hTSUZk?=
 =?utf-8?B?cmJ3VFZBZ3lWUVZaZmlRK0xyNlRiWHAzTjNPeGcza0JEVUJhNktrbXVXelVH?=
 =?utf-8?B?Y1FIZ3VrckNTYW1JRkNZczVQeUhLakRyUW1MeFU0SllvNlVNd3BjNkRQTnYv?=
 =?utf-8?B?b1A5UnNBMlFuZjJ6R1lNdlNRKzM5Y1lvQTdUWE13bDFnOTFHcWx6akxjd05R?=
 =?utf-8?Q?w5vNhnA0phOGCxGDlBFoLffA0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57813f41-1f9d-4d56-4ce3-08dd2fe392d8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 12:54:22.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPMpDwiQjlKe259osubtgokgN2LbZ9WoeUT14jkqk35/LSq1TZmoh5malrxYdqZO4YpAN4VVHoXfx01I+QCeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738


On 08/01/2025 07:51, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

I just need clarifications on the two points and then I can send v4.

< snip>

>> +Domain Creation And Runtime
>> +===========================
>> +
>> +Kernel command line arguments
>> +-----------------------------
>> +
>> +`XenProd~kernel_cmd_line_args~1`
>> +
>> +Description:
>> +Xen shall pass kernel command line arguments to a domain via a device tree.
> Would it make sense to say where the "command line" to pass is specified ?

Yes, although I don't feel very strongly about it. Let me know if this 
sounds ok :-

Xen shall pass kernel command line arguments to a domain via a device tree
using the property "/chosen/xen,xen-bootargs".

< snip>

>> +
>> +vCPUs
>> +-----
>> +
>> +`XenProd~vcpus~1`
>> +
>> +Description:
>> +A domain shall have a configurable number of virtual CPUs (1 to XX).
> XX should be replaced with "the maximum number specified at compilation
>   in the configuration through CONFIG_MAX_CPUS" or something like that.

Actually we are talking about virtual CPUS whereas CONFIG_MAX_CPUS refer 
to physical cpus.

So, it should be GUEST_MAX_VCPUS (which is hardcoded to 128 in 
xen/include/public/arch-arm.h).

Thus, s/XX/128

I agree with your other comments.

- Ayan



