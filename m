Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6EA939E3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 17:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959216.1351637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5noF-0004aH-1t; Fri, 18 Apr 2025 15:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959216.1351637; Fri, 18 Apr 2025 15:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5noE-0004X9-Us; Fri, 18 Apr 2025 15:39:18 +0000
Received: by outflank-mailman (input) for mailman id 959216;
 Fri, 18 Apr 2025 15:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHr6=XE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u5noD-0004X1-LL
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 15:39:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47dc293c-1c6b-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 17:39:15 +0200 (CEST)
Received: from DM6PR11CA0057.namprd11.prod.outlook.com (2603:10b6:5:14c::34)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Fri, 18 Apr
 2025 15:39:09 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::c5) by DM6PR11CA0057.outlook.office365.com
 (2603:10b6:5:14c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 15:39:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 15:39:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 10:39:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 10:39:06 -0500
Received: from [172.23.161.73] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 10:39:04 -0500
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
X-Inumbo-ID: 47dc293c-1c6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm6yjCBCxINNiY7GTYdIWqe/JWybi5mThAJf/dHVz+DJwpOQXp6RwPNqNJP7zAEGFDJhPe0zEBGqCj8iwPkNka2g906lXH5eVymH6+FQweCcg2Oo/2WD2l1rBf6xU0/pkk3Lc/pQ8ZclUkS4T5hRXen/YMQr6VOlVnALqyD8AS3I9K3BGn2X3cuv9zDPAZuqvhAgT/AeZJxBimiS24ymDa/A5alrH9m8LQJhV+GJiBWzYbsi+dS+jX3aaLMwSND+fohOFBnkhxg2qRblKKm6LpaQ2+L9dMuqJaIkCw0aVUptQpi92JhuWTRYvZqgmuzr0SLz62+Pw7/sfypaTDbfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVeIV3TPFlHL1zKr6H+V/tMzJ2XZve2HlijwB8LiBcs=;
 b=RFOxP9P1cSGGZk+5a9wi3UCn1SZTYSAloCt4f9FQLl9oP0AMREl0heakAlQzqdkhdJWLhPDcqVBK2tRTO/P6s0QI/IdVenDYoJUKxw7lwyULiKZyIsrGZkIUlMaK92zvc1DIPpNL6DePdv3k56tkeKVOlFtEBLhUhG8asdAagsa6JjVsaBb6SdEhQGNlIsNYNOpayvy6IVtzHmklmlFUHQPCask7dWy4BF+O47sw1Qx0vWJV8MwmV224YDZjtjxbaM1y1xYK3soj0BMbNlw87adHCYpNRs5Y2rRfm6aA7a5RX7UghHyVR0YCOV73k/J6kTTdxLL60tuO3UBYyBxOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVeIV3TPFlHL1zKr6H+V/tMzJ2XZve2HlijwB8LiBcs=;
 b=heg8D9knBlI/KLLzeNlvzShRksuK6PdZMbvIqaRGentWTKwDAj6exCff0PEpTKqrzPsEaEiFunM8z2UFta2nEfxrjG2NySH+Y3s8/OsRaieWxyZnh366aYHANV4d7i3dFNJF6Gv2XXbGVy1z6GQD0k47hwpZ0f4C15kpaRWxEMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a8086094-fe3c-4a82-8382-b5adb78cfe01@amd.com>
Date: Fri, 18 Apr 2025 11:39:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/2] xen/arm: translate virtual PCI bus topology for
 guests
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
 <20250325172727.600716-2-stewart.hildebrand@amd.com>
 <346fadbb-deff-4403-88d7-b77b7002f913@xen.org>
 <0bceb177-dd1e-4907-a726-84230f34eb78@amd.com>
