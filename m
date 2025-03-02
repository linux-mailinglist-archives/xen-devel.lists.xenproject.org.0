Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF0A4B2CD
	for <lists+xen-devel@lfdr.de>; Sun,  2 Mar 2025 17:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899777.1307828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tollk-0005Uo-Ra; Sun, 02 Mar 2025 16:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899777.1307828; Sun, 02 Mar 2025 16:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tollk-0005Sm-Nl; Sun, 02 Mar 2025 16:02:20 +0000
Received: by outflank-mailman (input) for mailman id 899777;
 Sun, 02 Mar 2025 16:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjyH=VV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tollj-0005Sg-Pn
 for xen-devel@lists.xenproject.org; Sun, 02 Mar 2025 16:02:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2416::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5457094-f77f-11ef-9898-31a8f345e629;
 Sun, 02 Mar 2025 17:02:17 +0100 (CET)
Received: from BLAPR03CA0135.namprd03.prod.outlook.com (2603:10b6:208:32e::20)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Sun, 2 Mar
 2025 16:02:06 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::dd) by BLAPR03CA0135.outlook.office365.com
 (2603:10b6:208:32e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.26 via Frontend Transport; Sun,
 2 Mar 2025 16:02:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.4 via Frontend Transport; Sun, 2 Mar 2025 16:02:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 2 Mar
 2025 10:02:05 -0600
Received: from [172.28.231.239] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 2 Mar 2025 10:02:03 -0600
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
X-Inumbo-ID: b5457094-f77f-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsWwBqA//Vg492HtFWJqlUr6DnOLG+Fv6+ui/IUhkZwuoCFD3ZbwKhAmF8Mq7YX7CZCNtZl5uQmT0jjttgE2MOO+/3ZQi2ICGz1haH4T94jKVfqN7Ao6Le9sbHWlqYP7XwxodMGq99q4qfQmhb28ncL80YmMSzNUsJzMMClU4GiXChfl9wTov7jTXVqKZLtaUs/gk0v9wc2zFYEWvUdTYkNs/d0fdWEQIrpCw8tF0AI/gtBAueul4GgFXt0482qWrX9bqFFJNX8TnL1i/dpZhZ7vE/yk62+LZ9CcVKqItlkeKPxiylk5Utmg3CCHErKhtPEgL3vVQsBcQjba5ozlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPt7Ti7IZGdt1x0wAsQw8O1i3BwrI4BT8gXRagBG8w8=;
 b=XHGDubZ0pQn3DbSAxqO9OYakcIeNsOPNF7dHKQ4mwzRuIRAd7zJGdj+5psoH0D2+RJYDPk6S4zlhSHtGRuWeqUwGDoCsfnDBy/DovQ5xXPMwsk79jsJMdV/gu6rPjBbQcrniiJ5NvQcxDRUegR2qvV0lpdyAAXhLbbtn9byfaj1gVSLFxNZA9mdZIw+SZz7OCaVMnNlwb4zh//wtFVXw8QxqKi8BPP3kglnvwOpywhtNmoJqct1s/J4UJOk8K1sX/RqhzLY4sBblSAfiEfIOTK45kzuXrWhhLed7xLtwbS8aSTq3eCYHekkc3yLrXWD+kiG6NyZuwn3ajlO3Pjn7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPt7Ti7IZGdt1x0wAsQw8O1i3BwrI4BT8gXRagBG8w8=;
 b=0A02PJEPT3NdQxd7ycdWx3f768v/91u4cDw38p12hBOnv5xWE8yaMSVGotijxMypdClIktlW+a+j9A7Is02q7vLyX+zQWFm6IjP3C1fyBIyzvRv82cXRhmBCoLdb7pDEFkcw07dPuKd4h2MrKewpOpZBaPBVk2ADioEiSZ/y1lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5d965c79-296a-4319-b5c9-972b6a06ffd9@amd.com>
Date: Sun, 2 Mar 2025 11:01:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/5] PCI devices passthrough on Arm, part 3
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <1ef27a22-e541-4f44-97d5-400fe455222e@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1ef27a22-e541-4f44-97d5-400fe455222e@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b96ef1-4647-47a6-da73-08dd59a39469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDZxNnBtc0g4amFwWmNRUFdseFRMYnBoWTk3Yi9QWUZaYTl2TndJNk4vaGpW?=
 =?utf-8?B?bUhrQzhHVSswTytLWXpsV0ZscnNYZllQMVRYVndHazN6cVI2d2xsaHJuanlj?=
 =?utf-8?B?dmpxbmJhWmw2bnJyQithQ1hVYldiLy9Xc2JUSmEwdldLSm5yakNscnNKcFd5?=
 =?utf-8?B?NkZmUWFMTFBqQmRXYm5reVdKd1N1SFJIVmNQOUpwOFc5L2VLV0VyMkRLMDJr?=
 =?utf-8?B?OFErQ0d4Z05MQlIrLzc4aDFSNlFjNHYyVEc1cGNsMlJlWm9LR3hSeUI0NGFm?=
 =?utf-8?B?ck9XWHVLc2pPdnpueXBObzlVUVBGN2dFbi9CZTRJZC9Sazh0c2ErVGNUSGNz?=
 =?utf-8?B?VjhEc2VzNEJmY2hPRnVoVUdicEUxdkVWTEM2NDQvZGtZVVVJU3F1QUMvcjJQ?=
 =?utf-8?B?eGYyZkR1QTJ1UEprVjY2NFBDeEc2c1lXcDBldTVpWSs4SWNhbk4xcE9YU1Rp?=
 =?utf-8?B?aHRuMDAxQTlhUjRZWEVBajJ1dEs3WEtMTFc1VHJ4VzFFM3Yvb2VpV2JWNUNH?=
 =?utf-8?B?am9rTWlYR21BcEJuNkc3QUtLeDJPOUR0dHZzMER5OXd2VTN3em5hTk1LSlpP?=
 =?utf-8?B?Zm9qb2d4WmRVckNPS1JwUjJGM2xSMXJBdWx2TUVSVDViTDg0OWNsSnBveDVJ?=
 =?utf-8?B?NmU1M2swa2JPQU5sYzA1Z3ZWMGFCYngrbDFhU2lYUGoxQUFqSDJYcHdONS9t?=
 =?utf-8?B?ZVQ0b0xabjk1SnVWZXprcDNBNnBlZXdOQ3Q3ZHB6ZyttWGRxeWpLNjQyTHpO?=
 =?utf-8?B?THhWOC8veXd4OFpUUFIrSXNvSnFUY3BaVkIrNnhIeGZPOXZRQXVZcTNxQlRo?=
 =?utf-8?B?bUh3TFFibU9EV0hZR2lva2FjZXZUSEhERXlnbnl4M1gwN2N1L1FDUFZUbEFE?=
 =?utf-8?B?S3NTZStQTnVFUGNaUmRkZ3RnVHM3cG9rOWpqMmxUbi9CU25zV0VlcXJIakxo?=
 =?utf-8?B?T0FDOXRvQWltZ1hGM2NZQ3k1VmIwVGNHUHJBUlN4S1B6Z2dsdnpKbUI5QitS?=
 =?utf-8?B?NmhNWlBHcXVtR3BHaFFoWDVnTEtFMEhJM1A5RWJabkFIOXlYM05LeGdFRnRk?=
 =?utf-8?B?dVROam9JSnduL3hZclZIdHhVVGtHV2s4bkFLa1dlc1F4OUxZcU1udE1XNXNH?=
 =?utf-8?B?bFZabEo4NVZldC9QbFFyKzdLcjdRSnl5bjlFcXV0eEVGc0k1b0puWTA0VUZJ?=
 =?utf-8?B?VTdDcm55NUpNSW5MRnM2dUIrRTRldC8zVHdUcFQ5M1QyQTRjVDc2WDFlclky?=
 =?utf-8?B?aFVHS3hCdHdSV1BnaUdCY0lyM05NZW9iWmtjdm15c2xkeE9vME9BNnUrV2Vl?=
 =?utf-8?B?K0xBVnV5WkdIRXB3YnBGSlJGSHNtZ2tHRTJlNmJjWXlGQkVUOElHdHIzNDBX?=
 =?utf-8?B?cDJlTi9WQ0daVkpmK1hMU1pLQUIweVFzKytQNGF2YXVsaDNYYS9YQ1RIUWxr?=
 =?utf-8?B?MHUzNDMrbk50QlRRKzhKekIzZzNvUjZBLzBrMXBteGVlM0JmRUEyMjNwZjVa?=
 =?utf-8?B?aHJUNHl1TUYrOC9WOG5ReTlNUFZFZlJUNCtVaExEalhFSG51UWFINTdPV3ZN?=
 =?utf-8?B?cnJwd0FNY2d4WHNuN2NXNUpxUXR1MTFGRCtIcUpPaStKUHJ0R2gxdjNLTEpo?=
 =?utf-8?B?VDIwc3djVWxEL3pqcFNkV2FMRmV3NUR5RXlXdk9zUkZnL3JCUTRwZ3NhbzVO?=
 =?utf-8?B?bVQ4VkJYam9LcWpFTXdVMlp2b1BUTjFGb2V6ekVFK0dFL3pCSjFUUFhSTWw1?=
 =?utf-8?B?ZXNEVFUyTTZPWTVpelgyWm9LNkJYRFl1REI1ZU1MNUF2ckx2cUtwdi9TQjRo?=
 =?utf-8?B?endxU0lkTWtpcG5WSmR0S0xsVzNqa2ljMlFLd3d5K0lvdVZmOStNSnE5MC9N?=
 =?utf-8?B?eTNMTmdWdWFiQXZvZEM2Wm1VZ2lXeTFyWS9nc2h1WjMrREI3aHREdUtHejlx?=
 =?utf-8?B?TUNDWStmSGdUUExxdTFZOXRsOWRSNHVsVEZ5OUNmaDZuekMvSjB3bTdQbmRB?=
 =?utf-8?Q?+nhHahU9QHHx2pM077557v1Mpt902U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2025 16:02:06.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b96ef1-4647-47a6-da73-08dd59a39469
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290

