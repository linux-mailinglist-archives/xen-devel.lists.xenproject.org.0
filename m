Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7485470E9
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 03:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346886.572847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzpr7-0000Bq-OA; Sat, 11 Jun 2022 01:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346886.572847; Sat, 11 Jun 2022 01:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzpr7-000098-Ky; Sat, 11 Jun 2022 01:24:01 +0000
Received: by outflank-mailman (input) for mailman id 346886;
 Sat, 11 Jun 2022 01:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzpr6-000092-4I
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 01:24:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28493810-e925-11ec-8901-93a377f238d6;
 Sat, 11 Jun 2022 03:23:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D75261FBA;
 Sat, 11 Jun 2022 01:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A67DC34114;
 Sat, 11 Jun 2022 01:23:52 +0000 (UTC)
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
X-Inumbo-ID: 28493810-e925-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654910632;
	bh=qlQhxTGJ2cFmJQ6PlTzzwW4WRSpuCsiHNIg2UOlDPJI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aKSzmIFrV92LdmIj+ukWODJWsY4d6lQIOyhzkDlbke5IXKF1wB34G8ncP1LXRSWP6
	 k9UgctZfVYWKdAK9d0BlZvBtcmFLW9D51UP+b/d1qUHWyhVNTnHiqJ/QkY1vUWaXtj
	 zHEdtgSFF5YBaip/0wN+9hj4QsZaMtFOiU21dxr3+9WwKHHZEhcu+dHiJ19A+qbT7h
	 GLuRLal/2KBtCHcPJZddUDOIpyG8OBP4bVv8CuY6/KXprLSQqbjYeLqRzXMm2WSY8+
	 c54n/tSw8V5Q3Pc4xt7DQ7vwi3JJsdVeqy3qUGcKghbMdZrB/sxwUc2oQM2S2pQSfH
	 9+1TDlpkyTFIA==
Date: Fri, 10 Jun 2022 18:23:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jens Wiklander <jens.wiklander@linaro.org>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
In-Reply-To: <20220609061812.422130-3-jens.wiklander@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2206101758030.756493@ubuntu-linux-20-04-desktop>
References: <20220609061812.422130-1-jens.wiklander@linaro.org> <20220609061812.422130-3-jens.wiklander@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jun 2022, Jens Wiklander wrote:
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> The implementation is the bare minimum to be able to communicate with
> OP-TEE running as an SPMC at S-EL1.
> 
> This is loosely based on the TEE mediator framework and the OP-TEE
> mediator.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Hi Jens, thanks for rebasing. This is not a full review because I ran
out of time but some initial comments.


