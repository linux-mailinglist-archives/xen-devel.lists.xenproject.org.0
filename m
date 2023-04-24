Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355976EC758
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525159.816176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqs1-0002MF-6A; Mon, 24 Apr 2023 07:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525159.816176; Mon, 24 Apr 2023 07:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqs1-0002Jj-2d; Mon, 24 Apr 2023 07:44:21 +0000
Received: by outflank-mailman (input) for mailman id 525159;
 Mon, 24 Apr 2023 07:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wwt=AP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pqqrz-0002Jb-LJ
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:44:19 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb06d29-e273-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 09:44:17 +0200 (CEST)
Received: from BN9P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::15)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:44:13 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::73) by BN9P220CA0010.outlook.office365.com
 (2603:10b6:408:13e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 07:44:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.18 via Frontend Transport; Mon, 24 Apr 2023 07:44:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 02:44:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 00:44:11 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 02:44:09 -0500
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
X-Inumbo-ID: cfb06d29-e273-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHPFNujeeqlLsaVHxsahf2KkpvQxHjnZIOOIO+/ALo5r4Bi7ISo3OjbqLBTFvQJT7W/5pUREqxv7RO1Au6RoMSwEsEpboDtxEvC1+XnZ3BPCHCygmTG36x3ggEMyWd+e4tikPQgB0VeTpbNy1Sz9ed+5yRZbWwn/daGnINNpSCDM1dvCf0LQqT/t725MiIq5UxS/uz+5bojQvEl9esiyP0ukhYvVZN+zbJSIJ1iE7v7OPF/AGsQ4LK8SzzEC8FD+4dmkZhHFjmt0V2oY9MsGU4menSFkuIHtVW1YcL2EI9Ua+fRNkZbII1JckAEPqi/UnY3xHcgLm05fPfrQHhgS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grNcrikzXvK4eARuWWUjkz9IC2bJ7kOp0Z+dkBHWOH8=;
 b=Bnz8JYaOcRfyOd8fg6saAQ20K9/auu1p4zuYmdqu6hkGCMtB612iwjFqrlEJslLWSCdVScnKYtp2XuzDyHGpeurV9CADH8F6t2ZoQCnEQvIMQdjSltJ4X9NuVLl7rQxZgdZ1MQ/CL1PWvsrQqAVX74CyhQRsGQyUObyWdmEUxcLE+Flv/upRM66tVFkJecgfGW6OPAV5ux4YBBHflC/P7XKgJT4K8Oz8ayLAjmAT0b+qbs6wo3ZRt0x4vcK8Z0n9hgA/P17CymzPCxcjiu0SBUGPGsZFj++O6Og7whmy+a/CS+/K7c0wuI7ljOKtiBY2vjSt4oVwNvsCEPCZ0GomeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grNcrikzXvK4eARuWWUjkz9IC2bJ7kOp0Z+dkBHWOH8=;
 b=jpAnzKCV10j/e/FXJQgqS1OyK6b1hJJjQtc1PcyV+Df5c5iAg+rY/rWNSBULNvbOvzeRD0yGZsr22c7Qz8apgIuB1HTYAqjFabNe6t+C3z7YeB7BxNRPAlcbS0z0PF5z8PkIQ3q00wiVwFWEUiRlCjw/kUN5b21v2OTECYLPb1E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3bd89851-e09d-1b24-6fde-5a13862f5eb2@amd.com>
Date: Mon, 24 Apr 2023 09:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 08/10] xen/arm: domain_build: Check if the address fits
 the range of physical address
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-9-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: b5449ea4-dbda-4cff-0846-08db4497b231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xkBXG0l3efRsm5viFoj+pXO9N+AnibWW0Za55+vRYDHCGAL6DiG6uW9BldXIREuWVT5LhbUmq+Y14W/I9Iar9bUM62a9rvEAatiRLDyfsVOu4Jd4SYIlNA0GH15ASTp7R3YAnKQf/CAd8NTkNlg8r0zLxz/Aj8JORA7bSzJcK7fGaA0yx2pLOuyAWnfLedIaUGD4kTuMNBb9pLxhE8ztr5rtUd8CX6sADbP3BZGjOBKZPq9mvuwKAgvei51JCD4wEJPo1D9MPfl4yatiDNNVsDL6TM+PhuF83DBYzGhphGnVuCFoLr84JOXIbEQ5P9miOYRi9h+6ypYH0eM2d/H7Y6KZpo/sGC4mAmP2YETHzf4rfFEBpb+c83qHc3q0120YrPPmtJOCsSv+QFu5thAQ/VD79QuVzOPytKU2Vx1aJkGbc3X996+LlGD2o0ERIk5cMfUgM+Dj8R9jWGU8Rjw9tZ0VWlOax/PZ4HqFrzxL2zyVCCpk1u1ni/2cXQo8Wkla7Tzqt1OTOHB+cjxXgd4oEssdfNUkcD6bg92jchxITrEFklzBpLkOiwnRuYa2vmav/9eiX9HiOPLRuMcv+cqu1YAVdbsGnCEqvUeYYwwPNlYkzVNEr0Zfy6J9cGr0tHv/dOPTbSmVgWolPUZbI4zVQp/Ays+jr5fFPgKvVjqz5zJDRR3bGJU9I4gMIHfYTJJS14j6ck1AVWb4e1lNiToIDdy9B0AwCrQ2ePL4xnNz+fF80xE3WCH+Jg3k28lLfuZFDnx/6SQsRCAg6Cb/ZCHYRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(53546011)(26005)(40480700001)(336012)(426003)(2616005)(36756003)(83380400001)(36860700001)(47076005)(186003)(40460700003)(356005)(82740400003)(81166007)(70206006)(70586007)(31696002)(478600001)(86362001)(31686004)(8936002)(8676002)(54906003)(7416002)(44832011)(110136005)(5660300002)(16576012)(41300700001)(2906002)(82310400005)(4326008)(6666004)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:44:12.2428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5449ea4-dbda-4cff-0846-08db4497b231
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
> parameters. Then frame numbers are obtained from addr and len by right shifting
> with PAGE_SHIFT. The page frame numbers are saved using unsigned long.
Maybe better to say "expressed" rather than "saved"

