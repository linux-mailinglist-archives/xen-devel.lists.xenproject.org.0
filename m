Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C6A31B46
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 02:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886065.1295796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti1kU-0002dH-Cd; Wed, 12 Feb 2025 01:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886065.1295796; Wed, 12 Feb 2025 01:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti1kU-0002bp-9u; Wed, 12 Feb 2025 01:41:10 +0000
Received: by outflank-mailman (input) for mailman id 886065;
 Wed, 12 Feb 2025 01:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ti1kT-0002Xb-48
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 01:41:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 683660d9-e8e2-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 02:40:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C85F25C5661;
 Wed, 12 Feb 2025 01:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FAEC4CEDD;
 Wed, 12 Feb 2025 01:40:55 +0000 (UTC)
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
X-Inumbo-ID: 683660d9-e8e2-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739324457;
	bh=Ti7M/+g/3zd39wxXNA7rjLA5dMH7lE3Mz46f1KkCMOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pDv6uM6ho1+ngoY6t5rnW4wWNRZGqbsZG2m0OgFbdZ2eM/qTSEsOsFiLF63231AzE
	 QzOZr2mM6AFaO2d+WBblXqUkl+Ifje+PSafdKg4BOJgk0wnLuvbzhbVpOn7OELgS2f
	 KoI3iWN3sVaUElYOHHnZlAj7+E9pZzpXgRFKg7STgkurLviR6inP0yT4PfYkKgELkF
	 W1mseUEx1BBsUxofLP4dMxWHZ3sKF9gFLTfOZg0OTV3cZGrlWIL2Z58UKzJ5k6cOK1
	 U+w3wvw1iy+ieJ3tyy6I759bGEQ9W6yHJeA9yQiTne50se5woF/Hd9ijYZ+LltJfAp
	 T4Zm3+gAcfHgg==
Date: Tue, 11 Feb 2025 17:40:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH] arm/vuart: move vpl011-related code to vpl011 emulator
In-Reply-To: <20250211075405.191144-1-dmkhn@proton.me>
Message-ID: <alpine.DEB.2.22.394.2502111739010.619090@ubuntu-linux-20-04-desktop>
References: <20250211075405.191144-1-dmkhn@proton.me>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Xen console driver has vpl011-related logic which shall belong vpl011 emulator
> code (Arm port). Move vpl011-related code from arch-independent console driver
> to Arm's vpl011.c.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Link to the original patch:
>   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-2-c5d36b31d66c@ford.com/
> ---
>  xen/arch/arm/include/asm/vpl011.h |  2 +-
>  xen/arch/arm/vpl011.c             | 15 +++++++++++----
>  xen/drivers/char/console.c        | 21 +++++++--------------
>  3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
> index c09abcd7a9..cc83868281 100644
> --- a/xen/arch/arm/include/asm/vpl011.h
> +++ b/xen/arch/arm/include/asm/vpl011.h
> @@ -69,7 +69,7 @@ struct vpl011_init_info {
>  int domain_vpl011_init(struct domain *d,
>                         struct vpl011_init_info *info);
>  void domain_vpl011_deinit(struct domain *d);
> -void vpl011_rx_char_xen(struct domain *d, char c);
> +int vpl011_rx_char_xen(struct domain *d, char c);
>  #else
>  static inline int domain_vpl011_init(struct domain *d,
>                                       struct vpl011_init_info *info)
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 1fc3114cce..c72f3778bf 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -567,16 +567,21 @@ static void vpl011_data_avail(struct domain *d,
>  
>  /*
>   * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
> - * It is only used when the vpl011 backend is in Xen.
>   */
> -void vpl011_rx_char_xen(struct domain *d, char c)
> +int vpl011_rx_char_xen(struct domain *d, char c)
>  {
>      unsigned long flags;
>      struct vpl011 *vpl011 = &d->arch.vpl011;
>      struct vpl011_xen_backend *intf = vpl011->backend.xen;
>      XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
>  
> -    ASSERT(!vpl011->backend_in_domain);
> +    /* Forward input iff the vpl011 backend is in Xen. */
> +    if ( vpl011->backend_in_domain )
> +        return -ENODEV;
> +
> +    if ( intf == NULL )
> +        return -ENODEV;
> +
>      VPL011_LOCK(d, flags);
>  
>      in_cons = intf->in_cons;
> @@ -584,7 +589,7 @@ void vpl011_rx_char_xen(struct domain *d, char c)
>      if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) == sizeof(intf->in) )
>      {
>          VPL011_UNLOCK(d, flags);
> -        return;
> +        return -ENOSPC;

Everything else looks fine. I am a bit unsure about this -ENOSPC return
because...


>      }
>  
>      intf->in[xencons_mask(in_prod, sizeof(intf->in))] = c;
> @@ -596,6 +601,8 @@ void vpl011_rx_char_xen(struct domain *d, char c)
>  
>      vpl011_data_avail(d, in_fifo_level, sizeof(intf->in), 0, SBSA_UART_FIFO_SIZE);
>      VPL011_UNLOCK(d, flags);
> +
> +    return 0;
>  }
>  
>  static void vpl011_notification(struct vcpu *v, unsigned int port)
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index b4cec77247..5e6f0fb062 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -553,21 +553,14 @@ static void __serial_rx(char c)
>      {
>          struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
>  
> -        /*
> -         * If we have a properly initialized vpl011 console for the
> -         * domain, without a full PV ring to Dom0 (in that case input
> -         * comes from the PV ring), then send the character to it.
> -         */
> -        if ( d != NULL &&
> -             !d->arch.vpl011.backend_in_domain &&
> -             d->arch.vpl011.backend.xen != NULL )
> -            vpl011_rx_char_xen(d, c);
> -        else
> -            printk("Cannot send chars to Dom%d: no UART available\n",
> -                   console_rx - 1);
> -
> -        if ( d != NULL )
> +        if ( d )
> +        {
> +            int rc = vpl011_rx_char_xen(d, c);
> +            if ( rc )
> +                printk(KERN_WARNING "%pd: failed to process console input: %d\n",
> +                       d, rc);

... it could trigger a warning here. And any prink triggerable by the
guest should be rate limited. We already have a function for that which
is guest_printk. So I think we should probably change this warning to be
guest_printk. Or change return -ENODEV into return 0.


>              rcu_unlock_domain(d);
> +        }
>  
>          break;
>      }
> -- 
> 2.34.1
> 
> 

