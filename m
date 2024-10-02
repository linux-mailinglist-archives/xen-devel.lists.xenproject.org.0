Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E098E4DF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 23:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809035.1221159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6qk-000311-10; Wed, 02 Oct 2024 21:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809035.1221159; Wed, 02 Oct 2024 21:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6qj-0002zV-UP; Wed, 02 Oct 2024 21:25:33 +0000
Received: by outflank-mailman (input) for mailman id 809035;
 Wed, 02 Oct 2024 21:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzV7=Q6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sw6qi-0002zP-UI
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 21:25:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c57126-8104-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 23:25:30 +0200 (CEST)
Received: from DM6PR14CA0053.namprd14.prod.outlook.com (2603:10b6:5:18f::30)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 21:25:24 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:18f:cafe::30) by DM6PR14CA0053.outlook.office365.com
 (2603:10b6:5:18f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15 via Frontend
 Transport; Wed, 2 Oct 2024 21:25:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Wed, 2 Oct 2024 21:25:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 16:25:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 16:25:23 -0500
Received: from [172.24.163.62] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Oct 2024 16:25:23 -0500
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
X-Inumbo-ID: d8c57126-8104-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCRvoQAodFAdKCy8xWEwOOlgxwUX3aO/Cqq68XSVLUGkZ8ZNct0DhDfCtZt0QPaX7F8cN5bnQLg/6U7CTVS9NTbSq1oegI4SYM9qloo6/pyFZcNv1j/YtgxNRCZeM+e3eYxyKnYrLb1nYDxKqTNRCOUqpPvaaKg5MvQ5QyshM5OPuol8V7QmNPOMup/kawApZdU58oyJjAoj/MZpr9Fk++sqesWDKHN3O7iZctLLX0nMZztsITqcDZ8u7ikNlNvrM8nUHEHBRTzWCOGj1aV7euHmxtAE8DHtRRz+sUHe44o05MCv1Z87cl7f5b4u/e2eCMb2MmJb3naRFozC+ZKmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QerY6aZNBZaxaESyMpRmZVmsTez1kpiiUfAtqGL5JY=;
 b=C9rdLLbK57U0r/xMadnTjT+0KVmMo6onRb8jLq19MGMTOlmm58Y/qzHckjEPKIbKoruZ2En7pUxhr3O/hRA9nU/+jX7fOgT0dyN7FhE7cdXD6zGHNGBiUAIsLJOLAFFvpFGOlpWRqcZLdg9ZI/m1zF1bXNNV4fvrpGXLlI/t/taPk8u5PU0lE/R/g3C0bd0oFpVQBYTJato7834Zn+Mg/W4+EymG8NIDxGETJF7ihAvABhRrF8Qdcn0MkixZmTeYnflBa+TaELJZH6kFijHiXjUJRuy6Q12XvbV3CQ7A9N6j9NOrZA+lnF/GkMu7PlIawHZ0ntS/kDzQiocQSZE8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QerY6aZNBZaxaESyMpRmZVmsTez1kpiiUfAtqGL5JY=;
 b=k1aSOwNGTcSRQlPLx5QkOsTDmI4FmtwnZoLM4WjUn5j8K4OBkVT8RZRtg6GCO7rTnBj4ikBE3CH+289N74AiF+CNBxMu46BlMkRMX/VlfOBf+gbJRCbQeiKaQ2klc3d6QynO64P3ZVcBGfw/audThIDcwL1HPpovDloc1hBb0lI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b2b23136-fd57-4bc8-bb80-604cc4da0920@amd.com>
Date: Wed, 2 Oct 2024 17:25:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 4/5] x86/xen: Avoid relocatable quantities in Xen ELF
 notes
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240930071513.909462-7-ardb+git@google.com>
 <20240930071513.909462-11-ardb+git@google.com>
