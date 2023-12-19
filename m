Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC181883C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656779.1025214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZl2-0007Lm-1H; Tue, 19 Dec 2023 13:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656779.1025214; Tue, 19 Dec 2023 13:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZl1-0007Il-Tb; Tue, 19 Dec 2023 13:03:35 +0000
Received: by outflank-mailman (input) for mailman id 656779;
 Tue, 19 Dec 2023 13:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dspo=H6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFZkz-0007If-LP
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:03:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c668e1-9e6f-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:03:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-xVlPGfygOLSN3BRIuhYcfg-1; Tue,
 19 Dec 2023 08:03:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE52F1C0513E;
 Tue, 19 Dec 2023 13:03:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF6E2026D66;
 Tue, 19 Dec 2023 13:03:22 +0000 (UTC)
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
X-Inumbo-ID: 01c668e1-9e6f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702991010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4gjbsB35Qsptzv4ZyuMpQVHa+Sm/T5dLDnMD7DOxn/Q=;
	b=QPQCSsiZmhvzLzhjqCAopx5ZbKpP+V4hpApJ88m7jpp6U7j/IGwYasgUaJg8SyBQIo6kZ3
	5zHKOh0b4CYcPuFwu1LO3iuRTvAbzdggV1S6lotNiVJDe6RGxvjU+T506v2FDHfbD6AvCA
	zfcSC9knDJBHl2EqtQKlqAmu9PD6iK0=
X-MC-Unique: xVlPGfygOLSN3BRIuhYcfg-1
Date: Tue, 19 Dec 2023 14:03:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/14] aio: remove AioContext lock
Message-ID: <ZYGUmYOqEceAa9TY@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Am 05.12.2023 um 19:19 hat Stefan Hajnoczi geschrieben:
> v2:
> - Add Patch 2 "scsi: assert that callbacks run in the correct AioContext" [Kevin]
> - Add Patch 7 "block: remove bdrv_co_lock()" [Eric and Kevin]
> - Remove stray goto label in Patch 8 [Kevin]
> - Fix "eeked" -> "eked" typo in Patch 10 [Eric]
> 
> This series removes the AioContext locking APIs from QEMU.
> aio_context_acquire() and aio_context_release() are currently only needed to
> support the locking discipline required by AIO_POLL_WHILE() (except for a stray
> user that I converted in Patch 1). AIO_POLL_WHILE() doesn't really need the
> AioContext lock anymore, so it's possible to remove the API. This is a nice
> simplification because the AioContext locking rules were sometimes tricky or
> underspecified, leading to many bugs of the years.
> 
> This patch series removes these APIs across the codebase and cleans up the
> documentation/comments that refers to them.
> 
> Patch 1 is a AioContext lock user I forgot to convert in my earlier SCSI
> conversion series.
> 
> Patch 2 adds an assertion to the SCSI code to ensure that callbacks are invoked
> in the correct AioContext.
> 
> Patch 3 removes tests for the AioContext lock because they will no longer be
> needed when the lock is gone.
> 
> Patches 4-10 remove the AioContext lock. These can be reviewed by categorizing
> the call sites into 1. places that take the lock because they call an API that
> requires the lock (ultimately AIO_POLL_WHILE()) and 2. places that take the
> lock to protect state. There should be no instances of case 2 left. If you see
> one, you've found a bug in this patch series!
> 
> Patches 11-14 remove comments.

Thanks, applied to the block branch.

Kevin


