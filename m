Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5544478A15
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 12:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248565.428742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBWX-0006c2-OA; Fri, 17 Dec 2021 11:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248565.428742; Fri, 17 Dec 2021 11:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBWX-0006YI-KJ; Fri, 17 Dec 2021 11:35:41 +0000
Received: by outflank-mailman (input) for mailman id 248565;
 Fri, 17 Dec 2021 11:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyUW=RC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1myBWW-0006YC-Ep
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 11:35:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74fca667-5f2d-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 12:35:38 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id p8so2853897ljo.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Dec 2021 03:35:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i11sm1343787lfu.141.2021.12.17.03.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 03:35:36 -0800 (PST)
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
X-Inumbo-ID: 74fca667-5f2d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TRsbbo4ViPYIqyZsosgMrz34Dc6G+Do/bUC21W9CMys=;
        b=cKCt3corFe2k6AFdXzkqZBSRUmlquV2vkE2dyctC0V7nBsuvjkK/cN6MfMWviS8Smh
         1OMrBewWFHNfNe848pRT6eTg4R4Sq1D6GL34sVCSnzseGbxgz9l0clRLqlOztk6oIE6m
         kC56eeyvL7j1ODgi7+0kuNB0c0/sqxRSfljrtraZsJ2eEukgq1eLXuAj1iYf9K2+qnMm
         CxyKKka9nsw31l+MAZUuN0sll/20hlK7ayvpPFkdDOf2BJXM/L6/BoiuCRrrz6ABMrcm
         N5r/Hgn0wJ7zKt5/AtMwzCx8EsmSDSfG9rgtBS0h+/PCXbI3H0Otda+WLqdZ7FW8yrep
         3oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TRsbbo4ViPYIqyZsosgMrz34Dc6G+Do/bUC21W9CMys=;
        b=RXEnlkImL6GAJX2Vu675otBAsqZRKZm7FYeDnfT+vS3mHPDrfpWxY+d/2yZT/m/a8+
         NvsS17sL1RnmJzEVCrjheUly6IuN5D6ADqnoS5uI8jFa/t2ZREK3rldaZ3jYbguagoQH
         DZHJBDOfXCN/Pt0csoCdWkWfmewbFrIFFI9ord6DODIuRXpar27+3u4+jBDK91Rtf9F2
         UFmv4QVblZl9/5YHJYpaSfivwEH0GO/AwQ3kmpaNAJTMYsj736IC4KijZCTYH4kiw/dl
         3sXDrOdWzMfntipnNJk6jLnqQcMzTikJSe9LLUY77UyD1ZKUDssZQXESiXVOZKxkzdsi
         q7vg==
X-Gm-Message-State: AOAM530TpfmzpaiNjA0qlllsdJvsDNCXJ40wwEge2FNmdIs0b2Ose+xh
	JJHRlpEV1KD1+iWBX6gIVD8=
X-Google-Smtp-Source: ABdhPJzyK0b3JaDV4IP0MAyBGSIlExgQrKagJ30l5eF8229ZaFXkQXt1a3xHCYiO/rGeeVr2ytZK+A==
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr2343698ljh.11.1639740937546;
        Fri, 17 Dec 2021 03:35:37 -0800 (PST)
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
Date: Fri, 17 Dec 2021 13:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.12.21 11:34, Oleksii Moisieiev wrote:


Hi Oleksii

