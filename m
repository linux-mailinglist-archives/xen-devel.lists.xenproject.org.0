Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864FB952786
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 03:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777788.1187860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sePI2-0004Rx-Vf; Thu, 15 Aug 2024 01:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777788.1187860; Thu, 15 Aug 2024 01:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sePI2-0004PP-So; Thu, 15 Aug 2024 01:28:34 +0000
Received: by outflank-mailman (input) for mailman id 777788;
 Thu, 15 Aug 2024 01:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWDR=PO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sePI1-0004PJ-OQ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 01:28:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad3b6069-5aa5-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 03:28:30 +0200 (CEST)
Received: from SN7PR04CA0199.namprd04.prod.outlook.com (2603:10b6:806:126::24)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 01:28:22 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::10) by SN7PR04CA0199.outlook.office365.com
 (2603:10b6:806:126::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Thu, 15 Aug 2024 01:28:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 15 Aug 2024 01:28:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 20:28:21 -0500
Received: from [172.23.60.101] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 20:28:20 -0500
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
X-Inumbo-ID: ad3b6069-5aa5-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1yrR/LdoGWZ5SZj2mm7VnLnFSX/qvetE9xGVjybM2HT08WdeZiRV1/k+TlgYvglSr23lMjdzM67TOCJp+ZS9rOyPXaRtDfIGCdmpB+d8FG5X3B+qwChBCrI8SGFcCtpeCiDI6MmQPSMpj77moS0g551pY5l2T5kc0+iGiZYBY9Vmyynf6A4UwzpsqEsCCwRHxEVkZwqY6ACRjAgEYTZcaSXsdNaVfte9ATWbDkEclOxBnf65ItmexyZGDb0Ss1JJOfnq9WVS1uDsCp45YfCFU1k0G0qxbDQAA0lNVMhMH1jTJj6woZyzC+5eU0KOE7ffPsc9G9imLm7nXMXgKKYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0l3Hu/nacDiYCFoeaN96Ca9/rly+kx6EWAp7kHpDLA=;
 b=Dr3CzZfkJThA58fM0oMd/WaBHZB2vJRi9quh4ygRPy48/+LmS9xeCK3wEFfm8331FCl6Wa2oIaG06IaHuh2iIYr7ATtcWwf6rDiFYiVseVF3JGtcjxxCnbknNGV4LONo8Zx5mCsOnDtOnQrzjZQzwMxSSwO1dri6A8Sgfu0b3YYOkvWjxsCCo4ULNBQqvGm2TzhXQGKRXhmbhoU6hgzaCslS0XB2O68XWcvbkGVUofHvSbl5t7rIF9QjH3NHRSJ9tyYSTjNr6BG0HD8x0Pc0gAyGoVCpFDzPm/FisbqCdZ3dGhWW6+63mExcH90d1IPOn5PgJbNdMWwhPz4IpNG6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0l3Hu/nacDiYCFoeaN96Ca9/rly+kx6EWAp7kHpDLA=;
 b=Y4LtoCUbKhqzryFB7kDC7sEksH9IucJ5Rhm8HzcLPVg2CAdnO1GpUN9K+oG7q6+4LligryHynkdbzwrtMsy9oWR1N4SKh7BJiCARcBPxIzho565hgmFK+lelQ6JwiYN5Ep7wCv2elnxtlfJPuEwmJkVHjztIGQwFl0Scxg0iPak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c05c9312-e729-48fb-942f-fbb378cd097a@amd.com>
Date: Wed, 14 Aug 2024 21:28:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240812203938.981588-1-stewart.hildebrand@amd.com>
 <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad42edf-8cc7-4eae-3ab7-08dcbcc98cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q09vTEF4TzJ3UnRSSm1xS1FxZE5UMnEyWXEwWERDZzB2bXdpZEhsVVptaDFH?=
 =?utf-8?B?Q09tNi9Ta1hIdkszN29OQTdDcDFGZFRkbVhlaHNTS0w5dUQ1OXFMZi8zdVlr?=
 =?utf-8?B?WnFCZDdjdm9WU25hZnVZOUJ1ZkdncHZrZ2VEWmx0ck5ycmhzcDQ4SmNJMmd5?=
 =?utf-8?B?MjN2cWdIQVZEOHFKQWltTml1RGZ3RXhlMHN1L0NDMVNGMVh6ZThQUklTaHhB?=
 =?utf-8?B?NTF6WFBZYVBXTlp0QXlXdXRxbmJKbjA0S29KdjRTTDA4ZTkrOEJYSzBWOGw1?=
 =?utf-8?B?ZkZrLzFjZ25HVzFNKzBsZkQyTm5zWXBnSkhHNWlVOUkrWUJxd2tRV2VMdFMw?=
 =?utf-8?B?RlVGd2lhQ0lTZUdzZ1VKaXRJejFqNTB2UDlXeTdxQ1E5eXpvbnBwWEcwakg4?=
 =?utf-8?B?R01GMzhmYndNQzNLZ2k4eGhvUDhsRU9UQnRLVzZQM09CemRkSVFQdCtRaXcw?=
 =?utf-8?B?UGc0NHNzZUhtMFA0NllwSTBXZzNqcE5yaFFxMDMyVnkzTWp6WkxsTnpWL0xq?=
 =?utf-8?B?blNiUlFxOXRwOGxpZkloRkJJL3UzQmNybFZMMVQxcDUxaXdSUlZtL1hFdGs3?=
 =?utf-8?B?MnRycTExRUZlT0xxQmdYSkFjMWgxZGRXODY3V0xnSUtCZnVrbEZ3R1E0YytH?=
 =?utf-8?B?U3dYT3lmcVNLRldUZDhqbkZXdjRDWE1RZVkvOEJTai9nNWl0RDJadGJRWmJ3?=
 =?utf-8?B?Q3VsZFlsMkgwNTJDYTIxMlBaVEo5RGtPV0xJM3JKZU50bnRnSnVINHNaeFJr?=
 =?utf-8?B?R2JSK25iUG9PbHlvTDZ3b2swSi9VV294SThMNHlhSHJMRWRWNTRBdkN0bUNS?=
 =?utf-8?B?N1d6bUZMa2YzOWFkOGkwWW5JUCt1QndGekRJVER3N1d1R0dwV0VFTVBPSk1L?=
 =?utf-8?B?d3craWFDbzJmZDZMNzJqZG9ac3RZSnIvdGF2VmRMd1Y2ejV0Q1dFU2VpbGJF?=
 =?utf-8?B?WDVHRWNtK1h6VWlLdFdWd3VZWnBWVTlvejZzOGp5ZEwyKzU4cGVvNXpydlFI?=
 =?utf-8?B?d2hhZGZ5ZmlSeWV6N0NXRC8xNkc0OUp5eUtUMDRodmQ1SWNYK0JwaVR5RkFB?=
 =?utf-8?B?SHYvdkIxTlpiRytSQkVUWkNyOXZXaEdab2FBL1F2OEpzUnZLQ1RRTVRoY1M5?=
 =?utf-8?B?eW5xdVZWR0t0QTVxZmtqUFlmc3VKblRwakcySWpXek8reEh5TW5wZkpxaGU2?=
 =?utf-8?B?L3dvTi95VnBybDdSWnpQdE80enF2dGdnbFpLaG16QTliRWpkODF0d3AycDNV?=
 =?utf-8?B?TVROWFVaUVlPZGZXSmozdHdQeXVpZ1FzMGNKOWRzV1Z4VUR2b2dORUh4aGgr?=
 =?utf-8?B?UHV2M2I3RzRpZXQ5ZzQ3UkFNVThkUEE2U3JBRnBIdlFoY3V3VUtQMEFsSkVy?=
 =?utf-8?B?enF6UE56Smp2S1pIcHhMaHV1R3pPOXlrOXdSZ0dqUHNsYk55WnNwa0NEcXda?=
 =?utf-8?B?alppS1lOMDFGOVo4ZjRUZGNhUW9VaUp3cm9PcWIrZGhhdVp3Z0tDL05ydDdt?=
 =?utf-8?B?d3RBbktqSTliUlVIa29HdGN2cFV1UkZaQUpycTQ0ZnBpK2FRS3hvWHRyWjFq?=
 =?utf-8?B?YjBBeGVZSHltMGtzRnlqa1E1YXQrVWtaY1pBVXdyeTRpQUNIWmY4UzNra2tV?=
 =?utf-8?B?M2dzLys4TFZqLzZ3dkR2N0V0Uk5EYmtrWWFoeGQyZ1NqWERQNjNYZzlJeEtL?=
 =?utf-8?B?Y2N2NzVxSUFYYnN0MUxORW5zRm1md281cWFnbGJhQllXSG1oYTk5R0RKUjZ4?=
 =?utf-8?B?L25weUJocnJzYUJuZUQwZWlhNGVhaXZhTlFjMFp4OENNQ1pwZk5RblVSUnZw?=
 =?utf-8?B?Z0FoZlg0ZTZIVno4em1uemNaTm5CZDA4ekg4ei9TclkzcXo4d0N4d2ZnbnJr?=
 =?utf-8?B?MVpFcHN2cmExUE4wL1I2Q3pDa0ZDdDlkdlZRUUpZcy94R1hIaDQvNFNwSnZo?=
 =?utf-8?Q?mnfD9tUe5WGecsbvlEKT5cKg7dPM56Ow?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 01:28:21.6155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad42edf-8cc7-4eae-3ab7-08dcbcc98cd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

On 8/13/24 10:01, Jan Beulich wrote:
> On 12.08.2024 22:39, Stewart Hildebrand wrote:
>> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
>> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
>> and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
>> call path wasn't updated to reflect the change, leading to a failed
>> assertion observed under the following conditions:
>>
>> * PV dom0
>> * Debug build (debug=y) of Xen
>> * There is an SR-IOV device in the system with one or more VFs enabled
>> * Dom0 has loaded the driver for the VF and enabled MSI-X
>>
>> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
>> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
>> (XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
>> (XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
>> (XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
>> (XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
>> (XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
>> (XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
>> (XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
>> (XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
>> (XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
>> (XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
>>
>> In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
>> associated PF to access the vf_rlen array. This array is initialized in
>> pci_add_device() and is only populated in the associated PF's struct
>> pci_dev.
>>
>> Add a link from the VF's struct pci_dev to the associated PF struct
>> pci_dev, ensuring the PF's struct doesn't get deallocated until all its
>> VFs have gone away. Access the vf_rlen array via the new link to the PF,
>> and remove the troublesome call to pci_get_pdev().
>>
>> Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
>> pci_add_device() to set up the link from VF to PF. In case the new
>> pci_add_device() invocation fails to find the associated PF (returning
>> NULL), we are no worse off than before: read_pci_mem_bar() will still
>> return 0 in that case.
>>
>> Note that currently the only way for Xen to know if a device is a VF is
>> if the toolstack tells Xen about it. Using PHYSDEVOP_manage_pci_add for
>> a VF is not a case that Xen handles.
> 
> How does the toolstack come into play here? It's still the Dom0 kernel to
> tell Xen, via PHYSDEVOP_pci_device_add (preferred) or
> PHYSDEVOP_manage_pci_add_ext (kind of deprecated; PHYSDEVOP_manage_pci_add
> is even more kind of deprecated).

I guess I meant to say Dom0 kernel, not toolstack. I'm actually
questioning how much value this last portion of the commit description
is really adding. Maybe it would be better to just remove this bit.

>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -662,34 +662,32 @@ static int msi_capability_init(struct pci_dev *dev,
>>      return 0;
>>  }
>>  
>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>> +static u64 read_pci_mem_bar(struct pf_info *pf_info, u16 seg, u8 bus, u8 slot,
>> +                            u8 func, u8 bir, int vf)
>>  {
>> +    pci_sbdf_t sbdf = PCI_SBDF(seg, bus, slot, func);
>>      u8 limit;
>>      u32 addr, base = PCI_BASE_ADDRESS_0;
>>      u64 disp = 0;
>>  
>>      if ( vf >= 0 )
>>      {
>> -        struct pci_dev *pdev = pci_get_pdev(NULL,
>> -                                            PCI_SBDF(seg, bus, slot, func));
>>          unsigned int pos;
>>          uint16_t ctrl, num_vf, offset, stride;
>>  
>> -        if ( !pdev )
>> -            return 0;
>> -
>> -        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
>> -        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
>> -        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
>> -        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
>> -        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
>> +        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
>> +        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
>> +        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
>> +        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
>> +        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
>>  
>>          if ( !pos ||
>>               !(ctrl & PCI_SRIOV_CTRL_VFE) ||
>>               !(ctrl & PCI_SRIOV_CTRL_MSE) ||
>>               !num_vf || !offset || (num_vf > 1 && !stride) ||
>>               bir >= PCI_SRIOV_NUM_BARS ||
>> -             !pdev->vf_rlen[bir] )
>> +             !pf_info ||
> 
> See further down - I think it would be nice if we didn't need this new
> check.
> 
>> @@ -813,6 +811,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>          int vf;
>>          paddr_t pba_paddr;
>>          unsigned int pba_offset;
>> +        struct pf_info *pf_info = NULL;
> 
> Pointer-to-const?
> 
>> @@ -827,9 +826,12 @@ static int msix_capability_init(struct pci_dev *dev,
>>              pslot = PCI_SLOT(dev->info.physfn.devfn);
>>              pfunc = PCI_FUNC(dev->info.physfn.devfn);
>>              vf = dev->sbdf.bdf;
>> +            if ( dev->virtfn.pf_pdev )
>> +                pf_info = &dev->virtfn.pf_pdev->physfn;
>>          }
>>  
>> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
>> +        table_paddr = read_pci_mem_bar(pf_info, seg, pbus, pslot, pfunc, bir,
>> +                                       vf);
> 
> I don't think putting the new arg first is very nice. SBDF should remain
> first imo. Between the latter arguments I'm not as fussed.
> 
>> @@ -446,7 +448,27 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>  
>>      list_del(&pdev->alldevs_list);
>>      pdev_msi_deinit(pdev);
>> -    xfree(pdev);
>> +
>> +    if ( pdev->info.is_virtfn )
>> +    {
>> +        struct pci_dev *pf_pdev = pdev->virtfn.pf_pdev;
>> +
>> +        if ( pf_pdev )
>> +        {
>> +            list_del(&pdev->virtfn.next);
>> +            if ( pf_pdev->physfn.dealloc_pending &&
>> +                 list_empty(&pf_pdev->physfn.vf_list) )
>> +                xfree(pf_pdev);
>> +        }
>> +        xfree(pdev);
>> +    }
>> +    else
>> +    {
>> +        if ( list_empty(&pdev->physfn.vf_list) )
>> +            xfree(pdev);
>> +        else
>> +            pdev->physfn.dealloc_pending = true;
>> +    }
> 
> Could I talk you into un-indenting the last if/else by a level, by making
> the earlier else and "else if()"?
> 
> One aspect I didn't properly consider when making the suggestion: What if,
> without all VFs having gone away, the PF is re-added? In that case we
> would better recycle the existing structure. That's getting a little
> complicated, so maybe a better approach is to refuse the request (in
> pci_remove_device()) when the list isn't empty?

Hm. Right. The growing complexity of maintaining these PF<->VF links
(introduced on a hunch that they may be useful in the future) is making
me favor the previous approach from v2 of simply copying the vf_len
array. So unless there are any objections I'll go back to that approach
for v4.

>> @@ -700,10 +722,22 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>           * extended function.
>>           */
>>          if ( pdev->info.is_virtfn )
>> +        {
>> +            struct pci_dev *pf_pdev;
>> +
>>              pdev->info.is_extfn = pf_is_extfn;
>> +            pf_pdev = pci_get_pdev(NULL,
>> +                                   PCI_SBDF(seg, info->physfn.bus,
>> +                                            info->physfn.devfn));
>> +            if ( pf_pdev )
>> +            {
>> +                pdev->virtfn.pf_pdev = pf_pdev;
>> +                list_add(&pdev->virtfn.next, &pf_pdev->physfn.vf_list);
>> +            }
>> +        }
> 
> Hmm, yes, we can't really use the result of the earlier pci_get_pdev(), as
> we drop the lock intermediately. I wonder though if we wouldn't better fail
> the function if we can't find the PF instance.
> 
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -150,7 +150,17 @@ struct pci_dev {
>>          unsigned int count;
>>  #define PT_FAULT_THRESHOLD 10
>>      } fault;
>> -    u64 vf_rlen[6];
>> +    struct pf_info {
>> +        /* Only populated for PFs (info.is_virtfn == false) */
>> +        uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
>> +        struct list_head vf_list;             /* List head */
>> +        bool dealloc_pending;
>> +    } physfn;
>> +    struct {
>> +        /* Only populated for VFs (info.is_virtfn == true) */
>> +        struct pci_dev *pf_pdev;              /* Link from VF to PF */
>> +        struct list_head next;                /* Entry in vf_list */
> 
> For doubly-linked lists "next" isn't really a good name. Since both struct
> variants need such a member, why not use vf_list uniformly? That'll then
> also lower the significance of my other question:
> 
>> +    } virtfn;
> 
> Should the two new struct-s perhaps be a union?
> 
> Jan


