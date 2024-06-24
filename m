Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464791500F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746709.1153843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkoM-0005nV-RH; Mon, 24 Jun 2024 14:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746709.1153843; Mon, 24 Jun 2024 14:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkoM-0005li-OZ; Mon, 24 Jun 2024 14:36:50 +0000
Received: by outflank-mailman (input) for mailman id 746709;
 Mon, 24 Jun 2024 14:36:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjL/=N2=bounce.vates.tech=bounce-md_30504962.6679847d.v1-df7692446996417a80f84d8b5bcc0063@srs-se1.protection.inumbo.net>)
 id 1sLkoL-0005lU-FO
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:36:49 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee2603f-3237-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:36:47 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W79Wx41Nsz5QkLfv
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 14:36:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df7692446996417a80f84d8b5bcc0063; Mon, 24 Jun 2024 14:36:45 +0000
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
X-Inumbo-ID: 2ee2603f-3237-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719239805; x=1719500305;
	bh=TZaaytuqYIwSbyX0zplkdr+dJA1t8O/nak39rKgZu4U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vNADMY8a8ilLpZP47DqmyR3xwBgyYqE7FqgNcT88J1Nfjb2M30v6/Kh24otdQONfo
	 zz4VBBXn8XNUxbRn99inusHnY99Z4b6Frk/MY8fIN3jTL7mQkaOMBYykYGpiXswU3o
	 Q5WWEkQHTA666BJyHJ2znOB/Wiuty8/8xw/+iZTIDsoV7vzWM5xltEFAcMBW92lLbk
	 VGE7TyJAUBHGajAuhw0bQ3ZPz8BsurSZ6EIhlmLMAfj7fv4h7k2UKofI04fOs2nmWH
	 /3EyPasS9cndMZby8uEWmdqg5Jix5mL5p3UJ4BtAPqZ50teq6F5cBfFvJtbiaNDzlT
	 hz7svfqnELXjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719239805; x=1719500305; i=teddy.astie@vates.tech;
	bh=TZaaytuqYIwSbyX0zplkdr+dJA1t8O/nak39rKgZu4U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=t9lZTdGXl5EQWQTJw/Goc1ev8P0zsz9sE8foihPlFsjjtaFgggDxTqnA9k4S4gA88
	 WNYGfastskMEIJOnaMyMscaZgi4QXXnLzluB76wcTLQSSLUk+tvIvP9CQmht//WUvw
	 SXdAsVWnqhaBy+bfh7yB0UkbxwDdjoH/VO69m3Q2fUqh915mzWs0nlgMzNzPrq1j+G
	 xXAuD9gP8VROU7SpZWKHOs852/fw4gUH0LciKQIFS3MK/xhHAPxFBU1+TjGFTdsPrM
	 e/1be1tXpp5QRlK2LbAcryIGTq/SoARpdCBJXoJzY6MrAubpF22yB4ad3TqWHkX1Bf
	 A/uJuuMH+32lA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v2]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719239803489
Message-Id: <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
To: Robin Murphy <robin.murphy@arm.com>, xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech> <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
In-Reply-To: <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df7692446996417a80f84d8b5bcc0063?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240624:md
Date: Mon, 24 Jun 2024 14:36:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Robin,
Thanks for the thourough review.

>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>> index 0af39bbbe3a3..242cefac77c9 100644
>> --- a/drivers/iommu/Kconfig
>> +++ b/drivers/iommu/Kconfig
>> @@ -480,6 +480,15 @@ config VIRTIO_IOMMU
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y here if you intend to r=
un this kernel as a guest.
>> +config XEN_IOMMU
>> +=C2=A0=C2=A0=C2=A0 bool "Xen IOMMU driver"
>> +=C2=A0=C2=A0=C2=A0 depends on XEN_DOM0
> 
> Clearly this depends on X86 as well.
> 
Well, I don't intend this driver to be X86-only, even though the current 
Xen RFC doesn't support ARM (yet). Unless there is a counter-indication 
for it ?

>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/types.h>
>> +#include <linux/iommu.h>
>> +#include <linux/dma-map-ops.h>
> 
> Please drop this; it's a driver, not a DMA ops implementation.
> 
Sure, in addition to some others unneeded headers.