> This is the implementation of SCI interface, called SCMI-SMC driver,
> which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> This allows devices from the Domains to work with clocks, resets and
> power-domains without access to CPG.
>
> The following features are implemented:
> - request SCMI channels from ATF and pass channels to Domains;
> - set device permissions for Domains based on the Domain partial
> device-tree. Devices with permissions are able to work with clocks,
> resets and power-domains via SCMI;
> - redirect scmi messages from Domains to ATF.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   xen/arch/arm/Kconfig          |   2 +
>   xen/arch/arm/sci/Kconfig      |  10 +
>   xen/arch/arm/sci/Makefile     |   1 +
>   xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
>   xen/include/public/arch-arm.h |   1 +
>   5 files changed, 809 insertions(+)
>   create mode 100644 xen/arch/arm/sci/Kconfig
>   create mode 100644 xen/arch/arm/sci/scmi_smc.c
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 186e1db389..02d96c6cfc 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -114,6 +114,8 @@ config SCI
>   	  support. It allows guests to control system resourcess via one of
>   	  SCI mediators implemented in XEN.
>   
> +source "arch/arm/sci/Kconfig"
> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> new file mode 100644
> index 0000000000..9563067ddc
> --- /dev/null
> +++ b/xen/arch/arm/sci/Kconfig
> @@ -0,0 +1,10 @@
> +config SCMI_SMC
> +	bool "Enable SCMI-SMC mediator driver"
> +	default n
> +	depends on SCI
> +	---help---
> +
> +	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
> +	This feature allows drivers from Domains to work with System
> +	Controllers (such as power,resets,clock etc.). SCP is used as transport
> +	for communication.
> diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> index 837dc7492b..67f2611872 100644
> --- a/xen/arch/arm/sci/Makefile
> +++ b/xen/arch/arm/sci/Makefile
> @@ -1 +1,2 @@
>   obj-y += sci.o
> +obj-$(CONFIG_SCMI_SMC) += scmi_smc.o
> diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
> new file mode 100644
> index 0000000000..2eb01ea82d
> --- /dev/null
> +++ b/xen/arch/arm/sci/scmi_smc.c
> @@ -0,0 +1,795 @@
> +/*
> + * xen/arch/arm/sci/scmi_smc.c
> + *
> + * SCMI mediator driver, using SCP as transport.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021, EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/sci/sci.h>
> +#include <asm/smccc.h>
> +#include <asm/io.h>
> +#include <xen/bitops.h>
> +#include <xen/config.h>
> +#include <xen/sched.h>
> +#include <xen/device_tree.h>
> +#include <xen/iocap.h>
> +#include <xen/init.h>
> +#include <xen/err.h>
> +#include <xen/lib.h>
> +#include <xen/list.h>
> +#include <xen/mm.h>
> +#include <xen/string.h>
> +#include <xen/time.h>
> +#include <xen/vmap.h>
> +
> +#define SCMI_BASE_PROTOCOL                  0x10
> +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> +#define SCMI_BASE_DISCOVER_AGENT            0x7
> +
> +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> +#define SCMI_SUCCESS              0
> +#define SCMI_NOT_SUPPORTED      (-1)
> +#define SCMI_INVALID_PARAMETERS (-2)
> +#define SCMI_DENIED             (-3)
> +#define SCMI_NOT_FOUND          (-4)
> +#define SCMI_OUT_OF_RANGE       (-5)
> +#define SCMI_BUSY               (-6)
> +#define SCMI_COMMS_ERROR        (-7)
> +#define SCMI_GENERIC_ERROR      (-8)
> +#define SCMI_HARDWARE_ERROR     (-9)
> +#define SCMI_PROTOCOL_ERROR     (-10)
> +
> +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> +
> +#define SCMI_SMC_ID                        "arm,smc-id"
> +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> +#define SCMI_SHMEM                         "shmem"
> +
> +#define HYP_CHANNEL                          0x0
> +
> +#define HDR_ID                             GENMASK(7,0)
> +#define HDR_TYPE                           GENMASK(9, 8)
> +#define HDR_PROTO                          GENMASK(17, 10)
> +
> +/* SCMI protocol, refer to section 4.2.2.2 (DEN0056C) */
> +#define MSG_N_AGENTS_MASK                  GENMASK(15, 8)
> +
> +#define FIELD_GET(_mask, _reg)\
> +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> +#define FIELD_PREP(_mask, _val)\
> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +typedef struct scmi_msg_header {
> +    uint8_t id;
> +    uint8_t type;
> +    uint8_t protocol;
> +} scmi_msg_header_t;
> +
> +typedef struct scmi_perms_tx {
> +    uint32_t agent_id;
> +    uint32_t device_id;
> +    uint32_t flags;
> +} scmi_perms_tx_t;
> +
> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE   BIT(0, UL)
> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR  BIT(1, UL)
> +
> +#define SCMI_ALLOW_ACCESS                   BIT(0, UL)
> +
> +struct scmi_shared_mem {
> +    uint32_t reserved;
> +    uint32_t channel_status;
> +    uint32_t reserved1[2];
> +    uint32_t flags;
> +    uint32_t length;
> +    uint32_t msg_header;
> +    uint8_t msg_payload[];
> +};
> +
> +struct scmi_channel {
> +    int chan_id;
> +    int agent_id;
> +    uint32_t func_id;
> +    int domain_id;
> +    uint64_t paddr;
> +    struct scmi_shared_mem *shmem;
> +    spinlock_t lock;
> +    struct list_head list;
> +};
> +
> +struct scmi_data {
> +    struct list_head channel_list;
> +    spinlock_t channel_list_lock;
> +    bool initialized;
> +    u64 shmem_addr, shmem_size;
> +};
> +
> +static struct scmi_data scmi_data;
> +
> +/*
> + * pack_scmi_header() - packs and returns 32-bit header
> + *
> + * @hdr: pointer to header containing all the information on message id,
> + *    protocol id and type id.
> + *
> + * Return: 32-bit packed message header to be sent to the platform.
> + */
> +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
> +{
> +    return FIELD_PREP(HDR_ID, hdr->id) |
> +        FIELD_PREP(HDR_TYPE, hdr->type) |
> +        FIELD_PREP(HDR_PROTO, hdr->protocol);
> +}
> +
> +/*
> + * unpack_scmi_header() - unpacks and records message and protocol id
> + *
> + * @msg_hdr: 32-bit packed message header sent from the platform
> + * @hdr: pointer to header to fetch message and protocol id.
> + */
> +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
> +{
> +    hdr->id = FIELD_GET(HDR_ID, msg_hdr);
> +    hdr->type = FIELD_GET(HDR_TYPE, msg_hdr);
> +    hdr->protocol = FIELD_GET(HDR_PROTO, msg_hdr);
> +}
> +
> +static inline int channel_is_free(struct scmi_channel *chan_info)
> +{
> +    return ( chan_info->shmem->channel_status
> +            & SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE ) ? 0 : -EBUSY;
> +}
> +
> +static int send_smc_message(struct scmi_channel *chan_info,
> +                            scmi_msg_header_t *hdr, void *data, int len)
> +{
> +    struct arm_smccc_res resp;
> +    int ret;
> +
> +    printk(XENLOG_DEBUG "scmi: status =%d len=%d\n",
> +           chan_info->shmem->channel_status, len);
> +    printk(XENLOG_DEBUG "scmi: header id = %d type = %d, proto = %d\n",
> +           hdr->id, hdr->type, hdr->protocol);
> +
> +    ret = channel_is_free(chan_info);
> +    if ( IS_ERR_VALUE(ret) )
> +        return ret;
> +
> +    chan_info->shmem->channel_status = 0x0;
> +    /* Writing 0x0 right now, but SCMI_SHMEM_FLAG_INTR_ENABLED can be set */
> +    chan_info->shmem->flags = 0x0;
> +    chan_info->shmem->length = sizeof(chan_info->shmem->msg_header) + len;
> +    chan_info->shmem->msg_header = pack_scmi_header(hdr);
> +
> +    printk(XENLOG_DEBUG "scmi: Writing to shmem address %p\n",
> +           chan_info->shmem);
> +    if ( len > 0 && data )
> +        memcpy((void *)(chan_info->shmem->msg_payload), data, len);
> +
> +    arm_smccc_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, chan_info->chan_id,
> +                  &resp);
> +
> +    printk(XENLOG_DEBUG "scmi: scmccc_smc response %d\n", (int)(resp.a0));
> +
> +    if ( resp.a0 )
> +        return -EOPNOTSUPP;
> +
> +    return 0;
> +}
> +
> +static int check_scmi_status(int scmi_status)
> +{
> +    if ( scmi_status == SCMI_SUCCESS )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "scmi: Error received: %d\n", scmi_status);
> +
> +    switch ( scmi_status )
> +    {
> +    case SCMI_NOT_SUPPORTED:
> +        return -EOPNOTSUPP;
> +    case SCMI_INVALID_PARAMETERS:
> +        return -EINVAL;
> +    case SCMI_DENIED:
> +        return -EACCES;
> +    case SCMI_NOT_FOUND:
> +        return -ENOENT;
> +    case SCMI_OUT_OF_RANGE:
> +        return -ERANGE;
> +    case SCMI_BUSY:
> +        return -EBUSY;
> +    case SCMI_COMMS_ERROR:
> +        return -ENOTCONN;
> +    case SCMI_GENERIC_ERROR:
> +        return -EIO;
> +    case SCMI_HARDWARE_ERROR:
> +        return -ENXIO;
> +    case SCMI_PROTOCOL_ERROR:
> +        return -EBADMSG;

Probably we should add a default: here?


> +    }
> +
> +    return -EINVAL;
> +}
> +
> +static int get_smc_response(struct scmi_channel *chan_info,
> +                            scmi_msg_header_t *hdr, void *data, int len)
> +{
> +    int recv_len;
> +    int ret;
> +
> +    printk(XENLOG_DEBUG "scmi: get smc responce msgid %d\n", hdr->id);
> +
> +    ret = channel_is_free(chan_info);
> +    if ( IS_ERR_VALUE(ret) )
> +        return ret;
> +
> +    recv_len = chan_info->shmem->length - sizeof(chan_info->shmem->msg_header);
> +
> +    if ( recv_len < 0 )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Wrong size of smc message. Data may be invalid\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( recv_len > len )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Not enough buffer for message %d, expecting %d\n",
> +               recv_len, len);
> +        return -EINVAL;
> +    }
> +
> +    unpack_scmi_header(chan_info->shmem->msg_header, hdr);
> +
> +    if ( recv_len > 0 )
> +    {
> +        memcpy(data, chan_info->shmem->msg_payload, recv_len);
> +    }
> +
> +    return 0;
> +}
> +
> +static int do_smc_xfer(struct scmi_channel *channel, scmi_msg_header_t *hdr, void *tx_data, int tx_size,
> +                       void *rx_data, int rx_size)
> +{
> +    int ret = 0;
> +
> +    if ( !hdr )
> +        return -EINVAL;
> +
> +    spin_lock(&channel->lock);
> +
> +    ret = send_smc_message(channel, hdr, tx_data, tx_size);
> +    if ( ret )
> +        goto clean;
> +
> +    ret = get_smc_response(channel, hdr, rx_data, rx_size);
> +clean:
> +    spin_unlock(&channel->lock);
> +
> +    return ret;
> +}
> +
> +static struct scmi_channel *get_channel_by_id(uint8_t chan_id)
> +{
> +    struct scmi_channel *curr;
> +    bool found = false;
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> +        if ( curr->chan_id == chan_id )
> +        {
> +            found = true;
> +            break;
> +        }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +    if ( found )
> +        return curr;
> +
> +    return NULL;
> +}
> +
> +static struct scmi_channel *get_channel_by_domain(uint8_t domain_id)
> +{
> +    struct scmi_channel *curr;
> +    bool found = false;
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> +        if ( curr->domain_id == domain_id )
> +        {
> +            found = true;
> +            break;
> +        }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +    if ( found )
> +        return curr;
> +
> +    return NULL;
> +}
> +
> +static struct scmi_channel *aquire_scmi_channel(int domain_id)
> +{
> +    struct scmi_channel *curr;
> +    bool found = false;
> +
> +    ASSERT(domain_id != DOMID_INVALID && domain_id >= 0);
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> +        if ( (curr->domain_id == DOMID_INVALID)
> +            && (curr->chan_id != HYP_CHANNEL) )
> +        {
> +            curr->domain_id = domain_id;
> +            found = true;
> +            break;
> +        }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +    if ( found )
> +        return curr;
> +
> +    return NULL;
> +}
> +
> +static void relinquish_scmi_channel(struct scmi_channel *channel)
> +{
> +    spin_lock(&scmi_data.channel_list_lock);
> +    ASSERT(channel != NULL);
> +    channel->domain_id = DOMID_INVALID;
> +    spin_unlock(&scmi_data.channel_list_lock);
> +}
> +
> +static struct scmi_channel *smc_create_channel(uint8_t chan_id,
> +                                               uint32_t func_id, uint64_t addr)
> +{
> +    struct scmi_channel *channel;
> +    mfn_t mfn;
> +
> +    channel = get_channel_by_id(chan_id);
> +    if ( channel )
> +        return ERR_PTR(EEXIST);
> +
> +    channel = xmalloc(struct scmi_channel);
> +    if ( !channel )
> +        return ERR_PTR(ENOMEM);
> +
> +    channel->chan_id = chan_id;
> +    channel->func_id = func_id;
> +    channel->domain_id = DOMID_INVALID;
> +    mfn = maddr_to_mfn(addr);
> +    channel->shmem = vmap(&mfn, 1);
> +    if ( !channel->shmem )
> +    {
> +        xfree(channel);
> +        return ERR_PTR(ENOMEM);
> +    }
> +
> +    printk(XENLOG_DEBUG "scmi: Got shmem after vmap %p\n", channel->shmem);
> +    channel->paddr = addr;
> +    channel->shmem->channel_status = SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
> +    spin_lock_init(&channel->lock);
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_add(&channel->list, &scmi_data.channel_list);
> +    spin_unlock(&scmi_data.channel_list_lock);
> +    return channel;
> +}
> +
> +static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t len)
> +{
> +    return iomem_permit_access(d, paddr_to_pfn(addr),
> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> +}
> +
> +static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
> +                                     uint64_t len)
> +{
> +    return iomem_deny_access(d, paddr_to_pfn(addr),
> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> +}

I wonder, why we need an extra level of indirection here. And if this is 
really needed, I wonder why map(unmap)_memory* name was chosen, as there 
is no memory mapping/unmapping really happens here.


> +
> +static int dt_update_domain_range(struct domain *d, uint64_t addr,
> +                                  uint64_t size)

Looks like *d is not used in this function.


> +{
> +    struct dt_device_node *shmem_node;
> +    __be32 *hw_reg;
> +    const struct dt_property *pp;
> +    uint32_t len;
> +
> +    shmem_node = dt_find_compatible_node(NULL, NULL, "arm,scmi-shmem");
> +
> +    if ( !shmem_node )
> +    {
> +        printk(XENLOG_ERR "scmi: Unable to find %s node in DT\n", SCMI_SHMEM);
> +        return -EINVAL;
> +    }
> +
> +    pp = dt_find_property(shmem_node, "reg", &len);
> +    if ( !pp )
> +    {
> +        printk(XENLOG_ERR "scmi: Unable to find regs entry in shmem node\n");
> +        return -ENOENT;
> +    }
> +
> +    hw_reg = pp->value;
> +    dt_set_range(&hw_reg, shmem_node, addr, size);
> +
> +    return 0;
> +}
> +
> +static void free_channel_list(void)
> +{
> +    struct scmi_channel *curr, *_curr;
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry_safe (curr, _curr, &scmi_data.channel_list, list)
> +    {
> +        vunmap(curr->shmem);
> +        list_del(&curr->list);
> +        xfree(curr);
> +    }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +}
> +
> +static __init bool scmi_probe(struct dt_device_node *scmi_node)


Generic question to consider ...
If probe fails for some reason (so we cannot use mediator in Xen) what 
should we do with SCMI nodes in domain's device-tree (leave as is, drop, 
etc)?


