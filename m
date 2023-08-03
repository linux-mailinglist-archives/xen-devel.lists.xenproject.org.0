Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A476DE4E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575984.901617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qROCE-0005us-FG; Thu, 03 Aug 2023 02:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575984.901617; Thu, 03 Aug 2023 02:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qROCE-0005sf-Cb; Thu, 03 Aug 2023 02:36:14 +0000
Received: by outflank-mailman (input) for mailman id 575984;
 Thu, 03 Aug 2023 02:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qROCC-0005sZ-Eu
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:36:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d24fcd-31a6-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 04:36:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C054C61BB5;
 Thu,  3 Aug 2023 02:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB666C433C8;
 Thu,  3 Aug 2023 02:36:06 +0000 (UTC)
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
X-Inumbo-ID: 80d24fcd-31a6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691030168;
	bh=RdX8b0xHNNxkZ4bcak3+rkH60PSPk9TzSUqo3+cssGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=olGTfOJPZIe3mFCrsTrP1HzSWMna0DWQwqnjaiSyAMG+sAFq+NoSvc2lTGPp1hS9n
	 7RcrpZg4lxFgk+eS5nMsvSh9j4bvlNl/e+TZiHB+hFZhKzAcV2LMdatEinHJtvA5hd
	 yqz7TfCxLN8KG6aR+3XiyWHa8xQ11Gz0AtN8yP88RDT0Jsw7viZMQ0YyEWhICfln5h
	 /AQUxESmu09c5Tz0YmYjk/BhQJ2lvP5tIHnk7KsLdC5FcW5H1Asi6JVjpbsepXU4V0
	 fNgBec6RYc7sSvKPU/jnz93gDI1Wjs9E9VUCZLg8ir0zgIpbL5fqUCi+npJ8ADDs8L
	 zzo15UjZcYnhA==
Date: Wed, 2 Aug 2023 19:36:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 05/11] drivers/pci: move variable definitions to
 address MISRA C:2012 Rule 2.1
In-Reply-To: <99f434f5d8b9c8eca275f23799a642ba34e79eb8.1690985045.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021934130.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <99f434f5d8b9c8eca275f23799a642ba34e79eb8.1690985045.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> Variable declarations between a switch statement guard and before
> any case label are unreachable code, and hence violate Rule 2.1:
> "A project shall not contain unreachable code".
> 
> Therefore the variable declarations are moved in the smallest enclosing
> scope, near other variable definitions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/drivers/passthrough/pci.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 33452791a8..3f5fa5beef 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -315,6 +315,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      struct pci_dev *pdev;
>      unsigned int pos;
>      int rc;
> +    unsigned int cap, sec_bus, sub_bus;
>  
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
> @@ -343,8 +344,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      /* update bus2bridge */
>      switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
>      {
> -        unsigned int cap, sec_bus, sub_bus;

sub_bus and sec_bus could go under case DEV_TYPE_LEGACY_PCI_BRIDGE
cap could go under case DEV_TYPE_PCIe_ENDPOINT


>          case DEV_TYPE_PCIe2PCI_BRIDGE:
>          case DEV_TYPE_LEGACY_PCI_BRIDGE:
>              sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> @@ -424,11 +423,11 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>  
>  static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>  {
> +    unsigned int sec_bus, sub_bus;
> +
>      /* update bus2bridge */
>      switch ( pdev->type )
>      {
> -        unsigned int sec_bus, sub_bus;

They could go under case DEV_TYPE_LEGACY_PCI_BRIDGE


>          case DEV_TYPE_PCIe2PCI_BRIDGE:
>          case DEV_TYPE_LEGACY_PCI_BRIDGE:
>              sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> @@ -1555,11 +1554,10 @@ int iommu_do_pci_domctl(
>      u8 bus, devfn;
>      int ret = 0;
>      uint32_t machine_sbdf;
> +    unsigned int flags;
>  
>      switch ( domctl->cmd )
>      {
> -        unsigned int flags;

it could go under case XEN_DOMCTL_test_assign_device


>      case XEN_DOMCTL_get_device_group:
>      {
>          u32 max_sdevs;
> -- 
> 2.34.1
> 

