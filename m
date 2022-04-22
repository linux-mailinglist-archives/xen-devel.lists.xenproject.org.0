Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5D50C269
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311284.528444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2GW-0003yG-Sa; Fri, 22 Apr 2022 23:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311284.528444; Fri, 22 Apr 2022 23:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2GW-0003vC-O7; Fri, 22 Apr 2022 23:00:40 +0000
Received: by outflank-mailman (input) for mailman id 311284;
 Fri, 22 Apr 2022 23:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2GV-0003le-Hn
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:00:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061d8e3f-c290-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 01:00:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39F7B61372;
 Fri, 22 Apr 2022 23:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABEEC385A4;
 Fri, 22 Apr 2022 23:00:35 +0000 (UTC)
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
X-Inumbo-ID: 061d8e3f-c290-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650668436;
	bh=i3k4Z+wq+0X0ubvvjcLYArt+TLHMdxZUdHM1xhLD/BY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xj7t9bXwLftOK6Wn2xSX5vGqV5VDq4zyr6DxzaGMlOikdAPrXgpep/Xhxocbey161
	 /Yd5kPFmohPRLw2OhkmpBq1AaEq1ZHlyyn+XijNZq4BtcPDq+LqaikTsS8fuhthm/U
	 Lz4xi+GzuHsx5VQ9qQCPSgspu3pWky/VJaqwx4E3VHQYIrwN7slyzw/DKoDci+pVhN
	 OZOBiUwvHSsmSnxeU1NQ5jK4o4sdt2uwZ7HRO2c6jLRvCBqdD/cVTicSPYrzu6XIZg
	 Ag9FRVb5V1cw/AGlUJAnjKOsrr6oanSlaQrtTNCYsfq0ogVQQiH7AumNcbcx/cvA5a
	 I4grC0fhpEQfA==
Date: Fri, 22 Apr 2022 16:00:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Jason Wang <jasowang@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 4/6] dt-bindings: Add xen, dev-domid property description
 for xen-grant DMA ops
In-Reply-To: <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204221527500.915916@ubuntu-linux-20-04-desktop>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com> <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
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

Looks OK to me. Just a couple of grammar improvements below. Aside from
those, I have no further comments.


> ---
> Changes RFC -> V1:
>    - update commit subject/description and text in description
>    - move to devicetree/bindings/arm/
> ---
>  .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> new file mode 100644
> index 00000000..ef0f747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific binding for the virtualized device (e.g. virtio)

NIT: Xen specific binding for virtualized devices (e.g. virtio)


> +maintainers:
> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> +
> +select: true
> +
> +description:
> +  This binding indicates that Xen grant mappings scheme needs to be enabled
> +  for that device and specifies the ID of Xen domain where the corresponding
> +  device (backend) resides. This is needed for the option to restrict memory
> +  access using Xen grant mappings to work.

NIT:

This binding indicates that Xen grant mappings need to be enabled for
the device, and it specifies the ID of the domain where the
corresponding device (backend) resides. The property is required to
restrict memory access using Xen grant mappings.


> +properties:
> +  xen,dev-domid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The domid (domain ID) of the domain where the device (backend) is running.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    virtio_block@3000 {
> +            compatible = "virtio,mmio";
> +            reg = <0x3000 0x100>;
> +            interrupts = <41>;
> +
> +            /* The device is located in Xen domain with ID 1 */
> +            xen,dev-domid = <1>;
> +    };


