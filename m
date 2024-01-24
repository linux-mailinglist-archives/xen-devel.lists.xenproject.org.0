Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081D839DF3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 02:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670651.1043575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRkH-000419-4C; Wed, 24 Jan 2024 01:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670651.1043575; Wed, 24 Jan 2024 01:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRkH-0003za-04; Wed, 24 Jan 2024 01:08:01 +0000
Received: by outflank-mailman (input) for mailman id 670651;
 Wed, 24 Jan 2024 01:08:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnut=JC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSRkG-0003zU-6J
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 01:08:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00397f00-ba55-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 02:07:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CCD4CE309D;
 Wed, 24 Jan 2024 01:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A91CC433C7;
 Wed, 24 Jan 2024 01:07:46 +0000 (UTC)
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
X-Inumbo-ID: 00397f00-ba55-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706058468;
	bh=VJe7KyfhHk0aCC8AKV2aYEL9bhaGo8N3VyD/zVtGCsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i1jctmbG1ZrJsXmVyetKqL/JpufyCAvbymjPPM0KB4m5TtJ8286+yO8+OUQaK4KKt
	 EztLaEo1O8IBGH24yeSkHNsIaty7agVAET3ZLtnmgfPlPxtqSzlX6vPcQkpHwu21Lh
	 QwNVnVzzFMO2OQFdqMYkitENB+NP7frTfwRN8p23UALECul6EniAynK0l+MNq7s1Vq
	 OwnC/2nidp7/1ei73Pqy7oMG4YPVTnCk4y2qFNz1dWNwBkLKPelce0IBV9acT1hRql
	 AhJusHrqBoFiJNlZojCngKv4YqdAH2ALNZNi0a3AIaB7+Wsp5bwpUT38qDYI/b1Sfm
	 9h3hHVsERCqkA==
Date: Tue, 23 Jan 2024 17:07:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
In-Reply-To: <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2401231704270.2287888@ubuntu-linux-20-04-desktop>
References: <cover.1705066642.git.mykyta_poturai@epam.com> <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Jan 2024, Mykyta Poturai wrote:
> Add the second version of inject_msi DM op, which allows to specify
> the source_id of an MSI interrupt. This is needed for correct MSI
> injection on ARM.
> 
> It would not be safe to include the source_id in the original inject_msi
> in the pad field, because we have no way to know if it is set or not.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  tools/include/xendevicemodel.h               | 14 +++++++++++++
>  tools/libs/devicemodel/core.c                | 22 ++++++++++++++++++++
>  tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
>  xen/arch/arm/dm.c                            | 15 +++++++++++++
>  xen/arch/x86/hvm/dm.c                        | 13 ++++++++++++
>  xen/include/public/hvm/dm_op.h               | 12 +++++++++++
>  6 files changed, 81 insertions(+)
> 
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index 797e0c6b29..4833e55bce 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
> @@ -236,6 +236,20 @@ int xendevicemodel_inject_msi(
>      xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
>      uint32_t msi_data);
>  
> +/**
> + * This function injects an MSI into a guest.
> + *
> + * @parm dmod a handle to an open devicemodel interface.
> + * @parm domid the domain id to be serviced
> + * @parm msi_addr the MSI address (0xfeexxxxx)
> + * @parm source_id the PCI SBDF of the source device
> + * @parm msi_data the MSI data
> + * @return 0 on success, -1 on failure.
> +*/
> +int xendevicemodel_inject_msi2(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t source_id,
> +    uint32_t msi_data, unsigned int source_id_valid);


What is "source_id_valid"? It is not described in the comment. Also, it
should be a fixed size int. I agree with Jan that we could reuse
xendevicemodel_inject_msi by assuing that PCI BDF zero is invalid.


>  /**
>   * This function enables tracking of changes in the VRAM area.
>   *
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 8e619eeb0a..17ad00c5d9 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -448,6 +448,28 @@ int xendevicemodel_set_irq_level(
>      return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>  }
>  
> +int xendevicemodel_inject_msi2(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t source_id,
> +    uint32_t msi_data, unsigned int source_id_valid)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_inject_msi2 *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_inject_msi2;
> +    data = &op.u.inject_msi2;
> +
> +    data->addr = msi_addr;
> +    data->data = msi_data;
> +    if ( source_id_valid ) {
> +        data->source_id = source_id;
> +        data->flags = XEN_DMOP_MSI_SOURCE_ID_VALID;
> +    }
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
>  int xendevicemodel_set_pci_link_route(
>      xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
>  {
> diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
> index f7f9e3d932..aa05768642 100644
> --- a/tools/libs/devicemodel/libxendevicemodel.map
> +++ b/tools/libs/devicemodel/libxendevicemodel.map
> @@ -44,3 +44,8 @@ VERS_1.4 {
>  		xendevicemodel_set_irq_level;
>  		xendevicemodel_nr_vcpus;
>  } VERS_1.3;
> +
> +VERS_1.5 {
> +	global:
> +		xendevicemodel_inject_msi2;
> +} VERS_1.4;
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 5569efa121..c45e196561 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
>          [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
>          [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
> +        [XEN_DMOP_inject_msi2]                      = sizeof(struct xen_dm_op_inject_msi2),
>          [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
>      };
>  
> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data =
> +            &op.u.inject_msi2;
> +
> +        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +        rc = vgic_its_trigger_msi(d, data->addr, data->source_id, data->data);
> +        break;
> +
> +    }
>      case XEN_DMOP_nr_vcpus:
>      {
>          struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index 462691f91d..a4a0e3dff9 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -344,6 +344,7 @@ int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_set_mem_type]                     = sizeof(struct xen_dm_op_set_mem_type),
>          [XEN_DMOP_inject_event]                     = sizeof(struct xen_dm_op_inject_event),
>          [XEN_DMOP_inject_msi]                       = sizeof(struct xen_dm_op_inject_msi),
> +        [XEN_DMOP_inject_msi2]                      = sizeof(struct xen_dm_op_inject_msi2),
>          [XEN_DMOP_map_mem_type_to_ioreq_server]     = sizeof(struct xen_dm_op_map_mem_type_to_ioreq_server),
>          [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
>          [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
> @@ -539,6 +540,18 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data =
> +            &op.u.inject_msi2;
> +
> +        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
> +            printk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is ignored\n");
> +
> +        rc = hvm_inject_msi(d, data->addr, data->data);
> +        break;
> +    }
> +
>      case XEN_DMOP_remote_shutdown:
>      {
>          const struct xen_dm_op_remote_shutdown *data =
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index fa98551914..da2ce4a7f7 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_inject_msi2 21
> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
> +
> +struct xen_dm_op_inject_msi2 {
> +    uint64_aligned_t addr;
> +    uint32_t data;
> +    uint32_t source_id; /* PCI SBDF */
> +    uint32_t flags;
> +};
> +typedef struct xen_dm_op_inject_msi2 xen_dm_op_inject_msi2_t;
> +
>  struct xen_dm_op {
>      uint32_t op;
>      uint32_t pad;
> @@ -463,6 +474,7 @@ struct xen_dm_op {
>          xen_dm_op_set_mem_type_t set_mem_type;
>          xen_dm_op_inject_event_t inject_event;
>          xen_dm_op_inject_msi_t inject_msi;
> +        xen_dm_op_inject_msi2_t inject_msi2;
>          xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_server;
>          xen_dm_op_remote_shutdown_t remote_shutdown;
>          xen_dm_op_relocate_memory_t relocate_memory;
> -- 
> 2.34.1
> 

