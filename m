Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11639ACBDF6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 02:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003910.1383536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFf0-000423-3N; Tue, 03 Jun 2025 00:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003910.1383536; Tue, 03 Jun 2025 00:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFf0-000400-09; Tue, 03 Jun 2025 00:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1003910;
 Tue, 03 Jun 2025 00:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMFey-0003L6-E6
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 00:37:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f57d2ebd-4012-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 02:37:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73AE361155;
 Tue,  3 Jun 2025 00:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC4C4CEEB;
 Tue,  3 Jun 2025 00:37:39 +0000 (UTC)
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
X-Inumbo-ID: f57d2ebd-4012-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748911061;
	bh=mknFyfIBYxVFm9uq84bHCuR2mRdnTQNbtNIAEz1NApI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdXHPecKuCuq37omhJJVP7j7RenblEm+TXZCVfYRoHX/M+2Vom9nX7aw2/uiG5zVD
	 0fKk9Hq751G09CSV11JMxdYH9YdLGQRKfxWc/dYW+7aNVwSGc/k90R8uWecbV9miEg
	 SQb5Wj71/5YEuPVRqAnewHqlGFpXxglLrb7acd2UIpvKLMeMCVhJO2eRgggJyKBByK
	 1qFIjJxMEktTbKcB2UvhHNyEQ8VYeJKJMRtVADWkvVkD9vzLIhU66bQq3WY0fojnY8
	 B+OCw+K9fzUD9RIa4woclyMvlNMz03wTTim+abfqrdS4cHG9Y9toqJtNr/GkXCRq3H
	 SvqAMNf6LaY5Q==
Date: Mon, 2 Jun 2025 17:37:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 4/4] xen/console: rename console_rx to console_domid
In-Reply-To: <20250530231841.73386-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2506021737300.1147082@ubuntu-linux-20-04-desktop>
References: <20250530231841.73386-1-dmukhin@ford.com> <20250530231841.73386-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Update the symbol name to match the code better.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/console.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 37289d5558..5797f29d31 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -503,11 +503,11 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>  #define switch_code (opt_conswitch[0]-'a'+1)
>  
>  /* Console owner domain identifier. */
> -static domid_t __read_mostly console_rx = DOMID_XEN;
> +static domid_t __read_mostly console_domid = DOMID_XEN;
>  
>  struct domain *console_get_domain(void)
>  {
> -    struct domain *d = rcu_lock_domain_by_id(console_rx);
> +    struct domain *d = rcu_lock_domain_by_id(console_domid);
>  
>      if ( !d )
>          return NULL;
> @@ -533,7 +533,7 @@ static void console_set_domid(domid_t domid)
>      else
>          printk("*** Serial input to DOM%u", domid);
>  
> -    console_rx = domid;
> +    console_domid = domid;
>  
>      if ( switch_code )
>          printk(" (type 'CTRL-%c' three times to switch input)",
> @@ -549,10 +549,10 @@ static void console_switch_input(void)
>  {
>      domid_t hint;
>  
> -    if ( console_rx == DOMID_XEN )
> +    if ( console_domid == DOMID_XEN )
>          hint = get_initial_domain_id();
>      else
> -        hint = console_rx + 1;
> +        hint = console_domid + 1;
>  
>      hint = domid_find_with_input_allowed(hint);
>  
> @@ -564,7 +564,7 @@ static void __serial_rx(char c)
>      struct domain *d;
>      int rc = 0;
>  
> -    if ( console_rx == DOMID_XEN )
> +    if ( console_domid == DOMID_XEN )
>          return handle_keypress(c, false);
>  
>      d = console_get_domain();
> -- 
> 2.34.1
> 
> 

