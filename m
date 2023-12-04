Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B3803352
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 13:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646898.1009545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8LF-00068R-Ov; Mon, 04 Dec 2023 12:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646898.1009545; Mon, 04 Dec 2023 12:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8LF-00065i-Lc; Mon, 04 Dec 2023 12:46:29 +0000
Received: by outflank-mailman (input) for mailman id 646898;
 Mon, 04 Dec 2023 12:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/x5/=HP=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rA8LE-00065c-6X
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 12:46:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23068d18-92a3-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 13:46:26 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-WlsnWTGLP9CgoOClcumpYA-1; Mon, 04 Dec 2023 07:46:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF54285A58B;
 Mon,  4 Dec 2023 12:46:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B032BC15983;
 Mon,  4 Dec 2023 12:46:14 +0000 (UTC)
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
X-Inumbo-ID: 23068d18-92a3-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OdqJcUWrpkerK9dE7JvdF+gkdvliUlUpsIv/joFLTrU=;
	b=US/ZXufMixJF3shG3LE1TzC5TGQK8Uph39bM4XZ3DDtG4lCUjDkE1ymJwP+UmmNp3QKi6j
	wvSgX8MJNFgiY4TPXMBpcjxkxSVKlfxDHRoahAMw7Mxe+YPkqoAt/IpYpNcgatzJvu3JTA
	w7/jQkhN6KQckDVvjMdOgYODiZXsgkc=
X-MC-Unique: WlsnWTGLP9CgoOClcumpYA-1
Date: Mon, 4 Dec 2023 13:46:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>, Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 01/12] virtio-scsi: replace AioContext lock with
 tmf_bh_lock
Message-ID: <ZW3KFQ3PsdbVFymi@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> Protect the Task Management Function BH state with a lock. The TMF BH
> runs in the main loop thread. An IOThread might process a TMF at the
> same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
> must be protected by a lock.
> 
> Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
> This avoids more locking to protect the virtqueue and SCSI layer state.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

The second part reminds me that the implicit protection of the virtqueue
and SCSI data structures by having all accesses in a single thread is
hard to review and I think we wanted to put some assertions there to
check that we're really running in the right thread. I don't think we
have done that so far, so I suppose after this patch would be the place
in the series to add them, before we remove the protection by the
AioContext lock?

Kevin


