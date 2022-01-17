Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EAF490B66
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 16:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258192.444385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9TyN-0000zw-E3; Mon, 17 Jan 2022 15:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258192.444385; Mon, 17 Jan 2022 15:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9TyN-0000wk-Ai; Mon, 17 Jan 2022 15:31:07 +0000
Received: by outflank-mailman (input) for mailman id 258192;
 Mon, 17 Jan 2022 15:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RGs1=SB=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1n9TyL-0000vr-GD
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 15:31:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 79898509-77aa-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 16:31:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F6561FB;
 Mon, 17 Jan 2022 07:31:00 -0800 (PST)
Received: from [10.57.67.190] (unknown [10.57.67.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4556D3F766;
 Mon, 17 Jan 2022 07:30:59 -0800 (PST)
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
X-Inumbo-ID: 79898509-77aa-11ec-a115-11989b9578b4
Message-ID: <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
Date: Mon, 17 Jan 2022 15:30:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
 <20220117123251.140867-2-Sergiy_Kibrik@epam.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220117123251.140867-2-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-01-17 12:32, Sergiy Kibrik wrote:
> In IOMMU-capable system hypervisor usually takes over IOMMU control.
> Generally guest domains don't need to care about IOMMU management and take any
> extra actions. Yet in some cases a knowledge about which device is protected
> may be useful for privileged domain.
> 
> In compliance with iommu bindings this can be achieved with device-level
> iommus property specified with dummy Xen iommu device.

This could break Linux guests, since depending on the deferred probe 
timeout setting it could lead to drivers never probing because the 
"IOMMU" never becomes available.

Unless you intend to expose actual paravirtualised IOMMU translation 
functionality to guests (in which case virtio-iommu would be highly 
preferable anyway), I don't think this is the right approach. If there's 
no better alternative to using DT to communicate Xen-specific policy, 
then at least it should logically be via a Xen-specific DT property.

Thanks,
Robin.

> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   Documentation/devicetree/bindings/arm/xen.txt | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
> index db5c56db30ec..98efa95c0d1b 100644
> --- a/Documentation/devicetree/bindings/arm/xen.txt
> +++ b/Documentation/devicetree/bindings/arm/xen.txt
> @@ -58,3 +58,29 @@ Documentation/arm/uefi.rst, which are provided by the regular UEFI stub. However
>   they differ because they are provided by the Xen hypervisor, together with a set
>   of UEFI runtime services implemented via hypercalls, see
>   http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,platform.h.html.
> +
> +* XEN IOMMU device
> +
> +In compliance with iommu bindings Xen virtual IOMMU device node represents
> +hypervisor-managed IOMMU [1]. Platform devices specified as IOMMU masters of
> +this xen-iommu device are protected by hypervisor-managed platform IOMMU.
> +
> +Required properties:
> +
> +- compatible:	Should be "xen,iommu-el2-v1"
> +- #iommu-cells: must be 0
> +
> +Example:
> +
> +xen-iommu {
> +	compatible = "xen,iommu-el2-v1";
> +	#iommu-cells = <0>;
> +};
> +
> +video@fe001000 {
> +	...
> +	/* this platform device is IOMMU-protected by hypervisor */
> +	iommus = <&xen-iommu 0x0>;
> +};
> +
> +[1] Documentation/devicetree/bindings/iommu/iommu.txt

