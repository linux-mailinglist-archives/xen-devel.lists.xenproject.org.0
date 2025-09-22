Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F8B925A3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 19:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127883.1468425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0k3b-0008Lc-26; Mon, 22 Sep 2025 17:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127883.1468425; Mon, 22 Sep 2025 17:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0k3a-0008JK-Vk; Mon, 22 Sep 2025 17:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1127883;
 Mon, 22 Sep 2025 17:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1v0k3Z-0008JE-Jn
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 17:10:29 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08138323-97d7-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 19:10:26 +0200 (CEST)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:10:15 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::8e) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 17:10:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 17:10:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 22 Sep
 2025 10:10:14 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 22 Sep
 2025 12:10:14 -0500
Received: from [10.71.195.192] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Sep 2025 10:10:12 -0700
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
X-Inumbo-ID: 08138323-97d7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDHbd5M45M+3wbeVWasAnqVyr2Dr6rBmjwxo6wzghHJoCuZ1YbYNYn5brqP6SY4P10lFo54ukRN7IL6NVinxXKEE7uHB/tV8PamglvEhC1fM2O0E8d9TQ6rFRFfRBs0joVewM4rXGb6d5iSoYV/BzHN7JPBjV+hwaLMGGC9Q8H0qiASPnpAXaupi2pTV4W/zOcQiV3Ebf7sNxdmLzkS6P+LX5zK1379bH8YpqpPPC2ZDc5e1JL9zurvn2+by86jkVE+YO0y8mPD/iMMW4EPaXd8DG9bKO2JC1uugwJ88JvOOC/YeYEPfjANN3PDVyhirOI4aOGh1EtGSDBOi0YlaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xecNqUaleM09+SwcGfMxl8bE1CdWDyZ2cVliD9ttxvg=;
 b=VJuVqyCmjpEdgZWyIEPpQkBzPUBMOGhjD8nnqalNJfy3lCvUUk53458stGbC+ygQ7hISjTqzPm2xm6SA5EcOdWCn/kAQF1fNxx0oY2j3KdEosUT26Up4DKxTR0uYNWfxyX/iHMgtc+/O1aVmFjrI+Jp6m06BDEeu6EkS99ZX6DUfOukYVJxzQb1bj9aTV7xFzRD2Wk/djehi3Ic6smSMJjx67jrvN3bMs8zBFtEGw1qKWHPO4/cao96hlYyeLCz6sNZw3x3gg1xm8FnFCCjRMoL1P69yo7bYW6lm4bkpp3k7h246nv0iP0diCnMg6WLwDNCxzvvU8gIXAvFhqV9npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xecNqUaleM09+SwcGfMxl8bE1CdWDyZ2cVliD9ttxvg=;
 b=Xuc2YBfrdTWAmmgnFjjdfGrixAyuR0gC6iHdKX9uJ3cOY5bm/zMvT7TGlBs2FAx7QtnuxmD/jvUc8veRoUmHtAlFSqtRZE6DM/23QR3NFtbzpzKcS5rFO1/2hbmEG1Hrrw/yVeClXH6A+Ncppc9X/K6IBf1Ss0ortCIZj7AoehI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d96c751e-b2a1-4a1f-8447-2ad80956cc70@amd.com>
Date: Mon, 22 Sep 2025 18:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of
 device tree
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <volodymyr_babchuk@epam.com>,
	<mark.brown@parrylabs.com>, <matthew.l.weber3@boeing.com>,
	<sookyung.ahn@boeing.com>
