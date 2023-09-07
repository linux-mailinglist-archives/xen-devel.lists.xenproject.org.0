Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F5796E79
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597026.931186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3c6-0004g6-Dc; Thu, 07 Sep 2023 01:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597026.931186; Thu, 07 Sep 2023 01:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3c6-0004dW-Af; Thu, 07 Sep 2023 01:15:18 +0000
Received: by outflank-mailman (input) for mailman id 597026;
 Thu, 07 Sep 2023 01:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3c5-0004d8-7D
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:15:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc991681-4d1b-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 03:15:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4504CE1843;
 Thu,  7 Sep 2023 01:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAC6C433C7;
 Thu,  7 Sep 2023 01:15:03 +0000 (UTC)
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
X-Inumbo-ID: fc991681-4d1b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694049305;
	bh=QhnRdU8xyqmAt/gR+tuX2ax1437Oobl0F0HJhnphkeo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ww6HbxDVaR/b4aQw9ooslBm7BPnrwYOjW5nN8HXW/B/0wXbpS8IDJdEjCTKhb8lRK
	 o7OrG1RnSO258Dq/2BdxIXsE+HkzirNYHx8ki5qiO/KN8Y0kV9qi1xu1nnOwMBxXc9
	 cVzQC0WQCdnHOoZiKJMYsFbe/8J1QSqc+0mYJmS39cerCx9zo7IzVuyKst5KDD9bLS
	 tvx7nO2xr0429lN0y5bpNVoU5SjKDlHD6zR9Wrlhg83kwlWvTcQrVcD/kG9fMl3AJk
	 GzUYR5gHV5HpUXnoWb0y0wv6pFAjj5/hTZNkZ0wp+wJtOggP3zo0uSTaXvJXCP07r5
	 2BH/m6uTz6wNg==
Date: Wed, 6 Sep 2023 18:15:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] xen/arm: ioreq: add header for 'handle_ioserv'
 and 'try_fwd_ioserv'
In-Reply-To: <7a58fd2e4361de53fc81475dd4aca52a57b770f1.1693581823.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309061814550.6458@ubuntu-linux-20-04-desktop>
References: <7a58fd2e4361de53fc81475dd4aca52a57b770f1.1693581823.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Nicola Vetrini wrote:
> The functions referenced by this patch should have had a compatible
> declaration visible prior to their definition. This is achieved by
> including the arch-specific header in 'xen/arch/arm/ioreq.c'
> 
> Fixes: cb9953d2f2bc ("arm/ioreq: Introduce arch specific bits for IOREQ/DM features")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Avoid including <asm/ioreq.h> in <xen/ioreq.h> to allow new architectures
>   (e.g. ppc and riscv) not to provide one more stub header,
>   as pointed out by Jan Beulich.
> ---
>  xen/arch/arm/ioreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 55854571898d..3bed0a14c050 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -9,6 +9,7 @@
>  #include <xen/ioreq.h>
> 
>  #include <asm/traps.h>
> +#include <asm/ioreq.h>
> 
>  #include <public/hvm/ioreq.h>
> 
> --
> 2.34.1
> 

