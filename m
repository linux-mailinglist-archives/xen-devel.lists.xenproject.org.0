Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A710B447CEC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 10:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223150.385714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk152-0003fH-TL; Mon, 08 Nov 2021 09:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223150.385714; Mon, 08 Nov 2021 09:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk152-0003co-PG; Mon, 08 Nov 2021 09:36:44 +0000
Received: by outflank-mailman (input) for mailman id 223150;
 Mon, 08 Nov 2021 09:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hOHQ=P3=freebsd.org=royger@srs-se1.protection.inumbo.net>)
 id 1mk152-0003ci-0m
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 09:36:44 +0000
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60be7cc4-4077-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 10:36:41 +0100 (CET)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 8F3BF9BE06;
 Mon,  8 Nov 2021 09:36:40 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HnmGJ3JJXz3G96;
 Mon,  8 Nov 2021 09:36:40 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [93.176.190.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E94667F72;
 Mon,  8 Nov 2021 09:36:39 +0000 (UTC)
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
X-Inumbo-ID: 60be7cc4-4077-11ec-9787-a32c541c8605
Date: Mon, 8 Nov 2021 10:36:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Message-ID: <YYjvmy3BCnogsaBL@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
 <YYVQAH7OYmFSVOei@Air-de-Roger>
 <af235a71-2916-2498-b19b-4759a9e6fa95@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af235a71-2916-2498-b19b-4759a9e6fa95@suse.com>

On Mon, Nov 08, 2021 at 08:40:59AM +0100, Jan Beulich wrote:
> On 05.11.2021 16:38, Roger Pau Monné wrote:
> > On Fri, Nov 05, 2021 at 01:32:18PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1699,6 +1699,13 @@ void __init noreturn __start_xen(unsigne
> >>  
> >>      dmi_scan_machine();
> >>  
> >> +    /*
> >> +     * IOMMU-related ACPI table parsing has to happen before APIC probing, for
> >> +     * check_x2apic_preenabled() to be able to observe respective findings, in
> >> +     * particular iommu_intremap having got turned off.
> >> +     */
> >> +    acpi_iommu_init();
> > 
> > If we pull this out I think we should add a check for acpi_disabled
> > and if set turn off iommu_intremap and iommu_enable?
> 
> Hmm, I should have added a note regarding this. If we want to exactly
> retain prior behavior, acpi_ht would also need checking. Yet that has
> gone wrong long ago: We parse way too many tables when acpi_disabled
> && acpi_ht, and hence while correct wrt to prior behavior I'd consider
> it wrong to (re)add a "!acpi_ht" check.
> 
> As a result I'm of the opinion that checking acpi_disabled here also
> isn't necessarily appropriate, and instead IOMMU disabling would
> better be solely under the control of "iommu=".

I haven't looked very deeply, but will the acpi helpers work correctly
in that case? As acpi_boot_table_init will be short-circuited if
 `acpi_disabled && !acpi_ht`.

Thanks, Roger.

