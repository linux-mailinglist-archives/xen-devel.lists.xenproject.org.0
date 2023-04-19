Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F012E6E7A7B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523448.813501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7iq-0007Oe-DD; Wed, 19 Apr 2023 13:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523448.813501; Wed, 19 Apr 2023 13:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7iq-0007M9-90; Wed, 19 Apr 2023 13:19:44 +0000
Received: by outflank-mailman (input) for mailman id 523448;
 Wed, 19 Apr 2023 13:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp7ip-0007M3-33
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:19:43 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5f3f86e-deb4-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 15:19:39 +0200 (CEST)
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 13:19:35 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::5f) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 13:19:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.30 via Frontend Transport; Wed, 19 Apr 2023 13:19:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 08:19:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 08:19:33 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 08:19:31 -0500
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
X-Inumbo-ID: d5f3f86e-deb4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaHyQs0nWGbgGyzizOjDs1QofaAdJIhy25ojJNCZ3Z7k8OHChUbNEhrpW8t5PsEE10vSaniKHVdR6K6VM2fS+ki4VPUMSCXd9wWRWBLr76kKapq8bwpUFVG1NG0d0AUtkgVIXMFBwQWIiNI/ZzJshxm+EibZ8oj1Xr5b+DJMojR8TB5pibQRpanliRGnU2YJ5cm3Z8HzI5dHUZ72uGVh94Rqpjzpc87ScdFj2BPKwjjJBb3GJtOBs8SUIMWind9G3bHTlJYBQ8VPsbvWsL3UhUs4St9X+3yhQTJoEQBLqPy51nuohwVWVUvO4f71KwLxAHXB4rOGP5KHJlQ6376vmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt6oCy42EVeybJ8eQSutycI+l984cEPoJ+XxXBYIffc=;
 b=GvFWisdvgTlkC/cP5c31w2cBP2h0xYZDPUdXiFcWg9gWZos+j6AolQyYeWLkW+lea7HoGUQEzIGEAYog8yoPUsdtZfkjTZdaM2SlR3G/bbg9wHuSu3sNpB8x6vqS0cU2O6zf/anVO5ldBkJLmyZLQtmwtW/p/tH7kvMuWIYf4Yrvw5XPdJcEO5b7wMs392+5MxQVoD2ANH+QauYNFgous/r57HLLo6onzxaL4NOhFS7UPHTB9GBywQHlT4nwEoSzkjxUxa21D7ehpipwEldtcGXLAOtYRcDjIa13XomWLIMvSf6bqGfppUvrVesozZ4E8ElZxxXujOB9ldggcye+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt6oCy42EVeybJ8eQSutycI+l984cEPoJ+XxXBYIffc=;
 b=bNmhvdGQURfWMciGxSRx3b02ruc+LX9DK54w7oJUd9Uebn4LAGr9s84Uq8zGoMyh8K/86pWlQ+7YYCDavb1OrxL5ufvxeNOAxZaM6d14Y7lkX38NPs74k3WlOP3meTpG9f195Hy3amXDdMy1whi2QMurG/120pu0im9u8utX/Cc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
