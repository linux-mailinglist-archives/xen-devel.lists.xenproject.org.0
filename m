Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122027A8399
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 15:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605727.943319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qixPc-0004uE-N6; Wed, 20 Sep 2023 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605727.943319; Wed, 20 Sep 2023 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qixPc-0004rh-Iq; Wed, 20 Sep 2023 13:38:40 +0000
Received: by outflank-mailman (input) for mailman id 605727;
 Wed, 20 Sep 2023 13:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qixPa-0004rb-K2
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 13:38:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff69d4de-57ba-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 15:38:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-6h0EOFiwNjSXxjptxJGmoA-1; Wed, 20 Sep 2023 09:38:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17D8A3C11C66;
 Wed, 20 Sep 2023 13:38:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4DA28FD;
 Wed, 20 Sep 2023 13:38:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3262C21E6900; Wed, 20 Sep 2023 15:38:27 +0200 (CEST)
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
X-Inumbo-ID: ff69d4de-57ba-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695217115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q/aHPKhvpgi6eZaXOTzZzxU74NwtDAlDI9nUfRDIWkQ=;
	b=dG7r8l5c3cV+qNodm97R0UDBCxBfaOVad+77qupRavJoiMVvsp+EJrY1RG57S4dnZeZPJ3
	R5Ku9D7ZxfOSRvvHCS3olvZOYTJnCPvEgM1A75neJnazRRjDSHrJ9z1GZ3/JFrH0eEtLtB
	xU5agp09fR0X8xh82cfSeYgcgqC04PM=
X-MC-Unique: 6h0EOFiwNjSXxjptxJGmoA-1
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,  hreitz@redhat.com,  eblake@redhat.com,
  vsementsov@yandex-team.ru,  jsnow@redhat.com,  idryomov@gmail.com,
  pl@kamp.de,  sw@weilnetz.de,  sstabellini@kernel.org,
  anthony.perard@citrix.com,  paul@xen.org,  pbonzini@redhat.com,
  marcandre.lureau@redhat.com,  berrange@redhat.com,  thuth@redhat.com,
  philmd@linaro.org,  stefanha@redhat.com,  fam@euphon.net,
  quintela@redhat.com,  peterx@redhat.com,  leobras@redhat.com,
  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org,
  peter.maydell@linaro.org
Subject: Re: [PATCH 4/7] block/dirty-bitmap: Clean up local variable shadowing
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-5-armbru@redhat.com>
	<ZQQNUjN4Laf+k1Nk@redhat.com> <8734za4stm.fsf@pond.sub.org>
	<ZQltoZWlnIW/wDi3@redhat.com>
Date: Wed, 20 Sep 2023 15:38:27 +0200
In-Reply-To: <ZQltoZWlnIW/wDi3@redhat.com> (Kevin Wolf's message of "Tue, 19
	Sep 2023 11:45:05 +0200")
Message-ID: <87bkdxdkx8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Kevin Wolf <kwolf@redhat.com> writes:

> Am 19.09.2023 um 07:48 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
>> >> Local variables shadowing other local variables or parameters make the
>> >> code needlessly hard to understand.  Tracked down with -Wshadow=local.
>> >> Clean up: delete inner declarations when they are actually redundant,
>> >> else rename variables.
>> >> 
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> ---
>> >>  block/monitor/bitmap-qmp-cmds.c | 2 +-
>> >>  block/qcow2-bitmap.c            | 3 +--
>> >>  2 files changed, 2 insertions(+), 3 deletions(-)
>> >> 
>> >> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
>> >> index 55f778f5af..4d018423d8 100644
>> >> --- a/block/monitor/bitmap-qmp-cmds.c
>> >> +++ b/block/monitor/bitmap-qmp-cmds.c
>> >> @@ -276,7 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>> >>  
>> >>      for (lst = bms; lst; lst = lst->next) {
>> >>          switch (lst->value->type) {
>> >> -            const char *name, *node;
>> >> +            const char *name;
>> >>          case QTYPE_QSTRING:
>> >>              name = lst->value->u.local;
>> >>              src = bdrv_find_dirty_bitmap(bs, name);
>> >
>> > The names in this function are all over the place... A more ambitious
>> > patch could rename the parameters to dst_node/dst_bitmap and these
>> > variables to src_node/src_bitmap to get some more consistency (both with
>> > each other and with the existing src/dst variables).
>> 
>> What exactly would you like me to consider?  Perhaps:
>> 
>> * Rename parameter @node to @dst_node
>> 
>> * Rename which parameter to @dst_bitmap?
>
> Parameter @target to @dst_bitmap (it's the name of a bitmap in
> @node/@dst_node)
>
>> * Rename nested local @node to @src_node
>> 
>> * Rename which local variable to @src_bitmap?
>
> @name to @src_bitmap (it's the name of a bitmap in the local
> @node/@src_node)
>
>> * Move nested locals to function scope
>
> I don't really mind either way, but yes, maybe that would be more
> conventional.

Done for v2.

> That you couldn't tell for two of the variables what they actually are
> probably supports the argument that they should be renamed. :-)

Fair point!


