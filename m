Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3976A2DB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573472.898215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaVc-0002NZ-FI; Mon, 31 Jul 2023 21:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573472.898215; Mon, 31 Jul 2023 21:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaVc-0002KH-C8; Mon, 31 Jul 2023 21:32:56 +0000
Received: by outflank-mailman (input) for mailman id 573472;
 Mon, 31 Jul 2023 21:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQaVa-0002Jp-B1
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:32:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd31d80b-2fe9-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 23:32:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0D9A612E3;
 Mon, 31 Jul 2023 21:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B944C433C8;
 Mon, 31 Jul 2023 21:32:49 +0000 (UTC)
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
X-Inumbo-ID: cd31d80b-2fe9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690839170;
	bh=4AdnHWhpzW/J2+cWooP/pa9QAJYZ0ls95xp+KRrm26U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O6hywSnDZp838bucUWKjvxFgt+uD9wKzRah0ykNMi6V5OBtH2SGCPWuY/mhtuTngr
	 VTIQDb5TSYdsFvdXreo0zR3s5RJJS/JMF0DwEX5s3VLZGSPRGwu/Ol5BAwNAd3xabC
	 3B8hbvNUj60hVxcPf52X0Meiwdj8KcVjaKzpH//MefCZ59w/0uJ4MVNnQJ5l8vUrJl
	 Gq2XbosPVrGnQ3M38QZKVQstnWraDf4DzaMckglGMmhVMBVAnh3eD9D3n9wSdlgfe5
	 KHLZrTumcFSwh7iT/rIw2GkmylfrtNBmkiX+kFhakbCtOMpBR689nhkBYliPDLTVW5
	 kRcgEf5XIBwFA==
Date: Mon, 31 Jul 2023 14:32:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 2/4] amd/iommu: rename functions to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <838e606bfe8b83578970ce73a1ac7d71ccefcd2b.1690810346.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307311432410.1972086@ubuntu-linux-20-04-desktop>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com> <838e606bfe8b83578970ce73a1ac7d71ccefcd2b.1690810346.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023, Nicola Vetrini wrote:
> The functions 'machine_bfd' and 'guest_bfd' have gained the
> prefix 'get_' to avoid the mutual shadowing with the homonymous
> parameters in these functions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/amd/iommu_guest.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
> index 80a331f546..47a912126a 100644
> --- a/xen/drivers/passthrough/amd/iommu_guest.c
> +++ b/xen/drivers/passthrough/amd/iommu_guest.c
> @@ -38,12 +38,12 @@
>          (reg)->hi = (val) >> 32; \
>      } while (0)
>  
> -static unsigned int machine_bdf(struct domain *d, uint16_t guest_bdf)
> +static unsigned int get_machine_bdf(struct domain *d, uint16_t guest_bdf)
>  {
>      return guest_bdf;
>  }
>  
> -static uint16_t guest_bdf(struct domain *d, uint16_t machine_bdf)
> +static uint16_t get_guest_bdf(struct domain *d, uint16_t machine_bdf)
>  {
>      return machine_bdf;
>  }
> @@ -195,7 +195,7 @@ void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
>      log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
>  
>      /* Convert physical device id back into virtual device id */
> -    gdev_id = guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
> +    gdev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
>      iommu_set_devid_to_cmd(&entry[0], gdev_id);
>  
>      memcpy(log, entry, sizeof(ppr_entry_t));
> @@ -245,7 +245,7 @@ void guest_iommu_add_event_log(struct domain *d, u32 entry[])
>      log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
>  
>      /* re-write physical device id into virtual device id */
> -    dev_id = guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
> +    dev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
>      iommu_set_devid_to_cmd(&entry[0], dev_id);
>      memcpy(log, entry, sizeof(event_entry_t));
>  
> @@ -268,7 +268,7 @@ static int do_complete_ppr_request(struct domain *d, cmd_entry_t *cmd)
>      uint16_t dev_id;
>      struct amd_iommu *iommu;
>  
> -    dev_id = machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
> +    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
>      iommu = find_iommu_for_device(0, dev_id);
>  
>      if ( !iommu )
> @@ -320,7 +320,7 @@ static int do_invalidate_iotlb_pages(struct domain *d, cmd_entry_t *cmd)
>      struct amd_iommu *iommu;
>      uint16_t dev_id;
>  
> -    dev_id = machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
> +    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
>  
>      iommu = find_iommu_for_device(0, dev_id);
>      if ( !iommu )
> @@ -396,7 +396,7 @@ static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
>  
>      g_iommu = domain_iommu(d);
>      gbdf = iommu_get_devid_from_cmd(cmd->data[0]);
> -    mbdf = machine_bdf(d, gbdf);
> +    mbdf = get_machine_bdf(d, gbdf);
>  
>      /* Guest can only update DTEs for its passthru devices */
>      if ( mbdf == 0 || gbdf == 0 )
> -- 
> 2.34.1
> 

