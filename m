Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F4AE8AF8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 19:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025376.1400999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTVa-0004ob-9P; Wed, 25 Jun 2025 17:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025376.1400999; Wed, 25 Jun 2025 17:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTVa-0004lx-4v; Wed, 25 Jun 2025 17:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1025376;
 Wed, 25 Jun 2025 17:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUTVY-0004lr-NO
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 17:02:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2417::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19f1898c-51e6-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 19:01:58 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 17:01:53 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 17:01:53 +0000
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
X-Inumbo-ID: 19f1898c-51e6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4IZV4Pwye0gXgKk/cWu1NFcRnWOiD5Gj1tTpDrk6CjGzpnMhdmwSypAYhxffu3b1/iZ7rzdwJ6QtOoRGwZwF8R8StvrpoSArW6f4C2JgJSnvCI5MTCrWnTElhsg7COce5/OOuJfW++G8V30PtNsyPYKRdcWOfzcLNxiY1LHywhIct3rDc5USCqUSYJe6b00wbX6b392AcMT16KnsAHXN8evzyQU9vQTbl0+c+Xc+vjCdPJaiXMQSZB32zpqLpjPDZ5kGGqXlQJ0PoPZOiysVJShCrrR8sjfsB5cCIQi9+gr/5IMZr7Xahk+njmGqrfHV/SnMZIiBccytrKOAaaqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe1jM1HvCbwC3yXV3AUQFdoOhEPHhPFFFzyAW0fJZLc=;
 b=FlXenz5Nyy2CuHqgrtP+hvcSxFw7O1fnVO6X4IJziz6n8fVH5DodMK6qmmfsUg1ASRgRjuRZzKx3H2wRTgBjnoJog2cK9VCzf4flCpHK0pKRf2lqDFYmX7Qaq3dyrd4goHZ05rseoSsiSIH4PlX33S0H97DzWTTZD2YAZxot5RCopyQ6mS9SNoeh3wLJkolWiUluM2LE9jSUhMBuJPtJEDxCcq6+JC3N3o+fajIjC1FeSBOEmBtmJcS2XH04h9uebCNQNxxVtGnHuyqBWBF2NP2uTGkuOd6vwDeS3BL/laUK1dDNjRJhJkEJvU6lM5veAtLIqnBC3TOmRzoCiNwEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe1jM1HvCbwC3yXV3AUQFdoOhEPHhPFFFzyAW0fJZLc=;
 b=kAj5sbz6alANGwUF/a8+fOw4GbPWlnl1Lv3XKnwCGhGoHiNaRGzsh3BUkgpHDFGMDvtKH2z6z1MMx9TIXdNgPrAlzf35633WcM+/wH5G1e5/DLFuZlmxNHzgisQABogNm3QK1sr9TFpA8Lv01/vUJaYphdH7mla+c+tCBKYls5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6741c14-a774-4b89-a793-8d65e7748af3@amd.com>
