Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572B529605
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 02:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330381.553742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nql49-0005DC-Ds; Tue, 17 May 2022 00:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330381.553742; Tue, 17 May 2022 00:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nql49-0005A2-BC; Tue, 17 May 2022 00:27:57 +0000
Received: by outflank-mailman (input) for mailman id 330381;
 Tue, 17 May 2022 00:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp4k=VZ=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nql47-00059t-5w
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 00:27:55 +0000
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 306c9416-d578-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 02:27:53 +0200 (CEST)
Received: by mail-oi1-f170.google.com with SMTP id r1so20631102oie.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 May 2022 17:27:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t129-20020aca5f87000000b00328a1be5c3asm4429079oib.25.2022.05.16.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 17:27:51 -0700 (PDT)
Received: (nullmailer pid 3649667 invoked by uid 1000);
 Tue, 17 May 2022 00:27:50 -0000
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
X-Inumbo-ID: 306c9416-d578-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AjIgoIzuU0qN1OneU4nydD9785iHKfz2mgfXgmyiwBA=;
        b=qaKOn0iA/kASTeiB0sky27ryW23xV0uhNiqCVy4inMw2NyRsmOd2qAsd+Vi8+eerjz
         Ll+pvf9ihWjP5lgVEH2zD0aaxWV/9kf+lSQSMqwkIuHN9tNZAK9KpMY7E9JKoCzOLIiV
         vDqp1hrs/PUkKZaDFXGeX1xxxTNBFh+P9S04+jIKcdnZjyAAEKhH1k9v+5hD8X8emMZe
         YeWx2CQpQ3wQWaUtihr+RsZ21uAZOrjqUYZd8IEMOXjNdci2bA0cMiJzpIZb1QqCKJXU
         KRvG3YtgrnNFEBQzvhVw1Ag06EpsUT8bXa/hkfJkgejo9KsJ7mbRw/zXInMDl+qWMYL2
         A/WA==
X-Gm-Message-State: AOAM532s6dhUG8LC1qc6kHFgG0zHAJ8Y3ak8lO8o1YVj7SbY3Ip5YUw3
	PTSdhabjAtaPcYtAwgmmxw==
X-Google-Smtp-Source: ABdhPJxT0vsAGu7gI2XEFSb7VXPXh7GjkIgGl9JGJgCiHApDSgmjmwIdM+VP2LsLjTK10XA7StATnw==
X-Received: by 2002:a05:6808:1496:b0:326:e2de:63ec with SMTP id e22-20020a056808149600b00326e2de63ecmr9397520oiw.271.1652747272138;
        Mon, 16 May 2022 17:27:52 -0700 (PDT)
Date: Mon, 16 May 2022 19:27:50 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <20220517002750.GA3638680-robh@kernel.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651947548-4055-6-git-send-email-olekstysh@gmail.com>

On Sat, May 07, 2022 at 09:19:06PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Introduce Xen specific binding for the virtualized device (e.g. virtio)
> to be used by Xen grant DMA-mapping layer in the subsequent commit.
> 
> This binding indicates that Xen grant mappings scheme needs to be
> enabled for the device which DT node contains that property and specifies
> the ID of Xen domain where the corresponding backend resides. The ID
> (domid) is used as an argument to the grant mapping APIs.
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
> ---
>  .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/virtio/mmio.yaml |  7 ++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> new file mode 100644
> index 00000000..750e89e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific binding for virtualized devices (e.g. virtio)
> +
> +maintainers:
> +  - Stefano Stabellini <sstabellini@kernel.org>
> +
> +select: true

Omit. No need to apply this on every single node.

> +
> +description:
> +  This binding indicates that Xen grant mappings need to be enabled for
> +  the device, and it specifies the ID of the domain where the corresponding
> +  device (backend) resides. The property is required to restrict memory
> +  access using Xen grant mappings.
> +
> +properties:
> +  xen,dev-domid:

I kind of think 'dev' is redundant. Is there another kind of domid 
possible? Maybe xen,backend-domid or just xen,domid? I don't know Xen 
too well, so ultimately up to you all.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The domid (domain ID) of the domain where the device (backend) is running.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    virtio@3000 {
> +            compatible = "virtio,mmio";
> +            reg = <0x3000 0x100>;
> +            interrupts = <41>;
> +
> +            /* The device is located in Xen domain with ID 1 */
> +            xen,dev-domid = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
> index 10c22b5..29a0932 100644
> --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
> +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
> @@ -13,6 +13,9 @@ description:
>    See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
>    more details.
>  
> +allOf:
> +  - $ref: /schemas/arm/xen,dev-domid.yaml#
> +
>  properties:
>    compatible:
>      const: virtio,mmio
> @@ -33,6 +36,10 @@ properties:
>      description: Required for devices making accesses thru an IOMMU.
>      maxItems: 1
>  
> +  xen,dev-domid:
> +    description: Required when Xen grant mappings need to be enabled for device.
> +    $ref: /schemas/types.yaml#/definitions/uint32

No need to define the type again nor describe it again.

Instead, just change additionalProperties to unevaluateProperties in 
this doc. The diff is the latter takes $ref's into account.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.7.4
> 
> 

