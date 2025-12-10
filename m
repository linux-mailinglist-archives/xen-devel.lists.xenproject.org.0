Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77945CB18CD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182423.1505297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8RK-0003bc-QQ; Wed, 10 Dec 2025 00:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182423.1505297; Wed, 10 Dec 2025 00:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8RK-0003Yl-NF; Wed, 10 Dec 2025 00:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1182423;
 Wed, 10 Dec 2025 00:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8RI-0003Yf-FS
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:52:20 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79aa7f53-d562-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 01:52:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BBAB60173;
 Wed, 10 Dec 2025 00:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8564C4CEF5;
 Wed, 10 Dec 2025 00:52:14 +0000 (UTC)
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
X-Inumbo-ID: 79aa7f53-d562-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765327936;
	bh=AO0ZDUV3Dsr7al45Ge4YPmQDIrBz3DoAz+H9HFHfM6w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vd54VyvLVUOqy0jY0cBamONYY5j+CQEpFsIUfM5DdEhE91JIbY9KhIffNaSSipg0U
	 IPQHzNYBGiANZ4rhB25CNhXyIHbVF8WNW3J8XvS/avWA3bE0Hf5/a8xpW7QZtglC0D
	 cUaHct0odtKO8AkX/t5vbSLlkVeL4xLQWj8+Yb31jeXV056LkWt9IhzAHaUOncdP/W
	 g/OZFanaSvYx5NUXUkLmNPeR84X3xGnv91vSs1GczOKdjpELF8M5Cf+bGAxqIHs6fE
	 +MnRYtjvNoDiu2qA77N9bf9YksBUTkk5IJ8tQhZYSV/B999D6ULhYsBY1HmlRREwLn
	 InkvehC95GvXw==
Date: Tue, 9 Dec 2025 16:52:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor
 macro
In-Reply-To: <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2512091651570.19429@ubuntu-linux-20-04-desktop>
References: <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Oct 2025, Dmytro Prokopchuk1 wrote:
> Given 'NextMemoryDescriptor()' macro is casting (UINT8 *) pointer to the
> (EFI_MEMORY_DESCRIPTOR *) pointer, which is not allowed by the MISRA C
> Rule 11.3 as they pointed to the different objects types.
> 
> This macro is a part of the EFI imported code ('xen/include/efi/') and
> is deviated with a SAF comment.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I saw Jan's comment but I think this is OK


> ---
>  docs/misra/safe.json        | 8 ++++++++
>  xen/arch/arm/efi/efi-boot.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3584cb90c6..c5e193e0f7 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>          },
>          {
>              "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.3"
> +            },
> +            "name": "Rule 11.3: casting a pointer to object into a pointer to a different object",
> +            "text": "Violation due to the use of 'NextMemoryDescriptor()' macro is allowed, as that is EFI imported code."
> +        },
> +        {
> +            "id": "SAF-16-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 7844b9529e..a87004001b 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -227,6 +227,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
>              }
>          }
>  #endif
> +        /* SAF-15-safe casting a pointer */
>          desc_ptr = NextMemoryDescriptor(desc_ptr, desc_size);
>      }
>  
> -- 
> 2.43.0
> 

