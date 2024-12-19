Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418079F776A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860881.1272860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOC0C-0007MU-4z; Thu, 19 Dec 2024 08:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860881.1272860; Thu, 19 Dec 2024 08:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOC0C-0007K0-1S; Thu, 19 Dec 2024 08:35:24 +0000
Received: by outflank-mailman (input) for mailman id 860881;
 Thu, 19 Dec 2024 08:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QrUY=TM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOC0A-0007Ju-H8
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:35:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2416::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e1dceda-bde4-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:35:21 +0100 (CET)
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 08:35:15 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::e3) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 08:35:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.6 via Frontend Transport; Thu, 19 Dec 2024 08:35:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 02:35:14 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 02:35:13 -0600
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
X-Inumbo-ID: 2e1dceda-bde4-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEzPW8oj0xkJAK6mCQemGJeyECyXX20k8zPcvDOsC4mqRVk3u7mSsjFmPMbrrkuu++XEBtJOMuO+X7LPh7hAbYFuGRmqb+OiuxOmW6QQS6qBCAynogbJdNAs94nNic5DtDoIow4UqsQSSLAlf5xFbVdTqsqCYQEpfWg7TzEy0YT7+HccC9336ymUkRvJ57XXFMZtFjd5ftsJ8OEDiR9CDoMa2GmBxJEJjuLNTG2fZ5m2IHy6n4PFPJ11ahKvfYIdr/sDBFRRCyOLGT3i9fPYTfCD51DMZj7inlXrVuQ4XW2ZmqAUy+rJYcZl9OXeJpPHfV8QiZgoXmH7xDul7AUFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAHrhjbA8ZxstVIvrjFVnAQVN2BasfbOEDxo27On6Lg=;
 b=idnMo1f8u/tskpTyLQRiMZh9C0dCfRXvBYjP2je9dBgtv47kR5n+pVb66RkwbI9cG1qfMLrJgEoY/khpNPbogbESwyOk8qZEJXHO6rFBeH7wnYUZbWjwyZkCVQwa0MLhQAyd000gZSHMMK6QO1XHu4e/1fnxSQ+RudatNkdKn4HfIWRT4J2GGkLxLu+xF9or82Ifee1rhwRr8LgqCsYAABz8odUXXc9emMFJyKDVoXeJIm4uwmclX6VevgadRIP0dTaSXbvpK6RxYn6sWK9RkU+LlveHQtJtATCd3FE8bi0TMoQzw0xV6c1N0WdneESWSoklOeDGOaun100IpgmtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAHrhjbA8ZxstVIvrjFVnAQVN2BasfbOEDxo27On6Lg=;
 b=zkW7P4WmvTCEgzw3i9LqXYTgR3zaoQMpr0HV/CGwcE2O9FO+KDsvaEX52Nu3vbZtLefWGqhaRWjEFPJP6kVUJZKEAt8V6PWvPWNDqvqwupWRPrslyMv+xndMin3Niau+3fpUyliiOtgMocniRUXKW4ynnUOUVOPntx8m0UKllKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <87aad119-a55e-4683-824c-606f681af60c@amd.com>