References: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 43adbf1a-22e9-4679-9822-08ddf9fae5aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2s0V2JjYUt6L3lUSUIydURkY2xGRTYwR09YMTAySnlIbTJDa2lma2lLNk5R?=
 =?utf-8?B?T0ZScWZrLzJVUWtmWmcybi93cXRXeDgxd0xGUjBwL3hxK3Nhc040V2xWTzBC?=
 =?utf-8?B?YklIcElEQVhtZDlwUWFlY0pTMGFrQWY5OEo0anNnNUdOZDdDQk9JVERtU2FY?=
 =?utf-8?B?Vmhtd2NvYUR6bkFDWkljbEpFUE5URnMvM2theHVObWxsT1VxZkc3akNVcEhy?=
 =?utf-8?B?bUM2YXIwVERJQVhmazNFSnRhUlF5TElWR09RM09FQUVuTHl4bS8zbjdsNHlS?=
 =?utf-8?B?emNBR2NxVXczTmoyK2JwN1BuVjhxeloxVVBiYllBMGtJVGxVc3VCa3BTU0Vi?=
 =?utf-8?B?SGlLOE4zUWJHd1NLUXBTcEhUWXZUM2pzeUViYTFsQTlUdENvMHVQbXoxYzhM?=
 =?utf-8?B?Rm91YWhaS1lqNkRRTXhJbG5ETGllYzhkYWR6YlRraktQcGh0d2VXcGdrZjRm?=
 =?utf-8?B?TUlXcW9CU2Q2eEVjVFMveDhoN2Nmb3I2OFJaMXpmYVlJUHBucHhoa1NjVHoz?=
 =?utf-8?B?NjJlM2VVQmRTM2tBc3QyY2F4L0lUK0JYVGNtQUJxMGhkb05OVyt1RzhnNUdN?=
 =?utf-8?B?SURKMVA1NWNtNG04c0dxd3gxSGRKaEVycVFJNWRLTnk0NmNNTE11cGhGR0FR?=
 =?utf-8?B?YVl1OHBtSE13L3VaZEtiZjliTkFIZjMrdEpVTWxvUm9ibWE4dVo3UWQ3YzZQ?=
 =?utf-8?B?ZE9GSGZMaG1ON251bEIxWG4rVEwxUHZMMjhLZGFSaGdkeFdTM29rZmhkbkNn?=
 =?utf-8?B?a0FhekhPQ2lwQk12Qm4wK0dGdEM1Q0FvcDV5OGE4cVgzaWhvWGNjTjA3RkZn?=
 =?utf-8?B?THpvcjJTZDg4bnRCUFNmcWhYVlpuUGdqajlpWFNJL2VmZ0l6SE8wbWd2YzNC?=
 =?utf-8?B?Q25HTk9pYkNpSU00N3dJb1JNOHJ0OVdGcWxZK1ZxbzdULzhnTUNxMmIxZUtL?=
 =?utf-8?B?V2VhWGtLRkxYM2dpbDh5T2RFNkdzbXJmbGhGazBjWUtsR3hZdlRzM0lZb0Ni?=
 =?utf-8?B?ZzJjdElZMGFYdVNkRzlwRjNwbGdGekhoK2UrRXB5cTdmRWxmQ3FtcDF6Q2gz?=
 =?utf-8?B?V0JDdmtoNHJHYStEcG5VMTJJdDFPRzY4SlpGWGU2cUhidkdnSW02emN3OHVQ?=
 =?utf-8?B?Z0UyVzFXM0RFVHZscFcxMVUxd2ZSOFFOcWRoMm9XenEzSmRvTlp6eStncGs1?=
 =?utf-8?B?R3o2MGk2Q2kzTUtWTUs3K0lEc254ZkNQT0tud0ZZVlNOcHZucy9TVExsb0JK?=
 =?utf-8?B?N2h1RVZrRHF4bmZURHlRZm15RzFMUVJ0RS9YL0VLWDRvT0pmVW1LZnJnYTNH?=
 =?utf-8?B?QS94cXZCeW03RW9RU3BKeTFFb2lyK1lJYXB5MDUzb1cxZnphblBXMzVFemxo?=
 =?utf-8?B?WE9GLy84T2ZUa1o0cEgxM2NCSHpCRWRmK2hlSXJHbHV0WDZzcXZZV2ROYmRy?=
 =?utf-8?B?WFJIUVlHdmhrVStuRTlWVFBOQnZ4Ukhmem84WEd2SVd1TFdIb29TSWJZeUlN?=
 =?utf-8?B?eTV0aktieXBZMWZja1pZYTE0cThvOTd6YmZWL0w3M3BoNEQ4Wm9DR1F2b2Jz?=
 =?utf-8?B?Qm02T2hibGNwRkRsamR6YXJKanVnamtOMzZWaGVKR01ObFVBZnlwNFBOS21E?=
 =?utf-8?B?SHJ5bUtoY3cyczdkNWMxdUppak1ZMVNYOUU2OTJNYnEzK1F3WXBxNmRFS242?=
 =?utf-8?B?Y1hvNVlmM2RmbC9IQnhlYVNzYU1VRGFyRHYvdXJCRFIyeFk5QzVCV1daK2pG?=
 =?utf-8?B?UWZZMWpHRExRV1lSZ2Vici9OU0NYcm1laWJRS1hqRDBNcy8ydmNEM1BRbmxK?=
 =?utf-8?B?VE5nRElyMy9lSTFNQms1c3pQZVNaaXlCaGtWRGVucjkvYVlLRHExbmdIM3ha?=
 =?utf-8?B?ek8vT0d6c01HQm1zN3RhcTF0UGsyYWVzUlV3bmM1WU9ad1dvMlhvM01weVhx?=
 =?utf-8?B?RmFYMDhnY0ExVWFnK2FYdE54WlZNVUQvdUpyRkFUZGl1QzBDMlU4SkpacVJh?=
 =?utf-8?B?YXZnbmo3RU01c01aRHpuQnpoOUJvYTFXcnozY0EvcExTbEQ4THVRU0NtaDc1?=
 =?utf-8?Q?JnW1hQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:10:14.5678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43adbf1a-22e9-4679-9822-08ddf9fae5aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422

