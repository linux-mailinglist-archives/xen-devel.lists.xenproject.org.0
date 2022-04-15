Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B86502702
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 10:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305638.520713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfHZo-0001ZC-RR; Fri, 15 Apr 2022 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305638.520713; Fri, 15 Apr 2022 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfHZo-0001Wg-OP; Fri, 15 Apr 2022 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 305638;
 Fri, 15 Apr 2022 08:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CGMI=UZ=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1nfHZn-0001Wa-E8
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 08:45:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a115076-bc98-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 10:45:09 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-ZzN6tgpTPbeI8GbBdd-A9Q-1; Fri, 15 Apr 2022 04:45:06 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0038cfe6edf3fso5800954wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 01:45:05 -0700 (PDT)
Received: from redhat.com ([2.53.138.98]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d64c8000000b0020784359295sm5084468wri.54.2022.04.15.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 01:45:02 -0700 (PDT)
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
X-Inumbo-ID: 5a115076-bc98-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650012307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbLS45MxOVAnr1j0DEMaqGL/RKjN2qTV3wn5wivIOzo=;
	b=jN4PcIbHd31R62NfrM2xBUJWQ9x9ThFw8TpaH2YteOoe5B/KPx9tKKQXq4jJT835xJazxv
	uToWwYyN/Si8PvszwPsFaw2cV1kXZhIKpLq/tt/l9x3w/lrqOMsoMZBiGXj1n92escJ/5p
	yCD/nJuFHqkl24I1FmEnF9C0k1D9aes=
X-MC-Unique: ZzN6tgpTPbeI8GbBdd-A9Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UbLS45MxOVAnr1j0DEMaqGL/RKjN2qTV3wn5wivIOzo=;
        b=YInDRGrBmHX4rWyLO1yrtFRcogiyDLlQSeyjJnCgsWK8HvE7HmzeEl/EAH8ExvPBcx
         wA1jev6QICXREBa/8nM1iP2SW/t7KpTizwE87kO+g/j4pQ5P4y91O8vgXa6IcrnNe+Vn
         /80VKwn+Kjq+iHn0NPE2z05KywZ2oyTzzOTtVcB+uLUSpLPPo7x6E1v4aPHCQiUlc6bN
         ntyx9wgxpM7mi449kJJLGkeWWrUyQpdlWWu0POjkkrgS+0coz4uz8dhn7Uo7mq3pjzqy
         zM9dC4GGvPzZjJu7WFCl8KuymISmOP0z2zwrfsdD7HhC0XYnUCFfR70Er+TPfJ6fkZpD
         V6Sw==
X-Gm-Message-State: AOAM532IwenAl6VgMDABGf1l6AGvISdVGe7wV96EBlzfeBrtDntLJH7z
	fS5ejYZkQgTj4M9Js3xN410A+vsy8QjK3dWDuYy0/3fk6kymfzh/m8ilV1LjByOHAvqOj6fJVlZ
	vrimStjYj6hpaut7CCPULz8SpJaU=
X-Received: by 2002:a05:600c:4f88:b0:391:e34e:ca66 with SMTP id n8-20020a05600c4f8800b00391e34eca66mr768134wmq.16.1650012303800;
        Fri, 15 Apr 2022 01:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtZ3CsHMRHFsioNGpLaugIquRbj8GlmtB0g6ZbYpJjZi2MjwNik9eBG9L3OBpQkHXDtDgk7g==
X-Received: by 2002:a05:600c:4f88:b0:391:e34e:ca66 with SMTP id n8-20020a05600c4f8800b00391e34eca66mr768102wmq.16.1650012303495;
        Fri, 15 Apr 2022 01:45:03 -0700 (PDT)
Date: Fri, 15 Apr 2022 04:44:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH 0/6] virtio: Solution to restrict memory access under
 Xen using xen-virtio DMA ops layer
Message-ID: <20220415044225-mutt-send-email-mst@kernel.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 14, 2022 at 10:19:27PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Hello all.
> 
> The purpose of this RFC patch series is to add support for restricting memory access under Xen using specific
> grant table based DMA ops layer. Patch series is based on Juergen Gross’ initial work [1] which implies using
> grant references instead of raw guest physical addresses (GPA) for the virtio communications (some kind of
> the software IOMMU).
> 
> The high level idea is to create new Xen’s grant table based DMA ops layer for the guest Linux whose main
> purpose is to provide a special 64-bit DMA address which is formed by using the grant reference (for a page
> to be shared with the backend) with offset and setting the highest address bit (this is for the backend to
> be able to distinguish grant ref based DMA address from normal GPA). For this to work we need the ability
> to allocate contiguous (consecutive) grant references for multi-page allocations. And the backend then needs
> to offer VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 feature bits (it must support virtio-mmio modern
> transport for 64-bit addresses in the virtqueue).

