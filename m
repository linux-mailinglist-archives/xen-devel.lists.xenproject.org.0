Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9232A9D558
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968701.1358190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RNg-0000Ws-0c; Fri, 25 Apr 2025 22:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968701.1358190; Fri, 25 Apr 2025 22:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RNf-0000UP-TY; Fri, 25 Apr 2025 22:18:47 +0000
Received: by outflank-mailman (input) for mailman id 968701;
 Fri, 25 Apr 2025 22:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8RNe-0000UJ-DK
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:18:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400b1500-2223-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:18:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FE785C6DC3;
 Fri, 25 Apr 2025 22:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE68AC4CEE4;
 Fri, 25 Apr 2025 22:18:41 +0000 (UTC)
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
X-Inumbo-ID: 400b1500-2223-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745619523;
	bh=VuVaJoIUfa4RNR/FRs0bjZySq0GLBBbJoCyO6opGUwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g4bd5IUMqS5SRdFQd01dysc6rzYWgOELZlpe3yz/JsRD1AWGyOiERNMDMvA4NvfvC
	 Ice0Vp0v/4HhycYBfDXL1RtDJHgjn8alyKvnyXD0ek9gEiOVCeAEJIDtb8UB/xVlcB
	 qPxa5sgqddJN/jB4Ogjv/BMQ/2xknh7iQVFQnUpiyoan1Bzdz8EpuE7K5lMb2G053M
	 MpqYBQJJlI7226o06q66HA5xDao/lpLjuaB/BIKezAc2OTbXGGxX/JPwqZMb0O7Pzk
	 AtMUBFqHbYKp8u+kXn/1D3GutzqdFb//pQyLFFjP6izIdi9ZZ8UJpEU5Kyo502z/Ah
	 s9S5JpnNvnHZQ==
Date: Fri, 25 Apr 2025 15:18:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 1/3] xen/console: cleanup conring management
In-Reply-To: <20250403000604.169619-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504251513480.785180@ubuntu-linux-20-04-desktop>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move console_locks_busted handling inside conring_puts() to remove
> tasklet code duplication.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

This patch is a good cleanup but makes one functional change: previously
guest_console_write would always call tasklet_schedule. Now, it only
calls tasklet_schedule if !console_locks_busted.

On ARM, we don't call console_force_unlock and never set
console_locks_busted. It makes no difference.

On x86, there are a few callers of console_force_unlock, so it would
make a difference. However, looking at the callers, it seems to me that
the change is for the better and better aligns the code with the
intention behind console_force_unlock.

On my side:
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

but it would be good for an x86 maintainer to confirm


> ---
>  xen/drivers/char/console.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index c3150fbdb7..aaa97088aa 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -325,6 +325,17 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>   * ********************************************************
>   */
>  
> +static void cf_check notify_dom0_con_ring(void *unused)
> +{
> +    send_global_virq(VIRQ_CON_RING);
> +}
> +
> +static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
> +                               notify_dom0_con_ring,
> +                               NULL);
> +
> +static bool console_locks_busted;
> +
>  static void conring_puts(const char *str, size_t len)
>  {
>      ASSERT(rspin_is_locked(&console_lock));
> @@ -334,6 +345,9 @@ static void conring_puts(const char *str, size_t len)
>  
>      if ( conringp - conringc > conring_size )
>          conringc = conringp - conring_size;
> +
> +    if ( !console_locks_busted )
> +        tasklet_schedule(&notify_dom0_con_ring_tasklet);
>  }
>  
>  long read_console_ring(struct xen_sysctl_readconsole *op)
> @@ -594,13 +608,6 @@ static void cf_check serial_rx(char c)
>      __serial_rx(c);
>  }
>  
> -static void cf_check notify_dom0_con_ring(void *unused)
> -{
> -    send_global_virq(VIRQ_CON_RING);
> -}
> -static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
> -                               notify_dom0_con_ring, NULL);
> -
>  #ifdef CONFIG_X86
>  static inline void xen_console_write_debug_port(const char *buf, size_t len)
>  {
> @@ -648,10 +655,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>  #endif
>  
>              if ( opt_console_to_ring )
> -            {
>                  conring_puts(kbuf, kcount);
> -                tasklet_schedule(&notify_dom0_con_ring_tasklet);
> -            }
>  
>              nrspin_unlock_irq(&console_lock);
>          }
> @@ -753,8 +757,6 @@ long do_console_io(
>   * *****************************************************
>   */
>  
> -static bool console_locks_busted;
> -
>  static void __putstr(const char *str)
>  {
>      size_t len = strlen(str);
> @@ -775,9 +777,6 @@ static void __putstr(const char *str)
>  #endif
>  
>      conring_puts(str, len);
> -
> -    if ( !console_locks_busted )
> -        tasklet_schedule(&notify_dom0_con_ring_tasklet);
>  }
>  
>  static int printk_prefix_check(char *p, char **pp)
> -- 
> 2.34.1
> 
> 

