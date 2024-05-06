Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906F8BC5B3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 04:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717170.1119139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3nuB-0004Yz-Vu; Mon, 06 May 2024 02:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717170.1119139; Mon, 06 May 2024 02:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3nuB-0004WB-SQ; Mon, 06 May 2024 02:16:39 +0000
Received: by outflank-mailman (input) for mailman id 717170;
 Mon, 06 May 2024 02:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3nuB-0004W5-5j
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 02:16:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b5acbc-0b4e-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 04:16:37 +0200 (CEST)
Received: from BL1PR13CA0129.namprd13.prod.outlook.com (2603:10b6:208:2bb::14)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 02:16:31 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::e4) by BL1PR13CA0129.outlook.office365.com
 (2603:10b6:208:2bb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 02:16:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 02:16:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 21:16:30 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 5 May 2024 21:16:29 -0500
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
X-Inumbo-ID: a9b5acbc-0b4e-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ady+4OdaaNv20tQ+VUMLzuQt5DArIp9PAeahFU5PiKpS2qeLvrrL9EyNTAnCbRwzu6Ox2U4OfcAALMM9w6ZZQd0BwQeVkww91hfel6wBxITZ7fYftevvZg7cavtZocO3QFo0UkDpXu9wb2aSOglZ+oCw2zAzygg4d0pJTrqHvve3h0t0fMloqymZc+gdikPdNPU64LTU6A+WgRLeo4IafQFrxiELWrBKB8MYtaXjB7IapSXY698fvN0x/pWJBm414Hphl8SDdC5TYScoaq84CBnUFJgkWya8RxhEsGibkeFjhrsnBNRu2Izv9WgH99P248tU13roD74v6UiSIawPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbEo5joN/4v2ow6t+LusWh6gNzrsasDkuzFWmFX5q4I=;
 b=mzW5blWIIYNkA4dIVzUA5krn2V69h3Fsq4MFX390RGVTcN1Q3e+N3S2wp89nc7BFt4k5iro84i+sID5wEmhutoRW6VZeXsx50HTWqtRUIOcxsWYy0fsS0KTigpUljE1GRjARGp9zFkAHZ1W2DjoF2WRDja0vtW3beTfezjj4fEGGtN72+pSWqafy4Yuf0uAA/UPjmHqb8ktXvAYwxC3huoNDxpoFL5zCSrvoufbho/+1FGGb96TRAzZ5PH9K3hu6d+HmxRw7P13WN6wmi3wIj66iAjmwYVCIhT5DLGaExu3qPT0PaiTO+fqLG86L/k9KD7mhl4t4jNrB0JTe/J21tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbEo5joN/4v2ow6t+LusWh6gNzrsasDkuzFWmFX5q4I=;
 b=wDm0lMFTI7CB3aADe+vuKtFYAS64HIdZj6spJEV1C+yn5XMaTdvWUW8WIuqPkDIlb6hls7YUAfwqaDccF4ckqw24LftviJHmKp2oJ8OUpeQCUAVOzC4ZvwKznicyPzX58IAfFw1GD9b8FxKTMMFirBLa8rd4fXVDVtjafSKkwtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b1db7fea-eb86-405a-9cde-e8c600e0c4b8@amd.com>
Date: Mon, 6 May 2024 10:16:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1] xen/commom/dt-overlay: Fix missing lock when remove
 the device
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>
References: <20240426015550.577986-1-xin.wang2@amd.com>
 <835099c8-6cf0-4f6d-899b-07388df89319@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <835099c8-6cf0-4f6d-899b-07388df89319@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3394e723-e85f-4764-e81f-08dc6d728afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHVkY0FKY1RUNktCbllmWWt1Sm0wR2xqOFk4TEkvMlR0Sm8xNkhJa1NkTVVO?=
 =?utf-8?B?eDZkdVVkWGs3cEs0L3lJQU9FNkNtTGNqbEtsYlNFMVhCRnduMDE1aGxKOEN3?=
 =?utf-8?B?anpCaHZHZityb1pTMGsyc1k1dWZoczJqSXRwNUNUSlJKN1RNRmhuaVRDSnRw?=
 =?utf-8?B?NFdzczFHVDlyMmJhTjluMzV0TG9uZTJxeTNLb05qbzJMaHUzblFKY1FQQWIw?=
 =?utf-8?B?M3hUWGIzWDR1Y21zZWVNU1dlWjRsaklGek9ITHBwZkFTdG9yaXBqN1FjUnZX?=
 =?utf-8?B?bFFIK05CN1VyVm9MWlFUcDdxaFVEVTRXMFY0VjZpN1NmOFJDUjIvNGxTS25z?=
 =?utf-8?B?MElheHVOSE53V3k1aTJYZGh4TS9NcHJRcXJ5Tkl3aXhpK0dLMFc0VGZsbTZq?=
 =?utf-8?B?Z3hMU1pBVVZmUVlUWGhVd1dCaExuMkxyZmI0eXFIdUpnSVMzSnNTMmtVTEsy?=
 =?utf-8?B?TURYTGI5TzdGdURobDZvZDRqb3VZbHRBRGszL3oxSGUzVDh1WFhYZFRkcGtl?=
 =?utf-8?B?OE1JVUx0TjlqRXdSSTlYNmJxbWF2YkhLbG1HcUFhU00xYmoyaWJEZ2RXSlY4?=
 =?utf-8?B?eUlEaWkxdXN1cTNBbmtoMEtsaC9CQ2hUcm9WK3p5T2hlWTRWbWlDa0J1NTZT?=
 =?utf-8?B?RTRRVkc4eUVTN0hGT3NrUktqdTZMNU1TVWZXUGFZZ3FtUnNPQnA2NFlSWWtl?=
 =?utf-8?B?Z2MzSzh4c01MeW5HYitydnlkbUdOalc4ekhncGxkMnVicHRRTXh0djZyRUp4?=
 =?utf-8?B?MmJQU3JMdXhWKzdma2l5aGlGN2JaVGRMMzd3NEYyUWg4VmJjbHVuZ3BOUmFU?=
 =?utf-8?B?aFlIUC81WWdOWUY3akkyMGVSNzVvbXllTEJsNW5maHpXby96S3pXWGZIWkpl?=
 =?utf-8?B?SG8zQk9pNjB0dUZpeDgvZks1Z3JmcGluMExibWFzcExwV2FxRURabWxRUkpj?=
 =?utf-8?B?OTIxT1Y5dW9wSlo4YklQcnJIdnRLRDZ5NndhdEwxTHRqQklzVHF3VW9uMWp2?=
 =?utf-8?B?UjlIMytKSk0zNmFjODk3OVBHWXZEakJEbHVpeERqbHNLOUJaenBYQ2lleUVH?=
 =?utf-8?B?bVIxNEJYbFBNMTFWVjE1WHhZN0EzNlUrUjVGRGp2UW5Tbm9nSjBPZnRjVEln?=
 =?utf-8?B?ZVZteXNWSFltTFpCemlRbTUrcTJTZ2xFWFZYUjRaWFZDUVlBYlZzMmFvcXA3?=
 =?utf-8?B?Yzh4NHYwcWFOVHlsY2ZNVDZ4WUswSFAxSVY3OGhTbVJNalFWMDE4RVpCK3ZM?=
 =?utf-8?B?eG5VbTdGWnIySCt6NVp6OFJKNEhzTXBGQXpZTlllWmpCQ0h5MWppdWRRUVhs?=
 =?utf-8?B?NUxxTVpYWlFsVmhXYnFTUk5mY2lNSEpSYWJLK1ZsbmtJbUdUc0QycVg5RWVL?=
 =?utf-8?B?MjBtbml1UTBOMWphMVBGTU1hSDVMY2E0a293UWpFbmpuKzcyYThqU0NtaU1i?=
 =?utf-8?B?UERRSG5uZnRMMVRiVFpQb0l6QWZmbnVtYUtNYkhiOFhIR1NxNlpFK1VUeGhK?=
 =?utf-8?B?V0pDTDJ3VEtnNHFOOHBHVXVKWWFCVUhKK083c2h6M1YxeHRmb3ZNYjdnU0NB?=
 =?utf-8?B?T20vYnZlTUZkYnk5ZlJlcEY1RWc5MVdGd1pJOUlmMHNBUWl3Z3h3bUhxR2x4?=
 =?utf-8?B?bFVHcUtRU1R1M3ZZMUlmZ0pSYURyak04TTR1SVlQc3JtZEZZcGtnQnoyczlZ?=
 =?utf-8?B?NE5SZ051Tk13dDVQRm5mOHV4dG5jalVCMkpxWFF4WlRLdHd3T1Zia1NJUHF2?=
 =?utf-8?B?YkFteFJOendZeUlrckZKYXArK1BMSEU5R3R3TVBiRktNandlSTZKdzB6dmVV?=
 =?utf-8?B?NzBBSVNGM1FsRitoNjQwUm4vNHN3M0psd3QxRUJzS3ZVdkVwT1grbmFKQXBL?=
 =?utf-8?Q?5TDYqWwjnfqCp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 02:16:30.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3394e723-e85f-4764-e81f-08dc6d728afd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800

