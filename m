Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6643AA4A439
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899195.1307628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6w4-0006VS-KX; Fri, 28 Feb 2025 20:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899195.1307628; Fri, 28 Feb 2025 20:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6w4-0006TD-H3; Fri, 28 Feb 2025 20:26:16 +0000
Received: by outflank-mailman (input) for mailman id 899195;
 Fri, 28 Feb 2025 20:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VhY6=VT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1to6w3-0006T7-Cn
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:26:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3ccb2a-f612-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:26:09 +0100 (CET)
Received: from SJ0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:2c0::27)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 20:26:04 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::29) by SJ0PR13CA0022.outlook.office365.com
 (2603:10b6:a03:2c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.10 via Frontend Transport; Fri,
 28 Feb 2025 20:26:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 20:26:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 14:25:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 14:25:58 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Feb 2025 14:25:57 -0600
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
X-Inumbo-ID: 3e3ccb2a-f612-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7DZue7yt8/d41aEeaoz2pfxAts2ANo4FhxojRC7YUcitUv/QeeXRn/gxQQsgEKSOfmja1aHCRr9HhnRikPShQ0zU8PlU5CvTbcq8ptiSoUdo4tquLnmj3L+nWHX6RaFh86q0OOFsdAwVcn5Cgb75eayK/BmLXm40xuso4W1INbnTDznkCOGAYvdIMDxxnWF3Xi0RAYI/V1YUxd004b4CsW6aPuFX48T3QAAQVnq9ZJlKnQtE/PR2WAk/c/j38FJm5zaOYCFDyz3zw5l4Mqj1HKsKvn8aVKDF0Q+77DzqwYkKupQ65QKnvmw9oIGMxpZARbX4WhlDOlF+TmmI6aa6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6XU1cG9jjn+WFrKD1sWWAvWhAHO7UXoSihrx+CSDjg=;
 b=obSKZyJXI7PdHTD53TfLlKe8GLsgm4b74qUCFYnbSbL3oRk2cUvWLwMQQK/PMPcCC4XCpph7GYir6NVVHZqcvtJENUTx85uIF2B+Khdp3qZ+pedT6gCO2fwjKNgGb2Fseira+LrdvfCweFbc0M7/TVzV9q6f6r3OnKOYEgHlkP25EjTiFEySlb0KEV5b9xOh3FCu0Pbpz/4tKvfyuDrYGkPzfTnEoZByK8c6bRHh+yrPv5APokDabXJU+GQ0JPUV6DWHcj+eXySams35JvpW9VNkyRXQuNcp3FBoAndPCBDWisovuylpmZKisl+LV97W5B2SSsCSe4NC3w/sbnH9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6XU1cG9jjn+WFrKD1sWWAvWhAHO7UXoSihrx+CSDjg=;
 b=lwbZFW+/C71bYL7tZPneaRxaexm8jDV09w9n3dBOWHhPRF7sXZ0teLYgMRtMkOLkt4Zc4BfUsypdwbKgiQU+kziNmQYW+vZo/7mbkDNkM+Wsgq4lK3kWEPB3rqop/5Zq3+KHpBozfikUxHhOViZFbLUMI/XrnVRMXLN9p575GcQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <09a8e9dd-2839-49d5-9fff-d2c12c0dd3ed@amd.com>
Date: Fri, 28 Feb 2025 15:25:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
 <Z8GDpJ8G8qMz4uYD@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Z8GDpJ8G8qMz4uYD@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4738d7-7580-4093-93c7-08dd58361fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXhVdHdLT1ZFSm1NckRRd2FQWTAycE1pajhjVk1vZityVTJOY0JrNXhwbExU?=
 =?utf-8?B?TExmVHU0Q25wU1JtZUZmd0lsYVNnZ1psVmYwVC9BQytKYlhBN2tDWDUwZyts?=
 =?utf-8?B?VjhXaDYyWDFQamtPSldBTUhTNE9ta3ZBZjRSRlRDR3VqVWhpUFI4NVhsZ0l0?=
 =?utf-8?B?YWowZVBtdDRtcHFHenYzTmtMYXZMVlFydm5VNS9YSE9vRmpZS1A0QkxCWndM?=
 =?utf-8?B?OHFidkxQRURoemZ6RmpHaFN0dHVseks3cm9nQmxmK0trS2Y4ajhlbzZKRk14?=
 =?utf-8?B?T3lkay9WeHhPZ2xkQVIxMHV5cXNvTndKcUM3Z1haR1JLbElCd0hpWVRLTURI?=
 =?utf-8?B?YVA5UHNuUUFaaElIZnFsUXJPd1hNakZyODE5eXJZWDliRW8yUHpkNXdEQ1Yx?=
 =?utf-8?B?Z1FoWWpJdzhrcjIwbG4wc2V2T3ZjR09TMmZKRGVMSVcyRXNnYTNZWnZtemtK?=
 =?utf-8?B?bEoyNFdEekdoU3VsMVhteWd1TzBneDJ5S1BTR0ZxUWNpaFFHcEp2YnRRcVls?=
 =?utf-8?B?SVpMbFYycUpNMkRUbGNnSkN0L0lDWjNMeVQ3eFc4MTRXMUNvVzRrNFZ3c2wx?=
 =?utf-8?B?SFNEeDcwSWsrVVRiYVB5UHREWlZnRmwwQmpxdzNrWlg2NHZHMzJ6WG1qRWt5?=
 =?utf-8?B?S1pRK0JkV0t2VGg2b1FlbitGZ05TbXNJNUdaUFFGZmdQY2ttM3ZweEdhdHZu?=
 =?utf-8?B?VnBleHVITjVUdEZ6SjdONGZncmloSlllbVowWEhwNUhGMklYTWZDQ1pJcnpj?=
 =?utf-8?B?R3RQcGJIc0d6M0hTUmtUcUZLZjRpZ09OcHpvNUdNK2d6RlFnUlRMRFFQTWZs?=
 =?utf-8?B?MlVTSkVObWxqTWxOejFDMnVLaWFrMFdlRzVWM2UzZVFSWUhNOWlCeDN0V3BQ?=
 =?utf-8?B?cElHQWhhalFFVXNlTUJXWEdkUnZ0L1FkNm5PZWl5VWRPWWowUjFGUE1DM2FG?=
 =?utf-8?B?WmFMb00yVDJmMnNIazF5cmtCck5oRm5HcUoyUjhLOGNJYjkxZnB6TmxZdWYz?=
 =?utf-8?B?NUlBUUlvWm51UmRDcTFZYnFQWjlPSThneUFEdEVPS2tpSjVtaG9CTlQzRURX?=
 =?utf-8?B?bEhKQU1UZDJCbEthdXo0amh6cG4wdFlBYlFDQWNqRGMwMFV4NWFtVGlMSjFQ?=
 =?utf-8?B?Q0F2TVhaNUZ5cWpPODhldXp5S01FdjhTZlU2N3hvaU5NblZIaWFIZS95Yk16?=
 =?utf-8?B?TWwxc3VZaDVGUncyR0lMUitENElKQjZWckpENkMvUDZYdzBnUlNLL1BVUFR3?=
 =?utf-8?B?bnFkdGM3b3o1ZGh6ZVFMdVR0eHBWNERKK1M0SldSZks5RHZKbFpNWG9xWkdG?=
 =?utf-8?B?YmhSbGhCZzgwV282Qi9JZ0tvQjZraXY2NkVLSjFMRVdudjh3ZTFIUXZpVmNS?=
 =?utf-8?B?bEtTMm9iUER5V29pUXhNUGtsbmdTak8zb2FBQ1RqOHk2NkxnbElLUFIya0NM?=
 =?utf-8?B?UG91VTZYK2k0WUtSYnFNTkxUT1pJSW0vYkJubzRGOXlJR3M4QU1rdkJJSE5I?=
 =?utf-8?B?cHQ2S2FLNi9jRUpUQnN5N2VmUGZabVhiR2dmZTVRQ0cwVXJHNHh3MkpGVjQw?=
 =?utf-8?B?c3dGcWtXWmVTclV3TlhLazVHM3BpWEZKbFI4b3RoR2ZyUEFQMW9tUHNnWGd5?=
 =?utf-8?B?RlU2OFlYYzkvaUVTRVh0R0JtSTFiNVZTSEErMmlaTGp1elRySDFaS1N5WW9q?=
 =?utf-8?B?K3hwTXA2YVZaZXdzUWVhamhKaHdadGI1dWpaWW51eHpXR2V3ekNZZjRrQWEv?=
 =?utf-8?B?ME9BdThSYWtQN2ZJUHlSRzJPSEJPdWdSNXFDTEhHNjdoUGtPYmZnNWJITURE?=
 =?utf-8?B?c3d6SFpMa3lMN3FXcmhJd1dYR2tRTGRHemVWaGJIa29QNHduNDAybE9zMFlK?=
 =?utf-8?B?Z3JxZnpnaWpJdnFFT0JWcisvTUNHL1NZa2dFZW5QYTdyeS9RK2UzRFU2aTNG?=
 =?utf-8?B?VGdZaDFpb1ZmM29lMXZ1SmZ2UStPdUp3a1dSWXFZc3hTVU9CamtZM0N2ZFpY?=
 =?utf-8?Q?1odPddzDrOzLWyvhdnu3LvJb4iw4T4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 20:26:03.8362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4738d7-7580-4093-93c7-08dd58361fb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

On 2025-02-28 04:36, Roger Pau Monné wrote:
> On Thu, Feb 27, 2025 at 01:28:11PM -0500, Jason Andryuk wrote:
>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:

>>>> To work around this, we can, for per-device IRTs, program the hardware
>>>> to use the guest data & associated IRTE.  The address doesn't matter
>>>> since the IRTE handles that, and the Xen address & vector can be used as
>>>> expected.
>>>
>>> All this work on AMD because when interrupt remapping is enabled all
>>> MSIs are handled by the remapping table, while on Intel there's still
>>> a bit in the MSI address field to signal whether the MSI is using a
>>> remapping entry, or is using the "compatibility" format (iow: no
>>> remapping).
>>
>> So, on Intel, if the guest hands the device the MSI address, it can decided
>> to bypass remapping?
>>
>> Thanks for providing insight into the Intel inner workings.  That's why I am
>> asking.
> 
> Yes, sorry, I'm afraid I don't have any good solution for Intel, at
> least not anything similar to what you propose to do on AMD-Vi.  I
> guess we could take a partial solution for AMD-Vi only, but it's
> sub-optimal from Xen perspective to have a piece of hardware working
> fine on AMD and not on Intel.

I only need AMD to work ;)

