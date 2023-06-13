Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEA72E7C4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548246.856089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Uh-0006bi-PJ; Tue, 13 Jun 2023 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548246.856089; Tue, 13 Jun 2023 16:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Uh-0006ZF-MM; Tue, 13 Jun 2023 16:03:43 +0000
Received: by outflank-mailman (input) for mailman id 548246;
 Tue, 13 Jun 2023 16:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q96Ug-0006Z9-0I
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:03:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db16ca15-0a03-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 18:03:39 +0200 (CEST)
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
X-Inumbo-ID: db16ca15-0a03-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686672219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AG3Pg/r8x0vNumvZ+Hbp62jgDlclbg1M0nthnOmbhPU=;
  b=Vc/HotXkT3TcuCQVupJ+u+vOyIxneW6YhyKcAVqP1xzaPWhdMDoh18ft
   pM5Z95peHAnWeU9pzUfvmu3tYNjiRNqNrt4it1vRk/GaPFDH0g0Zo5hcm
   xDuty2lhQsXBalyOyvPNL16ocD9KP/QojfnwNGfydHocujKznh5z+cbf3
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111380549
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JBh/eKwB6QU3YoI64eJ6t+cbxirEfRIJ4+MujC+fZmUNrF6WrkUHx
 2dMWWzXO6yJNGKje48lb4S+9EgE65KAzoA3HAttpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUd2r
 fw4cDEVUiHZwOmc/Yu6bMIzhf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxx3I/
 j+argwVBDkad+yCmBG110utxdXutGDcQJswN6K3o6sCbFq7mTVIVUx+uUGAifuzh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+8pCu/IyEPIUceZCUPSk0O5NyLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ01tZYL9/265Wz22XWnjKXwTygeuQbuCzfNAhxCWGK1W2C5wQGFvagedtrBEQXpU
 GsswJbHsr1XZX2ZvGnUGbhWQun0jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOUS9jrYyjS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9vZ
 8rKLZn3XCpKUMyLKQZaoc9HidfHIQhknAvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 yntABUEmQSu2BUq62yiMxheVV8mZr4nxVpTAMDmFQrAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:XWjRfquqNozkYgDjpGg0YQHl7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-Talos-CUID: 9a23:dKUT1WEAtqnncVnQqmJBzBYUOpgkakHsljDbCXKBCEBCF76sHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AmQ5h2g4dua+GzXqEzuGYdjxDxoxooJSzWWs9tKw?=
 =?us-ascii?q?H+POlHG9XIy6/ryu4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="111380549"
Date: Tue, 13 Jun 2023 17:03:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/5] libxg: drop dead assignment to "ptes" from
 xc_core_arch_map_p2m_list_rw()
Message-ID: <33566692-ee42-44af-a94a-5535fdf39930@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>

On Mon, Jun 12, 2023 at 01:46:40PM +0200, Jan Beulich wrote:
> The function returns immediately after the enclosing if().
> 
> Coverity ID: 1532314
> Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/tools/libs/guest/xg_core_x86.c
> +++ b/tools/libs/guest/xg_core_x86.c
> @@ -210,7 +210,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
>          }
>  
>          munmap(ptes, n_pages * PAGE_SIZE);
> -        ptes = NULL;
>          off = p2m_vaddr & ((mask >> shift) << shift);
>      }

Do we have to remove this assignment? What if someone adds code later
and reuse the content of the variable `ptes`? Or what if someone adds
codes after the loop, and handle an error with `goto out`, we would have
a double-munmap().

-- 
Anthony PERARD

