Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D536BCE48
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510513.788295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclrs-0004xJ-8Z; Thu, 16 Mar 2023 11:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510513.788295; Thu, 16 Mar 2023 11:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclrs-0004v3-5j; Thu, 16 Mar 2023 11:34:00 +0000
Received: by outflank-mailman (input) for mailman id 510513;
 Thu, 16 Mar 2023 11:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umpT=7I=citrix.com=prvs=432886d25=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pclrq-0004uh-2B
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:33:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b62c5d4-c3ee-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:33:53 +0100 (CET)
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
X-Inumbo-ID: 6b62c5d4-c3ee-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678966431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X1URzkswAEZcD6haH8aEYglskAs5oo4hbJI/AJvXdng=;
  b=OQ+MI3ewiUjhaO6lBfbcPI8NG+/quxPb5YvkJZYtJH1FCFnfMNAoNujz
   e60EFwmXqf4rziYRmrwbc4u7Z8VyvFWzQ6p9A9OCx+qB385QvIXGld+tS
   2CsBekVlq/gieGtgiSKdG/VtqOnKlbllWyIKVr4CEwyCI24VqY6hRVErg
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101511278
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:57oUZa3nsdDBvnNN9/bD5ftxkn2cJEfYwER7XKvMYLTBsI5bpzYEz
 2MXDz3SbPiONjH2fNsnbIS0o0xQsJTQzIQxHlA6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnO6gV1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEF4W9
 K02ax03Yy+F38OG7rWCbsJDv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0Mwx/B/
 D2Wl4j/Kg8GL/iexxC4yy6HqPaMm3KjQqdRJZTto5aGh3XMnzdOWXX6T2CTpPCjj0ekVtF3K
 koK+zEvp6w/6EyqSNbmWxSy5nWDu3Y0UsJdCeQg5CmRy6Df5ECSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmM4D8LL+d9pyEiVF5A6TfDz14eucd3t/
 9yUhDkB37RCo40m7aiE+wjmsxyrn7ziYTdgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrVqzGLoC6T7wJs8w4ifIfCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoGLdMieJ2n3FjmD27qXXHI/OPgNKjiIO9E+9ZYDNikMhghE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchIFkgaj3C2ccm1nqBlLMdvSYHq2llpjVQREALpi8yJLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:QWMMmqCty7cw5tblHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101511278"
Date: Thu, 16 Mar 2023 11:33:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 2/7] tools/misc: Drop xencons
Message-ID: <f82630fc-0a45-48f3-aafb-6b96af287652@perard>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-3-andrew.cooper3@citrix.com>

On Tue, Mar 14, 2023 at 02:15:15PM +0000, Andrew Cooper wrote:
> This is a python script which has it's shebang modified by be python3, but
> was never converted to be python3 compatible.

Not quite, that's the original shebang ;-)

> The most recent reference I can find to this script (which isn't incidental
> adjustments in the makefile) is from the Xen book, fileish 561e30b80402 which
> says
> 
>   %% <snip>  Alternatively, if the
>   %% Xen machine is connected to a serial-port server then we supply a
>   %% dumb TCP terminal client, {\tt xencons}.
> 
> So this a not-invented-here version of telnet.  Delete it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

