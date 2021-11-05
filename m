Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43D4465E4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 16:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222492.384717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Iq-0001Jc-DR; Fri, 05 Nov 2021 15:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222492.384717; Fri, 05 Nov 2021 15:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Iq-0001Hp-9l; Fri, 05 Nov 2021 15:38:52 +0000
Received: by outflank-mailman (input) for mailman id 222492;
 Fri, 05 Nov 2021 15:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OnCM=PY=freebsd.org=royger@srs-se1.protection.inumbo.net>)
 id 1mj1Ip-0001Hj-4h
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:38:51 +0000
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 780c6c80-3e4e-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 16:38:49 +0100 (CET)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id DD6D4851DA;
 Fri,  5 Nov 2021 15:38:47 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hm4RW5g4Fz4rcM;
 Fri,  5 Nov 2021 15:38:47 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [93.176.190.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 48F037B57;
 Fri,  5 Nov 2021 15:38:47 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
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
X-Inumbo-ID: 780c6c80-3e4e-11ec-9787-a32c541c8605
Date: Fri, 5 Nov 2021 16:38:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Message-ID: <YYVQAH7OYmFSVOei@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>

On Fri, Nov 05, 2021 at 01:32:18PM +0100, Jan Beulich wrote:
> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> affected: The call needs to occur after acpi_iommu_init(), such that
> iommu_intremap getting disabled there can be properly taken into account
> by apic_x2apic_probe().
> 
> Note that, for the time being (further cleanup patches following),
> reversing the order of the calls to generic_apic_probe() and
> acpi_boot_init() is not an option:
> - acpi_process_madt() calls clustered_apic_check() and hence relies on
>   genapic to have got filled before,
> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
>   occur after generic_apic_probe(),
> - acpi_parse_madt() (called from acpi_process_madt()) calls
>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Based on code inspection only - I have no affected system and hence no
> way to actually test the case.
> ---
> v2: Don't move generic_apic_probe() invocation, instead pull out
>     acpi_iommu_init() from acpi_boot_init().
> ---
> 4.16: While investigating the issue addressed by the referenced commit,
>       a variant of that problem was identified when firmware pre-enables
>       x2APIC mode. Whether that's something sane firmware would do when
>       at the same time IOMMU(s) is/are disabled is unclear, so this may
>       be a purely academical consideration. Working around the problem
>       also ought to be as simple as passing "iommu=no-intremap" on the
>       command line. Considering the fragility of the code (as further
>       demonstrated by v1 having been completely wrong), it may therefore
>       be advisable to defer this change until after branching.
>       Nevertheless it will then be a backporting candidate, so
>       considering to take it right away can't simply be put off.

The main issue here would be missing a dependency between
acpi_iommu_init and the rest of acpi_boot_init, apart from the
existing dependencies between acpi_iommu_init and generic_apic_probe.

> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -757,8 +757,6 @@ int __init acpi_boot_init(void)
>  
>  	acpi_mmcfg_init();
>  
> -	acpi_iommu_init();
> -
>  	erst_init();
>  
>  	acpi_hest_init();
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1699,6 +1699,13 @@ void __init noreturn __start_xen(unsigne
>  
>      dmi_scan_machine();
>  
> +    /*
> +     * IOMMU-related ACPI table parsing has to happen before APIC probing, for
> +     * check_x2apic_preenabled() to be able to observe respective findings, in
> +     * particular iommu_intremap having got turned off.
> +     */
> +    acpi_iommu_init();

If we pull this out I think we should add a check for acpi_disabled
and if set turn off iommu_intremap and iommu_enable?

Thanks, Roger.

