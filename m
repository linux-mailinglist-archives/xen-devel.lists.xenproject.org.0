Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98655315864
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83439.155318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aMO-0002js-AZ; Tue, 09 Feb 2021 21:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83439.155318; Tue, 09 Feb 2021 21:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aMO-0002jT-6f; Tue, 09 Feb 2021 21:15:48 +0000
Received: by outflank-mailman (input) for mailman id 83439;
 Tue, 09 Feb 2021 21:15:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9aMN-0002jJ-BC
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 21:15:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 454c7221-1aea-4d94-83d6-9d087311ba00;
 Tue, 09 Feb 2021 21:15:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25F2364E74;
 Tue,  9 Feb 2021 21:15:45 +0000 (UTC)
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
X-Inumbo-ID: 454c7221-1aea-4d94-83d6-9d087311ba00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612905345;
	bh=BPCep2afbRPxaYr2tE9qGZRa06FlAZFmQg710LXxQFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aF3D8Dz/FQwGudQkatMJTAtep6+Qfba9E5jbQgTVtlFEVtfhof2zkspxwXcJ8roTt
	 Iv4xq9DTgN3FenbxsyaZYVFEwVGIXaySyCI8oThNKBatEv0SH5x4ua8gmHF0uAZdV2
	 2liVVR516JPEVRc4gyEmajSInzXXGINY2fwoVnvpjMa4bkg3TK5B1ii7shLrnqxR9e
	 f1n/QN8avKNeS8n+E5Gww+zr/aAZbgymQ0HrHBo1ISHgr84k2tmQtJXsIle6uYHj9R
	 PSib0UN4p83TOfqBd/NqOVYjv2YXfqfuq43BVRL+b+PmjO4cu7Vp78Kx0NKrz47c1p
	 4UlywrE04xK0g==
Date: Tue, 9 Feb 2021 13:15:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>, 
    "lucmiccio@gmail.com" <lucmiccio@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2102091255020.8948@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com> <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1516528875-1612904242=:8948"
Content-ID: <alpine.DEB.2.21.2102091309510.8948@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1516528875-1612904242=:8948
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102091309511.8948@sstabellini-ThinkPad-T480s>

