Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7DCD3E82
	for <lists+xen-devel@lfdr.de>; Sun, 21 Dec 2025 11:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191702.1511283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXGft-0008S8-4u; Sun, 21 Dec 2025 10:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191702.1511283; Sun, 21 Dec 2025 10:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXGft-0008Pt-2A; Sun, 21 Dec 2025 10:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1191702;
 Sun, 21 Dec 2025 10:28:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vXGfr-0008Pn-Fj
 for xen-devel@lists.xenproject.org; Sun, 21 Dec 2025 10:28:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXGfq-0031wr-2B;
 Sun, 21 Dec 2025 10:28:26 +0000
Received: from [2a02:8012:3a1:0:ec1c:da36:2cad:42dd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vXGfq-00GyxS-22;
 Sun, 21 Dec 2025 10:28:26 +0000
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
	bh=H3heEJpeJzz4SMp1AKGoNP12BUgl1aIZMqzXDYjh2cY=; b=kxZBr2JF6obH6UF6INGgPhKauC
	ohSh89ITfew4mxnAfz5xaxOtSM8ZUTk4tXSsJJYGVJzPxRIqCPv27Ojcb4+hH3elFTaHV3gpVP3Bc
	VwyQHK1de4JYN4Jw3YfyVDF5F+fPj+rdx0ee5gWn1oEM2ahMA5Oxc6OufPgLXaqrlejw=;
Message-ID: <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
Date: Sun, 21 Dec 2025 10:28:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>
References: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 18/12/2025 14:22, Oleksii Kurochko wrote:
> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
> match the known values, which leads to:
>    GICv3: No valid GICC entries exist.
> as observed on the AmpereOne platform.
> 
> To fix this, import the logic from import from Linux commit 9eb1c92:

Shouldn't this be s/from import//?

Also 7 characters commit ID is too short for Linux and known to clash. 
You want to use 12 characters (which is also the default for Xen). I 
usually have the following in my global .gitconfig:

         [core]
                 abbrev = 12

>    The BAD_MADT_GICC_ENTRY check is a little too strict because
>    it rejects MADT entries that don't match the currently known
>    lengths. We should remove this restriction to avoid problems
>    if the table length changes. Future code which might depend on
>    additional fields should be written to validate those fields
>    before using them, rather than trying to globally check
>    known MADT version lengths.
> 
>    Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>    Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>    [lorenzo.pieralisi@arm.com: added MADT macro comments]
>    Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>    Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>    Cc: Will Deacon <will.deacon@arm.com>
>    Cc: Catalin Marinas <catalin.marinas@arm.com>
>    Cc: Al Stone <ahs3@redhat.com>
>    Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>    Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
> instead of ACPI_MADT_GICC_LENGTH.
> 
> [1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
> 
> Reported-By: Yann Dirson <yann.dirson@vates.tech>
> Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> I ran CI tests where it made sense for this patch, as I don’t see any CI job
> that builds Xen with CONFIG_ACPI=y:
>    https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2222160666
> 
> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
> AmpereOne platform.
> ---
>   xen/arch/arm/gic-v2.c           |  3 ++-
>   xen/arch/arm/gic-v3.c           |  3 ++-
>   xen/arch/arm/gic.c              | 12 +++++++++++-
>   xen/arch/arm/include/asm/acpi.h | 21 +++++++++++++++------
>   4 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..aae6a7bf30 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                                header);
>   
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>       /* Add Generic Interrupt */
>       for ( i = 0; i < d->max_vcpus; i++ )
>       {
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..75b89efad4 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
>   
>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                                header);
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>       for ( i = 0; i < d->max_vcpus; i++ )
>       {
>           gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..a0ccda14bf 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>   {
>       unsigned long madt_size;
>   
> +    struct acpi_subtable_header *header;
> +    struct acpi_madt_generic_interrupt *host_gicc;

For both variables, you don't seem to modify the content. So I think 
they should be const.

> +
> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
> +    if ( !header )
> +        panic("Can't get GICC entry");

I would feel happier to use panic() in this function if 
gic_get_hwdom_madt_size() is __init (its only caller is during boot)).

An alternative is to stash the GICC size in a global variable.

> +
> +    host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
> +                             header);
> +
>       madt_size = sizeof(struct acpi_table_madt)
> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
> +                + host_gicc->header.length * d->max_vcpus
>                   + sizeof(struct acpi_madt_generic_distributor)
>                   + gic_hw_ops->get_hwdom_extra_madt_size(d);
>   
> diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
> index 13756dd341..30bc446d1f 100644
> --- a/xen/arch/arm/include/asm/acpi.h
> +++ b/xen/arch/arm/include/asm/acpi.h
> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>    */
>   paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>   
> -/* Macros for consistency checks of the GICC subtable of MADT */
> -#define ACPI_MADT_GICC_LENGTH	\
> -    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
> +/*
> + * MADT GICC minimum length refers to the MADT GICC structure table length as
> + * defined in the earliest ACPI version supported on arm64, ie ACPI 5.1.
> + *
> + * The efficiency_class member was added to the
> + * struct acpi_madt_generic_interrupt to represent the MADT GICC structure
> + * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose offset
> + * is therefore used to delimit the MADT GICC structure minimum length
> + * appropriately.
> + */
> +#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
> +    struct acpi_madt_generic_interrupt, efficiency_class)
>   
> -#define BAD_MADT_GICC_ENTRY(entry, end)						\
> -    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
> -     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
> +#define BAD_MADT_GICC_ENTRY(entry, end) \
> +    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH || \
> +    (unsigned long)(entry) + (entry)->header.length > (end))
>   
>   #ifdef CONFIG_ACPI
>   extern bool acpi_disabled;

Cheers,

-- 
Julien Grall


