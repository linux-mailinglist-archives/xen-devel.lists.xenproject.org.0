Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285B7A5E7A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604522.941946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXIF-0004V2-UU; Tue, 19 Sep 2023 09:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604522.941946; Tue, 19 Sep 2023 09:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXIF-0004Sd-Rx; Tue, 19 Sep 2023 09:45:19 +0000
Received: by outflank-mailman (input) for mailman id 604522;
 Tue, 19 Sep 2023 09:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FZpu=FD=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qiXIE-0004SV-Sa
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:45:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c3b0874-56d1-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 11:45:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-1ckR902UOiaT0vEMdhORnA-1; Tue, 19 Sep 2023 05:45:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF7523C0C480;
 Tue, 19 Sep 2023 09:45:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47482140E950;
 Tue, 19 Sep 2023 09:45:06 +0000 (UTC)
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
X-Inumbo-ID: 3c3b0874-56d1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695116715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V1mP29WFUX97+g1j0GENZgYcEtjWxZ7dHu7PUEU0WXI=;
	b=MzDyViMLTSP0X2QNOMG7wVHScyyO8ZMa7qaDb2YSFRJsYTE4cR0Wp4PiUyj0QXFYzcJFzF
	2gpm2JirvWlfeRUVQSLVREnx8lAUUMlxrLZI+F+ZBdmgYDyrnBFk0JjVBQhlGSUllGSlSQ
	LMF5+vH7iVWMbEOptdK/wvMUVFj8nKc=
X-MC-Unique: 1ckR902UOiaT0vEMdhORnA-1
Date: Tue, 19 Sep 2023 11:45:05 +0200
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
Message-ID: <ZQltoZWlnIW/wDi3@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-5-armbru@redhat.com>
 <ZQQNUjN4Laf+k1Nk@redhat.com>
 <8734za4stm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734za4stm.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Am 19.09.2023 um 07:48 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
> >> Local variables shadowing other local variables or parameters make the
> >> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> >> Clean up: delete inner declarations when they are actually redundant,
> >> else rename variables.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  block/monitor/bitmap-qmp-cmds.c | 2 +-
> >>  block/qcow2-bitmap.c            | 3 +--
> >>  2 files changed, 2 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> >> index 55f778f5af..4d018423d8 100644
> >> --- a/block/monitor/bitmap-qmp-cmds.c
> >> +++ b/block/monitor/bitmap-qmp-cmds.c
> >> @@ -276,7 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
> >>  
> >>      for (lst = bms; lst; lst = lst->next) {
> >>          switch (lst->value->type) {
> >> -            const char *name, *node;
> >> +            const char *name;
> >>          case QTYPE_QSTRING:
> >>              name = lst->value->u.local;
> >>              src = bdrv_find_dirty_bitmap(bs, name);
> >
> > The names in this function are all over the place... A more ambitious
> > patch could rename the parameters to dst_node/dst_bitmap and these
> > variables to src_node/src_bitmap to get some more consistency (both with
> > each other and with the existing src/dst variables).
> 
> What exactly would you like me to consider?  Perhaps:
> 
> * Rename parameter @node to @dst_node
> 
> * Rename which parameter to @dst_bitmap?

Parameter @target to @dst_bitmap (it's the name of a bitmap in
@node/@dst_node)

> * Rename nested local @node to @src_node
> 
> * Rename which local variable to @src_bitmap?

@name to @src_bitmap (it's the name of a bitmap in the local
@node/@src_node)

> * Move nested locals to function scope

I don't really mind either way, but yes, maybe that would be more
conventional.

That you couldn't tell for two of the variables what they actually are
probably supports the argument that they should be renamed. :-)

Kevin


