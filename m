Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2C881053
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695858.1086078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtdn-0006nM-Qu; Wed, 20 Mar 2024 10:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695858.1086078; Wed, 20 Mar 2024 10:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtdn-0006l0-Nq; Wed, 20 Mar 2024 10:57:51 +0000
Received: by outflank-mailman (input) for mailman id 695858;
 Wed, 20 Mar 2024 10:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxfT=K2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmtdm-0006ku-Pl
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:57:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e88::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00912e2-e6a8-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 11:57:48 +0100 (CET)
Received: from BN9PR03CA0782.namprd03.prod.outlook.com (2603:10b6:408:13f::7)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Wed, 20 Mar
 2024 10:57:45 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::30) by BN9PR03CA0782.outlook.office365.com
 (2603:10b6:408:13f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Wed, 20 Mar 2024 10:57:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 10:57:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 05:57:45 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Mar 2024 05:57:43 -0500
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
X-Inumbo-ID: b00912e2-e6a8-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLm4BWRzboT0NS9wOsa8S2IepABmjDRzOHQOQNloiKzU+YT7eOmqW3eSPcbuSOE6vUeXkjdH2WeZU7MGop9ujpChmHM/IEm92Vkl1gyWOWTEVZQyrt4CmTfk2zsHbzGIlMGHywP6dCTksqkP77Rs1p5XEVgdtxMZVz8Kf7a/Zu2ZM0cF0vGn+FFy0pG4QSIW2CB9bGpbT/Uy8aSnmN4Vcccj35xGvl+ULtfolVK2LIm02GOtWvTbLyg5H3K0wxsSjCDNt2A5IIoYduDZkOtX+Jufu36+9fdztDvjhhLcNa1TcBvQYpDHSu9yOfbgPssbDBpf3TkUG5P2L4hSKAjDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvdgdCX0JO2OJJqgjVsQE9DtjhL4RhkkK4YxD6xn6yE=;
 b=Dxp+XqcXyyQxrEx/z4dhb4oYxxZ34aL/PLFYp/E9X76jjyIk4LCWk5bztudsmXfJzWCSUy6iD0KxH7uCs5XlKqZuRLFPAqA7h01w1PAyj9V3KWHrEoU9PCMTDwJMZoB3sACWLVob33docdN0DVFhFxEztwSClA0bZj9CMikL4DXzoZzpfSAgk1zHyROM4MsxDqiN/2B4VCiJOlBXkLboLyb12Ul3V6Zg4uAuyxgH3XvdO2MotIGsW590mzLHacT+/zQL+tYd/8pLsPIuIjyl91+RFLGgjkQmRlKp7ymcLPCWmIErAV6flo4uiScNbAFo6Ap1z+IWOBrWi72DeYIhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvdgdCX0JO2OJJqgjVsQE9DtjhL4RhkkK4YxD6xn6yE=;
 b=vct5GbqbyWl53rOKrfM6g5RQIY0hGk/AmTuaTT9VpijIJEmqWhSZ17cXtY6oOrv4DzxZXFXAZX4BPhfdxdkWFKdcN+dVbORh3fOO0iJ48ktga8HGDOYnv1lgPnNvvN8KLuy/na6MU5kZLnnUKdzgo1uzORomIcONifw617gZkUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3bd5d32c-d2e6-4e53-8b3e-aa7fdd058c71@amd.com>
Date: Wed, 20 Mar 2024 11:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] xen/arm: Avoid code duplication in
 find_unallocated_memory
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-7-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ce9c74-945c-4467-0633-08dc48cc92e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5E47cLq4cwmtJqcb/lsbqUNIqPLdgx78ONC0XyfquaQXptoN3K+b4uuULzVkI+TLJRd5iZqxsWXkAOQfAlU7Wkp9HKEBOB7WX/EnDOzg5HiOY6sUv+6mCtJXvdAlnWbOcWM3gn0B4ML6Db5qPj+YNXzBv92uZvmzE8Q2n1JWOdsRtmWkixafHPEeVDaA9DfCkwTxLfxKkDi4E9QZ/t/SDoarUdOrl61eKM7Vz/icG246U6k24/Jk8xoOS44z6EdgmL/uiQuw6zT5IfB7hUS/3yDRhmOQQ6LEV9RZStEYoeG3iU5KpE86jSOo1cUMJXs7L+8PPt9hXfgx60XOpKBVfMLMP8/juirbxdfxoPfY3EaIZyNE7luI+AAnZL/qjIRhaFNDZqmiFCGXtBpXdlnUicOj7eEfCyCuhBGHe004O2v/kKiCvuKf+XUzSYPFCt+NKg+IcNPBBPqOePADgy/qBu99LJ1g4DdgjnljAolWki5VJOXPTd4PQtmDuOENCZcAH3RHicqM2cWnBLpuzHuJQZaJ3a9GJATj968DgI1o44YIE72cguOrooOl1jPQLxlzETKFq7yYv7WYurJEKMfSM9tlRzrDQao9hDi8IAcKJurHoPWaVctiK13RGhZds9l5QrMlRFZheQYY2W1cs38f1bRX+aJTPOqqkvWEzDZ8Z71bRa2bv52QhV+zDJkLNspLxzdDPMh2T9C3KKTmAoZ5602HyT7STpbZmwnpTBukW8ybe3Gg/x6tDp4jKBP8PnXs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 10:57:45.4048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ce9c74-945c-4467-0633-08dc48cc92e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> The function find_unallocated_memory is using the same code to
> loop through 3 structure of the same type, in order to avoid
> code duplication, rework the code to have only one loop that
> goes through all the structures.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 62 ++++++++++---------------------------
>  1 file changed, 17 insertions(+), 45 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b254f252e7cb..d0f2ac6060eb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -869,12 +869,14 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>  static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>                                            struct membanks *ext_regions)
>  {
> -    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
> -    const struct membanks *mem = bootinfo_get_mem();
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_mem(),
> +        kernel_info_get_mem(kinfo),
> +        bootinfo_get_reserved_mem(),
> +    };
>      struct rangeset *unalloc_mem;
>      paddr_t start, end;
> -    unsigned int i;
> +    unsigned int i, j;
>      int res;
> 
>      dt_dprintk("Find unallocated memory for extended regions\n");
> @@ -883,50 +885,20 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>      if ( !unalloc_mem )
>          return -ENOMEM;
> 
> -    /* Start with all available RAM */
> -    for ( i = 0; i < mem->nr_banks; i++ )
> -    {
> -        start = mem->bank[i].start;
> -        end = mem->bank[i].start + mem->bank[i].size;
> -        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
> -                                 PFN_DOWN(end - 1));
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
> -                   start, end);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove RAM assigned to Dom0 */
> -    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
> -    {
> -        start = kinfo_mem->bank[i].start;
> -        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
> -                                    PFN_DOWN(end - 1));
> -        if ( res )
> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
It might be a matter of personal opinion, but I would actually prefer the current code
that looks simpler/neater (the steps are clear) to me. I'd like to know other maintainers opinion.

~Michal

