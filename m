Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F78B681A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 04:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714465.1115715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1df0-0007nC-1P; Tue, 30 Apr 2024 02:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714465.1115715; Tue, 30 Apr 2024 02:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1dez-0007kN-U1; Tue, 30 Apr 2024 02:56:01 +0000
Received: by outflank-mailman (input) for mailman id 714465;
 Tue, 30 Apr 2024 02:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2uD=MD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1dey-0007kG-F8
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 02:56:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8951a1-069d-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 04:55:59 +0200 (CEST)
Received: from BN9PR03CA0478.namprd03.prod.outlook.com (2603:10b6:408:139::33)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 02:55:56 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::ca) by BN9PR03CA0478.outlook.office365.com
 (2603:10b6:408:139::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31 via Frontend
 Transport; Tue, 30 Apr 2024 02:55:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 30 Apr 2024 02:55:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 21:55:55 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 21:55:53 -0500
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
X-Inumbo-ID: 2b8951a1-069d-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKVaBwEQdSWzUJOrImdl9y2lIISMkdodBFrhxnVaOqkNmLF58Umaw+H4gSWLGIATP4xuAkxhD1FpOhbZXmyazOa9cW7tT32Pg+YyvugipfELAZ5lhaWo8b7maHDu4rdmHWe8fjksKWvw0HaEbH57BXb6F47i8Tj+6uOCfXZa7jiNrot8++XwytUe8rWNNiiPWCZKYGQNbK1LAN3OzWqw7WTCl8cNT4ie8UPRMMi7pWePCFvqdWS0Cl91ixfpC0teBTe0WOMny2DJQdRZcLmreIFnoEcHosvhQtoIv9UQetdhYvcwENZ3Guohz5DTtPhtExCG2b1kNjkNNDenEYPP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiUZ566o71AWf48GjiUhT6KI92J4Np8zhQZm55hR4ek=;
 b=oBJ02O84wBIKF6YubxOWbDvqA9LYCQhgSABx/vzPT+MId0DlbEKImmw7oR2Q1sa74+H/QdsuvKPY4daCkV0qccyQEc/R5tF/Mf3SkbI7PQJpbJ0Z719qHCBeHJHfNE06FhhihEx1+0AFMRYXZcTZJyZfmGM72Z6pryCgPpZq9B6VnCUUbi1AFGKUA0HKSYq+q+NfUXy1ow4GTrnL2vvm48OG9tHEbJY+SIJS3TWsteSQi61Prd5s4RHKDJQhm0QcWKlzBU6zM1mhRpFeTIrCsYoNhJV1hjuYfsZ1OYIgykI8IbyRoGkf9DCikId00iEJ/ajQ3rTIE0/qnqqZ4yiMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiUZ566o71AWf48GjiUhT6KI92J4Np8zhQZm55hR4ek=;
 b=HXZHLUgkXeWZpmOTQqwqlzoTw8mUjmK1DTpSkeSDkWXiQrQb4YgGoXdSCQKpiWQHCIu588VQgTBT2PH45zkKbbEW7PZxRYFgfNUVuuuMNcwtKbohrhxymkZl8qsCIfnezPSKsL+s0CLI0ZeQvJIztLVhFYqTFPmw/BGAdi0NVqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03357204-0308-46a2-a215-142d681d2b6a@amd.com>
Date: Tue, 30 Apr 2024 10:55:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for
 Dom0less DomUs from hypervisor
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Alec
 Kwapis" <alec.kwapis@medtronic.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-2-xin.wang2@amd.com>
 <ee507cf7-b5e8-4141-85b6-c81955bcc348@apertussolutions.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <ee507cf7-b5e8-4141-85b6-c81955bcc348@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: e88bd28e-bf3b-4894-b36d-08dc68c10e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400014|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9GR0hBU3hUYTlZbzQ1R0hKVzgveWQwU2o0TzdqdFUzbUhTcDJlem40RWs5?=
 =?utf-8?B?eDVVWEhpb0FjZm84WHp2RG5QVmR5d1hZL3hadHJRZDkxTEdnRG5tT2Z6T1Ix?=
 =?utf-8?B?b25Gbk1hYjJyd1BqbGgxWmwyWnFpUnFIN3NTL3JZNllBdTAvdzI5OGR2Lytt?=
 =?utf-8?B?R213Z3lPRnE1VlcyVzYvdllDaGYvd3VHZzBLaWRWbWs3UG5GOHViSnlmN3d0?=
 =?utf-8?B?bGRleE0yWEM1Z0ppS2FKVm9teGQ5UFpra1Erdy80YWU1U0x2ZlpHRVVTbzls?=
 =?utf-8?B?Q3VVQ2hFRzg2NnIvWGhyZENBanVJUTZVd0FCQWMzUUJPNHpBcklKeDluYUZZ?=
 =?utf-8?B?WUdXRllPa3V2bUdEL3VqRTFVbmJTTkZHZThlWEQ4K3A5US9XWkdaZFhYRng2?=
 =?utf-8?B?czFUbEtqb005Rlk1SE4xaU5ZRmpFajJzb2JMaElkOUZEMThVRzBNbHBkUVNq?=
 =?utf-8?B?bjVuQnVBY0tNSXkwM2NnbHhuVW04L29sUjhrK0psazVETHdEVTBrb0NEM210?=
 =?utf-8?B?akZWZnpRak92VUM1cSt4Qk1uRUl1TjlwVGxQeFUwTWczUGcwTjRRUDhwSExB?=
 =?utf-8?B?SVByTTlOREtlWENLMndndTdUUUtjZG5VMFJRV0lwL2UvSWhLMDVNWnlKR3l3?=
 =?utf-8?B?QzdYU1FKV0pzSEdCYUZyMUlUV2oxR2ZBZ2ZqNEtRQmtndnhZNytGdUR2TlNN?=
 =?utf-8?B?NG9yMkM5UEthQ2R3Qlk5V3FnTDA3VVExaFJGWnlxSndNQkJYSEY3cmlwUkV1?=
 =?utf-8?B?a2lBeU5mK1FxQUNQcG83SFduS2hremJMdnNlcTlrRTNRQ2l2VmRmRTBhMWN1?=
 =?utf-8?B?TjV4b2c4SXhEQTRRNUt4U3R2cHcyQ3k5c2pzaUdhdURNejZSdXJtWWUxcDJX?=
 =?utf-8?B?eDlqZEhxNnJvL1loVEtBUnlHNldBaEY5and1Y2NJQU1QZ1VDOWd5czRJalNy?=
 =?utf-8?B?THZGNlJUdEd2azdaaEtJR0pyUG9HYW9uMUo4NGxDL01GU2JEOEVyMHZKNlZx?=
 =?utf-8?B?L1ladTNZTWh6RGNpbTYrRDV3NzFQOVlhbXZEaUJxZ3ZBbHVoUlNGQkRIZ1Zt?=
 =?utf-8?B?QWN4QnN1UTFpdU9RUU50S3FOY0gxbFM1Uzk1aEN5cVk3WW12NlRGZVpLTUNk?=
 =?utf-8?B?OUlLaGJQQ1BYcC9HTlAwK282Qm8yNmx6ODNqYlJxdFZDWWxZS0VlYTlpVk4r?=
 =?utf-8?B?WVhMckVKL2xycWdOL1NuOVd4emgyS1lPazBwZkZDL3cxcjhJdmtlakwrNDR4?=
 =?utf-8?B?bWZGbzlUZTZScitLN1lKZGpMa1cwZlp5cUNVMXd0V0dNMHBsVkphTldJMjNP?=
 =?utf-8?B?MThOd0xiTytZM1JaOHdWby83MGJHUW1DS0VaVXNSVXU3N2cvSEpLNjdkMkdG?=
 =?utf-8?B?b0hqTFNFR0VyVThrRnZtYmU2MWxuNEpqWGhGekZINjV2M0hGT1pQR0ExNmFj?=
 =?utf-8?B?MTMvNUtBUWF5akpFY3lhYS9ST2ZEOGVwU3I1K1h1Ullkd2NLUFp6SnZoa01v?=
 =?utf-8?B?YXU5bkJmb08rU053Y3NSZHpLcFVIZVJOK3YxVjI3bFJCdjdLd1BBVjdEVVFu?=
 =?utf-8?B?WGdkNDBqbE9uZWJMN2dVREhtNmJISFB5dllGdjFhLzZYdTFPRG4ycm1jZ1VC?=
 =?utf-8?B?ejJkekFIOWJoYXdST01nanRCNkluZkRqb05Bd0RoTlZqMkFDVVdDMGtXQ2Z2?=
 =?utf-8?B?b3F0aXN2K1hFMzZ3ckp6cjVlaHRhZytTYU14ZlBjNTA0NkEwUWh5L0YyUm90?=
 =?utf-8?B?Tkc1eHUxNFc1N0NwTFk4ZXJxNTNJVnVGWkRNcFNrZy9ld1pjQXpZMXhCV1Fi?=
 =?utf-8?B?d1BhVkVsSkNGREpoTnFWVExpTlVIOGhFN2o0Vzgvcm10eVgveVZ1VExyYlds?=
 =?utf-8?Q?X6Pxcg9WDfcyY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 02:55:55.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88bd28e-bf3b-4894-b36d-08dc68c10e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065

Hi Daniel,

On 4/30/2024 8:27 AM, Daniel P. Smith wrote:
> On 4/25/24 23:14, Henry Wang wrote:
>> There are use cases (for example using the PV driver) in Dom0less
>> setup that require Dom0less DomUs start immediately with Dom0, but
>> initialize XenStore later after Dom0's successful boot and call to
>> the init-dom0less application.
>>
>> An error message can seen from the init-dom0less application on
>> 1:1 direct-mapped domains:
>> ```
>> Allocating magic pages
>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>> Error on alloc magic pages
>> ```
>> This is because currently the magic pages for Dom0less DomUs are
>> populated by the init-dom0less app through populate_physmap(), and
>> populate_physmap() automatically assumes gfn == mfn for 1:1 direct
>> mapped domains. This cannot be true for the magic pages that are
>> allocated later from the init-dom0less application executed in Dom0.
>> For domain using statically allocated memory but not 1:1 direct-mapped,
>> similar error "failed to retrieve a reserved page" can be seen as the
>> reserved memory list is empty at that time.
>>
>> To solve above issue, this commit allocates the magic pages for
>> Dom0less DomUs at the domain construction time. The base address/PFN
>> of the magic page region will be noted and communicated to the
>> init-dom0less application in Dom0.
>
> Might I suggest we not refer to these as magic pages? I would consider 
> them as hypervisor reserved pages for the VM to have access to virtual 
> platform capabilities. We may see this expand in the future for some 
> unforeseen, new capability.

I think magic page is a specific terminology to refer to these pages, 
see alloc_magic_pages() for both x86 and Arm. I will reword the last 
paragraph of the commit message to refer them as "hypervisor reserved 
pages (currently used as magic pages on Arm)" if this sounds good to you.

Kind regards,
Henry



