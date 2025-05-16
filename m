Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD789ABA611
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 00:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987644.1372856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3t9-0007C9-LJ; Fri, 16 May 2025 22:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987644.1372856; Fri, 16 May 2025 22:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3t9-0007AQ-Hj; Fri, 16 May 2025 22:50:47 +0000
Received: by outflank-mailman (input) for mailman id 987644;
 Fri, 16 May 2025 22:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG3t8-000794-Ky
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 22:50:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 310a87d4-32a8-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 00:50:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D5FBA4E387;
 Fri, 16 May 2025 22:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5BEC4CEE4;
 Fri, 16 May 2025 22:50:38 +0000 (UTC)
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
X-Inumbo-ID: 310a87d4-32a8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747435840;
	bh=EaMlxl3QaT07s2kYdSaYMftFi15jETPhARP9rMmRsaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oQtK1pgdcXdYAXK/zKI1pzq6zR/CBqfBayQKMLvwLFR7OQ7YPWjUsblTmNlI8O5j+
	 ohBpIhSU6AcWCiI0tJStnTVXmwweJg1fa9X4PB3HedgHGQNdxHdx6LyvJTN1/zwmIJ
	 Hzi2flRJrzEWcGc22OqF2qgaEf0qL7uds9c2xN9jYstMRgtwqPMYDGGmQf65D86PJx
	 pwT39JMTsAI3p15YnUKjnFMWaZv27cPZ50Diy0Dp+ksSKHFaJDUnk8iEb5yIN3WwhE
	 QrG7A48R1WiSa8FePorSVsHErFm61jEG9XlJGb0Wce3Jbb1DxRgMRVWydN/U8sfUAT
	 UT7U2uqoLLRMw==
Date: Fri, 16 May 2025 15:50:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 1/3] xen/console: cleanup conring management
In-Reply-To: <20250516013508.1144162-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505161550300.145034@ubuntu-linux-20-04-desktop>
References: <20250516013508.1144162-1-dmukhin@ford.com> <20250516013508.1144162-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move conring tasklet code close to conring definitions in the console driver
> and rename conring tasklet variables by adding conring_ prefix for better
> readability.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v3:
> - dropped 3rd argument from conring_puts()
> ---
>  xen/drivers/char/console.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index c3150fbdb7..b4757844e6 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -325,6 +325,16 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>   * ********************************************************
>   */
>  
> +static void cf_check conring_notify(void *unused)
> +{
> +    send_global_virq(VIRQ_CON_RING);
> +}
> +
> +static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
> +
> +/* NB: Do not send conring VIRQs during panic. */
> +static bool conring_no_notify;
> +
>  static void conring_puts(const char *str, size_t len)
>  {
>      ASSERT(rspin_is_locked(&console_lock));
> @@ -594,13 +604,6 @@ static void cf_check serial_rx(char c)
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
> @@ -650,7 +653,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>              if ( opt_console_to_ring )
>              {
>                  conring_puts(kbuf, kcount);
> -                tasklet_schedule(&notify_dom0_con_ring_tasklet);
> +                tasklet_schedule(&conring_tasklet);
>              }
>  
>              nrspin_unlock_irq(&console_lock);
> @@ -753,8 +756,6 @@ long do_console_io(
>   * *****************************************************
>   */
>  
> -static bool console_locks_busted;
> -
>  static void __putstr(const char *str)
>  {
>      size_t len = strlen(str);
> @@ -775,9 +776,8 @@ static void __putstr(const char *str)
>  #endif
>  
>      conring_puts(str, len);
> -
> -    if ( !console_locks_busted )
> -        tasklet_schedule(&notify_dom0_con_ring_tasklet);
> +    if ( !conring_no_notify )
> +        tasklet_schedule(&conring_tasklet);
>  }
>  
>  static int printk_prefix_check(char *p, char **pp)
> @@ -1171,7 +1171,7 @@ void console_force_unlock(void)
>      spin_debug_disable();
>      rspin_lock_init(&console_lock);
>      serial_force_unlock(sercon_handle);
> -    console_locks_busted = 1;
> +    conring_no_notify = true;
>      console_start_sync();
>  }
>  
> -- 
> 2.34.1
> 
> 

