Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB77F716933
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541275.843862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q429M-0005JH-5I; Tue, 30 May 2023 16:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541275.843862; Tue, 30 May 2023 16:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q429M-0005Ga-2U; Tue, 30 May 2023 16:24:44 +0000
Received: by outflank-mailman (input) for mailman id 541275;
 Tue, 30 May 2023 16:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=slLs=BT=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1q429K-0005GS-IK
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:24:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79968668-ff06-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 18:24:40 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-ahITsgYMPYCTa1zF2WpWBg-1; Tue, 30 May 2023 12:24:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0662F87282F;
 Tue, 30 May 2023 16:24:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E24581121330;
 Tue, 30 May 2023 16:24:14 +0000 (UTC)
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
X-Inumbo-ID: 79968668-ff06-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685463879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PO7OF1UJIEyhl34/BsyVvrG83vEPKJb7h1Om/b9M+g=;
	b=I8E3iMoNG5YaWka4+qG8LG5aFBBfaCDR7nTWfJ7ILDL1JscwttZXLXX2VaU2R+aLymQXoK
	yh1zgP8BbfD7Xgi1CsF95/L1vTfueqliLFhpIiHefhyv5LCJ8ElwFn7Vg0v5thGIQExS9a
	t44OHSNQ+7PlNJ4RXywOIODKWQvEFuA=
X-MC-Unique: ahITsgYMPYCTa1zF2WpWBg-1
Date: Tue, 30 May 2023 18:24:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Peter Xu <peterx@redhat.com>, xen-devel@lists.xenproject.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, eesposit@redhat.com,
	Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v6 00/20] block: remove aio_disable_external() API
Message-ID: <ZHYjLQ3pb+GBav6i@redhat.com>
References: <20230516190238.8401-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516190238.8401-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Am 16.05.2023 um 21:02 hat Stefan Hajnoczi geschrieben:
> The aio_disable_external() API temporarily suspends file descriptor monitoring
> in the event loop. The block layer uses this to prevent new I/O requests being
> submitted from the guest and elsewhere between bdrv_drained_begin() and
> bdrv_drained_end().
> 
> While the block layer still needs to prevent new I/O requests in drained
> sections, the aio_disable_external() API can be replaced with
> .drained_begin/end/poll() callbacks that have been added to BdrvChildClass and
> BlockDevOps.
> 
> This newer .bdrained_begin/end/poll() approach is attractive because it works
> without specifying a specific AioContext. The block layer is moving towards
> multi-queue and that means multiple AioContexts may be processing I/O
> simultaneously.
> 
> The aio_disable_external() was always somewhat hacky. It suspends all file
> descriptors that were registered with is_external=true, even if they have
> nothing to do with the BlockDriverState graph nodes that are being drained.
> It's better to solve a block layer problem in the block layer than to have an
> odd event loop API solution.
> 
> The approach in this patch series is to implement BlockDevOps
> .drained_begin/end() callbacks that temporarily stop file descriptor handlers.
> This ensures that new I/O requests are not submitted in drained sections.

Thanks, applied to the block branch.

Kevin


