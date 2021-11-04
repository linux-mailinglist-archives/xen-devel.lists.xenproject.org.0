Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878104455EA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221606.383409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieDV-0002wv-TA; Thu, 04 Nov 2021 14:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221606.383409; Thu, 04 Nov 2021 14:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieDV-0002uN-Q4; Thu, 04 Nov 2021 14:59:49 +0000
Received: by outflank-mailman (input) for mailman id 221606;
 Thu, 04 Nov 2021 14:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mieDU-0002qc-4H
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:59:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mieDT-0006Ck-WD
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:59:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mieDT-0000pp-Uh
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:59:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mieDE-00034f-LJ; Thu, 04 Nov 2021 14:59:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Pv4EWumR8CeTeU6BT5hmNiF9s2b+PTxdBMI7cab5+m8=; b=CIc1QNJn9aLPK28hRi/CakARNR
	MO2L94qws5an/RRWqzV6GxHlrVg6d0wxFxRszdckaiADk+O91ZPn/gG6M8X6RDwNXXnOEeAeTfNhs
	+fLPGyIGEt3ad/n2wvVQGC+1D4kTEo1s9UaNjCJrdhcKYxLrRzNj9d7ZCs9LEEWfoB7A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24963.62794.407130.517684@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 14:59:22 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI table
 parsing [and 1 more messages]
In-Reply-To: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>,
	<YYPsT7wp0aWZapHU@Air-de-Roger>
References: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
	<YYPsT7wp0aWZapHU@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
> While commit XXXXXXXXXXXX ("x86/IOMMU: mark IOMMU / intremap not in use
> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> affected: The call needs to occur after acpi_boot_init() (which is what
> calls acpi_iommu_init()), such that iommu_intremap getting disabled
> there can be properly taken into account by apic_x2apic_probe().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Based on code inspection only - I have no affected system and hence no
> way to actually test the case.

Do we have any tests for this ?  I see it's tagged for 4.16 (and I'm
favourably inclined) but I'm not sure I follow the implications.

Roger Pau Monné writes ("Re: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
> LGTM. I cannot find any dependency between acpi_boot_init and having
> initialized the apic.
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,
Ian.

