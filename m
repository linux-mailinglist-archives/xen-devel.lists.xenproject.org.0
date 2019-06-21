Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC554F14A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTGS-0003YJ-B3; Fri, 21 Jun 2019 23:48:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTGR-0003YA-3k
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:48:15 +0000
X-Inumbo-ID: 087250ae-947f-11e9-9612-d7c6a5d13e22
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087250ae-947f-11e9-9612-d7c6a5d13e22;
 Fri, 21 Jun 2019 23:48:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBCCB2084E;
 Fri, 21 Jun 2019 23:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561160893;
 bh=+056jBUQboA7xZ4beMgZFUzOfYgoq/OsGqEag3cxV04=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=V83F1w81t1d3pGYgnAQrqdSnNPulV1JsM5Pkm5mvXWlCpDZi5sxiYGHa7H0UtLq1E
 LRZ418mvQrExKXIUqMT5ALoTSiBOEqxZvUM1vLJE6Q0nWf5a7tMA4fziWByFy86wdY
 F+JDts0RT+OEcx1nXNX+4Sth3uXrJK/EWf+uN5T8=
Date: Fri, 21 Jun 2019 16:48:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <4d1cd350-fc11-1b8b-c11c-ebc769960703@gmail.com>
Message-ID: <alpine.DEB.2.21.1906211543280.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <4d1cd350-fc11-1b8b-c11c-ebc769960703@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-824027851-1561157043=:25730"
Content-ID: <alpine.DEB.2.21.1906211555070.25730@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH v2 0/10] iomem memory policy
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com,
 andrew.cooper3@citrix.com, julien.grall@arm.com, JBeulich@suse.com,
 ian.jackson@citrix.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-824027851-1561157043=:25730
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1906211555071.25730@sstabellini-ThinkPad-T480s>

Hi Oleksandr,

Thanks for testing! Give a look at the latest version (v3). I don't
think this error will happen there.

Cheers,

Stefano

