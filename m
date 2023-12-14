Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5D813CDF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654770.1022106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtWn-00054l-KE; Thu, 14 Dec 2023 21:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654770.1022106; Thu, 14 Dec 2023 21:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtWn-00051o-GV; Thu, 14 Dec 2023 21:45:57 +0000
Received: by outflank-mailman (input) for mailman id 654770;
 Thu, 14 Dec 2023 21:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtWl-00051i-Lw
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:45:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 282e156b-9aca-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:45:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E2C25B824BD;
 Thu, 14 Dec 2023 21:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E925BC433C7;
 Thu, 14 Dec 2023 21:45:51 +0000 (UTC)
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
X-Inumbo-ID: 282e156b-9aca-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702590353;
	bh=FMVbQUit/8TwQmnHYqaIVeehSOzQkCIrUTdCvymHnUU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iKMFYx6zEm0CnexUMtasTjCVrjlFLyy0Ne+s46iAqkKIkI0H62yusPRThdrWKdB+s
	 /LRmw5rrNiAFqopNNEKVliAh4NkNMaZseoKR1PaWya8a0azTXZlx3vorOyXPVCrp13
	 LM5AStyycF2JQ6lM5e6wbyu+cvJmluBeQn1bCnmEy8bCMxiMKx3KgvgxYyE/A8R/Ul
	 9k3m4QyvVSGAgg3wuyOTAW3C6yqqKXqqG5hauxMHE9112+504MUFwuSQcXbQyZuQJ9
	 3lco0L/PEKFrPcoYOouZ54CHTPUy+IqKXy0Tu9PMIqm44AGvPawDX3vPZX5Nib3zvl
	 eLdf7spRf8TZQ==
Date: Thu, 14 Dec 2023 13:45:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/9] xen/efi: address violations of MISRA C:2012 Rule
 11.8
In-Reply-To: <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141345180.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Add missing const qualifiers in casts.
> The variables are originally const-qualified.
> There's no reason to drop the qualifiers.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/efi/boot.c | 6 +++---
>  xen/common/version.c  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 6110819918..efbec00af9 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1248,10 +1248,10 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>  #endif
>  
>      /* Adjust pointers into EFI. */
> -    efi_ct = (void *)efi_ct + DIRECTMAP_VIRT_START;
> -    efi_rs = (void *)efi_rs + DIRECTMAP_VIRT_START;
> +    efi_ct = (const void *)efi_ct + DIRECTMAP_VIRT_START;
> +    efi_rs = (const void *)efi_rs + DIRECTMAP_VIRT_START;
>      efi_memmap = (void *)efi_memmap + DIRECTMAP_VIRT_START;
> -    efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
> +    efi_fw_vendor = (const void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
>  }
>  
>  /* SAF-1-safe */
> diff --git a/xen/common/version.c b/xen/common/version.c
> index d320135208..6ac5a52700 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -178,7 +178,7 @@ void __init xen_build_init(void)
>      if ( &n[1] >= __note_gnu_build_id_end )
>          return;
>  
> -    sz = (void *)__note_gnu_build_id_end - (void *)n;
> +    sz = (const void *)__note_gnu_build_id_end - (const void *)n;
>  
>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>  
> -- 
> 2.40.0
> 

