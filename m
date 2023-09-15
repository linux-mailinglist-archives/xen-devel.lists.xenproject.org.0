Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5347A17D5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602948.939795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3dR-0007bK-Iv; Fri, 15 Sep 2023 07:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602948.939795; Fri, 15 Sep 2023 07:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3dR-0007Ze-Fr; Fri, 15 Sep 2023 07:53:05 +0000
Received: by outflank-mailman (input) for mailman id 602948;
 Fri, 15 Sep 2023 07:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cTZx=E7=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qh3dP-0007ZW-F9
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:53:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49eafd3-539c-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:53:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-pcOupwDDMkugD5Y9jR6PPg-1; Fri, 15 Sep 2023 03:52:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 670C7101A58B;
 Fri, 15 Sep 2023 07:52:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA87E2026D4B;
 Fri, 15 Sep 2023 07:52:51 +0000 (UTC)
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
X-Inumbo-ID: e49eafd3-539c-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694764380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kcVDXYMT8LMkjLVvlYxNFSFHVpcbcXjDofWehTamLNU=;
	b=TjZhJhTyV/K91oa4SkAGBvzlehPYimBE6blukykM3KxLzxmALLLmQw83OuKwvdT3vTkf04
	Aj5cMld838FmafWlOqXR2S3moHLLlVqHt6t+p7umzHQwQNHUP2tioRybpSWG0DwFZyrEI8
	RLeB+M+zoJGrVuLbRGY4SRZwEPvtil0=
X-MC-Unique: pcOupwDDMkugD5Y9jR6PPg-1
Date: Fri, 15 Sep 2023 09:52:50 +0200
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
Subject: Re: [PATCH 4/7] block/dirty-bitmap: Clean up local variable shadowing
Message-ID: <ZQQNUjN4Laf+k1Nk@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-5-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block/monitor/bitmap-qmp-cmds.c | 2 +-
>  block/qcow2-bitmap.c            | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index 55f778f5af..4d018423d8 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -276,7 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>  
>      for (lst = bms; lst; lst = lst->next) {
>          switch (lst->value->type) {
> -            const char *name, *node;
> +            const char *name;
>          case QTYPE_QSTRING:
>              name = lst->value->u.local;
>              src = bdrv_find_dirty_bitmap(bs, name);

The names in this function are all over the place... A more ambitious
patch could rename the parameters to dst_node/dst_bitmap and these
variables to src_node/src_bitmap to get some more consistency (both with
each other and with the existing src/dst variables).

Preexisting, so I'm not insisting that you should do this.

> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index 037fa2d435..ffd5cd3b23 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -1555,7 +1555,6 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>      FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
>          const char *name = bdrv_dirty_bitmap_name(bitmap);
>          uint32_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
> -        Qcow2Bitmap *bm;
>  
>          if (!bdrv_dirty_bitmap_get_persistence(bitmap) ||
>              bdrv_dirty_bitmap_inconsistent(bitmap)) {
> @@ -1625,7 +1624,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>  
>      /* allocate clusters and store bitmaps */
>      QSIMPLEQ_FOREACH(bm, bm_list, entry) {
> -        BdrvDirtyBitmap *bitmap = bm->dirty_bitmap;
> +        bitmap = bm->dirty_bitmap;
>  
>          if (bitmap == NULL || bdrv_dirty_bitmap_readonly(bitmap)) {
>              continue;

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