On Thu, 16 May 2019, Oleksandr wrote:
> 
> On 01.05.19 00:02, Stefano Stabellini wrote:
> > Hi all,
> 
> Hi, Stefano
> 
> 
> > 
> > This series introduces a memory policy parameter for the iomem option,
> > so that we can map an iomem region into a guest as cacheable memory.
> > 
> > Then, this series fixes the way Xen handles reserved memory regions on
> > ARM: they should be mapped as normal memory, instead today they are
> > treated as device memory.
> > 
> > Cheers,
> > 
> > Stefano
> > 
> > 
> > 
> > The following changes since commit be3d5b30331d87e177744dbe23138b9ebcdc86f1:
> > 
> >    x86/msr: Fix fallout from mostly c/s 832c180 (2019-04-15 17:51:30 +0100)
> > 
> > are available in the git repository at:
> > 
> >    http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git
> > iomem_cache-v2
> > 
> > for you to fetch changes up to 4979f8e2f1120b2c394be815b071c017e287cf33:
> > 
> >    xen/arm: add reserved-memory regions to the dom0 memory node (2019-04-30
> > 13:56:40 -0700)
> > 
> > ----------------------------------------------------------------
> > Stefano Stabellini (10):
> >        xen: add a p2mt parameter to map_mmio_regions
> >        xen: rename un/map_mmio_regions to un/map_regions
> >        xen: extend XEN_DOMCTL_memory_mapping to handle memory policy
> >        libxc: introduce xc_domain_mem_map_policy
> >        libxl/xl: add memory policy option to iomem
> >        xen/arm: extend device_tree_for_each_node
> >        xen/arm: make process_memory_node a device_tree_node_func
> >        xen/arm: keep track of reserved-memory regions
> >        xen/arm: map reserved-memory regions as normal memory in dom0
> >        xen/arm: add reserved-memory regions to the dom0 memory node
> 
> Thank you for doing that. Support of reserved-memory in Xen on ARM is a quite
> important feature. We are interested in possibility to provide reserved-memory
> regions to DomU. Our system uses *thin Dom0* which doesn't have H/W IPs
> assigned which may require reserved-memory, unlike, other domains which could
> have. So, I would be happy to test your patch series on R-Car Gen3 platforms
> if you have a plan to extend this support for covering other than hwdom
> domains. There are a few quite different reserved-memory regions used in
> Renesas BSP, I think, it would be a good target to test on...
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/tree/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts#n37 
> 
> As for the current series, I have tested Xen boot only. Looks like, *real*
> reserved-memory regions were handled correctly, but some test
> "non-reserved-memory" node was interpreted as a "reserved-memory" and was
> taken into the account... Please see details below.
> 
> --------------------
> Host device tree contains the following nodes:
> 
> memory@48000000 {
>     device_type = "memory";
>     /* first 128MB is reserved for secure area. */
>     reg = <0x0 0x48000000 0x0 0x78000000>,
>           <0x5 0x00000000 0x0 0x80000000>,
>           <0x6 0x00000000 0x0 0x80000000>,
>           <0x7 0x00000000 0x0 0x80000000>;
> };
> 
> reserved-memory {
>     #address-cells = <2>;
>     #size-cells = <2>;
>     ranges;
> 
>     /* device specific region for Lossy Decompression */
>     lossy_decompress: linux,lossy_decompress@54000000 {
>         no-map;
>         reg = <0x00000000 0x54000000 0x0 0x03000000>;
>     };
> 
>     /* For Audio DSP */
>     adsp_reserved: linux,adsp@57000000 {
>         compatible = "shared-dma-pool";
>         reusable;
>         reg = <0x00000000 0x57000000 0x0 0x01000000>;
>     };
> 
>     /* global autoconfigured region for contiguous allocations */
>     linux,cma@58000000 {
>         compatible = "shared-dma-pool";
>         reusable;
>         reg = <0x00000000 0x58000000 0x0 0x18000000>;
>         linux,cma-default;
>     };
> 
>     /* device specific region for contiguous allocations */
>     mmp_reserved: linux,multimedia@70000000 {
>         compatible = "shared-dma-pool";
>         reusable;
>         reg = <0x00000000 0x70000000 0x0 0x10000000>;
>     };
> };
> 
> /* test "non-reserved-memory" node */
> sram: sram@47FFF000 {
>     compatible = "mmio-sram";
>     reg = <0x0 0x47FFF000 0x0 0x1000>;
> 
>     #address-cells = <1>;
>     #size-cells = <1>;
>     ranges = <0 0x0 0x47FFF000 0x1000>;
> 
>     scp_shmem: scp_shmem@0 {
>         compatible = "mmio-sram";
>         reg = <0x0 0x200>;
>     };
> };
> 
> --------------------
> 
> I added a print to see which memory regions were inserted:
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 9355a6e..23e68b0 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -162,6 +162,10 @@ static int __init process_memory_node(const void *fdt,
> int node,
>          device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>          if ( !size )
>              continue;
> +
> +        dt_dprintk("node %s: insert bank %d: %#"PRIx64"->%#"PRIx64" type:
> %s\n",
> +                   name, i, start, start + size, reserved ? "reserved" :
> "normal");
> +
>          mem->bank[mem->nr_banks].start = start;
>          mem->bank[mem->nr_banks].size = size;
>          mem->nr_banks++;
> 
> --------------------
> 
> Xen log shows that test "non-reserved-memory" node (scp_shmem@0) is processed
> as "reserved-memory":
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000076000040-0000000077c87e47
> (XEN) node memory@48000000: insert bank 0: 0x48000000->0xc0000000 type: normal
> (XEN) node memory@48000000: insert bank 1: 0x500000000->0x580000000 type:
> normal
> (XEN) node memory@48000000: insert bank 2: 0x600000000->0x680000000 type:
> normal
> (XEN) node memory@48000000: insert bank 3: 0x700000000->0x780000000 type:
> normal
> (XEN) node linux,lossy_decompress@54000000: insert bank 0:
> 0x54000000->0x57000000 type: reserved
> (XEN) node linux,adsp@57000000: insert bank 0: 0x57000000->0x58000000 type:
> reserved
> (XEN) node linux,cma@58000000: insert bank 0: 0x58000000->0x70000000 type:
> reserved
> (XEN) node linux,multimedia@70000000: insert bank 0: 0x70000000->0x80000000
> type: reserved
> (XEN) node scp_shmem@0: insert bank 0: 0->0x200 type: reserved   <-----------
> test "non-reserved-memory" node
> (XEN) RAM: 0000000048000000 - 00000000bfffffff
> (XEN) RAM: 0000000500000000 - 000000057fffffff
> (XEN) RAM: 0000000600000000 - 000000067fffffff
> (XEN) RAM: 0000000700000000 - 000000077fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000048000000 - 0000000048014080 Device Tree
> (XEN) MODULE[1]: 0000000076000040 - 0000000077c87e47 Ramdisk
> (XEN) MODULE[2]: 000000007a000000 - 000000007c000000 Kernel
> (XEN) MODULE[3]: 000000007c000000 - 000000007c010000 XSM
> (XEN)  RESVD[0]: 0000000048000000 - 0000000048014000
> (XEN)  RESVD[1]: 0000000076000040 - 0000000077c87e47
> 
> ...
> 
> (XEN) handle /memory@48000000
> (XEN)   Skip it (matched)
> (XEN) handle /reserved-memory
> (XEN) dt_irq_number: dev=/reserved-memory
> (XEN) /reserved-memory passthrough = 1 nirq = 0 naddr = 0
> (XEN) handle /reserved-memory/linux,lossy_decompress@54000000
> (XEN) dt_irq_number: dev=/reserved-memory/linux,lossy_decompress@54000000
> (XEN) /reserved-memory/linux,lossy_decompress@54000000 passthrough = 1 nirq =
> 0 naddr = 1
> (XEN) DT: ** translation for device
> /reserved-memory/linux,lossy_decompress@54000000 **
> (XEN) DT: bus is default (na=2, ns=2) on /reserved-memory
> (XEN) DT: translating address:<3> 00000000<3> 54000000<3>
> (XEN) DT: parent bus is default (na=2, ns=2) on /
> (XEN) DT: empty ranges; 1:1 translation
> (XEN) DT: parent translation for:<3> 00000000<3> 00000000<3>
> (XEN) DT: with offset: 54000000
> (XEN) DT: one level translation:<3> 00000000<3> 54000000<3>
> (XEN) DT: reached root node
> (XEN)   - MMIO: 0054000000 - 0057000000 P2MType=5
> (XEN) handle /reserved-memory/linux,adsp@57000000
> (XEN) dt_irq_number: dev=/reserved-memory/linux,adsp@57000000
> (XEN) /reserved-memory/linux,adsp@57000000 passthrough = 1 nirq = 0 naddr = 1
> (XEN) DT: ** translation for device /reserved-memory/linux,adsp@57000000 **
> (XEN) DT: bus is default (na=2, ns=2) on /reserved-memory
> (XEN) DT: translating address:<3> 00000000<3> 57000000<3>
> (XEN) DT: parent bus is default (na=2, ns=2) on /
> (XEN) DT: empty ranges; 1:1 translation
> (XEN) DT: parent translation for:<3> 00000000<3> 00000000<3>
> (XEN) DT: with offset: 57000000
> (XEN) DT: one level translation:<3> 00000000<3> 57000000<3>
> (XEN) DT: reached root node
> (XEN)   - MMIO: 0057000000 - 0058000000 P2MType=5
> (XEN) handle /reserved-memory/linux,cma@58000000
> (XEN) dt_irq_number: dev=/reserved-memory/linux,cma@58000000
> (XEN) /reserved-memory/linux,cma@58000000 passthrough = 1 nirq = 0 naddr = 1
> (XEN) DT: ** translation for device /reserved-memory/linux,cma@58000000 **
> (XEN) DT: bus is default (na=2, ns=2) on /reserved-memory
> (XEN) DT: translating address:<3> 00000000<3> 58000000<3>
> (XEN) DT: parent bus is default (na=2, ns=2) on /
> (XEN) DT: empty ranges; 1:1 translation
> (XEN) DT: parent translation for:<3> 00000000<3> 00000000<3>
> (XEN) DT: with offset: 58000000
> (XEN) DT: one level translation:<3> 00000000<3> 58000000<3>
> (XEN) DT: reached root node
> (XEN)   - MMIO: 0058000000 - 0070000000 P2MType=5
> (XEN) handle /reserved-memory/linux,multimedia@70000000
> (XEN) dt_irq_number: dev=/reserved-memory/linux,multimedia@70000000
> (XEN) /reserved-memory/linux,multimedia@70000000 passthrough = 1 nirq = 0
> naddr = 1
> (XEN) DT: ** translation for device /reserved-memory/linux,multimedia@70000000
> **
> (XEN) DT: bus is default (na=2, ns=2) on /reserved-memory
> (XEN) DT: translating address:<3> 00000000<3> 70000000<3>
> (XEN) DT: parent bus is default (na=2, ns=2) on /
> (XEN) DT: empty ranges; 1:1 translation
> (XEN) DT: parent translation for:<3> 00000000<3> 00000000<3>
> (XEN) DT: with offset: 70000000
> (XEN) DT: one level translation:<3> 00000000<3> 70000000<3>
> (XEN) DT: reached root node
> (XEN)   - MMIO: 0070000000 - 0080000000 P2MType=5
> 
> ...
> 
> 
> (XEN) Create memory node (reg size 4, nr cells 24)
> (XEN)   Bank 0: 0xb0000000->0xc0000000   <----------- Dom0 memory which is
> 256MB total
> (XEN)   Bank 0: 0x54000000->0x57000000   <-----------
> linux,lossy_decompress@54000000
> (XEN)   Bank 1: 0x57000000->0x58000000   <----------- linux,adsp@57000000
> (XEN)   Bank 2: 0x58000000->0x70000000   <----------- linux,cma@58000000
> (XEN)   Bank 3: 0x70000000->0x80000000   <-----------
> linux,multimedia@70000000
> (XEN)   Bank 4: 0->0x200   <----------- test "non-reserved-memory" node
> (XEN) Loading zImage from 000000007a000000 to
> 00000000b0080000-00000000b2080000
> (XEN) Loading dom0 initrd from 0000000076000040 to
> 0x00000000b8200000-0x00000000b9e87e07
> (XEN) Loading dom0 DTB to 0x00000000b8000000-0x00000000b8011b7f
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> 
> ...
> 
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 
--8323329-824027851-1561157043=:25730
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-824027851-1561157043=:25730--

