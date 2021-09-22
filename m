Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996641533A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193140.344016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAUp-0007PJ-CJ; Wed, 22 Sep 2021 22:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193140.344016; Wed, 22 Sep 2021 22:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAUp-0007Me-8g; Wed, 22 Sep 2021 22:13:43 +0000
Received: by outflank-mailman (input) for mailman id 193140;
 Wed, 22 Sep 2021 22:13:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTAUn-0007MU-UL
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:13:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 578debc4-1bf2-11ec-b9ee-12813bfff9fa;
 Wed, 22 Sep 2021 22:13:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 179C96103C;
 Wed, 22 Sep 2021 22:13:40 +0000 (UTC)
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
X-Inumbo-ID: 578debc4-1bf2-11ec-b9ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632348820;
	bh=S0NFt5MtrdqOEMYTxFcUac2mrdB+b4BgWYpchcIEUuc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iF61E41TkYzpbBpaLWXTaJBENqr8KFG+308MKqVKXTrLozSfevYsFalZA5nZLbPgg
	 Xl8M0p6CxG2YMPaodqXnhlGy2G2SOogAPP3PQeNgfN5wBwx8WeWOh5Ns9V2LTBnT19
	 BwxsPtsPwlJTW53ykwbJUU3BCdNofJzIwYOXxFkAa86RTH3jLWf/KzjVHvfEAux7DS
	 a/GpVBvWaTb+4fy5+3EMiImrByP/3sSZTur7hgIRopTEW1G2ZfQk4mqIRc3ztiKJM6
	 OeJi45PsQH3JO1I0TZwoFCLqK1FSj1BPgiW7XAkmn5lBrkhJ/n8mjE7eWxwT2hSLsL
	 GJQuw18aYfL0A==
Date: Wed, 22 Sep 2021 15:13:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 04/17] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
In-Reply-To: <e71044315a6d2a3fb127d62954579390cb837d10.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221511320.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <e71044315a6d2a3fb127d62954579390cb837d10.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> ARM architecture does not implement I/O ports. Ignore this call on ARM
> to avoid the overhead of making a hypercall just for Xen to return
> -ENOSYS.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Instead of returning success in XEN, ignored the call in xl.
> ---
>  tools/libs/ctrl/xc_domain.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 23322b70b5..25c95f6596 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1348,6 +1348,14 @@ int xc_domain_ioport_permission(xc_interface *xch,
>                                  uint32_t nr_ports,
>                                  uint32_t allow_access)
>  {
> +#if defined(__arm__) || defined(__aarch64__)
> +    /*
> +     * The ARM architecture does not implement I/O ports.
> +     * Avoid the overhead of making a hypercall just for Xen to return -ENOSYS.
> +     * It is safe to ignore this call on ARM so we just return 0.
> +     */
> +    return 0;

I think this is fine from a code change point of view.

I wonder if we want to return 0 or return an error here, but I am
thinking that 0 is OK because there is really nothing to do anyway as
they end up ignored one way or the other.

Based on that reasoning:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +#else
>      DECLARE_DOMCTL;
>  
>      domctl.cmd = XEN_DOMCTL_ioport_permission;
> @@ -1357,6 +1365,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
>      domctl.u.ioport_permission.allow_access = allow_access;
>  
>      return do_domctl(xch, &domctl);
> +#endif
>  }
>  
>  int xc_availheap(xc_interface *xch,
> -- 
> 2.17.1
> 
> 

