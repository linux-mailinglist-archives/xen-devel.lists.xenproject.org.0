Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77789CCE03A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 01:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190304.1510818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWNvN-00088c-Ib; Fri, 19 Dec 2025 00:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190304.1510818; Fri, 19 Dec 2025 00:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWNvN-00085r-Fk; Fri, 19 Dec 2025 00:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1190304;
 Fri, 19 Dec 2025 00:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vWNvL-00085l-DN
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 00:00:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35327ea-dc6d-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 01:00:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB9BF438D9;
 Fri, 19 Dec 2025 00:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89519C4CEFB;
 Fri, 19 Dec 2025 00:00:41 +0000 (UTC)
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
X-Inumbo-ID: c35327ea-dc6d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766102442;
	bh=nejwZ4CXBVS0SWLhjOCvOoKs91xMXUc4UNl5EIeFV0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QjctMkPXbbFSpbQzip03CbkY1Vz2UsBCwatTuyAf7X0cS8FZs0Pd4iuLbMbg8iBQU
	 6Zh/IWeofclbw1q78fU8s2kdRJrPOVRcgt2Z5FJwiYbKwYIPduKGk5ik5c8eNlaI0I
	 W2YkPk+NG5prEWRtF/4XFBR0Qg/7xP+LWgAvZ96kJnYdE0+v55sS/0zFCa7zWI8e0x
	 aNRLTG65u/0CPTh/8dzqm3bGdOU/qz1yXHPYe6gMUsh8KoxsgdGYcr3G3EZQHKu4CG
	 FMGjjnjAcuovM5Zp0TO2H+IiUzzQwGq5AqeK293vbqI81r6x3Nl143N7xcX1P6gfTG
	 kisBxKaMO8ZKA==
Date: Thu, 18 Dec 2025 16:00:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Yann Dirson <yann.dirson@vates.tech>, 
    Yann Sionneau <yann.sionneau@vates.tech>
Subject: Re: [PATCH v1] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
In-Reply-To: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2512181600320.21522@ubuntu-linux-20-04-desktop>
References: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-511701984-1766102442=:21522"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-511701984-1766102442=:21522
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 18 Dec 2025, Oleksii Kurochko wrote:
> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
> match the known values, which leads to:
>   GICv3: No valid GICC entries exist.
> as observed on the AmpereOne platform.
> 
> To fix this, import the logic from import from Linux commit 9eb1c92:
>   The BAD_MADT_GICC_ENTRY check is a little too strict because
>   it rejects MADT entries that don't match the currently known
>   lengths. We should remove this restriction to avoid problems
>   if the table length changes. Future code which might depend on
>   additional fields should be written to validate those fields
>   before using them, rather than trying to globally check
>   known MADT version lengths.
> 
>   Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>   Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>   [lorenzo.pieralisi@arm.com: added MADT macro comments]
>   Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>   Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>   Cc: Will Deacon <will.deacon@arm.com>
>   Cc: Catalin Marinas <catalin.marinas@arm.com>
>   Cc: Al Stone <ahs3@redhat.com>
>   Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>   Signed-off-by: Will Deacon <will.deacon@arm.com>
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I ran CI tests where it made sense for this patch, as I don’t see any CI job
> that builds Xen with CONFIG_ACPI=y:
>   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2222160666
> 
> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
> AmpereOne platform.
> ---
>  xen/arch/arm/gic-v2.c           |  3 ++-
>  xen/arch/arm/gic-v3.c           |  3 ++-
>  xen/arch/arm/gic.c              | 12 +++++++++++-
>  xen/arch/arm/include/asm/acpi.h | 21 +++++++++++++++------
>  4 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..aae6a7bf30 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
>      host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                               header);
>  
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>      /* Add Generic Interrupt */
>      for ( i = 0; i < d->max_vcpus; i++ )
>      {
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..75b89efad4 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
>  
>      host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                               header);
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>      for ( i = 0; i < d->max_vcpus; i++ )
>      {
>          gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..a0ccda14bf 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>  {
>      unsigned long madt_size;
>  
> +    struct acpi_subtable_header *header;
> +    struct acpi_madt_generic_interrupt *host_gicc;
> +
> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
> +    if ( !header )
> +        panic("Can't get GICC entry");
> +
> +    host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
> +                             header);
> +
>      madt_size = sizeof(struct acpi_table_madt)
> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
> +                + host_gicc->header.length * d->max_vcpus
>                  + sizeof(struct acpi_madt_generic_distributor)
>                  + gic_hw_ops->get_hwdom_extra_madt_size(d);
>  
> diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
> index 13756dd341..30bc446d1f 100644
> --- a/xen/arch/arm/include/asm/acpi.h
> +++ b/xen/arch/arm/include/asm/acpi.h
> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>   */
>  paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
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
>  #ifdef CONFIG_ACPI
>  extern bool acpi_disabled;
> -- 
> 2.52.0
> 
--8323329-511701984-1766102442=:21522--

