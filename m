Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CA9C4660
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 21:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834209.1249839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAahP-00078H-03; Mon, 11 Nov 2024 20:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834209.1249839; Mon, 11 Nov 2024 20:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAahO-00076H-TK; Mon, 11 Nov 2024 20:07:46 +0000
Received: by outflank-mailman (input) for mailman id 834209;
 Mon, 11 Nov 2024 20:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0YFU=SG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAahM-00076A-Nc
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 20:07:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2413::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b0d974-a068-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 21:07:36 +0100 (CET)
Received: from CH2PR03CA0010.namprd03.prod.outlook.com (2603:10b6:610:59::20)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 20:07:30 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::c1) by CH2PR03CA0010.outlook.office365.com
 (2603:10b6:610:59::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 20:07:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 20:07:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 14:07:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 14:07:28 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 14:07:28 -0600
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
X-Inumbo-ID: 97b0d974-a068-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjJlIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk3YjBkOTc0LWEwNjgtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzU1NjU2Ljk1NjAyNywic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwxUNNhSpMZVJJe9zgS8fhjxwqov4YSvYOH6HPIyJjlfmSjNT7WqYDUlfbDDMaRXmYsQI8oG5YTLVBopG2mx4JiLR733wcbOUh3xuU5QlIdt5j8EF87VFR3/N52bIvo9ra+mysJIXjShi8sEYwAFtppJVSbuDO7R7Ib7RMFHafd7Ry70FaeFj1wqFeiPwBs2Tt3767hHbI0xCDibJwX544nuLzdaMNfZZ6X/1ZMUJFCb5STSC/Z/HPFS/pwzJf/n+rOAMP4+GVAe+kvP9m7DF9sDYgu7CF+RsrxrVX/rBsRSaljhVo6W9WOWbXqA2g0cRuJBWA4gsv8jnchsalcj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnJ9+w4Ov1p9IQ2w2FJK4S7TT8CcvFCcO9vMgt4Ceu4=;
 b=cYBNoVNIKsP2vEhO3RiPdaScl7O5Dyl7sV/tuUtg76uW7EjLDmLYGGIRzfQ7+iI+CdUu3vprnWDxMPtkbL91rthVOPkbDb7lkB8cKmgDsPMhAvGMotAHb4D25oVxTTkqKgne0HreOJNZITDvpPlaDEWIPlipwD7c3/DR0/8lPEsV0kPJv0zaSnwNsMZPbpnxt21PrNdo7jJtadpRv2c69wL3cSkWrIxV+Ys6qItyTcykWsex+5L02W0LziLtURmvWiLGG7GX9i0o6RQWbIvTUvD9ww6+a3vEiNsVUNMQJE80sFkc56MP62JWDQsNuv7GXbKsNl+hfJz19tEha2sJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnJ9+w4Ov1p9IQ2w2FJK4S7TT8CcvFCcO9vMgt4Ceu4=;
 b=zEtjiWlXyS8/jqYz9/3ePK4Svo+uEf+ei0IEQWuRvQ+FsdLUwWkerEI6HY+xnZjqknkeJYW7NAAap4DyRalLnSPhHyWKeIo29GLB3wxcz8tLYdMhVKG2wVlcR2g6PZGDzO1+b0LjmBRxB13RXaRhvsM6IB4uhbwjw/ytda5OPw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
Date: Mon, 11 Nov 2024 15:07:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <Zx_a57npsdRhLgYr@macbook>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zx_a57npsdRhLgYr@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: af954720-0f1a-4072-5ab1-08dd028c7909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NDTG9SOThvZEwvazhoK3gzN1dud3IyMk5JV2lzTHBmd21wL09BSUc2OWZj?=
 =?utf-8?B?Zjc5bStvb3h1akNsd2hoZkVlT0dnVzJURE5TWTFGNW04b3ZkQnZQTC9JODJL?=
 =?utf-8?B?b05tZTRaRFliZ3hqNzQ0bVhSS21HVThOSXJOcTY2ZjhLSFNvQUdjZWs0UTZs?=
 =?utf-8?B?ZklpNU9XdmhSOWxaZnFQYlUySzhGQ25DemxHV09ybXdSdzJkZ01rdmVab2F3?=
 =?utf-8?B?NCtTS3hPbVBMNDZEakl6aFBTdzYvUzBLNEpDSG9oNFN3ZXozbkNNdGxFTCtk?=
 =?utf-8?B?M1BxcE0rWWZjWlJvVG1DOGxScm9SV2NXUTcwdFRCcnVzVTNwdEVVMXNxVVdi?=
 =?utf-8?B?Zmc1R2ZaNVo5NkhpbTBpRzBqQnlreEtRLzlQTitmblRUeGo2MFF2cGVRT2RZ?=
 =?utf-8?B?cW5FU0FNcVJTUlFTMUtmN1FvWXFuaGRlYkpidHNJNzY3cDlKWmJTek9BOEJU?=
 =?utf-8?B?bU1KOFBpb3ZiajdjakpHVlhLaHkxbzlXUXIxQWkvRWxESUluNWZwTFpEKzh3?=
 =?utf-8?B?TVdmSFprbTJubkhLVHFYaFFMODdEMFpVbk1ud0xkM3JVUFQxWkY3NVNKRmVF?=
 =?utf-8?B?SStETXJ0SWZRRTM4MjFoMGZuMTJyZG5pMW1BcXIydHRYaWtBM2JydVdGbDEy?=
 =?utf-8?B?M2l6K3pmUmljN0g4ZFg2akxIWjlISXRtcCt2d2ZLYmFRTG5tWkVINWQ3Vmc2?=
 =?utf-8?B?N2xOWkJwNnpyOEdoMWN6RWhCcFMzWC9wc0JJMlkraE1qdW9vMlBJM3NxUFVk?=
 =?utf-8?B?aDU3bFhzN0htbFF0ODJzeW5CRzdEL0pORWcwWm1qL0s2b0FiZzBtSW1iWG0y?=
 =?utf-8?B?b25UVkdielZNdHRoSUhUbWJCM2NJdzJKRDhxRnhRNkF1KzVYOW5mMHl3Znlq?=
 =?utf-8?B?K0pVVGVWQno5RVFwU1FkUllhQnJORU1tZGlJOWFOTU14Qk9CNTNKY000YW5V?=
 =?utf-8?B?ZnhrWGVFakpJNURuNUJLVURqbG54cDBqblVGQTlxa3pjZjNEbGJ6OEVEeVF3?=
 =?utf-8?B?TCs1dDFEbHZzVnlZWGRWdWZrcHg3V3ZLdmJCSUdCdlV4NzdQTHlqZmJSb2o1?=
 =?utf-8?B?cjFYdVp1aFRHcFRPTHNxMVNtN0ZTb0pIK29KMnp2Y3dVTytiOTIzWmV5TjFG?=
 =?utf-8?B?M1hyakNDUExFZ3hLTmFCSkJqWXoyN2lzb3UyNFgzRlVacTQ2UjVSaXJkdklZ?=
 =?utf-8?B?TUEzREtIQ2Q3Ynp0WndjenBGVmhNanJqTnVsdDhraTc2OENHNXJZamE4QURY?=
 =?utf-8?B?RWJSdHllTmZFTlVDU0RCRVlRRDNiNmUvTDlJZXJLNXRCVWg0NDFJSDhWVGth?=
 =?utf-8?B?VllmMVExdDI1c2RCKzNHR043QkJjRjZPV3lmMDFFTVlMU1FGTy9XeHkrYlVT?=
 =?utf-8?B?cUcyWXpQS0RYQVFPRTh5ZWcxT3lIeFZTTnFQV2pUa2d2UnRnNEk3akdLYXNO?=
 =?utf-8?B?cUJlUUVtZzY3MlcxN0NLYVVMQmxiK2pZejZRWmw2WlRYK0pRVi9ZVEowbW55?=
 =?utf-8?B?NUZ1NmJQdXdId2lmeCtDR3VrViswUW83NXFWZVB0VUk0ejNkcEp6Tm5PN29G?=
 =?utf-8?B?L2JLMlhsalhCaHNVYmdFdUpTMVV4S3pWNnJRdndmK0d1cFZMS2NSV2lTWEtG?=
 =?utf-8?B?RkJuZ0duNkUwbCtmOEhDRWxwWUFCMGo3QUJBZEFINERjekNQY3NkMVdyeUpF?=
 =?utf-8?B?c09FRmpLVy8wOXIrbjdGSzl3Q0w3MmYvN2hxMEw2aXduRFRra0RwaEgrMFor?=
 =?utf-8?B?a0d4b3EydnZXczk0UVJaZ3UxOXl2bU9JY1Y0S2x5VVFsTnhTZXhDb1ZCVm5a?=
 =?utf-8?B?NHJtYmV1cGF6VGNHUDluUURBZFloQmxRSlNWWHlQbmR0WkRUbVhNRW9hdTA1?=
 =?utf-8?B?L1lkeFFzRnVSQWpldXh2dm45aVBWdEM3UXZmbyt2Wm9oRFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 20:07:30.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af954720-0f1a-4072-5ab1-08dd028c7909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824

On 10/28/24 14:41, Roger Pau Monné wrote:
> On Fri, Oct 18, 2024 at 04:39:09PM -0400, Stewart Hildebrand wrote:
>> Add links between a VF's struct pci_dev and its associated PF struct
>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>> dropping and re-acquiring the pcidevs_lock().
>>
>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>> VFs may exist without a corresponding PF, although now only with
>> pdev->broken = true.
>>
>> The hardware domain is expected to remove the associated VFs before
>> removing the PF. Print a warning in case a PF is removed with associated
>> VFs still present.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Candidate for backport to 4.19 (the next patch depends on this one)
>>
>> v5->v6:
>> * move printk() before ASSERT_UNREACHABLE()
>> * warn about PF removal with VFs still present
>> * clarify commit message
>>
>> v4->v5:
>> * new patch, split from ("x86/msi: fix locking for SR-IOV devices")
>> * move INIT_LIST_HEAD(&pdev->vf_list); earlier
>> * collapse struct list_head instances
>> * retain error code from pci_add_device()
>> * unlink (and mark broken) VFs instead of removing them
>> * const-ify VF->PF link
>> ---
>>  xen/drivers/passthrough/pci.c | 76 ++++++++++++++++++++++++++++-------
>>  xen/include/xen/pci.h         | 10 +++++
>>  2 files changed, 72 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 74d3895e1ef6..fe31255b1207 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -333,6 +333,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>      *((u8*) &pdev->devfn) = devfn;
>>      pdev->domain = NULL;
>>  
>> +    INIT_LIST_HEAD(&pdev->vf_list);
>> +
>>      arch_pci_init_pdev(pdev);
>>  
>>      rc = pdev_msi_init(pdev);
>> @@ -449,6 +451,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>  
>>      list_del(&pdev->alldevs_list);
>>      pdev_msi_deinit(pdev);
>> +
>> +    if ( pdev->info.is_virtfn && pdev->virtfn.pf_pdev )
> 
> Shouldn't having pdev->info.is_virtfn set already ensure that
> pdev->virtfn.pf_pdev != NULL?

In the current rev, the possibility exists, however unlikely, that a
*buggy* dom0 may remove the PF before removing the VFs. In this case a
VF would exist without a corresponding PF, and thus pdev->virtfn.pf_pdev
is NULL.

For the next rev, you're right, it'll be back to the situation where a
VF can only exist with an associated PF.

>> +        list_del(&pdev->vf_list);
>> +
>>      xfree(pdev);
>>  }
>>  
>> @@ -656,24 +662,11 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
>>      const char *type;
>>      int ret;
>> -    bool pf_is_extfn = false;
>>  
>>      if ( !info )
>>          type = "device";
>>      else if ( info->is_virtfn )
>> -    {
>> -        pcidevs_lock();
>> -        pdev = pci_get_pdev(NULL,
>> -                            PCI_SBDF(seg, info->physfn.bus,
>> -                                     info->physfn.devfn));
>> -        if ( pdev )
>> -            pf_is_extfn = pdev->info.is_extfn;
>> -        pcidevs_unlock();
>> -        if ( !pdev )
>> -            pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>> -                           NULL, node);
>>          type = "virtual function";
>> -    }
>>      else if ( info->is_extfn )
>>          type = "extended function";
>>      else
>> @@ -703,7 +696,44 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>           * extended function.
>>           */
>>          if ( pdev->info.is_virtfn )
>> -            pdev->info.is_extfn = pf_is_extfn;
>> +        {
>> +            struct pci_dev *pf_pdev;
> 
> This could be const?

No, as we are doing this below:
    list_add(&pdev->vf_list, &pf_pdev->vf_list);

>> +
>> +            pf_pdev = pci_get_pdev(NULL,
>> +                                   PCI_SBDF(seg, info->physfn.bus,
>> +                                            info->physfn.devfn));
> 
> You can probably initialize at declaration?

OK

>> +
>> +            if ( !pf_pdev )
> 
> Is this even feasible during correct operation?

No, I don't think so.

> IOW: shouldn't the PF
> always be added first, so that SR-IOV can be enabled and the VFs added
> afterwards?

Yes, I think you're right.

> I see previous code also catered for VFs being added without the PF
> being present, so I assume there was some need for this.

This is exactly the source of the confusion on my part. In the removal
path, the consensus seems to be that removing a PF with VFs still
present indicates an error. Then shouldn't the opposite also be true?
Adding a VF without a PF should also indicate an error.

I see the PF-adding logic was added in 942a6f1376d8 ("x86/PCI-MSI:
properly determine VF BAR values"). Searching the mailing list archives
didn't reveal much about it [0].

[0] https://lore.kernel.org/xen-devel/4E3FC6E102000078000501CA@nat28.tlf.novell.com/

The only time I've observed this path being taken is by manually
calling PHYSDEVOP_pci_device_add. I've resorted to calling
PHYSDEVOP_pci_device_{remove,add} from userspace in order to test this,
because the Linux kernel doesn't behave this way.

I can't think of a good rationale for catering to VFs being added
without a PF, so I'll turn it into an error for the next rev.

>> +            {
>> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>> +                                     NULL, node);
>> +                if ( ret )
>> +                {
>> +                    printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
> 
> Could you split this to make the line a bit shorter?
> 
>                        printk(XENLOG_WARNING
> 		              "Failed to add SR-IOV device PF %pp for VF %pp\n",
> 
> Same below.
> 
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
>> +                    free_pdev(pseg, pdev);
>> +                    goto out;
>> +                }
>> +                pf_pdev = pci_get_pdev(NULL,
>> +                                       PCI_SBDF(seg, info->physfn.bus,
>> +                                                info->physfn.devfn));
>> +                if ( !pf_pdev )
>> +                {
>> +                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
> 
> If you want to add an error message here, I think it should mention
> the fact this state is not expected:
> 
> "Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n"
> 
>> +                    ASSERT_UNREACHABLE();
>> +                    free_pdev(pseg, pdev);
>> +                    ret = -EILSEQ;
>> +                    goto out;
>> +                }
>> +            }
>> +
>> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;
>> +            pdev->virtfn.pf_pdev = pf_pdev;
>> +            list_add(&pdev->vf_list, &pf_pdev->vf_list);
>> +        }
>>      }
>>  
>>      if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
>> @@ -821,6 +851,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>          if ( pdev->bus == bus && pdev->devfn == devfn )
>>          {
>> +            if ( !pdev->info.is_virtfn )
> 
> Given we have no field to mark a device as a PF, we could check that
> pdev->vf_list is not empty, and by doing so the warn_stale_vfs
> variable could be dropped?
> 
> if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
> {
>     struct pci_dev *vf_pdev;
> 
>     while ( (vf_pdev = list_first_entry_or_null(&pdev->vf_list,
>                                                 struct pci_dev,
> 						vf_list)) != NULL )
>     {
>         list_del(&vf_pdev->vf_list);
>         vf_pdev->virtfn.pf_pdev = NULL;
>         vf_pdev->broken = true;
>     }
> 
>     printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
>            &pdev->sbdf);
> }