> +{
> +    struct dt_device_node *shmem_node;
> +    int ret, i;
> +    struct scmi_channel *channel, *agent_channel;
> +    int n_agents;
> +    scmi_msg_header_t hdr;
> +    struct rx_t {
> +        int32_t status;
> +        uint32_t attributes;
> +    } rx;
> +
> +    uint32_t func_id;
> +
> +    ASSERT(scmi_node != NULL);
> +
> +    INIT_LIST_HEAD(&scmi_data.channel_list);
> +    spin_lock_init(&scmi_data.channel_list_lock);
> +
> +    if ( !dt_property_read_u32(scmi_node, SCMI_SMC_ID, &func_id) )
> +    {
> +        printk(XENLOG_ERR "scmi: Unable to read smc-id from DT\n");
> +        return false;
> +    }
> +
> +    shmem_node = dt_find_node_by_name(NULL, SCMI_SHARED_MEMORY);
> +    if ( IS_ERR_OR_NULL(shmem_node) )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Device tree error, can't parse shmem phandle %ld\n",
> +               PTR_ERR(shmem_node));
> +        return false;
> +    }
> +
> +    ret = dt_device_get_address(shmem_node, 0, &scmi_data.shmem_addr,
> +                                &scmi_data.shmem_size);
> +    if ( IS_ERR_VALUE(ret) )
> +        return false;
> +
> +    channel = smc_create_channel(HYP_CHANNEL, func_id, scmi_data.shmem_addr);
> +    if ( IS_ERR(channel) )
> +        return false;
> +
> +    hdr.id = SCMI_BASE_PROTOCOL_ATTIBUTES;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    ret = do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
> +    if ( ret )
> +        goto clean;
> +
> +    ret = check_scmi_status(rx.status);
> +    if ( ret )
> +        goto clean;
> +
> +    n_agents = FIELD_GET(MSG_N_AGENTS_MASK, rx.attributes);
> +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
> +
> +    n_agents = (n_agents > scmi_data.shmem_size / PAGE_SIZE) ?
> +        scmi_data.shmem_size / PAGE_SIZE : n_agents;
> +
> +    for ( i = 1; i < n_agents; i++ )
> +    {
> +        uint32_t tx_agent_id = 0xFFFFFFFF;
> +        struct {
> +            int32_t status;
> +            uint32_t agent_id;
> +            char name[16];
> +        } da_rx;
> +
> +        agent_channel = smc_create_channel(i, func_id, scmi_data.shmem_addr +
> +                                           i * PAGE_SIZE);
> +        if ( IS_ERR(agent_channel) )
> +        {
> +            ret = PTR_ERR(agent_channel);
> +            goto clean;
> +        }
> +
> +        hdr.id = SCMI_BASE_DISCOVER_AGENT;
> +        hdr.type = 0;
> +        hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +        ret = do_smc_xfer(agent_channel, &hdr, &tx_agent_id,
> +                          sizeof(tx_agent_id), &da_rx, sizeof(da_rx));
> +        if ( ret )
> +            goto clean;
> +
> +        ret = check_scmi_status(da_rx.status);
> +        if ( ret )
> +            goto clean;
> +
> +        printk(XENLOG_DEBUG "scmi: status=0x%x id=0x%x name=%s\n",
> +                da_rx.status, da_rx.agent_id, da_rx.name);
> +
> +        agent_channel->agent_id = da_rx.agent_id;
> +    }
> +
> +    scmi_data.initialized = true;
> +    return true;
> +
> +clean:
> +    free_channel_list();
> +    return ret == 0;
> +}
> +
> +static int scmi_domain_init(struct domain *d)
> +{
> +    struct scmi_channel *channel;
> +    int ret;
> +
> +    if ( !scmi_data.initialized )
> +        return 0;
> +
> +    channel = aquire_scmi_channel(d->domain_id);
> +    if ( IS_ERR_OR_NULL(channel) )
> +        return -ENOENT;
> +
> +    printk(XENLOG_INFO "scmi: Aquire SCMI channel id = 0x%x , domain_id = %d"
> +           "paddr = 0x%lx\n", channel->chan_id, channel->domain_id,
> +           channel->paddr);


It seems this breaks build on Arm32:

scmi_smc.c: In function ‘scmi_domain_init’:
/home/otyshchenko/xen/xen/include/xen/config.h:53:24: error: format 
‘%lx’ expects argument of type ‘long unsigned int’, but argument 4 has 
type ‘uint64_t {aka long long unsigned int}’ [-Werror=format=]
  #define XENLOG_INFO    "<2>"
                         ^
scmi_smc.c:569:12: note: in expansion of macro ‘XENLOG_INFO’
      printk(XENLOG_INFO "scmi: Aquire SCMI channel id = 0x%x , 
domain_id = %d"
             ^~~~~~~~~~~
scmi_smc.c:570:25: note: format string is defined here
             "paddr = 0x%lx\n", channel->chan_id, channel->domain_id,
                        ~~^
                        %llx



> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        ret = map_memory_to_domain(d, scmi_data.shmem_addr,
> +                                   scmi_data.shmem_size);
> +        if ( IS_ERR_VALUE(ret) )
> +            goto error;
> +
> +        ret = dt_update_domain_range(d, channel->paddr, PAGE_SIZE);
> +        if ( IS_ERR_VALUE(ret) )
> +        {
> +            int rc = unmap_memory_from_domain(d, scmi_data.shmem_addr,
> +                                              scmi_data.shmem_size);
> +            if ( rc )
> +                printk(XENLOG_ERR "Unable to unmap_memory_from_domain\n");
> +
> +            goto error;
> +        }
> +    }
> +
> +    d->arch.sci = channel;
> +
> +    return 0;
> +error:
> +    relinquish_scmi_channel(channel);
> +
> +    return ret;
> +}
> +
> +static int scmi_add_device_by_devid(struct domain *d, uint32_t scmi_devid)
> +{
> +    struct scmi_channel *channel, *agent_channel;
> +    scmi_msg_header_t hdr;
> +    scmi_perms_tx_t tx;
> +    struct rx_t {
> +        int32_t status;
> +        uint32_t attributes;
> +    } rx;
> +    int ret;
> +
> +    if ( !scmi_data.initialized )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "scmi: scmi_devid = %d\n", scmi_devid);
> +
> +    agent_channel = get_channel_by_domain(d->domain_id);
> +    if ( IS_ERR_OR_NULL(agent_channel) )
> +        return PTR_ERR(agent_channel);
> +
> +    channel = get_channel_by_id(HYP_CHANNEL);
> +    if ( IS_ERR_OR_NULL(channel) )
> +        return PTR_ERR(channel);
> +
> +    hdr.id = SCMI_BASE_SET_DEVICE_PERMISSIONS;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    tx.agent_id = agent_channel->agent_id;
> +    tx.device_id = scmi_devid;
> +    tx.flags = SCMI_ALLOW_ACCESS;
> +
> +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(&rx));
> +    if ( IS_ERR_VALUE(ret) )
> +        return ret;
> +
> +    ret = check_scmi_status(rx.status);
> +    if ( IS_ERR_VALUE(ret) )
> +        return ret;
> +
> +    return 0;
> +}
> +
> +static int scmi_add_dt_device(struct domain *d, struct dt_device_node *dev)
> +{
> +    uint32_t scmi_devid;
> +
> +    if ( (!scmi_data.initialized) || (!d->arch.sci) )
> +        return 0;
> +
> +    if ( !dt_property_read_u32(dev, "scmi_devid", &scmi_devid) )
> +        return 0;
> +
> +    printk(XENLOG_INFO "scmi: dt_node = %s\n", dt_node_full_name(dev));
> +
> +    return scmi_add_device_by_devid(d, scmi_devid);
> +}
> +
> +static int scmi_relinquish_resources(struct domain *d)
> +{
> +    int ret;
> +    struct scmi_channel *channel, *agent_channel;
> +    scmi_msg_header_t hdr;
> +    struct reset_agent_tx {
> +        uint32_t agent_id;
> +        uint32_t flags;
> +    } tx;
> +    uint32_t rx;
> +
> +    if ( !d->arch.sci )
> +        return 0;
> +
> +    agent_channel = d->arch.sci;
> +
> +    spin_lock(&agent_channel->lock);
> +    tx.agent_id = agent_channel->agent_id;
> +    spin_unlock(&agent_channel->lock);
> +
> +    channel = get_channel_by_id(HYP_CHANNEL);
> +    if ( !channel )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Unable to get Hypervisor scmi channel for domain %d\n",
> +               d->domain_id);
> +        return -EINVAL;
> +    }
> +
> +    hdr.id = SCMI_BASE_RESET_AGENT_CONFIGURATION;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    tx.flags = 0;
> +
> +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(rx));
> +    if ( ret )
> +        return ret;
> +
> +    ret = check_scmi_status(rx);
> +
> +    return ret;
> +}
> +
> +static void scmi_domain_destroy(struct domain *d)
> +{
> +    struct scmi_channel *channel;
> +
> +    if ( !d->arch.sci )
> +        return;
> +
> +    channel = d->arch.sci;
> +    spin_lock(&channel->lock);
> +
> +    relinquish_scmi_channel(channel);
> +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
> +
> +    d->arch.sci = NULL;
> +
> +    unmap_memory_from_domain(d, channel->paddr, PAGE_SIZE);
I didn't manage to find where corresponding map_memory_from_domain() is 
called for a non-hardware domain (it seems that scmi_domain_init() only 
directly handles hardware domain case).
Or perhaps, it is called indirectly at do_domctl(): case 
XEN_DOMCTL_iomem_permission:?


I wonder, do we really need to call this here? Taking into the account 
that unmap_memory_from_domain() doesn't actually unmap anything, but 
only removes a range from the iomem_caps rangeset
for the domain to be destroyed and all involved rangesets (including 
iomem_caps) will be removed soon at rangeset_domain_destroy() anyway. Or 
I missed something?


> +    spin_unlock(&channel->lock);
> +    return;

empty return could be dropped, I think.


> +}
> +
> +static bool scmi_handle_call(struct domain *d, void *args)
> +{
> +    bool res = false;
> +    struct scmi_channel *agent_channel;
> +    struct arm_smccc_res resp;
> +    struct cpu_user_regs *regs = args;
> +
> +    if ( !d->arch.sci )
> +        return false;
> +
> +    agent_channel = d->arch.sci;
> +    spin_lock(&agent_channel->lock);
> +
> +    if ( agent_channel->func_id != regs->x0 )

This also breaks build on Arm32:

scmi_smc.c: In function ‘scmi_handle_call’:
scmi_smc.c:736:42: error: ‘struct cpu_user_regs’ has no member named 
‘x0’; did you mean ‘r0’?
      if ( agent_channel->func_id != regs->x0 )
                                           ^~
                                           r0
cc1: all warnings being treated as errors

***

BTW, I noticed that xen/arch/arm/traps.c contains the following 
construct, probably we might want something similar here?

#ifdef CONFIG_ARM_64
#define HYPERCALL_RESULT_REG(r) (r)->x0
[snip]
#else
#define HYPERCALL_RESULT_REG(r) (r)->r0
[snip]
#endif


This RFC patch series, so I think, there is no serious issues at the 
moment, this is rather to let you know for the future (when you drop RFC 
tag).
I have to admit, I often forget to build-test on Arm32 also))


