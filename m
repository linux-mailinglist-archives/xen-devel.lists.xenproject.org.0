Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABF68080D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486656.754070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQ1p-00014n-0o; Mon, 30 Jan 2023 09:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486656.754070; Mon, 30 Jan 2023 09:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQ1o-00013I-Sw; Mon, 30 Jan 2023 09:00:40 +0000
Received: by outflank-mailman (input) for mailman id 486656;
 Mon, 30 Jan 2023 09:00:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMQ1n-00013B-22
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:00:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQ1m-0003bM-My; Mon, 30 Jan 2023 09:00:38 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQ1m-0007nd-Cp; Mon, 30 Jan 2023 09:00:38 +0000
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
	bh=T0FBWSleNRLT70NcxT7Oz+5E/9oRoUOjdRftzzagm48=; b=rZk/I2a+6qAJvpjuWRtwRzA2ob
	yko7NHt2plbtDEZBj/XbiJYwbXVAXsnmbveWq6W5ueNPwhTPMgql271EYTEsKO6p96dmJYXA1dbyY
	tqUqZugsudJXFWxOTwARqhmne3onRrCWAuRs/FqdZF9OgzdbFtz2bGBWS5PA8oSsCqLE=;
Message-ID: <dc631f7a-67f3-64eb-fbaf-a39bbcd616b3@xen.org>
Date: Mon, 30 Jan 2023 09:00:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-4-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230127195508.2786-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/01/2023 19:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
> 
> On some platform, the identity mapping may have to start at 0. If we always
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
> 
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
> 
> Two new external helpers are introduced:
>      - arch_setup_page_tables() will setup the page-tables so it is
>        easy to create the mapping afterwards.
>      - update_identity_mapping() will create/remove the identity mapping
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>      Changes in v5:
>          - The reserved area for the identity mapping is 2TB (so 4 slots)
>            rather than 512GB.
> 
>      Changes in v4:
>          - Fix typo in a comment
>          - Clarify which page-tables are updated
> 
>      Changes in v2:
>          - Remove the arm32 part
>          - Use a different logic for the boot page tables and runtime
>            one because Xen may be running in a different place.
> ---
>   xen/arch/arm/arm64/Makefile         |   1 +
>   xen/arch/arm/arm64/mm.c             | 130 ++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm32/mm.h |   4 +
>   xen/arch/arm/include/asm/arm64/mm.h |  13 +++
>   xen/arch/arm/include/asm/config.h   |   2 +
>   xen/arch/arm/include/asm/setup.h    |  11 +++
>   xen/arch/arm/mm.c                   |   6 +-
>   7 files changed, 165 insertions(+), 2 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/mm.c
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6d507da0d44d..28481393e98f 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -10,6 +10,7 @@ obj-y += entry.o
>   obj-y += head.o
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> +obj-y += mm.o
>   obj-y += smc.o
>   obj-y += smpboot.o
>   obj-y += traps.o
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> new file mode 100644
> index 000000000000..f8e0887d25bc
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +
> +#include <asm/setup.h>
> +
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
> +static DEFINE_PAGE_TABLE(xen_first_id);
> +static DEFINE_PAGE_TABLE(xen_second_id);
> +static DEFINE_PAGE_TABLE(xen_third_id);
> +
> +/*
> + * The identity mapping may start at physical address 0. So we don't want
> + * to keep it mapped longer than necessary.
> + *
> + * When this is called, we are still using the boot_pgtable.
> + *
> + * We need to prepare the identity mapping for both the boot page tables
> + * and runtime page tables.
> + *
> + * The logic to create the entry is slightly different because Xen may
> + * be running at a different location at runtime.
> + */
> +static void __init prepare_boot_identity_mapping(void)
> +{
> +    paddr_t id_addr = virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    /*
> +     * We will be re-using the boot ID tables. They may not have been
> +     * zeroed but they should be unlinked. So it is fine to use
> +     * clear_page().
> +     */
> +    clear_page(boot_first_id);
> +    clear_page(boot_second_id);
> +    clear_page(boot_third_id);
> +
> +    if ( id_offsets[0] != 0 )
> +        panic("Cannot handled ID mapping above 512GB\n");

Hmmm... I forgot to update the two lines above and ...

> +
> +    /* Link first ID table */
> +    pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +
> +    write_pte(&boot_pgtable[id_offsets[0]], pte);
> +
> +    /* Link second ID table */
> +    pte = mfn_to_xen_entry(virt_to_mfn(boot_second_id), MT_NORMAL);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +
> +    write_pte(&boot_first_id[id_offsets[1]], pte);
> +
> +    /* Link third ID table */
> +    pte = mfn_to_xen_entry(virt_to_mfn(boot_third_id), MT_NORMAL);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +
> +    write_pte(&boot_second_id[id_offsets[2]], pte);
> +
> +    /* The mapping in the third table will be created at a later stage */
> +}
> +
> +static void __init prepare_runtime_identity_mapping(void)
> +{
> +    paddr_t id_addr = virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
> +        panic("Cannot handled ID mapping above 512GB\n");

... the error message here. I will send a new version of this patch.

Cheers,

-- 
Julien Grall

