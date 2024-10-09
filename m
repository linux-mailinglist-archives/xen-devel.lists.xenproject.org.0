Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094DE997764
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 23:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815166.1228876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sye5n-0001FE-9O; Wed, 09 Oct 2024 21:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815166.1228876; Wed, 09 Oct 2024 21:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sye5n-0001Dn-5z; Wed, 09 Oct 2024 21:19:35 +0000
Received: by outflank-mailman (input) for mailman id 815166;
 Wed, 09 Oct 2024 21:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ew84=RF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sye5m-0001Dg-4e
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 21:19:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bf63c25-8684-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 23:19:31 +0200 (CEST)
Received: from BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::31)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Wed, 9 Oct
 2024 21:19:26 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::c6) by BL1P221CA0024.outlook.office365.com
 (2603:10b6:208:2c5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 21:19:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 21:19:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 16:19:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 16:19:25 -0500
Received: from [192.168.122.223] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 16:19:24 -0500
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
X-Inumbo-ID: 2bf63c25-8684-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3JxR+2EW4H+2ZWM8D4HSzHs3xg0KVzoLwnB+1fdbSCjSqPEKlkwagqB1k/AI4f5leB8aTIsDnCYu00mimGW8dLKwEM2rutkvBgsLHgOkZu34n+ETAstv4dZc786aaSuD/0e0Ss7lwBhM0DzAIv/IsGf6XnZaVnOChws50qGl0DdAm8DYVCEh0gIoLcNK1kaSzSTSn6ny96+wZ7YIhOUMgocFk1M5aFRCD+aXnAPOsobrFTWH7hnJYVVuw6mulYptMzwbFqBHxyIw3NKR/aknQ5dtMaHlbFW+JaLYTHl4Mary7Tl3UMvMKBIwIi+fNgLKSvkqufQva9VQ21iPzyDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm9H2sJ2B8HQgzYgvUETMnqOxiRHIZ2hfc/bUT81ZVs=;
 b=helFA0fILJB7M5OMawflH4n2lmpdmgfNYi0cyhl9HQpriqVDWkIoir5fRQGiAQ1fg5/+28JA0tkCgLWFcg/Xohj1k+s6miT62ith03xj1b1WvUxtLp7k3gbH1WnhPWo1HwutkofVNhK72ZhnvtCNpd6rSG9RNLIz9soeWJulqEDwt++GI+OBM+nUkGc/NoodmTPbuDtRCIcjXVmSYmVLlq7FzXhNwZdDd+ReOLLcOIH8NYNfhgl6ogQsqpTsXb3GXu3MO6Rw1Q/UptUYGL2g0IY7F9Ebof1I1/808t2luFqSoi0gfoFk1DetzvFI4whg9miSirrpjp7kf3KFy3qGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm9H2sJ2B8HQgzYgvUETMnqOxiRHIZ2hfc/bUT81ZVs=;
 b=irCIzd3hV3mZFP4TsmStHjnbW0/xmxZxi6kRVkKSKApKanXPaj7G2A/AAOZenqMSKYyqDo6HDNZ6sK5HlhoqUu0+1rnixXyWAa7c0CPRCTND4Xkq1Y6hZQUVN/w7ZTpJRjKFpRsCu31Z6AKm6LyEj9xzP5/EFirwh8eZLma4PMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <af7d1665-650b-4aff-9e49-d1d7ecef63c7@amd.com>
Date: Wed, 9 Oct 2024 17:19:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
 <Zs3StA1aZJi5ffZj@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zs3StA1aZJi5ffZj@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c82226-5591-4005-30fd-08dce8a80d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVpnM1NQdDJqZVZpMmo2T0dkdzZ5YVVPdThKSit3VWxidFgvVWltUFhnaEt5?=
 =?utf-8?B?UlJnZEFTOWNROWN6WWJobjVjeHN4ZStMR2t3ejRleTdKdE1RcnVyWnhLRGp2?=
 =?utf-8?B?WG55SU80bzlYQnFYdnQwNC9Cek9ZaE9xeFIrcUY5V3BjMi9JV3FjQXE0Qmda?=
 =?utf-8?B?Mm83ZmRJVHRSWWpMaVM0TWVVTUVlWW95U1FoL3lQMXF1Z1piNDQvTlkzSUJi?=
 =?utf-8?B?SUtka0JzRjF1YWVoVDNtSFhHLzljRXFRZjZUcmRKTXlIaDNOVWxjR3E0Ymd6?=
 =?utf-8?B?bms3bVY1NHBuWGRtUDNXMVdscVZWVDNSQkk4VlZ4L3B4MU9rMyt2U29vYk1x?=
 =?utf-8?B?Zkt4MjA5TEJyNWJmVjNud2VObENVZGw3OWh0TXRvUzJwRnI1YlZZb1ZxUVFQ?=
 =?utf-8?B?MXdNS2hXdmtRWk9RV3dWZkxKVjY3aTREZ043UU1Id2Urc3k3SG5ZU0J3aHgx?=
 =?utf-8?B?OUFPN0FvZVRrYXdjQitWbDI4SlBBZlR1bjV6N0lTQXJGOTVnQnlHck1tc1d1?=
 =?utf-8?B?YnJ0YW5YSXVJMFg5QnROSXBDTmd6RDR6UkpGYlkvWGs2YlFKeGsrdS9hMmk1?=
 =?utf-8?B?MEV5eXdYbWRtQjhOOUNEQWlBSXNFeFZYcnVDSy9Jbkw1elFpbktBYkNFZVBW?=
 =?utf-8?B?WjZrMFFsRXVLbENJcFRsRE1Cbm1QWUQ1MDBGcFJFM21UQzhQQXdzSExUcGdU?=
 =?utf-8?B?UFZzUzVwNWRYKzYwUFJkWkkrRWtpMWp2aEVpdTM0bWlGVnk0VUtoWkNiTldB?=
 =?utf-8?B?Z3JTQW4zRzR4akM0TnRwRG82OWlqZVNWeUx2SlBMWm5ZUnJoUXBRVTlFdC91?=
 =?utf-8?B?Mkl6QTg3M0hBSm53eVMyd2FQNmxkZlVZRzhpT1FUeS85QXA0WVVSZ2NpYjNU?=
 =?utf-8?B?THRlSDd6UlhRRFdGZlJHb3RONVMyNWFuSEpDbjlFZnU5clJodklFejJnYmk0?=
 =?utf-8?B?UTgzSzdmZTFtblRLck53cWcxZUJWS0NCUWdlbEZpY29OMlVDdTlyd2Z5cVBz?=
 =?utf-8?B?TlNNbjYwYUYwL1d4bEdLUUFTeWF2SWV3c3lsSHgxVjMwZXNTaXZEWE5oeVQx?=
 =?utf-8?B?dkgrMEhaWTc1dDBQajdjeFZPck5VTzRMaVYydjFuMm1DSnFqWXRhU2hMTDA4?=
 =?utf-8?B?R3J5TTlTT1l3b1JGVjVEbnFEZVFKVWhGZ2dHczlsUWZRYzc0L2tTdXJSKzcw?=
 =?utf-8?B?ek5JcTJNTWVBVHFtZEk2bGRUYnRlWlAydm9XS1Z2SDhuZEMzNWZJU3YvUG9O?=
 =?utf-8?B?c2JnNXIvTUxaZWxuNzRnbi9ORm1wUUhIUkVnUWNaZ2tBV0NlR2lYL0lDYmpp?=
 =?utf-8?B?V1RtRFkrU2N6NFAxcXVrNmE4QWFjRHF4MmFPMStPc0F5VVM5UUp2V0xqK3Rv?=
 =?utf-8?B?QkF4dklLS2xWaXBhaUNFZ2hDN1h6TnFNRVQ3Yk16S3FDYkNDa0ZIeUZJZ1hK?=
 =?utf-8?B?MHRmVkFJNUJzOWRrZ0FOUUZGZ3ZRZUM3K1dVdy9YdzhKbUEzem10ZjdVS2k0?=
 =?utf-8?B?Yng4NGFWMjZMUHQxbXVPTVBoMzFmWlBNeFJORzRMeDF0eUlKVUg1ZkJYSzdD?=
 =?utf-8?B?dk5EV2dacWE3dzZlUnQzTEs1dnF0WEFRUzlKSmdBdnAvK01iOVkwRjJpV1NF?=
 =?utf-8?B?T2RvdmszRzlPSG5TakRENjA4TzBuMmJjSjBtV1ZkOTlPOHN1cU1KaFc0bURJ?=
 =?utf-8?B?ZUJtQktiSjRDY2JJV1FOaXZGV2ZianpLYklRWWIwb3NNNEd4UHhFbGRycVdX?=
 =?utf-8?B?K1NhcmFLMmEySWpmdnV0Um1nQ0c3QU9jcGJMTFI1T2dBeUtnN3NwVVBGdDJM?=
 =?utf-8?B?N2FVWDl0b3JMaW9oTUdOOVNGRUpyRU93RURQclRKalBxZ0M5Y2NtVnMrY2xx?=
 =?utf-8?Q?9wS9mFrRNzh7V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 21:19:25.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c82226-5591-4005-30fd-08dce8a80d87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On 8/27/24 09:20, Roger Pau Monné wrote:
> On Mon, Aug 26, 2024 at 11:59:28PM -0400, Stewart Hildebrand wrote:
>> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
>> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
>                     ^ was?

Yep

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
> I think there are two different fixes in this patch, that should be
> split into two separate fixes:
> 
>  - Fix for the locking issue, which requires adding a pointer to the
>    parent PF in the pci_dev of VFs.
>  - Introduce better tracking of the PF<->VF pci_dev relation.
> 
> My suggestion would be to introduce the tacking between PF and VFs as
> a pre-patch (IOW: the linked list related changes), and then do the
> addition of the pf_pdev (the proper fix) as a followup.

Agreed

>>
>> Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Candidate for backport to 4.19
>>
>> v3->v4:
>> * handle case when PF is removed with VFs enabled, then re-added with
>>   VFs disabled
>>
>> v2->v3:
>> * link from VF to PF's struct pci_dev *
>>
>> v1->v2:
>> * remove call to pci_get_pdev()
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
> It's not clear to me, does this crash happen even without this change
> applied?

Yep, indeed it does

> If that's the case it seems like you need an extra Fixes
> tag (see above for my recommendation to split the change into two).

Yep

I'm taking a slightly different approach to fixing the
pci_msi_conf_write_intercept() crash, so I'll plan on having 3 patches
in v5:

1. Remove ASSERTs in pci_msi_conf_write_intercept() and pci_reset_msix_state()
    Fixes: 484d7c852e4f ("x86/MSI-X: track host and guest mask-all requests separately")
    Fixes: 575e18d54d19 ("pci: clear {host/guest}_maskall field on assign")
2. Introduce PF<->VF links
    No Fixes tag, but pre-requisite for the next patch
3. Fix the locking issue
    Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")

>> ---
>>  xen/arch/x86/msi.c            | 33 +++++++++++----------
>>  xen/drivers/passthrough/pci.c | 55 ++++++++++++++++++++++++++++++++---
>>  xen/include/xen/pci.h         | 13 ++++++++-
>>  3 files changed, 80 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index 0c97fbb3fc03..8d54f268dbbf 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -662,34 +662,31 @@ static int msi_capability_init(struct pci_dev *dev,
>>      return 0;
>>  }
>>  
>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>> +static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf,
> 
> Since you already have to touch this, I don't think it would very
> complicated to pass a pci_sbdf_t here instead of the seg, bus, slot
> and func parameters.  You can expand back to seg, bus, slot and func
> as local function parameters in order to avoid more code changes than
> strictly needed.

Sure thing. May as well change the return type and bir to stdint.h types
too.

>> +                            const struct pf_info *pf_info)
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
> 
> Is it worth adding a:
> 
> if ( !pf_info )
> {
>     ASSERT_UNREACHABLE();
>     return 0;
> }
> 
> As I think pf_info must be != NULL if vf >= 0?

