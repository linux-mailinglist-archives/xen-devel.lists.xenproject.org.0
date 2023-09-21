Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AF7A9296
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606188.943927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF4P-0003qk-N3; Thu, 21 Sep 2023 08:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606188.943927; Thu, 21 Sep 2023 08:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF4P-0003oc-JP; Thu, 21 Sep 2023 08:29:57 +0000
Received: by outflank-mailman (input) for mailman id 606188;
 Thu, 21 Sep 2023 08:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BtKi=FF=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qjF4O-0003oW-S5
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:29:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9a9e5f-5859-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 10:29:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-VD5JH4anOqu_0X0mEjd2EQ-1; Thu, 21 Sep 2023 04:29:47 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33308811E8E;
 Thu, 21 Sep 2023 08:29:46 +0000 (UTC)
Received: from redhat.com (dhcp-192-199.str.redhat.com [10.33.192.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6618711282;
 Thu, 21 Sep 2023 08:29:42 +0000 (UTC)
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
X-Inumbo-ID: 0a9a9e5f-5859-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695284994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VOZZoa3ULPZ/NwlEeRYqCJI8eDfdRv+ZpCW8+MuKxjg=;
	b=SIlf3f/qmgWa0x9gDZ52IHUewpMxPRJ9Am/loK+AJrz3gpZEBehK0G/ac0teTLvG+Qjj20
	/3EeiEW3f8fM73uhUM3Rbd1fQmjVJ/th72af/XhX8LAp29qlYcJwe0TDiZ4NUmwfK/3jQS
	KW8bkNakRq0laP3jYTY4BdlnyOElLV8=
X-MC-Unique: VD5JH4anOqu_0X0mEjd2EQ-1
Date: Thu, 21 Sep 2023 10:29:41 +0200
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
Subject: Re: [PATCH v2 5/7] block/vdi: Clean up local variable shadowing
Message-ID: <ZQv+9cf9QivEQHQD@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
 <20230920183149.1105333-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920183149.1105333-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Am 20.09.2023 um 20:31 hat Markus Armbruster geschrieben:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


