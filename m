Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0E7E499B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629002.981010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SQ3-00088G-HD; Tue, 07 Nov 2023 20:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629002.981010; Tue, 07 Nov 2023 20:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SQ3-00086a-DK; Tue, 07 Nov 2023 20:11:27 +0000
Received: by outflank-mailman (input) for mailman id 629002;
 Tue, 07 Nov 2023 20:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LI2d=GU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r0SQ1-00086T-2A
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:11:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1fe38a5-7da9-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:11:23 +0100 (CET)
Received: from CY5PR15CA0166.namprd15.prod.outlook.com (2603:10b6:930:81::14)
 by MW4PR12MB7467.namprd12.prod.outlook.com (2603:10b6:303:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 20:11:20 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:81:cafe::a3) by CY5PR15CA0166.outlook.office365.com
 (2603:10b6:930:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Tue, 7 Nov 2023 20:11:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 20:11:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 14:11:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 12:10:47 -0800
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 7 Nov 2023 14:10:46 -0600
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
X-Inumbo-ID: d1fe38a5-7da9-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVbvVOVu3QPNvkaIOPy4Kv83Mn/0YCflYfQ+zgM3LiIE9vkTHeBjD1PlVOZZTNHEA3x0iuIdCZk0voIrVuhdoc74EhVvXybad32zdDZ4uqfrW+oqd/+TH/IvQIJtsn+hZWBv32oKWsqV8RbXOkhO73yNPmkkmAypz9Bcs4p5MQTlXy+iA6J7aCVqJOrMVDXo2mt8weWQvs+reCHhm9LnetsMk5c8QdjXdlBD6B1JXNHqJY9iw2yiZNm4FjlrZHj8n/0fI0T6OtEzPPLvEEPZwc9VBhvBWC/e+wE+nAg3o8yLixzttByQCr4mId8WYmdxwS5Iap7eNk+FJhRmbeSf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3NGjN9HDAifHsC69eBLkIHInFXy7h5ST+n82EMyuT0=;
 b=UJzPIf83jqNXeDIqcW/khEJ0uFNle55cDwm0YXl0zoDWZYJiTkEXAqWmd6cfo0rZz097cthdjZizs8mpMgZYFQ9yL4rXUQZpRQyYgonisE39gkFGtUuAfDruNTWM7FmZl4iNQIoYuCYGs/1O/Jdo1m/KTKqS9iBZ+kOEwweDjr3n3S5/L4jtCYVdoOz7euWIEDx4pMi8LBGHAiGqzzwE45PtxoYkScmDFHpS6H4S2wbIjh2KmCxJjjuOrgvlgXML3+paLMI6rkNd55g6e2GO0tV80eRa2+WC+1VRa+ni5xy/jNY3ocLcDabhw2tsyoIR1TjQv7MwdBeN3zZfHiOgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3NGjN9HDAifHsC69eBLkIHInFXy7h5ST+n82EMyuT0=;
 b=5Nq5g9FoZ3hh04RQ4gTpE2+E91eKsiXO8MsGu+9zMDRE+XWebu/fuOXnfGoo2zc9KZYp9GJzS82voDzPTmgJ73pjWIbVnPTHGHAE8Z2uC4D6vEFX7zLPtalKoiSh+6xhD8um+fh913V/3uEvEOznM9I+sMTQWl5Iov/uzyBWARM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a368fb39-f8c5-4238-803a-08e83d2c43e9@amd.com>
Date: Tue, 7 Nov 2023 15:10:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] xen/arm: Map ITS doorbell register to IOMMU page
 tables.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-10-stewart.hildebrand@amd.com>
 <7123faae-562e-4e78-a5d2-18c5ccc1b7f6@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <7123faae-562e-4e78-a5d2-18c5ccc1b7f6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|MW4PR12MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c9b65e-6eb6-4342-38b3-08dbdfcdb4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1hqgiqKkie2XHqJb/a+NcIZIgaPI5nvxZ3TnQpUqYgbOMotJbXcyvqVjW06Jk2zxDwNhEqPjJnnC1Wq17/+N1cpSFRCHJAjq/vYGHdlpF4ZVrq5qJOrcL42OD4JRvnsemeiCFNnUSm+3wZUI8AgwN7K9DdGnD3maa8wJhto2bsD9fXyw4lHx2EU93K5DHxCi6+/vlh6YjxGyDfTUu/J6vPNPxXC+3h38mUBiSn0NmhPzPav2YZMg8viZJlTazsu8wFWYMjb/Uu/ezVsMPK0Iki7ps9QZcm/8/PMSH4L+IhPerWHwH+509X9qDm2u4G9FL2h+toH62ygoNvQYak95NyoOvtpErkB2qOYCFU7cL3//IRFhgWDTghALJ/AZJEgHSD8T9Zg++aCzkus6DYvyeiGj5zeO64hgVDnHAkJLp0qnCUtLZgQCWjzxntzWWDdKCUU3OlavuEvf6xd1wS6ZbtuqH5pt4znyKGMOXqgN3hWE7IkgM9Nsr1xCr7EFivuY8xtDu5yyuI6jq42RwhYXaE9eROTY/JUuIY8rcOvlIW0dmfbZ9vQyX2006Lscp1Q+QZaDI8YiqRtjBFvhE1YX0O8jIQvgb1dPAaMu1BTbYVBuAZ9H/oc2w/liouZysssgIe0ZC16HN045jdeMRtu/LIQkMK0frqjTEo59oBChG9eYNG5PdSUyTc4OwfFzcdWjQ6RTRHYo/Cyddbqhac4RL/lBiebpfTo7odpWqw2Sg4zRr5FOcif4s9Hn8k1xuAAVNn1C9/ONNgNR80meGuv/PWOHiYPNGgi41ZY0ZPuplPE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(336012)(2616005)(26005)(53546011)(426003)(36860700001)(83380400001)(5660300002)(41300700001)(4326008)(8936002)(8676002)(44832011)(478600001)(2906002)(966005)(47076005)(316002)(70206006)(70586007)(110136005)(54906003)(82740400003)(16576012)(86362001)(31696002)(36756003)(81166007)(356005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 20:11:19.4111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c9b65e-6eb6-4342-38b3-08dbdfcdb4a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7467

