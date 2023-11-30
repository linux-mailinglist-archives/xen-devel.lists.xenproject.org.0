Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF17FE766
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644362.1005227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8X60-0000aP-UZ; Thu, 30 Nov 2023 02:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644362.1005227; Thu, 30 Nov 2023 02:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8X60-0000YT-RT; Thu, 30 Nov 2023 02:48:08 +0000
Received: by outflank-mailman (input) for mailman id 644362;
 Thu, 30 Nov 2023 02:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hl0=HL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8X5z-0000XB-DG
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:48:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e239fed7-8f2a-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 03:48:05 +0100 (CET)
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 02:48:00 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::99) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Thu, 30 Nov 2023 02:48:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 02:48:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 20:47:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 29 Nov
 2023 18:47:59 -0800
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 20:47:57 -0600
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
X-Inumbo-ID: e239fed7-8f2a-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffza6LNleUs+7QOu4KnoE4Sv5iew3C41EwWX9bHUWc0goEPRC90v4M/KHg9AD4lSjYnlgX3cMN2Iadnk5HHkKd5CyNTbk3VNcKsWaZVOJhoWA1pYotPVCCSFqyHrqASvTYT0517u/CqJPNZowuc1GRO2n3JGLW/90ogu5/zKAxyPlzEXBfKw7fFjGNIrvGy6sKnRyJ4nE7Yv8P2BBU9+GOrwRDOcYRygskfixcWielAH+rqD8NlHjk4L4kx/tg2gs+3bM5sxoMrzOIYdDY7CHFEfq/IWdQz3u96DIC3LcUPlp/sDv4+vyIalG8RfWFvrxlFa1teoSZ6uN1o8sPrEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPOxGdby4vw2bgFi3dCXqtxg3eEMOY1rd9+alhZLbi0=;
 b=enZ7zzS7aQ4ClRUwV4gjctzS6ay+tNzFbTJhqIfg5814ro6/RpYC1qsRZjqY8TH23/zU7Smzd82XKQIufphK1iLvYuDZt2XxHRNEWlMDjdEDYaAW7FmOE8QL/pQvFVtw+F0cEEmkLchJFuPYH1ueGSRAJKcN7trntQjAtAbihbD/DSZ+tSg/MiIruDk/BbqGWT4O/WYYa7Wx55NPIbDDfqJDPBmaqgR+YpPZNrVY2X95pOeFie+CCaJakY6KcnTAjspkbYoH/2D89VkVJTQcF6UQ/wfVm8G/BGbqCaj3h6k99iQ4CvR7OyI4JRuQ7xZ/OJBurZk+SBUWqdkOyZAk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPOxGdby4vw2bgFi3dCXqtxg3eEMOY1rd9+alhZLbi0=;
 b=YU+/eBkuVC8VG3tDinSqXKm63ve5dNYCPHU13SrdeQ8N6W1MYvPSg24aZtWJ6GnY1x7KkZ4nml8dMUVPyPApRbrcPbu2rPPswQ0GSKGblrAe4sYUDdr3WsV7G4gnaE318nWy3spRPQNvaBE4pwJjOZhqVSUn4mXD/hcv9pRDvlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a92b1717-965b-4767-8f11-4c3a4e03418d@amd.com>
Date: Wed, 29 Nov 2023 21:47:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ed24a4-185b-48c4-5eff-08dbf14ec438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rwygrkVcEsGu23IXLmsat2G5IioJdX6Kn1PoTKCyWGy43a4Gen0VdvEw+U8Cv7fsm81MHgxJW5qJEM6SRib8zRzBB1bZB48nSm5w75Ir7wCQiraWhWXOjA2X8Vu4BmX4WqxxRgYmCd2CoBZdBlCtNV3SlonFIKLrJB7sua4CcQODqJdd/miAyx4Ph9vy5j5NYp7Exf/5QwvloPTuFYae9n4McHCDa6u4bRRrQUISGf3GBbRQDWNvXy8M2HbFK2Yjq6aRCeCT7DswMVWLRxm9JgP9zg2TNfHjPhLYi5YtuLy9bQCMuLsRJVQpNcOFUSjNrQe5JBtVp4ehK+oboHAraD/hqf5bXDHvkA3iXLXW+t+0QarqC4tCx7GiAYGvbKI0cR34GF+z4EGH51/4jLYlc5839RgrY+xrQBs7uLy5dZ6h9SkPt7AhDc3Mx7SrU2/2vNxDjGLQ12x5l73delpgPF31vBzn2aMQlIY8n+Udz8vyBonSDp19yOrSStKYzXA8NMDypK2zS0K6pd1T9SsdmXLcivZphKXsU9/384BPnIzFd3kcg/p54jxsK5N/rVXx8BBYCUB5mkPlSyAPWQxiplJoPu3IWO5/MqcQi2md/C8zXOcs0bxuk/hL4i1E5CLD2StVH/Kn7U73R6uCZhXpMdsKvtZVUuJLiyjvPGX22ABN3aRgumkZesXd/V9mY37zOVmFQ0Nkac1Bqs/T+SPyWSN+omEkHu8gRasZ3No5mYZ9jjrZcBEmXTSyxOtu2ysQK2i5SjFnK8/uSHdeU/8/2Yls9iMbX4FDTijgqrcusRJb8ee7iNRT90OYHcZRWq3QbT3v+diQf0VyMgyrX63lsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(70206006)(70586007)(53546011)(54906003)(966005)(40460700003)(336012)(6916009)(426003)(16576012)(316002)(478600001)(81166007)(36860700001)(82740400003)(83380400001)(36756003)(202311291699003)(86362001)(2616005)(44832011)(7416002)(4326008)(8676002)(40480700001)(5660300002)(8936002)(41300700001)(356005)(47076005)(31696002)(31686004)(26005)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:48:00.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ed24a4-185b-48c4-5eff-08dbf14ec438
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531

On 11/14/23 04:13, Jan Beulich wrote:
> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -503,6 +503,8 @@ struct arch_domain
>>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>  
>> +#define arch_needs_vpci(d) ({ (void)(d); false; })
> 
> See my comments on the v5 thread on both this and ...

So, the goal here is to return true for a PVH dom0, and false otherwise (for now). Since dom0 can't feasibly be full HVM, and is_hvm_domain(d) returns true for PVH, how about the following?

/* TODO: re-visit when vPCI is enabled for PVH domUs. */
#define arch_needs_vpci(d) ({                       \
    const struct domain *_d = (d);                  \
    is_hardware_domain(_d) && is_hvm_domain(_d); })


Link to v5 thread for reference [1]
[1] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00968.html

> 
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1542,6 +1542,18 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>>      pcidevs_unlock();
>>  }
>>  
>> +static bool needs_vpci(const struct domain *d)
>> +{
>> +    if ( is_hardware_domain(d) )
>> +        return false;
> 
> ... this.

I'll move this check to the Arm arch_needs_vpci() in xen/arch/arm/include/asm/domain.h

> (It is generally a good idea to wait a little with sending new
> versions, when you can't be sure yet whether the earlier discussion has
> settled.)

(Sorry, I'll be better about this going forward.)

> 
> Jan

