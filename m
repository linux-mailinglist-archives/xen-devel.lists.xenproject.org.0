Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637495E4A2
	for <lists+xen-devel@lfdr.de>; Sun, 25 Aug 2024 20:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783193.1192547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siHaX-0003PD-KH; Sun, 25 Aug 2024 18:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783193.1192547; Sun, 25 Aug 2024 18:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siHaX-0003Mf-H3; Sun, 25 Aug 2024 18:03:41 +0000
Received: by outflank-mailman (input) for mailman id 783193;
 Sun, 25 Aug 2024 18:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ElmV=PY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1siHaV-0003MX-EQ
 for xen-devel@lists.xenproject.org; Sun, 25 Aug 2024 18:03:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2412::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5923c29d-630c-11ef-a50b-bb4a2ccca743;
 Sun, 25 Aug 2024 20:03:37 +0200 (CEST)
Received: from BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::15)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Sun, 25 Aug
 2024 18:03:29 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ad) by BY1P220CA0004.outlook.office365.com
 (2603:10b6:a03:59d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Sun, 25 Aug 2024 18:03:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Sun, 25 Aug 2024 18:03:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 25 Aug
 2024 13:03:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 25 Aug
 2024 13:03:27 -0500
Received: from [172.20.142.25] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 25 Aug 2024 13:03:26 -0500
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
X-Inumbo-ID: 5923c29d-630c-11ef-a50b-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3WGYEiRDFbOtAwiyqrBBToL/QqAUHLfeutGTmq5GmrKR66Svnj/QIy2Ezm0DpLhroMYfxvDiQZYcCOIx0Pg4uLPGgLOidF/kXD9/hgNN2jGaKh20MBrygUWpW1ZM+HSlM43q3ehzpc38IeGtEjom4AYT08lUHitPxS9N3Vyc3svqOGXgjZxw/9rFrRXikYVWanXUzSEA0Sqg4l89mDQGEwTI5JP/t3wN2j0Bp5pETyANpl5gb6O32TZ13916qoMr4iHNHZPftu7EHmEMNVzeX+oyfWUM7CZhYcw1spOpyueks4Ex5rO2kYfAIuNeOpVHl2iSKWucfLjrL3L+zT1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbzNDj1Z9NQ0MfA/byv5edJIS37uK2LeuyIBCwbsJPc=;
 b=rPp3kdh3yTERgSKwZ6AIioW40jdyxBqOftWK04HhQxmctkvuoS5RGU4A8rrhuHjK54IR56R1d4Dcyr2tc826D2YHHxlTo/R6r+FcH1CG5Os8SJn8Fx7+Ux5gij9q3vtbuXW4kzzvUWKpX58GX2yBhE7/IzpOl7Cyl7Fw6g0yvrArJ3OCTC70gJCKQaTu1AsZicDxMKjqSSOk4bU7dEreJ8w8aBS/1c8xLD76cDUcRr5jwMWIjh0gPSNbL+nTm2Jw39JjgX3da51Hw0PkKOgxi4mGuSNQoSkGJKEKSypAygvrSYjYsDWONEneUhYAvf1oeroGUkiiFOtoZ+t9GsVYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbzNDj1Z9NQ0MfA/byv5edJIS37uK2LeuyIBCwbsJPc=;
 b=Ean88dsjH2xgSyXP40JWkL6pYP0iy6Cp6WChNG9ORoXznWxj3FPrkrrWEKjAIHRZKeIwR2dgxsZyngabjpUreTjLj1LEUF0TewQO4/v4xcZ+mvfpvgF9AnBUWvC82U0+6v6pgQOMsgFsRwoeZrc0RVU4O8vjmeH5ftCaioLOOoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f59539c4-0444-4644-a522-ea33fb2b4dbe@amd.com>
Date: Sun, 25 Aug 2024 14:03:26 -0400
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
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d74c98-d69c-4241-affc-08dcc530393f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWx0WG5FSWY0MHk1cFV5Y1pjTzlESXl0RzdsSnNxejhEb3JRNm5RajVsc0Nv?=
 =?utf-8?B?akFRdnJ6UmgwVGUyOGZHSTV3cWZ2V1hwMW05RjZXZW9XNU1MSGV0UWphTUI4?=
 =?utf-8?B?R25ibkxaVlhhQWNEZGs1U2Vld1EwOTU4S0hXVDlJZXFTblNFcWZ3a0dwbHYx?=
 =?utf-8?B?cGNYMU03V25XMitjMUlmc3NIWTB1YklEakZ1Z1BRTzNpeVZVR0dHS3dxa1Iz?=
 =?utf-8?B?M21QVDg1Rk45Sml0L1NOazlJSFUyVzhSK1JLR3pSdllqU3kxUHd5U0c1N21n?=
 =?utf-8?B?VGNuSmhrSGN2Q3g1M21CYjdtaTl4cXVKamViUE5YdEgzaytUclZYOFJLV1Js?=
 =?utf-8?B?MTNTNHJjRVhPL2pMclZXcDFQODdkamsvMGdqcGFNUWVLUnJsL2ZCZXZRSjdi?=
 =?utf-8?B?ZE5MNXZwVFdYTDZrRlYvQzgrd1ZvUHRDVWtwQXY4ZWpDV2VDcExiZjFGdlpC?=
 =?utf-8?B?RjVMR3JQTkMxM25WaHpzWllqRFRlbklOTSt1MldYak1ja3JyaWRFRnNDbkxi?=
 =?utf-8?B?ejE5YkVpc0RLNU5rTmdvNnBOUFBvTnpJQTR5UFM5aVlrZXg1TG4wYzhoT1Nw?=
 =?utf-8?B?TndSa1FjQzFUcDlQM1IwV3FONlZGa0NOV0RtT0o0QVN4RkRmN2tuY3YrejhX?=
 =?utf-8?B?QVUrNWxMN2Q4bEF2WS9OT2ZrRmZOeC9CYXNpN3ZIajM2RmhTRHpkNzZTQ1lW?=
 =?utf-8?B?enkvcGJFWHhub05kbnMwQ093dTIrK0dyNUVBSXJNSDArd0d1SHJDeFBjdDNB?=
 =?utf-8?B?cFNRZk5RanREeFJnNGFTVko3NTU3Zy9UTm5VQzJPWXdkK1J4VTc5TVd0SVl4?=
 =?utf-8?B?R2tObDhlWXA1TExxWFdZeGExdnRDRldRM0dpTXhya3FrekFxa0tJYkt4Ynh5?=
 =?utf-8?B?c1ZwUjZXNkRpTjc5ZGx6RGlwK1d0aU9DcVY3WmZGWnRBdHJLTmF6Z2QwTWda?=
 =?utf-8?B?b2tsdkY0RUl5TVlYNmxNaFJUZ3JwUDRrZFVaa3ZrWm5ZbHZ5RWFhZk9pVjFw?=
 =?utf-8?B?a1dIZzczVGYrUjV3LzAwcVFRWSsyNHROVHc3TEp5bWp0d05ZeHpYNkpoV1Nx?=
 =?utf-8?B?NWJiaDllQy9xYXEzTVpxNmJIeFBkZW9jTEM4ckw0eDRJRmJHWlVaQVpxOTFs?=
 =?utf-8?B?UjRzN093OEhuYTE5RnlXVVRuZkhnTEJFVTMycCt1ZTdJekd5Yk1IeExhYlVQ?=
 =?utf-8?B?Znk5ZlRYUkZiU0Q2M1lhbkhDZ0EycHVtR2hpbHhRT25JaXI3WVhXSXRFYWxF?=
 =?utf-8?B?RHIzTGJyanhzdU1BcDNUcFc2dlVsNUdSb2V2MmtHMTNmOVNNRHFMMm55K2lS?=
 =?utf-8?B?YXpOWHJ1ZjkzU2pud05vYVRhdHNpMy9zS0MvWE4vckw2Y0RXQVZZanJjWHRY?=
 =?utf-8?B?VG01bk1KR2FPR0VsVXM3L09TT2F6NVhtOWlMVUFjNHZxODkvMVg5Rk9mYUJ0?=
 =?utf-8?B?QTd5dXoySGNqc2wwQ1Z4alZBWCtPUkFIK0RObXRQNUhQTDJXblIyNkZjdHVY?=
 =?utf-8?B?Rng0Y0FNdWVFVkJ0bjBaTVUxaVdaZlhFOE5pZGNLNXAvaW54NWFzaFBCNzA3?=
 =?utf-8?B?MkRzSjQ0THZyMWpKUTJsLzlOcy9mT3lLVlUrWE9CdnpkanFVWE5oK3pSUHhm?=
 =?utf-8?B?N0VDZEFGSTRVRi9vdzdPbXlkelVUaU42bXNEZmxwRDA4RHFTRjhjRWcrY3c1?=
 =?utf-8?B?M25tcWdjVXhRSHFXbzR0bCs5M2VCUzdLZEY3dXZLdlRxMFRjaHpiMTQwRDNU?=
 =?utf-8?B?WU04VzVvWEJ4QmR5cUV3aVpvM1paT1pzd1VDMFdwbmVtMnhkZ3RJa3ZkRnZH?=
 =?utf-8?B?UTlNT0V0SUFPM2o3T3Z4TVZVVW9jNWVGZ1hMZHRaZDQ3VFBFcUhsQ0RXUkNu?=
 =?utf-8?B?eGR5NWxqcnFNTTVQaWNGdWg1ejBZT0Nhcmh6UmQvbkFjdWRsY3VqWndUVTYw?=
 =?utf-8?Q?or3nNoeGG/4jQ3010m+45zKgkGlecvZ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2024 18:03:28.7626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d74c98-d69c-4241-affc-08dcc530393f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

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

This last bit of the commit description isn't adding much, I'll remove
it.

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

OK

>> @@ -813,6 +811,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>          int vf;
>>          paddr_t pba_paddr;
>>          unsigned int pba_offset;
>> +        struct pf_info *pf_info = NULL;
> 
> Pointer-to-const?

OK

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

OK

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

Yep. Actually, there will be no need for dealloc_pending after reworking
pci_remove_device() (see below).

> One aspect I didn't properly consider when making the suggestion: What if,
> without all VFs having gone away, the PF is re-added? In that case we
> would better recycle the existing structure. That's getting a little
> complicated, so maybe a better approach is to refuse the request (in
> pci_remove_device()) when the list isn't empty?

I set up a test case locally to remove a PF without removing the
associated VFs by hacking an SR-IOV PF driver. Although the PF driver
*should* remove the VFs first, it's completely up to the particular PF
driver how VFs/PFs are removed during hot-un-plug, in what order, or
whether at all to remove the VFs before removing the PF. Anyway, during
PF-only removal, at least the Linux PCI subsystem warns about it:

[  106.500334] igb 0000:01:00.0: driver left SR-IOV enabled after remove

Returning an error code in pci_remove_device() results in only a warning
from Linux:

[  106.507011] pci 0000:01:00.0: Failed to delete - passthrough or MSI/MSI-X might fail!

Despite the warning, Linux still proceeds to remove the PF, and we would
retain a stale PF in Xen. Re-adding (hotplugging) the just-removed PF
led to Xen crashing in another weird way.

To handle this more gracefully, I suggest removing the VFs right away
along with the PF in pci_remove_device() when a PF removal request comes
along. This would satisfy the test case described here without Xen
crashing.

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

Yes

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
> variants need such a member, why not use vf_list uniformly?

I'd like to retain some distinction between what's a list head and
what's an entry in the list. I suggest the name "entry".

> That'll then
> also lower the significance of my other question:
> 
>> +    } virtfn;
> 
> Should the two new struct-s perhaps be a union?

Yes