Hi Julien,

On 5/3/2024 9:04 PM, Julien Grall wrote:
> Hi Henry,
>
> On 26/04/2024 02:55, Henry Wang wrote:
>> If CONFIG_DEBUG=y, below assertion will be triggered:
>> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at 
>> drivers/passthrough/device_tree.c:146
>> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) PC:     00000a0000257418 iommu_remove_dt_device+0x8c/0xd4
>> (XEN) LR:     00000a00002573a0
>> (XEN) SP:     00008000fff7fb30
>> (XEN) CPSR:   0000000000000249 MODE:64-bit EL2h (Hypervisor, handler)
>> [...]
>>
>> (XEN) Xen call trace:
>> (XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
>> (XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
>> (XEN)    [<00000a000020797c>] 
>> dt-overlay.c#remove_node_resources+0x8c/0x90
>> (XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
>> (XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
>> (XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
>> (XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
>> (XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
>> (XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
>> (XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at 
>> drivers/passthrough/device_tree.c:146
>> (XEN) ****************************************
>>
>> This is because iommu_remove_dt_device() is called without taking the
>> dt_host_lock. Fix the issue by taking and releasing the lock properly.
>>
>> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal 
>> functionalities")
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>> v1.1:
>> - Move the unlock position before the check of rc.
>> ---
>>   xen/common/dt-overlay.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>> index 1b197381f6..ab8f43aea2 100644
>> --- a/xen/common/dt-overlay.c
>> +++ b/xen/common/dt-overlay.c
>> @@ -381,7 +381,9 @@ static int remove_node_resources(struct 
>> dt_device_node *device_node)
>>       {
>>           if ( dt_device_is_protected(device_node) )
>>           {
>> +            write_lock(&dt_host_lock);
>
> Looking at the code, we are not modifying the device_node, so 
> shouldn't this be a read_lock()?

Hmm yes, however after seeing your comment...

>
> That said, even though either fix your issue, I am not entirely 
> convinced this is the correct position for the lock. From my 
> understanding, dt_host_lock is meant to ensure that the DT node will 
> not disappear behind your back. So in theory, shouldn't the lock be 
> taken as soon as you get hold of device_node?

...here. I believe you made a point here so I think I will just move the 
write_lock(&dt_host_lock) as soon as getting  overlay_node, i.e. on top 
of the call to remove_descendant_nodes_resources(). Therefore we can 
solve the assertion issue of this patch together.

Kind regards,
Henry

>
> Cheers,
>


