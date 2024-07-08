Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF492AB3F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 23:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755635.1164047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQvwV-00019I-9f; Mon, 08 Jul 2024 21:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755635.1164047; Mon, 08 Jul 2024 21:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQvwV-000164-6o; Mon, 08 Jul 2024 21:30:39 +0000
Received: by outflank-mailman (input) for mailman id 755635;
 Mon, 08 Jul 2024 21:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulpZ=OI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sQvwT-00015w-A0
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 21:30:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ea07c28-3d71-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 23:30:34 +0200 (CEST)
Received: from SJ0PR03CA0157.namprd03.prod.outlook.com (2603:10b6:a03:338::12)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 21:30:30 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::cb) by SJ0PR03CA0157.outlook.office365.com
 (2603:10b6:a03:338::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 21:30:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 21:30:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 16:30:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 16:30:28 -0500
Received: from [172.27.0.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 8 Jul 2024 16:30:28 -0500
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
X-Inumbo-ID: 4ea07c28-3d71-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxE1mN278XrMHpVs9u9AqjohlK9DGGlguSMgrS5o1WlREsevBaDWuo46CUwj4uIo61WRTeP/9YAzooYIlpGiufFhZUcPeQCqqLz6udIQqW9+0F2uEzrJuzJOsAfQsoizW9Ll95bqWrfglwD8YRJ3aWwvhbzsJORd9CuFM8qKY7/AKdu+KbbNGSIFVgwdgzZqLWZDAizjvRMLkhNDyDTeIVGDq4GkspNzKrn+UNUEuX2rLnH+ShqQSAx3rghG/OA4WfNjtpz25jShW18C380lUDVD4rtRV/EYJXYbgTEWe5r8OadLuU1hqekMzmljOEGq+9P7yIka8HkGJlH6UzAJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnuIbgpYX5bIBH0nPabc2BT+WMN6OrxaG9dA6wsjb9Y=;
 b=Zj/5JLyrrvaWSap+84DphU+jxcnjwF1yJFX9T9fM272Sk4uvX/rzNN7JcZNZa/LZQ9PZToaERJwls4q96N66BEEodFf/0VtHMZJIKbrEdAy1Sp4kYG3QVuhV4B2OmgZv6UtoJXvA/cD4jzdA7rfdc2oDdLQ/OBel75axzijDrgm7HmR5LpUaDWecOHnDLryNEOLhUX62rXz8wG/m+qSytzKyANPH3R8mml5n9/xb/j24lnvkGNN0qblBEu+Aez0kdz8h6lrcxgfgirJhGa11HvdyWY1jvFYm5/QQLpAxyXuS3TEuJywUptjdQI0a+XFMNcR9bnbHyrcG+uYRaVfN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnuIbgpYX5bIBH0nPabc2BT+WMN6OrxaG9dA6wsjb9Y=;
 b=Vl1g8dqHmKeST4+wUHjRmJP8tISqxx+kTXJhwsnChS6qrLeggdzreuXR1JKNb3sblYIW1K+Bgl/vyQDMSuVUqoEcz5PNgibxHH8vL4bU7yZhNmqo12qCIcadwKkXGLqQL1bZlG60nPU4Gccz7meUOnkOPFJ9Xs67Ky33yJJXgSo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
Date: Mon, 8 Jul 2024 17:30:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ea55e9-b6ac-4390-320b-08dc9f9530e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0MxbzFYVFYvdkdob1NUV2NlU0FnNEwyT3dBY25ZVm5JeXptN2pISHpXdkRt?=
 =?utf-8?B?Mk9SaUZ1UXk1cEJRT1M0SnB5Sk9zMms4QWtKR0YrTTh0LzNwRkRqR3JSVXN0?=
 =?utf-8?B?ajZaTnh3c2lwSC9QcUNoNGVSRm9CSG90V0pINEVWamViS2NWTjhCNnlzWG42?=
 =?utf-8?B?aFpZSnFsTmVhWEtQSElkazVhSTA5Y0ltNzJVRVB5MUJtT1Ftd0prYm9UU05T?=
 =?utf-8?B?R1BmZitaOEFUSjRPS3dTcU1ibXNjakRFYm01UndhbmVFbXRLVHJoTFVnUWNo?=
 =?utf-8?B?WmdxQ201WkNvczBwNE5PZGxnOExvemtFVEZ4Q3F4dVppUnh1eGZXK2pob2Ft?=
 =?utf-8?B?a1ZGcGtSaitnSlBYc0VYbXphTlVIbE0welFsYzN5ZVNpQi9uVUxGRE9HVWlm?=
 =?utf-8?B?L0FyL1RUdURaK3dtRHp6dVluUm9ZcWk4UTNkL0RZVHFRTzlBU25zV09KTHQv?=
 =?utf-8?B?WTAwVGNCSUo0d1ViZFhPZ2I2dzFxNWp4TEw3Mnl3QmIzWVNZbjhUbk9FSkp3?=
 =?utf-8?B?d1B5NlFnb2hIVGdIUEdnZnlIT0tqLzlsTFg2YkVmUEVIZzFlVWc1Yi9CWThY?=
 =?utf-8?B?TlNUeXpKdnZSSGlLeUhTdGtpRlRKWVlPb2lranp6Mjl0aXpyaWYxb25IUUdW?=
 =?utf-8?B?YlJ6akVyVnlHcjVMTUxFS04yUFhKR3RacDZkQWhlUU03RkhHbU41eGdneWVK?=
 =?utf-8?B?WmIwVTg3RXhuNFcvOFYreUc5VFNxUlJDNnRaMlZYQXdULzdmZTBaUGlROThV?=
 =?utf-8?B?VGsyMml4TzhtMU9yblcxWWJ3THhJSVNva3Rka1FUWlduUTVtVHpKMFFDNzM2?=
 =?utf-8?B?UkhTcXV5QnZGUUl0Sk1aYXFDcXZRM0tCQTExOE5zYjZYYVRGT21JSXpaQkFx?=
 =?utf-8?B?L0NlaWJHU0lLQnR2d21TK1ZDZVg2RFBjYVpvU0RYQTRZOVFUREVnQ09YOW1K?=
 =?utf-8?B?M01tQ0xYMU1uOXYwMERYVTg4MGUrODdyUGt4STdxYnc2MERDOVZQMEdmd1Ra?=
 =?utf-8?B?NXkrQkZXUGZLS3lTTWw1MGJSWnVPUXNwdDlrdVBYVVZZWXNCZFBBaEV0NjVM?=
 =?utf-8?B?RTNRd1pwZVNLOGhrcWsrRkE2dzZhZnl6am5BK2FnQmxJQ2NpSWZNT2Q2RGI1?=
 =?utf-8?B?OCtUQThXZTFzRGtkb3NmWUhxckNYRHU0dlQyU1ZFeEFWVWxSZERpVlRWaDdY?=
 =?utf-8?B?ZjdRZ2RvNW5rc3F6ekRSMnUyWDJTY2NIWVF0TUx6OXU4RXJUNzY5aUpwYTVK?=
 =?utf-8?B?Tm9hS3paYmp0VFgzd1V6a2dsWUJuZFJDdzBmWjBORm83eXVIZ1d4ZkcrVUJ2?=
 =?utf-8?B?YzVrU2YyOFJWKzhFcGJVU1ZpMDUreWNjKzVIUXNaZTNvY2UyMWhVRWNDdm8r?=
 =?utf-8?B?TCtsTC9GaDdqcFFuK1lrN1lMSUlQNUpoTkVwQnRXNzZ6SUt1d09UR0pPZlFN?=
 =?utf-8?B?ekptUHBCYVNFQUZ4QzkwZjVKKzhiNk1zN0pkYlR0a2VwbU11ejVPMWRVWEJQ?=
 =?utf-8?B?bDIybklLRDJoTEtvb3Y2V0JLelJpM2lhaWtUWHJDQ1ZSb1g4UkxGb1lHMGNj?=
 =?utf-8?B?SkJlRm1KbWNka0ZFdU5xOEdRMFRtTzJFUWpxL2RhdkhCNUY1K1l6YndpMHNE?=
 =?utf-8?B?QkJQQXltdjEwTC9ZUnVvbnlZQ01pamIvZW1wRGJscUhOaUlSSWY5eXdwWS9p?=
 =?utf-8?B?ZDBIZ3VGaFhuczVSVk5ROWZ3TS80U3BHNnB2S3FlZ3JQbHNFZ1NRVXRieldC?=
 =?utf-8?B?YmxldDR5dHJYa1I1Nmk5WW9xSTJvL0NXTU5TY0RwZWc0cGNrRC9LZ0NDL1pC?=
 =?utf-8?B?UFRsSHBIdjVHLzUxUjVYb24yS1RrWmVtKzhQcWc5ZnNiSWxlZG5CQk8xZzUz?=
 =?utf-8?B?KzZ3a2ZTZ0NKRXN4Nmpwd2J6Ym5rNjRZeVhWU0Y1TEtoVGZFM2ZacktDQjli?=
 =?utf-8?Q?ocMQWa4Opxz3BAch65rsOHuTej7ocDgb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:30:29.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ea55e9-b6ac-4390-320b-08dc9f9530e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641

On 2024-07-08 05:12, Jan Beulich wrote:
> On 08.07.2024 11:08, Roger Pau Monné wrote:
>> On Mon, Jul 08, 2024 at 10:37:22AM +0200, Jan Beulich wrote:
>>> On 08.07.2024 10:15, Jürgen Groß wrote:
>>>> I've got an internal report about failures in dom0 when booting with
>>>> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
>>>>
>>>> With some debugging I've found that the UCSI driver seems to fail to
>>>> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
>>>> to being part of the MSI space. The mapping attempt seems to be the
>>>> result of an ACPI call of the UCSI driver:
>>>>
>>>> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
>>>> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
>>>> [   44.575425]  vmap_range_noflush+0x408/0x6f0
>>>> [   44.575438]  __ioremap_caller+0x20d/0x350
>>>> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
>>>> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
>>>> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
>>>> [   44.575474]  acpi_ex_access_region+0x28a/0x510
>>>> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
>>>> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
>>>> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
>>>> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
>>>> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
>>>> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
>>>> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
>>>> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
>>>> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
>>>> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
>>>> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
>>>> [   44.575525]  acpi_evaluate_object+0x167/0x440
>>>> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
>>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>> [   44.575559]  platform_probe+0x48/0x90
>>>> [   44.575567]  really_probe+0xde/0x340
>>>> [   44.575579]  __driver_probe_device+0x78/0x110
>>>> [   44.575581]  driver_probe_device+0x1f/0x90
>>>> [   44.575584]  __driver_attach+0xd2/0x1c0
>>>> [   44.575587]  bus_for_each_dev+0x77/0xc0
>>>> [   44.575590]  bus_add_driver+0x112/0x1f0
>>>> [   44.575593]  driver_register+0x72/0xd0
>>>> [   44.575600]  do_one_initcall+0x48/0x300
>>>> [   44.575607]  do_init_module+0x60/0x220
>>>> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
>>>> [   44.575623]  do_syscall_64+0x82/0x170
>>>> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
>>>> [   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0
>>>> pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073
>>>>
>>>> The pte value of the mmu_update call is 80000000feec2073, which is rejected by
>>>> the hypervisor with -EPERM.
>>>>
>>>> Before diving deep into the UCSI internals, is it possible that the hypervisor
>>>> needs some update (IOW: could it be the mapping attempt should rather be
>>>> honored, as there might be an I/O resources at this position which dom0 needs
>>>> to access for using the related hardware?)
>>>
>>> Adding to Andrew's reply: Is there any BAR in the system covering that address?
>>> Or is it rather ACPI "making up" that address (which would remind me of IO-APIC
>>> space being accessed by certain incarnations of ACPI, resulting in similar
>>> issues)?
>>
>> So you think ACPI is using some kind of backdoor to access the local
>> APIC registers?
> 
> No, I'm wondering if they're trying to access *something*. As it stands we
> don't even know what kind of access is intended; all we know is that they're
> trying to map that page (and maybe adjacent ones).

 From the backtrace, it looks like the immediate case is just trying to 
read a 4-byte version:

 >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
 >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
 >>>> [   44.575550]  ucsi_register+0x24/0xa0
 >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3

int ucsi_register(struct ucsi *ucsi)
{
         int ret;

         ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
                               sizeof(ucsi->version));

->read being ucsi_acpi_read()

However, the driver also appears write to adjacent addresses.

Regards,
Jason

