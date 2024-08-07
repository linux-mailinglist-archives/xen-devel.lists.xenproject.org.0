Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76272949F08
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 07:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773198.1183644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbZ0r-0005SP-PL; Wed, 07 Aug 2024 05:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773198.1183644; Wed, 07 Aug 2024 05:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbZ0r-0005PF-M8; Wed, 07 Aug 2024 05:15:05 +0000
Received: by outflank-mailman (input) for mailman id 773198;
 Wed, 07 Aug 2024 05:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6VL=PG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sbZ0q-0005P9-3Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 05:15:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec3fcee-547b-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 07:15:01 +0200 (CEST)
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:14:57 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f1) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 00:14:55 -0500
Received: from [172.23.60.101] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 00:14:55 -0500
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
X-Inumbo-ID: fec3fcee-547b-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qunMY/39g8IznVoUGBWOnTGmBvX6382LkjYzxFZYZ4jFi2uKjlY0D9ZEb94PRBwP7lRIOZqwHWl4RiUbIjfDRech24En2eNHf55hB6uabwcT+iojWMyqGVVgZihHpH7w5oSbjtyt3J4mLcuLpNvrD4qYVPXL0a5lu0Wl5ji4X/oYLqLspU7L41LRoVvtSBi0hiCZoKlVBTJXZgCvKk4fnSZo708nUjnXZ571rEsZXzVfQirei6ZYGW7BtIpPQgr+GPwcp0XS/csJn/Dxkhj/WGRXzuCxQVvcUZNNJqR8/K//b3LM7BCMVdehwjnewqEQk7Ao/BSYGZrzsQLu34Pf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hozdtx6yrd2950c3UReUlDos23J9H9xc0mZfXU9SHWY=;
 b=bQR8MwWJF9A5unGwrqNs4JmMbG3CHR8/HIvPVNwNNatiDirv9qFfT4KVqlUSRWuaEqNEZhi97CUCdMuh9L9eSjmY7z60GNKXJst9roNCtqHwUIaJn13vArpQN99F21AlI25Vq7LzR6xHbB9TlkYrMDUSb0h1eKrebn9uj3AVJuyo39n6rCvt/O9MHyihaNzGnXBiwVb1xv1ZEUNc3h9IAvj76XJ3C+E+MbOpCCYvEINMVD3inP+7yTjgw7PHjghr3p24riZ4PdxTTovOudliLsxbeWyieuFJA5+lU6xkMMTi4QmnvHvYPjNkc8DJh+4WR7hqLt43NptZo6DCyeyv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hozdtx6yrd2950c3UReUlDos23J9H9xc0mZfXU9SHWY=;
 b=wZzNBnRTsrt/5Id00RvW2L3m2n20I/B6UJigTtGFkMpw38oXZ4pVwbApT8jleYSmfbyonNqOdySxMdljrLgJOTVXFgvUqWMcRx6XbXSFQMoF94g51A+5gpYGLVsVn1si8T2yI+otIXoxqCgV5mqA5oBqSYUCOAckxrnSWwhd9/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6e4b8820-5cb4-4f8b-8fff-b77ae49fbe38@amd.com>
