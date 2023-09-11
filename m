Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051179A699
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599183.934476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfczE-0001wI-OJ; Mon, 11 Sep 2023 09:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599183.934476; Mon, 11 Sep 2023 09:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfczE-0001uC-Lg; Mon, 11 Sep 2023 09:13:40 +0000
Received: by outflank-mailman (input) for mailman id 599183;
 Mon, 11 Sep 2023 09:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfczD-0001u5-Ay
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:13:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b94e9d6-5083-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 11:13:34 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso44107655e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 02:13:34 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d51ce000000b0031980783d78sm9492336wrv.54.2023.09.11.02.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:13:33 -0700 (PDT)
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
X-Inumbo-ID: 7b94e9d6-5083-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694423613; x=1695028413; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PoWc5JY1ED1cULTq0BwZnvQfAeckkndjITPjyIYf8Kw=;
        b=BPrXXQF6jY1RHedEvL/vs8eWVriVoU3HzXLDlwaSDkup/Vl0mRED2xFV4Rex+OwjMP
         yvqYCPApPdNveXr8477nY4LfBc1zu1Sx1Nwn6Ru9KTH2oqeWmyFUM12H28a3KDXE2j8M
         k/uo8vB2+/hUd9l8M57Ml2KoztbpXR2xFsdn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694423613; x=1695028413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoWc5JY1ED1cULTq0BwZnvQfAeckkndjITPjyIYf8Kw=;
        b=sA9cfprpcyCDL3MyIMS/hLuqUXIZOh7AP4bzm0PkYaaAvoiJ3OTEx8xZdIelV10PC5
         AzmWpO1e7rH7Md+5lG51jaFmlZE3AVcuMWsRvNoHyXsQyGtTEAfMy7YJTi+jXsAng11c
         34riK+yZ/9ZfH4eXJB+vXkboOqHFqG51aQDkaa/Kae3NXxO3JDRoTNoBTcpnRWXUWEr0
         Q0KPbzkyE5rxMVH6AKSS4OeKsVLqEWX+OuuD/6lZ+yPbWmv+U7KpYPgvidLGEeq1NXfv
         mjRK3ksAU+CcIlpJXNl9YDEsALPzXHi9+3g1LMiBlUNpRAczVNduy06TxkxlpAW8rFoV
         SwsQ==
X-Gm-Message-State: AOJu0YxWcglI6UiKFTONVRL56H2Fsqku62N7iWwBk8ZZNx83B92bG7k7
	IqYPVlbI0Lp3r8GgBRuUef5lXQ==
X-Google-Smtp-Source: AGHT+IFj61/zFXuPYIfoHyV7goji+RtrCFFpxXGLaZrdiJZuh63ulV7On1/n4Y2Nt+kgC16dwYqCFQ==
X-Received: by 2002:a05:600c:2249:b0:3fb:f0ef:4669 with SMTP id a9-20020a05600c224900b003fbf0ef4669mr7639296wmm.17.1694423613502;
        Mon, 11 Sep 2023 02:13:33 -0700 (PDT)
Date: Mon, 11 Sep 2023 10:13:32 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Message-ID: <iuf46ej5funjfyfpspq4vhckealynw6e5slxsrummyowfh4hsp@6d6wj6qk4chl>
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
 <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>

On Mon, Sep 11, 2023 at 09:54:53AM +0200, Jan Beulich wrote:
> On 08.09.2023 18:20, Javi Merino wrote:
> > The current structure of choosing the correct file based on the
> > compiler version makes us make 33 line files just to define a
> > constant.  The changes after gcc 4.7 are minimal, just the number of
> > counters.
> > 
> > Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
> > remove a lot of the boilerplate and keep the logic of choosing the
> > GCOV_COUNTER in gcc_4_7.c.
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  xen/common/coverage/Makefile  |  6 +-----
> >  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
> >  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
> >  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
> >  xen/common/coverage/gcc_7.c   | 30 ------------------------------
> >  5 files changed, 10 insertions(+), 109 deletions(-)
> >  delete mode 100644 xen/common/coverage/gcc_4_9.c
> >  delete mode 100644 xen/common/coverage/gcc_5.c
> >  delete mode 100644 xen/common/coverage/gcc_7.c
> > 
> > diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
> > index 63f98c71d6..d729afc9c7 100644
> > --- a/xen/common/coverage/Makefile
> > +++ b/xen/common/coverage/Makefile
> > @@ -1,11 +1,7 @@
> >  obj-y += coverage.o
> >  ifneq ($(CONFIG_CC_IS_CLANG),y)
> >  obj-y += gcov_base.o gcov.o
> > -obj-y += $(call cc-ifversion,-lt,0407, \
> > -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
> > -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
> > -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
> > -		gcc_5.o, gcc_7.o))))
> > +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
> >  else
> >  obj-y += llvm.o
> >  endif
> > diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
> > index 25b4a8bcdc..ddbc9f4bb0 100644
> > --- a/xen/common/coverage/gcc_4_7.c
> > +++ b/xen/common/coverage/gcc_4_7.c
> > @@ -18,15 +18,16 @@
> >  
> >  #include "gcov.h"
> >  
> > -/*
> > - * GCOV_COUNTERS will be defined if this file is included by other
> > - * source files.
> > - */
> > -#ifndef GCOV_COUNTERS
> > -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
> > -#  error "Wrong version of GCC used to compile gcov"
> > -# endif
> > +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
> >  #define GCOV_COUNTERS 8
> > +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
> > +#define GCOV_COUNTERS 9
> > +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
> > +#define GCOV_COUNTERS 10
> > +#elif GCC_VERSION >= 70000
> > +#define GCOV_COUNTERS 9
> > +#else
> > +#error "Wrong version of GCC used to compile gcov"
> >  #endif
> 
> How about inverse order:
> 
> #if GCC_VERSION >= 70000
> #define GCOV_COUNTERS 9
> #elif GCC_VERSION >= 50000
> #define GCOV_COUNTERS 10
> #elif GCC_VERSION >= 40900
> #define GCOV_COUNTERS 9
> #elif GCC_VERSION >= 40700
> #define GCOV_COUNTERS 8
> #else
> #error "Wrong version of GCC used to compile gcov"
> #endif
> 
> Otherwise a nit and a question: Parentheses would want using consistently.

True, the parenthesis are unnecessary and inconsistent in the patch.

> And wouldn't it make sense to combine the two ranges resulting in 9 being
> chosen? (Imo in the alternative layout that's less desirable.)
> 
> Since the adjustment would be easy to make, I'd be fine doing so while
> committing, and then
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Happy for you to do the changes.  Or I can do it and fix the next
patch as well.

Cheers,
Javi

> As an unrelated remark: gcc_3_4.c is clearly outdated as well, simply by
> its name. Imo it would have wanted to be gcc_4_1.c the latest as of commit
> 03f22f0070f3 ("README: adjust gcc version requirement"), i.e. for over 10
> years.
> 
> Jan