> +    {
> +        printk(XENLOG_ERR "scmi: func_id mismatch, exiting\n");
> +        goto unlock;
> +    }
> +
> +    arm_smccc_smc(agent_channel->func_id, 0, 0, 0, 0, 0, 0,
> +                  agent_channel->chan_id, &resp);
> +
> +    set_user_reg(regs, 0, resp.a0);
> +    set_user_reg(regs, 1, resp.a1);
> +    set_user_reg(regs, 2, resp.a2);
> +    set_user_reg(regs, 3, resp.a3);
> +    res = true;
> +unlock:
> +    spin_unlock(&agent_channel->lock);
> +
> +    return res;
> +}
> +
> +static int scmi_get_channel_paddr(void *scmi_ops,
> +                           struct xen_arch_domainconfig *config)
> +{
> +    struct scmi_channel *agent_channel = scmi_ops;
> +
> +    if ( !agent_channel )
> +        return -EINVAL;
> +
> +    config->sci_agent_paddr = agent_channel->paddr;
> +    return 0;
> +}
> +
> +static const struct dt_device_match scmi_smc_match[] __initconst =
> +{
> +    DT_MATCH_SCMI_SMC,
> +    { /* sentinel */ },
> +};
> +
> +static const struct sci_mediator_ops scmi_ops =
> +{
> +    .probe = scmi_probe,
> +    .domain_init = scmi_domain_init,
> +    .domain_destroy = scmi_domain_destroy,
> +    .add_dt_device = scmi_add_dt_device,
> +    .relinquish_resources = scmi_relinquish_resources,
> +    .handle_call = scmi_handle_call,
> +    .get_channel_info = scmi_get_channel_paddr
> +};
> +
> +REGISTER_SCI_MEDIATOR(scmi_smc, "SCMI-SMC", XEN_DOMCTL_CONFIG_SCI_SCMI_SMC,
> +                      scmi_smc_match, &scmi_ops);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 9180be5e86..a67237942d 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -315,6 +315,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>   
>   #define XEN_DOMCTL_CONFIG_SCI_NONE      0
> +#define XEN_DOMCTL_CONFIG_SCI_SCMI_SMC  1
>   
>   struct xen_arch_domainconfig {
>       /* IN/OUT */

-- 
Regards,

Oleksandr Tyshchenko