Content-Language: en-US
In-Reply-To: <0bceb177-dd1e-4907-a726-84230f34eb78@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: a48fdd13-b7dc-4635-99d6-08dd7e8f28c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czJPY1ZLalVBN3VBOVhoMlkyWWQwVmp2SVpwU0dGblA4Y0lDa0xzTWhtOENl?=
 =?utf-8?B?ek1Zc0dIZUxQWE82YWtZUHpSamxoR3JjNUNRWEpSR01DVzl6VVFiWDFFaFRw?=
 =?utf-8?B?UHNwRDJqcnB1YU1SWW9EYVBJb0U4TVl1OTZ0MUFkRXlrYStOWWZiZ3MwWEQ2?=
 =?utf-8?B?SktkMDFTOWUzK21uSVc5cUtHdGdFMVpGRFdIWlN2bzBzTTBNNUpHTVVLa2xo?=
 =?utf-8?B?S2hsaXIvayt4aDFjUmwzUFBpYmpqMEU1RUplUU03Qkt3WHJPNHo2WGhBdTJQ?=
 =?utf-8?B?eENpYXVYbHlyTnN2SDFDWXdkOGxWQ0RZOWhpUUhMdVJnT2d0bWhMNktxUnZM?=
 =?utf-8?B?MURqV256U2E1cXBjYWtJMy9nYXFqUjE2bkt1d2RNaERaazdlTzRnVDVaRjM4?=
 =?utf-8?B?bzFNUys5Ty91S3U2MmFUYzVwZUVpcmlSZXVRTVlqZUdoeGRPdDcrZ2NjWmlt?=
 =?utf-8?B?bkkxR0JLdHNGZmkwZG42VUdvaVQvMVp4Mk5DSjhiS2d4ZlJoOE83V3Q2N2hI?=
 =?utf-8?B?R2l5aXRNdHFlcW5XYmNudXhRVTlTVEFxOFNjM1N4dnd5MFVQQVdhK1djWkRs?=
 =?utf-8?B?clVnd0RuajBIaG9FMlRhUWNpRWM5OGFHYlB4NmJOcnMxWCtJMVptYTV5R1Vx?=
 =?utf-8?B?d012ekJCZUZIbmMvK0JzZTJyanFHZXRkWnVhQWUwWlBGUHFRMCtlODNWc1Zy?=
 =?utf-8?B?elJhYmFuZS9BNDhIVk1zOTNyQkF5N3BOMkcxZVFBRUFnMXZKQWVpRVFHcTdk?=
 =?utf-8?B?dTJnZXNIWVd2MGpHR0hyUEkzei9VS3B4WVJiaGcwU1NYWm10aE5kNTZBNXRu?=
 =?utf-8?B?Q1Z5b3l4QjNlelR2cnBCVEIwWi9RRlc1UFJkaGVrU3dTMHYrdE8vTVhYRzV2?=
 =?utf-8?B?ZUVxRGsrczJVdlhRWVNuaU92THdkbTlFVWUyQ3NJVUNNc0VZVWxpRUIzbCtR?=
 =?utf-8?B?bzhQZkZtSFIzT1FUZHI2aXJRUkZsZFcxd3FhOVRPNitRaGIxb3c1cDFIakox?=
 =?utf-8?B?R0lTSGJ0MGdrZnBOREdoTnJNcXU2dHNPb0RqeDlRUStnZ0svQW51cmQ5aVpT?=
 =?utf-8?B?TkJmREsxanBJcXVPdFYwaW16MFVzQnhTd1RyNnZML09iKzNRcVIycnoxaThl?=
 =?utf-8?B?UWdtT3N6c1pQT2lPRitSdkxVSDJRcmNPeHp5ZXRNSEFDRXJkQXFIaStrWk9Q?=
 =?utf-8?B?TFRSK3QwUlFMOWNYYTFsUTZKWVlTK3ZMRmp6SVVBc1gyN1JNZ1RMM1RaMUI4?=
 =?utf-8?B?cndFNVlsUHFyMW04SHNiaWlSSU8yNTNXdzNwYzlHVnBaUlgxYXlsb3ZURkFN?=
 =?utf-8?B?QmM2WDFxTStXZEtQb0tRK2Vsd0ttbkdGVTN0aXgzUlZ4Zk1sdXdDU2tmYytz?=
 =?utf-8?B?Wnl1VFNkRFdGU2FhSVhPZ3pXS3BrM0VzZVdETUJOeVB0WFM2eVNOV1crTFFw?=
 =?utf-8?B?eVlqMmR4V2IzRG9VN3pmRWdOdXBicXI0b3ZXcmlCSTh1YzRHZWxtUTdKZVZ4?=
 =?utf-8?B?WmdWamw2aDJYUnVCZG45K21jckZ2dVNMaVZjemJkZkw1MkZwUmFLeGZ2amhl?=
 =?utf-8?B?VzhBOEgxQzRQM3QzY1FSdWdvSXFuZ01zWmEza3dOVU1ZS3FCNmZJazJPMVNF?=
 =?utf-8?B?TjZLMTl2ZW5hSVlxaTEwc1lUVFlBTHUvaDJaVWEvMlRnekh0Zys3c1BnZjRk?=
 =?utf-8?B?Znk1dzY3WCtpak16cUJzOEFtRHRRSWp3MUFNWDRZOCtHYWZZN1paeHRIeUl3?=
 =?utf-8?B?MW9TaWNIRzQ2QmZPTG5ETzFacFNtSGJQQit6amFCUHdpVHMrMkRNazFOTFNY?=
 =?utf-8?B?N0poNmhFSmJXT3VIbFB3THdUc0YzOHdmTkYzTVdWNWhCNVJwemFneVdROHpv?=
 =?utf-8?B?SzY1WHdnK3FwUk5abmJ6dk1SL0EzbVh1UEVSODV1eGEwRU04b0tLVFpVQmVu?=
 =?utf-8?B?RlNJbEFhYkdOVE14WmJMbG5jNTZ1MDZ0RUx0d0NHVDNSTE1HWm1XM2tFTDFJ?=
 =?utf-8?B?UzU2OFJpWkg4SisvOW9vQlYreWFNaGVXdWs1c1JvSVJPdXJURmxNSzRRUTYx?=
 =?utf-8?Q?YJ49UJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:39:08.5093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a48fdd13-b7dc-4635-99d6-08dd7e8f28c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030

