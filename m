Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88D63CB06
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 23:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449673.706562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p092W-0002iA-7i; Tue, 29 Nov 2022 22:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449673.706562; Tue, 29 Nov 2022 22:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p092W-0002fa-4x; Tue, 29 Nov 2022 22:25:20 +0000
Received: by outflank-mailman (input) for mailman id 449673;
 Tue, 29 Nov 2022 22:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p092U-0002fU-SQ
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 22:25:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3accec4-7034-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 23:25:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66E00B8197E;
 Tue, 29 Nov 2022 22:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBD4C433D6;
 Tue, 29 Nov 2022 22:25:13 +0000 (UTC)
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
X-Inumbo-ID: b3accec4-7034-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669760715;
	bh=MTi3eCesRlzQNLX++3E0N9zK19ByIHxrBbpWGeJzPsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bcuwe4011W1EV7m7lqiLQCoubqhZSBuRQ4IFeHON2n+irELW9/XO4T1BNRrd3sFQG
	 C8iloTFvWqOLLjrasPmVZmRvL21w4m6XgrxeaQN0n4oMWpI5BcMR7N1pRcEDfOKd6l
	 qXAWhElGrrP2DeS840ArAoGgl089SvzMDKI7/ex75BkDHXInBDU4I0NddEENZLVRQv
	 iicP73qxnn1g0HG4cOdXTIzzhHBtWPP3wYxFDpAREURYvnonHpJ2DMGLPlUgEZrEnZ
	 1AFf1zpagYRmQrVpTa5kXCcEa1QdfAR0C2uN9O1uzX9dqGVrTqTYdfMPg4D8nRlPOF
	 ycJ+Oe2l21X8A==
Date: Tue, 29 Nov 2022 14:25:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] hvc/xen: lock console list traversal
In-Reply-To: <20221129143145.4234-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211291416540.4039@ubuntu-linux-20-04-desktop>
References: <20221129143145.4234-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-503985613-1669760387=:4039"
Content-ID: <alpine.DEB.2.22.394.2211291420410.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-503985613-1669760387=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211291420411.4039@ubuntu-linux-20-04-desktop>

On Tue, 29 Nov 2022, Roger Pau Monne wrote:
> The currently lockless access to the xen console list in
> vtermno_to_xencons() is incorrect, as additions and removals from the
> list can happen anytime, and as such the traversal of the list to get
> the private console data for a given termno needs to happen with the
> lock held.  Note users that modify the list already do so with the
> lock taken.
> 
> While there switch from using list_for_each_entry_safe to
> list_for_each_entry: the current entry cursor won't be removed as
> part of the code in the loop body, so using the _safe variant is
> pointless.
> 
> Fixes: 02e19f9c7cac ('hvc_xen: implement multiconsole support')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  drivers/tty/hvc/hvc_xen.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index d65741983837..117dc48f980e 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -53,17 +53,22 @@ static DEFINE_SPINLOCK(xencons_lock);
>  
>  static struct xencons_info *vtermno_to_xencons(int vtermno)
>  {
> -	struct xencons_info *entry, *n, *ret = NULL;
> +	struct xencons_info *entry, *ret = NULL;
> +	unsigned long flags;
>  
> -	if (list_empty(&xenconsoles))
> -			return NULL;
> +	spin_lock_irqsave(&xencons_lock, flags);

If xencons_lock requires irqsave then we need to change all the
xencons_lock spinlocks to call irqsave, including the ones in
xen_hvm_console_init if they can happen at runtime.


> +	if (list_empty(&xenconsoles)) {
> +		spin_unlock_irqrestore(&xencons_lock, flags);
> +		return NULL;
> +	}
>  
> -	list_for_each_entry_safe(entry, n, &xenconsoles, list) {
> +	list_for_each_entry(entry, &xenconsoles, list) {
>  		if (entry->vtermno == vtermno) {
>  			ret  = entry;
>  			break;
>  		}
>  	}
> +	spin_unlock_irqrestore(&xencons_lock, flags);
>  
>  	return ret;
>  }
> -- 
> 2.37.3
> 
--8323329-503985613-1669760387=:4039--