I'm not enough of a xen expert to review this, and I didn't get
all patches, but I'm very happy to see that approach being
taken. VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 are
exactly the way to declare not all of memory is accessible.
Thanks!

> Xen's grant mapping mechanism is the secure and safe solution to share pages between domains which proven
> to work and works for years (in the context of traditional Xen PV drivers for example). So far, the foreign
> mapping is used for the virtio backend to map and access guest memory. With the foreign mapping, the backend
> is able to map arbitrary pages from the guest memory (or even from Dom0 memory). And as the result, the malicious
> backend which runs in a non-trusted domain can take advantage of this. Instead, with the grant mapping
> the backend is only allowed to map pages which were explicitly granted by the guest before and nothing else. 
> According to the discussions in various mainline threads this solution would likely be welcome because it
> perfectly fits in the security model Xen provides. 
> 
> What is more, the grant table based solution requires zero changes to the Xen hypervisor itself at least
> with virtio-mmio and DT (in comparison, for example, with "foreign mapping + virtio-iommu" solution which would
> require the whole new complex emulator in hypervisor in addition to new functionality/hypercall to pass IOVA
> from the virtio backend running elsewhere to the hypervisor and translate it to the GPA before mapping into
> P2M or denying the foreign mapping request if no corresponding IOVA-GPA mapping present in the IOMMU page table
> for that particular device). We only need to update toolstack to insert a new "xen,dev-domid" property to
> the virtio-mmio device node when creating a guest device-tree (this is an indicator for the guest to use grants
> and the ID of Xen domain where the corresponding backend resides, it is used as an argument to the grant mapping
> APIs). It worth mentioning that toolstack patch is based on non  upstreamed yet “Virtio support for toolstack
> on Arm” series which is on review now [2].
> 
> Please note the following:
> - Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
>   feature on Arm the following options should be set:
>   CONFIG_XEN_VIRTIO = y
>   CONFIG_XEN_HVM_VIRTIO_GRANT = y
> - Some callbacks in xen-virtio DMA ops layer (map_sg/unmap_sg, etc) are not implemented yet as they are not
>   needed/used in the first prototype
> 
> Patch series is rebased on Linux 5.18-rc2 tag and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64)
> with standalone userspace (non-Qemu) virtio-mmio based virtio-disk backend running in Driver domain and Linux
> guest running on existing virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
> use-cases work properly. I have also tested other use-cases such as assigning several virtio block devices
> or a mix of virtio and Xen PV block devices to the guest. 
> 
> 1. Xen changes located at (last patch):
> https://github.com/otyshchenko1/xen/commits/libxl_virtio_next
> 2. Linux changes located at:
> https://github.com/otyshchenko1/linux/commits/virtio_grant5
> 3. virtio-disk changes located at:
> https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant
> 
> Any feedback/help would be highly appreciated.
> 
> [1] https://www.youtube.com/watch?v=IrlEdaIUDPk
> [2] https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
> 
> Juergen Gross (2):
>   xen/grants: support allocating consecutive grants
>   virtio: add option to restrict memory access under Xen
> 
> Oleksandr Tyshchenko (4):
>   dt-bindings: xen: Add xen,dev-domid property description for
>     xen-virtio layer
>   virtio: Various updates to xen-virtio DMA ops layer
>   arm/xen: Introduce xen_setup_dma_ops()
>   arm/xen: Assign xen-virtio DMA ops for virtio devices in Xen guests
> 
>  .../devicetree/bindings/virtio/xen,dev-domid.yaml  |  39 +++
>  arch/arm/include/asm/xen/xen-ops.h                 |   1 +
>  arch/arm/mm/dma-mapping.c                          |   5 +-
>  arch/arm/xen/enlighten.c                           |  11 +
>  arch/arm64/include/asm/xen/xen-ops.h               |   1 +
>  arch/arm64/mm/dma-mapping.c                        |   5 +-
>  arch/x86/mm/init.c                                 |  15 +
>  arch/x86/mm/mem_encrypt.c                          |   5 -
>  arch/x86/xen/Kconfig                               |   9 +
>  drivers/xen/Kconfig                                |  20 ++
>  drivers/xen/Makefile                               |   1 +
>  drivers/xen/grant-table.c                          | 238 +++++++++++++--
>  drivers/xen/xen-virtio.c                           | 335 +++++++++++++++++++++
>  include/xen/arm/xen-ops.h                          |  20 ++
>  include/xen/grant_table.h                          |   4 +
>  include/xen/xen-ops.h                              |  13 +
>  16 files changed, 679 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
>  create mode 100644 arch/arm/include/asm/xen/xen-ops.h
>  create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
>  create mode 100644 drivers/xen/xen-virtio.c
>  create mode 100644 include/xen/arm/xen-ops.h
> 
> -- 
> 2.7.4