On 4/7/25 13:02, Stewart Hildebrand wrote:
> On 3/30/25 17:59, Julien Grall wrote:
>> Hi Stewart,
>>
>> I realize this series is at v18, but there are a few bits security-wise
>> that concerns me. They don't have to be handled now because vPCI is
>> still in tech preview. But we probably want to keep track of any issues
>> if this hasn't yet been done in the code.
> 
> No worries, we want to get this right. Thank you for taking a look.
> 
>> On 25/03/2025 17:27, Stewart Hildebrand wrote:
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index 1e6aa5d799b9..49c9444195d7 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -81,6 +81,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>>>       return 0;
>>>   }
>>>   +/*
>>> + * Find the physical device which is mapped to the virtual device
>>> + * and translate virtual SBDF to the physical one.
>>> + */
>>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
>>> +{
>>> +    const struct pci_dev *pdev;
>>> +
>>> +    ASSERT(!is_hardware_domain(d));
>>> +    read_lock(&d->pci_lock);
>>> +
>>> +    for_each_pdev ( d, pdev )
>>
>> I can't remember whether this was discussed before (there is no
>> indication in the commit message). What's the maximum number of PCI
>> devices supported? Do we limit it?
>>
>> Asking because iterating through the list could end up to be quite
>> expensive.
> 
> 32. See xen/include/xen/vpci.h:
> #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> 
>> Also, not a change for this patch, but it seems vcpi_{read,write} will
>> also do another lookup. This is quite innefficient. We should consider
>> return a pdev and use it for vcpi_{read,write}.
> 
> Hm. Right. Indeed, a future consideration.
> 
>>> +    {
>>> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
>>> +        {
>>> +            /* Replace guest SBDF with the physical one. */
>>> +            *sbdf = pdev->sbdf;
>>> +            read_unlock(&d->pci_lock);
>>> +            return true;
>>> +        }
>>> +    }
>>> +
>>> +    read_unlock(&d->pci_lock);
>>
>> At the point this is unlocked, what prevent the sbdf to be detached from
>> the domain?
> 
> Nothing.
> 
>> If nothing, would this mean the domain can access something it should
>> not?
> 
> Yep. I have a patch in the works to acquire the lock in the I/O
> handlers. I would prefer doing this in a pre-patch so that we don't
> temporarily introduce the race condition.

I spoke too soon. If the pdev were deassigned right after dropping the
lock here, the access would get rejected in the 2nd pdev lookup inside
vpci_{read,write}, due to the pdev not belonging to the domain any more.

In hindsight, moving the lock (as I did in v19) was not strictly
necessary. Anyway, this can all be simplified by calling
vpci_translate_virtual_device() from within vpci_{read,write}. I'll send
v20 with this approach, then we can decide if we like v18 or v20 better.

>>> +    return false;
>>> +}
>>> +
>>>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>>     void vpci_deassign_device(struct pci_dev *pdev)
>>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>>> index 807401b2eaa2..e355329913ef 100644
>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
>>>       return vpci_assign_device(pdev);
>>>   }
>>>   +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
>>> +#else
>>> +static inline bool vpci_translate_virtual_device(struct domain *d,
>>> +                                                 pci_sbdf_t *sbdf)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +
>>> +    return false;
>>> +}
>>> +#endif
>>> +
>>>   #endif
>>>     /*
> 
> 


