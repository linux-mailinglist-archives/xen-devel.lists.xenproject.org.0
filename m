Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466458B90FC
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 23:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715489.1117160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2HAH-0008GA-1K; Wed, 01 May 2024 21:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715489.1117160; Wed, 01 May 2024 21:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2HAG-0008E2-UC; Wed, 01 May 2024 21:06:56 +0000
Received: by outflank-mailman (input) for mailman id 715489;
 Wed, 01 May 2024 21:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2HAG-0008Dw-Cv
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 21:06:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ff9529-07fe-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 23:06:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2BB15CE12A3;
 Wed,  1 May 2024 21:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121B8C072AA;
 Wed,  1 May 2024 21:06:42 +0000 (UTC)
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
X-Inumbo-ID: b9ff9529-07fe-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714597605;
	bh=xKWmAR8bRUG3hI2S8/E9BMmyLRlDJp0dhBplSrRXHPs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B2AmvL80x1kupedRVlAr399URmuGcwn3cwpbwfyoUtVewfBPYmPJni0NCIjfAJcmd
	 Py1e7coDbmDim3EQ24z0YS3iR/u0WHj2J/OwYw9MTV93ZmNF9RIqI9lL2nJQLkTHLf
	 z1tKh29NeN8Pj2Q4swIjQ6Re68UkSXBwPptU6B2quqQ1+eRLNytsfaTc5WBapkGmEW
	 1BpkMSCAYKCPnlti+/eu6KPCd+8EmiOura+0WhNbduzalZxgqYBxP2KHU/jNtt1t5H
	 ka/XXZ85YcxpNqT3Zifd3SnrL7LfxvQvnhKIIDwKUpbKLerjSkYFsIs1tkl72YzKXF
	 8El8bd6GxMr7A==
Date: Wed, 1 May 2024 14:06:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 14/17] xen: Add xen_mr_is_memory()
In-Reply-To: <20240430164939.925307-15-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405011405050.497719@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-15-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add xen_mr_is_memory() to abstract away tests for the
> xen_memory MR.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

There is an important change in this patch below


> ---
>  hw/xen/xen-hvm-common.c | 8 +++++++-
>  include/sysemu/xen.h    | 8 ++++++++
>  system/physmem.c        | 2 +-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 1627da7398..0267b88d26 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -12,6 +12,12 @@
>  
>  MemoryRegion xen_memory;
>  
> +/* Check for xen memory.  */
> +bool xen_mr_is_memory(MemoryRegion *mr)
> +{
> +    return mr == &xen_memory;
> +}
> +
>  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                     Error **errp)
>  {
> @@ -28,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>          return;
>      }
>  
> -    if (mr == &xen_memory) {
> +    if (xen_mr_is_memory(mr)) {
>          return;
>      }
>  
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 754ec2e6cb..dc72f83bcb 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
>  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>                     struct MemoryRegion *mr, Error **errp);
>  
> +bool xen_mr_is_memory(MemoryRegion *mr);
> +
>  #else /* !CONFIG_XEN_IS_POSSIBLE */
>  
>  #define xen_enabled() 0
> @@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>      g_assert_not_reached();
>  }
>  
> +static inline bool xen_mr_is_memory(MemoryRegion *mr)
> +{
> +    g_assert_not_reached();
> +    return false;
> +}
> +
>  #endif /* CONFIG_XEN_IS_POSSIBLE */
>  
>  #endif
> diff --git a/system/physmem.c b/system/physmem.c
> index ad7a8c7d95..1a5ffcba2a 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>           * because we don't want to map the entire memory in QEMU.
>           * In that case just map the requested area.
>           */
> -        if (block->offset == 0) {
> +        if (xen_mr_is_memory(block->mr)) {

This changes this check from block->offset == 0 to block->mr ==
&xen_memory. I think that's correct in all cases (x86 machines, ARM
machines) but I wanted to highlight it.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>





>              return xen_map_cache(block->mr, addr, len, lock, lock,
>                                   is_write);
>          }
> -- 
> 2.40.1
> 

