Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19D7A5995
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 07:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604345.941663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTaq-0003Vt-3M; Tue, 19 Sep 2023 05:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604345.941663; Tue, 19 Sep 2023 05:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTaq-0003TL-0Q; Tue, 19 Sep 2023 05:48:16 +0000
Received: by outflank-mailman (input) for mailman id 604345;
 Tue, 19 Sep 2023 05:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L0bg=FD=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qiTao-0003TF-O7
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 05:48:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd46433-56b0-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 07:48:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-683-xHw6_rRWPtevVZjCFt_5Cw-1; Tue, 19 Sep 2023 01:48:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98501811E7B;
 Tue, 19 Sep 2023 05:48:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69AFDC15BB8;
 Tue, 19 Sep 2023 05:48:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5EA2321E6900; Tue, 19 Sep 2023 07:48:05 +0200 (CEST)
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
X-Inumbo-ID: 1dd46433-56b0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695102490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/fZBqgWohIXDyoS//C2CQBh2i20NsRptRtuC2Sy1CY=;
	b=iHHS+K9RY52CHvbGbyANylsE2rDicGMj5U8/HDwKVfH01yQxY5JcsJ9fQUiwbma+hUxLQ/
	0fzHwvqf7xQLzj3URGxzBeedL7nLT3vQ812sqFTgyZVLCjb6/UJsHp2y4VR5vtlsd36liU
	z7WZEY+iSNkD41BazejMFhWwtkQH06o=
X-MC-Unique: xHw6_rRWPtevVZjCFt_5Cw-1
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
	<ZQQNUjN4Laf+k1Nk@redhat.com>
Date: Tue, 19 Sep 2023 07:48:05 +0200
In-Reply-To: <ZQQNUjN4Laf+k1Nk@redhat.com> (Kevin Wolf's message of "Fri, 15
	Sep 2023 09:52:50 +0200")
Message-ID: <8734za4stm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Kevin Wolf <kwolf@redhat.com> writes:

> Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
>> Local variables shadowing other local variables or parameters make the
>> code needlessly hard to understand.  Tracked down with -Wshadow=local.
>> Clean up: delete inner declarations when they are actually redundant,
>> else rename variables.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  block/monitor/bitmap-qmp-cmds.c | 2 +-
>>  block/qcow2-bitmap.c            | 3 +--
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
>> index 55f778f5af..4d018423d8 100644
>> --- a/block/monitor/bitmap-qmp-cmds.c
>> +++ b/block/monitor/bitmap-qmp-cmds.c
>> @@ -276,7 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>>  
>>      for (lst = bms; lst; lst = lst->next) {
>>          switch (lst->value->type) {
>> -            const char *name, *node;
>> +            const char *name;
>>          case QTYPE_QSTRING:
>>              name = lst->value->u.local;
>>              src = bdrv_find_dirty_bitmap(bs, name);
>
> The names in this function are all over the place... A more ambitious
> patch could rename the parameters to dst_node/dst_bitmap and these
> variables to src_node/src_bitmap to get some more consistency (both with
> each other and with the existing src/dst variables).

What exactly would you like me to consider?  Perhaps:

* Rename parameter @node to @dst_node

* Rename which parameter to @dst_bitmap?

* Rename nested local @node to @src_node

* Rename which local variable to @src_bitmap?

* Move nested locals to function scope

> Preexisting, so I'm not insisting that you should do this.
>
>> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
>> index 037fa2d435..ffd5cd3b23 100644
>> --- a/block/qcow2-bitmap.c
>> +++ b/block/qcow2-bitmap.c
>> @@ -1555,7 +1555,6 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>      FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
>>          const char *name = bdrv_dirty_bitmap_name(bitmap);
>>          uint32_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
>> -        Qcow2Bitmap *bm;
>>  
>>          if (!bdrv_dirty_bitmap_get_persistence(bitmap) ||
>>              bdrv_dirty_bitmap_inconsistent(bitmap)) {
>> @@ -1625,7 +1624,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>  
>>      /* allocate clusters and store bitmaps */
>>      QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>> -        BdrvDirtyBitmap *bitmap = bm->dirty_bitmap;
>> +        bitmap = bm->dirty_bitmap;
>>  
>>          if (bitmap == NULL || bdrv_dirty_bitmap_readonly(bitmap)) {
>>              continue;
>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Thanks!


