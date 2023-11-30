Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55137FFD9C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 22:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645153.1007077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8oiG-0002Lc-TY; Thu, 30 Nov 2023 21:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645153.1007077; Thu, 30 Nov 2023 21:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8oiG-0002Ik-Qq; Thu, 30 Nov 2023 21:36:48 +0000
Received: by outflank-mailman (input) for mailman id 645153;
 Thu, 30 Nov 2023 21:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Itg=HL=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1r8oiF-0002Ie-1s
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 21:36:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e6ce67a-8fc8-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 22:36:44 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ID1dLT8AOhm8WZQtPE76jQ-1; Thu, 30 Nov 2023 16:36:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01CF1101A590;
 Thu, 30 Nov 2023 21:36:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F4210EA5;
 Thu, 30 Nov 2023 21:36:37 +0000 (UTC)
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
X-Inumbo-ID: 8e6ce67a-8fc8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701380203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4xx48IrfYR8HpVbqif8dwMq0RcgNVMpzDKp6Wh2oMc=;
	b=Ppk2GyhcTqIh8Qk6A/OI2g1vWXfe8uQQH8nEUO4jq9v0lIm+L9voD4GT/StzgYG62gRhfJ
	pDKYPOCTey1C1sZ83fxNzSSpKoDCmI75727HCVyGwqIF3OfrXwyJp5R6qfxTgvrTtLb2gW
	Qyik1ja6FroDO/NYEkSa+e6rRtSAQTk=
X-MC-Unique: ID1dLT8AOhm8WZQtPE76jQ-1
Date: Thu, 30 Nov 2023 15:36:35 -0600
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
Subject: Re: [PATCH 06/12] scsi: remove AioContext locking
Message-ID: <grmekw2utdinnwm6vf5yzrehjqmbgfcnouzefeqgrrolyf2dw2@ngzxictk7zgn>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-7-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-7-stefanha@redhat.com>
User-Agent: NeoMutt/20231103
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On Wed, Nov 29, 2023 at 02:55:47PM -0500, Stefan Hajnoczi wrote:
> The AioContext lock no longer has any effect. Remove it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h | 14 --------------
>  hw/scsi/scsi-bus.c              |  2 --
>  hw/scsi/scsi-disk.c             | 28 ++++------------------------
>  hw/scsi/virtio-scsi.c           | 18 ------------------
>  4 files changed, 4 insertions(+), 58 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