Content-Language: en-US
In-Reply-To: <20240930071513.909462-11-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|MN2PR12MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8823f3-625a-43c9-9141-08dce328ba82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU5mbER5UFBINVJOdUdkNGNFanBDb2p0OWNpVUZ6YTczT2l3YWhrSjlPRnpx?=
 =?utf-8?B?V3FLQ3ExZzc1anU4cytTWDNXbXZMaTVvVEJDSG1VM3QvOVY1UEFKSFlyVmdG?=
 =?utf-8?B?MmtIZkwrZ0ZmN0Y4SmFMdE9yOXJ1d3daVHpHLzVkdkdkY1lBNnRJOGxyL2oy?=
 =?utf-8?B?cFh6WUpMK05ZUDZzWmxLTi82Z0xsS1gzeE5ZbDE3RllWVStFbzBDSW9jOEtM?=
 =?utf-8?B?OFJlYUFCTVE3OVRZUmtDNzJMUkJuZUZodXA5N0tGQnJLUlJ0Y0NXVExMVGsv?=
 =?utf-8?B?THFmeVQwV3FLTi9haWxZSTUwT3V4MEhVMlFoWk5YWDdNaUd5OXcySEtjcENj?=
 =?utf-8?B?aHZ1VFlLd3F4T0phUkwrUVNuN296Tk5lRFJyVE9vdm5adTZEZFVEais3UzNI?=
 =?utf-8?B?N2dqMjVYNCtVWmJlbU1CZ3I0bHV4Z2JtSUUrakFZU1VHdlEyT09GK0JUaVlo?=
 =?utf-8?B?OVJ1RWM3aEVmTks3Nm5qL2Jla2phSUV2RDlSYVE1YUNUN3gwSlBkWklML3Ni?=
 =?utf-8?B?dzJPNnpHSFdYMUM0cUVsY21CVWVqS1QzNzVXa1N4dDNhdlkvd3Bja2t0M0g5?=
 =?utf-8?B?YjVqZm1tWVZiMjFLRUR6dUlrdHdKMTFNZkhYWDVDblZiNlhEdXhUWmVRaHNW?=
 =?utf-8?B?bGRuUWRCbXFUK2gvWDNsUXMyZ0NBU09DVkZWTjdOK2MrL3kwaVpPWVRueFRl?=
 =?utf-8?B?WHIyU0FYdHVPL3NJTS9GRFhaWmtQTFAwM296RkNyenRqNDJVMm4yTVFqMXBl?=
 =?utf-8?B?ekhMWW92YmUwTUFmQkY5UytDMVN0NTRwTjdmMkVzM25OajdYSWVySm1WcnBY?=
 =?utf-8?B?N2FMdnpPei9GbFBkMVlxejBKMENtOTAvdHRlTlVjdTF1aWl5RFlOaG1mZkxI?=
 =?utf-8?B?cktqNjJZeVRDQzJ0QzFPb0RwZlRMU2xSbWxBN1phNnV4UXM4OE5BdXR5ZHJX?=
 =?utf-8?B?RTNOUmJxTXFjTXZnS0JiRkMwZVlaUE15OWR5WTZGaFBVTFlXZXpWdE5LTUVW?=
 =?utf-8?B?SUg3OFF1SEcxc2NCekFIQzNNaTFVNmhRVGdsQjZYcjlTaGVEVE93ZlArWVdU?=
 =?utf-8?B?aGhPVkZsbDVvNjZsL044bDRQV04vRXNWZDdwNjlFcFFFdWhYU0RzZm12d1Vr?=
 =?utf-8?B?SWNGMkI0RENpRlJ4cDdWOUxFZ1p2bHlIZ2d5K29wR2I0cFY2UVFXc1pIOVJJ?=
 =?utf-8?B?RlBKV1JJU2lGRno0MFFnVzJqTDlrNHlYZTllL2xyOUZOcktFNTBXZWRwRTBT?=
 =?utf-8?B?eHNOQTVVbkprLy9senhtcmNSdmRaamdKM0ErcTBKQ3pmMWk5ZE16SVMzWTQz?=
 =?utf-8?B?RFc5L3VGL2IvTXVqa3NvelZnQmp3SGpQblFwVGJrWHNWcExWME0yelFuZXNK?=
 =?utf-8?B?K2N4S2g2MUMxTUphTXNpa2xHa0tkOEIyLzYzQ3k5VWRoeld5L00zTFhuYzkv?=
 =?utf-8?B?S2RRb3VWYS9NYU93cWdjYmdkd2VlNndudVBDZ3pIUzRFUjRCeFJtSzdSVWpK?=
 =?utf-8?B?a0M2bzNFWlZ4dGdEaFNxVU1zQWNpM2tzNWhrcWdBelgwUE1CblhxWm9LMVNW?=
 =?utf-8?B?WFB6Q1RNaWVSUGx0WHhneVA5N2tEYlV2eis2dHQ4T3Q2aGxBM1B1bVJ2Vk9K?=
 =?utf-8?B?TEdCYlJiSlE1Y05TU0RURnNzdTk0aVdnYjBjbjdadWZBM1BvekVhWlhzRW5i?=
 =?utf-8?B?dHhSNXdUbURkOVB3TmJjK2JxcDJFdlZoenZFbFR3Y013c01ubVc4TnpmVDZq?=
 =?utf-8?B?T0Vmc1pML2xFcU1ZbTF3NElzVFVKWUVLMDNLaGdXcWRXMEs3dnRhR3ZZNHN3?=
 =?utf-8?B?T01GbzF1cFFiZWRkU2hzRjBkYzJqWTRYWVVaQm05cWtKbkM4T2dWZ3JWZ3VL?=
 =?utf-8?Q?6QVflFtCiABkM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 21:25:24.5365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8823f3-625a-43c9-9141-08dce328ba82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238

