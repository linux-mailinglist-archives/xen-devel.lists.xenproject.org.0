Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CED830170
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668271.1040317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1Xj-00055i-Js; Wed, 17 Jan 2024 08:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668271.1040317; Wed, 17 Jan 2024 08:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1Xj-00053E-Fo; Wed, 17 Jan 2024 08:45:03 +0000
Received: by outflank-mailman (input) for mailman id 668271;
 Wed, 17 Jan 2024 08:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2QPC=I3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQ1Xh-000538-L1
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:45:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2b550e0-b514-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 09:44:59 +0100 (CET)
Received: from BL1PR13CA0308.namprd13.prod.outlook.com (2603:10b6:208:2c1::13)
 by DS7PR12MB6117.namprd12.prod.outlook.com (2603:10b6:8:9b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.26; Wed, 17 Jan 2024 08:44:56 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::5d) by BL1PR13CA0308.outlook.office365.com
 (2603:10b6:208:2c1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.17 via Frontend
 Transport; Wed, 17 Jan 2024 08:44:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 08:44:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 02:44:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 02:44:54 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 17 Jan 2024 02:44:53 -0600
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
X-Inumbo-ID: b2b550e0-b514-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsA+Rn2UZ5mFgRfQ87eLyyIJC8j6VL7rJ3lnOwThJH6gIfTzoK3dVZZSoZ+73GyrREzrzAf69S8GL5Zik8gZs3JbJtfAJ+Bx0R3ghPJT4cEEuBlYhJC6+PkLkKWsC5CYh/u+aUwmFkVwG7Zx6+Y/gMkMUI7QMAKVILM0cj2ifWuUqqFh7bScQ0rMIRQVdxG26OuTK+bTuBNJpCHIEL+P39Dgxt0vnu+IvA5LclFQW2Ym3GmOiaXmmhDGX8f9tabyH/rMUWzvf22cLeiVW0e/FXftzMXvKNCQ7J3lP0ABNKgmduOuZqeJfLC7N2tLfgKkvFNaahGwNu7uMycswyxUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUbtqdvo3GpJwXmE7D5yDqsLhv3XYv2VeIIcbIDtvHE=;
 b=XvR/KYYVEgEVHNth1WqXtromoVtDY2XIaQUydfrg0dj+pci14fcFce+aQLcBwhuFoXPVouoN5fEkH9lL+/QeS2qoYBJIp13JAxE+h/2OlYiaIStABSclp10EuHilFd83zrnbuRiNNTGkx3tZ+nU78uKtde1Bm3JxMGzEhzgwjVU++ht1M9Dz7MCjqX0w0ewSgJw6M2lTJAHeBW82q71bqtMgzU2PG3BaZ3O9NuZtXnOU0ru5mTYdpr9bHLnEHNgi0XlmF0ycAstKaLNbolRkSv2ZXnAe4jF6Wo+L7LkNMZaESWdcvxZ54prJ0mrLNb/HXd+XtugpZphOtINssjOFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUbtqdvo3GpJwXmE7D5yDqsLhv3XYv2VeIIcbIDtvHE=;
 b=S/Di6sRSxljcjtHbckKKR+dV16ReW0Fengcmn3PlXfHscNu+ZA/Wzis3shIa1IGYIVR6YScU9JFLpejccf1jn93rKEGvuN+ux7PJPcwtB+QUxiTbuHwnUR9joGny0L0N5E8GL/GlgpxXaMV3FIHNhIFWUEqjLVXZee92wIzmer8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c603bf7d-e38c-4ee9-87a6-cd3c75c59fad@amd.com>
Date: Wed, 17 Jan 2024 09:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 2/4] arm/smpboot: Move smp_up_cpu to a new
 section .data.idmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240116143709.86584-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS7PR12MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 782958d3-d923-40a8-326e-08dc17389429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y44yAPvY45IqhMHYU9bgVQHYlNb/RWXRHFusSwcQ0rBP0xbjwI6ZX4+MpW8eFB0LhjNLtptJ1Dr74YJCPaB1ouKNtNlWD5IcTpaeWsauEuvuq2CPgA9Fo+n6JII4SFaMv4MZgU3+yeHeHUttApsaLjKSACuHKNAjLY6leex3i/WUXIqv0fLvc2WFhkXlXQleVJz5cvW0upamNPM9N3h3LgeFVoOt+GN2ty5Ggg4HsjfuAk1ulWwtW6dg3vaEFvol85az8FTxuc/mQChoZJz/f49oF70Npbs/WnS5j2nEn8OcwHMHihIQ2WOtZq8zR9bUK4QUlw1orTm5Una9TZx+JZPfQ9Pg0pdHTJ0SqdmVgZKomsskBKKI0uX2DfDJE9LxoOOoxDNuDuNRpirjz5fJCbQ1dlLEYJ+HVZMfHj1LZ+ivrK1wAkvcdL14dEUzYNcwioJ3QFAvqi+IunXByqzYBstTQFNgHXkCd0foFkiJIH7hfKwZzBZbkXjQXNrnJaFvjDmk2Z8r11Rznl7n/aE3fjAH6fVo457LEq7e33wxv2mWdEKL4jbsj/S/X1TUYctbVTnHiR8p7HuYNIg6CzBhuR1HPy0P2Nn97IM/maL9/h3mR+q3YaLU2nz4p+zY6OIylzU3Gd5MxeXzEKSasxv1/6C2Goeb9boihpbdMenomwWu5YwJtK0vyNGXTrZNagsIhcPQa6+BBpeAkRb6fh1wsFtOslXfpwqmAk9MgJP7BtPrnzdBEIQ85eqoo4M1QIdwXg0kRm0BOETGNSQLiD0/LbotmwTkZVs0paulsihiP/OIjIojL0T/jdCxnsjTeVuo8ir9C/8h42MkofdX/GertA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(31686004)(40460700003)(40480700001)(83380400001)(47076005)(31696002)(86362001)(2616005)(36756003)(82740400003)(356005)(81166007)(36860700001)(8676002)(5660300002)(4326008)(70206006)(8936002)(336012)(426003)(26005)(53546011)(54906003)(44832011)(70586007)(316002)(110136005)(2906002)(41300700001)(478600001)(16576012)(142923001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 08:44:55.0790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782958d3-d923-40a8-326e-08dc17389429
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6117

Hi Julien,

On 16/01/2024 15:37, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> With the upcoming work to color Xen, the binary will not be anymore
> physically contiguous. This will be a problem during boot as the
> assembly code will need to work out where each piece of Xen reside.
> 
> An easy way to solve the issue is to have all code/data accessed
> by the secondary CPUs while the MMU is off within a single page.
> 
> Right now, smp_up_cpu is used by secondary CPUs to wait there turn for
s/there/their ?

> booting before the MMU is on. Yet it is currently in .data which is
> unlikely to be within the same page as the rest of the idmap.
> 
> Move smp_up_cpu to the recently create section .data.idmap. The idmap is
s/create/created

> currently part of the text section and therefore will be mapped read-onl
s/onl/only

> executable. This means that we need to temporarily remap
> smp_up_cpu in order to update it.
> 
> Introduce a new function set_smp_up_cpu() for this purpose so the code
> is not duplicated between when opening and closing the gate.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
>  xen/arch/arm/smpboot.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7110bc11fc05..8d508a1bb258 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -29,6 +29,10 @@
>  #include <asm/psci.h>
>  #include <asm/acpi.h>
> 
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
>  cpumask_t cpu_online_map;
>  cpumask_t cpu_present_map;
>  cpumask_t cpu_possible_map;
> @@ -56,7 +60,7 @@ struct init_info init_data =
>  };
> 
>  /* Shared state for coordinating CPU bringup */
> -unsigned long smp_up_cpu = MPIDR_INVALID;
> +unsigned long __section(".data.idmap") smp_up_cpu = MPIDR_INVALID;
>  /* Shared state for coordinating CPU teardown */
>  static bool cpu_is_dead;
> 
> @@ -429,6 +433,28 @@ void stop_cpu(void)
>          wfi();
>  }
> 
> +static void set_smp_up_cpu(unsigned long mpidr)
> +{
> +    /*
> +     * smp_up_cpu is part of the identity mapping which is read-only. So
> +     * We need to re-map the region so it can be updated.
> +     */
> +    void *ptr = map_domain_page(virt_to_mfn(&smp_up_cpu));
> +
> +    ptr += PAGE_OFFSET(&smp_up_cpu);
> +
> +    *(unsigned long *)ptr = mpidr;
> +
> +    /*
> +     * init_ttbr will be accessed with the MMU off, so ensure the update
smp_up_cpu instead of init_ttbr

> +     * is visible by cleaning the cache.
> +     */
> +    clean_dcache(ptr);
> +
> +    unmap_domain_page(ptr);
> +
> +}
> +
>  int __init cpu_up_send_sgi(int cpu)
>  {
>      /* We don't know the GIC ID of the CPU until it has woken up, so just
> @@ -460,8 +486,7 @@ int __cpu_up(unsigned int cpu)
>      init_data.cpuid = cpu;
> 
>      /* Open the gate for this CPU */
> -    smp_up_cpu = cpu_logical_map(cpu);
> -    clean_dcache(smp_up_cpu);
> +    set_smp_up_cpu(cpu_logical_map(cpu));
> 
>      rc = arch_cpu_up(cpu);
> 
> @@ -497,8 +522,9 @@ int __cpu_up(unsigned int cpu)
>       */
>      init_data.stack = NULL;
>      init_data.cpuid = ~0;
> -    smp_up_cpu = MPIDR_INVALID;
> -    clean_dcache(smp_up_cpu);
> +
> +    set_smp_up_cpu(MPIDR_INVALID);
> +
>      arch_cpu_up_finish();
> 
>      if ( !cpu_online(cpu) )
> --
> 2.40.1
> 

~Michal