> ---
>  xen/arch/arm/Kconfig              |   11 +
>  xen/arch/arm/Makefile             |    1 +
>  xen/arch/arm/domain.c             |   10 +
>  xen/arch/arm/ffa.c                | 1624 +++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h |    4 +
>  xen/arch/arm/include/asm/ffa.h    |   71 ++
>  xen/arch/arm/vsmc.c               |   17 +-
>  7 files changed, 1735 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/ffa.c
>  create mode 100644 xen/arch/arm/include/asm/ffa.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..5b75067e2745 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,17 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config FFA
> +	bool "Enable FF-A mediator support" if EXPERT
> +	default n
> +	depends on ARM_64
> +	help
> +	  This option enables a minamal FF-A mediator. The mediator is
> +	  generic as it follows the FF-A specification [1], but it only
> +	  implements a small substet of the specification.
> +
> +	  [1] https://developer.arm.com/documentation/den0077/latest
> +
>  endmenu
>  
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 1d862351d111..dbf5e593a069 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -20,6 +20,7 @@ obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-y += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-$(CONFIG_FFA) += ffa.o
>  obj-y += gic.o
>  obj-y += gic-v2.o
>  obj-$(CONFIG_GICV3) += gic-v3.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df8638..a93e6a9c4aef 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -27,6 +27,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
>  #include <asm/event.h>
> +#include <asm/ffa.h>
>  #include <asm/gic.h>
>  #include <asm/guest_atomics.h>
>  #include <asm/irq.h>
> @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
>          goto fail;
>  
> +    if ( (rc = ffa_domain_init(d)) != 0 )
> +        goto fail;
> +
>      update_domain_wallclock_time(d);
>  
>      /*
> @@ -998,6 +1002,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>  enum {
>      PROG_pci = 1,
>      PROG_tee,
> +    PROG_ffa,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> @@ -1046,6 +1051,11 @@ int domain_relinquish_resources(struct domain *d)
>          if (ret )
>              return ret;
>  
> +    PROGRESS(ffa):
> +        ret = ffa_relinquish_resources(d);
> +        if (ret )
> +            return ret;
> +
>      PROGRESS(xen):
>          ret = relinquish_memory(d, &d->xenpage_list);
>          if ( ret )
> diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
> new file mode 100644
> index 000000000000..9063b7f2b59e
> --- /dev/null
> +++ b/xen/arch/arm/ffa.c
> @@ -0,0 +1,1624 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2021  Linaro Limited
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/sizes.h>
> +#include <xen/bitops.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/event.h>
> +#include <asm/ffa.h>
> +#include <asm/regs.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK			0
> +#define FFA_RET_NOT_SUPPORTED		-1
> +#define FFA_RET_INVALID_PARAMETERS	-2
> +#define FFA_RET_NO_MEMORY		-3
> +#define FFA_RET_BUSY			-4
> +#define FFA_RET_INTERRUPTED		-5
> +#define FFA_RET_DENIED			-6
> +#define FFA_RET_RETRY			-7
> +#define FFA_RET_ABORTED			-8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR		_AC(1,U)
> +#define FFA_VERSION_MAJOR_SHIFT		_AC(16,U)
> +#define FFA_VERSION_MAJOR_MASK		_AC(0x7FFF,U)
> +#define FFA_VERSION_MINOR		_AC(1,U)
> +#define FFA_VERSION_MINOR_SHIFT		_AC(0,U)
> +#define FFA_VERSION_MINOR_MASK		_AC(0xFFFF,U)
> +#define MAKE_FFA_VERSION(major, minor)	\
> +	((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
> +	 ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_MIN_VERSION		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_0		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1		MAKE_FFA_VERSION(1, 1)
> +#define FFA_MY_VERSION		MAKE_FFA_VERSION(FFA_VERSION_MAJOR, \
> +						 FFA_VERSION_MINOR)
> +
> +
> +#define FFA_HANDLE_HYP_FLAG             BIT(63,ULL)
> +
> +/* Memory attributes: Normal memory, Write-Back cacheable, Inner shareable */
> +#define FFA_NORMAL_MEM_REG_ATTR		_AC(0x2f,U)
> +
> +/* Memory access permissions: Read-write */
> +#define FFA_MEM_ACC_RW			_AC(0x2,U)
> +
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR		BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE	BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH	BIT(2, U)
> +
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (_AC(1,U) << 3)
> +/* Relayer must choose the alignment boundary */
> +#define FFA_MEMORY_REGION_FLAG_ANY_ALIGNMENT	_AC(0,U)
> +
> +#define FFA_HANDLE_INVALID		_AC(0xffffffffffffffff,ULL)
> +
> +/* Framework direct request/response */
> +#define FFA_MSG_FLAG_FRAMEWORK		BIT(31, U)
> +#define FFA_MSG_TYPE_MASK		_AC(0xFF,U);
> +#define FFA_MSG_PSCI			_AC(0x0,U)
> +#define FFA_MSG_SEND_VM_CREATED		_AC(0x4,U)
> +#define FFA_MSG_RESP_VM_CREATED		_AC(0x5,U)
> +#define FFA_MSG_SEND_VM_DESTROYED	_AC(0x6,U)
> +#define FFA_MSG_RESP_VM_DESTROYED	_AC(0x7,U)
> +
> +/*
> + * Flags used for the FFA_PARTITION_INFO_GET return message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0,U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1,U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2,U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3,U)
> +#define FFA_PART_PROP_IS_PE_ID          (_AC(0,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (_AC(1,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (_AC(2,U) << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (_AC(3,U) << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6,U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7,U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8,U)
> +
> +/* Function IDs */
> +#define FFA_ERROR			_AC(0x84000060,U)
> +#define FFA_SUCCESS_32			_AC(0x84000061,U)
> +#define FFA_SUCCESS_64			_AC(0xC4000061,U)
> +#define FFA_INTERRUPT			_AC(0x84000062,U)
> +#define FFA_VERSION			_AC(0x84000063,U)
> +#define FFA_FEATURES			_AC(0x84000064,U)
> +#define FFA_RX_ACQUIRE			_AC(0x84000084,U)
> +#define FFA_RX_RELEASE			_AC(0x84000065,U)
> +#define FFA_RXTX_MAP_32			_AC(0x84000066,U)
> +#define FFA_RXTX_MAP_64			_AC(0xC4000066,U)
> +#define FFA_RXTX_UNMAP			_AC(0x84000067,U)
> +#define FFA_PARTITION_INFO_GET		_AC(0x84000068,U)
> +#define FFA_ID_GET			_AC(0x84000069,U)
> +#define FFA_SPM_ID_GET			_AC(0x84000085,U)
> +#define FFA_MSG_WAIT			_AC(0x8400006B,U)
> +#define FFA_MSG_YIELD			_AC(0x8400006C,U)
> +#define FFA_MSG_RUN			_AC(0x8400006D,U)
> +#define FFA_MSG_SEND2			_AC(0x84000086,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_32	_AC(0x8400006F,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_64	_AC(0xC400006F,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_32	_AC(0x84000070,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_64	_AC(0xC4000070,U)
> +#define FFA_MEM_DONATE_32		_AC(0x84000071,U)
> +#define FFA_MEM_DONATE_64		_AC(0xC4000071,U)
> +#define FFA_MEM_LEND_32			_AC(0x84000072,U)
> +#define FFA_MEM_LEND_64			_AC(0xC4000072,U)
> +#define FFA_MEM_SHARE_32		_AC(0x84000073,U)
> +#define FFA_MEM_SHARE_64		_AC(0xC4000073,U)
> +#define FFA_MEM_RETRIEVE_REQ_32		_AC(0x84000074,U)
> +#define FFA_MEM_RETRIEVE_REQ_64		_AC(0xC4000074,U)
> +#define FFA_MEM_RETRIEVE_RESP		_AC(0x84000075,U)
> +#define FFA_MEM_RELINQUISH		_AC(0x84000076,U)
> +#define FFA_MEM_RECLAIM			_AC(0x84000077,U)
> +#define FFA_MEM_FRAG_RX			_AC(0x8400007A,U)
> +#define FFA_MEM_FRAG_TX			_AC(0x8400007B,U)
> +#define FFA_MSG_SEND			_AC(0x8400006E,U)
> +#define FFA_MSG_POLL			_AC(0x8400006A,U)
> +
> +/* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
> +/* Memory access permissions descriptor */
> +struct ffa_mem_access_perm {
> +    uint16_t endpoint_id;
> +    uint8_t perm;
> +    uint8_t flags;
> +};
> +
> +/* Endpoint memory access descriptor */
> +struct ffa_mem_access {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint64_t reserved;
> +};
> +
> +/* Lend, donate or share memory transaction descriptor */
> +struct ffa_mem_transaction_1_0 {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t reserved0;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t reserved1;
> +    uint32_t mem_access_count;
> +    struct ffa_mem_access mem_access_array[];
> +};
> +
> +struct ffa_mem_transaction_1_1 {
> +    uint16_t sender_id;
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_count;
> +    uint32_t mem_access_offs;
> +    uint8_t reserved[12];
> +};
> +
> +/*
> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> + * ffa_mem_transaction_1_1, used to provide an abstraction of difference in
> + * data structures between version 1.0 and 1.1. This is just an internal
> + * interface and can be changed without changing any ABI.
> + */
> +struct ffa_mem_transaction_x {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +};
> +
> +/* Endpoint RX/TX descriptor */
> +struct ffa_endpoint_rxtx_descriptor_1_0 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_range_count;
> +    uint32_t tx_range_count;
> +};
> +
> +struct ffa_endpoint_rxtx_descriptor_1_1 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_region_offs;
> +    uint32_t tx_region_offs;
> +};
> +
> +struct ffa_ctx {
> +    void *rx;
> +    void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    unsigned int page_count;
> +    uint32_t guest_vers;
> +    bool tx_is_mine;
> +    bool interrupted;
> +};
> +
> +struct ffa_shm_mem {
> +    struct list_head list;
> +    uint16_t sender_id;
> +    uint16_t ep_id;     /* endpoint, the one lending */
> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    unsigned int page_count;
> +    struct page_info *pages[];
> +};
> +
> +struct mem_frag_state {
> +    struct list_head list;
> +    struct ffa_shm_mem *shm;
> +    uint32_t range_count;
> +    unsigned int current_page_idx;
> +    unsigned int frag_offset;
> +    unsigned int range_offset;
> +    uint8_t *buf;
> +    unsigned int buf_size;
> +    struct ffa_address_range range;
> +};
> +
> +/*
> + * Our rx/rx buffer shared with the SPMC
> + */
> +static uint32_t ffa_version;
> +static uint16_t *subsr_vm_created;
> +static unsigned int subsr_vm_created_count;
> +static uint16_t *subsr_vm_destroyed;
> +static unsigned int subsr_vm_destroyed_count;
> +static void *ffa_rx;
> +static void *ffa_tx;
> +static unsigned int ffa_page_count;
> +static spinlock_t ffa_buffer_lock = SPIN_LOCK_UNLOCKED;

