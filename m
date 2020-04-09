Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE41A35F8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:33:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYF0-00054o-VT; Thu, 09 Apr 2020 14:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9neF=5Z=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jMYEz-00054b-NA
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:33:13 +0000
X-Inumbo-ID: 06cd4584-7a6f-11ea-b58d-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06cd4584-7a6f-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 14:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B0F682FEF;
 Thu,  9 Apr 2020 16:33:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMM8uDMPC8o7; Thu,  9 Apr 2020 16:33:04 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 473002FBC;
 Thu,  9 Apr 2020 16:33:04 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jMYEo-001zWn-L7; Thu, 09 Apr 2020 16:33:02 +0200
Date: Thu, 9 Apr 2020 16:33:02 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] mini-os: fix double free() in netfront
Message-ID: <20200409143302.4kcbb3rf7rfxqkhq@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200409141240.28876-1-jgross@suse.com>
 <20200409141240.28876-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141240.28876-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le jeu. 09 avril 2020 16:12:38 +0200, a ecrit:
> Commit d225f4012d69a19 ("Save/Restore Support: Add suspend/restore
> support for netfront") introduced a regression in form of freeing a
> netfront device structure twice.
> 
> Fix that.
> 
> Coverity-ID: 1433637
> Fixes: d225f4012d69a19 ("Save/Restore Support: Add suspend/restore support for netfront")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  netfront.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/netfront.c b/netfront.c
> index 50b3a57..fe7bb62 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -584,8 +584,6 @@ void shutdown_netfront(struct netfront_dev *dev)
>      list->refcount--;
>      if (list->refcount == 0) {
>          _shutdown_netfront(dev);
> -        free(dev->nodename);
> -        free(dev);
>  
>          to_del = list;
>          if (to_del == dev_list) {
> -- 
> 2.16.4
> 

