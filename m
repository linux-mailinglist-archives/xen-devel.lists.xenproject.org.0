Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67DA7E7B1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940667.1340356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ps5-0007zS-2J; Mon, 07 Apr 2025 17:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940667.1340356; Mon, 07 Apr 2025 17:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ps4-0007wo-Vs; Mon, 07 Apr 2025 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 940667;
 Mon, 07 Apr 2025 17:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JlD4=WZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u1ps3-0007v1-4D
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:02:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21438094-13d2-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 19:02:48 +0200 (CEST)
Received: from MN0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:52c::29)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 17:02:42 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::98) by MN0PR05CA0009.outlook.office365.com
 (2603:10b6:208:52c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.10 via Frontend Transport; Mon,
 7 Apr 2025 17:02:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 17:02:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 12:02:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 12:02:40 -0500
Received: from [172.23.214.75] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 12:02:38 -0500
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
X-Inumbo-ID: 21438094-13d2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQd30CzeX+zPQ+DmVwkkoi8Bcp5ZhSIqcPtZNEhZhKleyONF3OQnt9KgfTeygPauTkpOiIT8GdIhKOaiSSFyJCR4fluNb/RYB0JcGBj1dDLU/Kve/eNzrAJ03woJuJnNGa9XkdB40os/YqSutsLlWo5gk85P0tnszsembrQahJMhQgecg2Zh+1G+sBbu4E6aP0lKywWM69wnQ2HZQpSkS0bvLnk4zd1lDUygQOfm4LchGkz5U0gxs1RXmZQxr5ZS3SMg8Jd8iVZGzK7+N0WXCThD6NEagtf2p5/Ns/FMgnVPHwYpN5IDL2HWZUE7Sb8qZLJtAQpFRyKEvGNCS5nkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQohm3RX+7vq9bvnPLtAOfQkh47F+8kzBMlvvuTKuSM=;
 b=HEzeoiShqgn5YMOQA8c4DDNAhi5C7afiw5hSMHffnXy42ULKNy5TjtFoF4SAozbi3nWIJIFYHkcC7d7hrkGw5Bdcoa8WQlfeH1a09yoDPVQnhyduPCeUsC9GuSdwi9VX41J1iAPMycNtNDBzuo91aVkUtlOhpaTs4TvnaWwnAkwEfmtsFHDjA1Wkg9G4ZKdLD4az0nVGMbHUw1Trb1yF+hsHsZOYN0Wn0fSGjr3i/X6YfbpTVW6MpDx98sdgGPye1UanUs8NY2x3aq5Vf71f0w7lSrSA+LFfYATgVwd6k2nhgFD71dIL9b7T2L3Iby9nsCNKnG3Tg4CgaImV1taEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQohm3RX+7vq9bvnPLtAOfQkh47F+8kzBMlvvuTKuSM=;
 b=UyUceKGZbQtSp/9NulZcCFDGe0c7c0LXvrZp04SUI2DERb8mCQCGKgW7jiMFIogaOr03qCN2XszwRxaprYUGlWKkidYsjTNwlQxCoJRtKk4qXAQrbQTFZl4O0odpTLbwezW1NrJiyxj5TtTt55TMBHWry6w6JTQDRfy6/7RNaaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0bceb177-dd1e-4907-a726-84230f34eb78@amd.com>
Date: Mon, 7 Apr 2025 13:02:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/2] xen/arm: translate virtual PCI bus topology for
 guests
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
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <346fadbb-deff-4403-88d7-b77b7002f913@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 27179ce3-137a-46c4-d179-08dd75f6024e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkVEMFJZNW5QakY1cS9nOGRLVEZacHAvK2lwVXkydGhOWWs1YzkraHBZc0px?=
 =?utf-8?B?MWdyT3J2eU9DVmt3OEZ1OHdGNCtibHNFY1o5bnc1R2VHS2ZUVEs5ZlFEV0ZI?=
 =?utf-8?B?bkpHdS9tdHpZL0h1a20ySFh1c0lkVUxzWlVMY3d1T0dGc28wU3R2bjZxTC9t?=
 =?utf-8?B?Z3lSMXRCQkFES3VQYXNna3B1ZWVsOW8wSkNrSFpZYWVJMmRGNW5oQmdJdlQ1?=
 =?utf-8?B?RlY2NnhkdWR4T1dvbXkrREErcGdMMlByWHEzdUNjWndaNjNnYU5LM1Nic0Jw?=
 =?utf-8?B?RzBUMWVmZ2Uyc1g1cExEMno5N01yMTkvMEFuRm5TUEdaWm5rYmIwWmw3d3Er?=
 =?utf-8?B?N0MyY2JEVDhBcTdyc2J4cTFlUUptMXM2VGl2MU9ZYVhEYm9iVEsrNGk5SVpH?=
 =?utf-8?B?cmVpVCtvYTl0K244MG9MNlo3Z3JkL2Q2cDhSSEJQc01FVUNZSDJOYTd6UVM3?=
 =?utf-8?B?T1hXOWllVE4yaVJNQkphNmVwb2F0UWdCbUNCdHNSTGplM0lVQ2dBNmE1ak5o?=
 =?utf-8?B?RVY1UkVVQjVBM2p4QjR3dW8wc2IraVFXNjFUdnhLSHY4Mm1XbDlGVldpYjRV?=
 =?utf-8?B?U3JJd0F5WXdpSTdEbGVKc3VidDRpV0IzUllLdG5rL2lLSUJMeFNUeXNPWHBr?=
 =?utf-8?B?OVA2eXo0cmhwU1lrTlhxb0xJM3M5VGFCMWVpZThPVkdRQlNpR2x4VUs1NHho?=
 =?utf-8?B?WlhKU0FHR3ZFdW1hZ2R0dFVNTURtaU1iV1JKODc5MEwrUEF0bmdFZzFxWk1k?=
 =?utf-8?B?T2Vsc0tjVXZXaUtUZWhCRU9mckt0WDAyQUxvcnZWU2Jhc0loZFJ4VXFjc3Vh?=
 =?utf-8?B?TDdscmQrV3NtMDhEaHViMW96OCtwTWRNOXJDQUhPbEdNTjVhV2p3TVNHaFJi?=
 =?utf-8?B?UW5iVmtCYkdqVzJ0clgzU1V3THBNVmtrZ3V3NTkxUnJxcFRQM0sza2FqWS94?=
 =?utf-8?B?MDBTNzF6MGdJM1l4Sm5MdHFmN29Sc3FFaUwxTFRjMllKWkdRRkFua1FKU1ZJ?=
 =?utf-8?B?VnB5VTVnYmQxVzg3ejFyVWdMR1lTbHdaRFNhUGtUQ3JEclhtR2xNNVpkY0px?=
 =?utf-8?B?ZmlKMWZvcjZGRkFvNnhoZXBIRERvVWVwVEFlaDhCYy90MTEzNnR5QXU1M1ZK?=
 =?utf-8?B?WWRBM3RVd2xqcVhjeEdjUndXeUdNK3dUaUdGTzNRbmZBdVRPZE4ybVhSWUNr?=
 =?utf-8?B?NXdsMndpbm1WRkF1eVBCTWdkaVdLdElRQ1VHamRTUU55alFHT2N0bXErYUky?=
 =?utf-8?B?R3RwcXhTTndhTVFyeUlZb1FsY3hueXU3UGNHc1ZXdDRGRHZ1dWNsL3NwM0pM?=
 =?utf-8?B?Q3FqZFE3VVA3SStMMDZSSTl1cGI3R21BL0FGa1J5S1Zra01lOXNWNGNBMkUv?=
 =?utf-8?B?SEtmYlF4M055U0ltYUVTMXNKYWVOdVpMTnZqbmVpcHlXWHdOWEJhZE9mMHZw?=
 =?utf-8?B?S1RtSkNwZndzME9Da2dqb3kydXlsWm1naWp6N2gzeGdwZk5qMWV3R1hhNGNu?=
 =?utf-8?B?N0cwZEtNRitPSVQvRnZTSzVmeDlWdVhHZlN2M3hoekU3NWJXczFORk9iWndI?=
 =?utf-8?B?aCtOT1hhY25DR0NJNjRzMDJLdUJpTDdHMTFteU4ydFIrWTRYZ1B4SG9ZMXlT?=
 =?utf-8?B?d1dpajQ4RTgyMUdBVTVEeWd6TU1GQ2cyYytlajhzV1RpMUg0WGs0RU8vbkVo?=
 =?utf-8?B?UDNueDJYalRsbm5uRjBVUC93aW5pbTk1UEtvRmFmTzdNQzBPM3dhcVNKSWp5?=
 =?utf-8?B?c1ZONGt0SGxRb2tGT1p4TUhWbitacUI3Y2s4TU41SGZJdGtGTDU2SmhRUFpO?=
 =?utf-8?B?bUd6R3cwWFV0WXN4dllFM0NmcE9XL0NiU0NVWHl1RGphbzF4cjNoUDhTdHlu?=
 =?utf-8?B?VEZ4Z2VSMGxnVzRTS00yTTJXR3hTbVc5RnVqbXR2aFdJQ2wvL1REa0lRcVhr?=
 =?utf-8?B?NGs4TWVYT2FMTVZ2UWJUMlA0emp1c2FjbnpVYzl3RjdrYTdlMTljUVlvb0xl?=
 =?utf-8?B?VU1YeldnOGVkanFxaW5YQ3E1Z01Bb0Jua3FSVy9ESjhST3dCbEpPYmdEQWJm?=
 =?utf-8?Q?SZJgSe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 17:02:41.7290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27179ce3-137a-46c4-d179-08dd75f6024e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188

