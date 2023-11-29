Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF977FD8EF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 15:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643932.1004521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8LDU-0004rF-Ta; Wed, 29 Nov 2023 14:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643932.1004521; Wed, 29 Nov 2023 14:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8LDU-0004og-Ql; Wed, 29 Nov 2023 14:07:04 +0000
Received: by outflank-mailman (input) for mailman id 643932;
 Wed, 29 Nov 2023 14:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdkt=HK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8LDS-0004nE-Sf
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 14:07:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 914d12e5-8ec0-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 15:07:01 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3330d64958aso1341323f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 06:07:01 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b0032f7e832cabsm14607298wrw.90.2023.11.29.06.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:07:01 -0800 (PST)
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
X-Inumbo-ID: 914d12e5-8ec0-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701266821; x=1701871621; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=noEl7weL7Oykc9ytESQ2khJemrsK07KHP0823fUW8Ds=;
        b=IYL7FrPg1jd0nIGRvkZcq+2eEjhVJc7mAwM9KHpS1S7UgVbPQ2+AM9210choNAlZC8
         Hq8iagY5muiiydsi4lDA6ZbBxxkLNbiYk/7V3ZM84jCdtrX2uRrFE9utoW+wqUS9U0s4
         K6/4nTD4pFeN1DNajFXX0I95ogPv1l/9MN1Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701266821; x=1701871621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noEl7weL7Oykc9ytESQ2khJemrsK07KHP0823fUW8Ds=;
        b=FGkm93sRrPXogejEDewTchFXYtihXGZDWe6AnAWD2K6lEMm0fLPcJjhfnRxAL6/ILq
         F9wCoJuRMyNyW5YJF6XnKbu5cZbj+DCx8qo7NFLjXuJqpeqVPlID/jtlokU6tbnsuTg+
         PIcTOfYQTFj7TBzYyde0qmS/KThPdt34Ry9MtlU1augV8kcvaf6GE5kMAPE4zBQiBBVn
         E9T27tygpnKEF/Qn1+Y4i6EqnQ9eN3da00pwTME1jjJwpjOy+0HQlC8l+aahpm+y8+c9
         82uygP/GhbaqhkslalA+AvM0jqC+ha8slJt+AjZhmpnimf7/pDKc9xbJvstRqw0OGHOF
         6veQ==
X-Gm-Message-State: AOJu0Yy2eGQGL142QvSrYry7UOjVk6ujwZtDlVz9AM+I4A3yqvy7eabf
	B2/wlD93kei+6S+iVMOITjZ4Mg==
X-Google-Smtp-Source: AGHT+IEj/Nj3+xQFrT/DtbPuVq2iIu+fb6nSjFVEVgBpEhAtnpWzGtRn7FCrK4Dozj6i50ofaVTnUw==
X-Received: by 2002:a5d:4b07:0:b0:332:fe86:7f60 with SMTP id v7-20020a5d4b07000000b00332fe867f60mr7679919wrq.69.1701266821308;
        Wed, 29 Nov 2023 06:07:01 -0800 (PST)
Date: Wed, 29 Nov 2023 15:07:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] xen/livepatch: fix livepatch tests
Message-ID: <ZWdFhCa9Umew4sQR@macbook>
References: <20231128174131.38642-1-roger.pau@citrix.com>
 <CAG7k0EqEjbL2LFoB4gn+VNQu_QEDVR8oaCjwdPp++B=Q3jA7CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0EqEjbL2LFoB4gn+VNQu_QEDVR8oaCjwdPp++B=Q3jA7CA@mail.gmail.com>

On Wed, Nov 29, 2023 at 10:32:32AM +0000, Ross Lagerwall wrote:
> On Tue, Nov 28, 2023 at 5:41 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > The current set of in-tree livepatch tests in xen/test/livepatch started
> > failing after the constify of the payload funcs array, and the movement of the
> > status data into a separate array.
> >
> > Fix the tests so they respect the constness of the funcs array and also make
> > use of the new location of the per-func state data.
> >
> > Fixes: 82182ad7b46e ('livepatch: do not use .livepatch.funcs section to store internal state')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I will see about getting those tests build in gitlab, in the meantime we should
> > take this fix in order to unblock osstest.
> > ---
> >  xen/test/livepatch/xen_action_hooks.c         | 12 +++++-----
> >  xen/test/livepatch/xen_action_hooks_marker.c  | 20 ++++++++++-------
> >  xen/test/livepatch/xen_action_hooks_noapply.c | 22 +++++++++++--------
> >  xen/test/livepatch/xen_action_hooks_nofunc.c  |  6 ++---
> >  .../livepatch/xen_action_hooks_norevert.c     | 22 +++++++++++--------
> >  xen/test/livepatch/xen_prepost_hooks.c        |  8 +++----
> >  xen/test/livepatch/xen_prepost_hooks_fail.c   |  2 +-
> >  7 files changed, 53 insertions(+), 39 deletions(-)
> >
> snip
> > diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
> > index ef77e720713e..1c4873f55640 100644
> > --- a/xen/test/livepatch/xen_action_hooks_norevert.c
> > +++ b/xen/test/livepatch/xen_action_hooks_norevert.c
> > @@ -25,9 +25,10 @@ static int pre_apply_hook(livepatch_payload_t *payload)
> >
> >      for (i = 0; i < payload->nfuncs; i++)
> >      {
> > -        struct livepatch_func *func = &payload->funcs[i];
> > +        const struct livepatch_func *func = &payload->funcs[i];
> > +        struct livepatch_fstate *fstate = &payload->fstate[i];
> >
> > -        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
> > +        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
> >          printk(KERN_DEBUG "%s: pre applied: %s\n", __func__, func->name);
> >      }
> >
> > @@ -44,9 +45,10 @@ static void post_apply_hook(livepatch_payload_t *payload)
> >
> >      for (i = 0; i < payload->nfuncs; i++)
> >      {
> > -        struct livepatch_func *func = &payload->funcs[i];
> > +        const struct livepatch_func *func = &payload->funcs[i];
> > +        struct livepatch_fstate *fstate = &payload->fstate[i];
> >
> > -        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
> > +        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
> >          printk(KERN_DEBUG "%s: post applied: %s\n", __func__, func->name);
> >      }
> >
> > @@ -62,8 +64,9 @@ static int pre_revert_hook(livepatch_payload_t *payload)
> >      for (i = 0; i < payload->nfuncs; i++)
> >      {
> >          struct livepatch_func *func = &payload->funcs[i];
> 
> const here too?
> 
> With that fixed...
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Oh, so that file is not even built.  Will see about getting it built.

Thanks, Roger.

