Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5598489DA1A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 15:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702446.1097456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBSf-0000Tg-5f; Tue, 09 Apr 2024 13:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702446.1097456; Tue, 09 Apr 2024 13:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBSf-0000QO-2q; Tue, 09 Apr 2024 13:24:29 +0000
Received: by outflank-mailman (input) for mailman id 702446;
 Tue, 09 Apr 2024 13:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvYF=LO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruBSd-0000QI-Q7
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 13:24:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8647f6-f674-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 15:24:25 +0200 (CEST)
Received: from PH8P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::27)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 13:24:22 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::9) by PH8P222CA0017.outlook.office365.com
 (2603:10b6:510:2d7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Tue, 9 Apr 2024 13:24:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 13:24:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 08:24:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 08:24:17 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Apr 2024 08:24:16 -0500
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
X-Inumbo-ID: 7b8647f6-f674-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5oTzkW0hLRPZU3hMS3DGirVHSKACbOqVCbzRLppCLZ8ZDwWTk1qmJdA8CUf1DMbP8+58CjE3D3PueEQ4hncCNalw+6XDDAuPpY/CZYFKUPVbZYrlYLC9Dz/s/nZ6FrClrURiRYwCufG8+1woSGA7Yxh/HPdJtOsI+mSukqjzL9HuPOGHBT7A+SXD2tPUXN38Ss5dY4D9t33HVwUD2yQEBRFJQK/jU97T8r/A72tRGDYycpyNzgAV2Ey6t2QyIPJId77nKVnF+T7iCO09UUaBAF2MqSOxFzmeQ35sHbHsfgMRNJA1qfz1dteXUWN3enL6BmP/MkyoiTrRymYcaZOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkuXPUZHS3I3sBwcFqAuAeKj5ryb6NvJ4aH2wL+z2yk=;
 b=Nsa9LbETc29YYEyjipFMhkuDGYSTjj5iosKWLzdPQh1X9Ims7WzdToCHdfqr05biKXPN4qQNWadnXL1PNG5yPxWiPPPaU1tfMJExREDlXBPJw0FSBhG9e1XKvdAATV0Htjbi5azFQEPHHaCh6H3vEaIjKTBNZDtHuzd6LO2JCXEnZwBDsi4GeW8gq/xjo2OOfY0YyRNr6NIqwzsyazWoI6hLXiMDT991VJeVoHNsb6a1PO939VMK6FfETrPMnnJEJmrbbT6yTiETgMhbTq+QGzxWioeivEmrCwNc5gF2n8TkSgHugzYpD7SbJo6xywSIIlg8cAdkLZzPOIGzk7Qdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkuXPUZHS3I3sBwcFqAuAeKj5ryb6NvJ4aH2wL+z2yk=;
 b=Kje4Hw2lJd8neV2Sg8agF2Pk468yIdos8lnE90k+uttkSoI3VLUmQLEEPpvc7/Lfq/tuGDg7ZwkCXLemD/4hJtxygG7ZvVQLp7TDxD6PmLjO9LjWh+oIQFOnotJNfWxoIobEgvNXo4qHsXglLFqRiPxUe+oSFmYoSx/9UIiXvlo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ba304e14-64b5-4b18-90c2-c54158b67df8@amd.com>
Date: Tue, 9 Apr 2024 15:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] xen/arm: Introduce a generic way to access
 memory bank structures
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-5-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409114543.3332150-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: ad05e5cc-2fc6-4933-8f05-08dc58985dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNoUHBu5l1vsFHl6+W4GP+PfHX/q/7sYVViOaTlc5HuShz2iKLRzo5q/nQN3Q1828BqVDsPdsgM9NnRt0bX3Rp/eZkg5YIKVZ+d7O07VMrB1E9yjUaNUJDNBqM+qeToHX1VyrVCXndrw1NaCflcRpfHv+nzraniypTI07slzUBw0riR+y/tDQqt8vrmdTxdHsu21gN/IZNP4L4BlqHgW7PRTvN6e/9IBsSM/kygx52a5z+fLH79aj6x4oEjw71PKJgKUig1CBD0TZoXS4Wfn073Q4lxkXF58arpbJ6VeEjfd0thYhG1HKn+cjyZUgbU6e1kDJfvqumut4PzcPgHNWAJEZFUSzpJPdZTKbZQkp5cHgOChXh1ONL5q/NOP16ac0DmlHtMXm2c1URBVYCo6WVHc9uyrtQKox+b7yFyCkD5UTgcjK6aXA1tsV4xcwg/Tws3Ir5vXVxjFUfkAnENvG8KZj3azD/JvbnH4qINDmH+DHR15I0W4doe4/yQsMvi6ahkxJm4WurfaPziCT1aNGkglaaizEoXiF7voLtH4luKCHEJ+FRsSoa1P4VAXN1oN13ONVl2wsYlZL0bFHnthvUYWBqoQGtzMQ+064ZuwPG5aFZuiB8c3CBLRiEN3lW7o3JJkFJhDDra9N4X5P2DaLMla4tSzRa0kIvCdUYHYmrwMGm3NRrG1nQlr5cAAejOSluIjezWeYy+AX6i9upZslNmZG4vS6GUWRwWsh7BAnqf96ivhwnt1rLfCJVwbh8Fq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 13:24:21.3780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad05e5cc-2fc6-4933-8f05-08dc58985dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069

Hi Luca,

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> Currently the 'stuct meminfo' is defining a static defined array of
s/stuct/struct

> 'struct membank' of NR_MEM_BANKS elements, some feature like
s/feature/features

> shared memory don't require such amount of memory allocation but
> might want to reuse existing code to manipulate this kind of
> structure that is just as 'struct meminfo' but less bulky.
> 
> For this reason introduce a generic way to access this kind of
> structure using a new structure 'struct membanks', which implements
> all the fields needed by a structure related to memory banks
> without the need to specify at build time the size of the
> 'struct membank' array, using a flexible array member.
> 
> Modify 'struct meminfo' to implement the field related to the new
> introduced structure, given the change all usage of this structure
> are updated in this way:
>  - code accessing bootinfo.{mem,reserved_mem,acpi} field now uses
>    3 new introduced static inline helpers to access the new field
>    of 'struct meminfo' named 'common'.
>  - code accessing 'struct kernel_info *' member 'mem' now use the
>    new introduced macro 'kernel_info_get_mem(...)' to access the
>    new field of 'struct meminfo' named 'common'.

I would also mention introduction of KERNEL_INFO_INIT, BOOTINFO_INIT that should be used
from now onwards to initialize corresponding structs (.max_banks member).

> 
> Constify pointers where needed.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2:
>  - Fixed typos in commit message and mention flexible array member
>  - Add static assert for struct membanks
>  - use static inline for the kernel_info structure instead of macro
>  - use xzalloc_flex_struct inside make_hypervisor_node instead of
>    xzalloc
>  - Fix trailing backslash style


[...]

> 
> +static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
> +{
> +    return &kinfo->mem.common;
> +}
> +
> +static inline const struct membanks *
> +kernel_info_get_mem_const(const struct kernel_info *kinfo)
I'm not a fan of having 2 helpers named this way. Maybe macro (as in v1) would be better here.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

