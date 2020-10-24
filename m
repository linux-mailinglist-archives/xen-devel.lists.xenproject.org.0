Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2A297A0A
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 02:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11373.30149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7UB-0001JF-5s; Sat, 24 Oct 2020 00:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11373.30149; Sat, 24 Oct 2020 00:32:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7UB-0001Iq-21; Sat, 24 Oct 2020 00:32:43 +0000
Received: by outflank-mailman (input) for mailman id 11373;
 Sat, 24 Oct 2020 00:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW7U9-0001Il-CZ
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:32:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2ccc09d-1543-4118-8d7c-2366991adf9f;
 Sat, 24 Oct 2020 00:32:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58E3B207F7;
 Sat, 24 Oct 2020 00:32:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW7U9-0001Il-CZ
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:32:41 +0000
X-Inumbo-ID: e2ccc09d-1543-4118-8d7c-2366991adf9f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e2ccc09d-1543-4118-8d7c-2366991adf9f;
	Sat, 24 Oct 2020 00:32:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 58E3B207F7;
	Sat, 24 Oct 2020 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603499559;
	bh=MpfKU2gOrSuRSvwuser9eJzzlEebpWAo2bL9BylnXf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y7vXXYjDLyvj3+g3hHpLsBRHb0Ug8L9LZo/us/GNavRUQrma4CxYMYQDeGWP52Mjn
	 Fzt1D46S5PQvNwPySZ6EdcihZCXys7GXcwsfpWDzGJla9lTVbtI4HRrMvukttJGGJN
	 /w77LzitDtY7VDOEFPFHdAZSjNrUBQVcoAG81uXY=
Date: Fri, 23 Oct 2020 17:32:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2 5/7] xen/arm: acpi: add BAD_MADT_GICC_ENTRY() macro
In-Reply-To: <20201023154156.6593-6-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2010231719520.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-6-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2020, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Imported from Linux commit b6cfb277378ef831c0fa84bcff5049307294adc6:
> 
>     The BAD_MADT_ENTRY() macro is designed to work for all of the subtables
>     of the MADT.  In the ACPI 5.1 version of the spec, the struct for the
>     GICC subtable (struct acpi_madt_generic_interrupt) is 76 bytes long; in
>     ACPI 6.0, the struct is 80 bytes long.  But, there is only one definition
>     in ACPICA for this struct -- and that is the 6.0 version.  Hence, when
>     BAD_MADT_ENTRY() compares the struct size to the length in the GICC
>     subtable, it fails if 5.1 structs are in use, and there are systems in
>     the wild that have them.
> 
>     This patch adds the BAD_MADT_GICC_ENTRY() that checks the GICC subtable
>     only, accounting for the difference in specification versions that are
>     possible.  The BAD_MADT_ENTRY() will continue to work as is for all other
>     MADT subtables.
> 
>     This code is being added to an arm64 header file since that is currently
>     the only architecture using the GICC subtable of the MADT.  As a GIC is
>     specific to ARM, it is also unlikely the subtable will be used elsewhere.
> 
>     Fixes: aeb823bbacc2 ("ACPICA: ACPI 6.0: Add changes for FADT table.")
>     Signed-off-by: Al Stone <al.stone@linaro.org>
>     Acked-by: Will Deacon <will.deacon@arm.com>
>     Acked-by: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>     [catalin.marinas@arm.com: extra brackets around macro arguments]
>     Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v2:
>     - Patch added
> 
> We may want to consider to also import:
> 
> commit 9eb1c92b47c73249465d388eaa394fe436a3b489
> Author: Jeremy Linton <jeremy.linton@arm.com>
> Date:   Tue Nov 27 17:59:12 2018 +0000

Sure


>     arm64: acpi: Prepare for longer MADTs
> 
>     The BAD_MADT_GICC_ENTRY check is a little too strict because
>     it rejects MADT entries that don't match the currently known
>     lengths. We should remove this restriction to avoid problems
>     if the table length changes. Future code which might depend on
>     additional fields should be written to validate those fields
>     before using them, rather than trying to globally check
>     known MADT version lengths.
> 
>     Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>     Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>     [lorenzo.pieralisi@arm.com: added MADT macro comments]
>     Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>     Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>     Cc: Will Deacon <will.deacon@arm.com>
>     Cc: Catalin Marinas <catalin.marinas@arm.com>
>     Cc: Al Stone <ahs3@redhat.com>
>     Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>     Signed-off-by: Will Deacon <will.deacon@arm.com>
> ---
>  xen/include/asm-arm/acpi.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/xen/include/asm-arm/acpi.h b/xen/include/asm-arm/acpi.h
> index 50340281a917..b52ae2d6ef72 100644
> --- a/xen/include/asm-arm/acpi.h
> +++ b/xen/include/asm-arm/acpi.h
> @@ -54,6 +54,14 @@ void acpi_smp_init_cpus(void);
>   */
>  paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>  
> +/* Macros for consistency checks of the GICC subtable of MADT */
> +#define ACPI_MADT_GICC_LENGTH	\
> +    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
> +
> +#define BAD_MADT_GICC_ENTRY(entry, end)						\
> +    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
> +     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
> +
>  #ifdef CONFIG_ACPI
>  extern bool acpi_disabled;
>  /* Basic configuration for ACPI */
> -- 
> 2.17.1
> 

