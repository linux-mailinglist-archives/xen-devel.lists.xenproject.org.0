Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4684C18C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 01:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677203.1053652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWAZ-0001AQ-IX; Wed, 07 Feb 2024 00:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677203.1053652; Wed, 07 Feb 2024 00:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWAZ-00018A-Fl; Wed, 07 Feb 2024 00:52:07 +0000
Received: by outflank-mailman (input) for mailman id 677203;
 Wed, 07 Feb 2024 00:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWAY-00017Z-CZ
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 00:52:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b0379f4-c553-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 01:52:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38683CE17D4;
 Wed,  7 Feb 2024 00:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823B8C433A6;
 Wed,  7 Feb 2024 00:51:59 +0000 (UTC)
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
X-Inumbo-ID: 1b0379f4-c553-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707267120;
	bh=OZ9lrDX/2MuUzHRp0v6dDGpVXgFTkxmaBQKsLaph3Ec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q4PRnr4UI+j0s/ZiXSFGiRimA4AbjvomnSgT06IU78zVLjRrEwOz810nScYUI+UJT
	 1LvMX56WJ1FKqUB2cOIorxILICktIuC97/BYnyqA0GpirhkftSIb7XE0oj5+aazjnB
	 wWW+CVB6XDN1DNajTkMJGWvlgANs0mfIi6sSuakX10CInewM3J2hr8h7swQR15/LMt
	 g5Cx9br4ZJqpnroEuy2xEZ8T4zTtEkyp5wOK27XpTQ8nss4eG4A02bjBA3wXxPFezT
	 AU60rBkx6Me+mNc1wpxleiMmuaXoTiQUrw8tuXk68gIMoVt+UbvX0fC6Rho64OM6Ym
	 KAFLg3nyh65BQ==
Date: Tue, 6 Feb 2024 16:51:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012
 Rule 14.4
In-Reply-To: <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402061651140.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com> <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

However it needs an ack from an x86 maintainer


> ---
> Changes in v2
> - rename prefix from AMD/IOMMU to x86/IOMMU
> - move changes on msi.c and hpet.c in this patch.
> ---
>  xen/arch/x86/hpet.c                      | 6 +++---
>  xen/arch/x86/msi.c                       | 4 ++--
>  xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
>  xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
>  xen/drivers/passthrough/vtd/quirks.c     | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index 7be26c6a9b..d1ddc8ddf6 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
>  {
>      ch->msi.msg = *msg;
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc = iommu_update_ire_from_msi(&ch->msi, msg);
>  
> @@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          ch->msi.hpet_id = hpet_blockid;
>          ret = iommu_setup_hpet_msi(&ch->msi);
> @@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>          ret = __hpet_setup_msi_irq(desc);
>      if ( ret < 0 )
>      {
> -        if ( iommu_intremap )
> +        if ( iommu_intremap != iommu_intremap_off )
>              iommu_update_ire_from_msi(&ch->msi, NULL);
>          return ret;
>      }
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 7f8e794254..72dce2e4ab 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>  {
>      entry->msg = *msg;
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc;
>  
> @@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
>              destroy_irq(entry[nr].irq);
>  
>          /* Free the unused IRTE if intr remap enabled */
> -        if ( iommu_intremap )
> +        if ( iommu_intremap != iommu_intremap_off )
>              iommu_update_ire_from_msi(entry + nr, NULL);
>      }
>  
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 5515cb70fd..e02a09a9a7 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -1480,7 +1480,7 @@ int __init amd_iommu_init(bool xt)
>              goto error_out;
>      }
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>          register_keyhandler('V', &amd_iommu_dump_intremap_tables,
>                              "dump IOMMU intremap tables", 0);
>  
> @@ -1498,7 +1498,7 @@ int __init amd_iommu_init_late(void)
>  
>      /* Further initialize the device table(s). */
>      pci_init = true;
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>          rc = iterate_ivrs_mappings(amd_iommu_setup_device_table);
>  
>      for_each_amd_iommu ( iommu )
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index e13b7d99db..bd6d69a6f5 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2543,7 +2543,7 @@ static int __must_check init_vtd_hw(bool resume)
>      /*
>       * Enable interrupt remapping
>       */  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          int apic;
>          for ( apic = 0; apic < nr_ioapics; apic++ )
> @@ -2559,7 +2559,7 @@ static int __must_check init_vtd_hw(bool resume)
>              }
>          }
>      }
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          for_each_drhd_unit ( drhd )
>          {
> diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
> index 5a56565ea8..950dcd56ef 100644
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -392,7 +392,7 @@ void __init platform_quirks_init(void)
>      map_igd_reg();
>  
>      /* Tylersburg interrupt remap quirk */
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>          tylersburg_intremap_quirk();
>  }
>  
> -- 
> 2.40.0
> 
> 

