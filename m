Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58E24521D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 23:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k73xb-0001QT-1Y; Sat, 15 Aug 2020 21:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VULP=BZ=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1k73xZ-0001Ps-Ra
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 21:43:29 +0000
X-Inumbo-ID: dd007171-d210-4b69-98ea-e0c516208e1c
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd007171-d210-4b69-98ea-e0c516208e1c;
 Sat, 15 Aug 2020 21:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 14AE511457;
 Sat, 15 Aug 2020 23:43:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0t9WTyfwBkGy; Sat, 15 Aug 2020 23:43:22 +0200 (CEST)
Received: from function.home
 (2a01cb008800c5009eb6d0fffe88c3c7.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8800:c500:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 41BFB2E70;
 Sat, 15 Aug 2020 23:43:22 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k73xR-001iMT-Gi; Sat, 15 Aug 2020 23:43:21 +0200
Date: Sat, 15 Aug 2020 23:43:21 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Subject: Re: [PATCH] mini-os: fix do_map_frames() for pvh
Message-ID: <20200815214321.qp46x46ucqlh6mp6@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200815111257.29302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200815111257.29302-1-jgross@suse.com>
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

Juergen Gross, le sam. 15 août 2020 13:12:57 +0200, a ecrit:
> In case ov PVH dom_map_frames() is missing to increment the virtual
> address. This leads to writing only the first page table entry multiple
> times.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index ea58444..8ba14a5 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -695,6 +695,7 @@ int do_map_frames(unsigned long va,
>          pgt[l1_table_offset(va)] = (pgentry_t)
>              (((mfns[done * stride] + done * incr) << PAGE_SHIFT) | prot);
>          done++;
> +        va += PAGE_SIZE;
>  #endif
>      }
>  
> -- 
> 2.26.2
> 

-- 
Samuel
j'etais en train de nettoyer ma souris et le coup est parti...
 -+- s sur #ens-mim - et en plus c vrai... -+-

