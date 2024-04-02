Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F46894DCB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 10:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700045.1092590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZkP-0005Ss-DS; Tue, 02 Apr 2024 08:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700045.1092590; Tue, 02 Apr 2024 08:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZkP-0005RB-As; Tue, 02 Apr 2024 08:44:01 +0000
Received: by outflank-mailman (input) for mailman id 700045;
 Tue, 02 Apr 2024 08:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6R5e=LH=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrZkN-0005R5-O8
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 08:43:59 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24c09d1d-f0cd-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 10:43:58 +0200 (CEST)
Received: from PH8PR15CA0021.namprd15.prod.outlook.com (2603:10b6:510:2d2::24)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 08:43:54 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::16) by PH8PR15CA0021.outlook.office365.com
 (2603:10b6:510:2d2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 08:43:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 08:43:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 03:43:54 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 03:43:52 -0500
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
X-Inumbo-ID: 24c09d1d-f0cd-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiIQa1vk1llaoV3eBw4oHU89uM5zbSCx9QwUT4OFxJZY2NSg909cDvjzJndcrnMMmDGKnm2+QG6BYHe3tf4n8fFnKBBc4816cbv8bQPnBy4qGzHR3JnJ9VcF1aoZPOKGLti+0HxjTE6BWP6QgqDWlCT/CAlLgjhSffTetnM7FagfToRJZ0jIBhXos/qozRpMEU2cicPWlgP+dcngYYmkUVXp7lC2RL+RHhd5woenQoz4S3MQl5aIle0b6NVe3vEQvTsyAMNn+E4/88ek5wTwPYQ3pu2JjBMya4Z3zK+CPZHA81JK2m7kbpgU3uzpVem1lYuHjRkr0jgI2Q25JtS1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNN84drcALK2z9xTGnyTeN/wURz5uA3TYQBHHZR5fC0=;
 b=jznPdEm0PYFAYiBzJlBHN4fsyRW/vI9qK7jkE277RzOJ4kV2GHnDLC4Nl2xZlWDmVKDHQSRtoN4+LnBua8OT7jwtg8m2huw4e96lNC8iwrYLzatMQKrbo7DpHG7n6ZCmjymWSMixDOarwKILJVNImoJdg1ZlwgtjIO4Y7R76XA1U1wvnAyzidxIJ832oPjIqfzxYwBOY7v5F6kBnVhtJI79aL40iPOfZWiZApfBLkf6ji8iRB2SEt7A55Yme7xi2rbwz6pi6Z5UM5OwfjVP4f2/N1v1GgxS5H89ophj5PZ3HJzPy3zUl1MMVJSOgjOgRp4xrNtE6HTJ+oUhbs0qrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNN84drcALK2z9xTGnyTeN/wURz5uA3TYQBHHZR5fC0=;
 b=SfVmyvEp/TmpEtnBR4ouh+Th6zyy7Aj+nd7L+FJTClj2dF1wJZi5lrSMkP1BP4HIrJzPPp4hTk/zJaeiacnCfNZrMI1kV1jxYbBj7nseiaMwfLTCsiUoBmXvsHJlnDRq2CXo+Je33vq6Sztme7z+HK4jxyUhTu0cSCUUp7BFYj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4a0e4c60-9401-4031-bf80-66033ad068e3@amd.com>
Date: Tue, 2 Apr 2024 16:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
 <b1393dbe-42c2-4839-8ca3-7dc71fe72969@amd.com>
 <d9e3b7c4-d8be-4642-9212-b48ae885b46a@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <d9e3b7c4-d8be-4642-9212-b48ae885b46a@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c07e25d-ff1d-4812-6da5-08dc52f10779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9+X0zgXTg0PtRwE88qALawmOLxqEROBNWYsvLI84K0c+XYJqa1RKc6Flc2Lvw8HYNMks6S4q8wslqXQF2XSinTy21zVSe7dKlsyaDJjMp2ZkW7CSCsgKXLLjbsRReswaAOdop1NTqZtweJX3scepiC7xUQD0OIcQyI1SyDpBSu+NDZviQFp9a6WbdAxhXa8kRdWJUdnF8LQMnfzbk2qblxodySbZw6/DFafqh0/qRYtluffrY0hI1VDXAdu1s9jhqgGCEHIrf8Hxf5l1VI6rxVldwR4Yro+sx9JJdimpgHBiSu83rNL9xw43M/VipmCyqqKy91iACZFJsNIPA+XK7ByQ+SXuHKKPMPRYwoBDmuLSUrRN2UKiWDa7c7defXogAhfU6wQTu4h4lRdOWlz5lZz+3y4VmOvbws+uh2hPBIA0/rq8e1ro9JY0BDuPp9idQpufdVWY61VJyaIiC3aUA51IwIhgggqMTfyILfWkD4bb4NqlaZMJWoziiFg0p9dcaI7ni89jlPCrp/X5DDu8PhqQfsseYYqaV0NXzJkLuyi/tdi5RAFpgVZxHVRXYvEZ/JWLdr8gUyxNoOd7DaKUmjuUCZCdX01Hb+56q9RrscPcfk4TSvjxD7XuRaitXCkuU3WNU4/SaK+YoWP12OU+ebcYYPLIqpqLX0SRC6c3iPKrmYqHQfR4YHTA+7L8i210yjHW25oHcqnkWSnMttkyuJxjfQiiJGYwpAcyhjY0qjcibqRXac4lTyFB2RcrE5+j
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 08:43:54.5137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c07e25d-ff1d-4812-6da5-08dc52f10779
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194

Hi Jan,

On 4/2/2024 3:05 PM, Jan Beulich wrote:
> On 29.03.2024 06:11, Henry Wang wrote:
>> On 3/12/2024 1:07 AM, Jan Beulich wrote:
>>>> +/*
>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>> + * or static allocation.
>>>> + */
>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>    #endif
>>> If this is for populate_physmap only, then other sub-ops need to reject
>>> its use.
>>>
>>> I have to admit I'm a little wary of allocating another flag here and ...
>>>
>>>> --- a/xen/include/xen/mm.h
>>>> +++ b/xen/include/xen/mm.h
>>>> @@ -205,6 +205,8 @@ struct npfec {
>>>>    #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>>>    #define _MEMF_no_scrub    8
>>>>    #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>>>> +#define _MEMF_force_heap_alloc 9
>>>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>>>    #define _MEMF_node        16
>>>>    #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>>>    #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
>>> ... here - we don't have that many left. Since other sub-ops aren't
>>> intended to support this flag, did you consider adding another (perhaps
>>> even arch-specific) sub-op instead?
>> While revisiting this comment when trying to come up with a V3, I
>> realized adding a sub-op here in the same level as
>> XENMEM_populate_physmap will basically duplicate the function
>> populate_physmap() with just the "else" (the non-1:1 allocation) part,
>> also a similar xc_domain_populate_physmap_exact() & co will be needed
>> from the toolstack side to call the new sub-op. So I am having the
>> concern of the duplication of code and not sure if I understand you
>> correctly. Would you please elaborate a bit more or clarify if I
>> understand you correctly? Thanks!
> Well, the goal is to avoid both code duplication and introduction of a new,
> single-use flag. The new sub-op suggestion, I realize now, would mainly have
> helped with avoiding the new flag in the public interface. That's still
> desirable imo. Internally, have you checked which MEMF_* are actually used
> by populate_physmap()? Briefly looking, e.g. MEMF_no_dma and MEMF_no_refcount
> aren't. It therefore would be possible to consider re-purposing one that
> isn't (likely to be) used there. Of course doing so requires care to avoid
> passing that flag down to other code (page_alloc.c functions in particular),
> where the meaning would be the original one.

I think you made a good point, however, to be honest I am not sure about 
the repurposing flags such as MEMF_no_dma and MEMF_no_refcount, because 
I think the name and the purpose of the flag should be clear and 
less-misleading. Reusing either one for another meaning, namely forcing 
a non-heap allocation in populate_physmap() would be confusing in the 
future. Also if one day these flags will be needed in 
populate_physmap(), current repurposing approach will lead to a even 
confusing code base.

I also do agree very much that we need to also avoid the code 
duplication, so compared to other two suggested approach, adding a new 
MEMF would be the cleanest solution IMHO, as it is just one bit and MEMF 
flags are not added very often.

I would also curious what the other common code maintainers will say on 
this issue: @Andrew, @Stefano, @Julien, any ideas? Thanks!

Kind regards,
Henry

> Jan