But yeah, I thought I should make an effort to get both working.

>>>>
>>>> For vPCI, the guest MSI data is available at the time of initial MSI
>>>> setup, but that is not the case for HVM.  With HVM, the initial MSI
>>>> setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
>>>> only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
>>>> case, we need to tear down and create a new IRTE.  This later location
>>>> can also handle vPCI.
>>>>
>>>> Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
>>>> call sites.  Use msi_desc->gvec to pass through the desired value.
>>>
>>> So basically the solution is to use the guest selected MSI vector as
>>> the interrupt remapping table index, as then the guest can use the MSI
>>> data and address fields without requiring Xen translation.
>>>
>>> What about the guest using the same vector across multiple vCPUs?  So
>>> MSI entries having the same vector field, but different target
>>> destination CPUs?  That won't work correctly as all those MSIs will
>>> attempt to use the same IRTE?
> 
> I think you will also need to add some extra checks to ensure that
> when this quirk is active the guest will always set APIC ID 0 as the
> interrupt destination for all MSI entries for the affected device, so
> that there cannot be vector overlap between CPUs.  Otherwise the quirk
> won't work as expected.

Ok.

>>>> e.g. Replace amd_iommu_perdev_intremap with something generic.
>>>>
>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>> all that has been tested.
>>>
>>> DYK why it fails to enable 32?
>>
>> Not exactly - someone else had the card.  msi_capability_init() failed. If
>> it ends up in arch_setup_msi_irqs(), only 1 MSI is supported.  But precisely
>> where the mutiple nvecs was denied was not tracked down.
> 
> Does it also fail on native?  I'm mostly asking because it would be
> good to get to the bottom of this, so that we don't come up with a
> partial solution that will break if multi-msi is used later in Linux.