On 2/28/25 09:40, Mykyta Poturai wrote:
> On 23.05.24 01:59, Stewart Hildebrand wrote:
>> This is next version of vPCI rework. Aim of this series is to prepare
>> ground for introducing PCI support on ARM platform.
>>
>> in v16:
>>   - minor updates - see individual patches
>>
>> in v15:
>>   - reorder so ("arm/vpci: honor access size when returning an error")
>>     comes first
>>
>> in v14:
>>   - drop first 9 patches as they were committed
>>   - updated ("vpci/header: emulate PCI_COMMAND register for guests")
>>
>> in v13:
>>   - drop ("xen/arm: vpci: permit access to guest vpci space") as it was
>>     unnecessary
>>
>> in v12:
>>   - I (Stewart) coordinated with Volodomyr to send this whole series. So,
>>     add my (Stewart) Signed-off-by to all patches.
>>   - The biggest change is to re-work the PCI_COMMAND register patch.
>>     Additional feedback has also been addressed - see individual patches.
>>   - Drop ("pci: msi: pass pdev to pci_enable_msi() function") and
>>     ("pci: introduce per-domain PCI rwlock") as they were committed
>>   - Rename ("rangeset: add rangeset_empty() function")
>>         to ("rangeset: add rangeset_purge() function")
>>   - Rename ("vpci/header: rework exit path in init_bars")
>>         to ("vpci/header: rework exit path in init_header()")
>>
>> in v11:
>>   - Added my (Volodymyr) Signed-off-by tag to all patches
>>   - Patch "vpci/header: emulate PCI_COMMAND register for guests" is in
>>     intermediate state, because it was agreed to rework it once Stewart's
>>     series on register handling are in.
>>   - Addressed comments, please see patch descriptions for details.
>>
>> in v10:
>>
>>   - Removed patch ("xen/arm: vpci: check guest range"), proper fix
>>     for the issue is part of ("vpci/header: emulate PCI_COMMAND
>>     register for guests")
>>   - Removed patch ("pci/header: reset the command register when adding
>>     devices")
>>   - Added patch ("rangeset: add rangeset_empty() function") because
>>     this function is needed in ("vpci/header: handle p2m range sets
>>     per BAR")
>>   - Added ("vpci/header: handle p2m range sets per BAR") which addressed
>>     an issue discovered by Andrii Chepurnyi during virtio integration
>>   - Added ("pci: msi: pass pdev to pci_enable_msi() function"), which is
>>     prereq for ("pci: introduce per-domain PCI rwlock")
>>   - Fixed "Since v9/v8/... " comments in changelogs to reduce confusion.
>>     I left "Since" entries for older versions, because they were added
>>     by original author of the patches.
>>
>> in v9:
>>
>> v9 includes addressed commentes from a previous one. Also it
>> introduces a couple patches from Stewart. This patches are related to
>> vPCI use on ARM. Patch "vpci/header: rework exit path in init_bars"
>> was factored-out from "vpci/header: handle p2m range sets per BAR".
>>
>> in v8:
>>
>> The biggest change from previous, mistakenly named, v7 series is how
>> locking is implemented. Instead of d->vpci_rwlock we introduce
>> d->pci_lock which has broader scope, as it protects not only domain's
>> vpci state, but domain's list of PCI devices as well.
>>
>> As we discussed in IRC with Roger, it is not feasible to rework all
>> the existing code to use the new lock right away. It was agreed that
>> any write access to d->pdev_list will be protected by **both**
>> d->pci_lock in write mode and pcidevs_lock(). Read access on other
>> hand should be protected by either d->pci_lock in read mode or
>> pcidevs_lock(). It is expected that existing code will use
>> pcidevs_lock() and new users will use new rw lock. Of course, this
>> does not mean that new users shall not use pcidevs_lock() when it is
>> appropriate.
>>
>> Changes from previous versions are described in each separate patch.
>>
>> Oleksandr Andrushchenko (4):
>>    vpci/header: emulate PCI_COMMAND register for guests
>>    vpci: add initial support for virtual PCI bus topology
>>    xen/arm: translate virtual PCI bus topology for guests
>>    xen/arm: account IO handlers for emulated PCI MSI-X
>>
>> Volodymyr Babchuk (1):
>>    arm/vpci: honor access size when returning an error
>>
>>   xen/arch/arm/vpci.c        | 63 +++++++++++++++++++++++------
>>   xen/drivers/Kconfig        |  4 ++
>>   xen/drivers/vpci/header.c  | 60 +++++++++++++++++++++++++---
>>   xen/drivers/vpci/msi.c     |  9 +++++
>>   xen/drivers/vpci/msix.c    |  7 ++++
>>   xen/drivers/vpci/vpci.c    | 81 ++++++++++++++++++++++++++++++++++++++
>>   xen/include/xen/pci_regs.h |  1 +
>>   xen/include/xen/sched.h    | 10 ++++-
>>   xen/include/xen/vpci.h     | 28 +++++++++++++
>>   9 files changed, 244 insertions(+), 19 deletions(-)
>>
>>
>> base-commit: ced21fbb2842ac4655048bdee56232974ff9ff9c
> 
> 
> Hi everyone
> I see that the first three patches from this series were merged, but 
> patches 4 and 5 were not, despite having acks. Is there something else 
> wrong with them that needs addressing, or were they just missed by accident?

("xen/arm: account IO handlers for emulated PCI MSI-X") was sort of a
presumptive change related to future work, and I think it should wait
until the IO handlers are present on Arm, if they are even needed at
all.

There was some additional dialogue following ("xen/arm: translate
virtual PCI bus topology for guests") that may need to be investigated.

