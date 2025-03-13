Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB018A5EE57
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911527.1317935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseEg-0005Dr-Qe; Thu, 13 Mar 2025 08:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911527.1317935; Thu, 13 Mar 2025 08:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseEg-0005Br-Mk; Thu, 13 Mar 2025 08:48:14 +0000
Received: by outflank-mailman (input) for mailman id 911527;
 Thu, 13 Mar 2025 08:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tseEf-0005Bh-Eb
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:48:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3eeab51-ffe7-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:48:10 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 08:48:08 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 08:48:07 +0000
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
X-Inumbo-ID: e3eeab51-ffe7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpgsSwri922qfU+yNVLjerQ/IRJ22nXWUPfZDURyjWjKcBu/PyBDgEdB2zFRoXGcR38hXbBG6a4/uuIgpfu7W6QcVm/5wLbqvnGtCpPdqN7JC8oIkB8W+y9XBErDKHCL+i+3U8PJjlrz33KjY337imd79+O8TqT0KDrGf/QArjGLG9ltMu7TO94WESt5kdU9ynFiRy3G0jErdy++48e1DT2UlO0kbPUL0cuhwDbJM9ZB0s2XV6kcSYidImezIVmzkG3Ivl+HFH5Muxpx3nz8PdZzTdyRAAJi5WgY4Ic9Fy5h6/Cq5FPCemcydE7yuIVpgl58txiwxeq1MaaY/RKRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns+KxdfaTWIWJlG1E3WQdcmGoD3A58CRn5Q7UgHB6X8=;
 b=P+4v/5Q1r9JdlbbK/G0Y32oYHkSKe+5fMERljPUyR0vEbE9/nTC2GPse4psCm03eiK817rkDHe5P/zRM+ohuuIcPaWVVVuFV5xr7PLiJUzGDXXquCeTXW7dqRWeHrFhLvX6/O6utwYYaWiE6jrSJp9QEKjdD5mMT0BVEp8uHI+OwRM4Q1FnO5eOdrL8ZpPlh3NGDVHw9jwtAzYZh56z8buka6QzokVGgXpLtQsHiTqTMpIPHkBGaMsWcL9SqMctD3bA5F7yjrfE07EhAftwO8wlDJxPkNklF1eG+Kjqec2rxcdMGPGxR2pvnShA3oVG6tYJi1jIGUAtQAZaVlxofDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns+KxdfaTWIWJlG1E3WQdcmGoD3A58CRn5Q7UgHB6X8=;
 b=WYBS9I0k6wg7MvtRof4FDOtdlkTJ8QCITGFj+1i0ihcyqdqwf4VPt8IUIK+fZgGWYGIieSWWdciSbNCSdmApy5icSlIvprtnXikL9cqbrj5Bx49Brwz2zqzzlQL87QmYJmNLdUjlKQ/pHCfjifg+0LiPVwC+gvh8McoEdfTPxBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
