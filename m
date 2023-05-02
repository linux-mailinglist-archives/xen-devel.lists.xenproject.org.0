Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11C6F48E7
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 19:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528766.822317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pttUe-0003fY-GW; Tue, 02 May 2023 17:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528766.822317; Tue, 02 May 2023 17:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pttUe-0003d9-DV; Tue, 02 May 2023 17:08:48 +0000
Received: by outflank-mailman (input) for mailman id 528766;
 Tue, 02 May 2023 17:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g1cy=AX=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pttUc-0003d1-0w
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 17:08:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdcb4104-e90b-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 19:08:44 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso4763225a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 10:08:43 -0700 (PDT)
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
X-Inumbo-ID: fdcb4104-e90b-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683047323; x=1685639323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKq68nL7IZe8CxCPKWRpfsYPAqO/kJptEynBmrLXGno=;
        b=wJTz2Lb9P2BIcudGgZCX+y+30ZlzVkLjiFwcmaHxkHtJYW7P5L/qYfTAiZ+i4zqgtg
         0IlRSg4MA1HAqV+D0ba8Ih+KRJ5IYo8McCdQYaAKLoHJ0c0yM/3QuOL+N3HOsRbmwYwx
         YUU/sXI+6PaC+TgDxUDSllY3ZQNDycR8MxfDHtYukm8AT+M2ON6OQQ1vFKjobX/XROMj
         LU2FAObSj+uKhG8pYCmYJCX5Fj6GEMmI/En30Rt2dV3vL3qtYvuJaDb3J756VQ5g+rlh
         iU74ECh20gV+Mkf64cBgq/6oJ7b7yB7X2hG+wTL4we+cWq1KMC3EYdj26hWTxXZn5xCh
         tYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683047323; x=1685639323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKq68nL7IZe8CxCPKWRpfsYPAqO/kJptEynBmrLXGno=;
        b=kTXo9YvaEjv/tNM4SKzB04PLYUfW62Y7NM1/NxGETOETLstZZS9L2W8qGK/sead7b1
         4q18R2sXjCHZKnj/zKyh78XYavQDQTOV9OecSHrUHuUcFxha+0/pbO55mT98TMgb+3J8
         AYmkIHWh8dmGgGturP1pwifhktUVwO7DArnhvhK3GHjMZMdez+mBtIJ7SyfjEDPeKxjP
         t9x4+z6k54zSNgZ49KWoPPMDCdLukJJKcyhaAc9ld+ZRkVj76GelxtavCjtUDVtAyZhl
         4F+KEBGxlzdcbLyUqeZq5nMuEUh4Boc50NLlfJpu+0tqGNgyP7Xy2obpga9xP3CHXXJ/
         6duw==
X-Gm-Message-State: AC+VfDxhYYJ0HvJlHc6wMGUTQEatVZSluh9rdj3T/azEkveaR3Zm4ePg
	2Y8YA4E5jheGsjneQlOvyOHlcq5fLKju6r5Ny7xOVQ==
X-Google-Smtp-Source: ACHHUZ5ryAaiEYM7YxlTJAHU6zLdkibBxJTqdgb+u5+jyCzwLxskxERr5n7iMCM3uXDn/QRibKS6VOtt1URTw1XYbYQ=
X-Received: by 2002:a05:6402:44a:b0:504:b511:1a39 with SMTP id
 p10-20020a056402044a00b00504b5111a39mr8695641edw.12.1683047322896; Tue, 02
 May 2023 10:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-6-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-6-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 18:08:32 +0100
Message-ID: <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com>
Subject: Re: [PULL 05/27] hw/xen: Watches on XenStore transactions
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Firing watches on the nodes that still exist is relatively easy; just
> walk the tree and look at the nodes with refcount of one.
>
> Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
> and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
> be shared, as they will always be unique to the transaction in which
> they were created.
>
> When xs_node_walk would need to *create* a node as scaffolding and it
> encounters a deleted_in_tx node, it can resurrect it simply by clearing
> its deleted_in_tx flag. If that node originally had any *data*, they're
> gone, and the modified_in_tx flag will have been set when it was first
> deleted.
>
> We then attempt to send appropriate watches when the transaction is
> committed, properly delete the deleted_in_tx nodes, and remove the
> modified_in_tx flag from the others.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi; Coverity's "is there missing error handling?"
heuristic fired for a change in this code (CID 1508359):

>  static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
>  {
> +    struct walk_op op;
> +    XsNode **n;
> +
>      if (s->root_tx != tx->base_tx) {
>          return EAGAIN;
>      }
> @@ -720,10 +861,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
>      s->root_tx = tx->tx_id;
>      s->nr_nodes = tx->nr_nodes;
>
> +    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);

This is the only call to init_walk_op() which ignores its
return value. Intentional, or missing error handling?

> +    op.deleted_in_tx = false;
> +    op.mutating = true;
> +
>      /*
> -     * XX: Walk the new root and fire watches on any node which has a
> +     * Walk the new root and fire watches on any node which has a
>       * refcount of one (which is therefore unique to this transaction).
>       */
> +    if (s->root->children) {
> +        g_hash_table_foreach_remove(s->root->children, tx_commit_walk, &op);
> +    }
> +
>      return 0;
>  }

thanks
-- PMM

