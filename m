Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222FD81894C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656851.1025338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFahY-00028K-6K; Tue, 19 Dec 2023 14:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656851.1025338; Tue, 19 Dec 2023 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFahY-000266-3i; Tue, 19 Dec 2023 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 656851;
 Tue, 19 Dec 2023 14:04:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFahW-00025y-Gs
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:04:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFahW-0002JI-3v; Tue, 19 Dec 2023 14:04:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFahV-0008Hv-RQ; Tue, 19 Dec 2023 14:04:01 +0000
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
	bh=rhAICFUYxBXPZOabKzdQecwSLC2ytoX7XLuXKW6+n3Q=; b=fGy45oU6cnbKVSjxw+Mq09d5Zg
	4IDa9S0cYDytM9qWjVdKtlCzuPwE7tj1vR2rr4U1vyUO1qsiWdl4ZcRYONmKFnvKo0yed9ukq5uRQ
	vESca9tnQpWABoSp62bLbthcrj5PrqvGp3NdrtSaMNCC1gnLense7dfeaJlRD+LigMcg=;
Message-ID: <58554af1-4554-4b9c-b563-c0da8404af73@xen.org>
Date: Tue, 19 Dec 2023 14:03:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/12/2023 13:48, Mykyta Poturai wrote:
> This patch adds the ability for the device emulator to inject MSI
> interrupts into guests. This is done by adding a new DM op to the device
> model library.
> 
> It is not possible to reuse already existing inject_msi DM op, because
> it does not have a devid parameter, which is required for translation of
> MSIs to interrupt numbers on ARM.

 From the code below, it is not 100% clear what is the devid. It seems 
to be the device ID from the ITS PoV. However, the ID space is per ITS 
and I don't think it would be a good idea to design the DM OP interface 
with just one ITS in mind.

It is also not clear how QEMU would be able to know the device ID. So I 
think the operation should take an SBDF.

> 
> This approach was successfully tested on a virtio-pci setup with QEMU
> backend emulating block devices with following changes from the mainline
> Xen:
> 
> This branch was taken as a base for virtio-pci:
> https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2
> 
> With added new VGICv3 from here:
> https://github.com/Deedone/xen/tree/new_vgic_v2
> (although it should also work with the current VGIC)
> 
> And patches from this branch to allow for proper ITS emulation in guests:
> https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11
> 
> The main purpose of this RFC is to get some feedback on the addition of
> the new DM op. Is it the right approach or should we somehow modify the
> existing inject_msi DM op to be compatible with ARM?

In general the DM op interface is stable. So modification needs to be 
done with care.

> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   tools/include/xendevicemodel.h               |  4 ++++
>   tools/libs/devicemodel/core.c                | 19 +++++++++++++++++++
>   tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
>   xen/arch/arm/dm.c                            | 15 +++++++++++++++
>   xen/arch/arm/include/asm/new_vgic.h          |  2 ++
>   xen/arch/arm/vgic/vgic-its.c                 |  2 +-
>   xen/include/public/hvm/dm_op.h               | 10 ++++++++++
>   7 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index 797e0c6b29..e28710a6a5 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
> @@ -236,6 +236,10 @@ int xendevicemodel_inject_msi(
>       xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
>       uint32_t msi_data);
>   
> +int xendevicemodel_arm_inject_msi(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t devid,

In your new proposal, msi_addr is not used. As Jan just suggested, can 
we use it? If not, can you explain why?

> +    uint32_t data);
> +
>   /**
>    * This function enables tracking of changes in the VRAM area.
>    *
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 8e619eeb0a..d15ffa46fb 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -448,6 +448,25 @@ int xendevicemodel_set_irq_level(
>       return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>   }
>   
> +int xendevicemodel_arm_inject_msi(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t msi_data,
> +    uint32_t devid)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_arm_inject_msi *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_arm_inject_msi;
> +    data = &op.u.arm_inject_msi;
> +
> +    data->addr = msi_addr;
> +    data->devid = devid;
> +    data->data = msi_data;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
>   int xendevicemodel_set_pci_link_route(
>       xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
>   {
> diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
> index f7f9e3d932..8dceba5056 100644
> --- a/tools/libs/devicemodel/libxendevicemodel.map
> +++ b/tools/libs/devicemodel/libxendevicemodel.map
> @@ -44,3 +44,8 @@ VERS_1.4 {
>   		xendevicemodel_set_irq_level;
>   		xendevicemodel_nr_vcpus;
>   } VERS_1.3;
> +
> +VERS_1.5 {
> +	global:
> +		xendevicemodel_arm_inject_msi;
> +} VERS_1.4;
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 5569efa121..b42f11e569 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
>           [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
>           [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
>           [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
> +        [XEN_DMOP_arm_inject_msi]                   = sizeof(struct xen_dm_op_arm_inject_msi),
>           [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
>       };
>   
> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>           break;
>       }
>   
> +    case XEN_DMOP_arm_inject_msi:
> +    {
> +        const struct xen_dm_op_arm_inject_msi *data =
> +            &op.u.arm_inject_msi;
> +
> +        if ( d->arch.vgic.its == NULL )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +        vgic_its_trigger_msi(d, d->arch.vgic.its, data->devid, data->data);

vgic_its_trigger_msi() returns a value. So surely we want to propagate 
(possibly after translating the value).

> +        break;
> +
> +    }
>       case XEN_DMOP_nr_vcpus:
>       {
>           struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
> diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
> index dfc434ab41..dedc294ce9 100644
> --- a/xen/arch/arm/include/asm/new_vgic.h
> +++ b/xen/arch/arm/include/asm/new_vgic.h
> @@ -275,6 +275,8 @@ int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev);
>   void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_dev);
>   struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoorbell,
>                                            uint32_t vdevid);
> +int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
> +                                u32 devid, u32 eventid);
>   #else
>   static inline void vgic_enable_lpis(struct vcpu *vcpu)
>   {
> diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
> index fd5aaf4a70..706987d93a 100644
> --- a/xen/arch/arm/vgic/vgic-its.c
> +++ b/xen/arch/arm/vgic/vgic-its.c
> @@ -608,7 +608,7 @@ int vgic_its_inject_cached_translation(struct domain *d, struct vgic_its *its, u
>    * Returns 0 on success, a positive error value for any ITS mapping
>    * related errors and negative error values for generic errors.
>    */
> -static int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
> +int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
>                                   u32 devid, u32 eventid)
>   {
>       struct vgic_irq *irq = NULL;
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index fa98551914..a7d72e4389 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,15 @@ struct xen_dm_op_nr_vcpus {
>   };
>   typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>   
> +#define XEN_DMOP_arm_inject_msi 21
> +
> +struct xen_dm_op_arm_inject_msi {
> +    uint64_t addr;
> +    uint32_t data;
> +    uint32_t devid;
> +};
> +typedef struct xen_dm_op_arm_inject_msi xen_dm_op_arm_inject_msi_t;
> +
>   struct xen_dm_op {
>       uint32_t op;
>       uint32_t pad;
> @@ -463,6 +472,7 @@ struct xen_dm_op {
>           xen_dm_op_set_mem_type_t set_mem_type;
>           xen_dm_op_inject_event_t inject_event;
>           xen_dm_op_inject_msi_t inject_msi;
> +        xen_dm_op_arm_inject_msi_t arm_inject_msi;
>           xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_server;
>           xen_dm_op_remote_shutdown_t remote_shutdown;
>           xen_dm_op_relocate_memory_t relocate_memory;

Cheers,

-- 
Julien Grall

