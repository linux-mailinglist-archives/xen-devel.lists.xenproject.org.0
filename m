Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3147B69C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 01:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250074.430675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzTNy-0003h1-Ns; Tue, 21 Dec 2021 00:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250074.430675; Tue, 21 Dec 2021 00:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzTNy-0003eU-KF; Tue, 21 Dec 2021 00:52:10 +0000
Received: by outflank-mailman (input) for mailman id 250074;
 Tue, 21 Dec 2021 00:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mzTNw-0003eO-SD
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 00:52:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c1d28c-61f8-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 01:52:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A3CE61337;
 Tue, 21 Dec 2021 00:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F1FC36AE5;
 Tue, 21 Dec 2021 00:52:02 +0000 (UTC)
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
X-Inumbo-ID: 36c1d28c-61f8-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640047922;
	bh=y9+plNEu0iWWUibxZCd8BP7tpO6BWv4xRbZTgYb5JVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M8DqjpNvDBKLQ/NbhO7MvtszgaYVDW4gvNucwusg8cZhZXyODD54BUwu/I8JbvObA
	 Ng4ayNzZexMpBEnPrCSOGN0k62RlvfOuNwcmsbtVjVbjHmgx8Bm/Nt7bR1xh7iaqUV
	 lrsUBtxmMdI9L32tXs049ZG/e6bwUch29AM2Wb7K5psZRUNwUA6mG7Twi+0G/fgJx+
	 5d98U5xtzjsgi+nhIrdEf+fzc3uF9VCfWdsMdD/D0f3n2geX0hP5JeUmjc4NhyxJ5c
	 pdt5O7E/P6Lo6FWR/lWb7tckLyVvj8aBGzyOuMyKNbP5bTcfqJCjGlhqAJtJbQkPvM
	 rqchcwqfpbPVw==
Date: Mon, 20 Dec 2021 16:52:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20211220181215.GA1702335@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> Hi Stefano,
> 
> On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > This is the implementation of SCI interface, called SCMI-SMC driver,
> > > which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> > > This allows devices from the Domains to work with clocks, resets and
> > > power-domains without access to CPG.
> > > 
> > > The following features are implemented:
> > > - request SCMI channels from ATF and pass channels to Domains;
> > > - set device permissions for Domains based on the Domain partial
> > > device-tree. Devices with permissions are able to work with clocks,
> > > resets and power-domains via SCMI;
> > > - redirect scmi messages from Domains to ATF.
> > > 
> > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > ---
> > >  xen/arch/arm/Kconfig          |   2 +
> > >  xen/arch/arm/sci/Kconfig      |  10 +
> > >  xen/arch/arm/sci/Makefile     |   1 +
> > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
> > >  xen/include/public/arch-arm.h |   1 +
> > >  5 files changed, 809 insertions(+)
> > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > 
> > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > index 186e1db389..02d96c6cfc 100644
> > > --- a/xen/arch/arm/Kconfig
> > > +++ b/xen/arch/arm/Kconfig
> > > @@ -114,6 +114,8 @@ config SCI
> > >  	  support. It allows guests to control system resourcess via one of
> > >  	  SCI mediators implemented in XEN.
> > >  
> > > +source "arch/arm/sci/Kconfig"
> > > +
> > >  endmenu
> > >  
> > >  menu "ARM errata workaround via the alternative framework"
> > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> > > new file mode 100644
> > > index 0000000000..9563067ddc
> > > --- /dev/null
> > > +++ b/xen/arch/arm/sci/Kconfig
> > > @@ -0,0 +1,10 @@
> > > +config SCMI_SMC
> > > +	bool "Enable SCMI-SMC mediator driver"
> > > +	default n
> > > +	depends on SCI
> > > +	---help---
> > > +
> > > +	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
> > > +	This feature allows drivers from Domains to work with System
> > > +	Controllers (such as power,resets,clock etc.). SCP is used as transport
> > > +	for communication.
> > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > > index 837dc7492b..67f2611872 100644
> > > --- a/xen/arch/arm/sci/Makefile
> > > +++ b/xen/arch/arm/sci/Makefile
> > > @@ -1 +1,2 @@
> > >  obj-y += sci.o
> > > +obj-$(CONFIG_SCMI_SMC) += scmi_smc.o
> > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
> > > new file mode 100644
> > > index 0000000000..2eb01ea82d
> > > --- /dev/null
> > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > @@ -0,0 +1,795 @@
> > > +/*
> > > + * xen/arch/arm/sci/scmi_smc.c
> > > + *
> > > + * SCMI mediator driver, using SCP as transport.
> > > + *
> > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > + * Copyright (C) 2021, EPAM Systems.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License as published by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <asm/sci/sci.h>
> > > +#include <asm/smccc.h>
> > > +#include <asm/io.h>
> > > +#include <xen/bitops.h>
> > > +#include <xen/config.h>
> > > +#include <xen/sched.h>
> > > +#include <xen/device_tree.h>
> > > +#include <xen/iocap.h>
> > > +#include <xen/init.h>
> > > +#include <xen/err.h>
> > > +#include <xen/lib.h>
> > > +#include <xen/list.h>
> > > +#include <xen/mm.h>
> > > +#include <xen/string.h>
> > > +#include <xen/time.h>
> > > +#include <xen/vmap.h>
> > > +
> > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > +
> > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> > > +#define SCMI_SUCCESS              0
> > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > +#define SCMI_DENIED             (-3)
> > > +#define SCMI_NOT_FOUND          (-4)
> > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > +#define SCMI_BUSY               (-6)
> > > +#define SCMI_COMMS_ERROR        (-7)
> > > +#define SCMI_GENERIC_ERROR      (-8)
> > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > +
> > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > +
> > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > 
> > I could find the following SCMI binding in Linux, which describes
> > the arm,scmi-smc compatible and the arm,smc-id property:
> > 
> > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > 
> > However, linux,scmi_mem is not described. Aren't you supposed to read
> > the "shmem" property instead? And the compatible string used for this
> > seems to be "arm,scmi-shmem".
> > 
> 
> We use linux,scmi_mem node to reserve memory, needed for all
> channels:
> 
> reserved-memory {
>     /* reserved region for scmi channels*/
>     scmi_memory: linux,scmi_mem@53FF0000 {
>         no-map;
>         reg = <0x0 0x53FF0000 0x0 0x10000>;
>     };
> };
> 
> arm,scmi-shmem node used in shmem property defines only 1 page needed to
> the current scmi channel:
> 
> cpu_scp_shm: scp-shmem@0x53FF0000 {
>     compatible = "arm,scmi-shmem";
>     reg = <0x0 0x53FF0000 0x0 0x1000>;
> };
> 
> For each Domain reg points to unigue page from linux,scmi_mem region,
> assigned to this agent.