On 3/30/25 17:59, Julien Grall wrote:
> Hi Stewart,
> 
> I realize this series is at v18, but there are a few bits security-wise
> that concerns me. They don't have to be handled now because vPCI is
> still in tech preview. But we probably want to keep track of any issues
> if this hasn't yet been done in the code.

No worries, we want to get this right. Thank you for taking a look.

> On 25/03/2025 17:27, Stewart Hildebrand wrote:
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 1e6aa5d799b9..49c9444195d7 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -81,6 +81,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>>       return 0;
>>   }
>>   +/*
>> + * Find the physical device which is mapped to the virtual device
>> + * and translate virtual SBDF to the physical one.
>> + */
>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
>> +{
>> +    const struct pci_dev *pdev;
>> +
>> +    ASSERT(!is_hardware_domain(d));
>> +    read_lock(&d->pci_lock);
>> +
>> +    for_each_pdev ( d, pdev )
> 
> I can't remember whether this was discussed before (there is no
> indication in the commit message). What's the maximum number of PCI
> devices supported? Do we limit it?
> 
> Asking because iterating through the list could end up to be quite
> expensive.

32. See xen/include/xen/vpci.h:
#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)

> Also, not a change for this patch, but it seems vcpi_{read,write} will
> also do another lookup. This is quite innefficient. We should consider
> return a pdev and use it for vcpi_{read,write}.

Hm. Right. Indeed, a future consideration.

>> +    {
>> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
>> +        {
>> +            /* Replace guest SBDF with the physical one. */
>> +            *sbdf = pdev->sbdf;
>> +            read_unlock(&d->pci_lock);
>> +            return true;
>> +        }
>> +    }
>> +
>> +    read_unlock(&d->pci_lock);
> 
> At the point this is unlocked, what prevent the sbdf to be detached from
> the domain?

Nothing.

> If nothing, would this mean the domain can access something it should
> not?

Yep. I have a patch in the works to acquire the lock in the I/O
handlers. I would prefer doing this in a pre-patch so that we don't
temporarily introduce the race condition.

>> +    return false;> +}
>> +
>>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>     void vpci_deassign_device(struct pci_dev *pdev)
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index 807401b2eaa2..e355329913ef 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
>>       return vpci_assign_device(pdev);
>>   }
>>   +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
>> +#else
>> +static inline bool vpci_translate_virtual_device(struct domain *d,
>> +                                                 pci_sbdf_t *sbdf)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +
>> +    return false;
>> +}
>> +#endif
>> +
>>   #endif
>>     /*