>> +#include <linux/pci.h>
>> +#include <linux/list.h>
>> +#include <linux/string.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/slab.h>
>> +#include <linux/err.h>
>> +#include <linux/printk.h>
>> +#include <linux/stddef.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/minmax.h>
>> +#include <linux/string.h>
>> +#include <asm/iommu.h>
>> +
>> +#include <xen/xen.h>
>> +#include <xen/page.h>
>> +#include <xen/interface/memory.h>
>> +#include <xen/interface/physdev.h>
>> +#include <xen/interface/pv-iommu.h>
>> +#include <asm/xen/hypercall.h>
>> +#include <asm/xen/page.h>
>> +
>> +MODULE_DESCRIPTION("Xen IOMMU driver");
>> +MODULE_AUTHOR("Teddy Astie <teddy.astie@vates.tech>");
>> +MODULE_LICENSE("GPL");
>> +
>> +#define MSI_RANGE_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0xfe=
e00000)
>> +#define MSI_RANGE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0xfeef=
ffff)
>> +
>> +#define XEN_IOMMU_PGSIZES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x1000)
>> +
>> +struct xen_iommu_domain {
>> +=C2=A0=C2=A0=C2=A0 struct iommu_domain domain;
>> +
>> +=C2=A0=C2=A0=C2=A0 u16 ctx_no; /* Xen PV-IOMMU context number */
>> +};
>> +
>> +static struct iommu_device xen_iommu_device;
>> +
>> +static uint32_t max_nr_pages;
>> +static uint64_t max_iova_addr;
>> +
>> +static spinlock_t lock;
> 
> Not a great name - usually it's good to name a lock after what it 
> protects. Although perhaps it is already, since AFAICS this isn't 
> actually used anywhere anyway.
> 

Yes, that shouldn't be there.