Date: Thu, 13 Mar 2025 09:48:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-5-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 73295645-bdaa-4334-9768-08dd620bc6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjBEVk9BSW1GeW5FWm1QV3o1MTRzWWVQSkl6dmNlK1FTcFk0UVhqL3QreFJV?=
 =?utf-8?B?TUF5T0cwdDN4T1hNNWpEU1FhY3NuVDd0WUlEbStDZk10M1hacGc2SmZSUllE?=
 =?utf-8?B?MDE0U01kRThLbnJacVFaZGkzOUZVblg4MHE0R0VMNkRIdGZCelIxTUFZNHRK?=
 =?utf-8?B?cENPbFN2amt2UDdRbzF2U290cnhqYS91azFsOHBlQk1RditwenhqMjVjUXZo?=
 =?utf-8?B?SjZSQ2xHS3M2TjBqcEpFY3ZrcWJXSUhYOHIvNHMyVWJrU3JiTFA4ZFhiSHhp?=
 =?utf-8?B?NGg5ZHFBLysvTjNSZHgzbkZzdTQrTTBhUDZDcTJqcXNHd3dwbDI0dkJFejJS?=
 =?utf-8?B?WFFkY3ZwaGd0UytIVnVROURXdkJjbHJQcmZrc0Z2OUp2M0hJdExUVWd5MDVs?=
 =?utf-8?B?amMyamdpVCsxNVhnbktnNXhNSXNUbm9NZUdEcGtqb3d5V1VrZDd0NkxCdjVV?=
 =?utf-8?B?SlQyVENoYTR1aWhEVjFuUk9hd2lqYnUwZkd3L244WDNzQmhaczM1ZDdhS2ZQ?=
 =?utf-8?B?eFN3aUgwMTVCdlhvRkUrZCtUSUJaOWV0aWdCanFWZEEyTmJGUUZHN1dWZXJO?=
 =?utf-8?B?eG9aRmdVMUR1VVVQdlVpVzVBRG84cVUyZzk4UnpvamVwS0NvNldQSWdGRHZD?=
 =?utf-8?B?YjQvL1Vjdnpld0lHYmZMVDJycHpLRmFmUTh5dGNtOFVtWmtCVzNubGgvZWV4?=
 =?utf-8?B?YUV2aktZWHFobmFJNkd0ZXZNektnNVNnY2tFTUU0UXhOREorRytVUDR5b1dR?=
 =?utf-8?B?Q0xnSlhoQTcrNE9TbFBZT01mQ0tkTWJ3VUpoQnAvRVhueHZKalNySE4zRFFv?=
 =?utf-8?B?Vm1TbW9YcmdtVE5QTUppU3NoZ1M4RXRFTUd2NlhrTitLaitwSzZ3Y2VVSGRR?=
 =?utf-8?B?cmNXOUUyUGNUSmJsaXhWK254LzgxSFlLd0VYcWJrVENWZTlTaGRQRWR3MC9u?=
 =?utf-8?B?YTlmaFdGbGE5SjlndFVlVG9OdFVSalhYQW9HRGY0TTdoK2pZaVZCZElUaWh3?=
 =?utf-8?B?ckFaSjFmZ3JjT2thOGJrM1dmNXRXOHBMN3VscVNrSDZrKzc0VEV6eXpwbG5B?=
 =?utf-8?B?NGZBMHJqTVEya1UzYmp1WS81T3EvWkxNWGpjanQrTi9XemZjZC91aWIxckcz?=
 =?utf-8?B?S0h0OEpWemdGUWkzMGJWcllkOC9QWW5Uc1loOEowNDF5eUtTWjRoR1pvWWo5?=
 =?utf-8?B?ZmFVZUpIRGdYSWowVUhsbXVxQkUzWmNQZDJ6dkdTRmEyYVNRM3cyMFcxMEhH?=
 =?utf-8?B?dGpOdXdpdkltanI4OUxaeHNFNHcwamVtTWUxRXZGendQUFpseEZUdDFRQ3Rh?=
 =?utf-8?B?MEtOaFIwVmh0cThuSEZmSVVVRHVVcTlXa3ljY1hNV3JVTUUwRENrR1RuTHV4?=
 =?utf-8?B?QjczREQvMzJzMU9ubGFXeWtld2luUnNSeUl5Z1dsU3NyQVVHcXZjS1hpWEZl?=
 =?utf-8?B?bE5HcWc4U2g3WjZMdmdpUWxCUkh1WlAyajUzQ1BqWE5MMEdQQzYxdEd1OFFS?=
 =?utf-8?B?TjcveWxFV0lKK3BVN3NkRWR1bUYyYSsyTzRiZmY4TlYvRlFTdUo3V3FVOW1L?=
 =?utf-8?B?OUlRZU95SGwzZ2VBUGlwL0Y3eGR5YWpjbEtEeHBwemtHNy9sYjdCb2FpNERz?=
 =?utf-8?B?bDI4QmtabzJ0dlczdGFvaDcvMWx1MmthMEJ4MGw5YTJLQ1ZtbVdHazdvUllJ?=
 =?utf-8?B?eC9QRFlZVzZ3K0FyUXpPU3N1ZHNIYkU0N3dRUkpoQWpSOXpaS2d6c3VJc3JB?=
 =?utf-8?B?K0lBNUdOZUlBV2ZwNmFFQmxaZ1BzSTVFWmU4bE04V1dJeFJQMW14WnVtNjR6?=
 =?utf-8?B?eEs0aHRUR0hqSmdCbndOSGpUZ0VrUzNYUzNPd3J3cURWa29INUN6cFVpRU5E?=
 =?utf-8?Q?O0TjKXxzmMcT2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHU5cmZqZm1sTkUrcVdkdnZQeDE2dkppRzRMU3FRekxEOGg3alRyL1JjRlo4?=
 =?utf-8?B?SXpmTGo1Ni94QzRFOU9GN2VNL0VzTUpoc2lvUWF0QXduT3p5d0FVL3RKazB5?=
 =?utf-8?B?aHE2SDR6OUQ4QTFDWjI4Uks2L1RXOTJncS9XV29janh0UzdZbUhHbFNWZ2tt?=
 =?utf-8?B?NWVYU2dpazB6ejZpWk1KdkZHbWxJK2lCWHpFaUZvcjUvU3lUOVZLbFZHanpG?=
 =?utf-8?B?QThidFBjcUFFWkdNWW1xMjlDT1BIRG5FRUtOcGM4VUUzZE04M0tYd2RhUlhs?=
 =?utf-8?B?Q0MrdHl4Y3dITVljZzhIRC9VODAvZ0hTcTRDNStPZDlyY3ZwVzVic3FWMFpM?=
 =?utf-8?B?UnFjY2JDYzdaTS92TFF0dlFXamxFRlRrSHpHQmJMTFpyZmwybE9JNmFqUjE2?=
 =?utf-8?B?TjZ0SkxzVVRKUU1PWjdDdHhFbVFWaE9Ib3ZFWjlUeHR2WWtIcGE4Z2pUVWlh?=
 =?utf-8?B?a2RjSVdGekxMOHVDdmFqazBPcUs4WGxWallTTXdXZmJ2aG1hWDBWOHZ0Sjhp?=
 =?utf-8?B?ZTJ6dk5WbmVuemp6aWNtWm9SMzZCRTVJUGdNWERqcTNUKzA0NDB5eGFrVjlq?=
 =?utf-8?B?ZGN4dEZVQjRiTnB0Tkl5cFQ3MWtQMVNGZUEvaHBtcTV4ZU9sTnZOWTBkYlNF?=
 =?utf-8?B?OTR1VWVrM200WVNPZlhFTkFrNHBNN05iTmdqWnE2bVNrZHpHTkVOc0orYUh2?=
 =?utf-8?B?MGVZd2hnSTVpRUpRTEozMGt1NVR6eEFRdGo0azZCZHB6V0p2NTJickRxS0Rx?=
 =?utf-8?B?aEFGWTYrTjRMSkMyQ3RJT2syQXdrUVdkTU9JTXVyR1hCR0ZlOU1yRU1FcjBH?=
 =?utf-8?B?NzRRQncyRWxCdEZnd0ZSbWpXRmUwbEE1LzJBUHhYZTJtRldNazRLTndlTXlT?=
 =?utf-8?B?N20yeEFYdm5PbnREWnVIS1doenZiZTk1VXhzRmJKSGptVXdqUkk1enhpcEJi?=
 =?utf-8?B?T01HUUQ1M00vMjVOSXhmVFRJVndDRmFxQ3JISVIzbzFVZm9mWnlhNG1HMFZT?=
 =?utf-8?B?aFJVSDFCSXp2dDAwcmFNNVhaNEhLSUJSLzBVaHQ1WEhmelB0NXpEeThHdW02?=
 =?utf-8?B?WEFKbXBFVE1UdWc3V3NsK082bEEwSXRmSThwK2tyTUN5RUNiRm56UG5raTVZ?=
 =?utf-8?B?a2dIakNOM0tWMTVQQW9uaDVYVGNZTnI2Q09Ic29LRzhLNTdlRmM4Z2cyNzBo?=
 =?utf-8?B?UitFSTE4V0FVN2F4MFZEcnVJTXhHdE9LWElvR3JGWENNTk1XS3hpT2puUFlP?=
 =?utf-8?B?R0hzTnVlUnJIcHp4aG1ScGUycVdQY3VoUXUyK2w1ci8rNFlwdk9OU0FKUFVv?=
 =?utf-8?B?RXplN2IreG5vSlc1T0ZMMGVIQUJsSFlFMTE1dWE0YW1JWEFVbU1kUDlqelNh?=
 =?utf-8?B?dzFabzQxcDNGQktYdGFaVzAzNjYvTldzWTh1Sis4VVRmUFpLRnAwdllOVmJD?=
 =?utf-8?B?ckphZFZFbEVQaytPZ1JMY01wVXYwRWNvbDF3cE5URFFtaTI2NWNQdlNWZm1z?=
 =?utf-8?B?c3ladDB5YVE4N1NiN0JYQm1HMmFZRGgrOHpsTjlQejVBcGcwa0p4VXFsRGJt?=
 =?utf-8?B?TG9CVTBjbXVMSnlJa0t2alFVL20zb1ZVcDRyWWN4cEhYdGJVbkUxaWpTRmlk?=
 =?utf-8?B?Tk5yUjhtVXpaYnc4a05oME9rSEhId0pkTnV6NUVRN3RuVHFvcFg0N0NLUXh4?=
 =?utf-8?B?S3FHUCszczBlbHRlcUxuNGlaMDhZMjhTZnJEMXdTano4RjVkZU93OUhTYzBx?=
 =?utf-8?B?ZnRFVVIwWUZibUxpYmltclFRRkhPMXE5dzFlU29YK3ZWNlBmTWlZamc1bWhP?=
 =?utf-8?B?RnBQdlBNa2lQcFd2VTBrT05pS1dlaUh0Q3IrNjRrekNJSmpEN3pzTHo0SzNL?=
 =?utf-8?B?TlFDK3U4WXJWcFhTdjBKVUorSmNGUDJWeHBoS1ZsTlB2YnNWbWlSdjZEZFUy?=
 =?utf-8?B?eHhTaHpSY3M0L1l3N3pkZzRnZUhHNldhVkJmQ2pzQjJWUEF4UDk2Yy9zdWd4?=
 =?utf-8?B?eXZmTW5iWGN1MmxudFZhZmVWNDdhbjUxK1dlVFR2dk5qOG93ZkVCeVNMSmlq?=
 =?utf-8?B?SXdDTjRtdHFieTFQNFAyYXFtV2x5cllRcjJmSko3M2h0NjdCUEFRSnRvNXhH?=
 =?utf-8?Q?I8j8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73295645-bdaa-4334-9768-08dd620bc6e5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:48:07.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxdMddOu/45zkbcqLgonf7cK8rQ/Ix46V+zYYHtmO0dJOqy46Ant/dV9NpoEOgeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
