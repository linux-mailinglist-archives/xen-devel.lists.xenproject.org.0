Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8826EF348
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 13:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526645.818537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prdC9-0005l3-NZ; Wed, 26 Apr 2023 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526645.818537; Wed, 26 Apr 2023 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prdC9-0005iq-Jl; Wed, 26 Apr 2023 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 526645;
 Wed, 26 Apr 2023 11:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=laZO=AR=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1prdC8-0005ik-9t
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 11:20:20 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 523e149e-e424-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 13:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9AA4520149;
 Wed, 26 Apr 2023 13:20:16 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqWqQTyUaZDB; Wed, 26 Apr 2023 13:20:16 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 4DFA120146;
 Wed, 26 Apr 2023 13:20:16 +0200 (CEST)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1prdC3-00Gt1A-2S;
 Wed, 26 Apr 2023 13:20:15 +0200
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
X-Inumbo-ID: 523e149e-e424-11ed-8611-37d641c3527e
Date: Wed, 26 Apr 2023 13:20:15 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] stubdom: fix errors in newlib:cygmon-gmon.c
Message-ID: <20230426112015.afh6fhh7ubec2szx@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230426105156.2381-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426105156.2381-1-olaf@aepfle.de>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Olaf Hering, le mer. 26 avril 2023 10:51:56 +0000, a ecrit:
> rpm post-build-checks found a few code bugs in newlib, and marks them as
> errors. Add another newlib patch and apply it during stubdom build.
> 
> I: A function uses a 'return;' statement, but has actually a value
>    to return, like an integer ('return 42;') or similar.
> W: xen voidreturn ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:117, 125, 146, 157, 330
> 
> I: Program is using implicit definitions of special functions.
>    these functions need to use their correct prototypes to allow
>    the lightweight buffer overflow checking to work.
>      - Implicit memory/string functions need #include <string.h>.
>      - Implicit *printf functions need #include <stdio.h>.
>      - Implicit *printf functions need #include <stdio.h>.
>      - Implicit *read* functions need #include <unistd.h>.
>      - Implicit *recv* functions need #include <sys/socket.h>.
> E: xen implicit-fortify-decl ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:119
> 
> I: Program returns random data in a function
> E: xen no-return-in-nonvoid-function ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:362
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  stubdom/Makefile                 |  1 +
>  stubdom/newlib-cygmon-gmon.patch | 60 ++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 stubdom/newlib-cygmon-gmon.patch
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index b312f710cd..cddbbe2da0 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -95,6 +95,7 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
>  	patch -d $@ -p0 < newlib-chk.patch
>  	patch -d $@ -p1 < newlib-stdint-size_max-fix-from-1.17.0.patch
>  	patch -d $@ -p1 < newlib-disable-texinfo.patch
> +	patch -d $@ -p1 < newlib-cygmon-gmon.patch
>  	find $@ -type f | xargs perl -i.bak \
>  		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
>  	touch $@
> diff --git a/stubdom/newlib-cygmon-gmon.patch b/stubdom/newlib-cygmon-gmon.patch
> new file mode 100644
> index 0000000000..b2dfbfafe2
> --- /dev/null
> +++ b/stubdom/newlib-cygmon-gmon.patch
> @@ -0,0 +1,60 @@
> +
> +I: A function uses a 'return;' statement, but has actually a value
> +   to return, like an integer ('return 42;') or similar.
> +W: xen voidreturn ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:117, 125, 146, 157, 330
> +
> +I: Program is using implicit definitions of special functions.
> +   these functions need to use their correct prototypes to allow
> +   the lightweight buffer overflow checking to work.
> +     - Implicit memory/string functions need #include <string.h>.
> +     - Implicit *printf functions need #include <stdio.h>.
> +     - Implicit *printf functions need #include <stdio.h>.
> +     - Implicit *read* functions need #include <unistd.h>.
> +     - Implicit *recv* functions need #include <sys/socket.h>.
> +E: xen implicit-fortify-decl ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:119
> +
> +I: Program returns random data in a function
> +E: xen no-return-in-nonvoid-function ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:362
> +
> +---
> + libgloss/i386/cygmon-gmon.c |    6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +Index: newlib-1.16.0/libgloss/i386/cygmon-gmon.c
> +===================================================================
> +--- newlib-1.16.0.orig/libgloss/i386/cygmon-gmon.c
> ++++ newlib-1.16.0/libgloss/i386/cygmon-gmon.c
> +@@ -61,6 +61,8 @@
> + static char sccsid[] = "@(#)gmon.c	5.3 (Berkeley) 5/22/91";
> + #endif /* not lint */
> + 
> ++#include <string.h>
> ++#include <unistd.h>
> + #define DEBUG
> + #ifdef DEBUG
> + #include <stdio.h>
> +@@ -89,7 +91,7 @@ static int	s_scale;
> + 
> + extern int errno;
> + 
> +-int
> ++void
> + monstartup(lowpc, highpc)
> +      char	*lowpc;
> +      char	*highpc;
> +@@ -199,6 +201,7 @@ _mcleanup()
> + 
> + static char already_setup = 0;
> + 
> ++void
> + _mcount()
> + {
> +   register char			*selfpc;
> +@@ -341,6 +344,7 @@ overflow:
> +  *	profiling is what mcount checks to see if
> +  *	all the data structures are ready.
> +  */
> ++void
> + moncontrol(mode)
> +     int mode;
> + {
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

