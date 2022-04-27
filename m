Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7524511CCB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 20:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315375.533904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njmN8-00021N-42; Wed, 27 Apr 2022 18:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315375.533904; Wed, 27 Apr 2022 18:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njmN8-0001yI-0z; Wed, 27 Apr 2022 18:26:42 +0000
Received: by outflank-mailman (input) for mailman id 315375;
 Wed, 27 Apr 2022 18:26:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njmN6-0001yC-PR
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 18:26:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njmN6-00041q-8M; Wed, 27 Apr 2022 18:26:40 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njmN6-0004w6-25; Wed, 27 Apr 2022 18:26:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=BkWPeO/X0Bd8Q1E+X1y5lZAXpa/TmLegk57P3zKxrvM=; b=4OsOf9ybO3BsE1f4+N+flQ5nRx
	pCIKckvVG4KMU6YxTzX+Mc6qxSaE3OLmhXxO/LuEEYRCLPP3Nacy5Qb7vjyYT3wEiAirihpxCgSY6
	ext4rk1C0zHv0xazAMbnVktyq4xx6OLbVRj1YhN2BaRmMRUcjst3gJOW+REeOsccZSYw=;
Message-ID: <c3b83cd4-7633-7aee-ab40-9eff26a4f801@xen.org>
Date: Wed, 27 Apr 2022 19:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to dom0
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 27/04/2022 17:12, Rahul Singh wrote:
> Xen should control the SMMUv3 devices therefore, don't expose the
> SMMUv3 devices to dom0. Deny iomem access to SMMUv3 address space for
> dom0 and also make ACPI IORT SMMUv3 node type to 0xff.

Looking at the IORT spec (ARM DEN 0049E), 255 (0xff) is marked as 
reserved. So I don't think we can "allocate" 0xff to mean invalid 
without updating the spec. Did you engage with whoever own the spec?

> 
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

At some point we will need to add support to hide the ARM SMMU device 
and possibly some devices. So I think it would be better to create a 
function that would deal with the IORT.

> +
> +    if ( ACPI_SUCCESS(status) )
> +    {
> +        int i;

Please use unsigned int.

> +        struct acpi_iort_node *node, *end;

Coding style: Please add a newline.

> +        node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
> +        end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
> +
> +        for ( i = 0; i < iort->node_count; i++ )
> +        {
> +            if ( node >= end )

Wouldn't this only happen if the table is somehow corrupted? If so, I 
think we should print an error (or even panic).

> +                break;
> +
> +            switch ( node->type )
> +            {
> +                case ACPI_IORT_NODE_SMMU_V3:

Coding style: The keyword "case" should be aligned the the start of the 
keyword "switch".

> +                {
> +                    struct acpi_iort_smmu_v3 *smmu;

Coding style: Newline.

> +                    smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
> +                    mfn = paddr_to_pfn(smmu->base_address);
> +                    rc = iomem_deny_access(d, mfn, mfn + PFN_UP(SZ_128K));
> +                    if ( rc )
> +                        printk("iomem_deny_access failed for SMMUv3\n");
> +                    node->type = 0xff;

'node' points to the Xen copy of the ACPI table. We should really not 
touch this copy. Instead, we should modify the version that will be used 
by dom0.

Furthermore, if we go down the road to update node->type, we should 0 
the node to avoid leaking the information to dom0.

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

The IORT is not yet parsed by Xen and AFAIK is optional. So I don't 
think we should return an error.

> +
>       /* Deny MMIO access for GIC regions */
>       return gic_iomem_deny_access(d);
>   }

Cheers,

-- 
Julien Grall

