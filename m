Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D5A84ED9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946308.1344257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ywJ-0002wH-S6; Thu, 10 Apr 2025 20:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946308.1344257; Thu, 10 Apr 2025 20:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ywJ-0002uW-Od; Thu, 10 Apr 2025 20:55:59 +0000
Received: by outflank-mailman (input) for mailman id 946308;
 Thu, 10 Apr 2025 20:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2ywI-0002gb-JD
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:55:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2417::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32fe4276-164e-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 22:55:57 +0200 (CEST)
Received: from CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28)
 by CY1PR12MB9603.namprd12.prod.outlook.com (2603:10b6:930:108::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 20:55:55 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:52:cafe::72) by CH2PR04CA0018.outlook.office365.com
 (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.24 via Frontend Transport; Thu,
 10 Apr 2025 20:55:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 20:55:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:55:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:55:54 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 15:55:53 -0500
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
X-Inumbo-ID: 32fe4276-164e-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXZnaoTe708AfLKwgYvANu1qQvBVLVP4CKA6bHhuzCv0W3ImA9hnUKaq2M8lMN17C+P8nuTd7H5ftBjEIBHnlSbF7rm5A9fPu4W+9kiCMj+4NnnwoUrTdsu0HjhenG+PRYT18HM6mUfVVcukGdBrCuPga7NYUSkLvzC/CktpMUVL5nlRYEonTY9TPZWQpnJbZCK7ibsPvLTnGiNgjhoRvG6yRTci2DxpJQT3oKDwnYWVXo6vlqq08+EMqhOGkHrpyDjwGP5kAs5fIwZBCjpFvyFV/5sN1uzfNdoDRgIK8cMY2Q9WParlPrL6VkaHOFFAuwBCg+vacND0nTHvBgU1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XkPlzDKAdL45KUcaKqXvjflbr0n3Uvkkym2EUKfeGA=;
 b=b5G2PHvYmbNxai6X4mEVEPK7vxWZDqbaSut+PeSFka6LkjDhwcIkMNRu4j/ZpcwPFVZ3xrfXV3OMz3eIcr1Yp9raapd7k1OcbQjK0Q+HrCd5LhQViWKu3do3FYrym4LSi7D6LcD5lhY2MrjMVkQe2uY8lS1Z0JQj3DXDHRFm+0iAI0BMmGXSasO1X+ZYQulxk4wA6CI8Ttou3KcBNl/p4O5/0gpawLw1x4+nWaGKvAzuZaZnjeF5r8VhVm1kKTnJSuWyiJmzpfVGH6aTAU5HhyL/Jgg+UXw2BIj6BfCgySdjd/zSNijBdqGjS/u46sw6WURlpANcD+mAQRKk9u2bIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XkPlzDKAdL45KUcaKqXvjflbr0n3Uvkkym2EUKfeGA=;
 b=4ZVaJVLmn7DKWJIbJxt7BXZWodhEtzdluaa7Gr+7lLRX3zeHXfP9RGCC3lKa3h/ftIe4Pj+dKf737VmUPvqtN68IvT4SCLEwd3C15Xnaxsd1avMvSJz13Z7CvlV+ZSdXHZPF3VV9QMA6ivH+vQCUJfDayWU6Ne/GUr/S52P6Ri4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
Date: Thu, 10 Apr 2025 16:55:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	<Xenia.Ragiadakou@amd.com>, <Alejandro.GarciaVallejo@amd.com>, "Lira, Victor
 M" <VictorM.Lira@amd.com>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Z--0USril0UIhR4R@macbook.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CY1PR12MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: cfaa9ad3-36ae-4596-589f-08dd7872160e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzlwMW9NL0lodEIrTTNIZ2JOWXVjQnYwNWNSU3ZGM2x5Vi92OHpsbDZVVENx?=
 =?utf-8?B?UjhZb3ZXeTNRVmJXcWgxNWtna2pGVCtBekx4RGxYanN1Ni9keHBPdlF1OU1r?=
 =?utf-8?B?TXpvSlZuYWlDb20yMk14cXhyMFJWbmwyakVOMWxKclBmU1pOVStWNFZpUEZx?=
 =?utf-8?B?bzBXQUFVUjV6UHZSZDFrbVRYcWF1TVVCK0Y5YWNLNEh0TjNSeU1hdC96dHpH?=
 =?utf-8?B?ZlBBV1dHeXBYK05HemJrek1QR2o1Q2hrOXVJUlM0bGdkbVVkd1hhMjlxbHhV?=
 =?utf-8?B?bktqSUVzdWZQdjJST0tuL2x1UHh4MkFiQ285SWxJelJHS2pKL3dQOTYrMTdJ?=
 =?utf-8?B?TmkvREQ5TDdrSnc3RnNwbVVoSmtxbGxaTm82NTBjUnN0R1B4SzBEblFvR2NI?=
 =?utf-8?B?ckUxeWY1anh1TUp1amE4WkJqSTluL2VBM3FnNG85L0VnR1JsSDdiWTVmNDc3?=
 =?utf-8?B?UkN2NFhWUEpWS2FqQ0puciswdDhaVU5MNURLWlVlZzFLOGY2ZWRoaGVYV2lK?=
 =?utf-8?B?WHZDZjk1QXAvTWxLdWdZMER0aWpzU2NueUVBQ1NIbW9BT1d6Y0k0c09PK2M5?=
 =?utf-8?B?R0FvbjJJTTZwMFh6SXdwV0NtU1RyK3VqSS9vUnhzQXZRTXRUN1dwMUVyZFdW?=
 =?utf-8?B?L0xvdmZ0ZEs4c3AyUU9zWWVaMFJIdUE1NEk5Mnc3eGJFU0dBZHRyQkFOZFR0?=
 =?utf-8?B?MC8yRmthZ0ZSSWJlUUdFZk9PTEVjZWZJQU1Ka2hBSFZPK3J5SzZuMzJXbHFW?=
 =?utf-8?B?VTdYMTZIS3FvZmNvVlBFV2Z1VmZlZDhGK3NHZ0U3VGljRENlSjgreXdKaG16?=
 =?utf-8?B?MnRqTjhrYjM4bmpUVjBYaXFSZGs1N3dyMWtrb1FQY2U4MlhkM3VJTXNwbUxP?=
 =?utf-8?B?cUR4TzhkOElORFIzTVB2VzlQNHFMRys3UVgxRmlsalN6Q1FTN2lEQVNmdmdK?=
 =?utf-8?B?czg0NTNMS3ZRM1VjSC93eEU5QUdsczYzb1BsSVVkU0JPWXoxNGY0enYvcVA1?=
 =?utf-8?B?OEhPbjY4WmZ3N3pPVGJHT1V4cDBVM254cjZyVis2RWdJSFVqQ1RNeDR6SWgy?=
 =?utf-8?B?SFAxeXlRVnp3aEdqNXZTVXdzencrSVYyNWV1Wk1idXp4MXdIcjRjNVZTSGRN?=
 =?utf-8?B?cituY25FVHBadjF3S0hiWUJuV0NHODRuTGdlQ3B4UHNDemxSMTNiQy94WmJI?=
 =?utf-8?B?bTVyZHF3cmxoUGZDcVg4VldDcERPT1ozMVd6SWlkKzBrVThKdkQ2SkUyTExw?=
 =?utf-8?B?SEIyTDNpN0hHVTZEOXVQdHhWT2tMQzhxaWtXc1h4bzVIK3ltZXlmdjVqelRR?=
 =?utf-8?B?RGhjb04zMDBDNDFndjNQcWFOcHVFTGFkbWMzMFE2bGVaZDdKWU9tQ3BpWFZq?=
 =?utf-8?B?cE5qbDVYZGVLMENKdUtZNW1LS0dmSnU2MndpTkJPYVZwcVljN3hsL3lCSXBZ?=
 =?utf-8?B?WlhNUjVBVUVQR1VKTVE0NmJXK0YyS2lFU3hHVGZTZWdzQ0xoNEIvbEQrdm9k?=
 =?utf-8?B?UzJWL3JZNkxkZXI5dlVrQlZwc1ZqbHJYQ21pYXNWcEJUc0t5QTQ0QmI0VFZl?=
 =?utf-8?B?d0IwdWpIYjVyNUdOZmxuUTQzVzAya0xoQnZnRllkaWtLU0VySWNiY3M0M2dW?=
 =?utf-8?B?QURUb0FVTks4eVhpNzU0R0hYWHJkMm83bW5nV0ZqUGpjSlJzWnFZSi83S1RJ?=
 =?utf-8?B?R3dWOXZxeHpJL1EwTnMvc3JlSVphNVR0ejdwT2ExTjRtdkVYYVcxK2hYanRk?=
 =?utf-8?B?aHJUd1lHL0NpOXQwZzIrMVF5VklQVU1naE10cGFoTDdPYUgvQ1pRck5Vc0Nu?=
 =?utf-8?B?NURESTNjc3plNnN0L3FsNG55a0Z2R1dHVENtclp3Qkw0dCtZbCtVeTczTytI?=
 =?utf-8?B?R1F6S2JQRFJ2bFltcDJVK2F5RVRsQkNORVRMME1UM1pmdVpXeDhvQVRmbk5U?=
 =?utf-8?B?dWR1dTdQRjlUVktLaWN0eVJvOGZ5ckZCTXJ5Ymo4SmQwczRKeEFJOEdjbzMx?=
 =?utf-8?B?bmxNTHh2cGVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:55:54.7457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfaa9ad3-36ae-4596-589f-08dd7872160e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9603

On 2025-04-04 06:28, Roger Pau Monné wrote:
> On Thu, Apr 03, 2025 at 06:01:42PM -0700, Stefano Stabellini wrote:
>> On one Sapphire AMD x86 board, I see this:
>>
>>
>> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
>> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
>> [...]
>> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
>>
>>
>> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
>> This is because the pci_check_bar->is_memory_hole check fails due to the
>> MMIO region overlapping with the EFI reserved region.
> 
> That's weird.  (Partially) the reason to not attempt to map such BAR
> is that it should already be mapped, because at dom0 creation time all
> reserved regions are added to the p2m (see arch_iommu_hwdom_init()).
> If that's not the case we should figure out why this reserved region
> is not added to dom0 p2m as part of arch_iommu_hwdom_init().

Victor discovered these regions are type 11 EfiMemoryMappedIO, but they 
get converted to e820 RESERVED.  The BAR points into it.

00000f0000000-00000f7ffffff type=11 attr=800000000000100d
00000fd000000-00000fedfffff type=11 attr=800000000000100d
00000fee00000-00000fee00fff type=11 attr=8000000000000001
00000fee01000-00000ffffffff type=11 attr=800000000000100d

Xenia discovered Linux keeps small regions like this reserved, but lets 
larger ones (>= 256kb) become holes.  See the comment in Linux 
arch/x86/platform/efi/efi.c:efi_remove_e820_mmio() around line 301.

The description of EfiMemoryMappedIO is a little confusing, which is 
probably why its use in unclear.

```
Table 7.5 Memory Type Usage before ExitBootServices()
EfiMemoryMappedIO

Used by system firmware to request that a memory-mapped IO region be 
mapped by the OS to a virtual address so it can be accessed by EFI 
runtime services.

Table 7.6 Memory Type Usage after ExitBootServices()
EfiMemoryMappedIO

This memory is not used by the OS. All system memory-mapped IO 
information should come from ACPI tables.
```

The two after ExitBootServices sentences seem contradictory.  I wonder 
if it should be "Ignore this memory type - All system memory-mapped IO 
information should come from ACPI tables".

> Can you paste the dom0 build output when booted with `iommu=verbose
> dom0=pvh,verbose`?  Does using `dom0=pvh,verbose,pf-fixup` solve the
> boot issue? (and can you paste the output if it does)

pf-fixup did not resolve it.  The vpci pci_check_bar() check is 
independent of pf-fixup from what I can tell.

Regards,
Jason