On Tue, 9 Feb 2021, Stefano Stabellini wrote:
> On Tue, 9 Feb 2021, Rahul Singh wrote:
> > > On 8 Feb 2021, at 6:49 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > 
> > > Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
> > > The offending chunk is:
> > > 
> > > #define gnttab_need_iommu_mapping(d)                    \
> > > -    (is_domain_direct_mapped(d) && need_iommu(d))
> > > +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> > > 
> > > On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> > > directly mapped and IOMMU is enabled for the domain, like the old check
> > > did, but the new check is always false.
> > > 
> > > In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> > > need_sync is set as:
> > > 
> > >    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
> > >        hd->need_sync = !iommu_use_hap_pt(d);
> > > 
> > > iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
> > > P2M. It is true on ARM. need_sync means that you have a separate IOMMU
> > > page-table and it needs to be updated for every change. need_sync is set
> > > to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
> > > which is wrong.
> > > 
> > > As a consequence, when using PV network from a domU on a system where
> > > IOMMU is on from Dom0, I get:
> > > 
> > > (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
> > > [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> > > 
> > > The fix is to go back to something along the lines of the old
> > > implementation of gnttab_need_iommu_mapping.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > Fixes: 91d4eca7add
> > > Backport: 4.12+
> > > 
> > > ---
> > > 
> > > Given the severity of the bug, I would like to request this patch to be
> > > backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> > > 2020.
> > > 
> > > For the 4.12 backport, we can use iommu_enabled() instead of
> > > is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.
> > > 
> > > Changes in v2:
> > > - improve commit message
> > > - add is_iommu_enabled(d) to the check
> > > ---
> > > xen/include/asm-arm/grant_table.h | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
> > > index 6f585b1538..0ce77f9a1c 100644
> > > --- a/xen/include/asm-arm/grant_table.h
> > > +++ b/xen/include/asm-arm/grant_table.h
> > > @@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
> > >     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> > > 
> > > #define gnttab_need_iommu_mapping(d)                    \
> > > -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> > > +    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> > > 
> > > #endif /* __ASM_GRANT_TABLE_H__ */
> > 
> > I tested the patch and while creating the guest I observed the below warning from Linux for block device.
> > https://elixir.bootlin.com/linux/v4.3/source/drivers/block/xen-blkback/xenbus.c#L258
> 
> So you are creating a guest with "xl create" in dom0 and you see the
> warnings below printed by the Dom0 kernel? I imagine the domU has a
> virtual "disk" of some sort.
> 
> 
> > I did initial debugging and found out that there are many calls to iommu_legacy_{,un}map() while creating the guest but when iommu_legacy_unmap() function unmap the pages something is written  wrong in page tables because of that when next time same page is mapped via create_grant_host_mapping() we observed below warning. 
> 
> By "while creating a guest", do you mean before the domU is even
> unpaused? Hence, the calls are a result of dom0 operations? Or after
> domU is unpaused, hence, the calls are a result of domU operations
> (probably the domU simply trying to access its virtual disk)?
> Please note that you can start a guest paused with xl create -p.
> 
> Looking at the logs, it is probably the latter. The following line
> should be printed when the domU PV block frontend connects to the
> backend in dom0:
> 
> [  138.639934] xen-blkback: backend/vbd/0/51712: using 4 queues, protocol 1 (arm-abi) persistent grants
> 
> I'll see if I can repro the issue here.

I cannot repro the issue at my end. If there is anything interesting in
your setup that is necessary to reproduce the problem please share the
details.

Looking at the code, xen_blkif_disconnect is called by frontend_changed
on XenbusStateConnected. I don't know for sure why we need to call
xen_blkif_disconnect() before connecting, but I imagine it is to make sure
we are starting from a clean slate.

In the case of domU creation, I'd imagine the xen_blkif_disconnect() is
unnecessary. And, in fact, in my setup blkif->nr_rings is 0 so the loop
at the beginning of xen_blkif_disconnect is not even entered.

I wonder why it is not the same at your end. I don't know how it could
be that blkif->nr_rings is not 0 if you are just starting the VM for the
first time. Also, are you sure that this is related to this patch?

  
> > [  138.639934] xen-blkback: backend/vbd/0/51712: using 4 queues, protocol 1 (arm-abi) persistent grants
> > (XEN) gnttab_mark_dirty not implemented yet
> > [  138.659702] xen-blkback: backend/vbd/0/51712: using 4 queues, protocol 1 (arm-abi) persistent grants
> > [  138.669827] vbd vbd-0-51712: 9 mapping in shared page 8 from domain 0
> > [  138.676636] vbd vbd-0-51712: 9 mapping ring-ref port 5
> > [  138.682089] ------------[ cut here ]------------
> > [  138.686605] WARNING: CPU: 2 PID: 37 at drivers/block/xen-blkback/xenbus.c:296 xen_blkif_disconnect+0x20c/0x230
> > [  138.696668] Modules linked in: bridge stp llc ipv6 nf_defrag_ipv6
> > [  138.702833] CPU: 2 PID: 37 Comm: xenwatch Not tainted 5.4.0-yocto-standard #1
> > [  138.710037] Hardware name: Arm Neoverse N1 System Development Platform (DT)
> > [  138.717067] pstate: 80c00005 (Nzcv daif +PAN +UAO)
> > [  138.721927] pc : xen_blkif_disconnect+0x20c/0x230
> > [  138.726701] lr : xen_blkif_disconnect+0xbc/0x230
> > [  138.731388] sp : ffff800011cb3c80
> > [  138.734773] x29: ffff800011cb3c80 x28: ffff00005b6da940 
> > [  138.740156] x27: 0000000000000000 x26: 0000000000000000 
> > [  138.745536] x25: ffff000029755060 x24: 0000000000000170 
> > [  138.750919] x23: ffff000029755040 x22: ffff000059c72000 
> > [  138.756299] x21: 0000000000000000 x20: ffff000029755000 
> > [  138.761681] x19: 0000000000000001 x18: 0000000000000000 
> > [  138.767063] x17: 0000000000000000 x16: 0000000000000000 
> > [  138.772444] x15: 0000000000000000 x14: 0000000000000000 
> > [  138.777826] x13: 0000000000000000 x12: 0000000000000000 
> > [  138.783207] x11: 0000000000000001 x10: 0000000000000990 
> > [  138.788589] x9 : 0000000000000001 x8 : 0000000000210d00 
> > [  138.793971] x7 : 0000000000000018 x6 : ffff00005ddf72a0 
> > [  138.799352] x5 : ffff800011cb3c28 x4 : 0000000000000000 
> > [  138.804734] x3 : ffff000029755118 x2 : 0000000000000000 
> > [  138.810117] x1 : ffff000029755120 x0 : 0000000000000001 
> > [  138.815497] Call trace:
> > [  138.818015]  xen_blkif_disconnect+0x20c/0x230
> > [  138.822442]  frontend_changed+0x1b0/0x54c
> > [  138.826523]  xenbus_otherend_changed+0x80/0xb0
> > [  138.831035]  frontend_changed+0x10/0x20
> > [  138.834941]  xenwatch_thread+0x80/0x144
> > [  138.838849]  kthread+0x118/0x120
> > [  138.842147]  ret_from_fork+0x10/0x18
> > [  138.845791] ---[ end trace fb9f0a3b3b48a55f ]—
> 
--8323329-1516528875-1612904242=:8948--