Yeah. Given that the consensus is leaning toward keeping the PF and
returning an error, here's my suggestion:

    if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
    {
        struct pci_dev *vf_pdev;

        list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
            vf_pdev->broken = true;

        pdev->broken = true;

        printk(XENLOG_WARNING
               "Attempted to remove PCI SR-IOV PF %pp with VFs still present\n",
               &pdev->sbdf);

        ret = -EBUSY;
        break;
    }

>> +            {
>> +                struct pci_dev *vf_pdev, *tmp;
>> +                bool warn_stale_vfs = false;
>> +
>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->vf_list, vf_list)
>> +                {
>> +                    list_del(&vf_pdev->vf_list);
>> +                    vf_pdev->virtfn.pf_pdev = NULL;
>> +                    vf_pdev->broken = true;
>> +                    warn_stale_vfs = true;
>> +                }
>> +
>> +                if ( warn_stale_vfs )
>> +                    printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
>> +                           &pdev->sbdf);
>> +            }
>> +
>>              if ( pdev->domain )
>>              {
>>                  write_lock(&pdev->domain->pci_lock);
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index ef56e80651d6..2ea168d5f914 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -153,7 +153,17 @@ struct pci_dev {
>>          unsigned int count;
>>  #define PT_FAULT_THRESHOLD 10
>>      } fault;
>> +
>> +    /*
>> +     * List head if info.is_virtfn == false
>> +     * List entry if info.is_virtfn == true
>> +     */
>> +    struct list_head vf_list;
>>      u64 vf_rlen[6];
>> +    struct {
>> +        /* Only populated for VFs (info.is_virtfn == true) */
> 
> All comments here (specially the first ones) would better use PF and
> VF consistently, rather than referring to other fields in the struct.
> Specially because the fields can change names and the comments would
> then become stale.

OK

>> +        const struct pci_dev *pf_pdev;        /* Link from VF to PF */
>> +    } virtfn;
> 
> I'm unsure you need an outer virtfn struct, as it's only one field in
> this patch?  Maybe more fields gets added by further patches?

Right. There are no more fields to be added, so there's no need. It was
leftover from a previous rev when vf_list was split.

> 
> Thanks, Roger.


