Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0656720824
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 19:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543220.848006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q58Ey-0005Uc-N9; Fri, 02 Jun 2023 17:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543220.848006; Fri, 02 Jun 2023 17:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q58Ey-0005S2-Jx; Fri, 02 Jun 2023 17:07:04 +0000
Received: by outflank-mailman (input) for mailman id 543220;
 Fri, 02 Jun 2023 17:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6jk=BW=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1q58Ex-0005Rw-C2
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 17:07:03 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d65fca-0167-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 19:07:01 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f50a8f6dd7so3126572e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 10:07:01 -0700 (PDT)
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
X-Inumbo-ID: e3d65fca-0167-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685725621; x=1688317621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4AuYC+9A4+DdvMpLL4Ew5WTvGtxq7B6UBdOmtQcx3k=;
        b=L45w3dZ0AR2L43d8JEp9VloyyZkbnU8jw31mVGfkYiKyVv/77dsGR9DPSN0XyHwVO7
         iVR1gNzoSDGFazMJqdPzmxQWLYtepO2gT9adjyZsoBbGROLjXtrEqK0coePS1sRXa3c8
         /gQwCklLz1tYBLr3bjau17HYgV7MMmGujDaKh5I4N1sIE+6S9EWjoP5Dh0iq/juLkAXV
         aT5/06grlCDaO429ZUDiZmXojB9nHT50edQLqZabC3Xm3sZ0MUTmYwjlarDVAjmKacHL
         lDnAMUgO9Y5xpb5j8pYlpHv/IzgzDfR0UNTI6BuOCG5xe0y+hJBV9uUBpFbBCiKlVK8t
         MsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685725621; x=1688317621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4AuYC+9A4+DdvMpLL4Ew5WTvGtxq7B6UBdOmtQcx3k=;
        b=l18MaJ4fTsuwlqNwZUSAeN2oMMiK4npNFnhaYI/mZ0Kcl4duweH8lgu+7J82on+1IX
         Af8tfSaxCbORspiAmXUZlWH8MzuyGKSI+P0jPTNbRz0ErXtvddnVRt6Fr8int7SF/NzC
         VjmEAAC/y5CIrfTTt9phak9FgsS4GczHaEzdUMw3av+FGf+XODpQKjOeAY9IwsTKXLgl
         OQwH2Sm6B9t9Xpa5Z06eDXksHAYFZPXy4i2xVmgdMsVwOuwlzZLq4atunEErceLD5PxE
         ObxlZ0F71QAMoTSmUW0pztZBFu5YzQKtEM0Pq5hNCc0xAQNuf1huWqAKSkdxTDiHA/Hb
         65Og==
X-Gm-Message-State: AC+VfDx/ILvrmQlXOOh2awltcL8IXcQnu+emNJYH/Qdqn1AK4EPbOHcB
	OBM8bjlLiMy2fDkBghhoZk/07ADKo7hByhoxrWL9gw==
X-Google-Smtp-Source: ACHHUZ4aIxsMQSnb9a5maeoJXaEDyMmQ5XBYanrc+ozFpOU6ol1FJTDEv437CM7kHlsVKw/ACkgq9O/IZfRhDVmUkxE=
X-Received: by 2002:a05:6512:376f:b0:4f4:e1f8:98e with SMTP id
 z15-20020a056512376f00b004f4e1f8098emr1826158lft.23.1685725620619; Fri, 02
 Jun 2023 10:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-6-dwmw2@infradead.org>
 <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com>
In-Reply-To: <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2023 18:06:49 +0100
Message-ID: <CAFEAcA9aFv5c4S=Pyf3dMU-v9FnNJqWTQ7ZbiDQLTjh8Qou71g@mail.gmail.com>
Subject: Re: [PULL 05/27] hw/xen: Watches on XenStore transactions
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 May 2023 at 18:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > Firing watches on the nodes that still exist is relatively easy; just
> > walk the tree and look at the nodes with refcount of one.
> >
> > Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
> > and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
> > be shared, as they will always be unique to the transaction in which
> > they were created.
> >
> > When xs_node_walk would need to *create* a node as scaffolding and it
> > encounters a deleted_in_tx node, it can resurrect it simply by clearing
> > its deleted_in_tx flag. If that node originally had any *data*, they're
> > gone, and the modified_in_tx flag will have been set when it was first
> > deleted.
> >
> > We then attempt to send appropriate watches when the transaction is
> > committed, properly delete the deleted_in_tx nodes, and remove the
> > modified_in_tx flag from the others.
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > Reviewed-by: Paul Durrant <paul@xen.org>
>
> Hi; Coverity's "is there missing error handling?"
> heuristic fired for a change in this code (CID 1508359):
>
> >  static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
> >  {
> > +    struct walk_op op;
> > +    XsNode **n;
> > +
> >      if (s->root_tx != tx->base_tx) {
> >          return EAGAIN;
> >      }
> > @@ -720,10 +861,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
> >      s->root_tx = tx->tx_id;
> >      s->nr_nodes = tx->nr_nodes;
> >
> > +    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);
>
> This is the only call to init_walk_op() which ignores its
> return value. Intentional, or missing error handling?

Hi -- I was going through the unclassified Coverity issues
again today, and this one's still on the list. Is this a
bug, or intentional?

thanks
-- PMM

