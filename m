Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E2A61C69
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 21:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915392.1320925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBY9-0003Pu-QM; Fri, 14 Mar 2025 20:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915392.1320925; Fri, 14 Mar 2025 20:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBY9-0003Mi-LT; Fri, 14 Mar 2025 20:22:33 +0000
Received: by outflank-mailman (input) for mailman id 915392;
 Fri, 14 Mar 2025 20:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ttBY7-0003MF-Uo
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 20:22:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc774e9-0112-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 21:22:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0D3DA488DF;
 Fri, 14 Mar 2025 20:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD04C4CEE3;
 Fri, 14 Mar 2025 20:22:27 +0000 (UTC)
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
X-Inumbo-ID: 0dc774e9-0112-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741983749;
	bh=YNCessG+uDSbwGXWuodhi+296lWS/qzWXOaYaGEjb6g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fOgA2GObvuTseKVq3XX6cFlneDHRB7EOGJJ3mIDm6Vuozd/wcnoNQGN5jkAHZXyyq
	 MI4wOIDmXNlbi7bgAqRw+hCLv2xp0drmMUXNgrq0pifsu7w4X2/PHW3l2Ue8+A5Ne/
	 /t77RtLskjMNp59IN2WhxdWNjraqaKHBt7cOFz/F0wHldlQ0OglCq54r0TSJMZBRSx
	 HUqjPe6DOi9aaohl2KMcuCPpFjzulKhsfHircs346mrttPQzpqX775hq5GyOA1q3fH
	 /NgteNGotyJfw64WZJS8K3QwBwUqmwHL6lc9Zam3ugRCLPvhANft1jFiuyWV62duPq
	 SFH7HAOOdBZcQ==
Date: Fri, 14 Mar 2025 13:22:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Markus Armbruster <armbru@redhat.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] hw/xen: Fix xen_bus_realize() error handling
In-Reply-To: <20250314143500.2449658-2-armbru@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2503141321390.3477110@ubuntu-linux-20-04-desktop>
References: <20250314143500.2449658-1-armbru@redhat.com> <20250314143500.2449658-2-armbru@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> xen_bus_realize() is wrong that way: it passes &local_err to
> xs_node_watch() in a loop.  If this fails in more than one iteration,
> it can trip error_setv()'s assertion.
> 
> Fix by clearing @local_err.
> 
> Fixes: c4583c8c394e (xen-bus: reduce scope of backend watch)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 8260f1e1bb..2aacc1436f 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -357,6 +357,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
>              error_reportf_err(local_err,
>                                "failed to set up '%s' enumeration watch: ",
>                                type[i]);
> +            local_err = NULL;
>          }
>  
>          g_free(node);
> -- 
> 2.48.1
> 