We will need a "if ( !pf_info )" check in v5. In v4, it would be
ASSERT_UNREACHABLE(), but it won't be anymore in the next rev.

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
>> +             !pf_info->vf_rlen[bir] )
>>              return 0;
>>          base = pos + PCI_SRIOV_BAR;
>>          vf -= PCI_BDF(bus, slot, func) + offset;
>> @@ -703,8 +700,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>          }
>>          if ( vf >= num_vf )
>>              return 0;
>> -        BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
>> -        disp = vf * pdev->vf_rlen[bir];
>> +        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
>> +        disp = vf * pf_info->vf_rlen[bir];
>>          limit = PCI_SRIOV_NUM_BARS;
>>      }
>>      else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
>> @@ -813,6 +810,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>          int vf;
>>          paddr_t pba_paddr;
>>          unsigned int pba_offset;
>> +        const struct pf_info *pf_info;
>>  
>>          if ( !dev->info.is_virtfn )
>>          {
>> @@ -820,6 +818,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>              pslot = slot;
>>              pfunc = func;
>>              vf = -1;
>> +            pf_info = NULL;
>>          }
>>          else
>>          {
>> @@ -827,9 +826,11 @@ static int msix_capability_init(struct pci_dev *dev,
>>              pslot = PCI_SLOT(dev->info.physfn.devfn);
>>              pfunc = PCI_FUNC(dev->info.physfn.devfn);
>>              vf = dev->sbdf.bdf;
>> +            pf_info = &dev->virtfn.pf_pdev->physfn;
>>          }
>>  
>> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
>> +        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf,
>> +                                       pf_info);
>>          WARN_ON(msi && msi->table_base != table_paddr);
>>          if ( !table_paddr )
>>          {
>> @@ -852,7 +853,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>  
>>          pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
>>          bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
>> -        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
>> +        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf, pf_info);
>>          WARN_ON(!pba_paddr);
>>          pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
>>  
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 5a446d3dcee0..97b3417252f7 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>  
>>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>>  
>> +    INIT_LIST_HEAD(&pdev->physfn.vf_list);
>> +
>>      /* update bus2bridge */
>>      switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
>>      {
>> @@ -446,6 +448,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>  
>>      list_del(&pdev->alldevs_list);
>>      pdev_msi_deinit(pdev);
>> +
>> +    if ( pdev->info.is_virtfn )
>> +        list_del(&pdev->virtfn.entry);
>> +
>>      xfree(pdev);
>>  }
>>  
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
>> +                goto out;
>> +            }
>> +        }
>>      }
>>  
>> -    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
>> +    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>>      {
>>          unsigned int pos = pci_find_ext_capability(pdev->sbdf,
>>                                                     PCI_EXT_CAP_ID_SRIOV);
>> @@ -715,7 +742,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>          {
>>              unsigned int i;
>>  
>> -            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
>> +            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
>> +                                    PCI_SRIOV_NUM_BARS);
>> +
>>              for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
>>              {
>>                  unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
>> @@ -730,7 +759,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>                      continue;
>>                  }
>>                  ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
>> -                                       &pdev->vf_rlen[i],
>> +                                       &pdev->physfn.vf_rlen[i],
>>                                         PCI_BAR_VF |
>>                                         ((i == PCI_SRIOV_NUM_BARS - 1) ?
>>                                          PCI_BAR_LAST : 0));
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
>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
>> +                                         virtfn.entry)
>> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
>> +                                            vf_pdev->sbdf.bus,
>> +                                            vf_pdev->sbdf.devfn) ?: ret;
>> +            }
>> +
>>              if ( pdev->domain )
>>              {
>>                  write_lock(&pdev->domain->pci_lock);
>> @@ -826,7 +873,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>                  write_unlock(&pdev->domain->pci_lock);
>>              }
>>              pci_cleanup_msi(pdev);
>> -            ret = iommu_remove_device(pdev);
>> +            ret = iommu_remove_device(pdev) ?: ret;
>>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>>              free_pdev(pseg, pdev);
>>              break;
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index 63e49f0117e9..a24026d25148 100644
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
> With this pointer being introduced for VFs, is the information in
> pci_dev_info still required?  It would seem to me the physfn.bus and
> physfn.devfn fields can now be fetched directly from the pf_pdev
> pointer?

Hm, well, in v5, the pf_pdev pointer may be NULL. So every time we'd
need to access that info, we'd need an additional NULL check.

> 
> Thanks, Roger.


