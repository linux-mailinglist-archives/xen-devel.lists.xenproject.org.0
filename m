Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF998EC61
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 11:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809244.1221469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swIKh-0003Kf-NT; Thu, 03 Oct 2024 09:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809244.1221469; Thu, 03 Oct 2024 09:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swIKh-0003Ib-KN; Thu, 03 Oct 2024 09:41:15 +0000
Received: by outflank-mailman (input) for mailman id 809244;
 Thu, 03 Oct 2024 09:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mkok=Q7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swIKf-0003IV-FZ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 09:41:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fc9a453-816b-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 11:41:12 +0200 (CEST)
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 09:41:08 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::a2) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 09:41:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 09:41:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 04:41:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 04:41:07 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 04:41:04 -0500
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
X-Inumbo-ID: 9fc9a453-816b-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtwwlqijsXrHYhxDLYqXUGoHwiaVh0z5GZBw2+bGGl8sWj2xf7s+RkHD36cpGKEHJcVkxKU1hS9jvlFNgM1fo5LjkBfV/R3ityYfNkB2s9gd0eiH9myvreAyhj3/EaZb6N8gqJY0VoSwcQp+Faj2Z2HRPP+PIQL4Y70oi+cupp8FbG7wZk4OEYAc1X7BKqlXrSd6hsxfQxZ6a9HG7ZpvLPPzM11GK1f5MkiKDdrS1qGnlWeTuEgcqOR79VOVPGw/NBP55dGgSstJV1+0WolG/vSOmznXnafOe7YK3LzFjbdfAiCZ8DYWDKoJii84AmkCLsfqRMF0gF7LuPEwN8ieXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+GlfTuyCcRlG6HAwCrHTSEasIZQnqrq4e/lxe3027o=;
 b=LS/MvAcIa7q4eJOlu0ewNwKkELJsL1ivvFq19qAwq7Wb/wCnJ2TbrubO1oE1vgqBynTzjJRctZNPLIt1XGzDoq8c9p0vQmTCKg35fU/dA58wEZtiVaeDKlHMwfCUJgF5MH+uQvrErZ7FWm15/D+CxhNmjZysTzDf/q97oCqK4oH3PV153Ha5PCFOaZpevBQQEpabcYT8Si0S9vvDn1h3hFxoCh0KZrsVFyZ7gDNbK8chpTu26RKjG1DyEC30awQmiWPuDLUqNnzfmUPRoIeKBD8VQ4UHSJIPm4e+tfB63kUXroFGZ0bBPVdbSuPvCn9XfK3aEoq0Tz+CHhSHZiRGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+GlfTuyCcRlG6HAwCrHTSEasIZQnqrq4e/lxe3027o=;
 b=MteAkCFJiC63Zm3UXPiea0WAbcGz9QhSJpWgTxkWKlADcFxGSBu6HlN+uSkP+XUP5J0EopfRI6dMPw2qh+O2vsoBVrh9+/KWeAMOL5ECdNjNOws2h+8aKAMietaL3TDu1ji0PbcSBds6fL5kFT/NyzcKALmJw6eYHYO1FFxYHnM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d3d4e88-52b3-40d7-aa65-30af88094622@amd.com>
