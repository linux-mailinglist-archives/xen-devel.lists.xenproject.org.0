Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5FB0F540
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054238.1422955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaQs-0007Vj-JY; Wed, 23 Jul 2025 14:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054238.1422955; Wed, 23 Jul 2025 14:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaQs-0007TV-Gr; Wed, 23 Jul 2025 14:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1054238;
 Wed, 23 Jul 2025 14:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueaQr-0007TP-4I
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:26:57 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2406::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c47fb28-67d1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:26:41 +0200 (CEST)
Received: from SA0PR11CA0202.namprd11.prod.outlook.com (2603:10b6:806:1bc::27)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Wed, 23 Jul
 2025 14:26:36 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::d1) by SA0PR11CA0202.outlook.office365.com
 (2603:10b6:806:1bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 14:26:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 14:26:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:26:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:26:36 -0500
Received: from [172.25.61.180] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 09:26:35 -0500
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
X-Inumbo-ID: 0c47fb28-67d1-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFkw3NSHWRc5Z313kTjh3VWDGbskT+ctH6xkP31DM4xmtsCOpPjpLIUHIKxKMyqxXqWPmEj1dY+bZTBTvHZnvjqGV/OBzpGWZJJdGKLAIrxww9TT7Au3B+BtCzZ1YViY59ivaSGnESk30iRihZ8CYE8UBDPmebNgHNxP/lc5Xiv8lBYUKVcl0Hs2ZPCuy53Ya9g3VzL14JmKowBNqhVKZ5QIZ2KbBVT55M6GWcD3TgZVWtjH3HN+JLZR9Q/CPs76x2jNDu2u6MtoJ2xls6cRdIqZWImkdCTXNfysEi0e774qJo5TwH+ZqI+ut8JDXiFeSc4CLttWGfrYXU0BoIhBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMw5ADef5dH1bildCETOHBbbI+SKoAYEdMZ123X6iSE=;
 b=VDsFhM2NQAG0XocoZclKWWiF7jOocmA4wwIFRdE9gWh/SSTCp44s/LNgjGht2qSMH35B/HgLJVynxLnBr9H//7VPq/E4dZt6laWVhRnuE4/bBTve/vRT9X6x7sq3UJJhMhTt9yBKX2pHiecrLvnBx+ZqbM1OGucN+1BXNwzxhixqZcm2ptXYYJm85+X/QhIx0GTKAE+g/vrpbuqM9lGd6wbGs/AdNf64MoRLb4jOH1wO/7fvx6JygA1/u79aJW1lvc8+18Vi7kJrtIFYFgtBGNXiUYxYlKkESpCgrruio+FwC0M07aJDquzLpJ3aZWtVLHFeTgs4eep8txT3wAKGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMw5ADef5dH1bildCETOHBbbI+SKoAYEdMZ123X6iSE=;
 b=mX3rUg8H2mnEXfNgNMkMTZICwqvbj8YEo0AIbezUkUtxJK6LA/gVuEEiCDU7EZ7rLKiL0YAjeRSoXe9TDiK7PgLwKORVGPjYZNboL/yTgLN6dau8csLU6cDf+gk/vN8sswjTIDEGlPhAuQjOUHr6d9xlmBupJ0P7RLXb8WXBY7k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3518a202-c664-4564-b59c-194f954b232e@amd.com>
Date: Wed, 23 Jul 2025 10:26:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0c36b0-100c-431c-6cec-08ddc9f4ee93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDh4M1FCc1Uzd2U5cHVsVm1QTTU0VVJtdmdGbkhKWWk0dms3bzd2YzhVcmdY?=
 =?utf-8?B?a21uWmxvd1I3MkErRG1VcDRnYlo1Q1RqeVdHRVlUT2Zaa1pDUFBNc2VpbUFD?=
 =?utf-8?B?YkNoMHB5aFNFZXVsSTdYR0tiNkEvNjJuNzVpZm85Ynd4dlI3eXpWN3dOZzRx?=
 =?utf-8?B?ZHVBUGFpdmdTbGZNZXBvenEvblAvcHFBUHpEZkNydHhuQWpCU01kVFRkdVVr?=
 =?utf-8?B?Ym9UT2dpcCtqNW8xenFKSmFudkRMKzlDOVlTdFVRQnN4bCtEMlFBaFZTVWRk?=
 =?utf-8?B?dXE3eERjTTNHakxON0RlUVVJRFlQUlByV2NISzk1UGNBbEVvak9uUklRd0pH?=
 =?utf-8?B?aUdLTGdydUd3Zk1sQnJqVWd4NkQ3VHh0c0FkSCtyQkQ3QmcvMFR4SGRtaTR1?=
 =?utf-8?B?MDFPaEdVekdXVVM4VHFzYWV6M3ZQZVpQeVVmeGxwUngzZlVQSk5BOUpZMUlk?=
 =?utf-8?B?RW1TUjRXV1I4RU5FRURDalpsUUxLWnYyVUwrMDNRV1RKaDI5RXpvSmZxVzF6?=
 =?utf-8?B?L1FLaCtwMk5uUzk1ZW1VWlV3NnJ2bjlUWDJVbWQ5SDN3MUVLM2U3UW9ta0Fr?=
 =?utf-8?B?NFJ5Q2VJVlhMWGd5T0ErRlQ2cmQ0a0FieWRTeHRibndndWN0aEZWRWhtZmhu?=
 =?utf-8?B?Mm1sZUkraVdHOVNQZ2JmZ2lia0hRWjlYbVM5WEFrRjRXeE9hZ1hIWi9sQ3RQ?=
 =?utf-8?B?NE5JbXRWYTlwS3QzeEs5M0VGMml4cW4vQ0NmVitDdTc4MmhrVVF6WVh6TVNJ?=
 =?utf-8?B?OVFCU1VCZUVxMVlhVW5ENDJBTmJXVjNrU2dpOVdVdGhhS1FtOHB0U2dSV2M5?=
 =?utf-8?B?Tjl3SXNoMDlPSG55RVpXVGdkL0p4dE4rSUpnWk9RK3hwMnRTMnd5N1kyNWdu?=
 =?utf-8?B?RzY2Mk1TOWFrdGk1eUtySy91aW1aNFdmMGF2cDErTDN3Nm8xRStsT1NxcGEz?=
 =?utf-8?B?c1JFVmFJbzQyK2ZyNkFtcnZQZWZEQkkxY05oT2daSkhXaFFNV2xQcWFwMzhI?=
 =?utf-8?B?L3hleGMrVHY4dmU0S29kZzBqTVdVWUFSaG5qMFoyaG5CcVJhbTdVRXM5M0Vj?=
 =?utf-8?B?WmI2NkNZR1RQaGdmZXlZdFd1T0dRd2JrbHNqbDhSOHhHNTJpSlBMbGRNK2ZE?=
 =?utf-8?B?QlB5aUt6MVV6ZnBEVk5HYlNOZUxNZ0tlNVFKa3R0K1YyM3gra0RUaEFzZVhO?=
 =?utf-8?B?WDFKa2NnVUduSlZnUFpHZUFnSWxtenVHbkJrKzJrQVhDZlNKa3d4eHRGVVdK?=
 =?utf-8?B?MzlvZm1jMlUvT01qSGczaGowSlcwMnlVdzVjQ0pYdDIrQkdOZ2puR0xQRndT?=
 =?utf-8?B?SVU4T0krSGU1cTJpWEdCZlN2NnRaVEFhbkFKdDZ5VWNBS29mejk3dDVDZGNu?=
 =?utf-8?B?N0NtU2s2QWQvWU93M29GNFBVNEd1UVRsQ3pKTHg4dkJrczJSZjQwZ2ljcksx?=
 =?utf-8?B?akVWTFVrbFI5TjVjUHFPekdXZ3huNy96cWtFUXlaOURpK1BrSSs2SjB4QlJN?=
 =?utf-8?B?MXNJaWYwTzNuN0JINDJYVmg3RWdIUEZRUno0ZEVDMVNSLzkvV0Y3MC9SSDhq?=
 =?utf-8?B?cElXVXJFYXlCbGpiMDZDWm9uMklPemRuZUd0UlhCQnpDYXZnR2RqenlYN0p6?=
 =?utf-8?B?T2NSSkpkZ2cyRUh2SG82S3VQQVN2V3Y4NEE2cStlMHE4d3VFRTNTYzFVR0xa?=
 =?utf-8?B?QnFIUUdTdlVRUDdpaFNHZ2U5TzhhbUxyUzZtMVRFTjh3bjhxUjArSWpwb2Fn?=
 =?utf-8?B?WGNYa1NyM2JQSEpibDVJYzMxU21sNmIxNko5SW1TN0lqemhXTVFGU0pDeERI?=
 =?utf-8?B?dWRQMGg0OG1oMFhReXlJbHpDOUtUeS9kV1dLcUUxTmNXZE4rTnBtclc2L2FC?=
 =?utf-8?B?OVVicTVibktrUVFBUHlFMzFkNWVBTjdNQ2U2RE81cVdDWXljREtoTGlIUU9k?=
 =?utf-8?B?TmxZVThkQUZXV1A5cXg3bzk1czE4TlRDQTRaV0l4K21Jby9PVWczMW5QNW1O?=
 =?utf-8?B?MklOK0ZaZ3gvc2NKd1dmNEI0aE1yMEdqbzVoY0J5MEFyTmkwSFNITTBwYnJ3?=
 =?utf-8?Q?qgIPke?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 14:26:36.7669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0c36b0-100c-431c-6cec-08ddc9f4ee93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590

On 7/23/25 06:18, Jan Beulich wrote:
> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -8,6 +8,8 @@ config ARM_64
>>  	depends on !ARM_32
>>  	select 64BIT
>>  	select HAS_FAST_MULTIPLY
>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
> 
> As I just learned, this change (or maybe it was the "select HAS_PCI"
> further down) has exposed the quarantining Kconfig option prompt, which
> (aiui) is entirely meaningless on Arm. IOW I think further adjustments
> are necessary.
> 
> Jan

Not entirely meaningless - the choice between "none" and "basic" still
seems relevant. Just "scratch page" quarantining hasn't been implemented
in any of the Arm iommu drivers.

Perhaps just the IOMMU_QUARANTINE_SCRATCH_PAGE option should be hidden
on Arm (or only exposed on x86)? E.g.:

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 561f9694b2a6..51c54ed530b0 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -90,4 +90,5 @@ choice
 		bool "basic"
 	config IOMMU_QUARANTINE_SCRATCH_PAGE
 		bool "scratch page"
+		depends on X86
 endchoice

