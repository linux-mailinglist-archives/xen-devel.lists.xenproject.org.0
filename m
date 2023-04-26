Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFF6EF347
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 13:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526646.818547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prdCN-00062l-Ub; Wed, 26 Apr 2023 11:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526646.818547; Wed, 26 Apr 2023 11:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prdCN-00060Z-Ru; Wed, 26 Apr 2023 11:20:35 +0000
Received: by outflank-mailman (input) for mailman id 526646;
 Wed, 26 Apr 2023 11:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=laZO=AR=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1prdCN-0005ik-2E
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 11:20:35 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bdf2ffb-e424-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 13:20:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id CCF36200FD;
 Wed, 26 Apr 2023 13:20:32 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TgDEiTvki3H; Wed, 26 Apr 2023 13:20:32 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A6D7D200EE;
 Wed, 26 Apr 2023 13:20:32 +0200 (CEST)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1prdCK-00Gt1M-1B;
 Wed, 26 Apr 2023 13:20:32 +0200
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
X-Inumbo-ID: 5bdf2ffb-e424-11ed-8611-37d641c3527e
Date: Wed, 26 Apr 2023 13:20:32 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] stubdom: fix errors in newlib:makedoc
Message-ID: <20230426112032.snnxwxd4vjrcom6w@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230426105239.2496-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426105239.2496-1-olaf@aepfle.de>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Olaf Hering, le mer. 26 avril 2023 10:52:39 +0000, a ecrit:
> rpm post-build-checks found a few code bugs in newlib, and marks them as
> errors. Add another newlib patch and apply it during stubdom build.
> 
> [  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c: In function 'lookup_word':
> [  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147:10: warning: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
> [  227s]       if (strcmp(ptr->word, word) == 0) return ptr;
> [  227s]           ^
> 
> [  460s] I: Program is using implicit definitions of special functions.
> [  460s]    these functions need to use their correct prototypes to allow
> [  460s]    the lightweight buffer overflow checking to work.
> [  460s]      - Implicit memory/string functions need #include <string.h>.
> [  460s]      - Implicit *printf functions need #include <stdio.h>.
> [  460s]      - Implicit *printf functions need #include <stdio.h>.
> [  460s]      - Implicit *read* functions need #include <unistd.h>.
> [  460s]      - Implicit *recv* functions need #include <sys/socket.h>.
> [  460s] E: xen implicit-fortify-decl ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> 
> Depends on newlib-cygmon-gmon.patch
> 
>  stubdom/Makefile             |  1 +
>  stubdom/newlib-makedoc.patch | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 stubdom/newlib-makedoc.patch
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index cddbbe2da0..a21e1c3fa3 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -96,6 +96,7 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
>  	patch -d $@ -p1 < newlib-stdint-size_max-fix-from-1.17.0.patch
>  	patch -d $@ -p1 < newlib-disable-texinfo.patch
>  	patch -d $@ -p1 < newlib-cygmon-gmon.patch
> +	patch -d $@ -p1 < newlib-makedoc.patch
>  	find $@ -type f | xargs perl -i.bak \
>  		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
>  	touch $@
> diff --git a/stubdom/newlib-makedoc.patch b/stubdom/newlib-makedoc.patch
> new file mode 100644
> index 0000000000..90678f1b63
> --- /dev/null
> +++ b/stubdom/newlib-makedoc.patch
> @@ -0,0 +1,35 @@
> +stubdom: fix errors in newlib
> +
> +rpm post-build-checks found a few code bugs in newlib, and marks them as
> +errors. Add another newlib patch and apply it during stubdom build.
> +
> +[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c: In function 'lookup_word':
> +[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147:10: warning: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
> +[  227s]       if (strcmp(ptr->word, word) == 0) return ptr;
> +[  227s]           ^
> +
> +[  460s] I: Program is using implicit definitions of special functions.
> +[  460s]    these functions need to use their correct prototypes to allow
> +[  460s]    the lightweight buffer overflow checking to work.
> +[  460s]      - Implicit memory/string functions need #include <string.h>.
> +[  460s]      - Implicit *printf functions need #include <stdio.h>.
> +[  460s]      - Implicit *printf functions need #include <stdio.h>.
> +[  460s]      - Implicit *read* functions need #include <unistd.h>.
> +[  460s]      - Implicit *recv* functions need #include <sys/socket.h>.
> +[  460s] E: xen implicit-fortify-decl ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147
> +---
> + newlib/doc/makedoc.c |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: newlib-1.16.0/newlib/doc/makedoc.c
> +===================================================================
> +--- newlib-1.16.0.orig/newlib/doc/makedoc.c
> ++++ newlib-1.16.0/newlib/doc/makedoc.c
> +@@ -38,6 +38,7 @@ There is  no
> + #include "ansidecl.h"
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <string.h>
> + #include <ctype.h>
> + 
> + #define DEF_SIZE 5000
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

