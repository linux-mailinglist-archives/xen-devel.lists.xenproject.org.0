Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E9CAE609
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 00:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181170.1504263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSkGk-0004WR-Iz; Mon, 08 Dec 2025 23:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181170.1504263; Mon, 08 Dec 2025 23:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSkGk-0004Tg-Fc; Mon, 08 Dec 2025 23:03:50 +0000
Received: by outflank-mailman (input) for mailman id 1181170;
 Mon, 08 Dec 2025 23:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZw+=6O=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vSkGi-0004Ta-W3
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 23:03:49 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 259477da-d48a-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 00:03:46 +0100 (CET)
Received: from DS7PR03CA0123.namprd03.prod.outlook.com (2603:10b6:5:3b4::8) by
 DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 23:03:39 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::77) by DS7PR03CA0123.outlook.office365.com
 (2603:10b6:5:3b4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:03:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:03:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 17:03:37 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 15:03:36 -0800
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
X-Inumbo-ID: 259477da-d48a-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBRoj677RD8BvCj10Ulbh0MPoGIqJod0ZsT66NR5FXUj6V+DekN5v6yRA6IdO0Il73o8cv4Caa+PTpB8Cu7o3SEb2Q8v5ecAP2yhxUWm6xWDYPAf+Om6FHB0HUqOWcaUM617l9c4V/TNAtDceCTcU2+m32xGs04ZAHLoyJWh+UhdEWWzzSarmFcckRr3TC1NQGgoag4MAniuYLQWhr2tOsApqbR9yZ6DqiF5tLDk62/vxxcKO3oi8M/FBWdVgj81vP5uisSgZti7NjrKA1/HhJ87fNGcnaYX4ZbwgXfRhNds1YEVBJXyTQBPmvtmGufFjT2bjLzn0oD9jhxEcqj4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FDVCVnz8hiZwPdl4WPZ705nhjq/Phnvt6CIbBE2xPI=;
 b=HCbb+Thb7cXkAFKqQmvL4hKf54pMp0RapITK2+jq5Vyv1ra7DQe0zy+/+zrcEtKRd7bqx9pRnfSEmNTNcf+xaWJMk1EWHIUqLdYMvvA0mkd7/R4HNCIFtFsap0k9+vyPlszXyXLhnrGjcihVBysVB0QPNm+xsyRExbB67+twQ43RybweHNPVi7YjOWC3eZNTrBNmyPHtWJdgI2v/7zw0dmjE0HzxHTHNMxKd5PjdW+pD1VWPe3b8DfROfoVqbrWEkUXkv/fJ2HPyxlimzx5eUdAMNikOgRp7KZEApNS1iHQ1VvvMfNLOBp56ltjC4Cs+ug2+y68PSGd/vQhe8zLbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FDVCVnz8hiZwPdl4WPZ705nhjq/Phnvt6CIbBE2xPI=;
 b=fPs/qzeLTqMJADavfA5PUS+yaEAgx374fvCjJ8jhg0ruN1WceGfrUWtr9gmhqnE0JOCtasHZ7obQvs6oPUaxuZqVmJzvO6fIZ2/bkv4+tUWStqJvIjRc795o+8lB/Izgd1mfAX8xOlkJgm+1itXkuxfHfmTvcQwpD1VUaowJNDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6df5c899-5c53-4010-b677-bed742b8a805@amd.com>
Date: Mon, 8 Dec 2025 18:03:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <b358254c-1666-49a8-a7c0-c7bed9e9318d@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b358254c-1666-49a8-a7c0-c7bed9e9318d@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e7a75d-dc8e-4f9e-f193-08de36ae0625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkM0U2lvMmxOSmdDdjZoVk5LbUptY0VTbEd1RW1pWS93TXhieG9WYnZDQ2dp?=
 =?utf-8?B?NWlObHVTWlorM3cwV0pJWEQ4MklUbTNvUVR6OUtCVHovQzF2NnlzbHN2WXhY?=
 =?utf-8?B?MEorMTJyR2xrb3lzZlFwTU9NaUtXbFNwTS9mSmx5TlVRdUlIRHZvVkg2aWpC?=
 =?utf-8?B?TlVJbXFqcUJYWmhNN28yU3pXbkNpQm9ZZFZXWTZkOGM2ZTBvS1NJQzJhYUg3?=
 =?utf-8?B?V0FWbHhVWDVNalAxVm1OVlcxT29odXh1RVhORzFVbldkZ3pjbTRIYzE3M1ha?=
 =?utf-8?B?VXRzNGlVRWFpS1U0bVptZlVSbTViZWxGM3ZoY3AvTExDLy93eGhQazU2WUJr?=
 =?utf-8?B?VkNzRkJVWXJTYlhweEI2cjFDamV1TkhpOEVLWHdVMlVwYnhVOWNGMGI5Rm1S?=
 =?utf-8?B?M0k5V3AwdGs1VDRKL05WUE9PQnZoVjBVR0tZMmVnWkxpVDYrMlllT0s0cnVa?=
 =?utf-8?B?ang3aWw2eGRock1TOXp6ZG5SWnJjbTJBUHFDSHhZZkI3ZG9uQkxBUHlDWFpJ?=
 =?utf-8?B?R0k0eS9ab1NkdVNMNTFsK3U3cGlUTDhaMi93TlF2bzA3UlgzcVNzT1IvbFAw?=
 =?utf-8?B?UFAvZW1iWUovSVFQejBCYTFudm9sNEF6YzI1cG1ETXlOSkVsNHd5VjM1b0VS?=
 =?utf-8?B?TGNwYVlyY0JoR3MvbDVxeUhYUFNZYUpZSlBqV28yQXFSRUN5NEJPZnNRbHhI?=
 =?utf-8?B?djArMmVEaDhGbTlNVVk4Ti9NbWpqc21vdjV2WDFXdWd5S29BaHRUKy94ZjJU?=
 =?utf-8?B?S3BzbVZKKzNqdms4NjBST0ZIRXkzUmdFSVVUa2xQSlZCZlRPUGFadE5RTm1L?=
 =?utf-8?B?QWRHeWlKWDR1SUpVdXN3LzQwTDc3SlE1cElQT2NhNEJUYmdsMTJLbkovOW1s?=
 =?utf-8?B?b3EvOC90SEVLcm1pWWZCbzVYdlB2YUNKaVN1QW5OMXhSYXQvcVVhbzVnU2dH?=
 =?utf-8?B?cUZlbEZadklrbW9adTlSN3dmaUF6T0ZSRmJMQnl0cUxpa00vazdNOE14cjNU?=
 =?utf-8?B?VlN1MGJIb2xGeDU2ZnhhZklLeHZ4VWhjZGJPYnN0bGl5SU9UYWJtVjc1Q0J2?=
 =?utf-8?B?bmM3QWFxSHdSK2h5dGswbUVFYWYwQU9oOUpNRUJrVmYyMmRDUEFtSWk4Rlp6?=
 =?utf-8?B?RUpLOVhBNEh5SnAzcnFJWm9hRHVlZGlnMmR1T05CU2c3QStrbEhrQ2YzWGI0?=
 =?utf-8?B?bm1Hd2c1dWtiZ2Jia3phOW9OUk5Hb3hZSzllNkRjVjh2NE5xWk16WE1seXRw?=
 =?utf-8?B?THJrdmVpQUZtdnlTdUZhbENadzkwdVhKMWRIeWlzWDJmRHUrS0FSdW5IQXRL?=
 =?utf-8?B?dXNoWks2b1dDT1RQbGFpR28rcFFocVhjaFIza1NRZ241dHZ1M2F6c3lIeW1T?=
 =?utf-8?B?VkFNUW9RNFczNVhCSWVoaTlnZFdjY0VOQXVxN3Ezbjk4UlB4VGI5dnJVUzF1?=
 =?utf-8?B?OHRGUFM3LzQ5bVhCb3pkSEI5bGJHa2Rldm5QN2prZnhQWmRoWTF1OUtjc0NQ?=
 =?utf-8?B?MFRPOGFjQXhQeWhjOHNLdkpoRDJlSE5oU09FT2w3SFY1Y2N0M2RnbWt6akNj?=
 =?utf-8?B?My8vQ21hbnRRcjRxU0s4bk5QaTNRUENlRUpxY21SZmlBQ0RyNm1sOHZGdlI4?=
 =?utf-8?B?SmNyN1p3enNNcHFYTG10MnF3dlZaZ2Zaa1N3WVZFYkpteis4RjdTNHdzSGJK?=
 =?utf-8?B?VzNnRVJYbHhHYmlBUlZvVXBsdHZEMnRIbzdCWkRhVnZPb2ZGaE12Zmwxa05v?=
 =?utf-8?B?Qm5maVZHMVJpa3p5STFOT21XYzFYa2VvcGErM1ZtOHVpNXkwQW9kNDYyM2pJ?=
 =?utf-8?B?cHBPU3kvcHZyN2wwTUYzNXV0MXJFVDgwbk9qWDlXWVRUU1ZaTXU1TVp0b1du?=
 =?utf-8?B?cjc3WE5hVmtBaGxMbC8zd0FQSGF3YjBWZmMzVEgrckY5UDZtRVczdTRHSWpT?=
 =?utf-8?B?Y2dwM2FzT3BGYU1vMmQ4bFlHa0Z3VFhwbFZ5SFkzSTdpS2xhNWp3ZHc2Z05B?=
 =?utf-8?B?VGs5ajNTTWk2VTA3TGZYeXdNc0MzTldLcEw4TUlZcEEyRWg1OVEwZldKMTgw?=
 =?utf-8?B?ZjNYTjVyb3JEbi8vZlJWYXNFRDIxaGFIK1c5RzV0YXBoZGM4ZE1EZ2Vaakxm?=
 =?utf-8?Q?yF4U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:03:38.7679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e7a75d-dc8e-4f9e-f193-08de36ae0625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

On 2025-12-08 13:45, Grygorii Strashko wrote:
> 
> 
> On 06.12.25 00:28, Jason Andryuk wrote:
>> When linking to create xen-syms, add --gc-sections to garbage collect
>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>
>> We need to add KEEP() to the linker script in assorted places to retain
>> appropriate data - especially the arrays created therein.
>>
>> Something is off though.  In a test where memory_add() is unreachable,
>> it is still included.  I'm not sure, but I am wondering if it's the
>> alternatives somehow keeping a reference to it.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> With --print-gc-sections on defconfig:
>> ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
>> ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
>> ld: removing unused section '.text.bitmap_find_free_region' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.bitmap_release_region' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.domain_has_ioreq_server' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
>> ld: removing unused section '.text.in_atomic' in file 'prelink.o'
>> ld: removing unused section '.text.radix_tree_next_hole' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.radix_tree_prev_hole' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.radix_tree_gang_lookup_slot' in 
>> file 'prelink.o'
>> ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
>> ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
>> ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
>> ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_get_used_size' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_get_total_size' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.xmem_pool_maxalloc' in file 
>> 'prelink.o'
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
>> ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.get_vvmcs_real_safe' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.set_vvmcs_real_safe' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.domain_set_alloc_bitsize' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
>> ld: removing unused section '.text.unset_nmi_callback' in file 
>> 'prelink.o'
>> ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
>> ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
>> ld: removing unused section '.text.xxh64' in file 'prelink.o'
>> ld: removing unused section '.discard' in file 'prelink.o'
>> ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 
>> 'prelink.o'
>> ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 
>> 'prelink.o'
>> ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 
>> 'prelink.o'
>> ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 
>> 'prelink.o'
>> ld: removing unused section '.rodata.play_dead.str1.1' in file 
>> 'prelink.o'
>> ld: removing unused section '.data.rel.ro.local.fetch_type_names' in 
>> file 'prelink.o'
>> ---
>>   xen/arch/x86/Makefile     |  3 +++
>>   xen/arch/x86/xen.lds.S    | 38 +++++++++++++++++++-------------------
>>   xen/include/xen/xen.lds.h | 18 +++++++++---------
>>   3 files changed, 31 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 300cc67407..934c79411a 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -137,18 +137,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>>       $(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>>       $(MAKE) $(build)=$(@D) $(dot-target).0.o
>>       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +          --gc-sections \
>>             $(dot-target).0.o -o $(dot-target).0
>>       $(NM) -pa --format=sysv $(dot-target).0 \
>>           | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>           > $(dot-target).1.S
>>       $(MAKE) $(build)=$(@D) $(dot-target).1.o
>>       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +          --gc-sections \
>>           $(dot-target).1.o -o $(dot-target).1
>>       $(NM) -pa --format=sysv $(dot-target).1 \
>>           | $(objtree)/tools/symbols $(all_symbols) --sysv --sort 
>> $(syms-warn-dup-y) \
>>           > $(dot-target).2.S
>>       $(MAKE) $(build)=$(@D) $(dot-target).2.o
>>       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +          --gc-sections \
> 
> It should work if --gc-sections is used only here - last LD statement.

I think we want to add it to all three.  That way the same operations 
are performed when generating the symbols in the first two rounds of 
linking.  I think that would omit symbols that may get dropped.

Regards,
Jason