> 
> Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
> system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
> when the result is stored as 'unsigned long'.
> 
> To mitigate this issue, we check if the starting and end address can be
> contained within the range of physical address supported on the system. If not,
> then an appropriate error is returned.
> 
> Also, the end address is computed once and used when required. And replaced u64
> with uint64_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1...v4 - NA. New patch introduced in v5.
> 
>  xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7d28b75517..b98ee506a8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1637,15 +1637,23 @@ out:
>  }
> 
>  static int __init handle_pci_range(const struct dt_device_node *dev,
> -                                   u64 addr, u64 len, void *data)
> +                                   uint64_t addr, uint64_t len, void *data)
>  {
>      struct rangeset *mem_holes = data;
>      paddr_t start, end;
>      int res;
> +    uint64_t end_addr = addr + len - 1;
> +
> +    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
> +    {
> +        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for physical address\n",
I don't think it is wise to print variable names (end_addr) to the user. Better would be to say explicitly: start, end address.
Also to make the message shorter you could write: ... exceeds the maximum allowed PA width (%u bits)

> +               addr, end_addr, CONFIG_PADDR_BITS);
Why CONFIG_PADDR_BITS if you already introduced PADDR_BITS macro

> +        return -ERANGE;
> +    }
> 
>      start = addr & PAGE_MASK;
> -    end = PAGE_ALIGN(addr + len);
> -    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
> +    end = PAGE_ALIGN(end_addr);
> +    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
I doubt PFN_DOWN(end) is the same as PFN_DOWN(end - 1), so I think you should keep the behavior as it was

>      if ( res )
>      {
>          printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -2330,11 +2338,19 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>  }
> 
>  int __init map_range_to_domain(const struct dt_device_node *dev,
> -                               u64 addr, u64 len, void *data)
> +                               uint64_t addr, uint64_t len, void *data)
You changed u64 to uint64_t in a definition but not in a prototype. Please fix.

>  {
>      struct map_range_data *mr_data = data;
>      struct domain *d = mr_data->d;
>      int res;
> +    uint64_t end_addr = addr + len - 1;
> +
> +    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
> +    {
> +        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for physical address\n",
> +               addr, end_addr, CONFIG_PADDR_BITS);
please see the remarks above about this code

> +        return -ERANGE;
> +    }
> 
>      /*
>       * reserved-memory regions are RAM carved out for a special purpose.
> @@ -2345,13 +2361,13 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
>                       strlen("/reserved-memory/")) != 0 )
>      {
>          res = iomem_permit_access(d, paddr_to_pfn(addr),
> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> +                paddr_to_pfn(PAGE_ALIGN(end_addr)));
>          if ( res )
>          {
>              printk(XENLOG_ERR "Unable to permit to dom%d access to"
>                      " 0x%"PRIx64" - 0x%"PRIx64"\n",
>                      d->domain_id,
> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> +                    addr & PAGE_MASK, PAGE_ALIGN(end_addr) - 1);
>              return res;
>          }
>      }
> @@ -2368,7 +2384,7 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
>          {
>              printk(XENLOG_ERR "Unable to map 0x%"PRIx64
>                     " - 0x%"PRIx64" in domain %d\n",
> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> +                   addr & PAGE_MASK, PAGE_ALIGN(end_addr) - 1,
>                     d->domain_id);
>              return res;
>          }
> --
> 2.17.1
> 
> 

~Michal


