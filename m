Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15ADD1E60F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 12:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202945.1518333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfz0j-0007Oe-DJ; Wed, 14 Jan 2026 11:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202945.1518333; Wed, 14 Jan 2026 11:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfz0j-0007M4-9u; Wed, 14 Jan 2026 11:26:01 +0000
Received: by outflank-mailman (input) for mailman id 1202945;
 Wed, 14 Jan 2026 11:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX2Z=7T=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfz0h-0007Ly-G6
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 11:25:59 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb54256c-f13b-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 12:25:57 +0100 (CET)
Received: from MN2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:208:d4::41)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 11:25:53 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::d6) by MN2PR04CA0028.outlook.office365.com
 (2603:10b6:208:d4::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 11:25:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 11:25:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 05:25:52 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 03:25:51 -0800
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
X-Inumbo-ID: cb54256c-f13b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tqfp4aZ6f80qZlRPyRTidwLiioDSDVYWaWcF5jYZ7UzlGhEBAc351XwXMmWVM9IWu1yPC0QCCBCStwwuLCHwedu7IKf/LkFFe7XVMmA2HCXi0mtdLvuEwzzcWd3mSSxTY+gIanO+zPE34JO3/fle13UH+Lc59ioGiDlEB71DsJjdCob/Z5ACgxPHORkP6HXG7mZAxk6ugqCNZ5feNIak2UkCxtLcPsisU4yvyFl331FlEqX8/ADIoQqPrHyu1k76t03X83D2LaUWrCmgpZvnBIiHyQkvQqCBivk+3c7hoO/zqyJtZ3N3zJFy1D73uXF3wGMFbRbhMTRnMwiV75x/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/I1xLNmBu1i03Tz1A4fr50Wly53NzflHq4T1dLHXAs=;
 b=p3lv0ASrxYubIND7bNk/aoK6MkV3S8DqQS8gS2VIEWh2xCsuF6VTfB1MCFo3aI4I36eQZ0sxCB0q1i6yfKICxW+xSlqrb1eXlw5qGaU5E56n7PRiD5GYASh1XMsRnsSdH0bjnceJsw/uKBX5h8AS3Je+ToZvgLvqTGYRmUk+LDCGPN1Og7fjEFqq9W/B5sOYQEvzJ3uV7zldgDMeO5TnUb7ke3wT/Jxv9gUwOA5xxvux5dxjdUnFq5RHZFEWLUPy+UFaaKH77VTFtbzKgoBIcAJoYVGNV4ChA2iclFM5l1fxrfENpUo0orR1KxcgTPE3mHoH7ojjdSyBDI07i62+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/I1xLNmBu1i03Tz1A4fr50Wly53NzflHq4T1dLHXAs=;
 b=xYA3GaTFqgRXXf09yVHEVmlP/X7+oiD/4YxyYyrZH0l2pi4sNXKcJrTB/jwLwH94fPudBqzevMiYDOwUtDD1yH9M0eFNjnh3FYlJHSsfj2btZ3+0546kiUbxIglEObPWjROE32V9fIYU9I2gKiyFsPODrfHuyanxcQ9NU4tNHys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d4d17b63-1f1a-4853-9249-9dda894d7e1d@amd.com>
Date: Wed, 14 Jan 2026 12:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm/mpu: Implement vmap functions for MPU
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
 <20260113162309.6766-3-harry.ramsey@arm.com>
 <1cb6fc36-fd16-499b-a616-4d321ae83572@amd.com>
 <E5F825CB-0EBB-4AFD-959D-AF5B7D0D2CAC@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <E5F825CB-0EBB-4AFD-959D-AF5B7D0D2CAC@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 146ad908-1bff-4b1d-928e-08de535fad5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTNaR3FsNDY0YTRkMmtXeEw0aVFRTXNHaVhFQTllK3luU2JCVTJhUENES1R0?=
 =?utf-8?B?VFNXUnd2d0FnZ2YxdWF6R2NaQm5MTUJrR0p4MzVJSCtIRUFXQjFiTmJ6eDdG?=
 =?utf-8?B?NEF6ZlpDNHNrdmN6ZVZYUTlkMVVKR1E1SmwwY2YvdWQ3QmNyMEtpYzh1STZW?=
 =?utf-8?B?Y1dDM0FhVjgrd1ZMdTdhKzZtbUlCMTZ5MDl6aUdZZTB5YW5OOHdPWFc2UHJU?=
 =?utf-8?B?VXU5ZGcvNE9uYmwyOGNJaG4wM2IrSjkzL2hreDBmOVVqbnZRZDdBQmNzUGN0?=
 =?utf-8?B?ZHhqdnBNUXM2UkRZNXhTYW8rdEJwOUhObDlubFFZdEEzbG8ySGJ4QmEya1gx?=
 =?utf-8?B?T2JzZDdPdzFjM1N0L3RhSjIzN0M3emJ4OVo1cklqTTF2SXBwbVI0aVFZOVBE?=
 =?utf-8?B?Mko5MXMwdUhuMEtHQ3h4d2lWM1E0bi9rZHJYY01mbHJ1aVJzZFNqaVdSNitI?=
 =?utf-8?B?ODhFRUpwU2hYSUJmWXU4cEN5ZzJSUFlRZVJhazNwZ3VHRlIyTW5PVjN6c3p5?=
 =?utf-8?B?Z0IzZVdKa3pPek1oMkVwU3JSRVFSLzNnZGhRZXg2VmRmZlhndmxkY05leU9Y?=
 =?utf-8?B?ZnZYNnNJczVwM1ZhdEpyVU9UVHhnWThleXMwTkptN3lBSU9uSUVwWksxT2pX?=
 =?utf-8?B?VXZxZEVXRUdBSTVjWGxSejluelZnN1oxYklCa3BFTkc5QTFRczhVUEhkN0JS?=
 =?utf-8?B?T3hTM2F5NEpYQkJxOTYzTmdzNExMT3hjQ0IzV2NCejBLd3VJalZnMEMyS0ta?=
 =?utf-8?B?TFU4Q1pBT3MvbHp5RjNLVXBkcHo4ekc2ZWFwcy8yRzJheXhNTG92dmVkVHdv?=
 =?utf-8?B?aXZkb3FVa1VxeTRBRlNLQWFsOEhwM1BqOUQ2Ni9qczlIMzJzamRMUVBVcVhZ?=
 =?utf-8?B?MExTZ0dZN01aOGVQWnZtZnVXMG5QNkNhQjQvcVdxaVhaVWxPR2tXRDJlMDZX?=
 =?utf-8?B?NzdDajRoR0t0aXg0OWtwNmxIdjhmVXJHR0h4SEpMdDRJRG4xVTFxN0lKRGdo?=
 =?utf-8?B?Ti9nYzljYkZ3Y2FqMFEvdnp1ZlN1WFpNWFptL2N5NE1MQWtNZ3ZhMTFyZFlr?=
 =?utf-8?B?MjhTc1RvSkowdW5pVlRpdVcwZHhrZmNtL3dzOWpJVXZoTDVCVFliWld2T0pl?=
 =?utf-8?B?VU96Zkl4dU8zYTI5Sm9obkljZHN5RkRyOHUvZHd4L1RJdkFFeEkzRnpXZ1M5?=
 =?utf-8?B?dTF3RjhLQWJrbHRaT1M5aGRDOTc3aVd1RWpqWVYzZTdzYktBM29jRVNmWXRp?=
 =?utf-8?B?M3pJY3l5Q2JjUGdBNDRHZkdVcUlLSCs3U3Ftak9GMm9hQVlhR0VWZDN5WmZG?=
 =?utf-8?B?N0VZWVlxSXRwQzMweElXcXdwamIyeFBoV2k1Y055bDJHL3VpNGEyYVFFMTVR?=
 =?utf-8?B?cURNeHJtWERUVnhzbkcwSGdvWGN4MU90VHlzK2NXempyS0FibjdobEJUS242?=
 =?utf-8?B?ODQrRDZ0bzNmQzRnTTd3VGZ2bnlkd2N0emdFazRNNlhERC9nSEVCTkx4amxK?=
 =?utf-8?B?ZktXVENvYkYxdlRJVXh3NGRlZHJ0bVNKNkdFRmRCVHM3Zng0SlBpcnNHdFNM?=
 =?utf-8?B?VGwwanhGeG41VnhRVFpoTjNPVVUya1Q0ZjJ3ZURHNmhZdVpMSExtZVpmMnUz?=
 =?utf-8?B?QjlDQjQ3a3hQWVI2RlZVSlU4UEtoVHlVSnRhdDBSUnFDUzRmNGwvcnNmK2N6?=
 =?utf-8?B?YlJTbDYzblJlMDJrU2E4RWF1RmUycUl4OHdUbmxSTW05K0lzREZOVHlXK0tX?=
 =?utf-8?B?VXZ6NjQ0OEc3VDAxMGlOc1BVNHEyTVhmdnNKSEQ3TUVNS2d1bXFRc1doMGF0?=
 =?utf-8?B?Y251Rll0a3M5RGNsN0tVb3ZDVlFMY0Nsd24rZFk2YXFVbXlOQ3EvRkNXKzJr?=
 =?utf-8?B?OHlMaUhjOVdrM3lGWnJ1RENxUWI1anNtTE5VMzFBWkZDcFBHTnhxWllwaHZl?=
 =?utf-8?B?MTk0R3lESmVjVExwRlduZXNrRmE1ZFcxRlM4RFpFVCtuVldmU2xzRzVhaGVm?=
 =?utf-8?B?OUxUUEFRbzVUYmJ5WVEyQXdEV3NJcWxkYThKMGJiL2V6bVJrcGhlWW5sTEYr?=
 =?utf-8?B?YU9lUy9Ra0h1dXg2K2RKVmFvRTlkOUtHSklRcmNla25wWW5DdTc3c255YU9W?=
 =?utf-8?B?S1pDQyswK0x3OHNHdDNrV0lQUStNbGJrZlpseWxIM3AyTHRZU0N1T1J5S3hS?=
 =?utf-8?B?dFE5aUxxQkZGeVJTckVCaW1uMk14UWptaExpdnp4VldSaVJQUkhIeFprNDlv?=
 =?utf-8?B?TDdROVljbkVnZXpoaUdOVWFJcjd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 11:25:52.8150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146ad908-1bff-4b1d-928e-08de535fad5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726



On 14/01/2026 12:07, Luca Fancellu wrote:
> Hi Michal,
> 
>>>
>>> +/*
>>> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
>>> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
>>> + *
>>> + * @param idx                   Index of the mpumap entry.
>>> + * @param region_found_type     MPUMAP_REGION_* value.
>>> + * @return                      0 on success, otherwise negative on error.
>>> + */
>>> +static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
>>> +{
>>> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
>>> +    ASSERT(idx != INVALID_REGION_IDX);
>>> +    ASSERT(MPUMAP_REGION_OVERLAP != region_found_type);
>>> +
>>> +    if ( MPUMAP_REGION_NOTFOUND == region_found_type )
>>> +    {
>>> +        printk(XENLOG_ERR "Cannot remove entry that does not exist\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( xen_mpumap[idx].refcount )
>>> +    {
>>> +        xen_mpumap[idx].refcount -= 1;
>>> +        return 0;
>>> +    }
>>> +
>>> +    if ( MPUMAP_REGION_FOUND == region_found_type )
>>> +        disable_mpu_region_from_index(idx);
>>> +    else
>>> +    {
>>> +        printk(XENLOG_ERR "Cannot remove a partial region\n");
>>> +        return -EINVAL;
>>> +    }
>> NIT: Try to limit the number of if/else blocks to make the code read better.
>> Here you could do the following to remove one else:
>>    if ( MPUMAP_REGION_FOUND != region_found_type )
>>    {
>>        printk(XENLOG_ERR "Cannot remove a partial region\n");
>>        return -EINVAL;
>>    }
>>
>>    disable_mpu_region_from_index(idx);
>>
>>    return 0;
> 
> Makes sense, while we are there, shall we have also a comment above that check, something like this:
> 
> /*
>  * If we reached this point, the region is due to be destroyed, as a safety
>  * check we need to ensure the API is called with the exact region, to prevent
>  * destroying a region using a partial memory range.
>  */
> 
> What do you think? Otherwise someone in the future might think it’s ok to move this check
> together with the other on top.
I'm not sure. I can read this from code but if you think it will be beneficial,
I have no objections.

> 
>>>
>>>
>>> void vunmap(const void *va)
>>> {
>>> -    BUG_ON("unimplemented");
>>> +    paddr_t base = virt_to_maddr(va);
>>> +
>>> +    if ( destroy_xen_mapping_containing(base) )
>>> +        panic("Failed to vunmap region\n");
>>> }
>> Looking at this series as a whole, at the end we will end up with
>> vmap_contig/vunmap to contain the same implementation as map_domain_page and
>> alike from the last patch. Shouldn't we define ones using the others?
> 
> We can do it, the only thing is that if vunmap fails, we will get a less specific error message,
> if you are ok with that we will do the change.
In the MMU case you won't get any info, so I think it's ok.

~Michal