>> +static inline struct xen_iommu_domain *to_xen_iommu_domain(struct 
>> iommu_domain *dom)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(dom, struct xen_iommu_domain, do=
main);
>> +}
>> +
>> +static inline u64 addr_to_pfn(u64 addr)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return addr >> 12;
>> +}
>> +
>> +static inline u64 pfn_to_addr(u64 pfn)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return pfn << 12;
>> +}
>> +
>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
>> +{
>> +=C2=A0=C2=A0=C2=A0 switch (cap) {
>> +=C2=A0=C2=A0=C2=A0 case IOMMU_CAP_CACHE_COHERENCY:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
> 
> Will the PV-IOMMU only ever be exposed on hardware where that really is 
> always true?
> 

On the hypervisor side, the PV-IOMMU interface always implicitely flush 
the IOMMU hardware on map/unmap operation, so at the end of the 
hypercall, the cache should be always coherent IMO.

>> +
>> +static struct iommu_device *xen_iommu_probe_device(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (!dev_is_pci(dev))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENODEV);
>> +
>> +=C2=A0=C2=A0=C2=A0 return &xen_iommu_device;
> 
> Even emulated PCI devices have to have an (emulated, presumably) IOMMU?
> 

No and that's indeed one thing to check.

>> +}
>> +
>> +static void xen_iommu_probe_finalize(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 set_dma_ops(dev, NULL);
>> +=C2=A0=C2=A0=C2=A0 iommu_setup_dma_ops(dev, 0, max_iova_addr);
> 

That got changed in 6.10, good to know that this code is not required 
anymore.

> 
>> +}
>> +
>> +static int xen_iommu_map_pages(struct iommu_domain *domain, unsigned 
>> long iova,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_addr_t paddr, size_t pgsize, s=
ize_t pgcount,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int prot, gfp_t gfp, size_t *mapped=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 size_t xen_pg_count =3D (pgsize / XEN_PAGE_SIZE) * p=
gcount;
> 
> You only advertise the one page size, so you'll always get that back, 
> and this seems a bit redundant.
> 

Yes

>> +=C2=A0=C2=A0=C2=A0 struct xen_iommu_domain *dom =3D to_xen_iommu_domain=
(domain);
>> +=C2=A0=C2=A0=C2=A0 struct pv_iommu_op op =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .subop_id =3D IOMMUOP_map_pa=
ges,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ctx_no =3D dom->ctx_no
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 /* NOTE: paddr is actually bound to pfn, not gfn */
>> +=C2=A0=C2=A0=C2=A0 uint64_t pfn =3D addr_to_pfn(paddr);
>> +=C2=A0=C2=A0=C2=A0 uint64_t dfn =3D addr_to_pfn(iova);
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 //pr_info("Mapping to %lx %zu %zu paddr %x\n", iova,=
 pgsize, 
>> pgcount, paddr);
> 
> Please try to clean up debugging leftovers before posting the patch (but 
> also note that there are already tracepoints and debug messages which 
> can be enabled in the core code to give visibility of most of this.)
> 

Yes

>> +
>> +=C2=A0=C2=A0=C2=A0 if (prot & IOMMU_READ)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.flags |=3D IOMMU_OP_reada=
ble;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (prot & IOMMU_WRITE)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.flags |=3D IOMMU_OP_write=
able;
>> +
>> +=C2=A0=C2=A0=C2=A0 while (xen_pg_count) {
> 
> Unless you're super-concerned about performance already, you don't 
> really need to worry about looping here - you can happily return short 
> as long as you've mapped *something*, and the core code will call you 
> back again with the remainder. But it also doesn't complicate things 
> *too* much as it is, so feel free to leave it in if you want to.
> 

Ok

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t to_map =3D min(xen_pg=
_count, max_nr_pages);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t gfn =3D pfn_to_gfn(=
pfn);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //pr_info("Mapping %lx-%lx a=
t %lx-%lx\n", gfn, gfn + to_map - 
>> 1, dfn, dfn + to_map - 1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.map_pages.gfn =3D gfn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.map_pages.dfn =3D dfn;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.map_pages.nr_pages =3D to=
_map;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D HYPERVISOR_iommu_op(=
&op);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //pr_info("map_pages.mapped =
=3D %u\n", op.map_pages.mapped);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mapped)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *map=
ped +=3D XEN_PAGE_SIZE * op.map_pages.mapped;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 brea=
k;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pg_count -=3D to_map;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pfn +=3D to_map;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dfn +=3D to_map;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static size_t xen_iommu_unmap_pages(struct iommu_domain *domain, 
>> unsigned long iova,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t pgsize, size_t pgcount=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iommu_iotlb_gather *io=
tlb_gather)
>> +{
>> +=C2=A0=C2=A0=C2=A0 size_t xen_pg_count =3D (pgsize / XEN_PAGE_SIZE) * p=
gcount;
>> +=C2=A0=C2=A0=C2=A0 struct xen_iommu_domain *dom =3D to_xen_iommu_domain=
(domain);
>> +=C2=A0=C2=A0=C2=A0 struct pv_iommu_op op =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .subop_id =3D IOMMUOP_unmap_=
pages,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ctx_no =3D dom->ctx_no,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D 0,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 uint64_t dfn =3D addr_to_pfn(iova);
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (WARN(!dom->ctx_no, "Tried to unmap page to defau=
lt context"))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> 
> This would go hilariously wrong... the return value here is bytes 
> successfully unmapped, a total failure should return 0.

This check is not useful as the core code is never going to call it on 
this domain.

> 
>> +=C2=A0=C2=A0=C2=A0 while (xen_pg_count) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t to_unmap =3D min(xen_=
pg_count, max_nr_pages);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //pr_info("Unmapping %lx-%lx=
\n", dfn, dfn + to_unmap - 1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.unmap_pages.dfn =3D dfn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.unmap_pages.nr_pages =3D =
to_unmap;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D HYPERVISOR_iommu_op(=
&op);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_w=
arn("Unmap failure (%lx-%lx)\n", dfn, dfn + to_unmap 
>> - 1);
> 
> But then how 
>> would it ever happen anyway? Unmap is a domain op, so a domain which 
>> doesn't allow unmapping shouldn't offer it in the first place...

Unmap failing should be exceptionnal, but is possible e.g with 
transparent superpages (like Xen IOMMU drivers do). Xen drivers folds 
appropriate contiguous mappings into superpages entries to optimize 
memory usage and iotlb. However, if you unmap in the middle of a region 
covered by a superpage entry, this is no longer a valid superpage entry, 
and you need to allocate and fill the lower levels, which is faillible 
if lacking memory.

> In this case I'd argue that you really *do* want to return short, in the 
> hope of propagating the error back up and letting the caller know the 
> address space is now messed up before things start blowing up even more 
> if they keep going and subsequently try to map new pages into 
> not-actually-unmapped VAs.

While mapping on top of another mapping is ok for us (it's just going to 
override the previous mapping), I definetely agree that having the 
address space messed up is not good.

> 
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pg_count -=3D to_unmap;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dfn +=3D to_unmap;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return pgcount * pgsize;
>> +}
>> +
>> +int xen_iommu_attach_dev(struct iommu_domain *domain, struct device 
>> *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev;
>> +=C2=A0=C2=A0=C2=A0 struct xen_iommu_domain *dom =3D to_xen_iommu_domain=
(domain);
>> +=C2=A0=C2=A0=C2=A0 struct pv_iommu_op op =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .subop_id =3D IOMMUOP_reatta=
ch_device,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ctx_no =3D dom->ctx_no,
>> +=C2=A0=C2=A0=C2=A0 };
>> +
>> +=C2=A0=C2=A0=C2=A0 pdev =3D to_pci_dev(dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.seg =3D pci_domain_nr(pdev->b=
us);
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.bus =3D pdev->bus->number;
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.devfn =3D pdev->devfn;
>> +
>> +=C2=A0=C2=A0=C2=A0 return HYPERVISOR_iommu_op(&op);
>> +}
>> +
>> +static void xen_iommu_free(struct iommu_domain *domain)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 struct xen_iommu_domain *dom =3D to_xen_iommu_domain=
(domain);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (dom->ctx_no !=3D 0) {
> 
> Much like unmap above, this not being true would imply that someone's 
> managed to go round the back of the core code to get the .free op from a 
> validly-allocated domain and then pass something other than that domain 
> to it. Personally I'd consider that a level of brokenness that's not 
> even worth trying to consider at all, but if you want to go as far as 
> determining that you *have* clearly been given something you couldn't 
> have allocated, then trying to kfree() it probably isn't wise either.
> 

Yes

>> +
>> +static int default_domain_attach_dev(struct iommu_domain *domain,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev;
>> +=C2=A0=C2=A0=C2=A0 struct pv_iommu_op op =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .subop_id =3D IOMMUOP_reatta=
ch_device,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ctx_no =3D 0 /* reattach de=
vice back to default context */
>> +=C2=A0=C2=A0=C2=A0 };
>> +
>> +=C2=A0=C2=A0=C2=A0 pdev =3D to_pci_dev(dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.seg =3D pci_domain_nr(pdev->b=
us);
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.bus =3D pdev->bus->number;
>> +=C2=A0=C2=A0=C2=A0 op.reattach_device.dev.devfn =3D pdev->devfn;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D HYPERVISOR_iommu_op(&op);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Unable to release d=
evice %p\n", 
>> &op.reattach_device.dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static struct iommu_domain default_domain =3D {
>> +=C2=A0=C2=A0=C2=A0 .ops =3D &(const struct iommu_domain_ops){
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .attach_dev =3D default_doma=
in_attach_dev
>> +=C2=A0=C2=A0=C2=A0 }
>> +};
> 
> Looks like you could make it a static xen_iommu_domain and just use the 
> normal attach callback? Either way please name it something less 
> confusing like xen_iommu_identity_domain - "default" is far too 
> overloaded round here already...
> 

Yes, although, if in the future, we can have either this domain as 
identity or blocking/paging depending on some upper level configuration. 
Should we have both identity and blocking domains, and only setting the 
relevant one in iommu_ops, or keep this naming.

>> +static struct iommu_ops xen_iommu_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .identity_domain =3D &default_domain,
>> +=C2=A0=C2=A0=C2=A0 .release_domain =3D &default_domain,
>> +=C2=A0=C2=A0=C2=A0 .capable =3D xen_iommu_capable,
>> +=C2=A0=C2=A0=C2=A0 .domain_alloc_paging =3D xen_iommu_domain_alloc_pagi=
ng,
>> +=C2=A0=C2=A0=C2=A0 .probe_device =3D xen_iommu_probe_device,
>> +=C2=A0=C2=A0=C2=A0 .probe_finalize =3D xen_iommu_probe_finalize,
>> +=C2=A0=C2=A0=C2=A0 .device_group =3D pci_device_group,
>> +=C2=A0=C2=A0=C2=A0 .get_resv_regions =3D xen_iommu_get_resv_regions,
>> +=C2=A0=C2=A0=C2=A0 .pgsize_bitmap =3D XEN_IOMMU_PGSIZES,
>> +=C2=A0=C2=A0=C2=A0 .default_domain_ops =3D &(const struct iommu_domain_=
ops) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .map_pages =3D xen_iommu_map=
_pages,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unmap_pages =3D xen_iommu_u=
nmap_pages,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .attach_dev =3D xen_iommu_at=
tach_dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iova_to_phys =3D xen_iommu_=
iova_to_phys,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D xen_iommu_free,
>> +=C2=A0=C2=A0=C2=A0 },
>> +};
>> +
>> +int __init xen_iommu_init(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 struct pv_iommu_op op =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .subop_id =3D IOMMUOP_query_=
capabilities
>> +=C2=A0=C2=A0=C2=A0 };
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!xen_domain())
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check if iommu_op is supported */
>> +=C2=A0=C2=A0=C2=A0 if (HYPERVISOR_iommu_op(&op) =3D=3D -ENOSYS)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV; /* No Xen IO=
MMU hardware */
>> +
>> +=C2=A0=C2=A0=C2=A0 pr_info("Initialising Xen IOMMU driver\n");
>> +=C2=A0=C2=A0=C2=A0 pr_info("max_nr_pages=3D%d\n", op.cap.max_nr_pages);
>> +=C2=A0=C2=A0=C2=A0 pr_info("max_ctx_no=3D%d\n", op.cap.max_ctx_no);
>> +=C2=A0=C2=A0=C2=A0 pr_info("max_iova_addr=3D%llx\n", op.cap.max_iova_ad=
dr);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (op.cap.max_ctx_no =3D=3D 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Unable to use IOMMU =
PV driver (no context 
>> available)\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOTSUPP; /* Unable =
to use IOMMU PV ? */
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (xen_domain_type =3D=3D XEN_PV_DOMAIN)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* TODO: In PV domain, due t=
o the existing pfn-gfn mapping we 
>> need to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * consider that under =
certains circonstances, we have :
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 pfn_to_g=
fn(x + 1) !=3D pfn_to_gfn(x) + 1
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * In these cases, we w=
ould want to separate the subop into 
>> several calls.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * (only doing the grou=
ped operation when the mapping is 
>> actually contigous)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Only map operation w=
ould be affected, as unmap actually 
>> uses dfn which
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doesn't have this ki=
nd of mapping.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Force single-page op=
erations to work arround this issue 
>> for now.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_nr_pages =3D 1;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* With HVM domains, pfn_to_=
gfn is identity, there is no 
>> issue regarding this. */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_nr_pages =3D op.cap.max_=
nr_pages;
>> +
>> +=C2=A0=C2=A0=C2=A0 max_iova_addr =3D op.cap.max_iova_addr;
>> +
>> +=C2=A0=C2=A0=C2=A0 spin_lock_init(&lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D iommu_device_sysfs_add(&xen_iommu_device, NU=
LL, NULL, 
>> "xen-iommu");
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Unable to add Xen IO=
MMU sysfs\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D iommu_device_register(&xen_iommu_device, &xe=
n_iommu_ops, 
>> NULL);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Unable to register X=
en IOMMU device %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu_device_sysfs_remove(&x=
en_iommu_device);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* swiotlb is redundant when IOMMU is active. */
>> +=C2=A0=C2=A0=C2=A0 x86_swiotlb_enable =3D false;
> 
> That's not always true, but either way if this is at 
> module_init/device_initcall time then it's too late to make any 
> difference anyway.
> 

Ok

>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +void __exit xen_iommu_fini(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 pr_info("Unregistering Xen IOMMU driver\n");
>> +
>> +=C2=A0=C2=A0=C2=A0 iommu_device_unregister(&xen_iommu_device);
>> +=C2=A0=C2=A0=C2=A0 iommu_device_sysfs_remove(&xen_iommu_device);
>> +}
> 
> This is dead code since the Kconfig is only "bool". Either allow it to 
> be an actual module (and make sure that works), or drop the pretence 
> altogether.
> 

Ok, I though this function was actually a requirement even if it is not 
a module.

> Thanks,
> Robin.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


