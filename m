Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9039B3C3D8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102170.1454905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5rN-0007gM-A8; Fri, 29 Aug 2025 20:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102170.1454905; Fri, 29 Aug 2025 20:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5rN-0007ds-7U; Fri, 29 Aug 2025 20:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1102170;
 Fri, 29 Aug 2025 20:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us5rM-0007dk-Bv
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:38:08 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10fbbb72-8518-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 22:38:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A76E460146;
 Fri, 29 Aug 2025 20:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA76C4CEF0;
 Fri, 29 Aug 2025 20:38:04 +0000 (UTC)
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
X-Inumbo-ID: 10fbbb72-8518-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756499885;
	bh=WK0hba0MbH1fBbcqBC1X+A3DKe9NBrs9rEwn7qEomCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MisNLSgTNgOwQGSFm8jBjPVEogDKNSXWkrDYGFRPwf4xWAvrbTbLOYx4O5xQay78Z
	 0l/KkKk45gpJycAn4I62PggeIGYCX/cV3opn1fdIaCv1nm7ltMqUkyRzN/dwCF9smN
	 jcxnLLv0F6NRZoQ3hs3Gev/2tNYvi1q2jw3gzan+dLazzJSuEYPXCRJV6OL8YflmR2
	 5Vp9glyofiSUcsm08yQc0l1vUOfg6zgirpUiyYlnzSkL96pTOOvkFefSPBBP6oVFjp
	 GrzPL+KN5ZI//mCjBJBFlDqDXzlJzF9yN33nornksFJoWL3rI4qYeVMU7NtJlRCxaJ
	 mAaE/2k2wKk4A==
Date: Fri, 29 Aug 2025 13:38:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 07/15] emul/ns16x50: implement FCR register
 (write-only)
In-Reply-To: <20250828235409.2835815-8-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291335260.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-8-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add emulation logic for FCR register.
> 
> Note, that does not hooks FIFO interrupt moderation to the FIFO management
> code.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - new patch
> ---
>  xen/common/emul/vuart/ns16x50.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index efb2f4c6441c..65ca96dd8bd3 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -363,6 +363,30 @@ static int ns16x50_io_write8(
>  
>              break;
>  
> +        case UART_FCR: /* WO */
> +            if ( val & UART_FCR_RESERVED0 )
> +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> +                             UART_FCR_RESERVED0);
> +
> +            if ( val & UART_FCR_RESERVED1 )
> +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
> +                             UART_FCR_RESERVED1);
> +
> +            if ( val & UART_FCR_CLRX )
> +                ns16x50_fifo_rx_reset(vdev);
> +
> +            if ( val & UART_FCR_CLTX )
> +                ns16x50_fifo_tx_flush(vdev);

Should UART_FCR_CLTX actually emit data or only clear the buffer?

set UART_IIR_THR ?


> +
> +            if ( val & UART_FCR_ENABLE )
> +                val &= UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MASK;
> +            else
> +                val = 0;
> +
> +            regs[UART_FCR] = val;


ns16x50_irq_check ?


> +            break;
> +
>          default:
>              rc = -EINVAL;
>              break;
> -- 
> 2.51.0
> 