Date: Thu, 19 Dec 2024 09:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
 <60d4ac08-c5e8-4a38-bfc9-2b73e6cf5ec7@amd.com>
 <b8ae100a-4ee9-4351-9f60-0cd961810af2@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b8ae100a-4ee9-4351-9f60-0cd961810af2@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6c8940-fbe7-4954-23bd-08dd20080fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUgrWVNUclREcSthd0dlWFBXWjNIb3B1WndTaEh4Smk3a29QbGpweUwxNkxG?=
 =?utf-8?B?NWhVUG9ZMGErNm1SVXc4d3RkREFycys2UGdrRWxTM1hjU21pVlA2TUJHdVRE?=
 =?utf-8?B?cTBCMU1FYXhvc0w0bWpiTjQyOGxzc3FqNHQ3REpGU1Q3cng0cllqanFUZHA5?=
 =?utf-8?B?MWxhWG1Pdko3TnRTR0QvM1lkOFlHZmZpUnZhc1l5c0UvUytHYzlPSTF6NXNa?=
 =?utf-8?B?b1dZbHVSUit0ZDl4TGxjdkVQeWUxaHRmOEhBZnZiRkI5b09NU0JwTGhyeUNj?=
 =?utf-8?B?c245ZkYyUUJnVmhoNzg5TkVzMWtEb0xNTUNjaTloN3duNEVkenJYenJLeVkr?=
 =?utf-8?B?dVU5aHlqL1VXL1kvandUS25PYTkrS2VlRS91ZEdaSnF4N1NWQ3Y1QkFiZGhj?=
 =?utf-8?B?aWpnWWU3QUZLZjk2SE5MZkVvY052T2g1WU05cjFBbHNwR0kvT2FvM1RzZjZt?=
 =?utf-8?B?ZWxjdDRKcW81dXFoZXlWeGJ6RjNuVXRFcWJxL2ZMbGlnRFBjRGJZSFQwdmNl?=
 =?utf-8?B?cW5TUGpsVVUvTVZoYXZDMkhVS3gyK2pvbVZnemkvcllGRmhBelNxU01pUVA0?=
 =?utf-8?B?NmpXaGtZWENCRCtZNllWelVzVWNydXI4cDFnK1Via2NCa24weWNNR1FHNFR5?=
 =?utf-8?B?Q3EwMGR5NE8yQTFoYkxwYkI4V0pqUXlwMVl4dFM5anlnNFZFQXk1eUdhbUpn?=
 =?utf-8?B?TTZ6SS8vWXV5WCtSUnh2SEdNeU9PeUJIT2tUZVpaajMzS3E2TTNoRGFPeDhm?=
 =?utf-8?B?c3lpZWs2eGE3MTFPZDZManNTMkp5TUFNak10NUFiU1V3MUxnSlFtUkl6cDZS?=
 =?utf-8?B?eTNDS1NneUxseU9mRHc3RjkwV3pxN2VhbnBNcERqeElEZHpEZjJVdmkrMkpo?=
 =?utf-8?B?VjFTeVFMU0F5b2FMZDdLOGw2emtsSEdaUldyRUowWDJ3Lzk5VjQ2aGZOL0pI?=
 =?utf-8?B?dVBCN1dFbGtsdFlkWElTenlYSEZQWmVsQ2xRaWdUNlh0UlYyRTduQ0dlTmRB?=
 =?utf-8?B?QTRJKzVNaTQrVWIvOXdIbmwrZUVha0t4ME5ZSTNON0JtTTFUU3RRSDVDSmhm?=
 =?utf-8?B?QStXbkEwVEg0QVlZR3A2dGhuV0Foaml3MnlMYUtlbE5NaEN1LzVOSmtZWHd3?=
 =?utf-8?B?OFhOamthbzYrL2JXZXNJYjQ2MnhMOERPdlNhWnVaZDNQSzcyZmxuS1BEa3FF?=
 =?utf-8?B?eEFnaHg5VWVDR2VIRzh3bks1bDZYQmp5bTRRRS9Manl4TkZEdGZOcHZVUUN5?=
 =?utf-8?B?ckVkaEdVSlBmMTVyc25HWEZMa2xLaFhPMWFQMHJGQXRqRVdibm5yU21GNURo?=
 =?utf-8?B?R3RYbGxQblZteGlHSTRCOUE3UVJpOFUwYjBTN3lDci9JdzFSM01XQVJobUpU?=
 =?utf-8?B?UThHL01EajZXOTdDQStEOWNHS0JrKzRhNlNEL21qTE1vYkZwRXhwYk93dTBR?=
 =?utf-8?B?T0tkNWRXUEw1bzd3eWlWNTdQSjd3QkFFY1BtUjJJalQ0QlJnZlJ5MmZ6UlF4?=
 =?utf-8?B?ZE02VjFrK0lCM1diK29QRGFtRkVtV2FtSHVXNzBjZGt2ZThuN3dVenF2MXFJ?=
 =?utf-8?B?S2k5RWhYeEhaY1dKNGFROVBsaFRkSWE1dmVTK1Q1NzJrN05sRkh1Ty9EOGFp?=
 =?utf-8?B?VlBSS2owcHlYbksxNkN1MlZKOTJYYnoxSnYvNjhJeGdUQlVZazY0dm5JemVi?=
 =?utf-8?B?NjBXbHA0NkpZYXRWZGkvcUMwam9wU2RVU2huYWNOaWpzcTVTbmRqbE9Pai9O?=
 =?utf-8?B?Y0tQMm1MbDNCTk53d211dUdOQ0ZXL3NkOEVnem5MRmZEZUxxUWFpMWlQUkcv?=
 =?utf-8?B?QmJzWDR0NDY5UXJPK1lFZ2E2ZkF2ZG9aVWNOWDUxM3hra1BQaVptcWhZQnQw?=
 =?utf-8?B?ZEZHYno2bkQ5NnlJVDZjME1QdDNUbVlYNThZelBTODB4clF6VENIbmZhV3hJ?=
 =?utf-8?B?eTBuaXdlOFhRTzVtcmlETk4zY2dDRzU3QnNYQ2JJb1BYVktvZFNGNDhVbEx0?=
 =?utf-8?Q?sw1H5CdOqgz7tFZlU8mRJLAcm4HNl8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 08:35:15.3831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6c8940-fbe7-4954-23bd-08dd20080fdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216



