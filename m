Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7566BE77D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510996.789648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd7pl-0004xs-Kd; Fri, 17 Mar 2023 11:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510996.789648; Fri, 17 Mar 2023 11:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd7pl-0004um-Ha; Fri, 17 Mar 2023 11:01:17 +0000
Received: by outflank-mailman (input) for mailman id 510996;
 Fri, 17 Mar 2023 11:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1kR=7J=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pd7pk-0004uf-2L
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:01:16 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 086ea09e-c4b3-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 12:01:14 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id v16so4064778wrn.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Mar 2023 04:01:13 -0700 (PDT)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6d46000000b002c5598c14acsm1729019wri.6.2023.03.17.04.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 04:01:12 -0700 (PDT)
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
X-Inumbo-ID: 086ea09e-c4b3-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679050873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awadti91KpY69cDBJYmDQx7rIwXUB0x1J4WYf9nv0EY=;
        b=ItZwHI29Qb9rnRet7NQ5avCTe9fEtvRKLGQERSxGLhZxrwXtBMIddH2OsMUrQzUGpy
         CBd41vcNg04NkcsJIQWgDokXoEo0AK5Xzj2S+gs/l9gCUxfYb1S4w+/z54MiEN2Snxys
         YruYKQGfrkqrpNUgoRrJ0PrhwoDLGRyTz6d6Nrx3R8ZNXJRUI/2BO+vYE8b2MUoFqDyy
         DAnXQRd2vaR2wBdjFZTLcq/UvHLLcfGxlYvDmC0wZX3eegAvtGSNeJG1zGvF6esUbSEW
         EMWV1yKHoCV10kh8BrPmYluAYItayza6WpCO/gpm4Ok2D1mUohnu9x7G9duNIiz06vaL
         IqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679050873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awadti91KpY69cDBJYmDQx7rIwXUB0x1J4WYf9nv0EY=;
        b=8NuPFkuhefP9CUlUd2bT3unbuKnFXHERJNKn7Z9umJTzcZH6y3XIELxyUIsIDSq6Zr
         uMAUDUqXerU7gwb8fm6sPinyKUXy/h5GQoaMM4+b+eIwdA70t6LU/4/4XHgS/FtE2MnS
         3pZBmy5hJXE+5349LLre5EuPlJKWkc+RppGbyTZ+8qElCfTjAyglwZlY6JARaSjS/ucg
         P37pV4VD038SzqRpubB+giGn3wzHcvNOAGv2SPIPj7eaXb3TfKOMQnkPWgfjaKBjkwBF
         wKF0ahNIpcrQUDcT2+TXFHmidmoeKc+I0V9khhuQn534phsokd3q0QkNjX6ni+yYdgyi
         hKxw==
X-Gm-Message-State: AO0yUKUF+B7VcUf4s9TOxYVBm0X3MJ1D8fKHW5XM7rc2bkaoq5HIc1FQ
	TrWBpTcgO8Fe5Anaz+mk0yU=
X-Google-Smtp-Source: AK7set8/lbBiVVhtMK09rLI+6dR2dSJQZpZNVgxkkFOEr+1AsmhRkXUz/nMRfDESFjXYIIMe1VfYPw==
X-Received: by 2002:a5d:544e:0:b0:2ce:a66b:7aff with SMTP id w14-20020a5d544e000000b002cea66b7affmr7435826wrv.25.1679050873157;
        Fri, 17 Mar 2023 04:01:13 -0700 (PDT)
Date: Fri, 17 Mar 2023 12:01:10 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
Message-ID: <20230317110110.GA591920@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
 <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
 <70651f5d-12b9-c7b1-9b69-fc0177f4a1ba@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70651f5d-12b9-c7b1-9b69-fc0177f4a1ba@xen.org>

On Thu, Feb 23, 2023 at 08:31:29PM +0000, Julien Grall wrote:
> Hi,
> 
> On 23/02/2023 16:01, Andrew Cooper wrote:
> > On 07/10/2022 1:39 pm, Matias Ezequiel Vara Larsen wrote:
> > 
> > A couple of observations, all unrelated to the stats themselves.
> > 
> > Although overall, I'm not entirely certain that a tool like this is
> > going to be very helpful after initial development.  Something to
> > consider would be to alter libxenstat to use this new interface?
> > 
> > > diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> > > index 2b683819d4..837e4b50da 100644
> > > --- a/tools/misc/Makefile
> > > +++ b/tools/misc/Makefile
> > > @@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
> > > 
> > > # Everything which needs to be built
> > > TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
> > > +TARGETS_BUILD += xen-vcpus-stats
> > 
> > This patch is whitespace corrupted.  If at all possible, you need to see
> > about getting `git send-email` working to send patches with, as it deals
> > with most of the whitespace problems for you.
> > 
> > I'm afraid you can't simply copy the patch text into an email and send that.
> > 
> > > 
> > > # ... including build-only targets
> > > TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
> > > @@ -135,4 +136,9 @@ xencov: xencov.o
> > > xen-ucode: xen-ucode.o
> > >      $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
> > > 
> > > +xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> > > +
> > > +xen-vcpus-stats: xen-vcpus-stats.o
> > > +    $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl)
> > > $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> > > +
> > > -include $(DEPS_INCLUDE)
> > > diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
> > > new file mode 100644
> > > index 0000000000..29d0efb124
> > > --- /dev/null
> > > +++ b/tools/misc/xen-vcpus-stats.c
> > > @@ -0,0 +1,87 @@
> > > +#include <err.h>
> > > +#include <errno.h>
> > > +#include <error.h>
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <sys/mman.h>
> > > +#include <signal.h>
> > > +
> > > +#include <xenctrl.h>
> > > +#include <xenforeignmemory.h>
> > > +#include <xen/vcpu.h>
> > > +
> > > +#define rmb()   asm volatile("lfence":::"memory")
> > 
> > This is rmb(), but rmb() isn't what you want.
> > 
> > You want smp_rmb(), which is
> > 
> > #define smp_rmb() asm volatile ("" ::: "memory")
> 
> From the generic PoV, I find smp_rmb() a bit misleading because it is not
> clear in this context whether we are referring to the SMP-ness of the
> hypervisor or the tools domain.
> 
> If the latter, then technically it could be uniprocessor domain and one
> could argue that for Arm it could be downgraded to just a compiler barrier.
> 
> AFAICT, this would not be the case here because we are getting data from
> Xen. So we always need a "dmb ish".
> 
> So, I would suggest to name it virt_*() (to match Linux's naming).
> 
> Also, is this tool meant to be arch-agnostic? If so, then we need to
> introduce the proper barrier for the other arch.
> 
Thanks Julien for the comment. Is it `xen_rmb()` meant for that?

Matias

