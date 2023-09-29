Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E37B2C1A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 07:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610178.949485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm6UY-0002mt-Kg; Fri, 29 Sep 2023 05:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610178.949485; Fri, 29 Sep 2023 05:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm6UY-0002ke-Hl; Fri, 29 Sep 2023 05:56:46 +0000
Received: by outflank-mailman (input) for mailman id 610178;
 Fri, 29 Sep 2023 05:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l95f=FN=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qm6UX-0002U9-1d
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 05:56:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a6757c-5e8c-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 07:56:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-7vGo5wEPPlKEgP2nmR_zHg-1; Fri, 29 Sep 2023 01:56:36 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4E898015AB;
 Fri, 29 Sep 2023 05:56:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A15492B16;
 Fri, 29 Sep 2023 05:56:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A0DB21E6904; Fri, 29 Sep 2023 07:56:34 +0200 (CEST)
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
X-Inumbo-ID: f6a6757c-5e8c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695967002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiIE8vdpxXShE267kbclgaAGOh644MOJx97HDq593yw=;
	b=TtDEzoZpcO7uQQX1lm+JjSgNUIT/Pm/4L0TIzlTXrVdd8Gy1GT58OtGxDYxdFzDJmtHMrf
	gkxDHfSj3RlNPtk5+HczSjJgQOLkgXPc4ZV/PZ2PLVQzeH/cZUNXuhKt6T/KNvKR7R2gHw
	NXYIntm+LUU03mLf6jbh9aCeB9PIMrI=
X-MC-Unique: 7vGo5wEPPlKEgP2nmR_zHg-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,  hreitz@redhat.com,  eblake@redhat.com,
  vsementsov@yandex-team.ru,  jsnow@redhat.com,  idryomov@gmail.com,
  sw@weilnetz.de,  sstabellini@kernel.org,  anthony.perard@citrix.com,
  paul@xen.org,  pbonzini@redhat.com,  marcandre.lureau@redhat.com,
  berrange@redhat.com,  thuth@redhat.com,  philmd@linaro.org,
  stefanha@redhat.com,  fam@euphon.net,  quintela@redhat.com,
  peterx@redhat.com,  leobras@redhat.com,  kraxel@redhat.com,
  qemu-block@nongnu.org,  xen-devel@lists.xenproject.org,
  alex.bennee@linaro.org,  peter.maydell@linaro.org
Subject: Re: [PATCH v3 0/7] Steps towards enabling -Wshadow=local
References: <20230921121312.1301864-1-armbru@redhat.com>
Date: Fri, 29 Sep 2023 07:56:34 +0200
In-Reply-To: <20230921121312.1301864-1-armbru@redhat.com> (Markus Armbruster's
	message of "Thu, 21 Sep 2023 14:13:05 +0200")
Message-ID: <87il7tjze5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Markus Armbruster <armbru@redhat.com> writes:

> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Bugs love to hide in such code.
> Evidence: PATCH 1.
>
> Enabling -Wshadow would prevent bugs like this one.  But we'd have to
> clean up all the offenders first.  We got a lot of them.
>
> Enabling -Wshadow=local should be less work for almost as much gain.
> I took a stab at it.  There's a small, exciting part, and a large,
> boring part.
>
> The exciting part is dark preprocessor sorcery to let us nest macro
> calls without shadowing: PATCH 7.

[...]

Queued.


