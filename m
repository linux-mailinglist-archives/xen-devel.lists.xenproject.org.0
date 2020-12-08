Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB82D28D9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 11:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47306.83765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaFG-0004NV-BI; Tue, 08 Dec 2020 10:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47306.83765; Tue, 08 Dec 2020 10:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaFG-0004N9-86; Tue, 08 Dec 2020 10:29:22 +0000
Received: by outflank-mailman (input) for mailman id 47306;
 Tue, 08 Dec 2020 10:29:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CW+N=FM=euphon.net=fam@srs-us1.protection.inumbo.net>)
 id 1kmaFE-0004N4-3v
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 10:29:20 +0000
Received: from sender2-of-o52.zoho.com.cn (unknown [163.53.93.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f79e7af-906e-49d7-9ad4-346c4f7f5d82;
 Tue, 08 Dec 2020 10:29:18 +0000 (UTC)
Received: from localhost (ec2-52-56-101-76.eu-west-2.compute.amazonaws.com
 [52.56.101.76]) by mx.zoho.com.cn
 with SMTPS id 1607423351294598.910321877991;
 Tue, 8 Dec 2020 18:29:11 +0800 (CST)
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
X-Inumbo-ID: 3f79e7af-906e-49d7-9ad4-346c4f7f5d82
ARC-Seal: i=1; a=rsa-sha256; t=1607423353; cv=none; 
	d=zoho.com.cn; s=zohoarc; 
	b=VbR5uEP+c1d1++89PyB3QJYiIPneJ9JqLhFWx4C2IBkB9awpVXlbE5g2IYDEMm0XgcuPE0cL2oBlMCb2eCdHti6Jir0nU4X3+oSzldniBVOSmjJWZJFFMzzoEGMvtNj1DwoC/H9cS00fjNBMkXPyXAOl3nrJTY8eztBVkOeTna4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
	t=1607423353; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=f5tEVL1Y8nWe5Y61mdoZX5lRcGa2W3xGaLAOqlIAHbA=; 
	b=OrJJmUml/hqDrbLGU52AJXs85ahagdbthmumC3VHFoDkLLiAWzhBwqbYaVtBfcUvD8B4zAKDCFtY3RGO+Y0JSf1n1w+Ba/AlMREJQCp5Iq9v0wv8Q6EEuvu6w9/6Y6M+e9slGw5BuPOMt7sPP3a9hzplIul7kO4wmpTgu5rPepA=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
	dkim=pass  header.i=euphon.net;
	spf=pass  smtp.mailfrom=fam@euphon.net;
	dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1607423353;
	s=zoho; d=euphon.net; i=fam@euphon.net;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=f5tEVL1Y8nWe5Y61mdoZX5lRcGa2W3xGaLAOqlIAHbA=;
	b=JlvvvwSYtZOwce3C2/BeaKJXHJmluCvVP86IuykHknPcKQpAZccDSNSOh27HljFw
	Wi2IuT3v/NWFG//Yqz5zMBbFEKZf+8nJaYBGvfwSzSLqxy8zETzzE8GU3QvvAu2iWvA
	bRAlAZ8g7iR1U93kT/d2GiLRbihPa9ZvdJiDdj7w=
Date: Tue, 8 Dec 2020 10:29:05 +0000
From: Fam Zheng <fam@euphon.net>
To: Penny Zheng <penny.zheng@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	Bertrand.Marquis@arm.com, Kaly.Xin@arm.com, Wei.Chen@arm.com,
	nd@arm.com
Subject: Re: [RFC] design: design doc for 1:1 direct-map
Message-ID: <20201208102905.GB118611@dev>
References: <20201208052113.1641514-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208052113.1641514-1-penny.zheng@arm.com>
X-ZohoCNMailClient: External

On 2020-12-08 13:21, Penny Zheng wrote:
> +The document is an early draft for direct-map memory map
> +(`guest physical == physical`) of domUs. And right now, it constrains to ARM
> +architecture.

I'm also working on direct-map DomU on x86, so let's coordinate and
cover both arches.

> +
> +It aims to describe why and how the guest would be created as direct-map domain.
> +
> +This document is partly based on Stefano Stabellini's patch serie v1:
> +[direct-map DomUs](
> +https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).
> +
> +This is a first draft and some questions are still unanswered. When this is the
> +case, the text shall contain XXX.
> +
> +# Introduction
> +
> +## Background
> +
> +Cases where domU needs direct-map memory map:
> +
> +  * IOMMU not present in the system.
> +  * IOMMU disabled, since it doesn't cover a specific device.
> +  * IOMMU disabled, since it doesn't have enough bandwidth.
> +  * IOMMU disabled, since it adds too much latency.
> +
> +*WARNING:
> +Users should be careful that it is not always secure to assign a device without
> +IOMMU/SMMU protection.
> +Users must be aware of this risk, that guests having access to hardware with
> +DMA capacity must be trusted, or it could use the DMA engine to access any
> +other memory area.
> +Guests could use additional security hardware component like NOC, System MPU
> +to protect the memory.
> +
> +## Design
> +
> +The implementation may cover following aspects:
> +
> +### Native Address and IRQ numbers for GIC and UART(vPL011)
> +
> +Today, fixed addresses and IRQ numbers are used to map GIC and UART(vPL011)
> +in DomUs. And it may cause potential clash on direct-map domains.
> +So, Using native addresses and irq numbers for GIC, UART(vPL011), in
> +direct-map domains is necessary.
> +e.g.
> +For the virtual interrupt of vPL011: instead of always using `GUEST_VPL011_SPI`,
> +try to reuse the physical SPI number if possible.
> +
> +### Device tree option: `direct_map`
> +
> +Introduce a new device tree option `direct_map` for direct-map domains.
> +Then, when users try to allocate one direct-map domain(except DOM0),
> +`direct-map` property needs to be added under the appropriate `/chosen/domUx`.
> +
> +
> +            chosen {
> +                ...
> +                domU1 {
> +                    compatible = "xen, domain";
> +                    #address-cells = <0x2>;
> +                    #size-cells = <0x1>;
> +                    direct-map;
> +                    ...
> +                };
> +                ...
> +            };
> +
> +If users are using imagebuilder, they can add to boot.source something like the
> +following:
> +
> +    fdt set /chosen/domU1 direct-map
> +
> +Users could also use `xl` to create direct-map domains, just use the following
> +config option: `direct-map=true`
> +
> +### direct-map guest memory allocation
> +
> +Func `allocate_memory_direct_map` is based on `allocate_memory_11`, and shall
> +be refined to allocate memory for all direct-map domains, including DOM0.
> +Roughly speaking, firstly, it tries to allocate arbitrary memory chunk of
> +requested size from domain sub-allocator(`alloc_domheap_pages`). If fail,
> +split the chunk into halves, and re-try, until it succeed or bail out with the
> +smallest chunk size.
> +Then, `insert_11_bank` shall insert above allocated pages into a memory bank,
> +which are ordered by address, and also set up guest P2M mapping(
> +`guest_physmap_add_page`) to ensure `gfn == mfn`.

A high level comment from x86 PoV: in the mfn addr space, we want to
explicitly reserve range for direct-map. This ensures Xen or Dom0 will
leave the pages for DomU at boot time, since as Julien mentioned, x86
machines have fixed mem layout starting from 0, so the corresponding
pages mustn't go into xenheap/domheap in the first place.

IOW x86 depends on some mechanism very similar to what badpage= does.
But I wouldn't overload/abuse the parameter for direct-map. Maybe
introduce a new option, like "identpage=".

Fam