Hi,

After the FMEA discussion at Xen summit, I want to put a clarification.

On 01/09/2025 13:31, Ayan Kumar Halder wrote:
> Xen gives a panic if certain nodes are not present in the device tree. In order
> to prevent this panic, scripts/dt_sanity.py is written so that it checks if the
> node/s are present. If the node/s are not present, the script gives an error.
>
> User is expected to run the script against the device tree before booting Xen
> with dtb.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>
> Hi,
>   
> In some of the discussions with the safety experts and upstream folks, one issue
> that kept coming up is there are lots of ‘faulty system configuration’ and
> ‘impossible conditions’ checks in Xen.  While these conditions can rarely occur,
> Xen would panic if any of such condition does occur.
>   
> For example, during bootup, Xen parses the device tree .
> It checks if the device tree nodes are present for timer, interrupt-controller,
> memory, cpu, etc. If these nodes are not present, Xen panics.
>   
> As part of safety certification, we have 3 aims :-
> 1. We want to reduce the instances where Xen can panic. This is to improve the
> robustness.
>
> 2. We need to define a safe state when a fault is triggered in Xen. As faults
> (like the one mentioned here) are triggered during boot time and it is due to
> incorrect system configuration in device tree, it is hard to define a safe state.
>
> 3. Avoid validating all the instances of system configuration errors. By having
> an external tool, we push the responsibility to the system integrator. The system
> integrator needs to run the tool to validate all the properties that Xen checks
> for. This can be a justification for the coverage gap for those checks in Xen.

This isn't true as we will have tests to validate all possible system 
configuration errors. However, I want to use this script as a 
'prevention' mechanism to check for the sanity of device tree (which can 
be offloaded to the system integrator). There could be many of such 
errors arising from misconfiguration in device tree. Wherever possible, 
we will use a script or we can explain how to identify these errors 
before Xen boots.

We want to convey that certain failures in Xen are not possible (or 
there is atleast some mitigation) if the user has read the FMEA or 
safety manual or public documents.

- Ayan


