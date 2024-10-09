Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43549975E1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 21:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815134.1228857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sycc8-0001lp-JL; Wed, 09 Oct 2024 19:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815134.1228857; Wed, 09 Oct 2024 19:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sycc8-0001il-G3; Wed, 09 Oct 2024 19:44:52 +0000
Received: by outflank-mailman (input) for mailman id 815134;
 Wed, 09 Oct 2024 19:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ew84=RF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sycc6-0001if-HW
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 19:44:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0543a6d-8676-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 21:44:48 +0200 (CEST)
Received: from BYAPR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:e0::27)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 19:44:35 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::15) by BYAPR05CA0086.outlook.office365.com
 (2603:10b6:a03:e0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 19:44:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 19:44:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 14:44:33 -0500
Received: from [192.168.122.223] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 14:44:32 -0500
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
X-Inumbo-ID: f0543a6d-8676-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKEbjnWjlDWpDZHf1NOUS2aTg+Ji8eRiijhXW8N/mRW58aPa+5HMW6hlkhPj/iuVUObSPcnJZBMuT9sPwqI0iNeiVEN81gkSSe+kM5mWjKsQCFRgIcSZx9GJAV2KoWsCUG4pHS+BdcZeTMDXzxUQ+BTrbs+LhdskaiXm2CxaLv1wPTSgc3Aa9cYLfojYZpQZetOnR1VyhTQlljA/82WMXM1nBKzG9BllLyPllclNAkHb3/0M9Pz049LoYYn9GkPueEBe9dJ2biozR1dO5VBsDMGcf7lw+rkka5HtXTqvH1t6nmK7AJlvWGB+4uTXdiMJ32OtZay0Vg0wBrPEoBDwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QKKp7QM21USfNn3ts1sfPgSOY8GaCm452qS0059oIs=;
 b=Lyq7j0msoPJ2CLluHsvhvvt1QWN78JuOEK3dAJ7s8oeMaDvaQkozL19MlF8X933+54STwynYHNRnJ7TIGqnMg2s4rgHVTR8hSIbqM9TyIJvkRSKQCCiszuTxlmRm/6oSoC0ZoaS+zUCOWjQQ4BwczExoHk4DhbFavH2CRg10A/KZCFRCjdFpQRb4uhhwGRvNSQPgS1ikcbZn5f4c7/nLxbPVhS5a0dZ+pyI1tAb7QGgar4bSztEXFUqzQkkZj2kZr/FUrXutEbchakoTM1g5+5WnSsOGaI3wJ6wsJeO6NbQxRgmD41WzCMxEJRu+q5YacFPeOg08CUxhiT+MIkt1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QKKp7QM21USfNn3ts1sfPgSOY8GaCm452qS0059oIs=;
 b=OmVce4u/yIbLT1chN3WVMgKKoaXEIahPciJYrr7YCmQe/Wmzoq8kUnfCIw4HGWpai//d4v0En21ifKFaXKV34zGGWYBUS36EW6N3nnCh/rQoowc1tsWv1I00BPDX/Vyk6i66Rw79JHLOypz3cwQVU3bQ3v0gJbOJNIZtSiZHnUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <695c81b1-1cc0-40f2-ba41-8c96a461c668@amd.com>
Date: Wed, 9 Oct 2024 15:44:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
 <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9642e2f6-fb2e-436a-f530-08dce89acd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjJXNm9QTGRoZ1BUUkFoR1lnSEFuSjBCb1F6bERCckRwOFRzeTIzUUhJVzYv?=
 =?utf-8?B?UklpUTlQV08yQnhEMlFSS3RYUVVPRFRBMmhyUDFWL3lXVDA3cGdJNzVFZ0Vw?=
 =?utf-8?B?UVJ6WHdQUmdyWWViZG5scTBvNzE3LzhKSCtCQ2duWjJtcXVENGZ1NWdRTEUv?=
 =?utf-8?B?S1FYTWJaY2trVWNWN1FJb3pBaTNpbThOUGRrVDFWdWphMHVkMmMwcEQ4OW5y?=
 =?utf-8?B?T0lMUVYwZkFZdXFiME5pUGJBVzlsRDBvaUpVVXZPSmhMRWFEeUNmaS84QW0y?=
 =?utf-8?B?V3JnT28vWUJvM1VLQml6bEN4WUVWSXRFVFBQbHJLSXBnZERaVGMvdWZFTnRT?=
 =?utf-8?B?NGRtUXlDZWF2aVFaZHhlaHhmL25STERmUnp3enhIc2ZRS0JCa2FTZHlrZEw2?=
 =?utf-8?B?d2JSYnZwZVRtNDF2YXIrbmlUK1E1QkErRWZJWDJPL2c4UlZMOTlpOGxwR3Jo?=
 =?utf-8?B?L3FqcWJpM0F2UHUvamR6dis3Q1YvK0ZvVDdUWGFVMlZDb0F1dDVlc1JlR3Zl?=
 =?utf-8?B?TWtpcTdmbEZzak5hU1JrWlNNeUlpWUdGbytnVVBaaVR3Ui9nc0xTa0wwN0dB?=
 =?utf-8?B?cjBiaUUvZng1d1N2ZkZ3UEpabjV0ZldhT293YXUxVkdVRisxWEF2dHd3aXpk?=
 =?utf-8?B?a1U3b1U2aVFYMGcvTTJ1SnExQWZGZTM2QVZLcFB4azE5WFcwL25nTDFBb3BL?=
 =?utf-8?B?bE9taEJRdEtVWm9uOFhJbWdhVUl1TE5ORXdiS09SZnhXRStNV21SckEvWjNB?=
 =?utf-8?B?ZUpqMHQ2OS9OYUlTNUg0dm1aNkFRblZhMWlnSnlGMkxVOU0vb2huZ2pHdVJH?=
 =?utf-8?B?a3NNek1ZWUt5dWFwY3QwWm96U2V5Mm9ueDJjblpQV1VOeEx3VStPTWlyS0Fi?=
 =?utf-8?B?UWw3SVZTdkhhdmdQa0xCWnh4YUpRcXU4RjRxSndFeVAxczY5NFVBNGZaMmYw?=
 =?utf-8?B?L0hHbDJRNkJ3a0RIcFp1Z09vSlpuRmJQQXVYbnVkQnVWdUg0UUVzcGpnRmND?=
 =?utf-8?B?aHJTYnN1UjJCMmxPeG9pUGZFTkJyR1dpWUhpN2QweHAySzZQK3JnTk9SZXp3?=
 =?utf-8?B?SGUzRCtaZEdBckVtY2QzR0Z1N2x0cnhFclREc3Z4RllYVkIrbENYL3hYUlBz?=
 =?utf-8?B?UkoyYURkNTNpSVIrTUVjTGVxVVV5RE1LWWtxaThIYVA3RVJERzRPUno1a2cr?=
 =?utf-8?B?SU1YRVZLMUVtdTV3U1FpdWtVaHdqNWM2WUllNEJRZ090SW1ER1lhN0JJSDdw?=
 =?utf-8?B?WjNpZHN2NkFZcVN0SXNibXZlcmxTWG9RYnVNTlZEcThyajEwZkZsalVOZ1JZ?=
 =?utf-8?B?L2JUVlpvaGM2N0MwMHI2SUExRzFFY0JnZW55NkNjejNTbC9kZ0FBR2Z3QTQr?=
 =?utf-8?B?Yk9EZ0tLcU1BYWltWUNUcFQ2L3cvRHgzZWNtSnladllRblJvbUdjb0RjTDk4?=
 =?utf-8?B?S1ZOdGt2cDBQQVNBRms4RXQ0bFZ1djg5eGMwZyt0OG1ObytQRHl0ZTYybkQ0?=
 =?utf-8?B?VDc2bzVBbDJRYkZqOWFRa01yVjNqK3B0WG9jUzUxYXphNThNa0UrdXEwRTZU?=
 =?utf-8?B?SlRLVzVJT0RWbk02b0laZ3hFeU5FTnhnN1M0clBudGRaaTBDQXNhbmpDM2Rv?=
 =?utf-8?B?aUNERmI5eExlOXEzMlFPV0Fza2JyY3NHcDJKMFhJci8rOFlWaUpYMGt6ZGk4?=
 =?utf-8?B?QWJVMlg0SUZDVnc5S3ZtYWlRS3BKN0FYdGRDeDdFVStVNVVNTVBUUUlHV2gz?=
 =?utf-8?B?cldZRUxvbHk4Q1daTFJOYWxvaldJMXVGbzJwTE5JS1A0MUR0YlFPTy95SXll?=
 =?utf-8?B?L3creWx4VWZ5T2UxNVNFb3dNd1R2QW9veDA2TFJyTGtLc0ZDM3lSL1pOZmtI?=
 =?utf-8?Q?0VHz3aGADR+LZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 19:44:34.8618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9642e2f6-fb2e-436a-f530-08dce89acd7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608

On 8/28/24 06:36, Jan Beulich wrote:
> On 27.08.2024 05:59, Stewart Hildebrand wrote:
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
>> Add links between the VF's struct pci_dev and associated PF struct
>> pci_dev, ensuring the PF's struct doesn't get deallocated until all its
>> VFs have been removed. Access the vf_rlen array via the new link to the
>> PF, and remove the troublesome call to pci_get_pdev().
>>
>> Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
>> pci_add_device() to set up the link from VF to PF. In case the new
>> pci_get_pdev() invocation fails to find the associated PF (returning
>> NULL), return an error.
>>
>> In pci_remove_device(), handle an issue with a corner case when a PF is
>> removed with VFs enabled, then re-added with VFs disabled. During PF
>> removal, a buggy PF driver may fail to disable SR-IOV, leaving stale
>> dangling VFs. At least Linux warns in this case:
>>
>> [  106.500334]  0000:01:00.0: driver left SR-IOV enabled after remove
>>
>> If the PF is subsequently re-added with VFs disabled, the previously
>> associated VFs in Xen would not be backed by a device. Any attempt to
>> access the config space of the stale VF would be invalid. Avoid issues
>> in this case by removing the VFs right away when removing the PF. This
>> also happens to simplify the maintenance of the PF<->VF links since the
>> associated PF will always exist during the lifetime of a VF. Note,
>> however, if a PF is removed before the VFs, Xen will return an error
>> for the VF removals since they were already removed.
> 
> Not very nice, but probably tolerable.
> 
>> ---
>> When I tested removing a PF with VFs enabled, then re-adding with VFs
>> disabled, I observed the following Xen crash when dom0 attempted to
>> access the config space of a stale VF:
>>
>> (XEN) Assertion 'pos' failed at arch/x86/msi.c:1275
>> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
>> (XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
>> (XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
>> (XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
>> (XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
>> (XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
>> (XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
>> (XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
>> (XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
>> (XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c
>>
>> This crash is avoided by removing the VFs right away with the PF.
> 
> If I'm not mistaken the same would happen independent of your change if
> Dom0 disabled VFs without reporting their removal (first). That's
> technically no different from removing with VFs enabled, then adding
> with VFs disabled. We may want to be able to cope with that.

You're right, the ASSERT in pci_msi_conf_write_intercept() can be
triggered with a modified dom0 kernel by disabling SR-IOV and performing
a device reset on the stale VF, either manually or as part of
"xl pci-assignable-add".

  echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
  echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
  echo 0000\:01\:10.0 > /sys/bus/pci/devices/0000\:01\:10.0/driver/unbind
  echo 1 > /sys/bus/pci/devices/0000\:01\:10.0/reset

If using xl pci-assignable-add, then the ASSERT in pci_reset_msix_state()
can also be triggered.

  echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
  echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
  xl pci-assignable-add 01:10.0

(XEN) Assertion 'pos' failed at arch/x86/msi.c:1246
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040346b0a>] R pci_reset_msix_state+0x47/0x50
(XEN)    [<ffff82d040287eec>] F pdev_msix_assign+0x19/0x35
(XEN)    [<ffff82d040286184>] F drivers/passthrough/pci.c#assign_device+0x181/0x471
(XEN)    [<ffff82d040287c36>] F iommu_do_pci_domctl+0x248/0x2ec
(XEN)    [<ffff82d040284e1f>] F iommu_do_domctl+0x26/0x44
(XEN)    [<ffff82d0402483b8>] F do_domctl+0x8c1/0x1660
(XEN)    [<ffff82d04032977e>] F pv_hypercall+0x5ce/0x6af
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150

These test cases require a Xen with CONFIG_DEBUG=y and hacking the Linux
SR-IOV subsystem to skip the VF removal (not just by hacking a PF
driver). For completeness, this is the modification I made to my dom0
kernel for the test cases.

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index b8302b07a885..562d2024636f 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -385,7 +385,9 @@ void pci_iov_remove_virtfn(struct pci_dev *dev, int id)
        if (virtfn->dev.kobj.sd)
                sysfs_remove_link(&virtfn->dev.kobj, "physfn");
 
+#if 0
        pci_stop_and_remove_bus_device(virtfn);
+#endif
        virtfn_remove_bus(dev->bus, virtfn->bus);
 
        /* balance pci_get_domain_bus_and_slot() */


Anyway, the approach of removing VFs right away with the PFs isn't
sufficient. I suggest (planning for v5) getting rid of the ASSERTs and
returning an error code from pci_msi_conf_write_intercept() and
pci_reset_msix_state(). We may also want to set pdev->broken = true.

>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>  
>>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>>  
>> +    INIT_LIST_HEAD(&pdev->physfn.vf_list);
> 
> There is a certain risk with doing such uniformly when the field is part
> of a union. Yes, little initialization has happened up to here, but I'm
> still concerned. (One of the reasons I don't like the struct list_head
> instances to be split, despite your legitimate point regarding naming.)
> At the very least this wants moving yet earlier in the function, before
> the new struct is passed anywhere else.

Understood. I personally have a slight preference for keeping the entry
and head names distinct, so I'll plan to move the initialization
earlier. However, I could easily be convinced to un-split the struct
list_head instances if that's your preference. Let me know.

>> @@ -700,10 +706,31 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
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
>> +                list_add(&pdev->virtfn.entry, &pf_pdev->physfn.vf_list);
>> +            }
>> +            else
>> +            {
>> +                printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
>> +                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                       &pdev->sbdf);
>> +                free_pdev(pseg, pdev);
>> +                ret = -ENODEV;
> 
> Why -ENODEV? Ideally the error code from the earlier pci_add_device() could
> be retained (even if some fallback would be needed in case that one succeeded
> or the path wasn't even taken).

I'll retain the error code from the pci_add_device() invocation.

> Yet on the whole I wonder if we wouldn't be
> better off delaying that recursive call some, such that the lock wouldn't
> be dropped anymore between the call and getting here.

Agreed, will do.

> This would then also
> eliminate the need for the new pci_get_pdev() invocation.
> 
>> @@ -818,6 +847,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>          if ( pdev->bus == bus && pdev->devfn == devfn )
>>          {
>> +            ret = 0;
>> +
>> +            if ( !pdev->info.is_virtfn )
>> +            {
>> +                struct pci_dev *vf_pdev, *tmp;
>> +
>> +                /*
>> +                 * If a PF with VFs enabled is removed, then re-added without
>> +                 * VFs enabled, the previously associated VFs would no longer be
>> +                 * backed by a device. Remove the associated VFs right away.
>> +                 */
> 
> While in the description the "enabled" and "disabled" are kind of
> tolerable, at least in the code comment I think we want to be more
> precise. The question isn't whether VFs are enabled, but whether we
> know of the VFs.
> 
> It's further unclear here what "a device" is.

The in-code comment shouldn't be relevant any more for v5, so I'll
remove it.

>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
>> +                                         virtfn.entry)
>> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
>> +                                            vf_pdev->sbdf.bus,
>> +                                            vf_pdev->sbdf.devfn) ?: ret;
> 
> And if this fails, the VF will still remain orphaned. I think in the
> model I had suggested no such risk would exist.
> 
> Misra also isn't going to like the recursion here.

With the ASSERTs being addressed directly, there's no need to remove
the VFs right away with the PF.

BTW, I don't think refusing a removal "request" would be a good idea.
Dom0 isn't really requesting the device to be removed. Dom0 has already
removed the device (e.g. in response to hot-unplug or SR-IOV disable),
and is merely informing Xen of the removal.

So during PF removal, I'll plan (for v5) to unlink the the VFs from the
PF, and continue to rely on dom0 to inform Xen of PF and VF removal
individually. By unlink, I mean set vf_pdev->virtfn.pf_pdev = NULL and
remove the VFs from the list. Probably also set vf_pdev->broken = true.

>> @@ -826,7 +873,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>                  write_unlock(&pdev->domain->pci_lock);
>>              }
>>              pci_cleanup_msi(pdev);
>> -            ret = iommu_remove_device(pdev);
>> +            ret = iommu_remove_device(pdev) ?: ret;
>>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>>              free_pdev(pseg, pdev);
>>              break;
> 
> Is it even legitimate to continue cleaning up if there was an earlier
> failure?
> 
> In any event - please consider e.g. the case where the XSM check allows
> the PF removal, but denies the removal of some of the VFs.

This shouldn't be relevant any more for v5.

>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -150,7 +150,18 @@ struct pci_dev {
>>          unsigned int count;
>>  #define PT_FAULT_THRESHOLD 10
>>      } fault;
>> -    u64 vf_rlen[6];
>> +    union {
>> +        struct pf_info {
>> +            /* Only populated for PFs (info.is_virtfn == false) */
>> +            struct list_head vf_list;             /* List head */
>> +            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
>> +        } physfn;
>> +        struct {
>> +            /* Only populated for VFs (info.is_virtfn == true) */
>> +            struct list_head entry;               /* Entry in vf_list */
>> +            struct pci_dev *pf_pdev;              /* Link from VF to PF */
> 
> const?

Yep

> 
> Jan


