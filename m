Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD996C657B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513753.795242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIQd-0008Tw-Mz; Thu, 23 Mar 2023 10:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513753.795242; Thu, 23 Mar 2023 10:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIQd-0008R1-K9; Thu, 23 Mar 2023 10:44:19 +0000
Received: by outflank-mailman (input) for mailman id 513753;
 Thu, 23 Mar 2023 10:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfIQc-0008QM-04
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:44:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d22a2c-c967-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 11:44:16 +0100 (CET)
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
X-Inumbo-ID: a7d22a2c-c967-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679568256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D5EwwHCClqjr0MtAW2O+aYPMcR/3ArxuNVhMvNJfGNg=;
  b=LDti6vOapcfDhYMS7Istknn7Y7EY1cQ9kJ/iV8P4hAW+Krlp0LA2pDWH
   MHwqsMgj6Nf6et0CvKmveZuYiBcgQIf5r6KhXwQWEZlohaU34bagoCvY+
   mB3Iif2vaDi6HVc5mCZfdiHvbIuwVDF2BjsrXGo+ztpc8zpl5IXvoL1+s
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 102415682
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:23+J/Kxy6M0Bo1zUGVt6t+cAxirEfRIJ4+MujC+fZmUNrF6WrkVRy
 2tJW2mDOffbajegeI13adywoRkPu5WBx9JhSgVlpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6sT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWJux
 +wGLGsMUhfZu87smoiLWtRg1st2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNxBrB+
 zyWpQwVBDkiCtjD9DyIyE6Hj/XmknO8RsUbKrGRo6sCbFq7mTVIVUx+uUGAifChh1S3Qd53N
 00e8S1opq83nGSpU938UhuQsHOC+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaESofIHIGZCQEZRAY+NSlq4Y25jrQSv5zHajzicf6cQwc2
 BjT8nJ43e9Ky5dWiePipwuvby+QSobhTS4H9hvTBWOZ6VlFSNT/Xby41FSL4qMVRGqGdWVtr
 EToiuDHsr9fVs/QxHXWKAkeNOr3vqjYaVUwlXYqRsB8rGr1phZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jfIUOPCdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoGLZAiOdynHpumji7qXXHI/OPj9KjiIO9E+9ZYDNikMhghE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuELz+FlBiXcqeg5UOLoare1M2cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3iCadFXbOis4N9sCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:APKPdaNISh4yVsBcT7r155DYdb4zR+YMi2TDGXoBLSC9E/bo4/
 xG+c5xuyMc5wxwZJheo6H+BEDtexLhHP1OkPss1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOduEZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Om+o8dfng2OXL8fq
 DslfauYlCbCAQqh7+Adx44dtmGncTPiJXlJTYeHnccmXGzpALt0qf+Dx+bmjwDUzZDqI1SjV
 TtokjC/6C+tPP+7RfZ2wbonvJrseqk8MJHGMuPzu4KLTn24zzYHbhJavm5pTUop+Pq0nYG+e
 O82CsIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCWlqEqmm9X9WDU5T/VMnphYdByx0TtcgO1B
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102415682"
Date: Thu, 23 Mar 2023 10:44:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v3 2/4] tools: add container_of() macro to
 xen-tools/common-macros.h
Message-ID: <41f0ab93-c919-4d0a-9592-ddff9a4459c2@perard>
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306072140.28402-3-jgross@suse.com>

On Mon, Mar 06, 2023 at 08:21:38AM +0100, Juergen Gross wrote:
> Instead of having 4 identical copies of the definition of a

3 now ;-), as tests/vhpet has been removed.

> container_of() macro in different tools header files, add that macro
> to xen-tools/common-macros.h and use that instead.
> 
> Delete the other copies of that macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> There is a similar macro CONTAINER_OF() defined in
> tools/include/xentoolcore_internal.h, which allows to not only use a
> type for the 2nd parameter, but a variable, too.
> I'd like to get rid of that macro as well, but there are lots of use
> cases especially in libxl. Any thoughts regarding that macro?
> I could either:
> - don't touch it at all
> - enhance container_of() like CONTAINER_OF() and replace all use cases
>   of CONTAINER_OF() with container_of()
> - replace the few CONTAINER_OF() users outside libxl with container_of()
>   and define CONTAINER_OF() in e.g. libxl_internal.h
> - replace all CONTAINER_OF() use cases with container_of(), including
>   the change from (.., var, ..) to (.., type, ...).

I would like to keep the functionality where we can use a type or a var,
as this is more convenient. Even Linux developer wants this extra
functionality as I've seen a couple of use of container_of() with
"typeof(*var)" in the 2nd parameter (in linux source code).

I don't know if having our macro "container_of()" been different than
the one from Linux or QEMU is going to be an issue, if that's not likely
to be an issue we could add the functionality, but if it's likely to be
an issue we could instead replace "container_of()" by "CONTAINER_OF()".

The issue that I could see with adding "*var" option to container_of()
is if someone copies code from Xen into other projects, and not realizing
that container_of() is different. While if we spell it "CONTAINER_OF()"
instead, it would be less of an issue as the macro would just be
missing. (But maybe the first case just mean the compiler will complain)


So I'm in favor of having only one macro, with the functionality of the
existing "CONTAINER_OF()" macro, and I guess spell it "CONTAINER_OF()"
instead of "container_of()". Unless you think the lower case spelling
isn't likely to be an issue.


> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/include/xen-tools/common-macros.h | 4 ++++
>  tools/tests/vhpet/emul.h                | 3 ---
>  tools/tests/vpci/emul.h                 | 6 +-----
>  tools/tests/x86_emulator/x86-emulate.h  | 5 -----
>  tools/xenstore/list.h                   | 6 ++----
>  5 files changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
> index a372b9ecf2..b046ab48bf 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -76,4 +76,8 @@
>  #define __must_check __attribute__((__warn_unused_result__))
>  #endif
>  
> +#define container_of(ptr, type, member) ({                \
> +    typeof( ((type *)0)->member ) *__mptr = (ptr);        \

I think identifier starting with two '_' are supposed to be reserved.
Would you be ok to have just one? (So "_mptr")

> +    (type *)( (char *)__mptr - offsetof(type,member) );})
> +
>  #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
> diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
> index f03e3a56d1..7169a2ea02 100644
> --- a/tools/tests/vpci/emul.h
> +++ b/tools/tests/vpci/emul.h
> @@ -27,11 +27,7 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  
> -#define container_of(ptr, type, member) ({                      \
> -        typeof(((type *)0)->member) *mptr = (ptr);              \
> -                                                                \
> -        (type *)((char *)mptr - offsetof(type, member));        \
> -})
> +#include <xen-tools/common-macros.h>

This doesn't build, so some change are needed in the Makefile.

I wondered why the gitlab ci was green while this failed to build on my
machine, and it turns out that the "default" target been used is often
"install", which does nothing for vpci. But I guess this should be fixed
by https://lore.kernel.org/r/20230313121226.86557-1-roger.pau@citrix.com


Cheers,

-- 
Anthony PERARD

