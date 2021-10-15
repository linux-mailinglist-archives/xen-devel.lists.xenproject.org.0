Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF442F653
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210759.367744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOZt-0007ia-Bi; Fri, 15 Oct 2021 14:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210759.367744; Fri, 15 Oct 2021 14:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOZt-0007fb-8e; Fri, 15 Oct 2021 14:52:57 +0000
Received: by outflank-mailman (input) for mailman id 210759;
 Fri, 15 Oct 2021 14:52:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbOZr-0007fV-QJ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:52:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOZq-0006k4-NW; Fri, 15 Oct 2021 14:52:54 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOZq-0004wv-GF; Fri, 15 Oct 2021 14:52:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gD1HMW7XLDLxdf9QHfhL6CGsenlzknnMDUpECNWAFzI=; b=F4qf+3qYyBJvcQatLjcmygoVYS
	GBm0zL2q/slTRYkRrNYs8+AGxSwMv21GqYDTZGJoQ0I0w8i67Dt6QDnVmttJaqFQeqwBZW8Nkta3t
	Jd9aNya2L8UuN2apCl+CEkxIFiqYkyJmxno4lX7UnGBzJIy6NCjrr08LPdxxMftBdR+4=;
Message-ID: <0204f92a-4637-d3cd-5420-979e9c03f237@xen.org>
Date: Fri, 15 Oct 2021 15:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 15/10/2021 14:59, Bertrand Marquis wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
> 
> Note that currently we are using num_pcidevs instead of
> c_info->passthrough to decide whether to create a vPCI DT node.
> This will be insufficient if and when ARM does PCI hotplug.
> Add this note inside libxl_create.c where c_info->passthrough
> is set.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

I believe you need to add your signed-off-by here as you sent the new 
version on xen-devel.

With one remark below (not to be handled for 4.16):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> +static int make_vpci_node(libxl__gc *gc, void *fdt,
> +                          const struct arch_info *ainfo,
> +                          struct xc_dom_image *dom)
> +{
> +    int res;
> +    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
> +    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
> +    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
> +
> +    res = fdt_begin_node(fdt, name);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "device_type", "pci");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
> +    if (res) return res;
> +
> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +        GUEST_ROOT_SIZE_CELLS, 2,
> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SIZE,
> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,

 From my understanding, the prefetch memory region is optional. Is it 
going to be a problem to expose one for the vCPI when the host PCI 
hostbridge may not support it?

Cheers,

-- 
Julien Grall

