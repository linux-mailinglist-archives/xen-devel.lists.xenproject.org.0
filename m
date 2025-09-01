Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F5B3E612
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104831.1455862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4wX-0006e6-2j; Mon, 01 Sep 2025 13:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104831.1455862; Mon, 01 Sep 2025 13:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4wW-0006bn-VL; Mon, 01 Sep 2025 13:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1104831;
 Mon, 01 Sep 2025 13:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJuX=3M=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ut4wV-0006av-KH
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:51:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2407::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c14e5ef3-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:51:28 +0200 (CEST)
Received: from BN9PR03CA0689.namprd03.prod.outlook.com (2603:10b6:408:10e::34)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 13:51:24 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::bd) by BN9PR03CA0689.outlook.office365.com
 (2603:10b6:408:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 13:51:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 13:51:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 08:51:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 06:51:21 -0700
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 08:51:20 -0500
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
X-Inumbo-ID: c14e5ef3-873a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeGd8r2qjaWjWm8hL3eVmwrBMmAecegU3A1ncA2Zpr29EH9jzMgmQf1P0N1SJZnwdv07DPKqqDG70iLexM6IPi3fCIyOSOc97zKAw8NFlgSHQk7eev/1fK/z8p5Ks7OBEaVzjv8k+c07O/IIj8H0s2w+jhWNEEHMCUy8rPgEMi+c1x+d8sa+mfyrD4p4k4/HdGRJhEeEsEtuabgdH7Fz6brbEqeN2gnh9OB7/6THnxnRsO7i+QjvSNL1pHJtwzA1WIpxgn7Vb3xst0zEh6G9eM0GSw+Bc/vA0wIP53L2PazTG2Ev8Wjop6SCsRVcahbR19XDsdAQ6WMCp7pcRAQUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL3KT1SD5+QBSix2hix7cYoptDSWF5/XQfJQkOiUMaQ=;
 b=DYc/IVwjb48/ru27GJLPBRHtOH0HquJi1hpBGbe91tzhLxLggIpNOW0V3mC9hRQWbw0zr4QJB25WnxIpaKvSuiv2RumFUXWQtX/Pd/whmcPyY8s5DBGuBMCt64wED0D6+I4LRGHnRAbZRZSatEsaL/fNMjJ6BcEEndRVRc0SjBEbnpMDXmyLZCwMxtumg/mtFjWfBoUMnD6AqtjaQ8UdSkqUE0jYJroqhSl5BqCM+Ze+3BO1bXzr4qwO4kLerbWwBhtkWlG8OcsbYDyygAh8ClEUwERHyM6G3JHKOP07j9QDurcwj1iQWAewRH7fuzRBLQ92e9GVCKHF0S0SAVPtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL3KT1SD5+QBSix2hix7cYoptDSWF5/XQfJQkOiUMaQ=;
 b=SGM8aIUaLzWMl5RHJmAdhKMBt+lhf7yrCOVWt/DjYReMNd7BcrXFcBWc4C6jB5SHPU6jaW0KXPSQeZ03jBjK+XCgyrmqbi9/bSRc9wwgxo7wnpVEws/Qb4w6MFJ2onk1B5bQCKRP+/bISrU/skjYTJhQlfZgMzckM+1QGH9CYpw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ce4c05ed-6fb0-4735-b0d5-ab264c5f946e@amd.com>
Date: Mon, 1 Sep 2025 14:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of
 device tree
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, <mark.brown@parrylabs.com>,
	<matthew.l.weber3@boeing.com>, <sookyung.ahn@boeing.com>
References: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
 <20f5b553-75a6-43b3-9b2f-1cf73b9589c3@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20f5b553-75a6-43b3-9b2f-1cf73b9589c3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c45d097-d8fd-4e41-0a54-08dde95ea36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3lxaG4waHVaVlBpd0xxTk1RTXR4eFhSMjlVK2hpZ1VXRDZBWlFNZTFRM29l?=
 =?utf-8?B?WCtBeWdTczQyUDVtSWVTRFhsWjg3VDFBQ1FiYUhrUzlwalU1Y0ZjdGE4aGEz?=
 =?utf-8?B?bW94amNCRHg1ZERxVjRiL29UMEpUaHZwTFlpMkNaNGxid0Y3TVB6a3g3YVcy?=
 =?utf-8?B?RC94K2NGMlNpMEdueWZKUjZZcDQxQXdtOU05dWlwWGNkeWZkREtJUlRqRVNm?=
 =?utf-8?B?b3d5ZGZ5WE96dnBWTktNcW5LZ3JXL1ZlYzNNNHhlVGlEbHEyUWk3TGoxNHdn?=
 =?utf-8?B?VER2RTYxdHg3M1FTeEcwRko1RmM2a3FSbDM0RElqNzBNNHptQ0pMMUpJbWc2?=
 =?utf-8?B?NVhUM2FpbHlwYi9DaFNkdjIrbTJkcTBMZUpIRDJVRWlUMDIrSlNjOVlDUEtN?=
 =?utf-8?B?OXgxWHRWKzNiOTRRREpPWDNuRWtFajJhaFlqK28rdUJHeDAzZGFiclhWY2dT?=
 =?utf-8?B?ZWM5dzVvZFJPNGM5YVNwSm9mbzVRSk1kL3hkU2xqZnhWa2VnMDJZNm1XLzdC?=
 =?utf-8?B?azZhQUMzYXpJc3V5ZkV2S2ZUV2ZDeHAzZlZJYzVRZU9QUlpCeUxqYmxhcnp2?=
 =?utf-8?B?S0p1YWJwRXVOMGxhTnliQnU3UXpoMnNTMmtuUmRydjBZSTU0UjB2NE9PR2dw?=
 =?utf-8?B?WFFaSnB1QmNSbUFLYVVDRjJST0dpQy9PQ2RKamQ1YnUxMHlHUzdBd3ppenlJ?=
 =?utf-8?B?ZTQvanJVWXBDdk05ZXgwc0prSll5TER2c1lWMXIrWk1nY3BZck9JSWd4TjBJ?=
 =?utf-8?B?YXp1R0RscDJRNmk0MXpUL1JTVm41VzgvM0RlaGNPZUZpd082NVdDSFpWV0dO?=
 =?utf-8?B?M2JUdGZ3UTNvbnlCUSs4OERzM0ZkTUhNVndOeE53UDJQandOMU9xZEl4TnU2?=
 =?utf-8?B?ekl1bTNLQXRnVkVEVG9YRlc4M1ZNNmZJZXhiQjg0R1FsUmhyUElmODRrSGFy?=
 =?utf-8?B?Vm5jNDliUnM0ZUozOTNFSkhaVEE0dThldDA5M2MzclRrcmNPTEpGanVMN2tB?=
 =?utf-8?B?dXhtaHJ1a1dXWlFteHp6QTVuUG14ZmdBekZLMWM0WHpiU2Q2Zk5DQ1pJRmls?=
 =?utf-8?B?NXRLMXpTblROdC9zK2luLzBaTENiaS9FT1QrMStxdDdlcDMyQWhOSFR0bFhD?=
 =?utf-8?B?NkhXa0gzSzh1Ti9IMWg2aVRrMEZYUEdiRTFkOXVKM0JiUCtzcVFDOFJqOTRT?=
 =?utf-8?B?TkxRd1RMaGttMjdDZ2lVRVNGZDE0bmNuVTd5S1VVd1VsZ25jL0xFcno5Tno4?=
 =?utf-8?B?blpBNkwzNmRBbCtaYzkwUnNmcko5Z2hDNVVqWjFydVlZdXJ2WWI2amNZSWRU?=
 =?utf-8?B?Vi9ucnprYlUwSmsyWWcyZGY4ZE9jYWV3ek40RW1MdTVoeXEvZXRjcDkvYzF0?=
 =?utf-8?B?ZkJFbUhoK3dLTlVwT2NaUzQyTllwWTVwK0dMNkw4OXVZZk5HWDg5RzRDMk55?=
 =?utf-8?B?dElZM0s5Y0ptTG1aOFYrcFVvSVQwNm15Vjk4Y1hYSjJoSlZjREx5SXE1SXU5?=
 =?utf-8?B?NGNqNEUzVWpKZ2piWnZScEVFOGtyb2NqbWwrOWczOVN0ZEg0OXVwWEV1ZUdB?=
 =?utf-8?B?SXlaY3E1ZWhGWTJ3K3cvdmhsWjQ0eFhTbzM4Z1o2b29JVXMxRm12QTBkdUJX?=
 =?utf-8?B?aTQwZG4zeEYxSG82ZnU1cW4rTkF3QkVYTDFkUy93c3Q0S3orQVJuQ2RPY081?=
 =?utf-8?B?WXN0blNoRzJ3dVFYOVhLRFlwTGRXOGh0bFlIWnhZQW9LZkpRZWd1T1c1citY?=
 =?utf-8?B?M3ZhMDZJbUZrWE40MjJ2QXRHdXRTSXd0NjIzQjVJbUZ0VXFvaWkvR3lOOFpV?=
 =?utf-8?B?cmlONWZlVnNVTXJKWjJpeWhVTDEwaE1jZHV6bkV2VDRBR0xjWDVkT1JOZW8r?=
 =?utf-8?B?N2Z0alZMR2F0dzQzd05mbHIyUi9mMmExOGlGdU9LZG5CcWRDcmhaVlRCcm1V?=
 =?utf-8?B?L1BkOWswMnlzYW5YZGpGVUpJNXVoem1nTXlEZFFRaFphUzVnRnZZZHFFYWZI?=
 =?utf-8?B?dWJsK3ZlN2FzR1RxeXJySUdKdDNRQUpOaGdUaGEzUjN5RkJ4Y2VLVld1VkdY?=
 =?utf-8?Q?9Cy1yC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:51:23.3884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c45d097-d8fd-4e41-0a54-08dde95ea36a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260

Hi Michal,

On 01/09/2025 14:17, Orzel, Michal wrote:
>
> On 01/09/2025 14:31, Ayan Kumar Halder wrote:
>> Xen gives a panic if certain nodes are not present in the device tree. In order
>> to prevent this panic, scripts/dt_sanity.py is written so that it checks if the
>> node/s are present. If the node/s are not present, the script gives an error.
>>
>> User is expected to run the script against the device tree before booting Xen
>> with dtb.
> I would expect the script to know what to look for in a passed dtb. Otherwise
> it's just a script that searches for the list of specified compatibilities by
> the user. In other words, a simple grep would also do the job.

I agree. The main idea is to check that a dt node with 
'compatible="arm,gic-v3"' property is present. We can enhance the script 
as we go forward.

> Compatibility is
> not everything, there are other things that would prevent Xen from booting.

Agreed. The rationale here is to shift the responsibility to the system 
integrator to run some validation so that Xen does not catch these errors.

We wish to provide some sample tools to achieve this aim.

Another category of errors are the unsupported register configurations. 
For eg gicv3_info.nr_lrs can be supported with a max value of 16. So if 
we have a baremetal program that user can execute before running Xen, 
then the user can catch these errors.

If we are able to catch these errors outside of Xen, then we can claim 
such panic() will not be triggered in Xen. There will be certain 
assumptions to make like ....

> Also, often times the dtb is modified by the bootloader before passing control
> over to Xen (i.e. it may differ from the base dtb).

bootloader is not expected to modify the nodes which are sanitised by 
the external tool.

- Ayan


