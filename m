Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F17A93D5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 13:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606318.944166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjHmq-0003Ei-Kj; Thu, 21 Sep 2023 11:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606318.944166; Thu, 21 Sep 2023 11:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjHmq-0003CE-Hm; Thu, 21 Sep 2023 11:24:00 +0000
Received: by outflank-mailman (input) for mailman id 606318;
 Thu, 21 Sep 2023 11:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x4Y2=FF=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qjHmo-0003C8-WE
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 11:23:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d0b56b-5871-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 13:23:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-caWjci2_PU2vrCR-xOsTNg-1; Thu, 21 Sep 2023 07:23:51 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D80101A550;
 Thu, 21 Sep 2023 11:23:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF48D71128D;
 Thu, 21 Sep 2023 11:23:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D40E621E6900; Thu, 21 Sep 2023 13:23:48 +0200 (CEST)
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
X-Inumbo-ID: 59d0b56b-5871-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695295435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+FZ1HLn1enArtG6hbpwub79OeJ+adjJG7s+VPyKwac=;
	b=eARDPBfx3Ao88UdjygNNeOgMq8pnRY6WKVXcFOL1wnlif0SrWCFG8+R7wDKYipyvK1jDof
	qlxIOnzG0HcxbbL3XMrDVsRevUJOu3e04Af+7hpli7fJ2Rkw6dlAdmBnsqBqD18gUNW7iO
	QHJPaisIZ57l9hrLCHK1zRG2tfNx33g=
X-MC-Unique: caWjci2_PU2vrCR-xOsTNg-1
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
Subject: Re: [PATCH v2 7/7] qobject atomics osdep: Make a few macros more
 hygienic
References: <20230920183149.1105333-1-armbru@redhat.com>
	<20230920183149.1105333-8-armbru@redhat.com>
	<ZQwCEW4SBpI9f1Yx@redhat.com>
Date: Thu, 21 Sep 2023 13:23:48 +0200
In-Reply-To: <ZQwCEW4SBpI9f1Yx@redhat.com> (Kevin Wolf's message of "Thu, 21
	Sep 2023 10:42:57 +0200")
Message-ID: <87sf776a7v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Kevin Wolf <kwolf@redhat.com> writes:

> Am 20.09.2023 um 20:31 hat Markus Armbruster geschrieben:

[...]

>> diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
>> index 9003b71fd3..d36cc97805 100644
>> --- a/include/qapi/qmp/qobject.h
>> +++ b/include/qapi/qmp/qobject.h
>> @@ -45,10 +45,17 @@ struct QObject {
>>      struct QObjectBase_ base;
>>  };
>>  
>> -#define QOBJECT(obj) ({                                         \
>> +/*
>> + * Preprocessory sorcery ahead: use a different identifier for the
>> + * local variable in each expansion, so we can nest macro calls
>> + * without shadowing variables.
>> + */
>> +#define QOBJECT_INTERNAL(obj, _obj) ({                          \
>>      typeof(obj) _obj = (obj);                                   \
>> -    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
>> +    _obj                                                        \
>> +        ? container_of(&(_obj)->base, QObject, base) : NULL;    \
>
> What happened here? The code in this line (or now two lines) seems to be
> unchanged apart from a strange looking newline.

Accident, will fix, thanks!

>>  })
>> +#define QOBJECT(obj) QOBJECT_INTERNAL((obj), MAKE_IDENTFIER(_obj))
>
> Kevin


