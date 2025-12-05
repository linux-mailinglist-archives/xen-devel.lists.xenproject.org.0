Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2504CA994A
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 00:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179573.1503031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRetz-0004Cb-7c; Fri, 05 Dec 2025 23:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179573.1503031; Fri, 05 Dec 2025 23:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRetz-0004B5-50; Fri, 05 Dec 2025 23:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1179573;
 Fri, 05 Dec 2025 23:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOju=6L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vRety-0004Az-Fa
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 23:07:50 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e75bf2-d22f-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 00:07:48 +0100 (CET)
Received: from PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::19)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 23:07:43 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::9d) by PH7P220CA0048.outlook.office365.com
 (2603:10b6:510:32b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 23:07:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 23:07:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 5 Dec
 2025 17:07:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Dec
 2025 17:07:42 -0600
Received: from [172.25.33.6] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 5 Dec 2025 15:07:40 -0800
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
X-Inumbo-ID: 36e75bf2-d22f-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1kNtrE9Ry1MufJMCOieMbjTgqAQ7cmTQdOgOvXcvW7R47YQCZF5jVfg9akX+iv5yxFsze1PZtVXzkAP982JSktl5z7CmBT789BiLEEazdyJyomvlitx5k39rzqKrnUaMeriu/2kQhBlAHkAdI4+SNGOZrAhKhvj8u6BLRYB1RzKlqiiNzxCOvySZUaXM+26GtcMppKNHAxlFtckuCIYia//GB7+o0VbdqRyHSehsEQVBX8na+FwCbw/VXjRzoY5kMfjg5OlvQV+upXkYgx5Wkq5MA/KxBXcSpnGAwVrJ4ay+/Wx4g0rBLwH+sPUJDZ1FOgWjzNOeU+2Su9TB3pSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6ebwCXfNCS8VnV0ChFq0YkAFKWUMyn5VuP4hjbvdS0=;
 b=auiE+CNSzDc6tgHjqZy2+fOKrSVZvLRsaw1NHAxSCsmUugTPOkTSzzGgu3TQ+H3CqWHnOPs+1cmUrFNhZlfpkEciy/dmn+Mi5NPHsaZnSa07O2qgheTfetys7hB7ZHK4Fy1Y7+IZwGBxXYp79KlKH1Qx7KN3e6CKeR9ZqxrcgWAqbyfXKVAB93oFI4Fuf1H9i5G89QELIVBvE4wDhSyMGhrZ+sW/dm7Vi32w6gOIKflmukmLkxxAGeKjKE6DhDeXgzTe6upAS1U88YrOOj7OznK1X2adSM19CgQUpfP+VzUyA6LcaghjupYjwhVMufiuJkQPHS56rVz6Vllscjwj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6ebwCXfNCS8VnV0ChFq0YkAFKWUMyn5VuP4hjbvdS0=;
 b=jmf5XKzCX5LZ+PhxWK5lcg7UIh5Sn9bZcleGwPyeSJ5VOHQWHr5/+5TvRZOGxP/7F79bfJYPsaACb53i5a9bgGgWa49EuxzYsSgrQZyWedyCGvFFg0xCZa9ZqOPK0N/+zrLn5ZdZGDXgV/BHujpdtAT0AtPSja2A5Iqw7cMNouE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4202e2be-1428-4a3e-b0e5-2a65fa7383fb@amd.com>
Date: Fri, 5 Dec 2025 18:07:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 4359e4b8-5a34-4902-8660-08de3453187c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHR2NzlBTlBOc2tpVUtObU1OeWJOMHpENnR1RWpLN1JNdFFjcHlUVTI3Y29O?=
 =?utf-8?B?NHhzY2wzR1hmNVo2TWtVVGdMdkVoWVF3YVpWY2x1N0VudHJWbWdUdWxIVC9y?=
 =?utf-8?B?NFhBZDhrYThDNytvMDgxUHpsQU9MKy9JeGFVeGtueGRSS3AxTVY0ZEdqV2Ra?=
 =?utf-8?B?THZmWDJEcjhwZG5xb3lBaTM5US8xdXRtMndoaXk1RjFQc1lrWXZ5YWJ4Y3Bo?=
 =?utf-8?B?K3lNTlB1UjQxYWpkU1NwOE9kRTVVbzVPV01HdVVQZTJkV1BqZTBwTzd1QmZH?=
 =?utf-8?B?clRGMXhZUjNlVXBDalllaUExWVJjSkdUc3BsV1ZBQzUzdTB4cHFLWWNzWUNj?=
 =?utf-8?B?REpHNTViUXZOdE56S0JxQmhWZndNSk5VQjlBNVl0UXFSNENTVU13UExxalB0?=
 =?utf-8?B?ZlZLSXNCUlVFQTdQcXY2T0xsa1pBYnQ5RER6aUJBZHlVTFlIYUJYRTh1cVQy?=
 =?utf-8?B?a0VwTVZOL0w4VUJwV29hVVZkUG5zMW9JNklhNkVPVkxERlVQcWtRcXZqaTFr?=
 =?utf-8?B?MnAvMHhyaXlRbktUNFZNbHB3ZlJFb3laSEU4d3RIRWNRYlIzTE14S09zMGZz?=
 =?utf-8?B?Y0hvS0ZBWHNkQ3dWY3VFaHVCTWF2NmVGZmNrZ21sZnJnQkdGZDE1dncvdVB0?=
 =?utf-8?B?WlhiZXUzZXBFRVBWbzJsdmVRTGtjbVR0NVlxNEg3KzhlTE5lWk9PL3R5cXV0?=
 =?utf-8?B?bjhnV0hFY1N0cmVXeGRUZHJEenk5SUJkeWs0QjFNVmNkUFYwTXlvQUhvUTR4?=
 =?utf-8?B?V3VId3k2eEswenJYY2Z1eGw4dGcraFpZUW1sL0cyUXByeEp1SnhFdktyUFQr?=
 =?utf-8?B?Mys1RUR3elo3ckljeFQzTmUzOVhZS0d1ZG1TeTR2U3ZOcGZqRlBic0RWRll1?=
 =?utf-8?B?OHFnUG5YMmM0cU9rWWtTTkZRb3lPVTNVY2VIOUI1R0JDRlFzWlIvQWl6U1NO?=
 =?utf-8?B?QjJXc3E0RU84VXJhVWpNQXpmcjIrWnJuaGpyNmdIQk1HQng2YnVPeGZVL3c5?=
 =?utf-8?B?bmVxdnhBajd5T0NWcW9wZUNPVVUzV1JTM2xWT1Z4elRvSTBxZ3Nsd1oxVFJE?=
 =?utf-8?B?SnkrWXZ2ZlR0RUZETHRJT2MvQ2VqZVlEWG0rT213bUp5TGtIMTlwMVhBU1ps?=
 =?utf-8?B?Z0gvNXhEb0l1ZDRUaElKdzlpZkRndmVlTUlPYnlNRUZmMzk1bkYwV3l2Szgv?=
 =?utf-8?B?S3p1R29JV3ZPanBQaWllK2dDRVJsL3BjVjhDb0JBVHZwV2I4UTlTQ0dFZVVL?=
 =?utf-8?B?ZGQxeGhPWWI2ODhlTXpsSzdzUmJRbjI2Q2lsT1huajlaMmdES05sT21IY1hM?=
 =?utf-8?B?S1ZhSXpMaUdBelA0c1NOWUtYVXpYNmRtUDlLRDRPQmVpSHJubGdoYXVEVHdr?=
 =?utf-8?B?QmVNZllmYXlvN0xmRkZ6d3ZqNWJIRkJjRXBZL0lQQTVpeUhlb0QvYno4Z0hH?=
 =?utf-8?B?aHEzdjFYZm0rTTN5eHJXV0FIZUV2OXhBbVlmTUU0Rm83RFBXRnVDWm1GZUNl?=
 =?utf-8?B?alhpWlY4by9WMENWV0VDa1VxTTIrU1JjeWlNTTZ3Z2JibzVnUk1qZVlKbFNV?=
 =?utf-8?B?K21nN3lBaVc5U25ST1Nza0Q2dU9DZlpCSDB4bm9UT09aRGhRRCtUT2NpRE9i?=
 =?utf-8?B?MmhmaU8ranZUWXJrZHB2TVFWejgxRDgyMmtGQWtkRzJxWTNhWThHVFpuWkhZ?=
 =?utf-8?B?NHVYMkhGT2FlcTZFa0U4cXh6TWc1OFpxVGZmUnliTkFOcTVsWFlzZ2EzcEpG?=
 =?utf-8?B?M0pEaEZpZnlWK2dNbERtMytKVXJWK3dhOWFlNGFVMTRNdjJXeVFxNmczaHBX?=
 =?utf-8?B?cEp1cnBUTXNlM25hTVBGNkE5cXpkM2NuM3BFdytxT0xYME5EMitWb1VSZmQr?=
 =?utf-8?B?a2gwTEpHckt0V0c4MUtiemd5V08vd1dWR1EyR09FTzRib3dtcWRwbE0rTHBy?=
 =?utf-8?B?OVdXR3E2c3JGYitMSjFKVEMyVXJrVWxtQ3E2ZjZYSkYyNW5MRlpkMUZ1aDha?=
 =?utf-8?B?R1pEVkJ0ZWJwZGRTeWtkWks2cFVtTks0T1liQkdhWURzL1h1M0VBUk5ITEJD?=
 =?utf-8?B?U0FFL3ViSFJmcmxhN2J0TFR3VDNtWEhJRitJdHJXZ2dkM3huNiszTFBxOUVP?=
 =?utf-8?Q?mc7E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 23:07:43.0071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4359e4b8-5a34-4902-8660-08de3453187c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637

On 2025-12-05 17:40, Andrew Cooper wrote:
> On 05/12/2025 10:28 pm, Jason Andryuk wrote:
>> When linking to create xen-syms, add --gc-sections to garbage collect
>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>
>> We need to add KEEP() to the linker script in assorted places to retain
>> appropriate data - especially the arrays created therein.
>>
>> Something is off though.  In a test where memory_add() is unreachable,
>> it is still included.  I'm not sure, but I am wondering if it's the
>> alternatives somehow keeping a reference to it.
> 
> Yes, .altinstructions contains relocations against the origin patch
> site, which will cause it to appear to be referenced. The same will be
> happening with a bunch of other sections.
> 
> Hmm.  We are surely not the first people to encounter this.

I didn't find any magic in Linux, but I didn't look too hard.

>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> With --print-gc-sections on defconfig:
>> ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
>> ld: removing unused section '.text.bitmap_find_free_region' in file 'prelink.o'
>> ld: removing unused section '.text.bitmap_release_region' in file 'prelink.o'
>> ld: removing unused section '.text.domain_has_ioreq_server' in file 'prelink.o'
>> ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
>> ld: removing unused section '.text.in_atomic' in file 'prelink.o'
>> ld: removing unused section '.text.radix_tree_next_hole' in file 'prelink.o'
>> ld: removing unused section '.text.radix_tree_prev_hole' in file 'prelink.o'
>> ld: removing unused section '.text.radix_tree_gang_lookup_slot' in file 'prelink.o'
>> ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
>> ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
>> ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
>> ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_get_used_size' in file 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_get_total_size' in file 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_maxalloc' in file 'prelink.o'
>> ld: removing unused section '.text.xlat_start_info' in file 'prelink.o'
>> ld: removing unused section '.text.elf_sym_by_name' in file 'prelink.o'
>> ld: removing unused section '.text.elf_sym_by_index' in file 'prelink.o'
>> ld: removing unused section '.text.elf_get_ptr' in file 'prelink.o'
>> ld: removing unused section '.text.elf_lookup_addr' in file 'prelink.o'
>> ld: removing unused section '.text.serial_vuart_info' in file 'prelink.o'
>> ld: removing unused section '.text.pci_find_next_cap' in file 'prelink.o'
>> ld: removing unused section '.text.free_hvm_irq_dpci' in file 'prelink.o'
>> ld: removing unused section '.text.mce_barrier_init' in file 'prelink.o'
>> ld: removing unused section '.text.mce_barrier_dec' in file 'prelink.o'
>> ld: removing unused section '.text.mce_barrier' in file 'prelink.o'
>> ld: removing unused section '.text.apei_read_mce' in file 'prelink.o'
>> ld: removing unused section '.text.apei_check_mce' in file 'prelink.o'
>> ld: removing unused section '.text.apei_clear_mce' in file 'prelink.o'
>> ld: removing unused section '.text.efi_halt_system' in file 'prelink.o'
>> ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 'prelink.o'
>> ld: removing unused section '.text.get_vvmcs_real_safe' in file 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_real_safe' in file 'prelink.o'
>> ld: removing unused section '.text.domain_set_alloc_bitsize' in file 'prelink.o'
>> ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
>> ld: removing unused section '.text.unset_nmi_callback' in file 'prelink.o'
>> ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
>> ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
>> ld: removing unused section '.text.xxh64' in file 'prelink.o'
>> ld: removing unused section '.discard' in file 'prelink.o'
>> ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 'prelink.o'
>> ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 'prelink.o'
>> ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 'prelink.o'
>> ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 'prelink.o'
>> ld: removing unused section '.rodata.play_dead.str1.1' in file 'prelink.o'
>> ld: removing unused section '.data.rel.ro.local.fetch_type_names' in file 'prelink.o'
> 
> This is for your safety stripped-down build, I'm guessing?

This is actually Xen staging.

> It's certainly a good start.
> 
>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>> index 527872a6db..e3ad58f688 100644
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -98,7 +98,7 @@ SECTIONS
>>   #endif
>>          *(.text.__x86_indirect_thunk_*)
>>   
>> -       *(.fixup)
>> +       KEEP(*(.fixup))
> 
> Why do we need to KEEP() this?  The references here are the other way
> around to most examples.

I thought I saw it dropped when trying to get this working, but it does 
seem to work by removing the KEEP().

Thanks for taking a look.

This implicitly relies on LIVEPATCH to select CC_SPLIT_SECTIONS.  To be 
standalone, X86 can just select CC_SPLIT_SECTIONS unless we want to make 
it optional.

Regards,
Jason

