Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF34A48605
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 18:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898304.1306875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhGG-0006xZ-PJ; Thu, 27 Feb 2025 17:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898304.1306875; Thu, 27 Feb 2025 17:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhGG-0006vT-ML; Thu, 27 Feb 2025 17:01:24 +0000
Received: by outflank-mailman (input) for mailman id 898304;
 Thu, 27 Feb 2025 17:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMN=VS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnhGE-0006vN-Qr
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 17:01:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76806950-f52c-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 18:01:20 +0100 (CET)
Received: from MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::31)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:01:13 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::fa) by MW4P221CA0026.outlook.office365.com
 (2603:10b6:303:8b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 17:01:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 17:01:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 11:01:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 11:01:12 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 11:01:11 -0600
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
X-Inumbo-ID: 76806950-f52c-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MApFYMUYn+xvkVj9y8Av7JWsbO3CRjM3wh9vGz0ZMVOmeuKpfC03tlr8B75jj3Arr/j7UgevkteP28IdxO4nGi/mzgD+rp+RTEZrxeEuBGtwPDrKk0cp3fTeerYsEKRbJiBf2+sl/KnHZ7Yb762VWl7Jp32Eip9orBi+w5zMhgLjp3ZDqVa8SvOY/Zikg0TEwIEO2U8XQF5xChhtH121U83/mFLPuj1dnubcj6VOHt/+RsJOXnst8PMlTmr4+T7VV7i1+wtztLWUfr4q400KDZmn1N6rcEq8+WriNe8ivJISKeLMewYqOiI06WtwDk9uy/1XDiLLuy2sv1wAzUW6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhKuUpZecKTNwDmLytBusoiddkioKQTZcl1zI3RVgL8=;
 b=ly7QRXu7kYqHK71aCdznthaXUDSMcDoMeh6u0k9eGnQ1+y+SsNL4pkId91U5YfKUiamsEXPR2Td+bEhhYZBj+TaXC/VLWf9kNhfW55XdyO9PX62VaqPcXzhxaqPc5b6kUhZsO5iupWg85dpoX+UzQ/sKMW6IadepSeTmqq1qi5FFNDiybF6Q8fsJN8oZ24jVrkjJgvwcqiMU6mwXV5a9xIAos3JOZWxqndJvdqWIPp4x8RqNTH+2ZnKzYlji0qGDNmNGBrdwV4dYYNUGrtQbRvTvX1UpXyQF/54ynRy0I23ZePc/1G59qHdV3w4mz1lRXaYNUhUpzSFEQi2AF4EENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhKuUpZecKTNwDmLytBusoiddkioKQTZcl1zI3RVgL8=;
 b=11zRDWFagLIhlM/kIAovW9w7URqhdvGvVT2FxphW3G9rpyp58qwcJsImC++IzvCAlzV6li182qHcZOT6zv8h+AXfaVYdkRWmsKnUydSM6gVTKel9HHCefDUe12eaWjbohNDJVCmbT3QrmjvlBU8YFZfM5E3aT2ADidL+mJAWdvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aea5703c-9392-4b80-b517-cc411265e264@amd.com>
Date: Thu, 27 Feb 2025 11:49:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <5184725e-baf6-460f-a8ee-2bb9982d7adc@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5184725e-baf6-460f-a8ee-2bb9982d7adc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: d2667eb9-35ce-4e0e-8989-08dd57505780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmpzUEVrS3kybTVyQUJsNTh1aEVQSEZwNzlJRlBJVnh1OW4yalVaYnhZZHhq?=
 =?utf-8?B?eE9JaFRmamY3VEZnYndNNktvZklEOFpLVlpXeFpjVGVBekt0SXB4TkRIMEpo?=
 =?utf-8?B?aVgzYmNuK0lYZWhZYlhlVjdXRU80VnJvcS91UjVkSmY1Rit5eFluTE1udnZU?=
 =?utf-8?B?QXRKMGE5dUhOamc5ZjRJbEl0TWlISjBaTmdCbXhhREU1YldyQmhBTkVTQ2xR?=
 =?utf-8?B?bDBvYlJsdVJPV1BtdkFrMFpTMGdZSlYxTW5FZXp1cjRad1d6Y3FmekdQM3Jq?=
 =?utf-8?B?M0U2ck5DcUdaS3loamZqT0dncm5KWllrclFYaUlENTFTWms5WWVsQVVoUkJh?=
 =?utf-8?B?dkdhWkpLWmNzN1ZWMmNFSzJNUEw4SXpGaEc0c041VDJSaTlubmlER09XeVVI?=
 =?utf-8?B?L2JBbGpzdWZZZ3BaOVMwMGZ1NmRBeWpBVCtmYVBEUUJucno0S3BqaWhNaWhN?=
 =?utf-8?B?dU1oNzMyazB6TFlWMTZETTJocXR4V3RYTC9aaTc4YkxXRjlJcUhuNWFCWE9K?=
 =?utf-8?B?MkIrQ3pnbTRJUkFhdzl3N2ZqTjI2TkpELzBXWnNueFVlaFBCTTZiQkdjOGVO?=
 =?utf-8?B?QU04M0dFNERQQmtiWnYrQjlYRVZLc1Vna05XeHNlRDlHb3hubFIxcG5DTWlB?=
 =?utf-8?B?QVlYdzh5NW1NMFNWTmpIWlVIZCtUS1A0NFFWblNSdXRXODZaaGVaYlFPZHlC?=
 =?utf-8?B?eDVWYm9tenpNdFZIR0s0cDFISnNaNUw4bHRuMi9JakdZL0prK2ZpR1Z1Wndu?=
 =?utf-8?B?ZFVDNGExWGhRckE3S1NudWREQnpoc2hjRUVtVVhiZE1HdFJWK3liZlEzZHVi?=
 =?utf-8?B?a1VkdFVZcGhWWXhOQ0J0V1p0d2VpL2VvNWFJQkhWY0ZZVlM4VUIybExtQWRP?=
 =?utf-8?B?MGRqbDIxelc4SUx4N3dCZjFENzdvYXN2Tm1YV0tiQkJidXM3VnVsL2NVWlFH?=
 =?utf-8?B?Mks1VnBzWWw5Z3I1aHROS2dOaDA0SFhaa0E5cmFZcGVwS2d0QUV6M09VdXdX?=
 =?utf-8?B?Nkh6QlIzb0ZRUUdGNm5ZNXFralVlVFVsNGp6Mk0rY1BoWjllbmRTSjJTdE1U?=
 =?utf-8?B?d3FkZktvdDJwL0tvdGk3SUt4bHQrSXpoQmZJY2JIeWxUWUI0djNoZkFvcFpv?=
 =?utf-8?B?bktmR3hkclpML0RiWVVtOUlyN0gzekRoVjhoYTY4cnpoYll4ZmNKNlpBWEZP?=
 =?utf-8?B?MHZIMFQxaWFKS1ZaL3AvYUlpMGlWcmlSSU1PeUcvRTJ0TmU4VTFHamVTdlJ0?=
 =?utf-8?B?bk4yNk4zaGRNemJBMnNveDRUdXc3MllRb3ltWmxGdnRSN0hWdzgrNGt0TnpE?=
 =?utf-8?B?L3F0RzN2WkJzNVNCY214Y0dIdjZ3NjdwR0NBMEx2Vm9qay9iT282U1lHRVEx?=
 =?utf-8?B?R3RaVU1TNmJKZFd0cXY3WDJQQmoza2hOQmxYa1NFRGhrbExQb3Z4SnEwV2Mz?=
 =?utf-8?B?S01DV1BwLzFTY1o1K0Z0bHlzMEFTVmRYSDNCSC9yNWJGYXRGZnl1VnhuQTFF?=
 =?utf-8?B?M2h0N0NyMUt1NDFCTXZVWHpsVS9tR3dsQk16UHRMUmhkR2lMNHl2dDR2Yjdt?=
 =?utf-8?B?bGhwTDhMZlFhT0JvZlRoaVllT05GS21KUE5VREhKNDdvVzVYekp2MDhuQ0pZ?=
 =?utf-8?B?TXZFeWIxbVRhcmdobDFjemU0NnlwMGRsOHFXMmF3aDZMZ2xpdXRaeTVLbm85?=
 =?utf-8?B?V3djODVFbzN2VnlMRjVVTjhmaHlzK0hmZjV6NURMTUxOSStXYmhEa29RdW1x?=
 =?utf-8?B?Sm9KeDFXSUJNcmVLSWlFd3J5aWZ2ODZTTGhLRDF6SW1GWm8yRDZuQzl3dFVG?=
 =?utf-8?B?QURoQWVkVmtGOWZoeU1IbUJ2VFB0TVJWSEplQ0JFRks5c3VZeHhicGtROSsy?=
 =?utf-8?B?MkJOVDRQTFJPRlNWVEtUOXBtbHBTTzhPWUlZbUhoSW9BQkRRZUkvUHVBU0RM?=
 =?utf-8?B?WGFzODVWS1VtaVhuNDJpUHVZSXRubkJXVURxT3VwUXpiUTI3UFZjQXhITUZR?=
 =?utf-8?Q?GOVZlhVrxNu/Ar6YmsncMp+ehnAAqs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:01:13.1801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2667eb9-35ce-4e0e-8989-08dd57505780
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

On 2025-02-27 03:54, Jan Beulich wrote:
> On 26.02.2025 22:11, Jason Andryuk wrote:
>> Sometimes we have to quirk the PCI IRTE to use a non-zero remap_index
>> corresponding to the guest's view of the MSI data register.  The MSI
>> data guest vector equals interrupt remapping table index.
>>
>> The ath11k wifi device does unusual things with MSIs.  The driver lets
>> Linux program the MSI capability.  Linux internally caches the MSI data
>> it thinks it programmed.  It sets its affinity to CPU0.  The ath11k
>> driver then reads the MSI address from the PCI configuration space.  The
>> MSI address and cached data are then passed to other components on the
>> same card to generate MSI interrupts.
> 
> I'm curious whether it's known how e.g. KVM deals with this.

There were some vfio patches that did not get merged, FWICT.  A Linux 
patch added a quirk to allow the guest to read the hardware MSI values. 
QEMU intercepted access to a memory region of a BAR and swapped guest 
MSI values for hardware MSI values.

https://lore.kernel.org/ath11k/20240812170014.1583783-1-alex.williamson@redhat.com/

I tried something similar, but abandoned it.  The ath11k driver uses 
Linux's cached value of the guest MSI data and passes that to the 
device.   It doesn't re-read the hardware value out of the configuration 
space.  That made me think using the guest data as an index would be a 
better workaround.


>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Just to clarify: Who's the original patch author? The common expectation
> is that the first S-o-b: matches From:.

I took Xenia's changes to xen/drivers/passthrough/pci.c and 
xen/include/xen/pci.h from an earlier patch and re-used them.  I wrote 
the rest, so I put myself in the Form: line.

>> ---
>> Is something like this feasible for inclusion upstream?  I'm asking
>> before I look into what it would take to support Intel.
> 
> Well, I wouldn't outright say "no". It needs to be pretty clear that this
> doesn't put at risk the "normal" cases. Which is going to be somewhat
> difficult considering how convoluted the involved code (sadly) is. See
> also the commentary related remark at the very bottom.

Ok

>> e.g. Replace amd_iommu_perdev_intremap with something generic.
>>
>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>> all that has been tested.
>>
>> Using msi_desc->gvec should be okay since with posted interrupts - the
>> gvec is expected to match.
>>
>> hvm_pi_update_irte() changes the IRTE but not the MSI data in the PCI
>> capability, so that isn't suitable by itself.
> 
> These last two paragraphs look to again be related to the VT-d aspect.
> Yet there's the middle one which apparently doesn't, hence I'm uncertain
> I read all of this as it's intended.

Sorry, I was just putting down thoughts.  Yes, the last two were 
thinking about VT-d integration.

In terms of the number of MSI, I wanted to highlight that I only tested 
with 1 MSI since I always worry about code I haven't tested.

>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>> @@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>       if ( !msg )
>>           return 0;
>>   
>> +    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
>> +    {
>> +        int new_remap_index = 0;
>> +        if ( msi_desc->gvec )
>> +        {
>> +            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
>> +                   msi_desc->remap_index, msi_desc->gvec);
>> +            new_remap_index = msi_desc->gvec;
>> +        }
>> +
>> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
>> +             msi_desc->remap_index != -1 )
>> +        {
>> +            /* Clear any existing entries */
>> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>> +                                               &msi_desc->remap_index,
>> +                                               NULL, NULL);
>> +
>> +            for ( i = 0; i < nr; ++i )
>> +                msi_desc[i].remap_index = -1;
>> +
>> +            msi_desc->remap_index = new_remap_index;
> 
> You zap nr entries, and then set only 1? Doesn't the zapping loop need to
> instead be a setting one? Perhaps with a check up front that the last value
> used will still fit in 8 bits? Or else make applying the quirk conditional
> upon nr == 1?