If we were to use "linux,scmi_mem" we would have to introduce it as a
compatible string, not as a node name, and it would need to be described
in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.

But from your description I don't think it is necessary. We can just use
"arm,scmi-shmem" to describe all the required regions:

reserved-memory {
    scp-shmem@0x53FF0000 {
        compatible = "arm,scmi-shmem";
        reg = <0x0 0x53FF0000 0x0 0x1000>;
    };
    scp-shmem@0x53FF1000 {
        compatible = "arm,scmi-shmem";
        reg = <0x0 0x53FF1000 0x0 0x1000>;
    };
    scp-shmem@0x53FF2000 {
        compatible = "arm,scmi-shmem";
        reg = <0x0 0x53FF2000 0x0 0x1000>;
    };
    ...

In other words, if all the individual channel pages are described as
"arm,scmi-shmem", why do we also need a single larger region as
"linux,scmi_mem"?

 
> > > +#define SCMI_SHMEM                         "shmem"
> > > +
> > > +#define HYP_CHANNEL                          0x0
> > > +
> > > +#define HDR_ID                             GENMASK(7,0)
> > > +#define HDR_TYPE                           GENMASK(9, 8)
> > > +#define HDR_PROTO                          GENMASK(17, 10)
> > > +
> > > +/* SCMI protocol, refer to section 4.2.2.2 (DEN0056C) */
> > > +#define MSG_N_AGENTS_MASK                  GENMASK(15, 8)
> > > +
> > > +#define FIELD_GET(_mask, _reg)\
> > > +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> > > +#define FIELD_PREP(_mask, _val)\
> > > +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> > > +
> > > +typedef struct scmi_msg_header {
> > > +    uint8_t id;
> > > +    uint8_t type;
> > > +    uint8_t protocol;
> > > +} scmi_msg_header_t;
> > > +
> > > +typedef struct scmi_perms_tx {
> > > +    uint32_t agent_id;
> > > +    uint32_t device_id;
> > > +    uint32_t flags;
> > > +} scmi_perms_tx_t;
> > > +
> > > +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE   BIT(0, UL)
> > > +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR  BIT(1, UL)
> > > +
> > > +#define SCMI_ALLOW_ACCESS                   BIT(0, UL)
> > > +
> > > +struct scmi_shared_mem {
> > > +    uint32_t reserved;
> > > +    uint32_t channel_status;
> > > +    uint32_t reserved1[2];
> > > +    uint32_t flags;
> > > +    uint32_t length;
> > > +    uint32_t msg_header;
> > > +    uint8_t msg_payload[];
> > > +};
> > > +
> > > +struct scmi_channel {
> > > +    int chan_id;
> > > +    int agent_id;
> > > +    uint32_t func_id;
> > > +    int domain_id;
> > > +    uint64_t paddr;
> > > +    struct scmi_shared_mem *shmem;
> > > +    spinlock_t lock;
> > > +    struct list_head list;
> > > +};
> > > +
> > > +struct scmi_data {
> > > +    struct list_head channel_list;
> > > +    spinlock_t channel_list_lock;
> > > +    bool initialized;
> > > +    u64 shmem_addr, shmem_size;
> > > +};
> > > +
> > > +static struct scmi_data scmi_data;
> > > +
> > > +/*
> > > + * pack_scmi_header() - packs and returns 32-bit header
> > > + *
> > > + * @hdr: pointer to header containing all the information on message id,
> > > + *    protocol id and type id.
> > > + *
> > > + * Return: 32-bit packed message header to be sent to the platform.
> > > + */
> > > +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
> > > +{
> > > +    return FIELD_PREP(HDR_ID, hdr->id) |
> > > +        FIELD_PREP(HDR_TYPE, hdr->type) |
> > > +        FIELD_PREP(HDR_PROTO, hdr->protocol);
> > > +}
> > > +
> > > +/*
> > > + * unpack_scmi_header() - unpacks and records message and protocol id
> > > + *
> > > + * @msg_hdr: 32-bit packed message header sent from the platform
> > > + * @hdr: pointer to header to fetch message and protocol id.
> > > + */
> > > +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
> > > +{
> > > +    hdr->id = FIELD_GET(HDR_ID, msg_hdr);
> > > +    hdr->type = FIELD_GET(HDR_TYPE, msg_hdr);
> > > +    hdr->protocol = FIELD_GET(HDR_PROTO, msg_hdr);
> > > +}
> > > +
> > > +static inline int channel_is_free(struct scmi_channel *chan_info)
> > > +{
> > > +    return ( chan_info->shmem->channel_status
> > > +            & SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE ) ? 0 : -EBUSY;
> > 
> > Does this need a memory barrier? Or not, because the other end always
> > runs on the same CPU at a different execution level so the
> > channel_status would be always guaranteed to be read as updated?
> > 
> 
> It don't because the other end runs on the same CPU. Other mediator
> implemetaions, which uses different areas may need memory barrier.
> 
> > 
> > > +}
> > > +
> > > +static int send_smc_message(struct scmi_channel *chan_info,
> > > +                            scmi_msg_header_t *hdr, void *data, int len)
> > > +{
> > > +    struct arm_smccc_res resp;
> > > +    int ret;
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: status =%d len=%d\n",
> > > +           chan_info->shmem->channel_status, len);
> > > +    printk(XENLOG_DEBUG "scmi: header id = %d type = %d, proto = %d\n",
> > > +           hdr->id, hdr->type, hdr->protocol);
> > > +
> > > +    ret = channel_is_free(chan_info);
> > > +    if ( IS_ERR_VALUE(ret) )
> > > +        return ret;
> > > +
> > > +    chan_info->shmem->channel_status = 0x0;
> > > +    /* Writing 0x0 right now, but SCMI_SHMEM_FLAG_INTR_ENABLED can be set */
> > > +    chan_info->shmem->flags = 0x0;
> > > +    chan_info->shmem->length = sizeof(chan_info->shmem->msg_header) + len;
> > > +    chan_info->shmem->msg_header = pack_scmi_header(hdr);
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: Writing to shmem address %p\n",
> > > +           chan_info->shmem);
> > > +    if ( len > 0 && data )
> > > +        memcpy((void *)(chan_info->shmem->msg_payload), data, len);
> > 
> > Again, here we don't need a barrier because it is implicit in the SMC?
> > 
> 
> As I mentioned before, the other end runs on the same CPU.
> 
> > Don't we need to check that "len" fits in the shared memory?
> > 
> 
> I think it's a good point. I'll add len check in v2.
> 
> > 
> > > +    arm_smccc_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, chan_info->chan_id,
> > > +                  &resp);
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: scmccc_smc response %d\n", (int)(resp.a0));
> > > +
> > > +    if ( resp.a0 )
> > > +        return -EOPNOTSUPP;
> > 
> > Why is that?
> > 
> 
> This change was presented in kernel by Sudeep Holla in commit:
> f7199cf489027ae38a9a82312d13025f7aefa0b8
> 
> However, link posted in the commit:
> https://lore.kernel.org/r/20200417103232.6896-1-sudeep.holla@arm.com
> 
> Leads to slightly different patch:
> 
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return -EOPNOTSUPP;
> +	else if (res.a0)
> +		return -EINVAL;
> +	return 0;
> 
> I don't know why it differs from the original commit, but I'll check and place
> the correct implementation in v2.
> 
> > 
> > > +    return 0;
> > > +}
> > > +
> > > +static int check_scmi_status(int scmi_status)
> > > +{
> > > +    if ( scmi_status == SCMI_SUCCESS )
> > > +        return 0;
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: Error received: %d\n", scmi_status);
> > > +
> > > +    switch ( scmi_status )
> > > +    {
> > > +    case SCMI_NOT_SUPPORTED:
> > > +        return -EOPNOTSUPP;
> > > +    case SCMI_INVALID_PARAMETERS:
> > > +        return -EINVAL;
> > > +    case SCMI_DENIED:
> > > +        return -EACCES;
> > > +    case SCMI_NOT_FOUND:
> > > +        return -ENOENT;
> > > +    case SCMI_OUT_OF_RANGE:
> > > +        return -ERANGE;
> > > +    case SCMI_BUSY:
> > > +        return -EBUSY;
> > > +    case SCMI_COMMS_ERROR:
> > > +        return -ENOTCONN;
> > > +    case SCMI_GENERIC_ERROR:
> > > +        return -EIO;
> > > +    case SCMI_HARDWARE_ERROR:
> > > +        return -ENXIO;
> > > +    case SCMI_PROTOCOL_ERROR:
> > > +        return -EBADMSG;
> > > +    }
> > > +
> > > +    return -EINVAL;
> > > +}
> > > +
> > > +static int get_smc_response(struct scmi_channel *chan_info,
> > > +                            scmi_msg_header_t *hdr, void *data, int len)
> > > +{
> > > +    int recv_len;
> > > +    int ret;
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: get smc responce msgid %d\n", hdr->id);
> > > +
> > > +    ret = channel_is_free(chan_info);
> > > +    if ( IS_ERR_VALUE(ret) )
> > > +        return ret;
> > 
> > I am not familiar with the spec (do you have a link?) but is it expected
> > that the channel is "free" when actually we want to read a message on
> > the channel?
> > 
> 
> Here is the link https://developer.arm.com/documentation/den0056/latest
> Figure 6 in Section 5.1.1.
> Caller marks channel as busy, then callee process message and marks channel as free.
> We are implementing polling based communication flow.

OK


> > > +    recv_len = chan_info->shmem->length - sizeof(chan_info->shmem->msg_header);
> > > +
> > > +    if ( recv_len < 0 )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "scmi: Wrong size of smc message. Data may be invalid\n");
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    if ( recv_len > len )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "scmi: Not enough buffer for message %d, expecting %d\n",
> > > +               recv_len, len);
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    unpack_scmi_header(chan_info->shmem->msg_header, hdr);
> > > +
> > > +    if ( recv_len > 0 )
> > > +    {
> > > +        memcpy(data, chan_info->shmem->msg_payload, recv_len);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int do_smc_xfer(struct scmi_channel *channel, scmi_msg_header_t *hdr, void *tx_data, int tx_size,
> > > +                       void *rx_data, int rx_size)
> > > +{
> > > +    int ret = 0;
> > > +
> > > +    if ( !hdr )
> > > +        return -EINVAL;
> > > +
> > > +    spin_lock(&channel->lock);
> > > +
> > > +    ret = send_smc_message(channel, hdr, tx_data, tx_size);
> > > +    if ( ret )
> > > +        goto clean;
> > > +
> > > +    ret = get_smc_response(channel, hdr, rx_data, rx_size);
> > > +clean:
> > > +    spin_unlock(&channel->lock);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static struct scmi_channel *get_channel_by_id(uint8_t chan_id)
> > > +{
> > > +    struct scmi_channel *curr;
> > > +    bool found = false;
> > > +
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > 
> > please use parenthesis around the inner if (also in other places)
> > 
> 
> Thank you for the remark. I will fix it in v2.
> 
> > 
> > > +        if ( curr->chan_id == chan_id )
> > > +        {
> > > +            found = true;
> > > +            break;
> > > +        }
> > > +
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +    if ( found )
> > > +        return curr;
> > > +
> > > +    return NULL;
> > > +}
> > > +
> > > +static struct scmi_channel *get_channel_by_domain(uint8_t domain_id)
> > 
> > Use domid_t for domain ids.
> 
> Thanks, I will fix it in v2.
> > 
> > Also, wouldn't it be better to implement it as:
> > 
> > static inline struct scmi_channel *get_channel_by_domain(struct domain *d) {
> >     return d->arch.sci
> > }
> > 
> That's a good point. I will take a look on it and fix in v2.
> > 
> > > +{
> > > +    struct scmi_channel *curr;
> > > +    bool found = false;
> > > +
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > > +        if ( curr->domain_id == domain_id )
> > > +        {
> > > +            found = true;
> > > +            break;
> > > +        }
> > > +
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +    if ( found )
> > > +        return curr;
> > > +
> > > +    return NULL;
> > > +}
> > > +
> > > +static struct scmi_channel *aquire_scmi_channel(int domain_id)
> > > +{
> > > +    struct scmi_channel *curr;
> > > +    bool found = false;
> > > +
> > > +    ASSERT(domain_id != DOMID_INVALID && domain_id >= 0);
> > > +
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > > +        if ( (curr->domain_id == DOMID_INVALID)
> > > +            && (curr->chan_id != HYP_CHANNEL) )
> > 
> > If you use DOMID_XEN for HYP_CHANNEL, then this check becomes more
> > intuitive
> > 
> 
> We do not have direct relation between channel id and domain id.
> One channel id can be reused by different domain_ids. So from my standpoint,
> DOMID_XEN doesn't fit here.
 
Below you wrote that you used DOMID_INVALID to mark a channel as free.
That is fine, but then DOMID_INVALID shouldn't be used for HYP_CHANNEL
because HYP_CHANNEL is not "free". In this function the check for
curr->chan_id != HYP_CHANNEL should be unnecessary and I think the code
would look as follows:

    list_for_each_entry(curr, &scmi_data.channel_list, list)
    {
        if ( (curr->domain_id == DOMID_INVALID) )
        {

 
> > > +        {
> > > +            curr->domain_id = domain_id;
> > > +            found = true;
> > > +            break;
> > > +        }
> > > +
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +    if ( found )
> > > +        return curr;
> > > +
> > > +    return NULL;
> > > +}
> > > +
> > > +static void relinquish_scmi_channel(struct scmi_channel *channel)
> > > +{
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    ASSERT(channel != NULL);
> > 
> > the ASSERT could be before the spin_lock
> > 
> 
> Thank you. I will fix it in v2.
> 
> > 
> > > +    channel->domain_id = DOMID_INVALID;
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +}
> > > +
> > > +static struct scmi_channel *smc_create_channel(uint8_t chan_id,
> > > +                                               uint32_t func_id, uint64_t addr)
> > > +{
> > > +    struct scmi_channel *channel;
> > > +    mfn_t mfn;
> > > +
> > > +    channel = get_channel_by_id(chan_id);
> > > +    if ( channel )
> > > +        return ERR_PTR(EEXIST);
> > > +
> > > +    channel = xmalloc(struct scmi_channel);
> > > +    if ( !channel )
> > > +        return ERR_PTR(ENOMEM);
> > > +
> > > +    channel->chan_id = chan_id;
> > > +    channel->func_id = func_id;
> > > +    channel->domain_id = DOMID_INVALID;
> > 
> > I take you are using DOMID_INVALID to mark a channel used by Xen itself?
> > If so, then DOMID_XEN would be more appropriate.
> > 
> 
> I use DOMID_INVALID to mark channel as free.
> 
> > 
> > > +    mfn = maddr_to_mfn(addr);
> > > +    channel->shmem = vmap(&mfn, 1);
> > 
> > One thing to be careful is the mapping attributes, for a couple of
> > reasons. As you might be aware, the ARM architecture forbids mismatching
> > attributes for mapping memory in different places in the system. So the
> > attributes that we use here must be the same used by the firmware
> > (and/or the guest.)
> > 
> > The second reason to be careful is that in the bindings example
> > Documentation/devicetree/bindings/firmware/arm,scmi.yaml the shared
> > memory is "mmio-sram", which is special. It is not supposed to be normal
> > memory, but it is OK to map it cacheable. Still, it might be more
> > appropriate to use ioremap_cache.
> > 
> 
> Originally, I used vmap here to have memcpy and it works fine in our
> setup. But I will do some research and email you with the results.
> 
> > 
> > > +    if ( !channel->shmem )
> > > +    {
> > > +        xfree(channel);
> > > +        return ERR_PTR(ENOMEM);
> > > +    }
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: Got shmem after vmap %p\n", channel->shmem);
> > > +    channel->paddr = addr;
> > > +    channel->shmem->channel_status = SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
> > > +    spin_lock_init(&channel->lock);
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    list_add(&channel->list, &scmi_data.channel_list);
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +    return channel;
> > > +}
> > > +
> > > +static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t len)
> > > +{
> > > +    return iomem_permit_access(d, paddr_to_pfn(addr),
> > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > +}
> > > +
> > > +static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
> > > +                                     uint64_t len)
> > > +{
> > > +    return iomem_deny_access(d, paddr_to_pfn(addr),
> > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > +}
> > > +
> > > +static int dt_update_domain_range(struct domain *d, uint64_t addr,
> > > +                                  uint64_t size)
> > > +{
> > > +    struct dt_device_node *shmem_node;
> > > +    __be32 *hw_reg;
> > > +    const struct dt_property *pp;
> > > +    uint32_t len;
> > > +
> > > +    shmem_node = dt_find_compatible_node(NULL, NULL, "arm,scmi-shmem");
> > 
> > Here we are using "arm,scmi-shmem" while below we are checking for
> > "linux,scmi_mem". What's the difference?
> 
> linux,scmi_mem (I posted nodes examples above) describes memory region, allocated
> for all channels, while arm,scmi-shmem points to the exact channel (page in
> linux,scmi_mem region).
>
> 
> > Also, this function is looking for "arm,scmi-shmem" in dt_host and
> > replaces its value. For dom0less domUs we'll probably need a
> > make_scmi_node function to create the node from scratch like for
> > instance xen/arch/arm/domain_build.c:make_gic_domU_node.
> > 
> > I wonder if we had such a function whether it wouldn't be better to also
> > use it for dom0 (and blacklist the physical "arm,scmi-shmem" in
> > handle_node so that dom0 doesn't get the real shared memory information
> > by accident).
> > 
> 
> Thank you for the remark. I will rework this in v2.
> 
> > 
> > > +
> > > +    if ( !shmem_node )
> > > +    {
> > > +        printk(XENLOG_ERR "scmi: Unable to find %s node in DT\n", SCMI_SHMEM);
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    pp = dt_find_property(shmem_node, "reg", &len);
> > > +    if ( !pp )
> > > +    {
> > > +        printk(XENLOG_ERR "scmi: Unable to find regs entry in shmem node\n");
> > > +        return -ENOENT;
> > > +    }
> > > +
> > > +    hw_reg = pp->value;
> > > +    dt_set_range(&hw_reg, shmem_node, addr, size);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static void free_channel_list(void)
> > > +{
> > > +    struct scmi_channel *curr, *_curr;
> > > +
> > > +    spin_lock(&scmi_data.channel_list_lock);
> > > +    list_for_each_entry_safe (curr, _curr, &scmi_data.channel_list, list)
> > > +    {
> > > +        vunmap(curr->shmem);
> > > +        list_del(&curr->list);
> > > +        xfree(curr);
> > > +    }
> > > +
> > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > +}
> > > +
> > > +static __init bool scmi_probe(struct dt_device_node *scmi_node)
> > > +{
> > > +    struct dt_device_node *shmem_node;
> > > +    int ret, i;
> > > +    struct scmi_channel *channel, *agent_channel;
> > > +    int n_agents;
> > > +    scmi_msg_header_t hdr;
> > > +    struct rx_t {
> > > +        int32_t status;
> > > +        uint32_t attributes;
> > > +    } rx;
> > 
> > Should rx be defined at the top together with scmi_perms_tx_t and
> > others?
> > 
> 
> I'd rather move scmi_perms_tx_t to scmi_add_device_by_devid because it's
> used only in 1 place.
> So we will have rx and tx in scmi_add_device_by_devid and rx ( which
> differs from rx in scmi_add_device_by_devid ) in scmi_probe.
> I think it will be more understandable and no need to make unique names.
> What do you think about that?

I think that's OK

 
> > > +    uint32_t func_id;
> > > +
> > > +    ASSERT(scmi_node != NULL);
> > > +
> > > +    INIT_LIST_HEAD(&scmi_data.channel_list);
> > > +    spin_lock_init(&scmi_data.channel_list_lock);
> > > +
> > > +    if ( !dt_property_read_u32(scmi_node, SCMI_SMC_ID, &func_id) )
> > > +    {
> > > +        printk(XENLOG_ERR "scmi: Unable to read smc-id from DT\n");
> > > +        return false;
> > > +    }
> > > +
> > > +    shmem_node = dt_find_node_by_name(NULL, SCMI_SHARED_MEMORY);
> > 
> > From the spec, it looks like you should be getting the shared memory
> > area from the phandle list "shmem".
> > 
> 
> We use SCMI_SHARED_MEMORY to get whole memory region (0x10 pages in my case),
> we can use for the agents. As you can see below - Hypervisor received number of
> agents from Firmware and split this region between agents.

In general we can't use properties that are not part of the device tree
spec, either https://www.devicetree.org/specifications/ or
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings

"linux,scmi_mem" is currently absent. Are you aware of any upstreaming
activities to get "linux,scmi_mem" upstream under
Documentation/devicetree/bindings in Linux?

If "linux,scmi_mem" is going upstream in Linux, then we could use it.
Otherwise, first "linux,scmi_mem" needs to be added somewhere under
Documentation/devicetree/bindings (probably
Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we can
work on the Xen code that makes use of it.

Does it make sense?

 
> > > +    if ( IS_ERR_OR_NULL(shmem_node) )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "scmi: Device tree error, can't parse shmem phandle %ld\n",
> > > +               PTR_ERR(shmem_node));
> > > +        return false;
> > > +    }
> > > +
> > > +    ret = dt_device_get_address(shmem_node, 0, &scmi_data.shmem_addr,
> > > +                                &scmi_data.shmem_size);
> > > +    if ( IS_ERR_VALUE(ret) )
> > > +        return false;
> > > +
> > > +    channel = smc_create_channel(HYP_CHANNEL, func_id, scmi_data.shmem_addr);
> > > +    if ( IS_ERR(channel) )
> > > +        return false;
> > > +
> > > +    hdr.id = SCMI_BASE_PROTOCOL_ATTIBUTES;
> > > +    hdr.type = 0;
> > > +    hdr.protocol = SCMI_BASE_PROTOCOL;
> > > +
> > > +    ret = do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
> > > +    if ( ret )
> > > +        goto clean;
> > > +
> > > +    ret = check_scmi_status(rx.status);
> > > +    if ( ret )
> > > +        goto clean;
> > > +
> > > +    n_agents = FIELD_GET(MSG_N_AGENTS_MASK, rx.attributes);
> > > +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
> > > +
> > > +    n_agents = (n_agents > scmi_data.shmem_size / PAGE_SIZE) ?
> > > +        scmi_data.shmem_size / PAGE_SIZE : n_agents;
> > > +
> > > +    for ( i = 1; i < n_agents; i++ )
> > > +    {
> > 
> > Given that HYP_CHANNEL is actually zero, it looks like we could do
> > everything here in this loop but starting from i=0?
> > 
> 
> We allocate HYP_CHANNEL before loop because we need it to request number
> of agents. And we don't need to send SCMI_BASE_DISCOVER_AGENT to
> HYP_CHANNEL.
 
OK

 
> > > +        uint32_t tx_agent_id = 0xFFFFFFFF;
> > > +        struct {
> > > +            int32_t status;
> > > +            uint32_t agent_id;
> > > +            char name[16];
> > > +        } da_rx;
> > > +
> > > +        agent_channel = smc_create_channel(i, func_id, scmi_data.shmem_addr +
> > > +                                           i * PAGE_SIZE);
> > > +        if ( IS_ERR(agent_channel) )
> > > +        {
> > > +            ret = PTR_ERR(agent_channel);
> > > +            goto clean;
> > > +        }
> > > +
> > > +        hdr.id = SCMI_BASE_DISCOVER_AGENT;
> > > +        hdr.type = 0;
> > > +        hdr.protocol = SCMI_BASE_PROTOCOL;
> > > +
> > > +        ret = do_smc_xfer(agent_channel, &hdr, &tx_agent_id,
> > > +                          sizeof(tx_agent_id), &da_rx, sizeof(da_rx));
> > > +        if ( ret )
> > > +            goto clean;
> > > +
> > > +        ret = check_scmi_status(da_rx.status);
> > > +        if ( ret )
> > > +            goto clean;
> > > +
> > > +        printk(XENLOG_DEBUG "scmi: status=0x%x id=0x%x name=%s\n",
> > > +                da_rx.status, da_rx.agent_id, da_rx.name);
> > > +
> > > +        agent_channel->agent_id = da_rx.agent_id;
> > > +    }
> > > +
> > > +    scmi_data.initialized = true;
> > > +    return true;
> > > +
> > > +clean:
> > > +    free_channel_list();
> > > +    return ret == 0;
> > > +}
> > > +
> > > +static int scmi_domain_init(struct domain *d)
> > > +{
> > > +    struct scmi_channel *channel;
> > > +    int ret;
> > > +
> > > +    if ( !scmi_data.initialized )
> > > +        return 0;
> > > +
> > > +    channel = aquire_scmi_channel(d->domain_id);
> > > +    if ( IS_ERR_OR_NULL(channel) )
> > > +        return -ENOENT;
> > > +
> > > +    printk(XENLOG_INFO "scmi: Aquire SCMI channel id = 0x%x , domain_id = %d"
> > > +           "paddr = 0x%lx\n", channel->chan_id, channel->domain_id,
> > > +           channel->paddr);
> > > +
> > > +    if ( is_hardware_domain(d) )
> > > +    {
> > > +        ret = map_memory_to_domain(d, scmi_data.shmem_addr,
> > > +                                   scmi_data.shmem_size);
> > > +        if ( IS_ERR_VALUE(ret) )
> > > +            goto error;
> > > +
> > > +        ret = dt_update_domain_range(d, channel->paddr, PAGE_SIZE);
> > > +        if ( IS_ERR_VALUE(ret) )
> > > +        {
> > > +            int rc = unmap_memory_from_domain(d, scmi_data.shmem_addr,
> > > +                                              scmi_data.shmem_size);
> > > +            if ( rc )
> > > +                printk(XENLOG_ERR "Unable to unmap_memory_from_domain\n");
> > > +
> > > +            goto error;
> > > +        }
> > > +    }
> > 
> > Is dom0 the only domain to get direct access to the shared memory
> > region? If so, I don't think it is a good idea to make Dom0 "special" in
> > this case.
> > 
> > Let me make an example: if we assign a device to a domU since boot, and
> > dom0 wants to change the frequency of a clock that affects the assigned
> > device (likely because it doesn't know it is assigned), then dom0
> > shouldn't be able to.  We might have to perform checks in Xen to make
> > sure dom0 cannot stop the clock for the assigned device. 
> > 
> > So I think it would be better if all domains are treated the same way in
> > the mediator unless really necessary.
> > 
> > On the other hand, if all domains get access to the shared memory
> > region, then I don't think this is likely the right place to create the
> > dom0 mapping. We probably want to do it in domain_build.c in a way that
> > can be reused for dom0less domUs.
> > 
> 
> The idea is that all domains have their own page in shared memory
> region and unigue agent_id. Agent_id is used to set permissions for
> clocks\resets\power-domains etc. So during creation of domain (domUs or
> dom0) device-tree is processed using scmi_add_dt_device and
> clocks\resets\power-domains which are related to dom0 devices will be
> requested by using SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> All passed-through devices will be requested during DomU creation. Which
> means dom0 do not have an access to clocks\resets\power-domains, which
> are related to DomU.

OK, excellent


> > In regards to shared memory: it looks like the only two functions to
> > access the real shared memory are send_smc_message and get_smc_response.
> > If that is the case, then we actually don't need to expose the real
> > shared memory to any of the domains.
> > 
> > We could simply:
> > 
> > - expose a regular normal memory region as dom0/domU channel memory
> > - on SMC trap, read from the "fake" shared memory and set the
> >   corresponding real shared memory on the appropriate channel
> > - issue the SMC call
> > - on return from SMC, copy over data from the real shared memory to the
> >   "fake" channel reagion
> 
> Hypervisor redirects only SMC calls from guests and set agent_id to SMC
> parameters as a7. The idea was to give page for each agent, so we don't
> need to make additional read/write each time we receive SMC call.
> All we povide from hypervisor is agent_id. Firmware is responsible for
> reading memory from the correct address and place the response.
> 
> > 
> > This is useful if we need to "filter" any of the SCMI commands and
> > options from the domains to the firmware, and also it is useful if the
> > channel memory is not page aligned. But if the permissions are
> > fine-grained enough and also the channel memory is page aligned (and
> > multiple of 4K in size) then we could map the memory.
> > 
> 
> In current implementation we suppose that channel memory is page aligned.
> I think that Firmware should be responsible for permissions handling and
> "filtering", that's why permission calls were added to SCMI spec.
> I tried to make mediator as thin as possible.

OK. Can we check that the channel memory is page aligned at init time
and throw an error if it is not the case?


> > > +
> > > +    d->arch.sci = channel;
> > > +
> > > +    return 0;
> > > +error:
> > > +    relinquish_scmi_channel(channel);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static int scmi_add_device_by_devid(struct domain *d, uint32_t scmi_devid)
> > > +{
> > > +    struct scmi_channel *channel, *agent_channel;
> > > +    scmi_msg_header_t hdr;
> > > +    scmi_perms_tx_t tx;
> > > +    struct rx_t {
> > > +        int32_t status;
> > > +        uint32_t attributes;
> > > +    } rx;
> > > +    int ret;
> > > +
> > > +    if ( !scmi_data.initialized )
> > > +        return 0;
> > > +
> > > +    printk(XENLOG_DEBUG "scmi: scmi_devid = %d\n", scmi_devid);
> > > +
> > > +    agent_channel = get_channel_by_domain(d->domain_id);
> > > +    if ( IS_ERR_OR_NULL(agent_channel) )
> > > +        return PTR_ERR(agent_channel);
> > > +
> > > +    channel = get_channel_by_id(HYP_CHANNEL);
> > > +    if ( IS_ERR_OR_NULL(channel) )
> > > +        return PTR_ERR(channel);
> > > +
> > > +    hdr.id = SCMI_BASE_SET_DEVICE_PERMISSIONS;
> > > +    hdr.type = 0;
> > > +    hdr.protocol = SCMI_BASE_PROTOCOL;
> > > +
> > > +    tx.agent_id = agent_channel->agent_id;
> > > +    tx.device_id = scmi_devid;
> > > +    tx.flags = SCMI_ALLOW_ACCESS;
> > > +
> > > +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(&rx));
> > > +    if ( IS_ERR_VALUE(ret) )
> > > +        return ret;
> > > +
> > > +    ret = check_scmi_status(rx.status);
> > > +    if ( IS_ERR_VALUE(ret) )
> > > +        return ret;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int scmi_add_dt_device(struct domain *d, struct dt_device_node *dev)
> > > +{
> > > +    uint32_t scmi_devid;
> > > +
> > > +    if ( (!scmi_data.initialized) || (!d->arch.sci) )
> > > +        return 0;
> > > +
> > > +    if ( !dt_property_read_u32(dev, "scmi_devid", &scmi_devid) )
> > > +        return 0;
> > 
> > scmi_devid is another property that is not documented in the binding.
> > 
> 
> This property should be added to the device nodes, which are using scmi
> to work with clocks\resets\power-domains etc. This id should match the
> device_id, defined in Firmware. Hypervisor send this device_id to the Firmware
> as parameter to the permission request. Firmware set permissions to
> clocks\resets\power-domains, related to this device.

OK, I see. Unfortunately, scmi_devid is also not described under
Documentation/devicetree/bindings/.

This property seems to be actually required for the system to work
correctly.

Unless somebody else is already working on this, please send a patch to
the Linux kernel mailing list CCing the SCMI maintainers and Rob Herring
to introduce scmi_devid as a new property.


> > > +    printk(XENLOG_INFO "scmi: dt_node = %s\n", dt_node_full_name(dev));
> > > +
> > > +    return scmi_add_device_by_devid(d, scmi_devid);
> > > +}
> > > +
> > > +static int scmi_relinquish_resources(struct domain *d)
> > > +{
> > > +    int ret;
> > > +    struct scmi_channel *channel, *agent_channel;
> > > +    scmi_msg_header_t hdr;
> > > +    struct reset_agent_tx {
> > > +        uint32_t agent_id;
> > > +        uint32_t flags;
> > > +    } tx;
> > > +    uint32_t rx;
> > > +
> > > +    if ( !d->arch.sci )
> > > +        return 0;
> > > +
> > > +    agent_channel = d->arch.sci;
> > > +
> > > +    spin_lock(&agent_channel->lock);
> > > +    tx.agent_id = agent_channel->agent_id;
> > > +    spin_unlock(&agent_channel->lock);
> > > +
> > > +    channel = get_channel_by_id(HYP_CHANNEL);
> > > +    if ( !channel )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "scmi: Unable to get Hypervisor scmi channel for domain %d\n",
> > > +               d->domain_id);
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    hdr.id = SCMI_BASE_RESET_AGENT_CONFIGURATION;
> > > +    hdr.type = 0;
> > > +    hdr.protocol = SCMI_BASE_PROTOCOL;
> > > +
> > > +    tx.flags = 0;
> > > +
> > > +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(rx));
> > > +    if ( ret )
> > > +        return ret;
> > > +
> > > +    ret = check_scmi_status(rx);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static void scmi_domain_destroy(struct domain *d)
> > > +{
> > > +    struct scmi_channel *channel;
> > > +
> > > +    if ( !d->arch.sci )
> > > +        return;
> > > +
> > > +    channel = d->arch.sci;
> > > +    spin_lock(&channel->lock);
> > > +
> > > +    relinquish_scmi_channel(channel);
> > > +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
> > > +
> > > +    d->arch.sci = NULL;
> > > +
> > > +    unmap_memory_from_domain(d, channel->paddr, PAGE_SIZE);
> > > +    spin_unlock(&channel->lock);
> > > +    return;
> > > +}
> > > +
> > > +static bool scmi_handle_call(struct domain *d, void *args)
> > > +{
> > > +    bool res = false;
> > > +    struct scmi_channel *agent_channel;
> > > +    struct arm_smccc_res resp;
> > > +    struct cpu_user_regs *regs = args;
> > > +
> > > +    if ( !d->arch.sci )
> > > +        return false;
> > > +
> > > +    agent_channel = d->arch.sci;
> > > +    spin_lock(&agent_channel->lock);
> > > +
> > > +    if ( agent_channel->func_id != regs->x0 )
> > > +    {
> > > +        printk(XENLOG_ERR "scmi: func_id mismatch, exiting\n");
> > > +        goto unlock;
> > > +    }
> > > +
> > > +    arm_smccc_smc(agent_channel->func_id, 0, 0, 0, 0, 0, 0,
> > > +                  agent_channel->chan_id, &resp);
> > > +
> > > +    set_user_reg(regs, 0, resp.a0);
> > > +    set_user_reg(regs, 1, resp.a1);
> > > +    set_user_reg(regs, 2, resp.a2);
> > > +    set_user_reg(regs, 3, resp.a3);
> > > +    res = true;
> > > +unlock:
> > > +    spin_unlock(&agent_channel->lock);
> > > +
> > > +    return res;
> > > +}
> > > +
> > > +static int scmi_get_channel_paddr(void *scmi_ops,
> > > +                           struct xen_arch_domainconfig *config)
> > > +{
> > > +    struct scmi_channel *agent_channel = scmi_ops;
> > > +
> > > +    if ( !agent_channel )
> > > +        return -EINVAL;
> > > +
> > > +    config->sci_agent_paddr = agent_channel->paddr;
> > > +    return 0;
> > > +}
> > 
> > I am still not sure why it couldn't be done by scmi_domain_init.
> >
> 
> I can move this logic to scmi_domain_init, but in this case I have to add
> struct xen_arch_domainconfig *config as input parameter to
> scmi_domain_init and pass NULL from construct_dom0.
> Do you think this approach would be better?

I think it is OK to pass struct xen_arch_domainconfig *config as input
parameter to scmi_domain_init.

For dom0, why is sci_agent_paddr not supposed to be set?



> Also I think it's reasonable to pass xen_arch_domainconfig so different
> implementations could set another data they would probably need.
> 
> > 
> > > +static const struct dt_device_match scmi_smc_match[] __initconst =
> > > +{
> > > +    DT_MATCH_SCMI_SMC,
> > > +    { /* sentinel */ },
> > > +};
> > > +
> > > +static const struct sci_mediator_ops scmi_ops =
> > > +{
> > > +    .probe = scmi_probe,
> > > +    .domain_init = scmi_domain_init,
> > > +    .domain_destroy = scmi_domain_destroy,
> > > +    .add_dt_device = scmi_add_dt_device,
> > > +    .relinquish_resources = scmi_relinquish_resources,
> > > +    .handle_call = scmi_handle_call,
> > > +    .get_channel_info = scmi_get_channel_paddr
> > > +};
> > > +
> > > +REGISTER_SCI_MEDIATOR(scmi_smc, "SCMI-SMC", XEN_DOMCTL_CONFIG_SCI_SCMI_SMC,
> > > +                      scmi_smc_match, &scmi_ops);
> > > +
> > > +/*
> > > + * Local variables:
> > > + * mode: C
> > > + * c-file-style: "BSD"
> > > + * c-basic-offset: 4
> > > + * indent-tabs-mode: nil
> > > + * End:
> > > + */
> > > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > > index 9180be5e86..a67237942d 100644
> > > --- a/xen/include/public/arch-arm.h
> > > +++ b/xen/include/public/arch-arm.h
> > > @@ -315,6 +315,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> > >  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> > >  
> > >  #define XEN_DOMCTL_CONFIG_SCI_NONE      0
> > > +#define XEN_DOMCTL_CONFIG_SCI_SCMI_SMC  1
> > >  
> > >  struct xen_arch_domainconfig {
> > >      /* IN/OUT */

