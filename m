Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC928E7C0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 22:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6996.18318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnB0-00029t-BS; Wed, 14 Oct 2020 20:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6996.18318; Wed, 14 Oct 2020 20:15:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnB0-00029W-8M; Wed, 14 Oct 2020 20:15:10 +0000
Received: by outflank-mailman (input) for mailman id 6996;
 Wed, 14 Oct 2020 20:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kSnAy-00029Q-Lq
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:15:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b58ffe7-ec15-4feb-abf0-fb514009bf2b;
 Wed, 14 Oct 2020 20:15:07 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D7922222C;
 Wed, 14 Oct 2020 20:15:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kSnAy-00029Q-Lq
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:15:08 +0000
X-Inumbo-ID: 8b58ffe7-ec15-4feb-abf0-fb514009bf2b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8b58ffe7-ec15-4feb-abf0-fb514009bf2b;
	Wed, 14 Oct 2020 20:15:07 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0D7922222C;
	Wed, 14 Oct 2020 20:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602706506;
	bh=HfQdFDVZQUaPuvfVjtn6hsp/GZ+uDvPgOt8tAPYgp5Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WzpZtKkI3PjF1lNyodxDUJZcY1YC8xqAoI2fGvFg1O2y8sg4UcoazPH2SmPto3aox
	 GtN0M3IZKMEOW3Y40acLrsamTF/vrmg91U0Qv7Hl8U68o91BUllNLNJb4fN0mDibEZ
	 stGy9mcjBDlFVs4P/MOEW1kwbakRTTKPCi0DahqY=
Date: Wed, 14 Oct 2020 13:15:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH 2/2] EFI: further "need_to_free" adjustments
In-Reply-To: <a0e76e78-1f66-9825-b35b-86caed7da961@suse.com>
Message-ID: <alpine.DEB.2.21.2010141314560.10386@sstabellini-ThinkPad-T480s>
References: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com> <a0e76e78-1f66-9825-b35b-86caed7da961@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Oct 2020, Jan Beulich wrote:
> When processing "chain" directives, the previously loaded config file
> gets freed. This needs to be recorded accordingly such that no error
> path would try to free the same block of memory a 2nd time.
> 
> Furthermore, neither .addr nor .size being zero has any meaning towards
> the need to free an allocated chunk anymore. Drop (from read_file()) and
> replace (in Arm's efi_arch_use_config_file(), to sensibly retain the
> comment) respective assignments.
> 
> Fixes: 04be2c3a0678 ("efi/boot.c: add file.need_to_free")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -591,7 +591,7 @@ static bool __init efi_arch_use_config_f
>  
>      fdt = lookup_fdt_config_table(SystemTable);
>      dtbfile.ptr = fdt;
> -    dtbfile.size = 0;  /* Config table memory can't be freed, so set size to 0 */
> +    dtbfile.need_to_free = false; /* Config table memory can't be freed. */
>      if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
>      {
>          /*
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -601,10 +601,7 @@ static bool __init read_file(EFI_FILE_HA
>                                      PFN_UP(size), &file->addr);
>      }
>      if ( EFI_ERROR(ret) )
> -    {
> -        file->addr = 0;
>          what = what ?: L"Allocation";
> -    }
>      else
>      {
>          file->need_to_free = true;
> @@ -1271,8 +1268,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>              name.s = get_value(&cfg, "global", "chain");
>              if ( !name.s )
>                  break;
> -            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -            cfg.addr = 0;
> +            if ( cfg.need_to_free )
> +            {
> +                efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> +                cfg.need_to_free = false;
> +            }
>              if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
>              {
>                  PrintStr(L"Chained configuration file '");
> 

