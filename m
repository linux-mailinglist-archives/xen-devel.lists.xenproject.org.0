Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0AB4680C
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 03:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112942.1461066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuhwm-0007kh-1A; Sat, 06 Sep 2025 01:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112942.1461066; Sat, 06 Sep 2025 01:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuhwl-0007iJ-TM; Sat, 06 Sep 2025 01:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1112942;
 Sat, 06 Sep 2025 01:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuhwj-0007Tj-Rl
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 01:42:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9a03df-8ac2-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 03:42:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE096602AB;
 Sat,  6 Sep 2025 01:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC05C4CEF1;
 Sat,  6 Sep 2025 01:42:25 +0000 (UTC)
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
X-Inumbo-ID: be9a03df-8ac2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757122946;
	bh=6xqp9cjx3BzDJ3XJ7gGNSnkBn3Og11f1EICkfE1liBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ac1HSdyTQcZynGrwmlU+q9b2pS4QaUIA/JN37mR2++7FimrP9cJchQDmdJ1pZEkiW
	 vPpUUaEOIxBTQhLBPaTzEuFI59iBJjTQzJa3SQHRWsoG/7pEekK7eHdErQSDP4DAPO
	 9uPyEpKlRlN1TkIKupkxVlPHig+s53IHquYRNFROnyAY7KZhTTnanL8BWFRnY3vGjJ
	 giMZKihWUSXt202LQP+6McIzry9TsUB2QKcc2xGX8AlGXD/108z1+Uj2gDB5qlivsW
	 a3hRDbhNqS3O4dM7Av7Qdk9pre1uHDQE+gxP5Y7/OSVIalP8ymWW1ExRYOUTwxIK2i
	 3HhaASAs3eyLw==
Date: Fri, 5 Sep 2025 18:42:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 08/15] emul/ns16x50: implement MCR/MSR registers
In-Reply-To: <20250905232715.440758-9-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051837410.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-9-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add MCR/MSR registers emulation to the I/O port handler.
> 
> Add implementation of ns16x50_iir_check_msi().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes in v5:
> - Moved earlier in the series
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-10-dmukhin@ford.com/
> ---
>  xen/common/emul/vuart/ns16x50.c | 62 ++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 9d1fe0284362..a8ec9f6c3a04 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -108,7 +108,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>  
>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
>  {
> -    return false;
> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
>  }
>  
>  /*
> @@ -230,12 +230,63 @@ static int ns16x50_io_write8(
>              regs[UART_LCR] = val;
>              break;
>  
> +        case UART_MCR: {
> +            uint8_t msr_curr, msr_next, msr_delta;
> +
> +            msr_curr = regs[UART_MSR];
> +            msr_next = 0;
> +            msr_delta = 0;
> +
> +            if ( val & UART_MCR_RESERVED0 )
> +                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x\n",
> +                             UART_MCR_RESERVED0);
> +
> +            if ( val & UART_MCR_TCRTLR )
> +                ns16x50_warn(vdev, "MCR: not supported: %x\n",
> +                             UART_MCR_TCRTLR);
> +
> +            if ( val & UART_MCR_RESERVED1 )
> +                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x\n",
> +                             UART_MCR_RESERVED1);
> +
> +            /* Set modem status */
> +            if ( val & UART_MCR_LOOP )
> +            {
> +                if ( val & UART_MCR_DTR )
> +                    msr_next |= UART_MSR_DSR;
> +                if ( val & UART_MCR_RTS )
> +                    msr_next |= UART_MSR_CTS;
> +                if ( val & UART_MCR_OUT1 )
> +                    msr_next |= UART_MSR_RI;
> +                if ( val & UART_MCR_OUT2 )
> +                    msr_next |= UART_MSR_DCD;
> +            }
> +            else
> +                msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
> +
> +            /* Calculate changes in modem status */
> +            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> +                msr_delta |= UART_MSR_DCTS;
> +            if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
> +                msr_delta |= UART_MSR_DDSR;
> +            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
> +                msr_delta |= UART_MSR_TERI;

Should this be:

if ( (msr_curr & UART_MSR_RI) && !(msr_next & UART_MSR_RI) )
    msr_delta |= UART_MSR_TERI;

?


> +            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> +                msr_delta |= UART_MSR_DDCD;
> +
> +            regs[UART_MCR] = val & UART_MCR_MASK;
> +            regs[UART_MSR] = msr_next | msr_delta;
> +
> +            break;
> +        }


