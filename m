Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B212473C56
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 06:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246246.424842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx05F-000223-Cn; Tue, 14 Dec 2021 05:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246246.424842; Tue, 14 Dec 2021 05:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx05F-0001yw-7C; Tue, 14 Dec 2021 05:10:37 +0000
Received: by outflank-mailman (input) for mailman id 246246;
 Mon, 13 Dec 2021 17:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YnPn=Q6=ti.com=nm@srs-se1.protection.inumbo.net>)
 id 1mwpaY-0006fT-4m
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 17:58:14 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b4fff4e-5c3e-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 18:58:12 +0100 (CET)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BDHvDFk057657;
 Mon, 13 Dec 2021 11:57:13 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BDHvDLj096173
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Dec 2021 11:57:13 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 13
 Dec 2021 11:57:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 13 Dec 2021 11:57:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BDHvD5s011601;
 Mon, 13 Dec 2021 11:57:13 -0600
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
X-Inumbo-ID: 3b4fff4e-5c3e-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639418233;
	bh=9CyMhPc/idrcBzNkExaZ5vJ4o9phUqUECb1RhDx4I4E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mHuWgUI/Z9Q9zRgSgPTxkHuzsmgOInjmgLI6oNat8MEl1rVUR+hb8QQszr+XW1ErC
	 PO7AazLDEhdfY/GfqbD/O+rGEywTCE9Fp/6RkHPntLuCvdywuxKrSkNUVfJNoH2r7T
	 EZkIsfSC6RNMlmKII/6L/Xm/5irlLAudxgFQsbTY=
Date: Mon, 13 Dec 2021 11:57:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
        Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
        Megha
 Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
        <linux-pci@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
        Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt
	<benh@kernel.crashing.org>,
        <linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas
	<bhelgaas@google.com>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor
	<laurentiu.tudor@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Will Deacon
	<will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel
	<joro@8bytes.org>,
        <iommu@lists.linux-foundation.org>,
        Jassi Brar
	<jassisinghbrar@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sinan
 Kaya <okaya@kernel.org>
Subject: Re: [patch V3 22/35] soc: ti: ti_sci_inta_msi: Use
 msi_desc::msi_index
Message-ID: <20211213175712.t5xghmso6q4vpg7n@rifling>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.540704224@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211210221814.540704224@linutronix.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 23:19-20211210, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Use the common msi_index member and get rid of the pointless wrapper struct.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Nishanth Menon <nm@ti.com>
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

