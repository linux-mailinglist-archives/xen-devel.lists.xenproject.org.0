Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C25770ABA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577340.904413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2F6-00006K-9h; Fri, 04 Aug 2023 21:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577340.904413; Fri, 04 Aug 2023 21:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2F6-0008UX-4k; Fri, 04 Aug 2023 21:21:52 +0000
Received: by outflank-mailman (input) for mailman id 577340;
 Fri, 04 Aug 2023 21:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2F5-0008UP-F8
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:21:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec62e42a-330c-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 23:21:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 061086207D;
 Fri,  4 Aug 2023 21:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9DEC433C8;
 Fri,  4 Aug 2023 21:21:46 +0000 (UTC)
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
X-Inumbo-ID: ec62e42a-330c-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691184108;
	bh=KW+dAYsFmYRZpNCBqS8+Nd7VsnDq5S5U4dE0t27GoeM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ji7I91/qztWqbmX3JduBu6a8pN80q4HgdYWWR++/dYjem4TJpL6cAglwVutKsZ/cO
	 5MQDFOP+9Qxfpboj400PsnGoi3YxB0uP9j5/iBGkjaDmvns7e7hGIvnVmNpu6n1b6q
	 IoMqu/Wn5DYcOvbN7ZuoF6eigIFza/fFFlkg5rr3F0EVvj3KtyUPHgpgb+flROxETJ
	 xtwc/g1T5EMfIN0wWc/39oaInm88+l9HNr0Bq3gI7Mc8qkDMwlPjY5CxdVUQuMjvYj
	 YcgvdSn+4VxgBsK8jhKU3R01EhDLekl3nmvGOXAnD+jYiV3BSEMsoSu/JGymJ03hj+
	 8cT1O7h/O0P0g==
Date: Fri, 4 Aug 2023 14:21:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/6] libelf: address MISRA C:2012 Rule 5.3
In-Reply-To: <55624244c42297da7da954009ba0559c47fc245e.1691162261.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041421380.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <55624244c42297da7da954009ba0559c47fc245e.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> The types u{8,16,32,64} defined in 'xen/arch/x86/include/asm/types.h'
> shadow the variables in the modified function, hence violating Rule 5.3.
> Therefore, the rename takes care of the shadowing.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/libelf/libelf-tools.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/common/libelf/libelf-tools.c b/xen/common/libelf/libelf-tools.c
> index a9edb6a8dc..f0d5da1abf 100644
> --- a/xen/common/libelf/libelf-tools.c
> +++ b/xen/common/libelf/libelf-tools.c
> @@ -91,10 +91,10 @@ uint64_t elf_access_unsigned(struct elf_binary * elf, elf_ptrval base,
>  {
>      elf_ptrval ptrval = base + moreoffset;
>      bool need_swap = elf_swap(elf);
> -    const uint8_t *u8;
> -    const uint16_t *u16;
> -    const uint32_t *u32;
> -    const uint64_t *u64;
> +    const uint8_t *uint8;
> +    const uint16_t *uint16;
> +    const uint32_t *uint32;
> +    const uint64_t *uint64;
>  
>      if ( !elf_access_ok(elf, ptrval, size) )
>          return 0;
> @@ -102,17 +102,17 @@ uint64_t elf_access_unsigned(struct elf_binary * elf, elf_ptrval base,
>      switch ( size )
>      {
>      case 1:
> -        u8 = (const void*)ptrval;
> -        return *u8;
> +        uint8 = (const void*)ptrval;
> +        return *uint8;
>      case 2:
> -        u16 = (const void*)ptrval;
> -        return need_swap ? bswap_16(*u16) : *u16;
> +        uint16 = (const void*)ptrval;
> +        return need_swap ? bswap_16(*uint16) : *uint16;
>      case 4:
> -        u32 = (const void*)ptrval;
> -        return need_swap ? bswap_32(*u32) : *u32;
> +        uint32 = (const void*)ptrval;
> +        return need_swap ? bswap_32(*uint32) : *uint32;
>      case 8:
> -        u64 = (const void*)ptrval;
> -        return need_swap ? bswap_64(*u64) : *u64;
> +        uint64 = (const void*)ptrval;
> +        return need_swap ? bswap_64(*uint64) : *uint64;
>      default:
>          return 0;
>      }
> -- 
> 2.34.1
> 

