Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D375E7491E5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559555.874629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBy2-0007Aw-Gy; Wed, 05 Jul 2023 23:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559555.874629; Wed, 05 Jul 2023 23:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBy2-00077Z-Dn; Wed, 05 Jul 2023 23:31:26 +0000
Received: by outflank-mailman (input) for mailman id 559555;
 Wed, 05 Jul 2023 23:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBy0-00077R-QQ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:31:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ca0392b-1b8c-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 01:31:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0906183D;
 Wed,  5 Jul 2023 23:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEBBC433C7;
 Wed,  5 Jul 2023 23:31:19 +0000 (UTC)
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
X-Inumbo-ID: 0ca0392b-1b8c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688599880;
	bh=T+dhTuJDCMtm9hrnpRUKhJFzV1cCbzMYyvx9KayRubY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dki1/sCbGZlq8tZ0g/9QDnHNN6TqsgLP+8Xux4zai18yb1gMc5XYpwdCuo/rVhKPn
	 uGsHPOmU9xeO/YnDQZwRRugAozMWnSs9ablcS8mgkPE5YgAlgyM2yO6NNCqgoXsbZ+
	 7EAKfyKb5sWnDCpoRLmGI17547DXlgxke5O+eZrvG+fk6U0d8aLwxdmvngiy9550Et
	 iECaBnahJUO5jgkKwvLAri7uS/L2ZpZhoctFuGmgFW5kRa+BH7VKu0gtjqpBiS9hd2
	 9GM4EOxK9z8y01aosGFkIzzU1DvpK5gfWccWOb3qZgk7Fg/SvviSiFngKsIV5yVjks
	 GJ0N62Nwx0uow==
