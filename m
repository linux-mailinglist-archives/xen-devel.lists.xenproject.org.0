Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C822C962
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 17:43:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyzqn-0002gz-OA; Fri, 24 Jul 2020 15:43:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyzql-0002gu-Ol
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 15:43:07 +0000
X-Inumbo-ID: 5e13f498-cdc4-11ea-a419-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e13f498-cdc4-11ea-a419-12813bfff9fa;
 Fri, 24 Jul 2020 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595605386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jBwu/lC1CRCBJQBBwKMwaiUjwXvhlSWzTbi+7dWIwo4=;
 b=XM6kJR2enGzp1pgMRCDOtNK40/l6HOnJeEFv4kI6sG51f6O9ayaUuVqw
 iepgvL/pbUQr7DR8hcqPeXHpPinptldZRSTMlotyFsN8ooOSEaOJCETes
 F0wUyWVVDUNAjPSjYyQl2ay60qViwGL2HFzFDohPfjWBv/nvaKddeMW1E A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zAX6CyxwJaoQzTG4kTZ0fXv6NecS5ad+meuXDFkXswObRqKFbuVydJ1jgPA/0WJp4rpDm/LqlU
 RilXjzxzcwDOiIBxR8RWoKbqNml0NjxFQlvNe1rW770sEvOxL6lgbGGxXiEvK5cWNc4Yyb1xKm
 kxeYh7O6QlHbHFLNU0nRp11clNYI57dtCQTfnhOryt0RiM3Lbs0+7kWPMdlHAOQlN4pjllB27K
 R5X4ABnz0bjoH60PvaCOwjiB7GuIkDlDleCN0szg36rhmgopboYeOHfcJNBr3ssE0sdTynoY1J
 aY8=
X-SBRS: 2.7
X-MesageID: 23466067
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23466067"
Date: Fri, 24 Jul 2020 17:42:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200724154258.GN7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
 <20200724152905.GM7191@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200724152905.GM7191@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 24, 2020 at 05:29:05PM +0200, Roger Pau Monné wrote:
> On Fri, Jul 24, 2020 at 04:15:47PM +0100, Julien Grall wrote:
> > 
> > 
> > On 24/07/2020 15:44, Roger Pau Monné wrote:
> > > > +
> > > > +    if ( acpi_disabled )
> > > > +        dt_pci_init();
> > > > +    else
> > > > +        acpi_pci_init();
> > > 
> > > Isn't there an enum or something that tells you whether the system
> > > description is coming from ACPI or from DT?
> > > 
> > > This if .. else seems fragile.
> > > 
> > 
> > This is the common way we do it on Arm.... I would welcome any improvement,
> > but I don't think this should be part of this work.
> 
> Ack. In any case I think for ACPI PCI init will get called by
> acpi_mmcfg_init as part of acpi_boot_init, so I'm not sure there's
> much point in having something about ACPI added here, as it seems this
> will be DT only?

Sorry I got confused and acpi_boot_init is a x86 specific function,
wrong context. If Arm is not using that path then maybe it makes sense
to init PCI here for ACPI also.

Roger.

