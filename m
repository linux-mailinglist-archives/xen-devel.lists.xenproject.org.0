Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D77FE7D9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644393.1005317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Y7t-0007uK-O7; Thu, 30 Nov 2023 03:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644393.1005317; Thu, 30 Nov 2023 03:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Y7t-0007s7-LG; Thu, 30 Nov 2023 03:54:09 +0000
Received: by outflank-mailman (input) for mailman id 644393;
 Thu, 30 Nov 2023 03:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8Y7s-0007s1-4i
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:54:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b53104f-8f34-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 04:54:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E12A7B84172;
 Thu, 30 Nov 2023 03:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F28FC433C7;
 Thu, 30 Nov 2023 03:54:01 +0000 (UTC)
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
X-Inumbo-ID: 1b53104f-8f34-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701316444;
	bh=eqrzzX60ARPCRs9X4WWPjycQ35QvNwJsAd1XNvK8saw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GvMRCkn1WFSi9WF+av2EeV08oEHGzraC7gBBdTXSLBjyvYt2SQtWcQzoDvBRXOkRX
	 EcSCe1XuhGeKNw4mFK+3a+PtBYv2DE/lAtRxKP1TkpIaR0X0N7QTUrE2PULcyzM50I
	 30COdUKB7E6Xn4rfhvlNEQAoW4iHWUIDf+cbbBI/k2//K5ezvdu9FT7hoNCizoS+zt
	 CGTQ1luYqgCdMC9ZgWNcrPSsi90Gj1pDFP57PXEEqEsp519moh1LCh1hvZhQK1bZqI
	 0RMWGKVE9Grgoadx/opXr8GHVBkj0wm2gqYZe8hlWC943iDrXBZ5gOLff9EyMhLU9m
	 D/KgNLvvSxAYw==
Date: Wed, 29 Nov 2023 19:53:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>, roger.pau@citrix.com
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-acpi@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Christian Koenig <Christian.Koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
In-Reply-To: <20231124103123.3263471-3-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com> <20231124103123.3263471-3-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Jiqian Chen wrote:
> This patch is to solve two problems we encountered when we try to
> passthrough a device to hvm domU base on Xen PVH dom0.
> 
> First, hvm guest will alloc a pirq and irq for a passthrough device
> by using gsi, before that, the gsi must first has a mapping in dom0,
> see Xen code pci_add_dm_done->xc_domain_irq_permission, it will call
> into Xen and check whether dom0 has the mapping. See
> XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH
> dom0 and it return irq is 0, and then return -EPERM.
> This is because the passthrough device doesn't do PHYSDEVOP_map_pirq
> when thay are enabled.
> 
> Second, in PVH dom0, the gsi of a passthrough device doesn't get
> registered, but gsi must be configured for it to be able to be
> mapped into a domU.
> 
> After searching codes, we can find map_pirq and register_gsi will be
> done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when
> the gsi(aka ioapic's pin) is unmasked in PVH dom0. So the problems
> can be conclude to that the gsi of a passthrough device doesn't be
> unmasked.
> 
> To solve the unmaske problem, this patch call the unmask_irq when we
> assign a device to be passthrough. So that the gsi can get registered
> and mapped in PVH dom0.


Roger, this seems to be more of a Xen issue than a Linux issue. Why do
we need the unmask check in Xen? Couldn't we just do:


diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 4e40d3609a..df262a4a18 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -287,7 +287,7 @@ static void vioapic_write_redirent(
             hvm_dpci_eoi(d, gsi);
     }
 
-    if ( is_hardware_domain(d) && unmasked )
+    if ( is_hardware_domain(d) )
     {
         /*
          * NB: don't call vioapic_hwdom_map_gsi while holding hvm.irq_lock

