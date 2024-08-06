Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDBD949755
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773033.1183480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOeh-0001Y8-7M; Tue, 06 Aug 2024 18:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773033.1183480; Tue, 06 Aug 2024 18:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOeh-0001WV-39; Tue, 06 Aug 2024 18:11:31 +0000
Received: by outflank-mailman (input) for mailman id 773033;
 Tue, 06 Aug 2024 18:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+gn=PF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sbOef-0001WP-0T
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:11:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b5abaa5-541f-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 20:11:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2529A6105D;
 Tue,  6 Aug 2024 18:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF5CC32786;
 Tue,  6 Aug 2024 18:11:24 +0000 (UTC)
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
X-Inumbo-ID: 4b5abaa5-541f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722967884;
	bh=OMno+4mvFjVXagyRg1105Ffz86MvKEEtmKwrLxqOudg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NYla24froCrKazIuBaXOgFiKYLQIrlTr5V9GaXPZyop6nOpAUtO/2eCcoJsjDTp1k
	 nawj2JvYAbIbnvtbGZLfEgQLlhDmy+feeytteRHFQGw1C36NRHokaxxRWFCx0AMHUh
	 DNhpRMdzGq0Q2IeWikPSP9QI/PxnNFaD0S7aPx4NbcCDv2vS6mfvjtIWLXiYLRXYg3
	 MfY8EsULgIJXSyxKFe7ABgjvFpqvujx4sQFbiah5ZF7niQpTHSdXoc8weMLADqOCPM
	 kQdMxpZboD+GmHe7Tr4VD5MDOevyoivDsRn4yRmBUpOqyggaeZ3IDk7JOFopTSN9cA
	 KjIiOAHJ9bVXA==
Date: Tue, 6 Aug 2024 11:11:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: adjust 2nd param of idiv_dbl()
In-Reply-To: <20944ace-6fb8-4a70-82aa-4ed595d01e5e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408061111150.4954@ubuntu-linux-20-04-desktop>
References: <20944ace-6fb8-4a70-82aa-4ed595d01e5e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Jan Beulich wrote:
> -LONG_MIN cannot be represented in a long and hence is UB, for being one
> larger than LONG_MAX.
> 
> The caller passing an unsigned long and the 1st param also being (array
> of) unsigned long, change the 2nd param accordingly while adding the
> sole necessary cast. This was the original form of the function anyway.
> 
> Fixes: 5644ce014223 ("x86emul: relax asm() constraints")
> Oss-fuzz: 70923
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -607,9 +607,9 @@ static bool div_dbl(unsigned long u[2],
>   * NB. We don't use idiv directly as it's moderately hard to work out
>   *     ahead of time whether it will #DE, which we cannot allow to happen.
>   */
> -static bool idiv_dbl(unsigned long u[2], long v)
> +static bool idiv_dbl(unsigned long u[2], unsigned long v)
>  {
> -    bool negu = (long)u[1] < 0, negv = v < 0;
> +    bool negu = (long)u[1] < 0, negv = (long)v < 0;
>  
>      /* u = abs(u) */
>      if ( negu )
> 

