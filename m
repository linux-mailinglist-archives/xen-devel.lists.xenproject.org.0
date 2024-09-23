Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5A97EA6F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801932.1212009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgst-00077P-M5; Mon, 23 Sep 2024 11:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801932.1212009; Mon, 23 Sep 2024 11:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgst-000755-JB; Mon, 23 Sep 2024 11:05:39 +0000
Received: by outflank-mailman (input) for mailman id 801932;
 Mon, 23 Sep 2024 11:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbMn=QV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ssgst-0006wY-20
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:05:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c279575a-799b-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:05:37 +0200 (CEST)
Received: from PH8PR21CA0014.namprd21.prod.outlook.com (2603:10b6:510:2ce::28)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Mon, 23 Sep
 2024 11:05:33 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::a2) by PH8PR21CA0014.outlook.office365.com
 (2603:10b6:510:2ce::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.3 via Frontend
 Transport; Mon, 23 Sep 2024 11:05:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 11:05:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 06:05:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 06:05:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Sep 2024 06:05:31 -0500
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
X-Inumbo-ID: c279575a-799b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVaiRgBBPgzFrEd+24vgGyBHnaU/PhjwdzVGqHlBgkyRrlbwgnV90dziL07GnLiolcIMu7+gVH6dwxMPhhs2oFQCIPjJB8tM4pjPx01r3c/ug8I1/hrIQ1BHAsg7C4bk3yjKvn0VzmC3RZz5sh4vrz1IIgBvMEIhaswCZPaFR8dqXfxzUwKlK4zX6xlJnp/dsJFdlnS7+UUFim5yZlivLDBbZm4/0y7hLtxiXc/jNbHgKbP7dgeOzRlOxU7H6rxuekUYfNkyNCqGLr+4AIIBuLYwRcTZmKqUIF8HXW/oaHoWFLBMBNZmsG23t0AEk9+AuvOaFHiMDzyIr80xbrEioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3sdp2muBkg4qEcmjlHN7jfdQHRuTHQcd8HuTqP/W2g=;
 b=BehpOCRAMkNC24vNw3UsVVNCANEI96aMBlDZXaqg4EJRg35OcfTit4ovY9TVSqAypCeM5ZfJt/3X3eoIAWf3hXIHpAoEOUWcX6TCYxF/W3/XwrVby2T0Xv/AeFcn/PaUgHhyZl+Z3VXbsH5O6w8fI3B17y0SGDOe+KzcEuBzrQpdGO/HXnmtTqZKnLVJ/x3Q2C8vn4uAuIjJj2qVYI0l+RqpIRIvz5uJQLsrjGgE/FG9jr5QINRC9huWUAgO57uOt+I72cUkbQJ6oMQn4u26Y1PcJw5XgU6iPRFVsvL9TULkt5/wDRHJK2d0hFUtedeeUdlIyKTrR9rXGFDkJLa9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3sdp2muBkg4qEcmjlHN7jfdQHRuTHQcd8HuTqP/W2g=;
 b=iIp/0OAPTU6hOZERKkFBUWE5OtEHFeVGmOkWMjPJZQTVWTTnFjZ7kiMttUHcHqz/KB5NT8QlrmbeG7VlsMcA1Hjs1fd5Cw7LUFcI24cTlm7fhlqO15g1tDN1/a37udydQReJ+iEnslevSUFf3sIJGMNpiN/kTju/U0ngWEnIWi4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <74bddc2d-59f2-4961-b226-76ce62376c37@amd.com>
Date: Mon, 23 Sep 2024 13:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-2-michal.orzel@amd.com>
 <72bd286a-9ed9-43f0-8935-fb9e07e180cd@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <72bd286a-9ed9-43f0-8935-fb9e07e180cd@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 7836c452-96bf-4c02-8551-08dcdbbfa521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTA0aS9zUElRQzhmTklKZXBpdEpSQjlLKzByNVRIMTN0VVZURjVibjJtNGF5?=
 =?utf-8?B?S1EzQmtyMnNuNFZHMEtjZEh3YjBVRXFzMUg2SWN1QVZiTkhTQzhpZlkydDhF?=
 =?utf-8?B?RWtzblR2bmRpUVM3QzJNeG9MUnJId0t3U1FldUkyb2ZBUU95cUZ2a3gyV0tZ?=
 =?utf-8?B?QzhvTnhJT0wrNTkyaStRZ2k2dHJUV3NJVHIxbFJsbEFPN1NwcUZuSW1FQ0RE?=
 =?utf-8?B?U3lzR3ozdjhQb04zN2RPRStZcUw3V05qajdXcVVvKzdmSjlOQjk4MncrZ0hp?=
 =?utf-8?B?VzN4RTNiWmNzR1dmejBOeCtBQ2RWTTYrdUZZV2Vjdk1yUnRVQTRFamgyTURH?=
 =?utf-8?B?MHZyWDZpa1VvTlhteXN3cWlwbjViblBiV0FHdzN4UUxjdHNMeTVUbnkxR3V2?=
 =?utf-8?B?MVZhRnVOV2FWZWF4RWloS3R6WnAvVUFDV29wZFNleDB1d0xxdFZseE82UDlH?=
 =?utf-8?B?MVVjYmlPSUV6KzZWZ2NhUHAydnhnTHpVSjVCOWd4M1lEeVByNG5ob3FsMzZS?=
 =?utf-8?B?Q1liM29MQmFmNVhTbmRGcU5CTDZGM2xXbVZETURxRGdHbTVwaFVKeUZERzk4?=
 =?utf-8?B?Q09jdDJJODNtZXdXcE5lMldza3pYVmdEYWlranROS2R0VDVZdlMzN2FNZUM5?=
 =?utf-8?B?bHR3Nlp5bWV3WFVtNDNNSk9nWDM5NVNrbHQxazl4eHZTSmhZSFA0ZnpIc2M1?=
 =?utf-8?B?N1J6RzNCOVd5eXFUc3RLQW5WQllZMFF3TU9GZVhoTDcxVjhRSmFrbGdramxQ?=
 =?utf-8?B?cGNjTTBSYVZuMEdKYlZDRzJqZGtmT0pOQmxpZFVlOTR0b2ZkN0JaREx1bWJv?=
 =?utf-8?B?MU0rQ2VEVERhd09vN0VkamJRT29HS3B0UmFsQUJlLzQzSU5jejl5dTdKU2hV?=
 =?utf-8?B?ZEYwazNQRUttM0RzL2tLVHlJWFRVZTdjNlk5OTJsdU5NM2xQOWk0d0FnbUhH?=
 =?utf-8?B?U2JSdWt0SjlzUHcwRTQ4R3lYRXR2YTJBL21ROThjU3A5Z2ZsMnd3Nnl1MUlK?=
 =?utf-8?B?QWQwenRjNG5xcElrUzk2dnJ0OHczZ1dyNldKNk5mQ0dETUlNQzVZeHZmRGla?=
 =?utf-8?B?dUI1enJtaDdFUUlXa2RDdWp3RjBITGpSbklteWorQzQxRnFrVkoyRWdjZitZ?=
 =?utf-8?B?SnJlVElsYlhUOFNnOEhUMXpPaHdmNVJuSEVFVmZGMG9kRnNpNmhQTU9YTDYz?=
 =?utf-8?B?anY2RkVNekFtVDYvclc3c1F5ZXJFblBhcHNXQzVLVlZXOWQzcXZZVldsTS9l?=
 =?utf-8?B?eFV2SW5MNzFMdkdXdnVISG9rS3pFMjBnT2w4L1RPM3JYM2dpVEY3NERTMWtB?=
 =?utf-8?B?R3VweTljcVhGeGJ3RXREcjBlemd0TzFDeEpiNzVmdEFHVGVSTEQ2S1Rrem5U?=
 =?utf-8?B?a2RFNFNONTVVMFUreGt0eWliNjJ1RFZKVFlsNzIzWFNialFZb3Y3Q0xpMld3?=
 =?utf-8?B?eWVPTm5PeHpRR20vRS9FWjJ5aXpJTXRkZGhxaGdDNXlSSXhkMW90WkFWVm9V?=
 =?utf-8?B?NlZ1dDNPOUJ6UDcyOG5wTWE4YVB0YWJhYWpxbkluRmNTYnlsZTlMWHE2Vm1I?=
 =?utf-8?B?M1BQSHVLWGdMUW0xY0xvNEFIRmNyWkRVQ0pWTEJFYUhJUXFQMUxtSTBQWDM4?=
 =?utf-8?B?RnAxVThNQzFOZGVkL1dsRlVtY04zZGV3UXBBL0wxVUZqNGdiZkJZM0MrZ3hB?=
 =?utf-8?B?YVFBb1hpZkZDbWg4aVdqT0RuT1VNYW9BenFoUlM5cDhKakNzMnBRaHhCUzlV?=
 =?utf-8?B?MzZKb3FKVzd4eXVzN0hYQTdkSHFUaHlQN3loRW5TVW05bnFWZERnZ2dtalpY?=
 =?utf-8?B?YWE4NEo4ZTE1WG1kNkx5eWUzdE9MZ2F5OWhSbE1MR0ZEbG9ES0ZTRlFOZUtn?=
 =?utf-8?B?emR6M0pQLy9NcVgyQUJVbGVkSEFVNGZVTDYrVEl6RGhLaWYrZDY3L3NMZCtC?=
 =?utf-8?Q?HCu7J88IAthdXdQkAz49Lm48tsOhhcbO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 11:05:33.3566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7836c452-96bf-4c02-8551-08dcdbbfa521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822

Hi Julien,

On 20/09/2024 10:29, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 19/09/2024 12:42, Michal Orzel wrote:
>> Attempt to attach an overlay (xl dt-overlay attach) to a domain without
>> first adding this overlay to Xen (xl dt-overlay add) results in an
>> overlay track entry being NULL in handle_attach_overlay_nodes(). This
>> leads to NULL pointer dereference and the following data abort crash:
>>
>> (XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
>> (XEN) Data Abort Trap. Syndrome=0x5
>> (XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
>> (XEN) 0TH[0x000] = 0x46940f7f
>> (XEN) 1ST[0x000] = 0x0
>> (XEN) CPU0: Unexpected Trap: Data Abort
>> (XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
>> (XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328
>>
>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/common/dt-overlay.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>> index d53b4706cd2f..8606b14d1e8e 100644
>> --- a/xen/common/dt-overlay.c
>> +++ b/xen/common/dt-overlay.c
>> @@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
>>    out:
>>       spin_unlock(&overlay_lock);
>>
>> -    rangeset_destroy(entry->irq_ranges);
>> -    rangeset_destroy(entry->iomem_ranges);
>> +    if ( entry )
>> +    {
>> +        rangeset_destroy(entry->irq_ranges);
>> +        rangeset_destroy(entry->iomem_ranges);
>> +    }
> 
> While looking at the error paths in handle_attach_overlay_nodes(), I
> noticed we don't revert any partial changes made by handle_device().
> 
> In this case, I am wondering whether it is correct to destroy the
> rangeset. How would you be able to revert the changes?
I guess the same story applies as for the partial add/remove which was stated by Vikram
in the commit msg of 7e5c4a8b86f12942de0566b1d61f71d15774364b meaning partial success withe some
failures may lead to other failures and might need a system reboot. I did not carefully look into
this series, my plan was to fix the issues without changing the functional behavior. FWICS, we do not
yet support detachment (only add/remove and attach) and removal of nodes and ranges is only
possible if the nodes are assigned to hwdom.

~Michal