On 2024-09-30 03:15, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Xen puts virtual and physical addresses into ELF notes that are treated
> by the linker as relocatable by default. Doing so is not only pointless,
> given that the ELF notes are only intended for consumption by Xen before
> the kernel boots. It is also a KASLR leak, given that the kernel's ELF
> notes are exposed via the world readable /sys/kernel/notes.
> 
> So emit these constants in a way that prevents the linker from marking
> them as relocatable. This involves place-relative relocations (which
> subtract their own virtual address from the symbol value) and linker
> provided absolute symbols that add the address of the place to the
> desired value.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Tested-by: Jason Andryuk <jason.andryuk@amd.com>

The generated values look ok.

> ---
>   arch/x86/kernel/vmlinux.lds.S | 13 +++++++++++++
>   arch/x86/platform/pvh/head.S  |  6 +++---
>   arch/x86/tools/relocs.c       |  1 +
>   arch/x86/xen/xen-head.S       |  6 ++++--
>   4 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 6726be89b7a6..2b7c8c14c6fd 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -527,3 +527,16 @@ INIT_PER_CPU(irq_stack_backing_store);
>   #endif
>   
>   #endif /* CONFIG_X86_64 */
> +
> +#ifdef CONFIG_XEN
> +#ifdef CONFIG_XEN_PV
> +xen_elfnote_entry_offset =
> +	ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
> +#endif
> +xen_elfnote_hypercall_page_offset =
> +	ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
> +#endif
> +#ifdef CONFIG_PVH
> +xen_elfnote_phys32_entry_offset =
> +	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
> +#endif

It seems to me, these aren't really offsets, but instead an address + value.

> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index 7ca51a4da217..2b0d887e0872 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S

> @@ -300,5 +300,5 @@ SYM_DATA_END(pvh_level2_kernel_pgt)
>   		     .long KERNEL_IMAGE_SIZE - 1)
>   #endif
>   
> -	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
> -	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
> +	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
> +		xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_offset - .)

So here you have `address + value - address` to put the desired value in 
the elf note?

Regards,
Jason

