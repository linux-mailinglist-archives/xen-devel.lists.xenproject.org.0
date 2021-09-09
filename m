Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32904053CE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 15:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183249.331314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJuu-0002Hg-0E; Thu, 09 Sep 2021 13:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183249.331314; Thu, 09 Sep 2021 13:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJut-0002Eq-TY; Thu, 09 Sep 2021 13:16:35 +0000
Received: by outflank-mailman (input) for mailman id 183249;
 Thu, 09 Sep 2021 13:16:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOJus-0002Ek-3d
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:16:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOJur-0006T6-1P; Thu, 09 Sep 2021 13:16:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOJuq-0000nU-RC; Thu, 09 Sep 2021 13:16:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=6lp/cFCmBymmNHRqD/8gkxMPLb7mzL2pKISVqLjtZFM=; b=g7o5FyQUTsYzffKu6BnUA7ZDOW
	7OBlj1KmB6yRTFUT20rwJG/PCgSSotb3V5mhgcIxD89OB9eT8Ch+59NzQ5pmMkd8H7JR8Ny3PNSZ9
	427EJPjdwOp5+6g/9eH/JeDULAJ4+HkMG9F/XFJh7bNZQcqw140tSLLm8QMNzCpEXtCY=;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5b3fb4aa-ec56-bbda-dee9-899fa466aacd@xen.org>
Date: Thu, 9 Sep 2021 14:16:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 19/08/2021 13:02, Rahul Singh wrote:
> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.
> 
> Add definition for arch_iommu_use_permitted() and
> arch_pci_clean_pirqs().Implement dummy functions for pci_conf_read*() to
> fix compilation error.
> 
> pci.c: In function ‘deassign_device’:
> pci.c:849:49: error: implicit declaration of function ‘pci_to_dev’;
> did you mean ‘dt_to_dev’? [-Werror=implicit-function-declaration]
>              pci_to_dev(pdev));
> 
> pci.c:18: undefined reference to `pci_conf_read16’
> pci.c:880: undefined reference to `arch_pci_clean_pirqs’
> pci.c:1392: undefined reference to `arch_iommu_use_permitted'
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/Makefile               |  1 +
>   xen/arch/arm/pci/Makefile           |  2 +
>   xen/arch/arm/pci/pci-access.c       | 61 +++++++++++++++++++++++++++++
>   xen/arch/arm/pci/pci.c              | 32 +++++++++++++++
>   xen/drivers/passthrough/arm/iommu.c |  5 +++
>   xen/include/asm-arm/pci.h           | 33 ++++++++++++++--
>   6 files changed, 131 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/arm/pci/Makefile
>   create mode 100644 xen/arch/arm/pci/pci-access.c
>   create mode 100644 xen/arch/arm/pci/pci.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..0e14a5e5c8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -6,6 +6,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>   obj-y += platforms/
>   endif
>   obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_PCI) += pci/

This should go before platforms/ to keep the order alphabetically.


Cheers,

-- 
Julien Grall

