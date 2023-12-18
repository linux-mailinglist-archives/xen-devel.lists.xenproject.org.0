Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85897817563
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656165.1024201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFeu-00020j-Pf; Mon, 18 Dec 2023 15:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656165.1024201; Mon, 18 Dec 2023 15:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFeu-0001yX-Mb; Mon, 18 Dec 2023 15:35:56 +0000
Received: by outflank-mailman (input) for mailman id 656165;
 Mon, 18 Dec 2023 15:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iZ/e=H5=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFFes-0001Py-O2
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:35:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2061497d-9dbb-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:35:53 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-s1dv_ctpMQWXja38g4Rh-A-1; Mon, 18 Dec 2023 10:35:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 847C98350E5;
 Mon, 18 Dec 2023 15:35:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FEFCC15968;
 Mon, 18 Dec 2023 15:35:43 +0000 (UTC)
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
X-Inumbo-ID: 2061497d-9dbb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702913752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F/7GeNjlIOe+iJkXh5tIFarvSyFRtMjWqaNDVwtlcfM=;
	b=BuOlU8ABSzMUzTxN3T7uEpEg68NjnKWfyr6Rc++Ju4pPZkkj6r2CdTfiXWZvVhcYJHztr/
	I9raENlMQEMFN3d/8Iv7YPHCXHasyDxs+lcp/Js6JhX7nSKAT6/6P45iwrTo1s8Jov3F0F
	W3Bx19BpefHmXmeoaIAGpHo2y0AjXIQ=
X-MC-Unique: s1dv_ctpMQWXja38g4Rh-A-1
Date: Mon, 18 Dec 2023 16:35:42 +0100
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
Subject: Re: [PATCH v2 08/14] scsi: remove AioContext locking
Message-ID: <ZYBmzsnD-coIBWqs@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-9-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205182011.1976568-9-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> The AioContext lock no longer has any effect. Remove it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