Date: Wed, 19 Apr 2023 15:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b84ec55-088f-4b3e-0d21-08db40d8b847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmLen4DxFd7na6ZtbWEcni1IN25glXKqBulPYzJRWZoA+ozVsqXBDgcIweW0+6wyyTR3PDo7ObxdrQTLCiEg83+KbgS9JT9PI33SP3IL03/kI5X+5B31Ljyg9jUwaDNqK5ftDf9XYYyT5JOTL1GxBUYj8QXyx1XfdMF9vzfpPiUayEElBV/jjKUseohiLNiqICR4Vc0RW8d4GKYRYPAFGtCSvSPpjDA+ef5Qcao++nPoCkwklXRhxYwYXjq/Kf8ugDKtATttMeNTFIT3Ja44fG78sCYZRNss/hIesPvlzWNl2hP7MbgDfAecz+qVfhUM3KB+NPUcOTzBt+ZsCp1PG0wKqfXis4A9dLX1yj2v1mWG+5LkEiVJk7GTKRQ8GddpEKdUUaJrTWLEruqN7H37StaFmmPTxAUiB3tyRJZXoZS+KtijMXF0HjPYUeLkfC0E6nftEL9aRk8FKSV88Jrc2EyeFIuFaRFhrWKPsAGffWDpI3z+UDy0UzLoxhvN7Sm3P9fumxQtybVYsqdKfnyIjuPwke7ioWHoaH+fucNHxgYrO5X0P3y0EgK2MCMoafhWpOgJ/tZUHA0Qyk5KdYufnys6O9kx17dGxFaO5EwY7qNrSAukkaldDZqKb3OOzcHNQFoX+w3cZ+qkkCy2vSJKICDDLkaVLCGlRmKyQzDLu11iZQFtwWSK1BugU1ppdBt6f5bPEritARGTst6UOB3Hju1/P9KKaWtXc3byMBojnSL/YYNXnpHqk5Zw3Dzp2lpBmRsdUNiWsSPqnCwFR4M0rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(478600001)(31696002)(110136005)(86362001)(36860700001)(47076005)(36756003)(2616005)(426003)(336012)(83380400001)(40480700001)(186003)(53546011)(40460700003)(82740400003)(26005)(81166007)(82310400005)(316002)(356005)(70206006)(70586007)(30864003)(2906002)(44832011)(8676002)(5660300002)(8936002)(7416002)(31686004)(41300700001)(4326008)(54906003)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:19:35.0428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b84ec55-088f-4b3e-0d21-08db40d8b847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
> currently accept or return 64-bit values.
> 
> In future when we support 32-bit physical address, these DT functions are
> expected to accept/return 32-bit or 64-bit values (depending on the width of
> physical address). Also, we wish to detect if any truncation has occurred
> (i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).
> 
> device_tree_get_reg() should now be able to return paddr_t. This is invoked by
> various callers to get DT address and size.
> 
> For fdt_get_mem_rsv(), we have introduced a wrapper named
> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
> uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
> has been imported from external source.
> 
> For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
> dt_read_paddr() to read physical addresses. We chose not to modify the original
> function as it is used in places where it needs to specifically read 64-bit
> values from dt (For e.g. dt_property_read_u64()).
> 
> Xen prints warning when it detects truncation in cases where it is not able to
> return error.
> 
> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
> by the code changes.
> 
> Also, initialized variables to fix the warning "-Werror=maybe-uninitialized".
I can see that now you explicitly set to 0 variables passed to fdt_get_mem_rsv_paddr()
which haven't been initialized before being passed to fdt_get_mem_rsv(). Is this what
you are reffering to? I cannot reproduce it, hence my question.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from
> 
> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
> this approach achieves the same purpose.
> 
> 2. No need to check for truncation while converting values from u64 to paddr_t.
> 
> v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
> 2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
> 3. Logged error messages in case truncation is detected.
> 
> v3 - 1. Renamed libfdt_xen.h to libfdt-xen.h.
> 2. Replaced u32/u64 with uint32_t/uint64_t
> 3. Use "(paddr_t)val != val" to check for truncation.
> 4. Removed the alias "#define PADDR_SHIFT PADDR_BITS".
> 
> v4 - 1. Added a WARN() when truncation is detected.
> 2. Always check the return value of fdt_get_mem_rsv().
> 
>  xen/arch/arm/bootfdt.c              | 48 +++++++++++++++++++------
>  xen/arch/arm/domain_build.c         |  2 +-
>  xen/arch/arm/include/asm/setup.h    |  4 +--
>  xen/arch/arm/setup.c                | 18 +++++-----
>  xen/arch/arm/smpboot.c              |  2 +-
>  xen/include/xen/device_tree.h       | 23 ++++++++++++
>  xen/include/xen/libfdt/libfdt-xen.h | 55 +++++++++++++++++++++++++++++
>  7 files changed, 129 insertions(+), 23 deletions(-)
>  create mode 100644 xen/include/xen/libfdt/libfdt-xen.h
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..ac8148da55 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -11,7 +11,7 @@
>  #include <xen/efi.h>
>  #include <xen/device_tree.h>
>  #include <xen/lib.h>
> -#include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
>  #include <xen/sort.h>
>  #include <xsm/xsm.h>
>  #include <asm/setup.h>
> @@ -52,11 +52,37 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>      return false;
>  }
> 
> -void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                                u32 size_cells, u64 *start, u64 *size)
> +void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                                uint32_t size_cells, paddr_t *start,
> +                                paddr_t *size)
>  {
> -    *start = dt_next_cell(address_cells, cell);
> -    *size = dt_next_cell(size_cells, cell);
> +    uint64_t dt_start, dt_size;
> +
> +    /*
> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_start = dt_next_cell(address_cells, cell);
> +    dt_size = dt_next_cell(size_cells, cell);
> +
> +    if ( dt_start != (paddr_t)dt_start )
> +    {
> +        printk("Error: Physical address greater than max width supported\n");
I find it a bit odd to see Error and on the next line warning. I would drop "Error" here
but feel free not to as this is just my POV.

> +        WARN();
> +    }
> +
> +    if ( dt_size != (paddr_t)dt_size )
> +    {
> +        printk("Error: Physical size greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maximum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    *start = dt_start;
> +    *size = dt_size;
>  }
> 
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
> @@ -326,7 +352,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>          printk("linux,initrd-start property has invalid length %d\n", len);
>          return -EINVAL;
>      }
> -    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
> 
>      prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
>      if ( !prop )
> @@ -339,7 +365,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>          printk("linux,initrd-end property has invalid length %d\n", len);
>          return -EINVAL;
>      }
> -    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
> 
>      if ( start >= end )
>      {
> @@ -593,10 +619,12 @@ static void __init early_print_info(void)
>      nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
>      for ( i = 0; i < nr_rsvd; i++ )
>      {
> -        paddr_t s, e;
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
> +        paddr_t s = 0, e = 0;
> +
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
>              continue;
> -        /* fdt_get_mem_rsv returns length */
> +
> +        /* fdt_get_mem_rsv_paddr returns length */
>          e += s;
>          printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
>      }
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c8f08d8ee2..15c8bdd9e4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -949,7 +949,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          BUG_ON(!prop);
>          cells = (const __be32 *)prop->value;
>          device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_number(cells, size_cells);
> +        psize = dt_read_paddr(cells, size_cells);
>          if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
>          {
>              printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index a926f30a2b..7b697d879e 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -157,8 +157,8 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
>  extern uint32_t hyp_traps_vector[];
>  void init_traps(void);
> 
> -void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                         u32 size_cells, u64 *start, u64 *size);
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> 
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..d2a3d8c340 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -29,7 +29,7 @@
>  #include <xen/virtual_region.h>
>  #include <xen/vmap.h>
>  #include <xen/trace.h>
> -#include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
>  #include <xen/acpi.h>
>  #include <xen/warning.h>
>  #include <asm/alternative.h>
> @@ -220,13 +220,13 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> 
>      for ( i = first; i < nr ; i++ )
>      {
> -        paddr_t r_s, r_e;
> +        paddr_t r_s = 0, r_e = 0;
> 
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
>              /* If we can't read it, pretend it doesn't exist... */
>              continue;
> 
> -        r_e += r_s; /* fdt_get_mem_rsv returns length */
> +        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
> 
>          if ( s < r_e && r_s < e )
>          {
> @@ -500,15 +500,15 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
> 
>      for ( ; i < mi->nr_mods + nr; i++ )
>      {
> -        paddr_t mod_s, mod_e;
> +        paddr_t mod_s = 0, mod_e = 0;
> 
> -        if ( fdt_get_mem_rsv(device_tree_flattened,
> -                             i - mi->nr_mods,
> -                             &mod_s, &mod_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
> +                                   i - mi->nr_mods,
> +                                   &mod_s, &mod_e ) < 0 )
>              /* If we can't read it, pretend it doesn't exist... */
>              continue;
> 
> -        /* fdt_get_mem_rsv returns length */
> +        /* fdt_get_mem_rsv_paddr returns length */
>          mod_e += mod_s;
> 
>          if ( s < mod_e && mod_s < e )
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 412ae22869..c15c177487 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -159,7 +159,7 @@ static void __init dt_smp_init_cpus(void)
>              continue;
>          }
> 
> -        addr = dt_read_number(prop, dt_n_addr_cells(cpu));
> +        addr = dt_read_paddr(prop, dt_n_addr_cells(cpu));
> 
>          hwid = addr;
>          if ( hwid != addr )
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 19a74909ce..11bda2fd3d 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -241,6 +241,29 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
>      return r;
>  }
> 
> +/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
> +static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> +{
> +    uint64_t dt_r = 0;
no need for this assignment

> +    paddr_t r;
> +
> +    dt_r = dt_read_number(cell, size);
In device_tree_get_reg() you added a note about implicit cast and here it is missing.

> +
> +    if ( dt_r != (paddr_t)dt_r )
> +    {
> +        printk("Error: Physical address greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maximum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    r = dt_r;
> +
> +    return r;
> +}
> +
>  /* Helper to convert a number of cells to bytes */
>  static inline int dt_cells_to_size(int size)
>  {
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
> new file mode 100644
> index 0000000000..3296a368a6
> --- /dev/null
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -0,0 +1,55 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only
Our CODING_STYLE says:
New files should start with a single-line SPDX comment, ..., e.g.
/* SPDX-License-Identifier: GPL-2.0 */

For me it would be perfectly fine to do as you did but it is not what our docs state
(i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.

> + *
> + * xen/include/xen/libfdt/libfdt-xen.h
> + *
> + * Wrapper functions for device tree. This helps to convert dt values
> + * between uint64_t and paddr_t.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + */
> +
> +#ifndef LIBFDT_XEN_H
> +#define LIBFDT_XEN_H
> +
> +#include <xen/libfdt/libfdt.h>
> +
> +static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
> +                                        paddr_t *address,
> +                                        paddr_t *size)
> +{
> +    uint64_t dt_addr;
> +    uint64_t dt_size;
> +    int ret = 0;
no need for this assignment

> +
> +    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
> +    if ( ret )
> +        return ret;
> +
> +    if ( dt_addr != (paddr_t)dt_addr )
> +    {
> +        printk("Error: Physical address greater than max width supported\n");
> +        return -FDT_ERR_MAX;
> +    }
> +
> +    if ( dt_size != (paddr_t)dt_size )
> +    {
> +        printk("Error: Physical size greater than max width supported\n");
> +        return -FDT_ERR_MAX;
> +    }
> +
> +    *address = dt_addr;
> +    *size = dt_size;
> +
> +    return ret;
> +}
> +
> +#endif /* LIBFDT_XEN_H */
please add an empty line here.

> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.17.1
> 
> 

~Michal