The code below here sets all `nr` entries on success:

     rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
     if ( !rc )
     {
         for ( i = 1; i < nr; ++i )
             msi_desc[i].remap_index = msi_desc->remap_index + i;
         msg->data = data;
     }

     return rc;

The single passed in &msi_desc->remap_index is used as the start value 
(when < INTREMAP_MAX_ENTRIES) or is assigned a value.  Checking 
remap_index + nr fits is a good idea.

Maybe all the remap_index settting should be moved into 
update_intremap_entry_from_msi_msg()?

>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -306,6 +306,17 @@ static void apply_quirks(struct pci_dev *pdev)

>> +#define QCA6390_DEVICE_ID		0x1101
>> +#define QCN9074_DEVICE_ID		0x1104
>> +#define WCN6855_DEVICE_ID		0x1103
>> +        { PCI_VENDOR_ID_QCOM, QCA6390_DEVICE_ID },
>> +        { PCI_VENDOR_ID_QCOM, QCN9074_DEVICE_ID },
>> +        { PCI_VENDOR_ID_QCOM, WCN6855_DEVICE_ID },
>> +    };
> 
> May I ask what's the source of information on which specific devices are
> affected by this anomalous behavior? Just the Linux driver?

These are just taken from the Linux driver.  Tested with WCN6855 0x1103.

> I'm also uncertain #define-s are very useful in such a case. Raw hex numbers
> in the table with a comment indicating the device name ought to be as fine.

Ok.

>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -127,6 +127,8 @@ struct pci_dev {
>>       /* Device with errata, ignore the BARs. */
>>       bool ignore_bars;
>>   
>> +    bool gvec_as_irte_idx;
>> +
>>       /* Device misbehaving, prevent assigning it to guests. */
>>       bool broken;
>>   
> 
> Overall more commentary would be needed throughout the patch. This field is
> just one example where some minimal explanation is missing.

Ok.

Thanks for taking a look.

Regards,
Jason

