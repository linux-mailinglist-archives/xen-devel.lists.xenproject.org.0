Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF4539A65
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 02:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340095.565039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCKE-0007ML-DK; Wed, 01 Jun 2022 00:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340095.565039; Wed, 01 Jun 2022 00:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCKE-0007J1-8V; Wed, 01 Jun 2022 00:35:02 +0000
Received: by outflank-mailman (input) for mailman id 340095;
 Wed, 01 Jun 2022 00:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwCKC-0007Iq-Cn
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 00:35:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa016be4-e142-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 02:34:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DF01614B3;
 Wed,  1 Jun 2022 00:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44A2C385A9;
 Wed,  1 Jun 2022 00:34:55 +0000 (UTC)
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
X-Inumbo-ID: aa016be4-e142-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654043696;
	bh=AGLxz/xreC1/Xeaa2Sjt8QqZXIylnuwZjPxvPygrygg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DfuMHCjbgseVb9ElRvU6+fEgDpIv3ulhOxsoIPOQDdh5GUh8KjIJ28oGLRaKeGvWL
	 0OGOBkYVHKvSBhLuz9k1LfSVAr5J41JWFoFQ4TABVCeTglNoTjSMmz8FJQ49sdckLg
	 qsGKa+Yr+MoyMmAdmNIWUZGeNcE1QpV9WDLAqZFgKgw12wg03tSKY2yAzfzVh+OlIr
	 IhSeKnYLMf2s3ZC0XoXksZyr4Mb/ha+g8gPhA0eQAKOPF5QkoCt5VR2mG2iYj77PY2
	 +OIvjXfirEI3JrU/2GAu0wBIXEs9XmzEmlNrwfNOn0Ao2FA84oEYKiBszft0wz/igv
	 pc1IcOOf15l3Q==
Date: Tue, 31 May 2022 17:34:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    iommu@lists.linux-foundation.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
    Will Deacon <will@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 5/8] dt-bindings: Add xen,grant-dma IOMMU description
 for xen-grant DMA ops
In-Reply-To: <1653944417-17168-6-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205311726000.1905099@ubuntu-linux-20-04-desktop>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com> <1653944417-17168-6-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this binding is to communicate Xen specific
> information using generic IOMMU device tree bindings (which is
> a good fit here) rather than introducing a custom property.
> 
> Introduce Xen specific IOMMU for the virtualized device (e.g. virtio)
> to be used by Xen grant DMA-mapping layer in the subsequent commit.
> 
> The reference to Xen specific IOMMU node using "iommus" property
> indicates that Xen grant mappings need to be enabled for the device,
> and it specifies the ID of the domain where the corresponding backend
> resides. The domid (domain ID) is used as an argument to the Xen grant
> mapping APIs.
> 
> This is needed for the option to restrict memory access using Xen grant
> mappings to work which primary goal is to enable using virtio devices
> in Xen guests.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V1:
>    - update commit subject/description and text in description
>    - move to devicetree/bindings/arm/
> 
> Changes V1 -> V2:
>    - update text in description
>    - change the maintainer of the binding
>    - fix validation issue
>    - reference xen,dev-domid.yaml schema from virtio/mmio.yaml
> 
> Change V2 -> V3:
>    - Stefano already gave his Reviewed-by, I dropped it due to the changes (significant)
>    - use generic IOMMU device tree bindings instead of custom property
>      "xen,dev-domid"
>    - change commit subject and description, was
>      "dt-bindings: Add xen,dev-domid property description for xen-grant DMA ops"
> ---
>  .../devicetree/bindings/iommu/xen,grant-dma.yaml   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> new file mode 100644
> index 00000000..ab5765c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/xen,grant-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific IOMMU for virtualized devices (e.g. virtio)
> +
> +maintainers:
> +  - Stefano Stabellini <sstabellini@kernel.org>
> +
> +description:
> +  The reference to Xen specific IOMMU node using "iommus" property indicates
> +  that Xen grant mappings need to be enabled for the device, and it specifies
> +  the ID of the domain where the corresponding backend resides.
> +  The binding is required to restrict memory access using Xen grant mappings.

I think this is OK and in line with the discussion we had on the list. I
propose the following wording instead:

"""
The Xen IOMMU represents the Xen grant table interface. Grant mappings
are to be used with devices connected to the Xen IOMMU using the
"iommus" property, which also specifies the ID of the backend domain.
The binding is required to restrict memory access using Xen grant
mappings.
"""


> +properties:
> +  compatible:
> +    const: xen,grant-dma
> +
> +  '#iommu-cells':
> +    const: 1
> +    description:
> +      Xen specific IOMMU is multiple-master IOMMU device.
> +      The single cell describes the domid (domain ID) of the domain where
> +      the backend is running.

Here I would say:

"""
The single cell is the domid (domain ID) of the domain where the backend
is running.
"""

With the two wording improvements:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +required:
> +  - compatible
> +  - "#iommu-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    xen_iommu {
> +        compatible = "xen,grant-dma";
> +        #iommu-cells = <1>;
> +    };
> +
> +    virtio@3000 {
> +        compatible = "virtio,mmio";
> +        reg = <0x3000 0x100>;
> +        interrupts = <41>;
> +
> +        /* The backend is located in Xen domain with ID 1 */
> +        iommus = <&xen_iommu 1>;
> +    };
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

