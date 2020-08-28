Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1502554BD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 08:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBYLd-0000M4-QQ; Fri, 28 Aug 2020 06:58:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBYLc-0000Lz-Ln
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 06:58:52 +0000
X-Inumbo-ID: 2c2cef38-aa43-452f-acf9-37f78bdd061d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c2cef38-aa43-452f-acf9-37f78bdd061d;
 Fri, 28 Aug 2020 06:58:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD2CBB683;
 Fri, 28 Aug 2020 06:59:22 +0000 (UTC)
Subject: Re: [PATCH] stubdom/grub: Update init_netfront() call for mini-os
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: xen-devel@lists.xenproject.org, samuel.thibault@ens-lyon.org, wl@xen.org
References: <20200827191257.30100-1-costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0b01c02-d03e-db89-eeec-fadb1122087b@suse.com>
Date: Fri, 28 Aug 2020 08:58:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827191257.30100-1-costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 27.08.2020 21:12, Costin Lupu wrote:
> This patch updates the call of init_netfront() function according to its
> recently updated declaration which can also include parameters for gateway
> and netmask addresses. While we are here, the patch also removes passing
> the ip parameter because (a) it is not used anywhere and (b) it wastes
> memory since it would reference a dynamically allocated string.

Reported-by: Jan Beulich <jbeulich@suse.com>

> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
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
> 