On 18/12/2024 15:58, Andrei Cherechesu wrote:
> 
> 
> Hi Michal,
> 
> Thank you for the review.
> 
> On 18/12/2024 16:26, Michal Orzel wrote:
>>
>> On 18/12/2024 11:11, Andrei Cherechesu (OSS) wrote:
>>>
>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>
>>> Introduce the SCMI-SMC layer to have some basic degree of
>>> awareness about SCMI calls that are based on the ARM System
>>> Control and Management Interface (SCMI) specification (DEN0056E).
>>>
>>> The SCMI specification includes various protocols for managing
>>> system-level resources, such as: clocks, pins, reset, system power,
>>> power domains, performance domains, etc. The clients are named
>>> "SCMI agents" and the server is named "SCMI platform".
>>>
>>> Only support the shared-memory based transport with SMCs as
>>> the doorbell mechanism for notifying the platform. Also, this
>>> implementation only handles the "arm,scmi-smc" compatible,
>>> requiring the following properties:
>>>         - "arm,smc-id" (unique SMC ID)
>>>         - "shmem" (one or more phandles pointing to shmem zones
>>>         for each channel)
>>>
>>> The initialization is done as initcall, since we need
>>> SMCs, and PSCI should already probe EL3 FW for SMCCC support.
>>> If no "arm,scmi-smc" compatible node is found in the host
>>> DT, the initialization fails silently, as it's not mandatory.
>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>> are not validated, as the SMC calls are only passed through
>>> to EL3 FW if coming from the hardware domain.
>>>
>>> Create a new 'firmware' folder to keep the SCMI code separate
>>> from the generic ARM code.
>>>
>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>>  xen/arch/arm/Kconfig                         |   2 +
>>>  xen/arch/arm/Makefile                        |   1 +
>>>  xen/arch/arm/firmware/Kconfig                |  13 ++
>>>  xen/arch/arm/firmware/Makefile               |   1 +
>>>  xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
>>>  xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
>>>  6 files changed, 229 insertions(+)
>>>  create mode 100644 xen/arch/arm/firmware/Kconfig
>>>  create mode 100644 xen/arch/arm/firmware/Makefile
>>>  create mode 100644 xen/arch/arm/firmware/scmi-smc.c
>>>  create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 604aba4996..23dc7162a7 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -271,6 +271,8 @@ config PARTIAL_EMULATION
>>>           not been emulated to their complete functionality. Enabling this might
>>>           result in unwanted/non-spec compliant behavior.
>>>
>>> +source "arch/arm/firmware/Kconfig"
>>> +
>>>  endmenu
>>>
>>>  menu "ARM errata workaround via the alternative framework"
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index e4ad1ce851..8c696c2011 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
>>>  ifneq ($(CONFIG_NO_PLAT),y)
>>>  obj-y += platforms/
>>>  endif
>>> +obj-y += firmware/
>>>  obj-$(CONFIG_TEE) += tee/
>>>  obj-$(CONFIG_HAS_VPCI) += vpci.o
>>>
>>> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
>>> new file mode 100644
>>> index 0000000000..817da745fd
>>> --- /dev/null
>>> +++ b/xen/arch/arm/firmware/Kconfig
>>> @@ -0,0 +1,13 @@
>>> +menu "Firmware Drivers"
>>> +
>>> +config SCMI_SMC
>>> +       bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
>>> +       default y
>>> +       help
>>> +         This option enables basic awareness for SCMI calls using SMC as
>>> +         doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>>> +         compatible only). The value of "arm,smc-id" DT property from SCMI
>>> +         firmware node is used to trap and forward corresponding SCMI SMCs
>>> +         to firmware running at EL3, for calls coming from the hardware domain.
>>> +
>>> +endmenu
>>> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
>>> new file mode 100644
>>> index 0000000000..a5e4542666
>>> --- /dev/null
>>> +++ b/xen/arch/arm/firmware/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
>>> new file mode 100644
>>> index 0000000000..62657308d6
>>> --- /dev/null
>>> +++ b/xen/arch/arm/firmware/scmi-smc.c
>>> @@ -0,0 +1,166 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * xen/arch/arm/firmware/scmi-smc.c
>>> + *
>>> + * ARM System Control and Management Interface (SCMI) over SMC
>>> + * Generic handling layer
>>> + *
>>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> + * Copyright 2024 NXP
>>> + */
>>> +
>>> +#include <xen/acpi.h>
>>> +#include <xen/device_tree.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/init.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/smccc.h>
>>> +#include <asm/firmware/scmi-smc.h>
>>> +
>>> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
>>> +
>>> +static bool __ro_after_init scmi_support;
>> I don't understand the need for this variable. IMO it's useless, given that in next patch you do:
>>
>> ...
>> if ( scmi_is_enabled() )
>>     return scmi_handle_smc(regs);
>>
>> return false;
>>
>> which could simply be changed to:
>> ...
>> return scmi_handle_smc(regs);
>>
>> and the variable, functions for it, etc. could be removed which would simplify the code.
>>
>> [...]
> 
> Well, I agree that the code would maybe be simpler, but
> that means we would call `scmi_handle_smc()` both when
> SCMI-SMC layer is initialized and when it is not.
> 
> That then means that if `scmi_handle_smc()` returns false,
> we won't know in the caller if the SCMI-SMC layer is not
> initialized at all or if it is initialized, but the SMC
> request is invalid (it does not have the SMC ID we expect).
> Do we need to, though?
Let me explain more:
scmi_handle_smc() is called from within handle_sip() that can result true/false.
If SCMI is disabled, we need to return false. If SCMI is enabled but request is
invalid we need to return false as well. If SCMI is enabled but not initialized
we also need to return false. I suggest to drop scmi_is_enabled() as exported
function and only use scmi_handle_smc() as global like I did in my example.
Now, this solves the part where SCMI is disabled since you have a stub returning
false and also the part where SCMI request is invalid. However, this does not
solve the part where SCMI is enabled but layer not initialized. To fix it, you
simply need to check inside scmi_handle_smc() if it's initialized. That's much
simpler than requiring to use another global function which is not nice.

