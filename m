Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490377FF390
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644990.1006702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ivZ-0002FV-Ct; Thu, 30 Nov 2023 15:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644990.1006702; Thu, 30 Nov 2023 15:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ivZ-0002Ca-AE; Thu, 30 Nov 2023 15:26:09 +0000
Received: by outflank-mailman (input) for mailman id 644990;
 Thu, 30 Nov 2023 15:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Itg=HL=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1r8ivX-0002CR-NE
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:26:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53d729c-8f94-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:26:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-AkwYzv4cPa23jxw8AoYvfg-1; Thu,
 30 Nov 2023 10:25:58 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 597981C0F479;
 Thu, 30 Nov 2023 15:25:57 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7778492BE7;
 Thu, 30 Nov 2023 15:25:53 +0000 (UTC)
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
X-Inumbo-ID: c53d729c-8f94-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701357962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1E3MmvTBcjlJZU/lnnO0iHKSu14HCeHV8F5Op4ocv4k=;
	b=V6CarrlKE0XZtZv4t4mORZoUcC2iuJHNkXQ8TB5KBgcVrXGIlMGLQ7P8pondgEvEjP3gkj
	epwnPHUx+cwarvIxML6EzTNpolcOPqfR922JBg6oa7/Wz8c888yc1GIdepjZc/nvQ769c/
	qOfTHVBsVerqYqj202emGzAu6MRR8ks=
X-MC-Unique: AkwYzv4cPa23jxw8AoYvfg-1
Date: Thu, 30 Nov 2023 09:25:52 -0600
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
Subject: Re: [PATCH 01/12] virtio-scsi: replace AioContext lock with
 tmf_bh_lock
Message-ID: <tng432xox5h3zwi7vkc7nbuu2bckkackqtdifqt2dtsn7t2eti@m2jwhopket2s>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-2-stefanha@redhat.com>
User-Agent: NeoMutt/20231103
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On Wed, Nov 29, 2023 at 02:55:42PM -0500, Stefan Hajnoczi wrote:
> Protect the Task Management Function BH state with a lock. The TMF BH
> runs in the main loop thread. An IOThread might process a TMF at the
> same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
> must be protected by a lock.
> 
> Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
> This avoids more locking to protect the virtqueue and SCSI layer state.

Are we trying to get this into 8.2?

> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h |  3 +-
>  hw/scsi/virtio-scsi.c           | 62 ++++++++++++++++++++++-----------
>  2 files changed, 43 insertions(+), 22 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


