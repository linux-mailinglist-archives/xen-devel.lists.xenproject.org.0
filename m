Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F5A3322D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886832.1296431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKyc-0004tl-Id; Wed, 12 Feb 2025 22:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886832.1296431; Wed, 12 Feb 2025 22:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKyc-0004rO-Eq; Wed, 12 Feb 2025 22:13:02 +0000
Received: by outflank-mailman (input) for mailman id 886832;
 Wed, 12 Feb 2025 22:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiKyb-0004rI-RA
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:13:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 847636a5-e98e-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 23:12:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F5AC5C626C;
 Wed, 12 Feb 2025 22:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120FDC4CEDF;
 Wed, 12 Feb 2025 22:12:56 +0000 (UTC)
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
X-Inumbo-ID: 847636a5-e98e-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739398378;
	bh=Piy9TaO9UjKJunWphyNEgKTVq+mDecr0XBSscHTLya0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n3Ee8lh5P2uTZExnCtUlwZQ314dXkcJU8kWIz3mpqGunjJiVyCOgiJ/vG0S/tdwmX
	 mvuWffiWfrF9NE8CXRqQxZpdNiv4UbYcR2bU8TgKvErS5Tbet58+qtJNypctkPAX6w
	 sczTNTuoRPGQYzdBqYQ21/Vj0qOiHzd8XIas93QkbIatbadAMN737juCv2BdBsxKRl
	 mllRwd4MD65gDzN8ug7Q0oPcsCt+gE2jlxs/QrGsmgv+xpn4oEOaxcVvLX9Y43nvno
	 rqHhj3RA+lHQoyoQGolZw3LRiKtEM69wGe+WjzrFy4UkwgYRa+2+HN4cCRrZMxkSNu
	 gdUDbOCzZ5oBQ==
Date: Wed, 12 Feb 2025 14:12:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2] arm/vuart: move vpl011-related code to vpl011
 emulator
In-Reply-To: <20250212211802.1669675-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2502121412500.619090@ubuntu-linux-20-04-desktop>
References: <20250212211802.1669675-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, dmkhn@proton.me wrote:
> Xen console driver has vpl011-related logic which shall belong vpl011 emulator
> code (Arm port). Move vpl011-related code from arch-independent console driver
> to Arm's vpl011.c.
> 
> Use rate-limiting guest_printk() for error logging in console driver in case
> vpl011 cannot handle the console input.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - switched to rate-limited guest_printk()
> - Link to v1: https://lore.kernel.org/xen-devel/20250211075405.191144-1-dmkhn@proton.me/
> - Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1668396058
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
> index b4cec77247..ee5f720de4 100644
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
> +                guest_printk(d, XENLOG_G_WARNING
> +                                "failed to process console input: %d\n", rc);
>              rcu_unlock_domain(d);
> +        }
>  
>          break;
>      }
> -- 
> 2.34.1
> 
> 

