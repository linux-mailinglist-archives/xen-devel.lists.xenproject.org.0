Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAC254E0F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 21:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBNNu-0006zQ-FX; Thu, 27 Aug 2020 19:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z6xA=CF=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kBNNs-0006zL-MK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 19:16:28 +0000
X-Inumbo-ID: b3655409-2127-4750-af2e-9cb04e3db63a
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3655409-2127-4750-af2e-9cb04e3db63a;
 Thu, 27 Aug 2020 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id CE667940F;
 Thu, 27 Aug 2020 21:16:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EB0IryWHTsgs; Thu, 27 Aug 2020 21:16:26 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3862F9271;
 Thu, 27 Aug 2020 21:16:26 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kBNNo-000AXe-Qd; Thu, 27 Aug 2020 21:16:24 +0200
Date: Thu, 27 Aug 2020 21:16:24 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com
Subject: Re: [PATCH] stubdom/grub: Update init_netfront() call for mini-os
Message-ID: <20200827191624.kuxpbiauoqfkwa2q@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org,
 wl@xen.org, jbeulich@suse.com
References: <20200827191257.30100-1-costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200827191257.30100-1-costin.lupu@cs.pub.ro>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Costin Lupu, le jeu. 27 août 2020 22:12:57 +0300, a ecrit:
> This patch updates the call of init_netfront() function according to its
> recently updated declaration which can also include parameters for gateway
> and netmask addresses. While we are here, the patch also removes passing
> the ip parameter because (a) it is not used anywhere and (b) it wastes
> memory since it would reference a dynamically allocated string.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/grub/mini-os.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c
> index 4fc052a255..b33dbf02fb 100644
> --- a/stubdom/grub/mini-os.c
> +++ b/stubdom/grub/mini-os.c
> @@ -291,8 +291,6 @@ struct netfront_dev *net_dev;
>  int
>  minios_probe (struct nic *nic)
>  {
> -    char *ip;
> -
>      if (net_dev)
>          return 1;
>  
> @@ -300,7 +298,7 @@ minios_probe (struct nic *nic)
>      grub_memset ((char *) arptable, 0,
>                   MAX_ARP * sizeof (struct arptable_t));
>  
> -    net_dev = init_netfront(NULL, (void*) -1, nic->node_addr, &ip);
> +    net_dev = init_netfront(NULL, (void*) -1, nic->node_addr, NULL, NULL, NULL);
>      if (!net_dev)
>          return 0;
>  
> -- 
> 2.20.1
> 

