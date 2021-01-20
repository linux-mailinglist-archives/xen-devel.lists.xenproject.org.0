Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFB2FD620
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71628.128405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Gjy-0007hE-Gg; Wed, 20 Jan 2021 16:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71628.128405; Wed, 20 Jan 2021 16:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Gjy-0007gp-Dc; Wed, 20 Jan 2021 16:53:54 +0000
Received: by outflank-mailman (input) for mailman id 71628;
 Wed, 20 Jan 2021 16:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgg8=GX=gmail.com=robherring2@srs-us1.protection.inumbo.net>)
 id 1l2Gjw-0007gk-E5
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:53:52 +0000
Received: from mail-ot1-f54.google.com (unknown [209.85.210.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b8bead3-2a68-45fb-92d1-003838e9fdb2;
 Wed, 20 Jan 2021 16:53:51 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id d1so3480326otl.13
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 08:53:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d10sm444480ooh.32.2021.01.20.08.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 08:53:49 -0800 (PST)
Received: (nullmailer pid 328496 invoked by uid 1000);
 Wed, 20 Jan 2021 16:53:48 -0000
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
X-Inumbo-ID: 7b8bead3-2a68-45fb-92d1-003838e9fdb2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Nevn/Hsb1/pSSLD/4PKRZrIOGJGLolaHEVGjwXHh7g=;
        b=S8lPeZq5zy1I0/5JHpEoGKJCepYOyahvrejn1SybiIbBAW4K3b7kZ+USOkXCHTI7EE
         2NZlCYSo/8aXFknSBkbXXZXYiC93h2x/VUw8CdMLf76e7w2BbHF4i+4LiCAf/Rj0LtjW
         NJn5Hd7yFjkkVf5pS/Hqj/ZdHzH2JvIk56GEh9Z61MXnSWjawXyCiNQ0/j0tEitmnjBU
         xhxo4fFzG7/1RhSPrut02FPwcszJOroeNPaV/14LVXyGwE1q+HC0ZEKxboIPKwYm2BiF
         7KtxJntXrzMSnbYHbcOeqLD67qYgEUwpNw+bQgrn1ghU2tliWAQu40PwvC0LomkCOqfb
         yBZA==
X-Gm-Message-State: AOAM5320TbsED4trNncIV3oXyw1kCZI0xg9NSIIh6XUMJTaRVQIpo3dM
	lgIA5g71DRSk3bfFx18n/Q==
X-Google-Smtp-Source: ABdhPJwaG3j9UrY6/UvK8tGFavZ8pchhV25GbY2yn1OpU1TWw5L3kI0PQYj6i0y3Xx2xzLR+yGRYiw==
X-Received: by 2002:a05:6830:20c2:: with SMTP id z2mr7356498otq.322.1611161630884;
        Wed, 20 Jan 2021 08:53:50 -0800 (PST)
Date: Wed, 20 Jan 2021 10:53:48 -0600
From: Rob Herring <robh@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, joro@8bytes.org, will@kernel.org, frowand.list@gmail.com, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com, mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org, gregkh@linuxfoundation.org, saravanak@google.com, rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, rdunlap@infradead.org, dan.j.williams@intel.com, bgolaszewski@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org, tfiga@chromium.org, drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210120165348.GA220770@robh.at.kernel.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-6-tientzu@chromium.org>

On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> Introduce the new compatible string, restricted-dma-pool, for restricted
> DMA. One can specify the address and length of the restricted DMA memory
> region by restricted-dma-pool in the device tree.

If this goes into DT, I think we should be able to use dma-ranges for 
this purpose instead. Normally, 'dma-ranges' is for physical bus 
restrictions, but there's no reason it can't be used for policy or to 
express restrictions the firmware has enabled.

> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index e8d3096d922c..44975e2a1fd2 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - restricted-dma-pool: This indicates a region of memory meant to be
> +          used as a pool of restricted DMA buffers for a set of devices. The
> +          memory region would be the only region accessible to those devices.
> +          When using this, the no-map and reusable properties must not be set,
> +          so the operating system can create a virtual mapping that will be used
> +          for synchronization. The main purpose for restricted DMA is to
> +          mitigate the lack of DMA access control on systems without an IOMMU,
> +          which could result in the DMA accessing the system memory at
> +          unexpected times and/or unexpected addresses, possibly leading to data
> +          leakage or corruption. The feature on its own provides a basic level
> +          of protection against the DMA overwriting buffer contents at
> +          unexpected times. However, to protect against general data leakage and
> +          system memory corruption, the system needs to provide way to restrict
> +          the DMA to a predefined memory region.
>          - vendor specific string in the form <vendor>,[<device>-]<usage>
>  no-map (optional) - empty property
>      - Indicates the operating system must not create a virtual mapping
> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  			compatible = "acme,multimedia-memory";
>  			reg = <0x77000000 0x4000000>;
>  		};
> +
> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
> +			compatible = "restricted-dma-pool";
> +			reg = <0x50000000 0x400000>;
> +		};
>  	};
>  
>  	/* ... */
> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  		memory-region = <&multimedia_reserved>;
>  		/* ... */
>  	};
> +
> +	pcie_device: pcie_device@0,0 {
> +		memory-region = <&restricted_dma_mem_reserved>;

PCI hosts often have inbound window configurations that limit the 
address range and translate PCI to bus addresses. Those windows happen 
to be configured by dma-ranges. In any case, wouldn't you want to put 
the configuration in the PCI host node? Is there a usecase of 
restricting one PCIe device and not another? 

Rob