Date: Wed, 7 Aug 2024 01:14:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: fix locking for SRIOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240805210956.364624-1-stewart.hildebrand@amd.com>
 <38836a27-951f-49c8-a10e-e19b910a8444@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <38836a27-951f-49c8-a10e-e19b910a8444@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: f02e5d3e-9efa-46f9-3c8d-08dcb69fe11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djh5NnZncmJtVkJnaUZtWC9obWFDL0lDMzVtTThWamc3SDlyV3JvZ0syVncx?=
 =?utf-8?B?elVPMGRhdzN4Z0Z0REVzTHhxbXRuRk1vNUJiZ0pZQ21Ka2lDTDZ2ZXlxWmJS?=
 =?utf-8?B?QjF3cGNRZHUrbVpxei92aWgvTExOV2tOZkY0cmovNk9xMmcxZlgrenVRMU1k?=
 =?utf-8?B?Q2FWdVg4YTRId1pOZytNVmV4bVpzTE1qYWNlTlpidHFkMVQrekp4NGxHWklW?=
 =?utf-8?B?VG9NRFhxTEpmYWQ2dEYyLzFYcEtJT1VDcGIvZ0ZjdUlLbW10M2RYbm5hUFNC?=
 =?utf-8?B?ZFMxanJJa1lZZ2tldWdjSE5VSnJReEx6RG1uMHVtZ0V1WW90NWhJc28xejZi?=
 =?utf-8?B?dTAzSUVTQytHMmhCUVc1NWlpWitmMjJOV1ZUSGhqNHZWUzV4NldWNFp5ZHFO?=
 =?utf-8?B?cnVQTmdXaTRTc1FyT09Da1c1TXY1eFNDZXF2b2hUb2hKdXBlcHRuZ3NVTWJV?=
 =?utf-8?B?c2QrMHF6VFhwczFlS0pSWXY0blkzMlEvcVYzeU1ZOCtiZEdvdWV0a3NwOEIr?=
 =?utf-8?B?RC9LSW9XZVpIempadjU1OTV0eFhaNFFHUU5Gc3RBYUtjS3NUejBwWlF4Nm9p?=
 =?utf-8?B?QjRZcWhMVngwYmVQUlZTbC8vRTZOcm1qdmRxaC82azBIclB3TjFncG5oSEtx?=
 =?utf-8?B?dW8yNTIydGxtTVFKUG9wSmNXc1lPc1FPVzIrK2YyVUZOVDBDNm9zWkorVFVU?=
 =?utf-8?B?OVpJZ043cEtxb2IzM244TE5QWHNJV2FjOHJGZ0NjOGdQSWpMRUh0TjJWeVhs?=
 =?utf-8?B?R3FOTzA5WERYN2l4dVBZT3pMNXJ1YlZtTTZnWWN3M1ljd2llWVc5R043L0V4?=
 =?utf-8?B?MndyN0dLcWl2MFBDWDNPWGQ1TCtjK3M5ZnZ2TlFRNk9lOXlqenJ2anhjc1ZQ?=
 =?utf-8?B?MFVUUmk5QU1leVlsZ250dEFnbTB2WE9qSVBpRFN1RExtUkNVUXZzRit6cU5v?=
 =?utf-8?B?b2dCaWtuZ2NPWjF2VTY2Zld4RkNHKzY5YUNYRS9aUjBpa0VCU2JWdkhIM0Zu?=
 =?utf-8?B?d2lweEgzdU9HUGMxOUx4UVhmbDBNM1hvQ2VybXNEcnNublFvREg3UjYxV21E?=
 =?utf-8?B?VjVINzRjSFR5QUFzNDVZbElNenAvb01EWlJxa3JIQ2ZHN3BocTFtUkJzOEEy?=
 =?utf-8?B?K3hzYWg4b3pndFhCaWVhV1FRVC9MaHBUVGE4Mi9JMklrVWRBekNJSjQxa2xD?=
 =?utf-8?B?ZUcvQjB6N0NoSUdJZXZhUHhtbHZtakxqbXJCcU9wMFFjOUFPYldmNUxJdWY3?=
 =?utf-8?B?ZTNjVTJPaHkxS3puMERQS3hHWnh1Q3FnQ1dkYVZXRHZibk1SenRiUWl4OEFr?=
 =?utf-8?B?UVJwTWg1b1hMRkxicFJteTNLa3V0aTlaNlgvSnkrWTJ0QzE2dmNRUlRyekE1?=
 =?utf-8?B?N3ZiNzdJZzhMQWJuNXNUTTloRHpURVRaV3FhMURYaEJuQzdYQ1JrN05YcDd3?=
 =?utf-8?B?RExVdXR2QWJ5ZDhEMk51cFNXVkcvalc5REdncHJkaVBuMEUycEsyTTdSNFJX?=
 =?utf-8?B?aGdqZEt2NXNEOUdsWnFLUjBocm53dTR3aVFhdDRVZ1FwdldLc1d4bS9nSWsx?=
 =?utf-8?B?WnFXRjZ0cm5wM3djZjFuRnZDTTA4ZjVYM3ZtaWNmUEJueW93cUlaZGttL09P?=
 =?utf-8?B?Wm1rUXFxekpVbXJreXJ2bFo4SGxtNTRKTWtxYmN5ekk4OGQ2Tnh0bSs5MjBv?=
 =?utf-8?B?dlpMdkxGNXd5VE1kTFJQZDNGVWwzZEI2YmdYcENFbmR0NGViK0NoUlJyN1lo?=
 =?utf-8?B?Uktua25Cc1VTcHo3NE96b0hGcE9RVkhhOU9pZS8yKzdkaG5SQlZLc3hWd3Vu?=
 =?utf-8?B?YVJVTHVGNjE3ZklGNVdhbVFVUVJhYkhEeTZsZzFzdU5CdU5Jb0E0dk1GSHVZ?=
 =?utf-8?B?NHZHcUE4bVRtOUdKbVRFQUZyTmZ5Y2w5MGp3dlNEWjFvcERaQ0V1NFk0dWdL?=
 =?utf-8?Q?+I6m+najUrjfcZK4Lkd35TsvflnnPTsO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:57.1272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f02e5d3e-9efa-46f9-3c8d-08dcb69fe11e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757

