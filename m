Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BB415330
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193122.343983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAPR-0004pQ-81; Wed, 22 Sep 2021 22:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193122.343983; Wed, 22 Sep 2021 22:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAPR-0004mg-4G; Wed, 22 Sep 2021 22:08:09 +0000
Received: by outflank-mailman (input) for mailman id 193122;
 Wed, 22 Sep 2021 22:08:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTAPP-0004ma-U1
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:08:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5175511-9645-42b9-9210-8d4af4ef1ef8;
 Wed, 22 Sep 2021 22:08:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 600E66109E;
 Wed, 22 Sep 2021 22:08:06 +0000 (UTC)
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
X-Inumbo-ID: b5175511-9645-42b9-9210-8d4af4ef1ef8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632348486;
	bh=QWQVk8O80Iz9b+CDsZQa+wGLp70ISYSJPLI5YvAbbm8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s2rmUXcGajM2QzSwiYuQCMQd6mEtF9Arm17dwzqrew1eNTLKK73MJFWfih/Ckyy5e
	 0MsXsBIJXAMOOyVG5WN439fRp74AUW1lyzHmJg824kyekMEGB0JUWvnGtTaSB/gTq/
	 xzmSM4iSoE86y4iUQ31dQ3aZkn/bJwGtKddAfjZ7nTa0MXoy3+wOqnX919syQTk3zP
	 1s0dCERX74IIWJH66A1LBdDexOGzGVJ6Gws4pus2qJE2ECIbyFXDlPuwaoL2SATtKn
	 n4mocKAHCoSDyfZmj6MqWHN08FYDNuQ/sp/NZy5ehCMnP5AOFDjfM+4w8bGuse+7Xw
	 f3m/9nh58z/2w==
Date: Wed, 22 Sep 2021 15:08:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Jan Beulich <jbeulich@suse.com>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
In-Reply-To: <af2360805e6d615995a1071575546ecbb011a4d7.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221507580.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <af2360805e6d615995a1071575546ecbb011a4d7.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1011149910-1632348486=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1011149910-1632348486=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Rahul Singh wrote:
> prelink.o: In function `pcie_aer_get_firmware_first’:
> drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_parse'
> 
> Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
> architecture. APEI not supported on ARM yet move the code under
> CONFIG_X86 flag to gate the code for ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v2: Add in code comment "APEI not supported on ARM yet"
> ---
>  xen/drivers/passthrough/pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 8996403161..d774a6154e 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1150,7 +1150,8 @@ void __hwdom_init setup_hwdom_pci_devices(
>      pcidevs_unlock();
>  }
>  
> -#ifdef CONFIG_ACPI
> +/* APEI not supported on ARM yet. */
> +#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
>  #include <acpi/acpi.h>
>  #include <acpi/apei.h>
>  
> -- 
> 2.17.1
> 
> 
--8323329-1011149910-1632348486=:17979--