My understanding is native and PV dom0 work with 32, and it's Linux 
deciding not to use multiple MSI.

It might be this:
static int xen_hvm_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
{
         int irq, pirq;
         struct msi_desc *msidesc;
         struct msi_msg msg;

         if (type == PCI_CAP_ID_MSI && nvec > 1)
                 return 1;

I'll have to look into this more.


>>>> +            new_remap_index = msi_desc->gvec;
>>>> +        }
>>>> +
>>>> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
>>>> +             msi_desc->remap_index != -1 )
>>>> +        {
>>>> +            /* Clear any existing entries */
>>>> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>>> +                                               &msi_desc->remap_index,
>>>> +                                               NULL, NULL);
>>>
>>> Why do you need to clear any entries?  This will cause a window where
>>> MSI entries targeting this IRTEs to generate faults because the
>>> entries are not setup.
>>>
>>> Just re-use them, update_intremap_entry_from_msi_msg() will update the
>>> IRTE atomically so that there's no window where the entries would be
>>> invalid, and thus to faults will be generated.
>>
>> I see your point about the window.  I was trying to keep it clean as
>> different indices get populated.  Initially, IRT[0..n-1] is populated.
> 
> Hm, I see.  For this specific use-case you are changing the IRT index
> when the guest updates the MSI vector.  Tearing down of the old
> entries would better be done _after_ the MSI entry has been updated,
> so that at all times the pointed IRTE is valid.
> 
>> Later, when the gvec is available, we want IRT[gvec..gvec+n-1] populated.  I
>> guess the new gvec ones could be added, and then 0...gvec-1 removed.  Or
>> don't bother?
> 
> Indeed, that would be a better approach, as then the IRTE would always
> be valid.
> 
> In fact you could possibly leave the old IRTE entries as-is, they
> would be unhooked from any MSI entry, and if re-used they would be
> setup correctly.  For this specific quirk where vector == IRT index
> there's never the need to search for a free IRTE, as the guest set
> vector will dictate which IRTE to use.
> 
> I guess it would be nice to attempt to keep the inuse IRTE bitmap in
> sync if possible.
> 
>> I considered leaving IRTE[0] and adding IRTE[gvec].  I think that could
>> work, but would be more hacky.
>>
>> I was trying to keep the irte accounting bitmap correct, but it doesn't
>> really matter for per-device IRT.
> 
> Yes, that's my thinking too.  If you can move the call to teardown the
> old IRTE after the new one has been setup and the MSI entry has been
> updated that would be the best approach IMO.

Ok.

Thanks,
Jason

