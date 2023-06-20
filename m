Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD3736BCD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551746.861423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaKj-0005wn-W4; Tue, 20 Jun 2023 12:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551746.861423; Tue, 20 Jun 2023 12:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaKj-0005uO-Sb; Tue, 20 Jun 2023 12:19:41 +0000
Received: by outflank-mailman (input) for mailman id 551746;
 Tue, 20 Jun 2023 12:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJnq=CI=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qBaKj-0005uI-2e
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:19:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9324385-0f64-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:19:37 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a20c744ebso5464491a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 05:19:37 -0700 (PDT)
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
X-Inumbo-ID: b9324385-0f64-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687263577; x=1689855577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mA2xlTq8TaGIAGIEbsI/d42ixyZvwolv+wdO+4hgEi4=;
        b=k7GQTkPuKABvjkr0sWxfnZVd2S0csdXaROw4+OvpQlMcGzrwMkYFv5mUvb/XgVvHCa
         lHHVBgLkB0lCk+F3s/VrLQuGG8WppPpGozww4EOHutFOblWs77F8eoBA615TvvLFRRpj
         3RFvmhEVsNik4aQtToZuZy92GitcW0BfrwJTWJ0fEYUD3B6aNUOSRvVY4Rs3BYr8/SWx
         2jtoiv8mXM6F4r8k3pPHp4zLTVpQIHPDMF8sW/hVwEX/AwgGdaPD88DLXmuYyWZjC0EF
         Kr0ayGYEIxjIICa8yTIaJPRjRVgCLwH1HDcRH9ZL34MeupBynOZI7kwZuUVlepCnCnr8
         mwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687263577; x=1689855577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA2xlTq8TaGIAGIEbsI/d42ixyZvwolv+wdO+4hgEi4=;
        b=D8+D2L4D3eZatVqvGVq/1xp3mwiYGj8w+0V0Nkaaxq2q8nkN2+ZgYH4yZXzZoxSRpo
         ZuhhaYBji0r7FN7Eyjpj9dV4J4kyn3owy31emikXbHdJbUydJ1ObGwsznKFD5mVjX5V+
         GK0EuvdOrF1g4jv/yJEZbwT9Svm35PXuiR6WhZ0sLpe2dXmsWUqbCZmL2DOmorYPb/Bx
         2c/HTAvYJ0hEvUTw5ERlkhCc4KGd8uLi9yS99BKpaIEdp8R8VUbHrmpINajTjAO8sU5w
         a6zkqQ0aC84AX6e5ZflgYIoAYZSq8qD3rry4pRhhz8M07h3mgpDMKH1QpPRRKv6FX7sY
         dz+Q==
X-Gm-Message-State: AC+VfDwC9mxuMG0SQbUZ2aKm5Mi8Te2pjkkI3LGHw3Y2tw+9QkrjAEgt
	8PuXPZ5NIjX70eWwbo3IjXAQVrSgnAasa7LDNb8HFQ==
X-Google-Smtp-Source: ACHHUZ4nV1eIZlM4IizwJ8hN2qXgwlhPF7pJckO5uZBcMrr+2J72rYRqgJYnfngqAR7VwLmf6HuazoNOZ/FyM668Gf8=
X-Received: by 2002:aa7:c6d9:0:b0:51a:3850:e846 with SMTP id
 b25-20020aa7c6d9000000b0051a3850e846mr6981167eds.7.1687263576983; Tue, 20 Jun
 2023 05:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-6-dwmw2@infradead.org>
 <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com> <CAFEAcA9aFv5c4S=Pyf3dMU-v9FnNJqWTQ7ZbiDQLTjh8Qou71g@mail.gmail.com>
In-Reply-To: <CAFEAcA9aFv5c4S=Pyf3dMU-v9FnNJqWTQ7ZbiDQLTjh8Qou71g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2023 13:19:26 +0100
Message-ID: <CAFEAcA--FqeioUdPb9sr5fEy3q0H0swcp+rbGxoNbhgMkYdC+A@mail.gmail.com>
Subject: Re: [PULL 05/27] hw/xen: Watches on XenStore transactions
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Jun 2023 at 18:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 2 May 2023 at 18:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
> > >
> > > From: David Woodhouse <dwmw@amazon.co.uk>

> > Hi; Coverity's "is there missing error handling?"
> > heuristic fired for a change in this code (CID 1508359):
> >
> > >  static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
> > >  {
> > > +    struct walk_op op;
> > > +    XsNode **n;
> > > +
> > >      if (s->root_tx != tx->base_tx) {
> > >          return EAGAIN;
> > >      }
> > > @@ -720,10 +861,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
> > >      s->root_tx = tx->tx_id;
> > >      s->nr_nodes = tx->nr_nodes;
> > >
> > > +    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);
> >
> > This is the only call to init_walk_op() which ignores its
> > return value. Intentional, or missing error handling?
>
> Hi -- I was going through the unclassified Coverity issues
> again today, and this one's still on the list. Is this a
> bug, or intentional?

Ping^3 -- is this a false positive, or something to be fixed?
It would be nice to be able to classify the coverity issue
appropriately.

thanks
-- PMM

