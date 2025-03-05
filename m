Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7EA4F7E9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 08:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901750.1309680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjDy-0000Gg-CF; Wed, 05 Mar 2025 07:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901750.1309680; Wed, 05 Mar 2025 07:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjDy-0000E5-8i; Wed, 05 Mar 2025 07:31:26 +0000
Received: by outflank-mailman (input) for mailman id 901750;
 Wed, 05 Mar 2025 07:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkOH=VY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tpjDw-0000Dz-Rb
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 07:31:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5d16912-f993-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 08:31:22 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 07:31:19 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 07:31:19 +0000
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
X-Inumbo-ID: d5d16912-f993-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU/uUA5zsPASDDbjVO7diMnwFreKA9u9pzLqdZeO0lWolr05lg+d1+gsBRDCAwjPE7TiSFDWqZyqN+/QJzJ/x89opsux8RXU+mTmU+b4VWVD/rGrJKlGyg0axsaid0VHrXFVUVCp0qLiAqMjFQT8PlyMw9QoSuDUCWOdUE1rchNG31xJgg01ijeZKj83JKEliZ0pI4HtNwJ1fit4yvT9KOdVywpjcX3rqNii9QdbeZnQifT4ZsaOFhWmcLgqaPxPOjQo1LQ4oSPcVwY9au955ojG9mvtVg72VaOpM8C85JQ+OjheRHbrAkA0KigFZy+Z7WpXHb44vShQty6zcz4rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iuljgqTT+eIsbFKXPrI5ODW4reGJPOuNqTY0fpGV+k=;
 b=iuZw/ja/MxO6xJtZBxn0XQfuikCPO3dLoV5E16ZUB5VWdWEPI3KJBw3ake7ehMt7X5CL/5IgOfEiuWyj+o76TU678oGEUGcBPbAQDfXliSL76lfmLNNPLQ6MQxSBIoNmUPlDt7oajnKQFUREcuUTXu73M4kZ9Psm3b/CY7KXtEMSpVFFnNQcre5XdylYeWC7wfF0kIyHVhibsMAz4agJyNHcz5gWfTq23Oqfu2iyVjqMkkgiGUSAyklEFDboc0+/UMyZz0lnUEPvVZFiEcw435CU7vW/LuebB88Io84b/ZdRsmAcf6pD+5LPbAtnzuJxh0vdabtdfYY2zS/U6Ee4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iuljgqTT+eIsbFKXPrI5ODW4reGJPOuNqTY0fpGV+k=;
 b=kuQBRdM5mMuTGjLa+8OKyBYtDi3XxBlBxwY4UbLbbb+N6WZ8gJjbwxIFgUKFK6WKcraeshpUIqukcmGRz7YV449lonY90fqPFvCAgWUALsWJfmrS+KPnKHWv97HuZmlV4olHlfuoJKyL7YVJcB/xdxGSmyqf7reDxz/PNaAud40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2de3bfd2-c451-42d3-a489-b12b35c4a28e@amd.com>