Date: Wed, 25 Jun 2025 18:01:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm/mpu: Find MPU region by range
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::31) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: c08be669-2ff4-4096-1f51-08ddb409fbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tmo4aFRSSlZNR21Pd1ZsTUxDTW91MkpOdnNtRTQ2UUV1ZXlzdkhrUHNHUUNz?=
 =?utf-8?B?VGhYTXNadEwxTmZOMGk4aDhveG1BSmdlOHdVb3ErTjVjNnFmc3MxZnRFazJF?=
 =?utf-8?B?ZFlQc3c1WE1WSUVOZmJLcFg0NkJxNm1QWGdTY1phNjlqVkNnWkZ0dWorWHZl?=
 =?utf-8?B?d3luOGdKVkxMVVMrV2FlMzhVMkt3Qjd3V3Rob1pobmhocnBNdVRnU2ZiUEtT?=
 =?utf-8?B?NVJhZW4xSjRMYklmT2t2L0dMQXlGeVNiU29FNUdjczhYRTdqK0NXcVFNbXhj?=
 =?utf-8?B?ekxLRXpteExqM0JwSE83ZGQ4dEthV3F3UW9KczdQdTg4cGdrYkRZMVJMakFr?=
 =?utf-8?B?YitYb05saTN4WUhBbklQaDl3b0djSWs5aUpzMlZNMGJtWDZlWGduM0JWd3My?=
 =?utf-8?B?bExEWEgwN1duY3RncHA5aDN0cHkwZEd1dGNaWGF5YUFJenJUWWFmcExXWTBC?=
 =?utf-8?B?bGRBaDdtTkExZ3ZDdEcwcEc2UGMrU3lMSTMvWTRZRHJ1M2tVeFExbmg0dndI?=
 =?utf-8?B?dFBYeU15Q2pwQ1cyUTQxNDdVVDM4aU9KMG54K1haV0F5anAwY3Zoa0xCSDNM?=
 =?utf-8?B?YlduZFlwNmpKVm5QR21uOHdsMlJ0eENwMENDT2pQY2UwYU1PT2NrTjVPZ1dp?=
 =?utf-8?B?dkE5cVByQllzajJNdisxYVprdEZEd3pqZE1GRWx2VGNPL3hhcTBYWW9mV2dH?=
 =?utf-8?B?NXdIaXhERGJqVFRqNjliRXVSZks3STc3QVFPbWxYUkRUV2c4YWZEK0lNRWVJ?=
 =?utf-8?B?MzNVSUwwczlhd0hRY1lDbWxPcVJCQ3hyaUdwM05qNFV5Q0tReVZhbHN2TjhO?=
 =?utf-8?B?Y2dJVUlDcXZ6NTJyaGh2STlpT25ReGJZMWdlclo4U2p2VWtXUGY2QzJEcGhI?=
 =?utf-8?B?Z3FlMHNRTHJEa1Ftc0I1L0E2WXFOSzUzK1BkVjI1TFBKdU9kdXZBNzJrUWVW?=
 =?utf-8?B?RjB3dmdqbFY4K2M5MEdHZGIwcjJZUkVnNnByWGpGeHN6ZTQ4VVU4WE9GYStv?=
 =?utf-8?B?dWtnR3JsbWFHNzRmZWk2cmJmUHRFS2hRMFFsTG91c3pZN3NEK21YZG9tSnFr?=
 =?utf-8?B?bi96dUxHWWk3MmJLOHVXQ2RDM3I3eGwxV1dRMzdUdnFkbXhnczdpMXNWSDZa?=
 =?utf-8?B?RExCR04yekxMZUtoN3g0S3Vlb1lHdmp2aU44L0NPZklTaFMyZTNibnNRZjll?=
 =?utf-8?B?R0Z0TWNsYXlFTXRYYUM5NVpyRFhmeCtXcmc3TGFxNU5OVnR6eFpzVENaSW80?=
 =?utf-8?B?ODYyUFhrSkZZNUhXblBzTk5OL25zelRMc3VlOVJ5VUYzdkQ4b2UyZkJ5Rmtp?=
 =?utf-8?B?c0xuWmROL0ZFc1o2RlpTZmU3NW9Tazc0aHVCV0o2Q0pIOVF0U2NYNFpnZ05U?=
 =?utf-8?B?ZzlDTGoxMjdGMHRCY2Z3UlU5cFFwdVhCZHM1T0h4R0JidlV0ZnFrT0c2aWFT?=
 =?utf-8?B?N0R2dXZ3eUw5cERicnZKUHEvbFNKNjBrbmdOdEtDRTBBbHR2cVJ4ZmNhNXVS?=
 =?utf-8?B?ODBycUFyUk5lUHgvSDBIUnVXc1hjK2FWWGc1MTRKelVsTFp6ZkpCUW5wYXlu?=
 =?utf-8?B?cUVZYVpMUWs4Zzdxa1dhSnM4RVdyUmdVUk9SQnBtb01TSGlKRnZrVmJISHE5?=
 =?utf-8?B?azlSV2o2TjBIL204VWpZM3ZXOUlRcm1KN1VqZ3JXSmR1eXNHbFpEemlhSlNT?=
 =?utf-8?B?Tno3UnpzcGk3MEd6Q2tvK09sOE5kZE01YmxLei9BN1N5cEw1M0hzVmFIL3Bz?=
 =?utf-8?B?NThsakJJaW1MQ3cxWmtFenBUQzFGRC9YVHUyNVJOcTZuZXEwV01kNzF6MTZT?=
 =?utf-8?B?Kzc3d3hjWXhOdFVadi9Gb252NGJnZEhxYVNkSWFNdVZIR09uRXJUQ3VLTG5r?=
 =?utf-8?B?bkZkekoxUFJaWkFDbDR0YU0rRkRvaHQ3RlRoNURjSWd4V2xXeWZuRGZFcVBq?=
 =?utf-8?Q?g6HxBWZNXk8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhXV2llMHhVS0hsMjlIcDFxQzArWWhYOTlENUx0TDJNb3JlZGZUdWU1SDJX?=
 =?utf-8?B?cnBPR0I3dWV4L1kzaE5LWFJpUWtVdkY0SXNzbXZzZ0RCZGszNmtRcHpSa0da?=
 =?utf-8?B?VFduZk0xaWZ6UlV6Q0E5bVNsR0RDcmY4OEw4OHZCV2ttVWJxaE1NdEdZbTNF?=
 =?utf-8?B?YjQ5akdrbmhWejZNYVJybm1XM0tIa2l6MlZSMGw3eDUwSm91d2VPSStZYzNk?=
 =?utf-8?B?ZzZwYWpXK2IrbjNlTkFNLzFRTFR5RG1jdkE5eDluWTBKS2p6eUs0M09TbkJ2?=
 =?utf-8?B?TkFjelhmV3JUeGE2STRRMGdLSlVyZW4xWVI5WkNzWTAwZWcwR2MwVVZTaldO?=
 =?utf-8?B?aVZBK3NyamxCOFVmRW85TmhyNjJrVFlOTWdHaTNabEV1RVYzVHdKWnNJVXdD?=
 =?utf-8?B?c2JGWHFCUUxqNkVzSVg2b2lvb1NwOHBJQjV6Umt5TWs2SkxIbmFHSnZYQU9P?=
 =?utf-8?B?RjUzVGxoZy9lTCtJekNsMEVVTUxXN3p6c2hHSjhsODRiOE5oMzdXM0tGSFYw?=
 =?utf-8?B?OWZjd01QdnJ4MmpXc3NTdFVhVHpsaFVYUWxXZDN5a002WVJVN3lIYkREN00v?=
 =?utf-8?B?b3M4RkZvaEZsRWJHUjhjdm1ScnFzejhOb2tLVDVudS9idFFEME1FaHd6cEJC?=
 =?utf-8?B?WGJ2Qnk2ZDZWWXk2K3R3MHNmbTBQcmZubjJsQm9kSDMyb0U3S292L290KzFV?=
 =?utf-8?B?WHhZcW81WFlsZ1k5K0J3NFNqUVN2RzlhNkpaSVVMWDJ3R09hTjBOaEdNcmVR?=
 =?utf-8?B?YTFFR0ozdWM0YytpcnV4elNVYW1aY01hanRRQTNQVDJwdjEweUVLd1dyTldL?=
 =?utf-8?B?V2Jac21xbmc3T3JaWUhReThGOWJVdExVbm5rK2hTMWQwVUh4TzQ2MDBvVng5?=
 =?utf-8?B?TDVGN0haS3JOQzRtajY5VTAraWVwUk1weFM1ZHprK1VnTEdDMFVFS1cvV2xq?=
 =?utf-8?B?Ny93dGVmUVRrYlQrcGlkZXdwdjNTdjFYaC9aMUVIZHpvWUwwWjdlS1YyZ1o3?=
 =?utf-8?B?QkQzak53dUk3RzAvQjV3VFRhSmRiZ2FiU01ycFBTRTlHdERITlh3aEFsb1pz?=
 =?utf-8?B?YWkzRVdBWkFnbk9WdDBmU1pHbjQ2MXNXSTVudWMyb0tKQmJLUFVRNklXcnZm?=
 =?utf-8?B?TzJyUlBsY0JPNjI0MkpRR2pkZ3ZYMW9qY2orMHdvMVhKWE05R0VjcVhHSi9X?=
 =?utf-8?B?YlhGeXA3ekpiNGNOR3hkS1lEa2k1bmRyN2cvdTZNU1BxdDVSeUVuR1NBWnBp?=
 =?utf-8?B?WG5BN2t0cUVVQzh0RTlvcDkwL3IyNWxsVVd6SmhSVUJjd1FScnllNG9ZRXBh?=
 =?utf-8?B?RUZFTVVhOXM1UnBJOXRXZ0Rwck1yTlZrY1NUVUs4M0x1bi9RWVYyeTcrbXNw?=
 =?utf-8?B?bkNrWGlDSjJWZjVDZHBTSVZOQTZ2TmI5bGhKOG9BcXBCUnE1U0RFZGgwL3ZX?=
 =?utf-8?B?TUtmNHBrRGVhc09aQ3ZvY1RiOFJSWWVqQjRsdFd1WFh6ZEJVS1htbURsODdo?=
 =?utf-8?B?T0htUUxXQiszNkpPd1A1cXVoQlNwS3hQamlJVXRPR2czay93TmVqWHZsWnl5?=
 =?utf-8?B?YlM0OGxSVEdSejBsRDU1NFZnanBDTUowR2YwSzBqd3ZUb1FzOU4yRGt0SEph?=
 =?utf-8?B?TE1VcDBTdnBjZWRZN29EMzdXNEVFQjYraC9zazRnY1R1VGUzeFMzRUlsdEg3?=
 =?utf-8?B?YTk2cHE5U0dseldpTDR0elJyOHIrSG5FaDNOcWQzUm5vZldvQUlIN2piVXBn?=
 =?utf-8?B?Qm1BZDAvK1ZBUk9IK1NyNndnRE4zbmpoaTE1bGtEeU45NDhHRWE4aXU5LzZO?=
 =?utf-8?B?aUJGOU1UNWVMb3JqYzcva0RwWmYwcWQveWxwWVNZblRxakU0WUtGK2FtMXcw?=
 =?utf-8?B?dGEra29SUkVLTytZZTRpVkRsVWNLNVFadW43YWtITVZWWERNUHF6bk0wZyto?=
 =?utf-8?B?SHJIb2dxUjN3eWFxYXMyNHFiNVlnc1dsMzlDQUNFaE4wdEMyb2loYm1UUW9N?=
 =?utf-8?B?bzJBWXNldVNHL0htZWE2L1JUYnBsMlJkU241STRsTHhhc3BxQncxZ2hUN28y?=
 =?utf-8?B?eTk2Zm0yeTMwaS9wY1hsVnRBazRvdG0wZ01jNEpFcmJob2M4UjNablFnbEJi?=
 =?utf-8?Q?RC1z1ywjaWvNvA4C87K+Zx19k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08be669-2ff4-4096-1f51-08ddb409fbfc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:01:53.4630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PztjZeDwZRu+x3T8DZsp6D3+HWFwJsJqucTIgFBZfDy9tfeY2sc8Iig7F3f7LbcKQc08nXnuzxJtUWsX/pxLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241