On 8/6/24 02:25, Jan Beulich wrote:
> On 05.08.2024 23:09, Stewart Hildebrand wrote:
>> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
>> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
>> and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
>> call path wasn't updated to reflect the change, leading to a failed
>> assertion observed on debug builds of Xen when an SRIOV device is
>> present with one or more VFs enabled:
>>
>> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
>> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
> 
> There must be more to this than just "SR-IOV with VFs enabled"? The
> locking change has been there for quite a while, yet the issue was
> noticed only know.

Yes, the conditions as far as I can tell are:
* PV dom0
* Debug build (debug=y) only
* There is a SR-IOV device in the system with one or more VFs enabled/configured
* Dom0 has loaded the driver for the VF and enabled MSI-X

The assert triggers when dom0 loads the VF driver and enables MSI-X
before PHYSDEVOP_prepare_msix is invoked.

>> @@ -829,7 +829,8 @@ static int msix_capability_init(struct pci_dev *dev,
>>              vf = dev->sbdf.bdf;
>>          }
>>  
>> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
>> +        table_paddr = read_pci_mem_bar(dev->domain, seg, pbus, pslot, pfunc,
>> +                                       bir, vf);
> 
> While dev->domain is the owner of dev (seg:bus:slot.func), it may not be
> the owner of seg:pbus:pslot.pfunc. Or if it (reliably) is, I'd expect the
> guarantees towards that to be spelled out in the description. (Dependency
> on ordering of toolstack operations likely wouldn't count as a guarantee
> to me. Yet if I'm not mistaken there's a problem in all cases if the VF
> was already moved to DomIO, before the DomU is started.)

On the possibility that they're not the same (now or in the future),
disregard this patch.

> Further to this, until realizing that the code path leading here is
> accessible only for Dom0, I suspected a security angle to this, and hence
> didn't respond publicly on Matrix. I noticed, however, that apparently
> there's another instance of the same issue (via the other call site of
> allocate_and_map_msi_pirq(), i.e. from vpci_msix_arch_enable_entry()
> through vpci_msi_enable()). Imo that wants dealing with at the same time
> (potentially requiring a different overall approach).

There's a simpler way to solve this: the VF doesn't strictly need to
obtain the pdev of its associated PF, so the call to pci_get_pdev() can
be removed from read_pci_mem_bar(). Patch to follow...

> The code path leading here being accessible only for Dom0 likely is also
> a mistake (read: overly strict). In principle it ought to be possible to
> move a PF to a driver domain, for the VFs to then be assigned to
> individual DomU-s. In such a case I expect it shouldn't be Dom0 to invoke
> PHYSDEVOP_prepare_msix.
> 
> Jan


