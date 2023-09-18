Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F47A4B36
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 16:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604099.941318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiFXN-0002yd-JB; Mon, 18 Sep 2023 14:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604099.941318; Mon, 18 Sep 2023 14:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiFXN-0002vM-GS; Mon, 18 Sep 2023 14:47:45 +0000
Received: by outflank-mailman (input) for mailman id 604099;
 Mon, 18 Sep 2023 14:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9yUr=FC=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qiFXL-0002s9-Pa
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 14:47:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51cb8c95-5632-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 16:47:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-694-ZNSI5qm6NxGEWYqOK2iQsg-1; Mon, 18 Sep 2023 10:47:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBD30101A53B;
 Mon, 18 Sep 2023 14:47:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D456A1C554;
 Mon, 18 Sep 2023 14:47:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E818F21E6900; Mon, 18 Sep 2023 16:47:34 +0200 (CEST)
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
X-Inumbo-ID: 51cb8c95-5632-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695048461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr10BgvxSqJ2B7JFeQPeJKV1bmS3WBpXTQ2eSz0GfVQ=;
	b=MZYyycQFUTmyFTnIVC8Yr/jvD9mA/MatGDzxH0baby5JP9EL29R/Q+PAcpqef97q4Gml2S
	Ri9OO/wj0Epy5QjfMWE2UlHwMzFerIeusjQRYlbe/oVl9M5MwGi6q/eyUqfZE42EZ/IvPC
	NK9rpL+yDLNbubl8VTCNObl1+z9JMT8=
X-MC-Unique: ZNSI5qm6NxGEWYqOK2iQsg-1
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
Subject: Re: [PATCH 5/7] block/vdi: Clean up local variable shadowing
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-6-armbru@redhat.com>
	<ZQQKsxgrT2mLokFi@redhat.com>
Date: Mon, 18 Sep 2023 16:47:34 +0200
In-Reply-To: <ZQQKsxgrT2mLokFi@redhat.com> (Kevin Wolf's message of "Fri, 15
	Sep 2023 09:41:39 +0200")
Message-ID: <871qevczcp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Kevin Wolf <kwolf@redhat.com> writes:

> Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
>> Local variables shadowing other local variables or parameters make the
>> code needlessly hard to understand.  Tracked down with -Wshadow=local.
>> Clean up: delete inner declarations when they are actually redundant,
>> else rename variables.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>> @@ -700,7 +699,7 @@ nonallocating_write:
>>          /* One or more new blocks were allocated. */
>>          VdiHeader *header;
>>          uint8_t *base;
>> -        uint64_t offset;
>> +        uint64_t offs;
>>          uint32_t n_sectors;
>>  
>>          g_free(block);
>> @@ -723,11 +722,11 @@ nonallocating_write:
>>          bmap_first /= (SECTOR_SIZE / sizeof(uint32_t));
>>          bmap_last /= (SECTOR_SIZE / sizeof(uint32_t));
>>          n_sectors = bmap_last - bmap_first + 1;
>> -        offset = s->bmap_sector + bmap_first;
>> +        offs = s->bmap_sector + bmap_first;
>>          base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
>>          logout("will write %u block map sectors starting from entry %u\n",
>>                 n_sectors, bmap_first);
>> -        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
>> +        ret = bdrv_co_pwrite(bs->file, offs * SECTOR_SIZE,
>>                               n_sectors * SECTOR_SIZE, base, 0);
>>      }
>
> Having two variables 'offset' and 'offs' doesn't really help with
> clarity either. Can we be more specific and use something like
> 'bmap_offset' here?

Sure!


