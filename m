Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC2477F8F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 22:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248284.428212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxycP-0003Oj-Ut; Thu, 16 Dec 2021 21:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248284.428212; Thu, 16 Dec 2021 21:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxycP-0003Mz-Rp; Thu, 16 Dec 2021 21:48:53 +0000
Received: by outflank-mailman (input) for mailman id 248284;
 Thu, 16 Dec 2021 21:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxycO-0003Mt-RA
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 21:48:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4a32496-5eb9-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 22:48:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3ED30B8258A;
 Thu, 16 Dec 2021 21:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC109C36AE2;
 Thu, 16 Dec 2021 21:48:48 +0000 (UTC)
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
X-Inumbo-ID: f4a32496-5eb9-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639691329;
	bh=Yoyh1DV3KwFq9mM/Yd933A0PDob0YqJL+V1fH/zN4W4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QGLMaCaeYO9csKB+F4wKaCUv17ElO0WUnD7ufNxurpQg3wdwksGxnLHOBMTaStoUP
	 aciEhohoZIv1gLwmeKbcu9zSDI/+HL/OXGLjnOcRcbVFVYsYb4kssJwSvNHioFiJSe
	 kEf8Df9UY0DXkiCalENIg7k9hI0STxFx4e4Z2zCAcFPHcs245KIrqESm8AqxOiMmgP
	 gMGlrMWsTrKa19caVawzXryCz4YgsPc9LJoR+M7TaichoT1Cqj0wXvWfHA4wmkx3Ww
	 /AjRXZzy5saxsTXtFAP+Zk2cMwJEItJjY8KoC6OyJ+JTnkLnXCcZaJ9Mcu7eLtB6bA
	 DbMb8II/ysAHQ==
Date: Thu, 16 Dec 2021 13:48:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
In-Reply-To: <AA684EED-5631-4036-ABF1-596AD61787CC@arm.com>
Message-ID: <alpine.DEB.2.22.394.2112161347320.3376@ubuntu-linux-20-04-desktop>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2112151817190.3376@ubuntu-linux-20-04-desktop> <AA684EED-5631-4036-ABF1-596AD61787CC@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1158973397-1639691329=:3376"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1158973397-1639691329=:3376
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Dec 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 16 Dec 2021, at 2:33 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Tue, 14 Dec 2021, Rahul Singh wrote:
> >> IO ports on ARM don't exist so all IO ports related hypercalls are going
> >> to fail on ARM when we passthrough a PCI device.
> >> Failure of xc_domain_ioport_permission(..) would turn into a critical
> >> failure at domain creation. We need to avoid this outcome, instead we
> >> want to continue with domain creation as normal even if
> >> xc_domain_ioport_permission(..) fails. XEN_DOMCTL_ioport_permission
> >> is not implemented on ARM so it would return -ENOSYS.
> >> 
> >> To solve above issue remove PCI I/O ranges property value from dom0
> >> device tree node so that dom0 linux will not allocate I/O space for PCI
> >> devices if pci-passthrough is enabled.
> >> 
> >> Another valid reason to remove I/O ranges is that PCI I/O space are not
> >> mapped to dom0 when PCI passthrough is enabled, also there is no vpci
> >> trap handler register for IO bar.
> >> 
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> ---
> >> xen/arch/arm/domain_build.c   | 14 +++++++
> >> xen/common/device_tree.c      | 72 +++++++++++++++++++++++++++++++++++
> >> xen/include/xen/device_tree.h | 10 +++++
> >> 3 files changed, 96 insertions(+)
> >> 
> >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >> index d02bacbcd1..60f6b2c73b 100644
> >> --- a/xen/arch/arm/domain_build.c
> >> +++ b/xen/arch/arm/domain_build.c
> >> @@ -749,6 +749,11 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> >>                 continue;
> >>         }
> >> 
> >> +        if ( is_pci_passthrough_enabled() &&
> >> +                dt_device_type_is_equal(node, "pci") )
> >> +            if ( dt_property_name_is_equal(prop, "ranges") )
> >> +                continue;
> > 
> > It looks like we are skipping the "ranges" property entirely for the PCI
> > node, is that right? Wouldn't that also remove the other (not ioports)
> > address ranges?
> 
> We are skipping the “ranges” property here to avoid setting the “ranges” property when
> pci_passthrough is enabled. We will remove only remove IO port and set the other ‘ranges” property 
> value in dt_pci_remove_io_ranges() in next if() condition.
>  
> 
> >>         res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
> >> 
> >>         if ( res )
> >> @@ -769,6 +774,15 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> >>             if ( res )
> >>                 return res;
> >>         }
> >> +
> >> +        /*
> >> +         * PCI IO bar are not mapped to dom0 when PCI passthrough is enabled,
> >> +         * also there is no trap handler registered for IO bar therefor remove
> >> +         * the IO range property from the device tree node for dom0.
> >> +         */
> >> +        res = dt_pci_remove_io_ranges(kinfo->fdt, node);
> >> +        if ( res )
> >> +            return res;
> > 
> > I tried to apply this patch to staging to make it easier to review but I
> > think this chuck got applied wrongly: I can see
> > dt_pci_remove_io_ranges() added to the function "handle_prop_pfdt" which
> > is for guest partial DTBs and not for dom0.
> 
> Oleksandr’s patch series was merged yesterday because of that there is conflict in applying 
> this patch. I will rebase the patch and will send it again for review.
> 
> > 
> > Is dt_pci_remove_io_ranges() meant to be called from write_properties
> > instead? It looks like it would be best to call it from
> > write_properties, maybe it could be combined with the other new check
> > just above in this patch?
> 
> Yes dt_pci_remove_io_ranges() is to be called from write_properties().

OK. In that case the only feedback that is I have is that it might be
possible to avoid the first change of this patch to skip "ranges" by
moving the call to dt_pci_remove_io_ranges() earlier in the
write_properties function.
--8323329-1158973397-1639691329=:3376--

