Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02A78F9B5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 10:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594491.927825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbzG5-0003Ck-JO; Fri, 01 Sep 2023 08:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594491.927825; Fri, 01 Sep 2023 08:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbzG5-00039e-Fs; Fri, 01 Sep 2023 08:12:01 +0000
Received: by outflank-mailman (input) for mailman id 594491;
 Fri, 01 Sep 2023 08:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=odZU=ER=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbzG4-00039Y-QC
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 08:12:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38536d83-489f-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 10:11:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-695-TzfSF95gMmykgvPpw4gz5g-1; Fri, 01 Sep 2023 04:11:54 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C212B801005;
 Fri,  1 Sep 2023 08:11:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81723492C13;
 Fri,  1 Sep 2023 08:11:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E84221E692A; Fri,  1 Sep 2023 10:11:52 +0200 (CEST)
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
X-Inumbo-ID: 38536d83-489f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693555917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4y8KpasydNTki6EwLl4CjttzvFm5eCWdJftrgP8a/k=;
	b=K6MxpnjHmjUXokQ1ivot1VMGNfhkvD9722dhGpgWHolUZFZlWF+SLX4fbJdmvA16c/adkR
	NGlWpTmJJ5LrBkUJDqmbOFvBxhu3IX0zj9cAYI2IxTDKo5d5n3D8VE7Jx3YHye0iHW+C0i
	hqtCAcvQmphLj7tg5PPx9ooUwnayVtQ=
X-MC-Unique: TzfSF95gMmykgvPpw4gz5g-1
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  eblake@redhat.com,  vsementsov@yandex-team.ru,  jsnow@redhat.com,
  idryomov@gmail.com,  pl@kamp.de,  sw@weilnetz.de,
  sstabellini@kernel.org,  anthony.perard@citrix.com,  paul@xen.org,
  pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
  thuth@redhat.com,  philmd@linaro.org,  stefanha@redhat.com,
  fam@euphon.net,  quintela@redhat.com,  peterx@redhat.com,
  leobras@redhat.com,  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org
Subject: Re: [PATCH 3/7] ui: Clean up local variable shadowing
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-4-armbru@redhat.com>
	<CAFEAcA-0yYGkeg1gOtz8GRp-DbaxMQCzhRf=B4rq=Bz_DrsxNA@mail.gmail.com>
Date: Fri, 01 Sep 2023 10:11:52 +0200
In-Reply-To: <CAFEAcA-0yYGkeg1gOtz8GRp-DbaxMQCzhRf=B4rq=Bz_DrsxNA@mail.gmail.com>
	(Peter Maydell's message of "Thu, 31 Aug 2023 15:53:59 +0100")
Message-ID: <875y4ul3cn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 31 Aug 2023 at 14:25, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Local variables shadowing other local variables or parameters make the
>> code needlessly hard to understand.  Tracked down with -Wshadow=3Dlocal.
>> Clean up: delete inner declarations when they are actually redundant,
>> else rename variables.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>
>> diff --git a/ui/vnc-enc-zrle.c.inc b/ui/vnc-enc-zrle.c.inc
>> index c107d8affc..edf42d4a6a 100644
>> --- a/ui/vnc-enc-zrle.c.inc
>> +++ b/ui/vnc-enc-zrle.c.inc
>> @@ -153,11 +153,12 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PI=
XEL *data, int w, int h,
>>      }
>>
>>      if (use_rle) {
>> -        ZRLE_PIXEL *ptr =3D data;
>> -        ZRLE_PIXEL *end =3D ptr + w * h;
>>          ZRLE_PIXEL *run_start;
>>          ZRLE_PIXEL pix;
>>
>> +        ptr =3D data;
>> +        end =3D ptr + w * h;
>> +
>>          while (ptr < end) {
>>              int len;
>>              int index =3D 0;
>> @@ -198,7 +199,7 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXE=
L *data, int w, int h,
>>          }
>>      } else if (use_palette) { /* no RLE */
>>          int bppp;
>> -        ZRLE_PIXEL *ptr =3D data;
>> +        ptr =3D data;
>>
>>          /* packed pixels */
>>
>> @@ -241,8 +242,6 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXE=
L *data, int w, int h,
>>  #endif
>>          {
>>  #ifdef ZRLE_COMPACT_PIXEL
>> -            ZRLE_PIXEL *ptr;
>> -
>>              for (ptr =3D data; ptr < data + w * h; ptr++) {
>>                  ZRLE_WRITE_PIXEL(vs, *ptr);
>>              }
>
> For this one I'm tempted to suggest instead moving the
> pix and end currently at whole-function scope into their
> own block, so it's clear these are actually four
> completely independent uses of ptr/end. But either way

You have a point.  However, we'd need to splice in a block just for
that, which involved some reindenting.  Can do if the assigned
maintainers (Gerd and Marc-Andr=C3=A9) prefer it.  Else, I'll stay with
minimally invasive.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!