DEFINE_SPINLOCK. But actually shouldn't the spin_locks be per-domain? It
looks like that at least some of the locks don't need to be global.


> +static struct list_head ffa_mem_list = LIST_HEAD_INIT(ffa_mem_list);
> +static struct list_head ffa_frag_list = LIST_HEAD_INIT(ffa_frag_list);

LIST_HEAD(ffa_mem_list);
LIST_HEAD(ffa_frag_list);

> +static spinlock_t ffa_mem_list_lock = SPIN_LOCK_UNLOCKED;

DEFINE_SPINLOCK


> +static uint64_t next_handle = FFA_HANDLE_HYP_FLAG;
> +
> +static uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> +{
> +    return (uint64_t)reg0 << 32 | reg1;
> +}
> +
> +static void reg_pair_from_64(uint32_t *reg0, uint32_t *reg1, uint64_t val)
> +{
> +    *reg0 = val >> 32;
> +    *reg1 = val;
> +}

I think these two should be static inline


> +static bool ffa_get_version(uint32_t *vers)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_VERSION, .a1 = FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> +    {
> +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
> +        return false;
> +    }
> +
> +    *vers = resp.a0;
> +    return true;
> +}
> +
> +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> +                             uint32_t page_count)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +#ifdef CONFIG_ARM_64
> +        .a0 = FFA_RXTX_MAP_64,
> +#endif

This ifdef is unnecessary given that FFA depends on ARM64 and SMCCCv1.2
is only implemented on ARM64. It also applies to all the other ifdefs in
this file. You can remove the code under #ifdef CONFIG_ARM_32.


