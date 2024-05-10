Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9B8C2A1B
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 20:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720027.1122960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5VIZ-0002wz-VU; Fri, 10 May 2024 18:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720027.1122960; Fri, 10 May 2024 18:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5VIZ-0002u3-SG; Fri, 10 May 2024 18:48:51 +0000
Received: by outflank-mailman (input) for mailman id 720027;
 Fri, 10 May 2024 18:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcT1=MN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s5VIY-0002tt-R8
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 18:48:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efc8d4c2-0efd-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 20:48:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B514B61EC0;
 Fri, 10 May 2024 18:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDD2C113CC;
 Fri, 10 May 2024 18:48:46 +0000 (UTC)
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
X-Inumbo-ID: efc8d4c2-0efd-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715366927;
	bh=F6NpiZV0HywBr+Nx9rFTyJ0MlO0/atyKjAYoXr0moP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hO14C2wjG/pVWHkcahozrgDkwUC5oE64vuam6LWzpX1aOJ+2G98qnj7uGiE6Q+fR2
	 3TiFcvLXdgbsYTQz+NjDRAhi4bMPl78j7bD7fiQlrLXF1HF4Z4J/RxfYZfV6AiSUAu
	 xLr2Ot+4SfHbWnv9Xj/8vINgKLp8T6j3vukDIikjKQG4xE7pUBOskjdLsrsryJyreB
	 L5LGOCPBqeBv0EBVX88w31wdej++FflD5ulhdv3HQhOLt5PYmefjwSBLDR1E6374EX
	 JLngOw34HY5BCjhoBD8sOy3FBmcRGHdwmEapbSRFu2kSlDLqOFL1VJoghlug8YHlVz
	 ra49czcoFY04A==
Date: Fri, 10 May 2024 11:48:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] xen/build: Use -Wflex-array-member-not-at-end when
 available
In-Reply-To: <20240510184528.2272560-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405101148390.2544314@ubuntu-linux-20-04-desktop>
References: <c19bc75727d18399f73a19dae991660c608a4a84.1715352180.git.nicola.vetrini@bugseng.com> <20240510184528.2272560-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 May 2024, Andrew Cooper wrote:
> This option is new in GCC-14, and maps to MISRA Rule 1.1.  The codebase is
> clean to it, and Eclair is blocking.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: Simone Ballarin <simone.ballarin@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> I really ought to have posted this before we regressed the tree, but oh well.
> Better late than never.
> ---
>  xen/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index b6c39fc6aefb..71f0cb5071b3 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -396,6 +396,7 @@ CFLAGS += -nostdinc -fno-builtin -fno-common
>  CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
>  CFLAGS += -Wdeclaration-after-statement
>  $(call cc-option-add,CFLAGS,CC,-Wvla)
> +$(call cc-option-add,CFLAGS,CC,-Wflex-array-member-not-at-end)
>  CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
>  CFLAGS-$(CONFIG_DEBUG_INFO) += -g
>  
> -- 
> 2.30.2
> 

