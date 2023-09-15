Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5277A1806
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 10:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602961.939805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3u8-0004kM-GQ; Fri, 15 Sep 2023 08:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602961.939805; Fri, 15 Sep 2023 08:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3u8-0004iC-Cp; Fri, 15 Sep 2023 08:10:20 +0000
Received: by outflank-mailman (input) for mailman id 602961;
 Fri, 15 Sep 2023 08:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cTZx=E7=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qh3u6-0004i4-Di
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 08:10:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9dc148-539f-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 10:10:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-AH_e6IbZMfefIIrXyISEjA-1; Fri, 15 Sep 2023 04:10:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89A2C85A5BD;
 Fri, 15 Sep 2023 08:10:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D770A40C6EA8;
 Fri, 15 Sep 2023 08:10:06 +0000 (UTC)
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
X-Inumbo-ID: 4c9dc148-539f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694765414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQOzGTH+QcJO4xCc8kvvszHjY7AgCE+/6nxQstlUISE=;
	b=fn9wwaVA9kzIeiODELTRdxns0y5Xj7KhXdRBTeCKPo6NKzYKrpYsQr/8ADUbkuo0U1h0Sl
	7goJJAIBQN0FFc3J1KYZ1wF42diAGjoSWOtX5vPCI2BWxRH1iLEpYN2HGhWVfgcvkxsBvZ
	S6hL4CwvaxWvB9477Ea+OWTd0fRzZ7A=
X-MC-Unique: AH_e6IbZMfefIIrXyISEjA-1
Date: Fri, 15 Sep 2023 10:10:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com,
	pl@kamp.de, sw@weilnetz.de, sstabellini@kernel.org,
	anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com,
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
	philmd@linaro.org, stefanha@redhat.com, fam@euphon.net,
	quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
	kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH 6/7] block: Clean up local variable shadowing
Message-ID: <ZQQRXR7LP2fVrcMU@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-7-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block.c              |  7 ++++---
>  block/rbd.c          |  2 +-
>  block/stream.c       |  1 -
>  block/vvfat.c        | 34 +++++++++++++++++-----------------
>  hw/block/xen-block.c |  6 +++---
>  5 files changed, 25 insertions(+), 25 deletions(-)

I wonder why you made vdi a separate patch, but not vvfat, even though
that has more changes. (Of course, my selfish motivation for asking this
is that I could have given a R-b for it and wouldn't have to look at it
again in a v2 :-))

> diff --git a/block.c b/block.c
> index a307c151a8..7f0003d8ac 100644
> --- a/block.c
> +++ b/block.c
> @@ -3001,7 +3001,8 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
>                                             BdrvChildRole child_role,
>                                             uint64_t perm, uint64_t shared_perm,
>                                             void *opaque,
> -                                           Transaction *tran, Error **errp)
> +                                           Transaction *transaction,
> +                                           Error **errp)
>  {
>      BdrvChild *new_child;
>      AioContext *parent_ctx, *new_child_ctx;
> @@ -3088,7 +3089,7 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
>          .old_parent_ctx = parent_ctx,
>          .old_child_ctx = child_ctx,
>      };
> -    tran_add(tran, &bdrv_attach_child_common_drv, s);
> +    tran_add(transaction, &bdrv_attach_child_common_drv, s);
>  
>      if (new_child_ctx != child_ctx) {
>          aio_context_release(new_child_ctx);

I think I would resolve this one the other way around. 'tran' is the
typical name for the parameter and it is the transaction that this
function should add things to.

The other one that shadows it is a local transaction that is completed
within the function. I think it's better if that one has a different
name.

As usual, being more specific than just 'tran' vs. 'transaction' would
be nice. Maybe 'aio_ctx_tran' for the nested one?

The rest looks okay.

Kevin


