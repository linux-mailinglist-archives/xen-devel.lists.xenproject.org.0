Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D94473C55
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 06:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246248.424848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx05F-00028x-LH; Tue, 14 Dec 2021 05:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246248.424848; Tue, 14 Dec 2021 05:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx05F-00021k-H3; Tue, 14 Dec 2021 05:10:37 +0000
Received: by outflank-mailman (input) for mailman id 246248;
 Mon, 13 Dec 2021 17:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YnPn=Q6=ti.com=nm@srs-se1.protection.inumbo.net>)
 id 1mwpaq-0006i1-9C
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 17:58:32 +0000
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460959c7-5c3e-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 18:58:29 +0100 (CET)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BDHvg60044666;
 Mon, 13 Dec 2021 11:57:43 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BDHvgPV120889
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Dec 2021 11:57:42 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 13
 Dec 2021 11:57:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 13 Dec 2021 11:57:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BDHvg6L017557;
 Mon, 13 Dec 2021 11:57:42 -0600
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
X-Inumbo-ID: 460959c7-5c3e-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639418263;
	bh=pGs+7nCpdx7S5XWFe/UO8XALjMbjY1+VfXkPmDrylYE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TereNqQsHrOJN5x2htMCys19fN9lF6WIIbjFUj5DyrKhTGgPXKwfNA/gNxTT6+77z
	 JRw2kQu/xJl8fmFScS+cwwxZ07+XG8xXUbwh8Kk8HR+9ArnUZz+3a5U0jiM3or8k0i
	 mUKft05BDVfyOiq0ie7rKisbaUamlftbBRwigjBY=
Date: Mon, 13 Dec 2021 11:57:41 -0600
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
        Peter Ujfalusi
	<peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
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
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland
	<mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        <iommu@lists.linux-foundation.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 34/35] soc: ti: ti_sci_inta_msi: Get rid of
 ti_sci_inta_msi_get_virq()
Message-ID: <20211213175741.yxabloph4dr37dmt@abroad>
References: <20211210221642.869015045@linutronix.de>
 <20211210221815.269468319@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211210221815.269468319@linutronix.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 23:19-20211210, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Just use the core function msi_get_virq().
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

