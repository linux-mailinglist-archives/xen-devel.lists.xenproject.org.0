Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319382461B3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7b0J-0000AU-3T; Mon, 17 Aug 2020 09:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7b0H-0000AI-5M
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:00:29 +0000
X-Inumbo-ID: bb2a4945-d4bc-42e7-b949-20b403da35b1
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb2a4945-d4bc-42e7-b949-20b403da35b1;
 Mon, 17 Aug 2020 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597654828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3DmcE8byjOmgTWsAigd9op8NsNi8eLSFuqKj5KpZOxw=;
 b=PvRjZaFsuJ76bW1oBetu65jm6gy6pnWcijJVjYcK+mmHlRm74niYbGWC
 JIZD6d0EJodGL4oNTH3DlmR3G3+FrO6HQKnBN8qsdvu9jc6zVr4vTZuGZ
 2yt/TiKMDduQrvpmHji6iQ8aS89Y0fsddHT2ardD5SE+yIcGeMBgBDAWf M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2swBEYbKdmD1FD8GHQR+2YbfZXpfIYgEFzOMyMK29gK1GMAJdem30AdCMw9MXYaHOI7c5f3msZ
 pRifdAgCZpu6q4RSLy4zsNorfgIOygSrIX5ziuMO5iNYVNJU4PPQgHI+kAggTRbICZDmKq4n5a
 VWhB1J5XkVl78WUm6dR5wkprAYCmME8oKIGccthLlPOWav3j3pYbUdcDh8iInkeA3hRxhKlYwq
 MzVxj7Qdy1Dih/+0w55FY7ALZxyBhAqtHZIHLDvfIzqAes/JXM/4A8qvadbS7uIrNW3S10QqQ8
 aE4=
X-SBRS: 2.7
X-MesageID: 24993815
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24993815"
Date: Mon, 17 Aug 2020 11:00:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: Ard Biesheuvel <ardb@kernel.org>, <linux-efi@vger.kernel.org>,
 <norbert.kaminski@3mdeb.com>, <xen-devel@lists.xenproject.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200817090013.GN975@Air-de-Roger>
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 16, 2020 at 02:19:49AM +0200, Marek Marczykowski-Górecki wrote:
> In case of Xen PV dom0, Xen passes along info about system tables (see
> arch/x86/xen/efi.c), but not the memory map from EFI.

I think that's because the memory map returned by
XENMEM_machine_memory_map is in e820 form, and doesn't contain the
required information about the EFI regions due to the translation done
by efi_arch_process_memory_map in Xen?

> This makes sense
> as it is Xen responsible for managing physical memory address space.
> In this case, it doesn't make sense to condition using ESRT table on
> availability of EFI memory map, as it isn't Linux kernel responsible for
> it.

PV dom0 is kind of special in that regard as it can create mappings to
(almost) any MMIO regions, and hence can change it's memory map
substantially.

> Skip this part on Xen PV (let Xen do the right thing if it deems
> necessary) and use ESRT table normally.

Maybe it would be better to introduce a new hypercall (or add a
parameter to XENMEM_machine_memory_map) in order to be able to fetch
the EFI memory map?

That should allow a PV dom0 to check the ESRT is correct and thus not
diverge from bate metal.

> 
> This is a requirement for using fwupd in PV dom0 to update UEFI using
> capsules.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  drivers/firmware/efi/esrt.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> index d5915272141f..5c49f2aaa4b1 100644
> --- a/drivers/firmware/efi/esrt.c
> +++ b/drivers/firmware/efi/esrt.c
> @@ -245,36 +245,38 @@ void __init efi_esrt_init(void)
>  	int rc;
>  	phys_addr_t end;
>  
> -	if (!efi_enabled(EFI_MEMMAP))
> +	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
>  		return;
>  
>  	pr_debug("esrt-init: loading.\n");
>  	if (!esrt_table_exists())
>  		return;
>  
> -	rc = efi_mem_desc_lookup(efi.esrt, &md);
> -	if (rc < 0 ||
> -	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> -	     md.type != EFI_BOOT_SERVICES_DATA &&
> -	     md.type != EFI_RUNTIME_SERVICES_DATA)) {
> -		pr_warn("ESRT header is not in the memory map.\n");
> -		return;
> -	}
> +	if (efi_enabled(EFI_MEMMAP)) {
> +		rc = efi_mem_desc_lookup(efi.esrt, &md);
> +		if (rc < 0 ||
> +		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> +		     md.type != EFI_BOOT_SERVICES_DATA &&
> +		     md.type != EFI_RUNTIME_SERVICES_DATA)) {
> +			pr_warn("ESRT header is not in the memory map.\n");
> +			return;
> +		}

Here you blindly trust the data in the ESRT in the PV case, without
checking it matches the regions on the memory map, which could lead to
errors if ESRT turns to be wrong.

Thanks, Roger.