Date: Wed, 5 Mar 2025 08:31:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm: mpu: Ensure that the page size is 4KB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
 <20250304175708.2434519-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250304175708.2434519-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e1463f-0512-4148-ebfa-08dd5bb7b8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGljbEp6N1JROVpFdUZhU1d2N25TYlRQRS8vbkNBa2lSRS9nMlN6eEJhZkky?=
 =?utf-8?B?dWQyYjdvYzFYSGhBb05VL0ppZjNrbUlqTTlLaUozRUZrWHR6M01qdXhpUjlC?=
 =?utf-8?B?TTdjNDNQd0praS8wUTU5dS9pN3pBVFVpdWxtV2psaWZzZnJ1VzB6QXRmd3Rt?=
 =?utf-8?B?eDJtSVZZVFhRZVFvVFlWc1VWSElvUUNqZUo0dVdBN2owU3diWDg2a1dKemRF?=
 =?utf-8?B?OEZoeTFqa0hvNkwxSHJYQ3VSbmJ5aEt0bXF5dXA3REdLREhGZ0oyRGxJNXhz?=
 =?utf-8?B?WndvMS8wMmhWVXVHblpSaFBKTGgycGFab2k0dTAwdlJQMkZyYWVVM1YzSmZa?=
 =?utf-8?B?dFlma0tYMld5QXdxczFibEsrUmpSVDFlZStsTDFmZVoraW1iRHFxbWlBSERS?=
 =?utf-8?B?bmlLSHVrbnhrc1R1d2VQeW03NllhZ0dRYzNoQnhzYTFkQUFLZFZVLzdTRzU1?=
 =?utf-8?B?ejVXRkNDTDQyWmh1SUpOVkhiQ0NDRWpSSUdFN3IvV3J2NUhJbzlLbm4xWTVU?=
 =?utf-8?B?d1krc1phYno4NGp0YmdwbTRMOHRJUWM0UERRYU9JRzdMMzlLUEdlVjBvQzMr?=
 =?utf-8?B?Q29QQ1prUVVIM2dzZUluakhHWEZvQzVPcTR1Mko0YmYydTZtZUI3cXhpVkU5?=
 =?utf-8?B?bzBQU0FTTjl3c01rZ2ZlN2VoMFVWSmNoaDg2S0Rodk5aWndQbW1uTEcwc0da?=
 =?utf-8?B?am1Tb2JCNTh5NmlEajRERDlLZTBDTDZ1a3NnQ2hqZTJidWVRdzgxcjBpOHZn?=
 =?utf-8?B?OElyWFFYdDd3Qk9HcDQ1aWpmQXBtT0dzckZVbkVOb0dBd3dHZ0ZmeUJEd096?=
 =?utf-8?B?L2ZFWlYrTjJlUGkra1dlY3VhR2piZW5UTVhWQkJuQjlEYThmbVZtNlNqREVN?=
 =?utf-8?B?cWt1UjBseW1xWDd0eUZKVjNBV1YwSDkxR1hQYVFZRDdoczJQajhlRGQrQlAz?=
 =?utf-8?B?NG1pVEFJMndMNmZ5emNNc2FqUzh0RGY0Y3h5bjBVRkRQcTYvTGFkM0czQ2Rr?=
 =?utf-8?B?RUd4WTQ0dkY3ZWE1Q1Fia0VSMGlyZXNJSWlXazlOU2xTd2FiM2VaUlZTd0g0?=
 =?utf-8?B?ZEZKWmVyWVFUMFgzSUtlRURTeDhqSkdBeVFSSzBpN1R5aGpxZkhlRUVkUDB3?=
 =?utf-8?B?a2Q0d1RtSGJTV0lPWHl2U0hKb2tTQ0h0MCs2ejFLa0pHNlBsNUpxbHVUbXF6?=
 =?utf-8?B?SkpENXFBU2hrMlVaQzZlYUpTaXBSblRuNktCSFpnNTVpdXRPR0lLdjNsSVBS?=
 =?utf-8?B?QlFpckkrbmJtc1pmZ28yV0g4OUZyVThkWm9tdGxrNHVMRDRtL3dEN0pYQUoy?=
 =?utf-8?B?dm1Kak1mVU9BSkMwTUhKNnQ0WWhrUmRLVDVRS1lIMEo4Z0RaWGJkOXBMRlhK?=
 =?utf-8?B?c282eDZuLy9RaDdnNGlPU2pFcjVaUndUbC9MUUNWdXFzeEVybkhIUEdqbFpo?=
 =?utf-8?B?bGtldFZSWWNWVDZHT25sSUpHbHkvZVRZdFozMVdCeHRsRWJRNE9sOThNTHNu?=
 =?utf-8?B?b0RJT2xaR3AyZ0EweE5RNkxhQ0RJNnNqMVhWMEU0V3plOGJHa2tqL0xkd2NT?=
 =?utf-8?B?Y0pxK2RuRG9sTExiVGlrZlJSSit1NndFSFpyUm9Rb2RJNjZTcjd2aG5VQXRz?=
 =?utf-8?B?ZU1XdlEzc01UNHE5MExpNlY1bzhWdVU4ejVmcCtDSng0cWZBMDlDUW1EN29W?=
 =?utf-8?B?ZGVQVTM1bzF2OUpVT01MYk5vbWg5aTg1UzBXMm40Rzc5SHZ0K04zN29LcGI3?=
 =?utf-8?B?bDRZVmcvTG9qOEhIM3VNT04vamNXSkdGUDEwdjI3TDNEU0JMN3hiY2twR0Nw?=
 =?utf-8?B?WHVVcHlmZElVb0FKVGRKK2ZQY05pMEpXRVpZaTJjTHp0TTZzR1MwMk5hMXQx?=
 =?utf-8?Q?L5DcDb9Wgz+lA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGtPM21FVzNWWXNjYXZNd0pFOUN0aHhoNmNuclpIWEV0cHA3Z1Y1enp4WWh0?=
 =?utf-8?B?UHBUZS9sSjlrNnlIckVlaDhBRG11ZU92UklNdWk2b0JXWTNZN0ErMURsWFFZ?=
 =?utf-8?B?eW1saXpySXBzdjg5R2ZhTlI5cHlsa2s0OTluSmRlNmRoYzZSMU9ZWXJSbXVi?=
 =?utf-8?B?UVFNMGhBdWFwaG1RejFuc2NoNmFyZVRIcTdTNEcyVFhmSFFMeEpDYjEyWW00?=
 =?utf-8?B?VUYyOGIwaENWc2E4YktoTjY5bFZwMzBFbzdxM0p5S0F2c1dOVVlsYU5CSU14?=
 =?utf-8?B?eUR2RlY2UHV5dWdiL0d4VFRGbFBRbFA1VTRnU0Fid3lXWXNIRUhnNHhvV0dJ?=
 =?utf-8?B?SEs0amVicWRmQ29NTFBlc3dlcDdJVjhtT0N2UCs2VFhXVHNQSG1GWjlxcm1w?=
 =?utf-8?B?MXJYT3F1ZXJrNTVMa3VDOHBjZHZya29UaGVYbk4zemRYaW9yK1RFbk5SeGJv?=
 =?utf-8?B?d3Blc1JlK3NEeUVMbXhSdUJZa2J5WnFGK3BBYmlDM0VzS3FMa1NBUFJJdVp1?=
 =?utf-8?B?NGg4K3poOXlHeUFNc0NqTGo4RUxxSDV6a1FJLzA0K1NNN3VXaEhvekJ5K1V2?=
 =?utf-8?B?K3JtSWczeENvUVRaTThUU3FkRlgxSmdoM3hnNEFLb3FNV3MrQnptUURXa2lF?=
 =?utf-8?B?N3FZWnB6N1hOd0x2NW1UdHVyL3hiK1NoVzBGSnBFSSs3RHVWWjZsZVlZOXdI?=
 =?utf-8?B?d21DRkRJU1A3cjFySjJGRzZwcWM0STlaRjgrdGFjenVyOUZvaHBScE1menJN?=
 =?utf-8?B?dTdGN1F3NE80UUxPaThRdFJhT0FMWndMNVZDNExkQVhxVXRSdFlPZkdKWGk2?=
 =?utf-8?B?QWRMWE4wcXdNSmhhbHNHdUpycGpnQ3NIOG9VK05ZSUZuWHQ0NHhWckp0MSto?=
 =?utf-8?B?Wk5qOG5ISURWV1BtSFJPbkNvcENDQldnUVUrekQ5ZERMekduQWRQL1FwdVNo?=
 =?utf-8?B?a21mdmM4NEkwbE9nUVVEaXJyNWs0ZE51enNFbWRGa1JGUkY1d2h3UFR6RjNL?=
 =?utf-8?B?M3lKRUlBQ1QzLzNFdmMzSmJhanNUREVyZ21DTmljZHRjSzh2Nlh2RndBODVz?=
 =?utf-8?B?WnB5YmJtYVdNM0ZaNm16YkhxRWUrYzZjZ0xNVkJMN2NwTklMdEpjZXZSTWRm?=
 =?utf-8?B?Qy81NFdtRmd3SmNVYlVhQ1VOZ091ZDFIWHZ3ZXptR1hpU0F5UzY1VlF6bDRu?=
 =?utf-8?B?SDllTUo0eTRxdFUrbXF2dGdZVlFJSG1FSlFNYnduVGJ4S3dyZmZWWVZEQzFP?=
 =?utf-8?B?MnVHb0J6ODkzQVVKZFlScXQ0YlNXeXA5Z2tMRE56YWVYeHhRVU5UVlAxVy9i?=
 =?utf-8?B?ZHhSM2pHU0JjcEFqSDQzT2Fmd2pOZ1A2anllT0F6RVFBazMrL0RYN3V2WmxM?=
 =?utf-8?B?WGlvV3h3bk1ZM2M4Q2tNdVMrSS85TmxhbC9mL2lUQ1gwQzZHVFI1VXlJWXBY?=
 =?utf-8?B?T1VITTJ4ak15TWtaZGl1cW5iUnFDdEJqdkc5SUFsMnJoT0ZOOENSdFJEbWl0?=
 =?utf-8?B?RGdwMjJLTmc5UWRCR1lyQnJSQkJaMTNzaUZtRmVKQk13eUY2Z3ZRTlhSSUJ5?=
 =?utf-8?B?UUNQZzREL3JQbzFKNmFNckFIMnF5aFVrTlVNSVd0a3RoRlV2bm5XL2R0eFox?=
 =?utf-8?B?aFgrSksxR3N4MW1sZlM0NjhHNTJWZ1M2d3d4VTFRQ0lrRzBtcXR6Wi85aExG?=
 =?utf-8?B?d0FRUTdJeXFlUTNhQjkvcStObEpMQ3J6V3R6OGdKclBOSGFRWjlqMkd0Ui81?=
 =?utf-8?B?c0xpMHM4TEdTWndpT1F2TlhoWHIrOXQ3ZjFUY0RQUUJGbDZWbUFiLzhIdFBZ?=
 =?utf-8?B?VEhSM0xKRmhwRlJPREpZR0NzbFFMSXdRUENmM3pTMFFuN3oxV0NucDNUM08v?=
 =?utf-8?B?c21VTU0yUW4yNmlVeU5YTjY0c29jYngxUW5hK1BOdFR0emVaNFpWRUtSY3dJ?=
 =?utf-8?B?TXB1eFkvUDgybEdtWGdXQlVxSTlmYXdPc29VZE5JRXkzOXAvaWJHSUxrQ2w2?=
 =?utf-8?B?RldTWXNaaVBFdkx0N0pzblIxcXBHMkNXSG1OaitFdThnSkpXWUtVZ2NzVnNk?=
 =?utf-8?B?TE5aMWVkb2tCWWhONnN6bWl5OUVaSmFhVmtha3dFb0RUWWx5NW5PNS9JVDhD?=
 =?utf-8?Q?rlTCEbyZ9RCIKjMirky6U704V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e1463f-0512-4148-ebfa-08dd5bb7b8b9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 07:31:19.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWLuCEppKfAp3b1QmV2z4MSkfQ1aOGHph1K+XJcSmJ9hpv6Wgb/IGqPdMqbAWn4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885



On 04/03/2025 18:57, Ayan Kumar Halder wrote:
> Similar to commit (d736b6eb451b, "xen/arm: mpu: Define Xen start address for
> MPU systems"), one needs to add a build assertion to ensure that the page size
> is 4KB on arm32 based systems as well.
> The existing build assertion is moved under "xen/arch/arm/mpu" as it applies
> for both arm64 and arm32 based systems.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


