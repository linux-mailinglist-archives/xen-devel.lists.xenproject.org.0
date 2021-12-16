Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE24774D9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248011.427734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrwg-0008OD-RA; Thu, 16 Dec 2021 14:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248011.427734; Thu, 16 Dec 2021 14:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrwg-0008Ll-NM; Thu, 16 Dec 2021 14:41:22 +0000
Received: by outflank-mailman (input) for mailman id 248011;
 Thu, 16 Dec 2021 14:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2y9W=RB=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxrwe-0008Lf-IS
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:41:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d45292-5e7e-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 15:41:17 +0100 (CET)
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
X-Inumbo-ID: 38d45292-5e7e-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639665677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0JiiNvjhTe5vdgk3BPz4HCdNzr/rQSjc6pWc7sHjoOI=;
  b=XqSRdS1n6equFSuOAUcG2Qj6XioWLrdijZ2cqVJMFVJqBhSV9Jf3eQKh
   qcqguGPBjidbKFfcMiPhBmQdq2Q1+Imfz0NpUB+C/a+jFooLyQw0Gl4VY
   wi1ug3onIYH7O6XW+yfmTIjq4MolKX1hIeuoPJB4M8+Ac7YJ/qsPm8ElY
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: g2rJlTRZQtGInIc4zQlKQxyOZ0N/EyjD7aX6YFB2W1+k6/GTUDP+nvw+MgVvAnBkXrS7MZ0t2K
 qd3AoxMTeKkhUAGoXtvcwlOxs4VYH2XnbaVhx/Kp1t+UvZCK4K7XxEMAYKr6R+ENH1mknTe6X/
 AhB+/ITQGeSx7lpNh2d6TgBY38MJo3O2fK/6WM36wquiAPTHYV+xS22WJZUU1K6eYZ86DtoLyE
 8liZDh6NVnixLMzY6D0mb7Mbb5u4BkIq+2ZbwaaiTX/aSgeAH6Sv344MGRP/0NaoYhgS5Xr9xo
 jnN4s+Qyb5S3/xKHlCwOIhTm
X-SBRS: 5.1
X-MesageID: 60196343
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zQInk6oUv9hbMGa5TIdlDBpHTY5eBmK7YhIvgKrLsJaIsI4StFCzt
 garIBmDPq2Kamfxf4p+Odu1oB8AvZTXm95nSwo/+C5kRCxHopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24HnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbm2dVgNAfPqofUyCRVTQzp7HvFJpaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZJAOGQ0ME+ojxtnNUg8CJ4kv/qTunj5LRZzlVSTiIYP2j2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVq/3LqJqTK5OQAOMHQPIyQDSGMt/N3LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT2Fb73BaT+L7wXyFv6g6HRWeGsgwke9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yf7Jdg43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8MoomjntZLlbvEMRSiai4hTqFfK8Ey/5XB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTFNSPEEuhVbQHWNYjVCZ9oRi2Pq
 b6z0OPQlH1ivBDWOHGLoeb/03hURZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi0zOdvHAMckxVpmbHNEALpd8yV6CWpZxPxELMVfkHhO3LEL8MOYu
 NFZIZjdWaoWFWyck9nfBLGkxLFfmN2QrVrmF0KYjPIXI/aMniTFpY3peBXB7i4LAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIU6eTbsivIXIt0XLUmRzDWty
 AvLUwwTovPAotFp/YCR17yEtYqgD8B3AlFeQzvA9b+zOCSDpjijzIZMXfymZzfYUG+oqqyua
 f8Ml6P3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UutteyDU09NOu6tBwq5ilTG3A
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY4on
 bUhtcoR51DtgxYmKI/b3CVd9mDKJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2/GnrfGipRd2lHGIig6GnX61OZAgYgD5UJRx1gYKlXVwtfIi5fbBvGKHejbmuiN8ih67g==
IronPort-HdrOrdr: A9a23:ACV2P62RzX690pdSEQQGNQqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60196343"
Date: Thu, 16 Dec 2021 14:41:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/build: Fix `make cscope` rune
Message-ID: <YbtQARdhTgju72lF@perard>
References: <20211216092014.707-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211216092014.707-1-andrew.cooper3@citrix.com>

On Thu, Dec 16, 2021 at 09:20:14AM +0000, Andrew Cooper wrote:
> There are two problems, both in the all_sources definition.
> 
> First, everything in arch/*/include gets double hits with cscope queries,
> because they end up getting listed twice in cscope.files.
> 
> Drop the first `find` rune of the three, because it's redundant with the third
> rune following c/s 725381a5eab3 ("xen: move include/asm-* to
> arch/*/include/asm").
> 
> Second, and this way for a long time:
> 
>   $ make cscope
>   ( find arch/x86/include -name '*.h' -print; find include -name '*.h' -print;
>   find xsm arch/x86 common drivers lib test -name '*.[chS]' -print ) >
>   cscope.files
>   cscope -k -b -q
>   cscope: cannot find file arch/x86/efi/efi.h
>   cscope: cannot find file arch/x86/efi/ebmalloc.c
>   cscope: cannot find file arch/x86/efi/compat.c
>   cscope: cannot find file arch/x86/efi/pe.c
>   cscope: cannot find file arch/x86/efi/boot.c
>   cscope: cannot find file arch/x86/efi/runtime.c

It's kind of weird that cscope can't read symlinks, but I guess that the
way it is.

> This is caused by these being symlinks to common/efi.  Restrict all find runes
> to `-type f` to skip symlinks, because common/efi/*.c are already listed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

> Anthony: I looked through the remainder of your build series and I cant spot
> any edits to all_sources.  Apologies if I missed it.

I don't think I've made further edit of this.

Thanks,

-- 
Anthony PERARD

