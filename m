Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E578F9B6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 10:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594494.927834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbzGY-0003dF-Pa; Fri, 01 Sep 2023 08:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594494.927834; Fri, 01 Sep 2023 08:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbzGY-0003bZ-N0; Fri, 01 Sep 2023 08:12:30 +0000
Received: by outflank-mailman (input) for mailman id 594494;
 Fri, 01 Sep 2023 08:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=odZU=ER=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbzGX-0003Zx-LH
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 08:12:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a790ce8-489f-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 10:12:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-mlbIbxUdP5q0drilQ8pCwA-1; Fri, 01 Sep 2023 04:12:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1926806007;
 Fri,  1 Sep 2023 08:12:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CB5263A63;
 Fri,  1 Sep 2023 08:12:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A176521E692B; Fri,  1 Sep 2023 10:12:22 +0200 (CEST)
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
X-Inumbo-ID: 4a790ce8-489f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693555947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o642JFAoymaeECrSS5y//igTa/bP/GV1G6KemP2w5Lo=;
	b=NiYUHoyw8anvZ0XyrJZKoGbg0XCk+BA7n0LOWHKS2Ew/LxN/KTAfg/e3k2R1+TYObMo0r1
	XttaSZlp2VFdnlyLEIf9uN0835eKHp8MJP1ABh6eiQYYfBssV/CRAxRKbL9qFypvMnxMGE
	lWaVA9z47wDh1gJ85dZYWFSglFEdWWE=
X-MC-Unique: mlbIbxUdP5q0drilQ8pCwA-1
From: Markus Armbruster <armbru@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  eblake@redhat.com,  vsementsov@yandex-team.ru,  jsnow@redhat.com,
  idryomov@gmail.com,  pl@kamp.de,  sw@weilnetz.de,
  sstabellini@kernel.org,  anthony.perard@citrix.com,  paul@xen.org,
  pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
  thuth@redhat.com,  philmd@linaro.org,  stefanha@redhat.com,
  fam@euphon.net,  quintela@redhat.com,  peterx@redhat.com,
  leobras@redhat.com,  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org,
  peter.maydell@linaro.org
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more hygienic
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-8-armbru@redhat.com>
	<f751ab27-2d6e-19a2-a0bc-ca021a61a8f4@linaro.org>
Date: Fri, 01 Sep 2023 10:12:22 +0200
In-Reply-To: <f751ab27-2d6e-19a2-a0bc-ca021a61a8f4@linaro.org> (Richard
	Henderson's message of "Thu, 31 Aug 2023 08:52:36 -0700")
Message-ID: <871qfil3bt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/31/23 06:25, Markus Armbruster wrote:
>> +#define PASTE(a, b) a##b
>
> We already have glue() in qemu/compiler.h.

Missed it, will fix.

> The rest of it looks quite sensible.

Thanks!


