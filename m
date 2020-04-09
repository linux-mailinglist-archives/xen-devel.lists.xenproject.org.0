Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296461A3601
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYG5-0005Ct-BH; Thu, 09 Apr 2020 14:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9neF=5Z=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jMYG4-0005Ck-6w
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:34:20 +0000
X-Inumbo-ID: 2f11eb44-7a6f-11ea-82d8-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f11eb44-7a6f-11ea-82d8-12813bfff9fa;
 Thu, 09 Apr 2020 14:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 90E5A2FEF;
 Thu,  9 Apr 2020 16:34:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPzKiQ9A8oKS; Thu,  9 Apr 2020 16:34:12 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3875C2FBC;
 Thu,  9 Apr 2020 16:34:12 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jMYFv-001zXk-Bz; Thu, 09 Apr 2020 16:34:11 +0200
Date: Thu, 9 Apr 2020 16:34:11 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] mini-os: fix double free() in xenbus
Message-ID: <20200409143411.xa6ar7do64y7mpzf@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200409141240.28876-1-jgross@suse.com>
 <20200409141240.28876-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141240.28876-3-jgross@suse.com>
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

Juergen Gross, le jeu. 09 avril 2020 16:12:39 +0200, a ecrit:
> Commit 973ad0c4de1b48 ("Save/Restore Support: Add suspend/restore
> support for xenbus") introduced a double free of some memory and leaked
> another memory allocation.
> 
> Fix those.
> 
> Coverity-ID: 1433640
> Fixes: 973ad0c4de1b48 ("Save/Restore Support: Add suspend/restore support for xenbus")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  xenbus/xenbus.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index d72dc3a..b12cef7 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -413,9 +413,11 @@ void resume_xenbus(int canceled)
>  
>              rep = xenbus_msg_reply(XS_WATCH, XBT_NIL, req, ARRAY_SIZE(req));
>              msg = errmsg(rep);
> -            if (msg)
> +            if (msg) {
>                  xprintk("error on XS_WATCH: %s\n", msg);
> -            free(rep);
> +                free(msg);
> +            } else
> +                free(rep);
>          }
>      }
>  
> -- 
> 2.16.4
> 

