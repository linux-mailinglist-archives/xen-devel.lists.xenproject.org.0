Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B05471524
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 18:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245417.423481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw6cP-0007TR-RP; Sat, 11 Dec 2021 17:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245417.423481; Sat, 11 Dec 2021 17:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw6cP-0007Qv-OP; Sat, 11 Dec 2021 17:57:09 +0000
Received: by outflank-mailman (input) for mailman id 245417;
 Sat, 11 Dec 2021 17:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=koyS=Q4=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1mw6cO-0007Qp-Gw
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 17:57:08 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c13d36fa-5aab-11ec-bf02-3911bdbc85ab;
 Sat, 11 Dec 2021 18:57:07 +0100 (CET)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MD9Gh-1mnY1r2A8P-0098CQ for <xen-devel@lists.xenproject.org>; Sat, 11 Dec
 2021 18:57:06 +0100
Received: by mail-wm1-f44.google.com with SMTP id 137so9084321wma.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Dec 2021 09:57:06 -0800 (PST)
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
X-Inumbo-ID: c13d36fa-5aab-11ec-bf02-3911bdbc85ab
X-Gm-Message-State: AOAM5329O5eKDI1lZZVzT42mTBuzIhh1IBtSsY90nYIjcSo36t9Ohw8I
	eYavIq0J/5eFiyRYyuYue/cQO7chtBB7H3ZDvwI=
X-Google-Smtp-Source: ABdhPJz9JqWJLeTUfS5IahRcetLl+JbMiIvXpgsv1eGAXoUb1XDPjjtJEfoNcEXB+cjjosPGuUvpUWQic5X/F+X6I8s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr24672882wmb.1.1639236184421;
 Sat, 11 Dec 2021 07:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de> <20211210221813.928842960@linutronix.de>
In-Reply-To: <20211210221813.928842960@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:22:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00M1MGPEwMQpgGJ9-g9-P6e9wo8G1frfVMqJ4bRp1Okg@mail.gmail.com>
Message-ID: <CAK8P3a00M1MGPEwMQpgGJ9-g9-P6e9wo8G1frfVMqJ4bRp1Okg@mail.gmail.com>
Subject: Re: [patch V3 12/35] soc: ti: ti_sci_inta_msi: Allocate MSI device
 data on first use
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Marc Zygnier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Cedric Le Goater <clg@kaod.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishanth Menon <nm@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZVbHhN8Os/J46LP4oq57eP7yrPDdhaOA7qwEEi7F/tylCI7rxe5
 EnrK83Pq/2e+GfflNwl/VOCRLw7mOMYww9oe06hVExSTLYH2jsNl4T5sUdNZsh81EnacClx
 poYTlx7t0lj23OT6zknjsV1nBG/0RQfis7S8e4R0KYeM2UzkLz6T5GKijrft7UYDpY13BqG
 2ThEjopVjTwq1rDps9ZJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wpe/1opoQi0=:jZ3Np3vGor0F52HpFaYOAV
 QJGJf3gjoYQ11Dnfk6PmIr04Xjm5+M3/YiJF1MJMLycueKVP0Z0ktrOHZaLVatmN/FMUyasYO
 0o+8F7H35NDTp5R3XZNYPLQ+5HNnAiydS+vs+2Xj0mudtoZ1xeZGuuZYJXc6btyCmXXWBy600
 JaethuIz4bbD3uS3mftahzSh0n8XENT2g792W5cxM2PKe8qvPtQsk/fs1sk6c+yVKxG3JphEw
 hIw20XDXPl8y1OLqJlTqMo/S6S03nBxSF2s9BidTDtHFvcxDiXtPGvpAEtMOvBJrktQhxkdW7
 yNptEh3xgef1oflbx7owlOvSK68bsWL4RuKh+Vlj/E3/IMwARjlKJ0Liev3LHzplgs8cHCjOD
 Eas5LaYlvX256nCAEUPOLPqfXvZRvaIykHShbXYsBFnt+0n+nPp+FRV8zU8FP+rdztClm7b4O
 8DvZcBXrIsiYL2Lu/6v2tL/hwPUFvhFgbB3YeMEX9l2r8icJas0NXK+wxbvXjJ9mrzxHjZ/jN
 /Vzd6FJji1BBBkM2VKk1ulaFoM3P2SLy2F66INRBnWrfOgO/znQfD7kFv/+j7A3bLE+vop3wb
 /ovJOJBopE15UhsxY0U9QVVQhWUlQ5+NtJm3xqTqoeGsmfobyiSxNtJ26lVhTYFZaxUhmuxQ8
 IVSUJhy5KoVHea5R+0oB+jeTAVZLBaifljNN1LdybI8x+qWg9El9QHvVJmQo3EatMt2MjsqpY
 /cmag10O3wQeRtkBIgqYv6DRzrw7HlYq+YOaNFdrX95VCgnZykvJm3BCn730Mye28UL22vxmP
 zc9l6rtvdNhP4G/5jH9R5o0Xyosar/UHFxN/iuPd0XjxkjnRyQ=

On Fri, Dec 10, 2021 at 11:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Allocate the MSI device data on first invocation of the allocation function.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Arnd Bergmann <arnd@arndb.de>