> +#ifdef CONFIG_ARM_32
> +        .a0 = FFA_RXTX_MAP_32,
> +#endif
> +	.a1 = tx_addr, .a2 = rx_addr,
> +        .a3 = page_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 == FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_rxtx_unmap(uint16_t vm_id)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_RXTX_UNMAP, .a1 = vm_id,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 == FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> +                                       uint32_t w4, uint32_t w5,
> +                                       uint32_t *count)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_PARTITION_INFO_GET, .a1 = w1, .a2 = w2, .a3 = w3, .a4 = w4,
> +        .a5 = w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 == FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    *count = resp.a2;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_rx_release(void)
> +{
> +    const struct arm_smccc_1_2_regs arg = { .a0 = FFA_RX_RELEASE, };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 == FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_MEM_SHARE_32, .a1 = tot_len, .a2 = frag_len, .a3 = addr,
> +        .a4 = pg_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    /*
> +     * For arm64 we must use 64-bit calling convention if the buffer isn't
> +     * passed in our tx buffer.
> +     */
> +    if (sizeof(addr) > 4 && addr)
> +        arg.a0 = FFA_MEM_SHARE_64;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 ) {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        *handle = reg_pair_to_64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle = reg_pair_to_64(resp.a2, resp.a1);
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;

coding style: alignment


> +    }
> +}
> +
> +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> +                               uint16_t sender_id)
> +{
> +    struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_MEM_FRAG_TX, .a1 = handle & UINT32_MAX, .a2 = handle >> 32,
> +        .a3 = frag_len, .a4 = (uint32_t)sender_id << 16,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 ) {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static uint32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> +                                uint32_t flags)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_MEM_RECLAIM, .a1 = handle_lo, .a2 = handle_hi, .a3 = flags,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 == FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> +    int32_t res;
> +
> +    if ( msg != FFA_MSG_SEND_VM_CREATED && msg !=FFA_MSG_SEND_VM_DESTROYED )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> +    else
> +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg = {
> +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 = sp_id,
> +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 = vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp ) {
> +            /*
> +             * This is an invalid response, likely due to some error in the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res = resp.a3;
> +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
> +
> +    return res;
> +}
> +
> +static u16 get_vm_id(struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> +                     register_t v2, register_t v3, register_t v4, register_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
> +{
> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +                             uint32_t w3)
> +{
> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle_lo,
> +                             uint32_t handle_hi, uint32_t frag_offset,
> +                             uint16_t sender_id)
> +{
> +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> +             (uint32_t)sender_id << 16, 0, 0, 0);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    uint32_t vers = get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers = FFA_VERSION_1_0;
> +    else
> +        vers = FFA_VERSION_1_1;
> +
> +    ctx->guest_vers = vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret = FFA_RET_NOT_SUPPORTED;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        tx_addr &= UINT32_MAX;
> +        rx_addr &= UINT32_MAX;
> +    }
> +
> +    /* For now to keep things simple, only deal with a single page */
> +    if ( page_count != 1 )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg = get_page_from_gfn(d, gaddr_to_gfn(tx_addr), &t, P2M_ALLOC);
> +    if ( !tx_pg )
> +        return FFA_RET_NOT_SUPPORTED;

It looks like this should be another error: if get_page_from_gfn fails
it is probably because the provided page is invalid, so we should return
FFA_RET_INVALID_PARAMETERS ?


> +    /* Only normal RAM for now */
> +    if (t != p2m_ram_rw)
> +        goto err_put_tx_pg;
> +
> +    rx_pg = get_page_from_gfn(d, gaddr_to_gfn(rx_addr), &t, P2M_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;

same here?


> +    /* Only normal RAM for now */
> +    if ( t != p2m_ram_rw )
> +        goto err_put_rx_pg;
> +
> +    tx = __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx = __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx = rx;
> +    ctx->tx = tx;
> +    ctx->rx_pg = rx_pg;
> +    ctx->tx_pg = tx_pg;
> +    ctx->page_count = 1;
> +    ctx->tx_is_mine = true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +    return ret;
> +}
> +
> +static uint32_t handle_rxtx_unmap(void)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    uint32_t ret;
> +
> +    if ( !ctx-> rx )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    ret = ffa_rxtx_unmap(get_vm_id(d));
> +    if ( ret )
> +        return ret;
> +
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx = NULL;
> +    ctx->tx = NULL;
> +    ctx->rx_pg = NULL;
> +    ctx->tx_pg = NULL;
> +    ctx->page_count = 0;
> +    ctx->tx_is_mine = false;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> +                                          uint32_t w4, uint32_t w5,
> +                                          uint32_t *count)
> +{
> +    uint32_t ret = FFA_RET_DENIED;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +
> +    if ( !ffa_page_count )
> +        return FFA_RET_DENIED;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    if ( !ctx->page_count || !ctx->tx_is_mine )
> +        goto out;
> +    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( ret )
> +        goto out;
> +    if ( ctx->guest_vers == FFA_VERSION_1_0 ) {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src = ffa_rx;
> +        struct ffa_partition_info_1_0 *dst = ctx->rx;
> +
> +        for ( n = 0; n < *count; n++ ) {
> +            dst[n].id = src[n].id;
> +            dst[n].execution_context = src[n].execution_context;
> +            dst[n].partition_properties = src[n].partition_properties;
> +        }
> +    } else {
> +        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ffa_rx_release();
> +    ctx->tx_is_mine = false;
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    return ret;
> +}
> +
> +static uint32_t handle_rx_release(void)
> +{
> +    uint32_t ret = FFA_RET_DENIED;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    if ( !ctx->page_count || ctx->tx_is_mine )
> +        goto out;
> +    ret = FFA_RET_OK;
> +    ctx->tx_is_mine = true;
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    return ret;
> +}
> +
> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
> +    struct arm_smccc_1_2_regs resp = { };
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask = 0xffffffffffffffff;
> +    else
> +        mask = 0xffffffff;
> +
> +    src_dst = get_user_reg(regs, 1);
> +    if ( (src_dst >> 16) != get_vm_id(d) )
> +    {
> +        resp.a0 = FFA_ERROR;
> +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    arg.a1 = src_dst;
> +    arg.a2 = get_user_reg(regs, 2) & mask;
> +    arg.a3 = get_user_reg(regs, 3) & mask;
> +    arg.a4 = get_user_reg(regs, 4) & mask;
> +    arg.a5 = get_user_reg(regs, 5) & mask;
> +    arg.a6 = get_user_reg(regs, 6) & mask;
> +    arg.a7 = get_user_reg(regs, 7) & mask;
> +
> +    while ( true ) {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +
> +        switch ( resp.a0 )
> +        {
> +        case FFA_INTERRUPT:
> +            ctx->interrupted = true;
> +            goto out;
> +        case FFA_ERROR:
> +        case FFA_SUCCESS_32:
> +        case FFA_SUCCESS_64:
> +        case FFA_MSG_SEND_DIRECT_RESP_32:
> +        case FFA_MSG_SEND_DIRECT_RESP_64:
> +            goto out;
> +        default:
> +            /* Bad fid, report back. */
> +            memset(&arg, 0, sizeof(arg));
> +            arg.a0 = FFA_ERROR;
> +            arg.a1 = src_dst;
> +            arg.a2 = FFA_RET_NOT_SUPPORTED;
> +            continue;
> +        }
> +    }
> +
> +out:
> +    set_user_reg(regs, 0, resp.a0);
> +    set_user_reg(regs, 2, resp.a2 & mask);
> +    set_user_reg(regs, 1, resp.a1 & mask);
> +    set_user_reg(regs, 3, resp.a3 & mask);
> +    set_user_reg(regs, 4, resp.a4 & mask);
> +    set_user_reg(regs, 5, resp.a5 & mask);
> +    set_user_reg(regs, 6, resp.a6 & mask);
> +    set_user_reg(regs, 7, resp.a7 & mask);
> +}
> +
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         struct ffa_address_range *range, uint32_t range_count,
> +                         unsigned int start_page_idx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx = start_page_idx;
> +    unsigned long gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +
> +    for ( n = 0; n < range_count; n++ ) {
> +        for ( m = 0; m < range[n].page_count; m++ ) {
> +            if ( pg_idx >= shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            addr = read_atomic(&range[n].address);
> +            gfn = gaddr_to_gfn(addr + m * PAGE_SIZE);
> +            shm->pages[pg_idx] = get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +            /* Only normal RAM for now */
> +            if ( t != p2m_ram_rw )
> +                return FFA_RET_DENIED;
> +        }
> +    }
> +
> +    *last_page_idx = pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n = 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        if ( shm->pages[n] ) {
> +            put_page(shm->pages[n]);
> +            shm->pages[n] = NULL;
> +        }
> +    }
> +}
> +
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa)
> +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address = pa;
> +    addr_range->page_count = 1;
> +}
> +
> +static int share_shm(struct ffa_shm_mem *shm)
> +{
> +    uint32_t max_frag_len = ffa_page_count * PAGE_SIZE;
> +    struct ffa_mem_transaction_1_1 *descr = ffa_tx;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_region *region_descr;
> +    struct ffa_address_range *addr_range;
> +    paddr_t pa;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    int ret;
> +    unsigned int range_count;
> +    unsigned int range_base;
> +    bool first;
> +
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id = shm->sender_id;
> +    descr->global_handle = shm->handle;
> +    descr->mem_reg_attr = FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count = 1;
> +    descr->mem_access_size = sizeof(*mem_access_array);
> +    descr->mem_access_offs = sizeof(*descr);
> +    mem_access_array = (void *)(descr + 1);
> +    region_descr = (void *)(mem_access_array + 1);
> +
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
> +    mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs = (vaddr_t)region_descr - (vaddr_t)ffa_tx;
> +
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count = shm->page_count;
> +
> +    region_descr->address_range_count = 1;
> +    last_pa = page_to_maddr(shm->pages[0]);
> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> +    {
> +        pa = page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE == pa )
> +        {
> +            continue;
> +        }
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len = sizeof(*descr) + sizeof(*mem_access_array) +
> +              sizeof(*region_descr) +
> +              region_descr->address_range_count * sizeof(*addr_range);
> +
> +    addr_range = region_descr->address_range_array;
> +    frag_len = (vaddr_t)(addr_range + 1) - (vaddr_t)ffa_tx;
> +    last_pa = page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    first = true;
> +    range_count = 1;
> +    range_base = 0;
> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> +    {
> +        pa = page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE == pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        if (frag_len == max_frag_len) {
> +            if (first)
> +            {
> +                ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +                first = false;
> +            }
> +            else
> +            {
> +                ret = ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +            }
> +            if (ret <= 0)
> +                return ret;
> +            range_base = range_count;
> +            range_count = 0;
> +            frag_len = sizeof(*addr_range);
> +            addr_range = ffa_tx;
> +        } else {
> +            frag_len += sizeof(*addr_range);
> +            addr_range++;
> +        }
> +        init_range(addr_range, pa);
> +        range_count++;
> +    }
> +
> +    if (first)
> +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    else
> +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, void *buf, size_t blen,
> +                                struct ffa_mem_transaction_x *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if (ffa_vers >= FFA_VERSION_1_1) {
> +        struct ffa_mem_transaction_1_1 *descr;
> +
> +        if (blen < sizeof(*descr))
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr = buf;
> +        trans->sender_id = read_atomic(&descr->sender_id);
> +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> +        flags = read_atomic(&descr->flags);
> +        trans->global_handle = read_atomic(&descr->global_handle);
> +        trans->tag = read_atomic(&descr->tag);
> +
> +        count = read_atomic(&descr->mem_access_count);
> +        size = read_atomic(&descr->mem_access_size);
> +        offs = read_atomic(&descr->mem_access_offs);
> +    } else {
> +        struct ffa_mem_transaction_1_0 *descr;
> +
> +        if (blen < sizeof(*descr))
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr = buf;
> +        trans->sender_id = read_atomic(&descr->sender_id);
> +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> +        flags = read_atomic(&descr->flags);
> +        trans->global_handle = read_atomic(&descr->global_handle);
> +        trans->tag = read_atomic(&descr->tag);
> +
> +        count = read_atomic(&descr->mem_access_count);
> +        size = sizeof(struct ffa_mem_access);
> +        offs = offsetof(struct ffa_mem_transaction_1_0, mem_access_array);
> +    }
> +
> +    if (mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_MAX ||
> +        count > UINT8_MAX || offs > UINT16_MAX)
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if (size * count + offs > blen)
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr = mem_reg_attr;
> +    trans->flags = flags;
> +    trans->mem_access_size = size;
> +    trans->mem_access_count = count;
> +    trans->mem_access_offs = offs;
> +    return 0;
> +}
> +
> +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int offs,
> +                              unsigned int frag_len)
> +{
> +    struct domain *d = current->domain;
> +    unsigned int o = offs;
> +    unsigned int l;
> +    int ret;
> +
> +    if (frag_len < o)
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Fill up the first struct ffa_address_range */
> +    l = min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset += l;
> +    o += l;
> +    if (s->range_offset != sizeof(s->range))
> +        goto out;
> +    s->range_offset = 0;
> +
> +    while (true) {
> +        ret = get_shm_pages(d, s->shm, &s->range, 1, s->current_page_idx,
> +                            &s->current_page_idx);
> +        if (ret)
> +            return ret;
> +        if (s->range_count == 1)
> +            return 0;
> +        s->range_count--;
> +        if (frag_len - o < sizeof(s->range))
> +            break;
> +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> +        o += sizeof(s->range);
> +    }
> +
> +    /* Collect any remaining bytes for the next struct ffa_address_range */
> +    s->range_offset = frag_len - o;
> +    memcpy(&s->range, s->buf + o, frag_len - o);
> +out:
> +    s->frag_offset += frag_len;
> +    return s->frag_offset;
> +}
> +
> +static void handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len = get_user_reg(regs, 1);
> +    uint32_t frag_len = get_user_reg(regs, 2);
> +    uint64_t addr = get_user_reg(regs, 3);
> +    uint32_t page_count = get_user_reg(regs, 4);
> +    struct ffa_mem_transaction_x trans;
> +    struct ffa_mem_access *mem_access;
> +    struct ffa_mem_region *region_descr;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    struct ffa_shm_mem *shm = NULL;
> +    unsigned int last_page_idx = 0;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +    int ret = FFA_RET_DENIED;
> +    uint32_t handle_hi = 0;
> +    uint32_t handle_lo = 0;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.
> +     */
> +    if ( addr ) {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that fragment legnth doesn't exceed total length */
> +    if (frag_len > tot_len) {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    spin_lock(&ffa_buffer_lock);
> +
> +    if ( frag_len > ctx->page_count * PAGE_SIZE )
> +        goto out_unlock;
> +
> +    if ( !ffa_page_count ) {
> +        ret = FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
> +    if (ret)
> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */
> +    if ( trans.mem_access_count != 1 )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id != get_vm_id(d) )
> +    {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len)
> +        goto out_unlock;
> +
> +    mem_access = (void *)((vaddr_t)ctx->tx + trans.mem_access_offs);
> +    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs = read_atomic(&mem_access->region_offs);
> +    if (sizeof(*region_descr) + region_offs > frag_len) {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr = (void *)((vaddr_t)ctx->tx + region_offs);
> +    range_count = read_atomic(&region_descr->address_range_count);
> +    page_count = read_atomic(&region_descr->total_page_count);
> +
> +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( !shm )
> +    {
> +        ret = FFA_RET_NO_MEMORY;
> +        goto out;
> +    }
> +    shm->sender_id = trans.sender_id;
> +    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
> +    shm->page_count = page_count;
> +
> +    if (frag_len != tot_len) {
> +        struct mem_frag_state *s = xzalloc(struct mem_frag_state);
> +
> +        if (!s) {
> +            ret = FFA_RET_NO_MEMORY;
> +            goto out;
> +        }
> +        s->shm = shm;
> +        s->range_count = range_count;
> +        s->buf = ctx->tx;
> +        s->buf_size = ffa_page_count * PAGE_SIZE;
> +        ret = add_mem_share_frag(s, sizeof(*region_descr)  + region_offs,
> +                                 frag_len);
> +        if (ret <= 0) {
> +            xfree(s);
> +            if (ret < 0)
> +                goto out;
> +        } else {
> +            shm->handle = next_handle++;
> +            reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +            spin_lock(&ffa_mem_list_lock);
> +            list_add_tail(&s->list, &ffa_frag_list);
> +            spin_unlock(&ffa_mem_list_lock);
> +        }
> +        goto out_unlock;
> +    }
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len) {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if (last_page_idx != shm->page_count) {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    ret = share_shm(shm);
> +    if ( ret )
> +        goto out;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_add_tail(&shm->list, &ffa_mem_list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret && shm )
> +    {
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +out_unlock:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.sender_id);
> +    else if ( ret == 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static struct mem_frag_state *find_frag_state(uint64_t handle)
> +{
> +    struct mem_frag_state *s;
> +
> +    list_for_each_entry(s, &ffa_frag_list, list)
> +        if ( s->shm->handle == handle)
> +            return s;
> +
> +    return NULL;
> +}
> +
> +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> +{
> +    uint32_t frag_len = get_user_reg(regs, 3);
> +    uint32_t handle_lo = get_user_reg(regs, 1);
> +    uint32_t handle_hi = get_user_reg(regs, 2);
> +    uint64_t handle = reg_pair_to_64(handle_hi, handle_lo);
> +    struct mem_frag_state *s;
> +    uint16_t sender_id = 0;
> +    int ret;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    s = find_frag_state(handle);
> +    if (!s) {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +    sender_id = s->shm->sender_id;
> +
> +    if (frag_len > s->buf_size) {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret = add_mem_share_frag(s, 0, frag_len);
> +    if (ret == 0) {
> +        /* Note that share_shm() uses our tx buffer */
> +        ret = share_shm(s->shm);
> +        if (ret == 0) {
> +            spin_lock(&ffa_mem_list_lock);
> +            list_add_tail(&s->shm->list, &ffa_mem_list);
> +            spin_unlock(&ffa_mem_list_lock);
> +        } else {
> +            put_shm_pages(s->shm);
> +            xfree(s->shm);
> +        }
> +        spin_lock(&ffa_mem_list_lock);
> +        list_del(&s->list);
> +        spin_unlock(&ffa_mem_list_lock);
> +        xfree(s);
> +    } else if (ret < 0) {
> +        put_shm_pages(s->shm);
> +        xfree(s->shm);
> +        spin_lock(&ffa_mem_list_lock);
> +        list_del(&s->list);
> +        spin_unlock(&ffa_mem_list_lock);
> +        xfree(s);
> +    }
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id);
> +    else if ( ret == 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +{
> +    struct ffa_shm_mem *shm;
> +    uint32_t handle_hi;
> +    uint32_t handle_lo;
> +    int ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_for_each_entry(shm, &ffa_mem_list, list) {
> +        if ( shm->handle == handle )
> +            goto found_it;
> +    }
> +    shm = NULL;
> +found_it:
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    if ( !shm )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, handle);
> +    ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    if ( ret )
> +        return ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_del(&shm->list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    put_shm_pages(shm);
> +    xfree(shm);
> +
> +    return ret;
> +}
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    uint32_t count;
> +    uint32_t e;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +    case FFA_ID_GET:
> +        set_regs_success(regs, get_vm_id(d), 0);
> +        return true;
> +    case FFA_RXTX_MAP_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_RXTX_MAP_64:
> +#endif
> +        e = handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(regs, 2),
> +                            get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_RXTX_UNMAP:
> +        e = handle_rxtx_unmap();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_PARTITION_INFO_GET:
> +        e = handle_partition_info_get(get_user_reg(regs, 1),
> +                                      get_user_reg(regs, 2),
> +                                      get_user_reg(regs, 3),
> +                                      get_user_reg(regs, 4),
> +                                      get_user_reg(regs, 5), &count);
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, count, 0);
> +        return true;
> +    case FFA_RX_RELEASE:
> +        e = handle_rx_release();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +#endif
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
> +    case FFA_MEM_SHARE_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MEM_SHARE_64:
> +#endif
> +        handle_mem_share(regs);
> +        return true;
> +    case FFA_MEM_RECLAIM:
> +        e = handle_mem_reclaim(reg_pair_to_64(get_user_reg(regs, 2),
> +                                              get_user_reg(regs, 1)),
> +                               get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MEM_FRAG_TX:
> +        handle_mem_frag_tx(regs);
> +        return true;
> +
> +    default:
> +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
> +        return false;
> +    }
> +}
> +
> +int ffa_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx;
> +    unsigned int n;
> +    unsigned int m;
> +    unsigned int c_pos;
> +    int32_t res;
> +
> +    if ( !ffa_version )
> +        return 0;
> +
> +    ctx = xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    for ( n = 0; n < subsr_vm_created_count; n++ ) {
> +        res = ffa_direct_req_send_vm(subsr_vm_created[n], get_vm_id(d),
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res ) {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_created[n], res);
> +            c_pos = n;
> +            goto err;
> +        }
> +    }
> +
> +    d->arch.ffa = ctx;
> +
> +    return 0;
> +
> +err:
> +    /* Undo any already sent vm created messaged */
> +    for ( n = 0; n < c_pos; n++ )
> +        for ( m = 0; m < subsr_vm_destroyed_count; m++ )
> +            if ( subsr_vm_destroyed[m] == subsr_vm_created[n] )
> +                ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(d),
> +                                       FFA_MSG_SEND_VM_DESTROYED);
> +    return -ENOMEM;
> +}
> +
> +int ffa_relinquish_resources(struct domain *d)
> +{
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    unsigned int n;
> +    int32_t res;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    for ( n = 0; n < subsr_vm_destroyed_count; n++ ) {
> +        res = ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_destroyed[n], res);
> +    }
> +
> +    XFREE(d->arch.ffa);
> +
> +    return 0;
> +}
> +
> +static bool __init init_subscribers(void)
> +{
> +    struct ffa_partition_info_1_1 *fpi;
> +    bool ret = false;
> +    uint32_t count;
> +    uint32_t e;
> +    uint32_t n;
> +    uint32_t c_pos;
> +    uint32_t d_pos;
> +
> +    if ( ffa_version < FFA_VERSION_1_1 )
> +        return true;
> +
> +    e = ffa_partition_info_get(0, 0, 0, 0, 1, &count);
> +    ffa_rx_release();
> +    if ( e ) {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", (int)e);
> +        goto out;
> +    }
> +
> +    fpi = ffa_rx;
> +    subsr_vm_created_count = 0;
> +    subsr_vm_destroyed_count = 0;
> +    for ( n = 0; n < count; n++ ) {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subsr_vm_created_count++;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subsr_vm_destroyed_count++;
> +    }
> +
> +    if ( subsr_vm_created_count )
> +        subsr_vm_created = xzalloc_array(uint16_t, subsr_vm_created_count);
> +    if ( subsr_vm_destroyed_count )
> +        subsr_vm_destroyed = xzalloc_array(uint16_t, subsr_vm_destroyed_count);
> +    if ( (subsr_vm_created_count && !subsr_vm_created) ||
> +        (subsr_vm_destroyed_count && !subsr_vm_destroyed) ) {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
> +        subsr_vm_created_count = 0;
> +        subsr_vm_destroyed_count = 0;
> +        XFREE(subsr_vm_created);
> +        XFREE(subsr_vm_destroyed);
> +        goto out;
> +    }
> +
> +    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ ) {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subsr_vm_created[c_pos++] = fpi[n].id;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subsr_vm_destroyed[d_pos++] = fpi[n].id;
> +    }
> +
> +    ret = true;
> +out:
> +    ffa_rx_release();
> +    return ret;
> +}
> +
> +static int __init ffa_init(void)
> +{
> +    uint32_t vers;
> +    uint32_t e;
> +    unsigned int major_vers;
> +    unsigned int minor_vers;
> +
> +    /*
> +     * psci_init_smccc() updates this value with what's reported by EL-3
> +     * or secure world.
> +     */
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> +    {
> +        printk(XENLOG_ERR
> +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
> +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> +        return 0;
> +    }
> +
> +    if ( !ffa_get_version(&vers) )
> +        return 0;
> +
> +    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
> +    {
> +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
> +        return 0;
> +    }
> +
> +    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
> +    minor_vers = vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_ERR "ARM FF-A Mediator version %u.%u\n",
> +           FFA_VERSION_MAJOR, FFA_VERSION_MINOR);
> +    printk(XENLOG_ERR "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);

XENLOG_INFO


> +    ffa_rx = alloc_xenheap_pages(0, 0);
> +    if ( !ffa_rx )
> +        return 0;
> +
> +    ffa_tx = alloc_xenheap_pages(0, 0);
> +    if ( !ffa_tx )
> +        goto err_free_ffa_rx;
> +
> +    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", (int)e);
> +        goto err_free_ffa_tx;
> +    }
> +    ffa_page_count = 1;
> +    ffa_version = vers;
> +
> +    if ( !init_subscribers() )
> +        goto err_free_ffa_tx;
> +
> +    return 0;
> +
> +err_free_ffa_tx:
> +    free_xenheap_pages(ffa_tx, 0);
> +    ffa_tx = NULL;
> +err_free_ffa_rx:
> +    free_xenheap_pages(ffa_rx, 0);
> +    ffa_rx = NULL;
> +    ffa_page_count = 0;
> +    ffa_version = 0;
> +    XFREE(subsr_vm_created);
> +    subsr_vm_created_count = 0;
> +    XFREE(subsr_vm_destroyed);
> +    subsr_vm_destroyed_count = 0;
> +    return 0;
> +}
> +
> +__initcall(ffa_init);
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index ed63c2b6f91f..b3dee269bced 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -103,6 +103,10 @@ struct arch_domain
>      void *tee;
>  #endif
>  
> +#ifdef CONFIG_FFA
> +    void *ffa;
> +#endif
> +
>      bool directmap;
>  }  __cacheline_aligned;
>  
> diff --git a/xen/arch/arm/include/asm/ffa.h b/xen/arch/arm/include/asm/ffa.h
> new file mode 100644
> index 000000000000..1c6ce6421294
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/ffa.h
> @@ -0,0 +1,71 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2021  Linaro Limited
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __ASM_ARM_FFA_H__
> +#define __ASM_ARM_FFA_H__
> +
> +#include <xen/const.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/types.h>
> +
> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +
> +static inline bool is_ffa_fid(uint32_t fid)
> +{
> +    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >= FFA_FNUM_MIN_VALUE && fn <= FFA_FNUM_MAX_VALUE;
> +}
> +
> +#ifdef CONFIG_FFA
> +#define FFA_NR_FUNCS    11
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid);
> +int ffa_domain_init(struct domain *d);
> +int ffa_relinquish_resources(struct domain *d);
> +#else
> +#define FFA_NR_FUNCS    0
> +
> +static inline bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    return false;
> +}
> +
> +static inline int ffa_domain_init(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static inline int ffa_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /*__ASM_ARM_FFA_H__*/
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 6f90c08a6304..34586025eff8 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -20,6 +20,7 @@
>  #include <public/arch-arm/smccc.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/ffa.h>
>  #include <asm/monitor.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> @@ -32,7 +33,7 @@
>  #define XEN_SMCCC_FUNCTION_COUNT 3
>  
>  /* Number of functions currently supported by Standard Service Service Calls. */
> -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
>  
>  static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
>  {
> @@ -196,13 +197,23 @@ static bool handle_existing_apis(struct cpu_user_regs *regs)
>      return do_vpsci_0_1_call(regs, fid);
>  }
>  
> +static bool is_psci_fid(uint32_t fid)
> +{
> +    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >= 0 && fn <= 0x1fU;
> +}
> +
>  /* PSCI 0.2 interface and other Standard Secure Calls */
>  static bool handle_sssc(struct cpu_user_regs *regs)
>  {
>      uint32_t fid = (uint32_t)get_user_reg(regs, 0);
>  
> -    if ( do_vpsci_0_2_call(regs, fid) )
> -        return true;
> +    if ( is_psci_fid(fid) )
> +        return do_vpsci_0_2_call(regs, fid);
> +
> +    if ( is_ffa_fid(fid) )
> +        return ffa_handle_call(regs, fid);
>  
>      switch ( fid )
>      {
> -- 
> 2.31.1
> 

