Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0183F142F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 09:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168398.307462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGcEo-0005xd-Eq; Thu, 19 Aug 2021 07:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168398.307462; Thu, 19 Aug 2021 07:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGcEo-0005vJ-Bn; Thu, 19 Aug 2021 07:13:18 +0000
Received: by outflank-mailman (input) for mailman id 168398;
 Thu, 19 Aug 2021 07:13:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPwx=NK=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mGcEm-0005vD-I7
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 07:13:16 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 571c985f-85e9-4db5-b543-88f6de9b5c29;
 Thu, 19 Aug 2021 07:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E723B261;
 Thu, 19 Aug 2021 09:13:12 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9IsyADec-bF; Thu, 19 Aug 2021 09:13:08 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 4CA19222;
 Thu, 19 Aug 2021 09:13:08 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mGcEd-008yRU-Ds; Thu, 19 Aug 2021 09:13:07 +0200
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
X-Inumbo-ID: 571c985f-85e9-4db5-b543-88f6de9b5c29
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Thu, 19 Aug 2021 09:13:07 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] mini-os: netfront: fix initialization without ip address
 in xenstore
Message-ID: <20210819071307.zitx72bbylsusxkx@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210819053056.32675-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210819053056.32675-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: E723B261
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Juergen Gross, le jeu. 19 août 2021 07:30:56 +0200, a ecrit:
> Commit 4821876fcd2ff ("mini-os: netfront: fix suspend/resume handling")
> introduced a NULL pointer dereference in the initialization of netfront
> in the case of no IP address being set in Xenstore.
> 
> Fix that by testing this condition. At the same time fix a long
> standing bug for the same condition if someone used init_netfront()
> with a non-NULL ip parameter.
> 
> Fixes: 4821876fcd2ff ("mini-os: netfront: fix suspend/resume handling")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  netfront.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/netfront.c b/netfront.c
> index f927e99..dfe065b 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -365,7 +365,7 @@ out:
>          rawmac[5] = dev->rawmac[5];
>  	}
>      if (ip)
> -        *ip = strdup(dev->ip);
> +        *ip = dev->ip ? strdup(dev->ip) : NULL;
>  
>  err:
>      return dev;
> @@ -527,7 +527,7 @@ done:
>          snprintf(path, sizeof(path), "%s/ip", dev->backend);
>          xenbus_read(XBT_NIL, path, &dev->ip);
>  
> -        p = strchr(dev->ip, ' ');
> +        p = dev->ip ? strchr(dev->ip, ' ') : NULL;
>          if (p) {
>              *p++ = '\0';
>              dev->mask = p;
> -- 
> 2.26.2

