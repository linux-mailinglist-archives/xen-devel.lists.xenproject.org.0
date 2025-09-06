Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2EB46847
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113046.1461155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiOE-00088E-2s; Sat, 06 Sep 2025 02:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113046.1461155; Sat, 06 Sep 2025 02:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiOE-00085Z-04; Sat, 06 Sep 2025 02:10:54 +0000
Received: by outflank-mailman (input) for mailman id 1113046;
 Sat, 06 Sep 2025 02:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiHf-0003fo-DZ
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:04:07 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48ee632-8ac5-11f0-9d12-b5c5bf9af7f9;
 Sat, 06 Sep 2025 04:04:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3CD4602AA;
 Sat,  6 Sep 2025 02:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D6CC4CEF1;
 Sat,  6 Sep 2025 02:04:04 +0000 (UTC)
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
X-Inumbo-ID: c48ee632-8ac5-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124245;
	bh=vYQfNKzaebPiy42F94xlB5QfiWEZKOWL7g71nFr4UfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LHyyKZ8YKN039xNkuDZhN/ncAHzWWWkbbuYVQo74V7y2a+qmWlv90MXK2dGQCBdOH
	 kJaQmN68JeN09Vx3TgCdlc4emmUFmAgH2Wru4O8qmwTuDvkiLC8ICzTWPAUbYZTdcj
	 I/BLC7BInh++Lfrk446wtHsEn9rgIDMA1P06GHRHS0ljvfNFfal/0uvYD6349YGOlX
	 R2e+bzWLamCC/wbWqoJMA0ZqnoGluFYrzeSe5CE8TRhzQEo/JPsz2FB7OquHt53KDD
	 9ZdPW06aoNDUQEiJ70i5oRl1ynHnWJw9L5+sK1PFJ3Y8huahqOhWWETWMbLMRb4NOM
	 o0H3Wa5ubx6KQ==
Date: Fri, 5 Sep 2025 19:04:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 07/15] emul/ns16x50: implement LCR/LSR registers
In-Reply-To: <20250905232715.440758-8-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051903580.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-8-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add LCR/LSR registers implementation to the I/O port handler.
> 
> Add implementation of ns16x50_dlab_get() and ns16x50_iir_check_lsi().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - Moved earlier in the series so follow on patches (THR/RBR) could make use of
>   LSR bits more naturally
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-9-dmukhin@ford.com/
> ---
>  xen/common/emul/vuart/ns16x50.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index a7429c84c36e..9d1fe0284362 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -88,12 +88,12 @@ struct vuart_ns16x50 {
>  
>  static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>  {
> -    return 0;
> +    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
>  }
>  
>  static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
>  {
> -    return false;
> +    return vdev->regs[UART_LSR] & UART_LSR_MASK;
>  }
>  
>  static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
> @@ -226,11 +226,16 @@ static int ns16x50_io_write8(
>              regs[UART_IER] = val & UART_IER_MASK;
>              break;
>  
> +        case UART_LCR:
> +            regs[UART_LCR] = val;
> +            break;
> +
>          /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
>          case UART_SCR:
>              regs[UART_SCR] = val;
>              break;
>  
> +        case UART_LSR: /* RO */
>          default:
>              rc = -EINVAL;
>              break;
> @@ -312,6 +317,15 @@ static int ns16x50_io_read8(
>              val = ns16x50_iir_get(vdev);
>              break;
>  
> +        case UART_LCR:
> +            val = regs[UART_LCR];
> +            break;
> +
> +        case UART_LSR:
> +            val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
> +            regs[UART_LSR] = val & ~UART_LSR_MASK;
> +            break;
> +
>          case UART_SCR:
>              val = regs[UART_SCR];
>              break;
> -- 
> 2.51.0
> 

