Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543672E7DD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548252.856108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Ze-0007bX-Hm; Tue, 13 Jun 2023 16:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548252.856108; Tue, 13 Jun 2023 16:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96Ze-0007Zm-F1; Tue, 13 Jun 2023 16:08:50 +0000
Received: by outflank-mailman (input) for mailman id 548252;
 Tue, 13 Jun 2023 16:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q96Zd-0007Yb-LR
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:08:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93c2275a-0a04-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 18:08:48 +0200 (CEST)
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
X-Inumbo-ID: 93c2275a-0a04-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686672528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksT2r79A8P0AHjgc2GQuz+tDQS38qLoztQeSnxBjJGg=;
  b=evc5Bm+crdFQugEj4Bo1U0QunnftuIpT1a6oRCauWVXelv8gChbGBPs3
   6VGswGDKrJFbKjnjyQw1AFnJnvS5gVU5/jZrGn5WjWaoNG8L4dpI1S5DX
   L1XVxaKJQ7M+ZbRCpig9vPsNsZAWaXc0dtR5cAqbu/GPfDZVLKOyimzrJ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111381375
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zdwrCKwzeNMWjMFIR5x6t+cbxirEfRIJ4+MujC+fZmUNrF6WrkUDy
 WQdWGyEPqmIZ2CmL9t+aY619koBvMCGm4U3GwBqpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX502
 dJBBglXVE24ltLsm5K1d8Rwuv12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxx3I/
 zmZogwVBDkQO+GVlACu40mFpcHqmh/dVIcSEeano6sCbFq7mTVIVUx+uUGAifuzh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+8pCu/IyEPIUceZCUPSk0O5NyLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0Mt+IljouCp2qauCOc/MPpQDMY+jnuCzfNAhxCWGK1W2C5wQGFvagedtrBEQXpU
 GsswJbHsr1XZX2ZvGnUGbhWQun0jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOUS9jrYyjS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9vZ
 8rKLZn3XCpKUMyLKQZaoc9HidfHIQhknAvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 yntABUEmQSu2BUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:7RlB3qqeRYiCvUbuB79tQz8aV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3ArsyZnGhGUdNqrYFh4CS4r2MUmzJubUfx4i7+GhW?=
 =?us-ascii?q?CVF14eOfOaVGt1b9Yqp87?=
X-Talos-MUID: 9a23:bD11DAars/Tc4OBTvTDRjmxYH9ZTyoeALUcxt5kDu8zfKnkl
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="111381375"
Date: Tue, 13 Jun 2023 17:08:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 4/5] libxg: drop dead assignment to "rc" from
 xc_cpuid_apply_policy()
Message-ID: <54331232-e01f-404c-8859-c341c931fcf2@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <89c45e29-fa7e-93e9-a2d5-45991c302794@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89c45e29-fa7e-93e9-a2d5-45991c302794@suse.com>

On Mon, Jun 12, 2023 at 01:47:13PM +0200, Jan Beulich wrote:
> "rc" is written immediately below the outer if(). Fold the remaining two
> if()s.
> 
> Coverity ID: 1532320
> Fixes: 685e922d6f30 ("tools/libxc: Rework xc_cpuid_apply_policy() to use {get,set}_cpu_policy()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

