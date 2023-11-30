Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407207FFDB7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 22:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645156.1007086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8olG-00047F-Ab; Thu, 30 Nov 2023 21:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645156.1007086; Thu, 30 Nov 2023 21:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8olG-00044z-7x; Thu, 30 Nov 2023 21:39:54 +0000
Received: by outflank-mailman (input) for mailman id 645156;
 Thu, 30 Nov 2023 21:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Itg=HL=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1r8olE-00040i-DQ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 21:39:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2b9ce8-8fc8-11ee-98e5-6d05b1d4d9a1;
 Thu, 30 Nov 2023 22:39:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-HAPuHUsKOV6zC7w_7qgJMg-1; Thu,
 30 Nov 2023 16:39:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BA1E3C000A9;
 Thu, 30 Nov 2023 21:39:45 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8DEB1C060AE;
 Thu, 30 Nov 2023 21:39:42 +0000 (UTC)
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
X-Inumbo-ID: fd2b9ce8-8fc8-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701380389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yJx77l9Qm/nY+elC71n/KnbdxOWlhoVS1buECAHBREs=;
	b=LFs3gQsnX48M6RwN9XBt7RhQN+Hg6oEP6rb9Fd8EMyKFFNdJSqyReFRQv7I7NUzx+XULwW
	+Jy3o/CVjC/ziPk184/L/DTCQ4IVW6/9Wpg7n/xPSAdW0a4yN6ToX8midsH/GsZN3/wt6V
	oz4slgKnvjEp3lfa9aR2EfegAcj1Pwk=
X-MC-Unique: HAPuHUsKOV6zC7w_7qgJMg-1
Date: Thu, 30 Nov 2023 15:39:41 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alberto Garcia <berto@igalia.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org, xen-devel@lists.xenproject.org, 
	Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Ari Sundholm <ari@tuxera.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Cleber Rosa <crosa@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Leonardo Bras <leobras@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 07/12] aio-wait: draw equivalence between
 AIO_WAIT_WHILE() and AIO_WAIT_WHILE_UNLOCKED()
Message-ID: <y6j7swfr36mmzdoq4ajc3ptmqf5kamptc3wfdyjcuxkk5lbwxk@uqmvf674x7p7>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-8-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-8-stefanha@redhat.com>
User-Agent: NeoMutt/20231103
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On Wed, Nov 29, 2023 at 02:55:48PM -0500, Stefan Hajnoczi wrote:
> Now that the AioContext lock no longer exists, AIO_WAIT_WHILE() and
> AIO_WAIT_WHILE_UNLOCKED() are equivalent.
> 
> A future patch will get rid of AIO_WAIT_WHILE_UNLOCKED().
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/aio-wait.h | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