Date: Thu, 3 Oct 2024 11:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: move per-cpu area management into common code
To: <oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
 <1c930c7a-50a4-403d-a867-b569e1efced6@amd.com>
 <5778c6f610e36fbb34485790a8ac3e2227518db5.camel@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <5778c6f610e36fbb34485790a8ac3e2227518db5.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 17eabcbf-b058-491f-ca05-08dce38f81e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjZCYzZLV3Z4ZmtRYmdYdUpuanpTQUpNc1RadVJTZlhMT21HK1JnUm92R1Br?=
 =?utf-8?B?b01xQlNzcFZrWWtpbXpFbHl0UzVkMmhFSWNXUjhMMytaT2hheGdiMUR4R1py?=
 =?utf-8?B?SEIwUVlDenZheHA3RHlGQ2hqSUJPSjFCd0tidDZDUzM2OVRXVzBQY0ZEMmow?=
 =?utf-8?B?dHNpVEZHazJhSkwveThLS1k5dmZreU1oYW03NmhLOGwyMWFvblMwZHZKVmZj?=
 =?utf-8?B?UkwrTVRMK1NYZm1BaUM5ZXR1QWxLc2UzakljSWVoc0VkeXMxZGZUZE5wc3VZ?=
 =?utf-8?B?NUpLV1UwZjlMWHpaQ3ROUmxkdzZWamZ2c2wrMkpYYzgydmFqUE1sMlZJbDRk?=
 =?utf-8?B?QWRzcE5aeitDdS9UYzNwMlg0Vmh0OHk5TjN4M0syU2ZvelAzVmdzM2syWE8z?=
 =?utf-8?B?TllrMUtKRFR6MmNGS3VVcXd6bFFIMGp2QmtocG41NGYzaGdnYndzMkYvelZi?=
 =?utf-8?B?eFZBMDhwZ0pLSUwwVnNVWnFYVWQrdGYrbE5hSUFvUFNJdXdQVzUxalh0djRB?=
 =?utf-8?B?YVI3NlhjeXhpS2YxQ1JEVXJsTkVtT3h2TFdQNXJMRWxoVlhGNGxRaitsZ3pt?=
 =?utf-8?B?WC9JcndYbW1aVUoydjJPM0lzc0FSMHJBWEF5aGF2bktpd2NiQk92SGpha1lt?=
 =?utf-8?B?M052U016M1YyREVEaW1DSnNPUnJoREtscG80SUhLbTVLVjArM0NieFppMG5I?=
 =?utf-8?B?dlFZZy8zUjk4d2t1eWZJZmd0UmM3MEZXbkRDdzJ0R3RNNk1oKzl2YTJKZWts?=
 =?utf-8?B?Z1lvQ1Q1bjFmT3dRNWIwSlFtV0UyTTZIdXRsTDFkeFY1L05QWTdiSnViZkMz?=
 =?utf-8?B?YndrQmU0VDZOb1I5cnVlRENkaE0rYW0wcWh6Q2VpVzNsTU1oR3h6WFdzU0Nh?=
 =?utf-8?B?RVZRQVU4ZlZJMjFVRGZ6bWxtUWFWVFQ1WktRMzluYVJDL1h1TWFxejVwRzVW?=
 =?utf-8?B?NVdEMm1vR3ZYTkNmSWlQdkRCbW02VVZGbGdDSFhaNnVHQ3NtTnNPUnRyT0Ji?=
 =?utf-8?B?N0FyU3MyK2s2ZmhuN0FQQ1E3TEowLys4Q1VEVHVjSnYrVnhVREdOLzM1RUZs?=
 =?utf-8?B?SjFSYW9Kdkp2OUZaN3MxaDFHa2ZHUlNyY056OWt3SjU0M3M5cFc1d0NFQy9p?=
 =?utf-8?B?S3lFdFNsdjdoMTRHaUhXYTVkU3Rlb1BxUmJ4M1hYUzdXcG9uWE8yOXJlbE90?=
 =?utf-8?B?ZUVuQnU3b21XT2ttajE1RW5uVkUzTTUrZUJOK1BuOUFNWVM3UWpQbnVSdUZK?=
 =?utf-8?B?eExTb0luOW05aXprSzgrNXBsZHRHdnBuUzMzRU5WcExLbHJBbnMxWmM0Mnk2?=
 =?utf-8?B?NTdEaFIwVnpWS1RDaFltUjZaM1Z2WThXcW5hcHBUdlJwOFNYQ1ZEb0pRQkpN?=
 =?utf-8?B?R0lIS3RSV0N3ZXlnL2dDbWFNWEJzNlFkM0Z4MUM2Nk5lTVAzalhibnpMMUdK?=
 =?utf-8?B?YlBmWVlUelFWY1ZDcW1nNTIxdE5iOHB3K2NEdjZrZjV4QkZqMTlJNEZ5SXlF?=
 =?utf-8?B?SHJQVlg0K3B4Sml2VENKTThwNjBxekNaUFZnNFhaV1JtRUZJRzlxNGFDOFla?=
 =?utf-8?B?ZDhFUHljemlyRXZpaU00NVo3NzhJWTFxbUhDS1I2bVlMaDdIWXdIeEVRemgy?=
 =?utf-8?B?czF6OGVSSHUwZGRnRDI0VG1raGFqcHlGbDNBbmovdnQrU1M1NGRRYkF4MVFs?=
 =?utf-8?B?MHJvcjRTNG9jNFc2ejJEZ1BMUGV3VklBK051S0s3eFArZndTUGpqQlg2cHVR?=
 =?utf-8?B?MTBOa2RvWkpHMWtiV0pVeElMc2I5M1FaY2xnaCtHTzdDdm12ZFVqMjVPaTI3?=
 =?utf-8?Q?W79ZvHDYGdnSarXEAqMObJWr83DqEWn6cGj34=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 09:41:07.8095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eabcbf-b058-491f-ca05-08dce38f81e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465



On 03/10/2024 11:35, oleksii.kurochko@gmail.com wrote:
> 
> 
> On Wed, 2024-10-02 at 15:41 +0200, Michal Orzel wrote:
>>
>>
>> On 30/09/2024 18:39, Oleksii Kurochko wrote:
>>>
>>>
>>> Centralize per-cpu area management to reduce code duplication and
>>> enhance maintainability across architectures.
>>>
>>> The per-cpu area management code, which is largely common among
>>> architectures, is moved to a shared implementation in
>>> xen/common/percpu.c. This change includes:
>>>  * Remove percpu.c from the X86 and Arm architectures.
>>>  * For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS_VAR.
>>>  * Drop the declaration of __per_cpu_offset[] from stubs.c in
>>>    PPC and RISC-V to facilitate the build of the common per-cpu
>>> code.
>>>
>>> No functional changes for x86.
>>>
>>> For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
>>> percpu in the case when system_state != SYS_STATE_suspend.
>> Behaviorwise there is no change for Arm given that none of these
>> actions can be executed.
>> That said, by looking at the code I realized that we never call
>> CPU_REMOVE so it is effectively
>> a dead code.
> There is no change for now but what I mean by this message if one day,
> for example, enable_nonboot_cpus() will be called and park_offline_cpus
> will be enabled/implemented for Arm then CPU_RESUME_FAILED will be
> handled differently in comparison with original Arm code. In original
> Arm code it will do just break but for common code it will do
> free_percpu_area().
> And the similar for CPU_REMOVE if park_offline_cpus is enabled and
> cpu_notifier_call_chain(..., CPU_REMOVE,...) will be called then the
> behaviour of common code will be different from Arm code.
> 
> Do you think it would be better just drop this part of the commit
> message?
> Or would it be better to add:
>   ...(what I wrote before), however, there is no change in behavior for
> Arm at this time.
Yes, this one lgtm.

~Michal