Hi,

On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Implement a function to find the index of a MPU region
> in the xen_mpumap MPU region array.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/include/asm/mpu/mm.h | 29 ++++++++++++++
>   xen/arch/arm/mpu/mm.c             | 66 +++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a7f970b465..a0f0d86d4a 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -10,6 +10,13 @@
>   #include <asm/mm.h>
>   #include <asm/mpu.h>
>
> +#define MPUMAP_REGION_OVERLAP      -1
> +#define MPUMAP_REGION_NOTFOUND      0
> +#define MPUMAP_REGION_FOUND         1
> +#define MPUMAP_REGION_INCLUSIVE     2
> +
> +#define INVALID_REGION_IDX     0xFFU
> +
>   extern struct page_info *frame_table;
>
>   extern uint8_t max_mpu_regions;
> @@ -75,6 +82,28 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>    */
>   pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>
> +/*
> + * Checks whether a given memory range is present in the provided table of
> + * MPU protection regions.
> + *
> + * @param table         Array of pr_t protection regions.
> + * @param r_regions     Number of elements in `table`.
> + * @param base          Start of the memory region to be checked (inclusive).
> + * @param limit         End of the memory region to be checked (exclusive).
> + * @param index         Set to the index of the region if an exact or inclusive
> + *                      match is found, and INVALID_REGION otherwise.
> + * @return: Return code indicating the result of the search:
> + *          MPUMAP_REGION_NOTFOUND: no part of the range is present in #table
> + *          MPUMAP_REGION_FOUND: found an exact match in #table
> + *          MPUMAP_REGION_INCLUSIVE: found an inclusive match in #table
> + *          MPUMAP_REGION_OVERLAP: found an overlap with a mapping in #table
> + *
> + * Note: make sure that the range [#base, #limit) refers to the half-open
> + * interval inclusive of #base and exclusive of #limit.
> + */
> +int mpumap_contain_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                          paddr_t limit, uint8_t *index);
> +
>   #endif /* __ARM_MPU_MM_H__ */
>
>   /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index ccfb37a67b..15197339b1 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -12,6 +12,18 @@
>   #include <asm/page.h>
>   #include <asm/sysregs.h>
>
> +#ifdef NDEBUG
> +static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
> +region_printk(const char *fmt, ...) {}
> +#else /* !NDEBUG */
> +#define region_printk(fmt, args...)         \
> +    do                                      \
> +    {                                       \
> +        dprintk(XENLOG_ERR, fmt, ## args);  \
> +        WARN();                             \
> +    } while (0)
> +#endif /* NDEBUG */
> +
>   struct page_info *frame_table;
>
>   /* Maximum number of supported MPU memory regions by the EL2 MPU. */
> @@ -110,6 +122,60 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>       return region;
>   }
>
> +int mpumap_contain_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                          paddr_t limit, uint8_t *index)
> +{
> +    uint8_t i = 0, _index;
> +
> +    /* Allow index to be NULL */
> +    index = index ? index : &_index;
> +
> +    /* Inside mpumap_contain_region check for inclusive range */
> +    limit = limit - 1;
> +
> +    *index = INVALID_REGION_IDX;
> +
> +    if ( limit < base )
> +    {
> +        region_printk("Base address 0x%"PRIpaddr" must be smaller than limit address 0x%"PRIpaddr"\n",
> +                      base, limit);
> +        return -EINVAL;
> +    }
> +
> +    for ( ; i < nr_regions; i++ )
> +    {
> +        paddr_t iter_base = pr_get_base(&table[i]);
> +        paddr_t iter_limit = pr_get_limit(&table[i]);
> +
> +        /* Found an exact valid match */
> +        if ( (iter_base == base) && (iter_limit == limit) &&
> +             region_is_valid(&table[i]) )
> +        {
> +            *index = i;
> +            return MPUMAP_REGION_FOUND;
> +        }
> +
> +        /* No overlapping */
> +        if ( (iter_limit < base) || (iter_base > limit) )
> +            continue;
> +
> +        /* Inclusive and valid */
> +        if ( (base >= iter_base) && (limit <= iter_limit) &&
> +             region_is_valid(&table[i]) )
> +        {
> +            *index = i;
> +            return MPUMAP_REGION_INCLUSIVE;
> +        }
> +
> +        /* Overlap */
> +        region_printk("Range 0x%"PRIpaddr" - 0x%"PRIpaddr" overlaps with the existing region 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
> +                      base, limit + 1, iter_base, iter_limit + 1);
> +        return MPUMAP_REGION_OVERLAP;
> +    }
> +
> +    return MPUMAP_REGION_NOTFOUND;
> +}
> +
>   void __init setup_mm(void)
>   {
>       BUG_ON("unimplemented");

LGTM.

- Ayan

> --
> 2.34.1
>
>

