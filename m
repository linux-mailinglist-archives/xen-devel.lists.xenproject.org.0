Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAC81756E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656169.1024222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFfb-0003E5-AV; Mon, 18 Dec 2023 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656169.1024222; Mon, 18 Dec 2023 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFfb-0003CK-7B; Mon, 18 Dec 2023 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 656169;
 Mon, 18 Dec 2023 15:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iZ/e=H5=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFFfa-0001Py-Eq
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:36:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a527a49-9dbb-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:36:36 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-YrA_eJyzOHe5pX8xUfYcgw-1; Mon, 18 Dec 2023 10:36:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 284978F7763;
 Mon, 18 Dec 2023 15:36:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 136572166B31;
 Mon, 18 Dec 2023 15:36:24 +0000 (UTC)
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
X-Inumbo-ID: 3a527a49-9dbb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702913795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4bvx/ZML+G395CK8q8MutVS+t0ZGfK/ntYAEwj/TaGY=;
	b=EtyuHMQVi/9Gv4dQhyNK/gEtncD4b9ZYCSEjMgRjUIlrKl/QiBF8E1o+vMEIk6e7Bj75zv
	JbI8Pfwt51p2tjBrVS6i2+uMcu45j/b2Qir/0ZuvKFs1pqBLB6vFT3JO4GgklAH43hAKWi
	o/NYrbae5XwyKyjzDXv7JIjked5GYYY=
X-MC-Unique: YrA_eJyzOHe5pX8xUfYcgw-1
Date: Mon, 18 Dec 2023 16:36:23 +0100
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
Subject: Re: [PATCH v2 10/14] aio: remove
 aio_context_acquire()/aio_context_release() API
Message-ID: <ZYBm9_Qpyt1-of30@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-11-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205182011.1976568-11-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> Delete these functions because nothing calls these functions anymore.
> 
> I introduced these APIs in commit 98563fc3ec44 ("aio: add
> aio_context_acquire() and aio_context_release()") in 2014. It's with a
> sigh of relief that I delete these APIs almost 10 years later.
> 
> Thanks to Paolo Bonzini's vision for multi-queue QEMU, we got an
> understanding of where the code needed to go in order to remove the
> limitations that the original dataplane and the IOThread/AioContext
> approach that followed it.
> 
> Emanuele Giuseppe Esposito had the splendid determination to convert
> large parts of the codebase so that they no longer needed the AioContext
> lock. This was a painstaking process, both in the actual code changes
> required and the iterations of code review that Emanuele eked out of
> Kevin and me over many months.
> 
> Kevin Wolf tackled multitudes of graph locking conversions to protect
> in-flight I/O from run-time changes to the block graph as well as the
> clang Thread Safety Analysis annotations that allow the compiler to
> check whether the graph lock is being used correctly.
> 
> And me, well, I'm just here to add some pizzazz to the QEMU multi-queue
> block layer :). Thank you to everyone who helped with this effort,
> including Eric Blake, code reviewer extraordinaire, and others who I've
> forgotten to mention.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