Date: Wed, 5 Jul 2023 16:31:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 02/13] AMD/IOMMU: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <89ec1b24e6da5738c00155f6f142cb99385fb838.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051630480.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <89ec1b24e6da5738c00155f6f142cb99385fb838.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I reviewed this again and I also the tag should be Reviewed-by (sorry it
was my mistake last time):

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - minor change to commit title
> - change commit message
> ---
>  xen/drivers/passthrough/amd/iommu-defs.h | 122 +++++++++++------------
>  1 file changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu-defs.h b/xen/drivers/passthrough/amd/iommu-defs.h
> index 35de548e3a..c145248f9a 100644
> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> @@ -38,49 +38,49 @@
>          ((uint64_t)(offset) << (12 + (PTE_PER_TABLE_SHIFT * ((level) - 1))))
>  
>  /* IOMMU Capability */
> -#define PCI_CAP_ID_MASK		0x000000FF
> +#define PCI_CAP_ID_MASK		0x000000FFU
>  #define PCI_CAP_ID_SHIFT	0
> -#define PCI_CAP_NEXT_PTR_MASK	0x0000FF00
> +#define PCI_CAP_NEXT_PTR_MASK	0x0000FF00U
>  #define PCI_CAP_NEXT_PTR_SHIFT	8
> -#define PCI_CAP_TYPE_MASK	0x00070000
> +#define PCI_CAP_TYPE_MASK	0x00070000U
>  #define PCI_CAP_TYPE_SHIFT	16
> -#define PCI_CAP_REV_MASK	0x00F80000
> +#define PCI_CAP_REV_MASK	0x00F80000U
>  #define PCI_CAP_REV_SHIFT	19
> -#define PCI_CAP_IOTLB_MASK	0x01000000
> +#define PCI_CAP_IOTLB_MASK	0x01000000U
>  #define PCI_CAP_IOTLB_SHIFT	24
> -#define PCI_CAP_HT_TUNNEL_MASK	0x02000000
> +#define PCI_CAP_HT_TUNNEL_MASK	0x02000000U
>  #define PCI_CAP_HT_TUNNEL_SHIFT	25
> -#define PCI_CAP_NP_CACHE_MASK	0x04000000
> +#define PCI_CAP_NP_CACHE_MASK	0x04000000U
>  #define PCI_CAP_NP_CACHE_SHIFT	26
>  #define PCI_CAP_EFRSUP_SHIFT    27
> -#define PCI_CAP_RESET_MASK	0x80000000
> +#define PCI_CAP_RESET_MASK	0x80000000U
>  #define PCI_CAP_RESET_SHIFT	31
>  
>  #define PCI_CAP_TYPE_IOMMU		0x3
>  
>  #define PCI_CAP_MMIO_BAR_LOW_OFFSET	0x04
>  #define PCI_CAP_MMIO_BAR_HIGH_OFFSET	0x08
> -#define PCI_CAP_MMIO_BAR_LOW_MASK	0xFFFFC000
> +#define PCI_CAP_MMIO_BAR_LOW_MASK	0xFFFFC000U
>  #define IOMMU_MMIO_REGION_LENGTH	0x4000
>  
>  #define PCI_CAP_RANGE_OFFSET		0x0C
> -#define PCI_CAP_BUS_NUMBER_MASK		0x0000FF00
> +#define PCI_CAP_BUS_NUMBER_MASK		0x0000FF00U
>  #define PCI_CAP_BUS_NUMBER_SHIFT	8
> -#define PCI_CAP_FIRST_DEVICE_MASK	0x00FF0000
> +#define PCI_CAP_FIRST_DEVICE_MASK	0x00FF0000U
>  #define PCI_CAP_FIRST_DEVICE_SHIFT	16
> -#define PCI_CAP_LAST_DEVICE_MASK	0xFF000000
> +#define PCI_CAP_LAST_DEVICE_MASK	0xFF000000U
>  #define PCI_CAP_LAST_DEVICE_SHIFT	24
>  
> -#define PCI_CAP_UNIT_ID_MASK    0x0000001F
> +#define PCI_CAP_UNIT_ID_MASK    0x0000001FU
>  #define PCI_CAP_UNIT_ID_SHIFT   0
>  #define PCI_CAP_MISC_INFO_OFFSET    0x10
> -#define PCI_CAP_MSI_NUMBER_MASK     0x0000001F
> +#define PCI_CAP_MSI_NUMBER_MASK     0x0000001FU
>  #define PCI_CAP_MSI_NUMBER_SHIFT    0
>  
>  /* Device Table */
>  #define IOMMU_DEV_TABLE_BASE_LOW_OFFSET		0x00
>  #define IOMMU_DEV_TABLE_BASE_HIGH_OFFSET	0x04
> -#define IOMMU_DEV_TABLE_SIZE_MASK		0x000001FF
> +#define IOMMU_DEV_TABLE_SIZE_MASK		0x000001FFU
>  #define IOMMU_DEV_TABLE_SIZE_SHIFT		0
>  
>  #define IOMMU_DEV_TABLE_ENTRIES_PER_BUS		256
> @@ -159,13 +159,13 @@ struct amd_iommu_dte {
>  #define IOMMU_CMD_BUFFER_BASE_HIGH_OFFSET	0x0C
>  #define IOMMU_CMD_BUFFER_HEAD_OFFSET		0x2000
>  #define IOMMU_CMD_BUFFER_TAIL_OFFSET		0x2008
> -#define IOMMU_CMD_BUFFER_LENGTH_MASK		0x0F000000
> +#define IOMMU_CMD_BUFFER_LENGTH_MASK		0x0F000000U
>  #define IOMMU_CMD_BUFFER_LENGTH_SHIFT		24
>  
>  #define IOMMU_CMD_BUFFER_ENTRY_ORDER            4
>  #define IOMMU_CMD_BUFFER_MAX_ENTRIES            (1u << 15)
>  
> -#define IOMMU_CMD_OPCODE_MASK			0xF0000000
> +#define IOMMU_CMD_OPCODE_MASK			0xF0000000U
>  #define IOMMU_CMD_OPCODE_SHIFT			28
>  #define IOMMU_CMD_COMPLETION_WAIT		0x1
>  #define IOMMU_CMD_INVALIDATE_DEVTAB_ENTRY	0x2
> @@ -178,50 +178,50 @@ struct amd_iommu_dte {
>  /* COMPLETION_WAIT command */
>  #define IOMMU_COMP_WAIT_DATA_BUFFER_SIZE	8
>  #define IOMMU_COMP_WAIT_DATA_BUFFER_ALIGNMENT	8
> -#define IOMMU_COMP_WAIT_S_FLAG_MASK		0x00000001
> -#define IOMMU_COMP_WAIT_I_FLAG_MASK		0x00000002
> -#define IOMMU_COMP_WAIT_F_FLAG_MASK		0x00000004
> -#define IOMMU_COMP_WAIT_ADDR_LOW_MASK		0xFFFFFFF8
> +#define IOMMU_COMP_WAIT_S_FLAG_MASK		0x00000001U
> +#define IOMMU_COMP_WAIT_I_FLAG_MASK		0x00000002U
> +#define IOMMU_COMP_WAIT_F_FLAG_MASK		0x00000004U
> +#define IOMMU_COMP_WAIT_ADDR_LOW_MASK		0xFFFFFFF8U
>  #define IOMMU_COMP_WAIT_ADDR_LOW_SHIFT		3
> -#define IOMMU_COMP_WAIT_ADDR_HIGH_MASK		0x000FFFFF
> +#define IOMMU_COMP_WAIT_ADDR_HIGH_MASK		0x000FFFFFU
>  #define IOMMU_COMP_WAIT_ADDR_HIGH_SHIFT		0
>  
>  /* INVALIDATE_IOMMU_PAGES command */
> -#define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK	0x0000FFFF
> +#define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK	0x0000FFFFU
>  #define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_SHIFT	0
> -#define IOMMU_INV_IOMMU_PAGES_S_FLAG_MASK	0x00000001
> +#define IOMMU_INV_IOMMU_PAGES_S_FLAG_MASK	0x00000001U
>  #define IOMMU_INV_IOMMU_PAGES_S_FLAG_SHIFT	0
> -#define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_MASK	0x00000002
> +#define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_MASK	0x00000002U
>  #define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_SHIFT	1
> -#define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_MASK	0xFFFFF000
> +#define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_MASK	0xFFFFF000U
>  #define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_SHIFT	12
> -#define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_MASK	0xFFFFFFFF
> +#define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_MASK	0xFFFFFFFFU
>  #define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_SHIFT	0
>  
>  /* INVALIDATE_DEVTAB_ENTRY command */
> -#define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_MASK   0x0000FFFF
> +#define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_MASK   0x0000FFFFU
>  #define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_SHIFT  0
>  
>  /* INVALIDATE_INTERRUPT_TABLE command */
> -#define IOMMU_INV_INT_TABLE_DEVICE_ID_MASK   0x0000FFFF
> +#define IOMMU_INV_INT_TABLE_DEVICE_ID_MASK   0x0000FFFFU
>  #define IOMMU_INV_INT_TABLE_DEVICE_ID_SHIFT  0
>  
>  /* INVALIDATE_IOTLB_PAGES command */
> -#define IOMMU_INV_IOTLB_PAGES_MAXPEND_MASK          0xff000000
> +#define IOMMU_INV_IOTLB_PAGES_MAXPEND_MASK          0xff000000U
>  #define IOMMU_INV_IOTLB_PAGES_MAXPEND_SHIFT         24
> -#define IOMMU_INV_IOTLB_PAGES_PASID1_MASK           0x00ff0000
> +#define IOMMU_INV_IOTLB_PAGES_PASID1_MASK           0x00ff0000U
>  #define IOMMU_INV_IOTLB_PAGES_PASID1_SHIFT          16
> -#define IOMMU_INV_IOTLB_PAGES_PASID2_MASK           0x0fff0000
> +#define IOMMU_INV_IOTLB_PAGES_PASID2_MASK           0x0fff0000U
>  #define IOMMU_INV_IOTLB_PAGES_PASID2_SHIFT          16
> -#define IOMMU_INV_IOTLB_PAGES_QUEUEID_MASK          0x0000ffff
> +#define IOMMU_INV_IOTLB_PAGES_QUEUEID_MASK          0x0000ffffU
>  #define IOMMU_INV_IOTLB_PAGES_QUEUEID_SHIFT         0
> -#define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_MASK        0x0000FFFF
> +#define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_MASK        0x0000FFFFU
>  #define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_SHIFT       0
> -#define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK         0xFFFFF000
> +#define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK         0xFFFFF000U
>  #define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_SHIFT        12
> -#define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_MASK        0xFFFFFFFF
> +#define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_MASK        0xFFFFFFFFU
>  #define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_SHIFT       0
> -#define IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK           0x00000001
> +#define IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK           0x00000001U
>  #define IOMMU_INV_IOTLB_PAGES_S_FLAG_SHIFT          0
>  
>  /* Event Log */
> @@ -229,18 +229,18 @@ struct amd_iommu_dte {
>  #define IOMMU_EVENT_LOG_BASE_HIGH_OFFSET	0x14
>  #define IOMMU_EVENT_LOG_HEAD_OFFSET		0x2010
>  #define IOMMU_EVENT_LOG_TAIL_OFFSET		0x2018
> -#define IOMMU_EVENT_LOG_LENGTH_MASK		0x0F000000
> +#define IOMMU_EVENT_LOG_LENGTH_MASK		0x0F000000U
>  #define IOMMU_EVENT_LOG_LENGTH_SHIFT		24
> -#define IOMMU_EVENT_LOG_HEAD_MASK		0x0007FFF0
> +#define IOMMU_EVENT_LOG_HEAD_MASK		0x0007FFF0U
>  #define IOMMU_EVENT_LOG_HEAD_SHIFT		4
> -#define IOMMU_EVENT_LOG_TAIL_MASK		0x0007FFF0
> +#define IOMMU_EVENT_LOG_TAIL_MASK		0x0007FFF0U
>  #define IOMMU_EVENT_LOG_TAIL_SHIFT		4
>  
>  #define IOMMU_EVENT_LOG_ENTRY_SIZE 			16
>  #define IOMMU_EVENT_LOG_POWER_OF2_ENTRIES_PER_PAGE	8
>  #define IOMMU_EVENT_LOG_U32_PER_ENTRY	(IOMMU_EVENT_LOG_ENTRY_SIZE / 4)
>  
> -#define IOMMU_EVENT_CODE_MASK			0xF0000000
> +#define IOMMU_EVENT_CODE_MASK			0xF0000000U
>  #define IOMMU_EVENT_CODE_SHIFT			28
>  #define IOMMU_EVENT_ILLEGAL_DEV_TABLE_ENTRY	0x1
>  #define IOMMU_EVENT_IO_PAGE_FAULT		0x2
> @@ -251,12 +251,12 @@ struct amd_iommu_dte {
>  #define IOMMU_EVENT_IOTLB_INV_TIMEOUT		0x7
>  #define IOMMU_EVENT_INVALID_DEV_REQUEST		0x8
>  
> -#define IOMMU_EVENT_DOMAIN_ID_MASK           0x0000FFFF
> +#define IOMMU_EVENT_DOMAIN_ID_MASK           0x0000FFFFU
>  #define IOMMU_EVENT_DOMAIN_ID_SHIFT          0
> -#define IOMMU_EVENT_DEVICE_ID_MASK           0x0000FFFF
> +#define IOMMU_EVENT_DEVICE_ID_MASK           0x0000FFFFU
>  #define IOMMU_EVENT_DEVICE_ID_SHIFT          0
>  #define IOMMU_EVENT_FLAGS_SHIFT              16
> -#define IOMMU_EVENT_FLAGS_MASK               0x0FFF0000
> +#define IOMMU_EVENT_FLAGS_MASK               0x0FFF0000U
>  
>  /* PPR Log */
>  #define IOMMU_PPR_LOG_ENTRY_SIZE                        16
> @@ -265,21 +265,21 @@ struct amd_iommu_dte {
>  
>  #define IOMMU_PPR_LOG_BASE_LOW_OFFSET                   0x0038
>  #define IOMMU_PPR_LOG_BASE_HIGH_OFFSET                  0x003C
> -#define IOMMU_PPR_LOG_BASE_LOW_MASK                     0xFFFFF000
> +#define IOMMU_PPR_LOG_BASE_LOW_MASK                     0xFFFFF000U
>  #define IOMMU_PPR_LOG_BASE_LOW_SHIFT                    12
> -#define IOMMU_PPR_LOG_BASE_HIGH_MASK                    0x000FFFFF
> +#define IOMMU_PPR_LOG_BASE_HIGH_MASK                    0x000FFFFFU
>  #define IOMMU_PPR_LOG_BASE_HIGH_SHIFT                   0
> -#define IOMMU_PPR_LOG_LENGTH_MASK                       0x0F000000
> +#define IOMMU_PPR_LOG_LENGTH_MASK                       0x0F000000U
>  #define IOMMU_PPR_LOG_LENGTH_SHIFT                      24
> -#define IOMMU_PPR_LOG_HEAD_MASK                         0x0007FFF0
> +#define IOMMU_PPR_LOG_HEAD_MASK                         0x0007FFF0U
>  #define IOMMU_PPR_LOG_HEAD_SHIFT                        4
> -#define IOMMU_PPR_LOG_TAIL_MASK                         0x0007FFF0
> +#define IOMMU_PPR_LOG_TAIL_MASK                         0x0007FFF0U
>  #define IOMMU_PPR_LOG_TAIL_SHIFT                        4
>  #define IOMMU_PPR_LOG_HEAD_OFFSET                       0x2030
>  #define IOMMU_PPR_LOG_TAIL_OFFSET                       0x2038
> -#define IOMMU_PPR_LOG_DEVICE_ID_MASK                    0x0000FFFF
> +#define IOMMU_PPR_LOG_DEVICE_ID_MASK                    0x0000FFFFU
>  #define IOMMU_PPR_LOG_DEVICE_ID_SHIFT                   0
> -#define IOMMU_PPR_LOG_CODE_MASK                         0xF0000000
> +#define IOMMU_PPR_LOG_CODE_MASK                         0xF0000000U
>  #define IOMMU_PPR_LOG_CODE_SHIFT                        28
>  
>  #define IOMMU_LOG_ENTRY_TIMEOUT                         1000
> @@ -342,17 +342,17 @@ union amd_iommu_control {
>  #define IOMMU_EXCLUSION_BASE_HIGH_OFFSET	0x24
>  #define IOMMU_EXCLUSION_LIMIT_LOW_OFFSET	0x28
>  #define IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET	0x2C
> -#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000
> +#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000U
>  #define IOMMU_EXCLUSION_BASE_LOW_SHIFT		12
> -#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFF
> +#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFFU
>  #define IOMMU_EXCLUSION_BASE_HIGH_SHIFT		0
> -#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001
> +#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001U
>  #define IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT	0
> -#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002
> +#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002U
>  #define IOMMU_EXCLUSION_ALLOW_ALL_SHIFT		1
> -#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000
> +#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000U
>  #define IOMMU_EXCLUSION_LIMIT_LOW_SHIFT		12
> -#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFF
> +#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFFU
>  #define IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT	0
>  
>  /* Extended Feature Register */
> @@ -476,14 +476,14 @@ union amd_iommu_pte {
>  
>  #define INV_IOMMU_ALL_PAGES_ADDRESS      ((1ULL << 63) - 1)
>  
> -#define IOMMU_RING_BUFFER_PTR_MASK                  0x0007FFF0
> +#define IOMMU_RING_BUFFER_PTR_MASK                  0x0007FFF0U
>  
> -#define IOMMU_CMD_DEVICE_ID_MASK                    0x0000FFFF
> +#define IOMMU_CMD_DEVICE_ID_MASK                    0x0000FFFFU
>  #define IOMMU_CMD_DEVICE_ID_SHIFT                   0
>  
> -#define IOMMU_REG_BASE_ADDR_LOW_MASK                0xFFFFF000
> +#define IOMMU_REG_BASE_ADDR_LOW_MASK                0xFFFFF000U
>  #define IOMMU_REG_BASE_ADDR_LOW_SHIFT               12
> -#define IOMMU_REG_BASE_ADDR_HIGH_MASK               0x000FFFFF
> +#define IOMMU_REG_BASE_ADDR_HIGH_MASK               0x000FFFFFU
>  #define IOMMU_REG_BASE_ADDR_HIGH_SHIFT              0
>  
>  #endif /* AMD_IOMMU_DEFS_H */
> -- 
> 2.41.0
> 