> even there is no VMSA in MPU system, we keep the interface in MPU to
> don't change the existing common code.
> 
> In order to do that, move the virt_to_maddr() definition to mmu/mm.h,
> instead for maddr_to_virt() it's more difficult to isolate it under mmu/
> so it will be protected by #ifdef CONFIG_MMU.
I don't understand this rationale. I did a quick test and moving maddr_to_virt
to mmu/mm.h works just fine.

> 
> Finally implement virt_to_maddr() and maddr_to_virt() for MPU systems
> under mpu/mm.h, the MPU version of virt/maddr conversion is simple since
> VA==PA.
> 
> While there, take the occasion to add emacs footer to mpu/mm.c.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/mm.h     | 13 +++++++------
>  xen/arch/arm/include/asm/mmu/mm.h |  7 +++++++
>  xen/arch/arm/include/asm/mpu/mm.h | 27 +++++++++++++++++++++++++++
>  xen/arch/arm/mpu/mm.c             |  9 +++++++++
>  4 files changed, 50 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index a0d8e5afe977..e7767cdab493 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -16,8 +16,10 @@
> 
>  #if defined(CONFIG_MMU)
>  # include <asm/mmu/mm.h>
> -#elif !defined(CONFIG_MPU)
> -# error "Unknown memory management layout"
> +#elif defined(CONFIG_MPU)
> +# include <asm/mpu/mm.h>
> +#else
> +#error "Unknown memory management layout"
>  #endif
> 
>  /* Align Xen to a 2 MiB boundary. */
> @@ -261,10 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>  /* Page-align address and convert to frame number format */
>  #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
> 
> -#define virt_to_maddr(va) ({                                        \
> -    vaddr_t va_ = (vaddr_t)(va);                                    \
> -    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
> -})
> +#if defined(CONFIG_MMU)
> 
>  #ifdef CONFIG_ARM_32
>  /**
> @@ -310,6 +309,8 @@ static inline void *maddr_to_virt(paddr_t ma)
>  }
>  #endif
> 
> +#endif /* CONFIG_MMU */
> +
>  /*
>   * Translate a guest virtual address to a machine address.
>   * Return the fault information if the translation has failed else 0.
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index f5a00558c47b..5ff2071133ee 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -2,6 +2,8 @@
>  #ifndef __ARM_MMU_MM_H__
>  #define __ARM_MMU_MM_H__
> 
> +#include <asm/page.h>
> +
>  /* Non-boot CPUs use this to find the correct pagetables. */
>  extern uint64_t init_ttbr;
> 
> @@ -14,6 +16,11 @@ extern unsigned long directmap_base_pdx;
> 
>  #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> 
> +#define virt_to_maddr(va) ({                                                   \
> +    vaddr_t va_ = (vaddr_t)(va);                                               \
> +    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
> +})
> +
>  /*
>   * Print a walk of a page table or p2m
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> new file mode 100644
> index 000000000000..57f1e558fd44
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_MPU_MM__
Missing _H? Should be: __ARM_MPU_MM_H__

> +#define __ARM_MPU_MM__
> +
> +#include <xen/macros.h>
I guess you also need xen/types.h

> +
> +#define virt_to_maddr(va) ({  \
> +    (paddr_t)va;              \
> +})
Why multiline? Also, shouldn't we take PA bits into account?
I'd imagine:
((paddr_t)((vaddr_t)(va) & PADDR_MASK))

> +
> +/* On MPU systems there is no translation, ma == va. */
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    return _p(ma);
Why do we need to cast paddr_t to unsigned long before casting to void?
Why not:
return (void *)(ma);

> +}
> +
> +#endif /* __ARM_MPU_MM__ */
__ARM_MPU_MM_H__

> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 0b8748e57598..a11e017d8a96 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -13,3 +13,12 @@ static void __init __maybe_unused build_assertions(void)
>       */
>      BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>  }
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
> 

~Michal