Diff below:
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
index 62657308d61d..b3f34bdbb89b 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -24,12 +24,6 @@
 static bool __ro_after_init scmi_support;
 static uint32_t __ro_after_init scmi_smc_id;

-/* Check if SCMI layer correctly initialized and can be used. */
-bool scmi_is_enabled(void)
-{
-    return scmi_support;
-}
-
 /*
  * Check if provided SMC Function Identifier matches the one known by the SCMI
  * layer, as read from DT prop 'arm,smc-id' during initialiation.
@@ -52,6 +46,9 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     uint32_t fid = (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;

+    if ( !scmi_support )
+        return false;
+
     if ( !scmi_is_valid_smc_id(fid) )
         return false;

diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
index 57cc9eef8676..58730a8037c5 100644
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ b/xen/arch/arm/include/asm/firmware/scmi-smc.h
@@ -17,16 +17,10 @@

 #ifdef CONFIG_SCMI_SMC

-bool scmi_is_enabled(void);
 bool scmi_handle_smc(struct cpu_user_regs *regs);

 #else

-static inline bool scmi_is_enabled(void)
-{
-    return false;
-}
-
 static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     return false;
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index c4d225c45cd3..62d8117a120c 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -232,10 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;

-    if ( scmi_is_enabled() )
-        return scmi_handle_smc(regs);
-
-    return false;
+    return scmi_handle_smc(regs);
 }

 /*

~Michal


