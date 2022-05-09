Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1751FE82
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324568.546680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3d7-0006Mi-H9; Mon, 09 May 2022 13:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324568.546680; Mon, 09 May 2022 13:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3d7-0006KC-E0; Mon, 09 May 2022 13:40:53 +0000
Received: by outflank-mailman (input) for mailman id 324568;
 Mon, 09 May 2022 13:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sx+6=VR=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1no3d5-0006K6-Cx
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:40:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9bed3273-cf9d-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 15:40:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 601B01480;
 Mon,  9 May 2022 06:40:48 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F32E63F73D;
 Mon,  9 May 2022 06:40:46 -0700 (PDT)
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
X-Inumbo-ID: 9bed3273-cf9d-11ec-8fc4-03012f2f19d4
Message-ID: <234a41ef-3e39-d0ad-5e1c-575f575bb8f0@arm.com>
Date: Mon, 9 May 2022 14:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to dom0
Content-Language: en-GB
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-04-27 17:12, Rahul Singh wrote:
> Xen should control the SMMUv3 devices therefore, don't expose the
> SMMUv3 devices to dom0. Deny iomem access to SMMUv3 address space for
> dom0 and also make ACPI IORT SMMUv3 node type to 0xff.

...making the resulting IORT technically useless to consumers. ID 
mappings for all the Root Complex, Named Component and RMR nodes which 
were supposed to be translated through that SMMU node are now invalid, 
because ID mappings can only target an SMMU or ITS node. I can't guess 
at how other consumers may react, but Linux's IORT code is going to 
experience undefined behaviour when tries to translate any MSI DeviceID 
mappings through this invalid node, since it uses a bitmap of (1 << 
node->type) internally; beyond that we're not as strict as we could be 
and make some pretty loose assumptions about what we're parsing, so it 
might even appear to work, but that could easily change at any time in 
future and is absolutely not something Xen or any other software should 
try to rely on.

Thanks,
Robin.

> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/acpi/domain_build.c | 40 ++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index bbdc90f92c..ec0b5b261f 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -14,6 +14,7 @@
>   #include <xen/acpi.h>
>   #include <xen/event.h>
>   #include <xen/iocap.h>
> +#include <xen/sizes.h>
>   #include <xen/device_tree.h>
>   #include <xen/libfdt/libfdt.h>
>   #include <acpi/actables.h>
> @@ -30,6 +31,7 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>   {
>       acpi_status status;
>       struct acpi_table_spcr *spcr = NULL;
> +    struct acpi_table_iort *iort;
>       unsigned long mfn;
>       int rc;
>   
> @@ -55,6 +57,44 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>           printk("Failed to get SPCR table, Xen console may be unavailable\n");
>       }
>   
> +    status = acpi_get_table(ACPI_SIG_IORT, 0,
> +                            (struct acpi_table_header **)&iort);
> +
> +    if ( ACPI_SUCCESS(status) )
> +    {
> +        int i;
> +        struct acpi_iort_node *node, *end;
> +        node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
> +        end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
> +
> +        for ( i = 0; i < iort->node_count; i++ )
> +        {
> +            if ( node >= end )
> +                break;
> +
> +            switch ( node->type )
> +            {
> +                case ACPI_IORT_NODE_SMMU_V3:
> +                {
> +                    struct acpi_iort_smmu_v3 *smmu;
> +                    smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
> +                    mfn = paddr_to_pfn(smmu->base_address);
> +                    rc = iomem_deny_access(d, mfn, mfn + PFN_UP(SZ_128K));
> +                    if ( rc )
> +                        printk("iomem_deny_access failed for SMMUv3\n");
> +                    node->type = 0xff;
> +                    break;
> +                }
> +            }
> +            node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
> +        }
> +    }
> +    else
> +    {
> +        printk("Failed to get IORT table\n");
> +        return -EINVAL;
> +    }
> +
>       /* Deny MMIO access for GIC regions */
>       return gic_iomem_deny_access(d);
>   }

