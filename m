Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DEC4EA395
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 01:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295607.503126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYyg2-0005xQ-An; Mon, 28 Mar 2022 23:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295607.503126; Mon, 28 Mar 2022 23:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYyg2-0005uL-7c; Mon, 28 Mar 2022 23:21:34 +0000
Received: by outflank-mailman (input) for mailman id 295607;
 Mon, 28 Mar 2022 23:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nYyg0-0005uE-Nd
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 23:21:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb636d6f-aeed-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 01:21:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A278BB8115C;
 Mon, 28 Mar 2022 23:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1849C340ED;
 Mon, 28 Mar 2022 23:21:25 +0000 (UTC)
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
X-Inumbo-ID: cb636d6f-aeed-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648509686;
	bh=9cRGrfJmmrL66zzdetsW2vFEFDubcVPSD5hgq9Z2gK8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dkQlBFhmNXgEc9148O5hk/SVUJp9b3pW1xLMdExJy4/N3fv7rP/T1ENceA2+jj81I
	 bVAEdCb8EikVzoAtAACnKSaeTzXy14qDS6AntFXnXB+ZRsPkI6CHZsu/b2DVHCNEXI
	 OGTGNPYZpGcJtH/yZ4bJObXLNoa8RbuCvb2LGi8d7idbYxiInq9NKuH26FcZ+EWnWh
	 YyfGU2RLBqzFHdTPwo72qV0j1+lmfl+Ah0JKDVOqmDefvp4y+DMmHAYdOsncI4ke7v
	 ZPNR8tyRkvOTzdRRlYA6t3L6yrCdGP0Ye1zRLZ8iWlv5A1PZi7ziuElU00MQle81Nc
	 E8sLmoaAUTDqw==
Date: Mon, 28 Mar 2022 16:21:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <20220328203622.30961-2-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2203281621000.2910984@ubuntu-linux-20-04-desktop>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com> <20220328203622.30961-2-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Mar 2022, Daniel P. Smith wrote:
> During domain construction under dom0less and hyperlaunch it is necessary to
> allocate at least the event channel for xenstore and potentially the event
> channel for the core console. When dom0less and hyperlaunch are doing their
> construction logic they are executing under the idle domain context. The idle
> domain is not a privileged domain, it is not the target domain, and as a result
> under the current default XSM policy is not allowed to allocate the event
> channel.
> 
> This patch only addresses the event channel situation by adjust the default XSM
> policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
> make the allocation call.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/event_channel.c | 4 ++--
>  xen/include/xsm/dummy.h    | 8 ++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index ffb042a241..c9c3876ee9 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -306,7 +306,7 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>          ERROR_EXIT_DOM(port, d);
>      chn = evtchn_from_port(d, port);
>  
> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> +    rc = xsm_evtchn_unbound(XSM_OTHER, d, chn, alloc->remote_dom);
>      if ( rc )
>          goto out;
>  
> @@ -1366,7 +1366,7 @@ int alloc_unbound_xen_event_channel(
>          goto out;
>      chn = evtchn_from_port(ld, port);
>  
> -    rc = xsm_evtchn_unbound(XSM_TARGET, ld, chn, remote_domid);
> +    rc = xsm_evtchn_unbound(XSM_OTHER, ld, chn, remote_domid);
>      if ( rc )
>          goto out;
>  
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 58afc1d589..bd31ce43f9 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -294,8 +294,12 @@ static XSM_INLINE int cf_check xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
>  static XSM_INLINE int cf_check xsm_evtchn_unbound(
>      XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
>  {
> -    XSM_ASSERT_ACTION(XSM_TARGET);
> -    return xsm_default_action(action, current->domain, d);
> +    XSM_ASSERT_ACTION(XSM_OTHER);
> +
> +    if ( is_system_domain(current->domain) )
> +        return xsm_default_action(XSM_HOOK, current->domain, d);
> +    else
> +        return xsm_default_action(XSM_TARGET, current->domain, d);
>  }
>  
>  static XSM_INLINE int cf_check xsm_evtchn_interdomain(
> -- 
> 2.20.1
> 