On 10/20/23 14:02, Julien Grall wrote:
> Hi Stewart,
> 
> On 04/10/2023 15:55, Stewart Hildebrand wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
> 
> This wants an explanation why this is needed.

I'll add an explanation

> 
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> Your signed-off-by is missing.

I'll add it

> 
>> ---
>> v4->v5:
>> * new patch
>> ---
>>   xen/arch/arm/vgic-v3-its.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>> index 05429030b539..df8f045198a3 100644
>> --- a/xen/arch/arm/vgic-v3-its.c
>> +++ b/xen/arch/arm/vgic-v3-its.c
>> @@ -682,6 +682,18 @@ static int its_handle_mapd(struct virt_its *its, uint64_t *cmdptr)
>>                                            BIT(size, UL), valid);
>>           if ( ret && valid )
>>               return ret;
>> +
>> +        if ( is_iommu_enabled(its->d) ) {
> 
> Coding style.

I'll fix

> 
>> +            ret = map_mmio_regions(its->d, gaddr_to_gfn(its->doorbell_address),
>> +                           PFN_UP(ITS_DOORBELL_OFFSET),
>> +                           maddr_to_mfn(its->doorbell_address));
> 
> 
> A couple of remarks. Firstly, we know the ITS doorbell at domain
> creation. So I think thish should be called from vgic_v3_its_init_virtual().
> 
> Regardless that, any code related to device initialization belongs to
> gicv3_its_map_guest_device().

How about calling it from a map_hwdom_extra_mappings() hook?
For example see [1].

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/6232a0d53377009bb7fbc3c3ab81d0153734be6b

> 
> Lastly, I know the IOMMU page-tables and CPU page-tables are currently
> shared. But strictly speaking, map_mmio_regions() is incorrect because
> the doorbell is only meant to be accessible by the device. So this
> should only be mapped in the IOMMU page-tables.
> 
> In fact I vaguely recall that on some platforms you may get a lockup if
> the CPU attempts to write to the doorbell. So we may want to unshare
> page-tables in the future.
> 
> For now, we want to use the correct interface (iommu_*) and write down
> the potential security impact (so we remember when exposing a virtual
> ITS to  guests).

OK, I will use iommu_map()

> 
>> +            if ( ret < 0 )
>> +            {
>> +                printk(XENLOG_ERR "GICv3: Map ITS translation register d%d failed.\n",
>> +                        its->d->domain_id);
> 
> XENLOG_ERR is not ratelimited and therefore should not be called from
> emulation path. If you want to print an error, then you should use
> XENLOG_G_ERR.
> 
> Also, for printing domain, the preferred is to using %pd with the domain
> as argument (here its->d.

I'll fix it

> 
> But as this is emulation and therefore the current vCPU belongs to
> its->d, you could directly use gprintk(XENLOG_ERR, "...").

Will do

> 
> Cheers,
> 
> -- 
> Julien Grall

