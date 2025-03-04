Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82CA4F0B7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 23:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901557.1309520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpb2y-0001h1-26; Tue, 04 Mar 2025 22:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901557.1309520; Tue, 04 Mar 2025 22:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpb2x-0001fY-Vl; Tue, 04 Mar 2025 22:47:31 +0000
Received: by outflank-mailman (input) for mailman id 901557;
 Tue, 04 Mar 2025 22:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpb2w-0001fS-EO
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 22:47:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b74322-f94a-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 23:47:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 35599A46018;
 Tue,  4 Mar 2025 22:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A0FC4CEE5;
 Tue,  4 Mar 2025 22:47:25 +0000 (UTC)
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
X-Inumbo-ID: a5b74322-f94a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741128446;
	bh=pJjgE4hP0Hn3MC32EegzqHfmNUqzFYjWwUHgIVz+FIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=shuQ54HQ6fHWVDJ4mG/xpksSA9/OWUlgtYgivgW/lO3K18rCnh44ArJUi+lqhupQR
	 PDMM8tp7oA+0qm3u9++uNB/wvSvVTcu5Jz76CMCImnHjAWUKx1oBDdYit8Istus3ts
	 REysGnvVmzItnL6Fi0tk3XKLDCPwLHOGie03O9Q98zCjHrV1Yaky9cMI1D5B8wuqoS
	 ss9rWMPd+B6OMYShfxVjRQzb5ayQf1w2avEU7rFCUsEDVGA91H8s1FTdZKfSQxFIbi
	 s5Zg6SGfU0nEym24AnSnnKQNYGpzQjKL9Z3GeY5Y6ZNfUtMFYluQasRPXkBLXLLlSK
	 Jfh++aENe/JtA==
Date: Tue, 4 Mar 2025 14:47:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v2 2/2] xen/watchdog: Identify which domain watchdog
 fired
In-Reply-To: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503041445010.1303386@ubuntu-linux-20-04-desktop>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com> <20250303232941.2641306-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-312225281-1741128447=:1303386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-312225281-1741128447=:1303386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Mar 2025, Andrew Cooper wrote:
> When a watchdog fires, the domain is crashed and can't dump any state.
> 
> Xen allows a domain to have two separate watchdogs.  Therefore, for a
> domain running multiple watchdogs (e.g. one based around network, one
> for disk), it is important for diagnostics to know which watchdog
> fired.
> 
> As the printk() is in a timer callback, this is a bit awkward to
> arrange, but there are 12 spare bits in the bottom of the domain
> pointer owing to its alignment.
> 
> Reuse these bits to encode the watchdog id too, so the one which fired
> is identified when the domain is crashed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The code looks like it would work as intended.

I checked with the MISRA rules and it looks like it would fall under the
allowed exception. Please have a run through ECLAIR to make sure it
doesn't cause regressions (especially R11.2).


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <gwd@xenproject.org>
> 
> v2:
>  * BUILD_BUG_ON() against the alignment of d.
> ---
>  xen/common/sched/core.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d6296d99fdb9..3db0fe32ccd8 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1534,12 +1534,19 @@ long vcpu_yield(void)
>  
>  static void cf_check domain_watchdog_timeout(void *data)
>  {
> -    struct domain *d = data;
> +    /*
> +     * The data parameter encodes the watchdog id in the low bits of
> +     * the domain pointer.
> +     */
> +    struct domain *d = _p((unsigned long)data & PAGE_MASK);
> +    unsigned int id = (unsigned long)data & ~PAGE_MASK;
> +
> +    BUILD_BUG_ON(!(alignof(d) < PAGE_SIZE));
>  
>      if ( d->is_shutting_down || d->is_dying )
>          return;
>  
> -    printk("Watchdog timer fired for domain %u\n", d->domain_id);
> +    printk("Watchdog timer %u fired for %pd\n", id, d);
>      domain_shutdown(d, SHUTDOWN_watchdog);
>  }
>  
> @@ -1593,7 +1600,17 @@ void watchdog_domain_init(struct domain *d)
>      d->watchdog_inuse_map = 0;
>  
>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
> +    {
> +        void *data = d;
> +
> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));
> +
> +        /*
> +         * For the timer callback parameter, encode the watchdog id in
> +         * the low bits of the domain pointer.
> +         */
> +        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
> +    }
>  }
>  
>  void watchdog_domain_destroy(struct domain *d)
> -- 
> 2.39.5
> 
--8323329-312225281-1741128447=:1303386--

