Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5776DDE3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575970.901589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNr4-0002gj-A0; Thu, 03 Aug 2023 02:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575970.901589; Thu, 03 Aug 2023 02:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNr4-0002di-6R; Thu, 03 Aug 2023 02:14:22 +0000
Received: by outflank-mailman (input) for mailman id 575970;
 Thu, 03 Aug 2023 02:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNr3-0002da-Dv
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:14:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73737b75-31a3-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 04:14:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD1B261069;
 Thu,  3 Aug 2023 02:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C8FC433C8;
 Thu,  3 Aug 2023 02:14:15 +0000 (UTC)
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
X-Inumbo-ID: 73737b75-31a3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691028857;
	bh=fv9ZSf3cy7anxtXJVausBOb/A4E4rO2D1oyZ7XzEenE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kwIWMVPAS9kfIQrlvQ74ZE53SON1HeViR3CFAQw5UmZUyCmsIQjSs9mUeQpzosbRu
	 rkTh9SM4VLtziDAKiamADCawGOhMlXbEcohAtJLqzQTE6RsuBfIz7N2BG80VBl6Oct
	 Ph7f/OKcqiD3AYUzugbaxNBmUPtUTP6K0evBpxmkJJSUk5kYTaz+xEmzN7GTOtPLEH
	 d6otn27i61FOLFrqE5r3AJ7KAu6hgBOhpljarACWwtG/uO0ZFvKbfM1Gm+XpO/6S2t
	 ihk0akY+lIsTbGeLjCQNkBX5Vq70VLkEmQeGP/KInIw/34i5AS30aLVplAe+IzANIO
	 95glttTXFR7tw==
Date: Wed, 2 Aug 2023 19:14:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 03/11] x86/uaccess: move declarations to address
 MISRA C:2012 Rule 2.1
In-Reply-To: <6d5e4f307b360393e29641d727ef78b697643f47.1690985045.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021914000.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <6d5e4f307b360393e29641d727ef78b697643f47.1690985045.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> The variable declarations inside macros {put,get}_unsafe_size are
> considered unreachable code, as they appear in a switch statement, before
> any clause. They are moved in the enclosing scope to resolve the violation.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/uaccess.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
> index 684fccd95c..a2aaab1e87 100644
> --- a/xen/arch/x86/include/asm/uaccess.h
> +++ b/xen/arch/x86/include/asm/uaccess.h
> @@ -191,11 +191,12 @@ struct __large_struct { unsigned long buf[100]; };
>  
>  #define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
>  do {                                                                       \
> +    long dummy_;                                                           \
> +                                                                           \
>      retval = 0;                                                            \
>      stac();                                                                \
>      switch ( size )                                                        \
>      {                                                                      \
> -    long dummy_;                                                           \
>      case 1:                                                                \
>          put_unsafe_asm(x, ptr, grd, retval, "b", "b", "iq", errret);       \
>          break;                                                             \
> @@ -218,11 +219,12 @@ do {                                                                       \
>  
>  #define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
>  do {                                                                       \
> +    long dummy_;                                                           \
> +                                                                           \
>      retval = 0;                                                            \
>      stac();                                                                \
>      switch ( size )                                                        \
>      {                                                                      \
> -    long dummy_;                                                           \
>      case 1: get_unsafe_asm(x, ptr, grd, retval, "b", "=q", errret); break; \
>      case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>      case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
> -- 
> 2.34.1
> 

