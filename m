Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A796F483E
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 18:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528751.822288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsky-0006BD-Fa; Tue, 02 May 2023 16:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528751.822288; Tue, 02 May 2023 16:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsky-00068m-Cc; Tue, 02 May 2023 16:21:36 +0000
Received: by outflank-mailman (input) for mailman id 528751;
 Tue, 02 May 2023 16:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dv4+=AX=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1ptskw-00068e-A8
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 16:21:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6676d4a3-e905-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 18:21:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-XFbx3vdZP5Ky0DHbFh4gXA-1; Tue, 02 May 2023 12:21:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C753C2807D63;
 Tue,  2 May 2023 16:21:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BA563F4A;
 Tue,  2 May 2023 16:21:21 +0000 (UTC)
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
X-Inumbo-ID: 6676d4a3-e905-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683044492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=veAM1yxiNJOFHsx6/inor+jTVAWMkCyEti4maPSbfwU=;
	b=elqcCIYjAyJ6fQ5hm3szZez32Xuf5TuBjBNhoLNy8OdYZQOIjLrcCJYNmhd2TqjQcrxKGp
	sEIpPKmzKdZqIm1IqUJPs059aV1B4BIZaBCC00cz7vYDRjTPK87t2Bk/BvQkA25sytiDIW
	ycfavmAL6n7onktQP1Ct+pUPmSIxXUQ=
X-MC-Unique: XFbx3vdZP5Ky0DHbFh4gXA-1
Date: Tue, 2 May 2023 18:21:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 10/20] block: drain from main loop thread in
 bdrv_co_yield_to_drain()
Message-ID: <ZFE4gFFXnu+FSk35@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-11-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-11-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> For simplicity, always run BlockDevOps .drained_begin/end/poll()
> callbacks in the main loop thread. This makes it easier to implement the
> callbacks and avoids extra locks.
> 
> Move the function pointer declarations from the I/O Code section to the
> Global State section in block-backend-common.h.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

If we're updating function pointers, we should probably update them in
BdrvChildClass and BlockDriver, too.

This means that a non-coroutine caller can't run in an iothread, not
even the home iothread of the BlockDriverState. (I'm not sure if it was
allowed previously. I don't think we're actually doing this, but in
theory it could have worked.) Maybe put a GLOBAL_STATE_CODE() after
handling the bdrv_co_yield_to_drain() case? Or would that look too odd?

    IO_OR_GS_CODE();

    if (qemu_in_coroutine()) {
        bdrv_co_yield_to_drain(bs, true, parent, poll);
        return;
    }

    GLOBAL_STATE_CODE();

Kevin


