Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096C49D7A6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 02:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261141.451841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCu1G-0002Qi-9K; Thu, 27 Jan 2022 01:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261141.451841; Thu, 27 Jan 2022 01:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCu1G-0002Nr-6B; Thu, 27 Jan 2022 01:56:14 +0000
Received: by outflank-mailman (input) for mailman id 261141;
 Thu, 27 Jan 2022 01:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCu1D-0002Lz-Uf
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 01:56:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cab14a6-7f14-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 02:56:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34C64B81CB2;
 Thu, 27 Jan 2022 01:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2325C340E7;
 Thu, 27 Jan 2022 01:56:08 +0000 (UTC)
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
X-Inumbo-ID: 4cab14a6-7f14-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643248569;
	bh=ng6gduAuTYiUGNybBPsugKLGupgE+++KNGcxfbbdMwk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DvkO5MFtfxVtkphd5yPBuVBrwQ2Vbsr/aq7dz8Q8pUVARLRO3LAhovIvfNVJxW5Rh
	 k2SVaXQLHcuF5Wh3hyY99MMljRxzj75HRDc/hzBjHwLL3XOzv1TO1z9IVnnmtmmdgo
	 jsZizJ8gUi6qcAUEKLV7hOQOx0M3EKUqgIO7hA8L8rRM8HwQ6McdTs7MZ2SDWSRxbD
	 F+TrrUY8QlCtsv3ZlMA9Kr/FINM5kppk9ceEiPftMZNkZi4KOUubBkWU+6TuRSdgpS
	 vXN3ihv48xDLaI3vLpIuIxexKgg2XjEfMPWDbAlviZC9Om1e24NJpak6ByjHmsifZD
	 fEVTc82VoYoDA==
Date: Wed, 26 Jan 2022 17:56:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH] design: design doc for shared memory on a dom0less
 system
In-Reply-To: <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201261619400.27308@ubuntu-linux-20-04-desktop>
References: <20220126100943.4086208-1-penny.zheng@arm.com> <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jan 2022, Julien Grall wrote:
> > +
> > +- role(Optional)
> > +
> > +    A string property specifying the ownership of a shared memory region,
> > +    the value must be one of the following: "owner", or "borrower"
> > +    A shared memory region could be explicitly backed by one domain, which
> > is
> > +    called "owner domain", and all the other domains who are also sharing
> > +    this region are called "borrower domain".
> > +    If not specified, the default value is "borrower" and owner is
> > +    "dom_shared", a system domain.
> 
> I don't particularly like adding another system domain. Instead, it would be
> better to always specify the owner.
 
I wonder if we could reuse one of the existing system domains. DOM_IO
looks very close to what we need here, except that the current
description doesn't quite fit:

"DOMID_IO is used to restrict page-table updates to mapping I/O memory."

Also DOMID_XEN doesn't fit:

"DOMID_XEN is used to allow privileged domains to map restricted parts
of Xen's heap space (e.g., the machine_to_phys table)."


On the other hand the description of DOMID_COW seems to be exactly what
we want:

"DOMID_COW is used as the owner of sharable pages"

This is technically the description of what we need :-D  However, we
know that DOMID_COW was introduced with a different goal in mind.


> > +
> > +## Example
> > +
> > +chosen {
> > +    #address-cells = <0x1>;
> > +    #size-cells = <0x1>;
> > +    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
> > +
> > +    ......
> > +
> > +    /* this is for Dom0 */
> > +    dom0-shared-mem@10000000 {
> > +        compatible = "xen,domain-shared-memory-v1";
> > +        xen,shm-id = <0x0>;
> > +        role = "owner";
> > +        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
> > +    }
> > +
> > +    domU1 {
> > +        compatible = "xen,domain";
> > +        #address-cells = <0x1>;
> > +        #size-cells = <0x1>;
> > +        memory = <0 131072>;
> > +        cpus = <2>;
> > +        vpl011;
> > +
> > +        /*
> > +         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
> > +         * shared between dom0.
> > +         */
> > +        domU1-shared-mem@10000000 {
> > +            compatible = "xen,domain-shared-memory-v1";
> > +            xen,shm-id = <0x0>;
> > +            role = "borrower";
> > +            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;
> 
> Technically, you already know the physical address from the owner. In fact, it
> will only increase the risk to get the wrong binding. So I would like to
> suggest a different binding.
> 
> 1) Reserve the region in the host memory using reserved-memory binding
> 2) Create a binding per domain that contains a phandle to the host memory and
> the role.
> 
> The advantage with this is we could easily support region that are not backed
> by a reserved-memory.

I see what you mean but given that we have to specify the guest physical
address anyway I don't think that replacing the physical address with a
phandle would make things easier. We would still need to specify guest
physical address and maybe size. We already have xen,reg that also
works similarly. So I think it would be best to follow the same format
as xen,reg.

That would also handle the case where the shared memory region is an
sram region: we just need to use an address range that corresponds to
mmio-sram instead of memory. Note that with a phandle we would have the
problem that we could only share the entire sram region and not a part
of it (because we could only link to the full mmio-sram node and not to
a subset of it).

We just need to clearly specify the number of address cells and size
cells to use. We could introduce #shared-mem-address-cells or reuse
#address-cells. Either way parsing it should be easy.


If we wanted to use a phandle, I think it should point to a
reserved-memory region outside of /reserved-memory. Long explanation
follows.

Reserved-memory is a bit tricky to get right because reserved-memory is a
configuration node and we don't have a way to tell who the
reserved-memory configuration is for. Is it for Xen? Or for dom0? Or for
domUs? When discussing system device tree topics (system device tree is
very similar to device tree with Xen domain nodes) reserved-memory was
one of the firsts concerns that Rob raised. The solution for system
device tree was that each domain node should have its own
reserved-memory sub-node instead of using /reserved-memory (e.g.
/chosen/domU/reserved-memory).

Going back to Xen, if we take domUs out of the picture, who is
/reserved-memory for? In practice, as most drivers are in dom0, we have
been assuming /reserved-memory is for dom0. Xen copies reserved-memory
nodes to dom0.

This is why I would like to suggest that if we want to use the phandle
model then I think we should use a new and different reserved-memory
node to specify the shared memory. E.g. /chosen/reserved-memory. We
could call it differently and/or have an unambiguous compatible string:

chosen {
    reserved-memory {
        compatible = "xen,domains-reserved-memory-v1";

        ...
    };

This way we clearly distinguish it from /reserved-memory and we avoid
ownership conflicts with dom0.

 
> > +        }
> > +
> > +        domU1-shared-mem@50000000 {
> > +            compatible = "xen,domain-shared-memory-v1";
> > +            xen,shm-id = <0x1>;
> > +            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
> > +        }
> > +
> > +        ......
> > +
> > +    };
> > +
> > +    domU2 {
> > +        compatible = "xen,domain";
> > +        #address-cells = <0x1>;
> > +        #size-cells = <0x1>;
> > +        memory = <0 65536>;
> > +        cpus = <1>;
> > +
> > +        /*
> > +         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
> > +         * shared between domU1.
> > +         */
> > +        domU2-shared-mem@50000000 {
> > +            compatible = "xen,domain-shared-memory-v1";
> > +            xen,shm-id = <0x1>;
> > +            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
> > +        }
> > +
> > +        ......
> > +    };
> > +};


