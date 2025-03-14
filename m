Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B0A61C6A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 21:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915394.1320938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBYF-0003hI-WF; Fri, 14 Mar 2025 20:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915394.1320938; Fri, 14 Mar 2025 20:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBYF-0003fF-SQ; Fri, 14 Mar 2025 20:22:39 +0000
Received: by outflank-mailman (input) for mailman id 915394;
 Fri, 14 Mar 2025 20:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ttBYE-0003MF-Ba
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 20:22:38 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120fac8b-0112-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 21:22:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1947BA4729D;
 Fri, 14 Mar 2025 20:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974E8C4CEE3;
 Fri, 14 Mar 2025 20:22:35 +0000 (UTC)
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
X-Inumbo-ID: 120fac8b-0112-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741983756;
	bh=e/+ICA0UdW+Xu6KMh6EABG3DWjPfafP8epBewffPOR0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iN6snPiAnZ9QTC3EYOVHsXSbCT238s42nuZ8Fre6KzS3rGSmIfAJOlOpWsedSww3Z
	 vNRciT5mpKmdJiodZ6wvYkSl9GnkPbSV0S7r6fvyFUSwVXiQntxHO2thHlt2wuSCoR
	 F0aIYYq2wYmyomk/3l7iAJ1TJX6tCh6lvoHxYSu4tYPQWmS+0GVI+Cp/vegxQVfNns
	 zZ/j+18a/mu9DSL6HLdFbwY4/TMTFS6bFifyUL1sViu9PbouwjxhpJLiWlv+KUcgLS
	 7CB9ilXt230Ob6J84Y9aBBVczss5OPZkmC0duPxuX95qEyJqTyD1qY3ev5qnrRzsFR
	 kwESDEqPXJdlw==
Date: Fri, 14 Mar 2025 13:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Markus Armbruster <armbru@redhat.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] hw/xen: Downgrade a xen_bus_realize() non-error to
 warning
In-Reply-To: <20250314143500.2449658-3-armbru@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2503141321300.3477110@ubuntu-linux-20-04-desktop>
References: <20250314143500.2449658-1-armbru@redhat.com> <20250314143500.2449658-3-armbru@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Markus Armbruster wrote:
> xen_bus_realize() reports a failure to set up a watch as error, but it
> doesn't treat it as one: it simply continues.  Report a warning
> instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-bus.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 2aacc1436f..f808a01813 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -353,10 +353,9 @@ static void xen_bus_realize(BusState *bus, Error **errp)
>              xs_node_watch(xenbus->xsh, node, key, xen_bus_backend_changed,
>                            xenbus, &local_err);
>          if (local_err) {
> -            /* This need not be treated as a hard error so don't propagate */
> -            error_reportf_err(local_err,
> -                              "failed to set up '%s' enumeration watch: ",
> -                              type[i]);
> +            warn_reportf_err(local_err,
> +                             "failed to set up '%s' enumeration watch: ",
> +                             type[i]);
>              local_err = NULL;
>          }
>  
> -- 
> 2.48.1
> 

