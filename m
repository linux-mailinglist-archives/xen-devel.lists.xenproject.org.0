Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76F7A7885
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605490.943064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu3h-0005Su-G9; Wed, 20 Sep 2023 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605490.943064; Wed, 20 Sep 2023 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu3h-0005QA-DQ; Wed, 20 Sep 2023 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 605490;
 Wed, 20 Sep 2023 10:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w83i=FE=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qiu3f-0005Q2-WA
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:03:48 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1e1d16-579c-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 12:03:46 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso881104466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 03:03:46 -0700 (PDT)
Received: from leoy-huanghe (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 y20-20020a17090668d400b009a5f7fb51d1sm9022626ejr.40.2023.09.20.03.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 03:03:45 -0700 (PDT)
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
X-Inumbo-ID: fd1e1d16-579c-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695204226; x=1695809026; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mH8oro0gX6C/T+mH7vLzIvCCp2IR3zSkF7vdY4iq0mE=;
        b=s514wVFOYTOJWbA5dvjALvctk3euL/T0LxMDLknaczLuoUU1bcN5r0+xtUCu5yVfTc
         Yap7JhR9XUEZAbsDoPnfhLPJKfgxUq5tWqJLl74oassy2aL01rtvUHUuRLMTrrb3Ta83
         sMSAybgl2cVSdQau8B6gfvw7ifEmdNPNrWnunEyvGerEpRxddd0MXzZL/bUR++zO4N+o
         ar1/uMY5XzJ4Jz7X4+EhTGLhg/05aqistJ6My++DEVhzKT3Yfk1wXe+Ae5LhFaZqB3+d
         +KC5zwQwn6LZQFe3drcIQNMfSNSZIEFYwV9snDfOCo/XN1Kfgz3ZDJEvH3yIyrDD1t5Z
         GLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204226; x=1695809026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH8oro0gX6C/T+mH7vLzIvCCp2IR3zSkF7vdY4iq0mE=;
        b=tIopoSWRzEK6R8893uoJXLK7yQPAFAp5/3hWftlRzS64oYLi97lTHEsHORF+tE/1+b
         PQ64e0Q9aSP62qSw0yO8aUXkrEvIR5f5VQ21M11Qau45hw18hry1hz+m5ljjU/W/T5wO
         U9dyB2gYXr9H5kEugjOQ56eyJy4Dy9YHUertRyI0q7d8djP3gRInr8mmynf4pxNh4hGW
         7Xa+/QNrXafkLZzoo6CxPYNyD9VqFKyxrR4RixU33aXMzqwrtsipaVG19zz/YSsQXdeB
         wWpSIiMiTTV/X90iuU4WOFZa6dQUimIG/LNu24Hq45+Rj7OGO61RBjS6ieVocC0PWWig
         Pb5Q==
X-Gm-Message-State: AOJu0YzpHvHj0dBi3C2/geTllxYVaTZ5zO7/LQL5gQiYN2jv+d+4qy4P
	wBTIEUnRtBNLaJGoMBwx7NMM4g==
X-Google-Smtp-Source: AGHT+IE1Aj0gPeRJkrHVwdqKnmgP72yxcjqO9vEWFJXptvaf+nTSL0YOiZ5l1+EiLb8oVw+JTWNykw==
X-Received: by 2002:a17:907:a087:b0:9aa:186:959a with SMTP id hu7-20020a170907a08700b009aa0186959amr1532805ejc.31.1695204226271;
        Wed, 20 Sep 2023 03:03:46 -0700 (PDT)
Date: Wed, 20 Sep 2023 18:03:44 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: Re: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230920100344.GA71044@leoy-huanghe>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>

Hi Julien,

On Mon, Sep 18, 2023 at 08:26:21PM +0100, Julien Grall wrote:

[...]

> ... from my understanding reserved-memory are just normal memory that are
> set aside for a specific purpose. So Xen has to create a 'memory' node *and*
> a 'reserved-memory' region.

To be clear, Xen passes the 'reserved-memory' regions as normal memory
nodes, see [1].

> With that the kernel is supposed to exclude all the 'reserved-memory' from
> normal usage unless they have the node contains the property 'reusable'.
> This was more clear before the binding was converted to YAML in [1].

Linux kernel reserves pages for memory ranges in the 'reserved-memory'
node, no matter the 'no-map' property for a range is set or not (see the
function memmap_init_reserved_pages() -> __SetPageReserved() in Linux
kernel).

If a reserved memory range is set with 'no-map' property, the memory
region will be not mapped in the kernel's identical address space.  This
avoids the data corruption caused between the memory speculative fetch
with cachable mapping and the same memory region is used by devices
(e.g. for DMA transferring).

[...]

> > Here the problem is these reserved memory regions are passed as normal
> > memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
> > these reserved memory regions.  Apparently, this might lead to conflict,
> > e.g. the reserved memory is used by Dom0 kernel, at the meantime the
> > memory is used by another purpose (e.g. by MCU in the system).
> 
> See above. I think this is correct to pass both 'memory' and
> 'reserved-memory'. Now, it is possible that Xen may not create the
> device-tree correctly.

Agreed that now Xen wrongly create DT binding for 'reserved-memory'
node, more specific, the reserved memory nodes are wrongly passed as
normal memory nodes (again, see [1]).

> I would suggest to look how Linux is populating the memory and whether it
> actually skipped the regions.

The Linux kernel reserves the corresponding pages for all reserved
memory regions, which means the kernel page management (buddy
alrogithm) doesn't allocate these pages at all.

With 'no-map' property, the memory range will not be mapped into the
kernel identical address space.

> > Here I am a bit confused for "Xen doesn't have the capability to know
> > the memory attribute".  I looked into the file arch/arm/guest_walk.c,
> > IIUC, it walks through the stage 1's page tables for the virtual
> > machine and get the permission for the mapping, we also can get to
> > know the mapping attribute, right?
> 
> Most of the time, Xen will use the HW to translate the guest virtual address
> to an intermediation physical address. Looking at the specification, it
> looks like that PAR_EL1 will contain the memory attribute which I didn't
> know.
> 
> We would then need to read MAIR_EL1 to find the attribute and also the
> memory attribute in the stage-2 to figure out the final memory attribute.

> This is feasible but the Xen ABI mandates that region passed to Xen have a
> specific memory attributes (see the comment at the top of
> xen/include/public/arch-arm.h).

If you refer to the comment "All memory which is shared with other
entities in the system ... which is mapped as Normal Inner Write-Back
Outer Write-Back Inner-Shareable", I don't think it's relevant with
current issue.  I will explain in details in below.

> Anyway, in your case, Linux is using the buffer is on the stack. So the
> region must have been mapped with the proper attribute.

I think you may misunderstand the issue.  I would like to divide the
issue into two parts:

- The first question is about how to pass reserved memory node from Xen
  hypervisor to Dom0 Linux kernel.  Currently, Xen hypervisor coverts
  the reserved memory ranges and add them into the normal memory node.

  Xen hypervisor should keep the reserved memory node and pass it to
  Dom0 Linux kernel.  With this change, the Dom0 kernel will only
  allocate pages from normal memory node and the data in these pages
  can be shared by Xen hypervisor and Dom0 Linux kernel.

- The second question is for memory attribute for the reserved memory
  node.  Note, the reserved memory ranges are not necessarily _shared_
  between the Xen hypervisor and Dom0 Linux kernel.  I think in most
  cases, the reserved memory will be ioremaped by drivers (for stage-1);
  and the Xen hypervisor should map P2M with the attribute
  p2m_mmio_direct_c, or we can explore a bit based on different
  properties, e.g. for 'no-map' memory range, we map P2M with
  p2m_mmio_direct_c; for 'reusable' memory range, we map with
  attribute 'p2m_ram_rw'.

To simplify the discussion, I think we can firstly finalize the fixing
for the fist question and hold on the second question.  After we fix
the first one, we can come back to think about the second issue.

> > Another question for the attribute for MMIO regions. For mapping MMIO
> > regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
> > for the stage 2, but in the Linux kernel the MMIO's attribute can
> > be one of below variants:
> > 
> > - ioremap(): device type with nGnRE;
> > - ioremap_np(): device type with nGnRnE (strong-ordered);
> > - ioremap_wc(): normal non-cachable.
> 
> The stage-2 memory attribute is used to restrict the final memory attribute.
> In this case, p2m_mmio_direct_c allows the domain to set pretty much any
> memory attribute.

Thanks for confirmation.  If so, I think the Xen hypervisor should
follow the same attribute to map the reserved regions with attribute
p2m_mmio_direct_c.

> > If Xen hypervisor can handle these MMIO types in stage 2, then we should
> > can use the same way to map stage 2 tables for the reserved memory.  A
> > difference for the reserved memory is it can be mapped as normal memory
> > with cacheable.
> 
> I am a bit confused. I read this as you think the region is not mapped in
> the P2M (aka stage-2 page-tables for Arm). But from the logs you provided,
> the regions are already mapped (you have an MFN in hand).

You are right.  The reserved memory regions have been mapped in P2M.

> So to me the error is most likely in how we create the Device-Tree.

Yeah, let's firstly focus on the DT binding for reserved memory nodes.

> > The DT binding is something like (I tweaked a bit for readable):
> 
> Just to confirm this is the host device tree, right? If so...

Yes.

> > 	memory@20000000 {
> > 		#address-cells = <0x02>;
> > 		#size-cells = <0x02>;
> > 		device_type = "memory";
> > 		reg = <0x00 0x20000000 0x00 0xa0000000>,
> >                        <0x01 0xa0000000 0x01 0x60000000>;
> > 	};
> 
> ... you can see the reserved-regions are described in the normal memory. In
> fact...
> 
> > 
> > 
> > 	reserved-memory {
> > 		#address-cells = <0x02>;
> > 		#size-cells = <0x02>;
> > 		ranges;
> > 
> > 		reserved_mem1 {
> > 			reg = <0x00 0x20000000 0x00 0x00010000>;
> > 			no-map;
> > 		};
> > 
> > 		reserved_mem2 {
> > 			reg = <0x00 0x40000000 0x00 0x20000000>;
> > 			no-map;
> > 		};
> > 
> > 		reserved_mem3 {
> > 			reg = <0x01 0xa0000000 0x00 0x20000000>;
> > 			no-map;
> > 		};
> 
> ... no-map should tell the kernel to not use the memory at all. So I am a
> bit puzzled why it is trying to use it.

No, 'no-map' doesn't mean the Linux kernel doesn't use it, I quote from
the kernel documentation
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml:
'no-map' means the kernel "must not create a virtual mapping of the
region". The reserved memory regions are still "under the control of the
device driver using the region".

> I would suggest to check if somehow Linux doesn't understand the
> reserved-memory nodes we wrote.

Could you confirm the Xen does write reserved memory nodes?  Or Xen
converts the reserved memory nodes to normal memory nodes as I
describe above :)

Thanks,
Leo

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;h=24c9019cc43ca2d4963c3a6f8645939e26056cd0;hb=HEAD#l2476

