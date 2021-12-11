Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A14714EA
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 18:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245400.423456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw69W-00033R-7x; Sat, 11 Dec 2021 17:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245400.423456; Sat, 11 Dec 2021 17:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw69W-000317-3b; Sat, 11 Dec 2021 17:27:18 +0000
Received: by outflank-mailman (input) for mailman id 245400;
 Sat, 11 Dec 2021 17:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=koyS=Q4=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1mw69T-000311-Q6
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 17:27:15 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 935291ae-5aa7-11ec-bf02-3911bdbc85ab;
 Sat, 11 Dec 2021 18:27:14 +0100 (CET)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1mKFtY2m7z-00hs5U for <xen-devel@lists.xenproject.org>; Sat, 11 Dec
 2021 18:27:11 +0100
Received: by mail-wr1-f41.google.com with SMTP id d9so20086646wrw.4
 for <xen-devel@lists.xenproject.org>; Sat, 11 Dec 2021 09:27:11 -0800 (PST)
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
X-Inumbo-ID: 935291ae-5aa7-11ec-bf02-3911bdbc85ab
X-Gm-Message-State: AOAM532hbBw60Gq0vqdGX8Z4CrdbK2Y7uLb7RN2n+B1DoBoBXtZB7an+
	Y+fW7OGvFGlryl0NrSi+3qzVee2Vw0UEH9tu1NA=
X-Google-Smtp-Source: ABdhPJydOCBHCBVhL5GrxiQp2LNkO7SO9fSpEb1ktgLdLbaiYOV8bo99cpA+GLEsnha3mdPvOSWLSKg/3Dqg7U73gXw=
X-Received: by 2002:a5d:6902:: with SMTP id t2mr20632629wru.317.1639236258246;
 Sat, 11 Dec 2021 07:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de> <20211210221815.269468319@linutronix.de>
In-Reply-To: <20211210221815.269468319@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:24:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2=LKoe1nw1sZZmxFwAh+54n-Q3cMO3goHEVMQKSVSh+g@mail.gmail.com>
Message-ID: <CAK8P3a2=LKoe1nw1sZZmxFwAh+54n-Q3cMO3goHEVMQKSVSh+g@mail.gmail.com>
Subject: Re: [patch V3 34/35] soc: ti: ti_sci_inta_msi: Get rid of ti_sci_inta_msi_get_virq()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Marc Zygnier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Cedric Le Goater <clg@kaod.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Sinan Kaya <okaya@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bI5LeAr6NWIRKApNWquEDUEEIUDTCSN/4avtPFtkXHDgx8OONo3
 E1GxdGy0Kf/3zxYIUNVCvGVD5oGierGmGFKt07aDv26t4t8i6O06CxKvX9YCwZ5C/J9Hq/L
 zsTDUFgAVk1SEkIrAYdfh0lvP6vhyRvuh9jMgKi8asgOH8qZ95sUGC1i6gi1j3s6KbdoGyS
 NpAVIUIj9yQqA76CzRVNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BD8eTisfwWI=:PP20DiFTcycvvl7AT6YuCn
 50kPMXCKwplltSCEe6DGSx3+WR+cuKhDGjNNKQUa/1zYAVshC8lWo/hG8hw4mBXEJof9kdH4s
 8uLPtsfMJF0eq2RfqsOaSwvMRyfaXfutXuBSGXKYZxFk4WyMIay3xyFn3lBcTQZnJx4nu6xgC
 9w/nxyYNYirvePw1I/e7wZJbY1teCDNhNzu7+8U0kWtTyecgP/wwSsPeC/2H2Ed11NKowzBoz
 LoNOzb2YBgFm6hRVKB6MIpdkflkDpcOeq8Y4f9Ju74r1oc/1YQsCrYM1kVbmppUNld3yNoFZK
 EXLpn6Pl8XqCubfwBSlaK2vOo0Av1rIn1FeCXiTfth4pP4ZzzEP1SuFLop8lcKsB4bfDQr9EM
 c1nzRueqx3Rka4aY69teQ9BBr5nW9CLUTryXptpPoJnnQ9+gdSgbzTcmg2c96D1mD0xJgaHmn
 Glb6bJC6it/ElVIqFood1M1u589TosBzIC1GhALMN55Gr0aDGeb+HsXgXe/Hf044YDEzYQiRh
 1wYLhZFGt72pjfzpR2K/JXZRKRtQKDkXZR91sb8q2XBQTIOhTt7cqUDx+HLWvVGYL/5ri4hiz
 wx9338wQo0w/SOiNsZxBVg+BpsfxWwxIffXDvXy5QhOUf27SHi8JGnbwOH7/CC7RDxhR/p52J
 vp8jUl+Xv58yZY0ed/UtNYBa7NXzok6KymNmFRVokocY+E8sAT3cjT/5BM3wdhYNaXuF1Qwbr
 gHZ7AndAMm+DT0r1MKBloL3qBN1c188ja+DFMnSTu17gSfxXP88JQAk9JLpxLJj+kfnJ0ZNaw
 C1lByh5JJbkNMdJVvcoZYKunDRiQh6UqgwiIEYOGRl6YuStopI=

On Fri, Dec 10, 2021 at 11:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
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

Acked-by: Arnd Bergmann <arnd@arndb.de>

