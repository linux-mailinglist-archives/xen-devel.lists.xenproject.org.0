Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDD409EC1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 23:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185943.334703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPt5Y-00036a-PA; Mon, 13 Sep 2021 21:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185943.334703; Mon, 13 Sep 2021 21:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPt5Y-00034h-LT; Mon, 13 Sep 2021 21:02:04 +0000
Received: by outflank-mailman (input) for mailman id 185943;
 Mon, 13 Sep 2021 21:02:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPt5W-00034L-VU
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 21:02:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1506a6a-28ec-4e83-844a-ea869dd11cd4;
 Mon, 13 Sep 2021 21:02:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2BA60698;
 Mon, 13 Sep 2021 21:02:00 +0000 (UTC)
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
X-Inumbo-ID: d1506a6a-28ec-4e83-844a-ea869dd11cd4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631566920;
	bh=10DfJjt/WDE3/J2yJDqYWXAs7Kfw/Peuw1zK53nTjlc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dhBtRFtPoRvZXpSU7C4Wkn1PXv2JgJBSZRZPaZL947uG3mngZ0wQPFQWsCD/NTdrL
	 nK0gAyZfnN2t7mfiE+EreS+PPeTHd4W0/fIqujNpiDFl52VsiAAAfYP2z3CPd9d0+j
	 XzyOk5KxqNiIElWaYO9cBZn1BzxbTIDE/IrHfTnGDQH5/8O2jzV5MYm8lsJI8pXmd4
	 6IM9DzBlRw0QnUood2YpKcIV5LB1WzLt3VbmfScLyjlDugFyEls28HgdCBJncrgHNO
	 DAcFtOGe0bJCOvilhapMiAbWRV7rO11cMCFmh1jZCsGnR/3ojNIeP6l3ktFB0g7ar4
	 7xiH37NLJ3gtg==
Date: Mon, 13 Sep 2021 14:02:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
In-Reply-To: <aa251354-3e5f-e1ae-2647-3a112ad5d12e@epam.com>
Message-ID: <alpine.DEB.2.21.2109131356090.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s> <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
 <aa251354-3e5f-e1ae-2647-3a112ad5d12e@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-351725318-1631566589=:10523"
Content-ID: <alpine.DEB.2.21.2109131356330.10523@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-351725318-1631566589=:10523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109131356331.10523@sstabellini-ThinkPad-T480s>

On Mon, 13 Sep 2021, Oleksandr Andrushchenko wrote:
> On 10.09.21 15:01, Rahul Singh wrote:
> > Hi Stefano,
> >
> >> On 10 Sep 2021, at 12:34 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>
> >> On Thu, 19 Aug 2021, Rahul Singh wrote:
> >>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>
> >>> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> >>> space to the XEN memory.
> >>>
> >>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>> ---
> >>> xen/arch/arm/pci/Makefile          |  1 +
> >>> xen/arch/arm/pci/pci-host-zynqmp.c | 59 ++++++++++++++++++++++++++++++
> >>> 2 files changed, 60 insertions(+)
> >>> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
> >>>
> >>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> >>> index 6f32fbbe67..1d045ade01 100644
> >>> --- a/xen/arch/arm/pci/Makefile
> >>> +++ b/xen/arch/arm/pci/Makefile
> >>> @@ -3,3 +3,4 @@ obj-y += pci-access.o
> >>> obj-y += pci-host-generic.o
> >>> obj-y += pci-host-common.o
> >>> obj-y += ecam.o
> >>> +obj-y += pci-host-zynqmp.o
> >>> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> >>> new file mode 100644
> >>> index 0000000000..fe103e3855
> >>> --- /dev/null
> >>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> >>> @@ -0,0 +1,59 @@
> >>> +/*
> >>> + * Copyright (C) 2020-2021 EPAM Systems
> >>> + *
> >>> + * Based on Linux drivers/pci/controller/pci-host-common.c
> >>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> >>> + * Based on xen/arch/arm/pci/pci-host-generic.c
> >>> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
> >> Only one Copyright line per file is enough :-)
> >>
> >> But actually all the Copyright lines with a name or a company name are
> >> not really required or useful, as the copyright is noted in full details
> >> in the commit messages (author and signed-off-by lines). I would remove
> >> them all from the new files added by this series.
> > Ok. Let me remove in next version.
> >>
> >>> + * This program is free software; you can redistribute it and/or modify
> >>> + * it under the terms of the GNU General Public License version 2 as
> >>> + * published by the Free Software Foundation.
> >>> + *
> >>> + * This program is distributed in the hope that it will be useful,
> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + * GNU General Public License for more details.
> >>> + *
> >>> + * You should have received a copy of the GNU General Public License
> >>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> >>> + */
> >>> +
> >>> +#include <asm/device.h>
> >>> +#include <xen/pci.h>
> >>> +#include <asm/pci.h>
> >>> +
> >>> +static const struct dt_device_match gen_pci_dt_match[] = {
> >>> +    { .compatible = "xlnx,nwl-pcie-2.11",
> >>> +      .data =       &pci_generic_ecam_ops },
> >>> +    { },
> >>> +};
> >>> +
> >>> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
> >>> +{
> >>> +    const struct dt_device_match *of_id;
> >>> +    const struct pci_ecam_ops *ops;
> >>> +
> >>> +    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
> >> This should be superfluous
> > Ack. I will remove the dt_match_node(..) in next version.
> 
> I am not entirely sure we need this patch at all as the main reason for its existence
> 
> was that we can run Xilinx QEMU for ZCU102. But, the final setup is not going
> 
> to be functional as legacy IRQs are not supported and ITS is not a part of ZynqMP.
> 
> So, QEMU allows to do a lot with PCI passthrough, but at the end of the day one
> 
> won't have it working...
> 
> Please consider
> 
> If we decide to remove it then
> 
> int pci_host_common_probe(struct dt_device_node *dev,
>                            const struct pci_ecam_ops *ops,
>                            int ecam_reg_idx)
> 
> doesn't need the last parameter.

With my open source maintainer hat on, I don't see this patch as very
important; from that point of view I'd be happy for it to be dropped.
However, it would be good to have at least one non-default host bridge
(doesn't have to be the Xilinx bridge), otherwise it becomes difficult
to understand how the generic infrastructure introduced by this series
could be useful.

Moreover, your recent comment [1] made it even more evident that it
would be good to have at least two different drivers to spot
compatibility issues between them more easily.

[1] https://marc.info/?l=xen-devel&m=163154474008598 
--8323329-351725318-1631566589=:10523--

