Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728C53DEB8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 00:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342130.567188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxz0B-00013Q-Us; Sun, 05 Jun 2022 22:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342130.567188; Sun, 05 Jun 2022 22:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxz0B-00010b-S4; Sun, 05 Jun 2022 22:45:43 +0000
Received: by outflank-mailman (input) for mailman id 342130;
 Sun, 05 Jun 2022 22:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8Eh=WM=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nxz09-00010V-E2
 for xen-devel@lists.xenproject.org; Sun, 05 Jun 2022 22:45:41 +0000
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c20dc5-e521-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 00:45:38 +0200 (CEST)
Received: by mail-qv1-f46.google.com with SMTP id b17so772480qvz.0
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jun 2022 15:45:38 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:1bdb:2e61:f12:452:5315:9c7e])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a37dc86000000b0069fc13ce244sm10341437qki.117.2022.06.05.15.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 15:45:36 -0700 (PDT)
Received: (nullmailer pid 3667844 invoked by uid 1000);
 Sun, 05 Jun 2022 22:45:33 -0000
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
X-Inumbo-ID: 37c20dc5-e521-11ec-b605-df0040e90b76
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uDzznG00WmBRTYCBcArlD1mf1zVfk2p9nd9xHJn3CVw=;
        b=jzhRNB8WyHLNw1/C3wBunaI05YBqGijRgqe+bk4w4z5d3y0K9XEKoiS/4frChLXtrL
         mE2eD1GhAAMwnj530igAyhw42IPuP0wIEfgGM5qGaYv3aOx6RSe77u0wwDTxM7QliUb6
         +cX86Kh/6do5EgXiKXUJHoXeZrqR4fH4HyvGr6eJXODRX9IQSfMoK9uNTKGWv/93H9Ur
         Gx6E08E09ogvGlql+oqoDGTsgLWKtxR3ZKaw9vFjkTLXdilP6+rfJEwKV5FOptttkIN3
         sXTBsiMdijzXne84AjH3T1V3vf2R34SVHDN7Eg5xlCxBwEndFY+oCpCAUNbbZAfEAZ2u
         hTmA==
X-Gm-Message-State: AOAM531YAddF4PjY1vNIjMUADZtExtrnpMNwtJ1li26MKsYCWlmxPkM8
	aw4Rsuab9zne0mFdnCb3kw==
X-Google-Smtp-Source: ABdhPJwmsDYIVR7qLkG6UWB/x8H/AgliTU6o4B+wWC9F21jxx0e09sjuNDCoG74Zm/3g90Nz9x+0LQ==
X-Received: by 2002:ad4:5447:0:b0:461:d7a7:f0ec with SMTP id h7-20020ad45447000000b00461d7a7f0ecmr70549704qvt.21.1654469136911;
        Sun, 05 Jun 2022 15:45:36 -0700 (PDT)
Date: Sun, 5 Jun 2022 17:45:33 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>, "Michael S. Tsirkin" <mst@redhat.com>, Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, Juergen Gross <jgross@suse.com>, Arnd Bergmann <arnd@arndb.de>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V4 5/8] dt-bindings: Add xen,grant-dma IOMMU description
 for xen-grant DMA ops
Message-ID: <20220605224533.GA3667788-robh@kernel.org>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
 <1654197833-25362-6-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654197833-25362-6-git-send-email-olekstysh@gmail.com>

On Thu, 02 Jun 2022 22:23:50 +0300, Oleksandr Tyshchenko wrote:
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
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
> 
> Changes V3 -> V4:
>    - add Stefano's R-b
>    - remove underscore in iommu node name
>    - remove consumer example virtio@3000
>    - update text for two descriptions
> ---
>  .../devicetree/bindings/iommu/xen,grant-dma.yaml   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

