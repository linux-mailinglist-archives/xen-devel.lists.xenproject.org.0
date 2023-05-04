Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956FA6F784D
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530185.825616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugl5-0006C0-BO; Thu, 04 May 2023 21:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530185.825616; Thu, 04 May 2023 21:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugl5-00069O-7W; Thu, 04 May 2023 21:45:03 +0000
Received: by outflank-mailman (input) for mailman id 530185;
 Thu, 04 May 2023 21:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6+xu=AZ=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pugl4-00069I-2s
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:45:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eab4ca4d-eac4-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 23:45:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-HnOtJYstOJWrNZLz1UfM9w-1; Thu, 04 May 2023 17:44:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994CD85531A;
 Thu,  4 May 2023 21:44:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6800363F3E;
 Thu,  4 May 2023 21:44:43 +0000 (UTC)
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
X-Inumbo-ID: eab4ca4d-eac4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683236698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uQyhS4chih7E8Y8+j3wgbWTkP0aNND6XQO9VSCZB+8=;
	b=QqzhyulZJcSxtO71aQremSieAmDQzt4gL7EOMpT5iWsE0lOr57a7WtYA48cWkyVl6+ole/
	wcxoRjau6hBoubpbUEuPksBmzeyFe82LaFjoVMzpC+SSGc/PH5ceIIg2FXiCgBskq9Ki3p
	+JsJXhTSz3yEFRUftZpEuW6/StVUZsY=
X-MC-Unique: HnOtJYstOJWrNZLz1UfM9w-1
Date: Thu, 4 May 2023 23:44:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 00/21] block: remove aio_disable_external() API
Message-ID: <ZFQnSjGiEWuSFWTh@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> v5:
> - Use atomic accesses for in_flight counter in vhost-user-server.c [Kevin]
> - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET event
>   before unrealizing the SCSIDevice [Kevin]
> - Keep vhost-user-blk export .detach() callback so ctx is set to NULL [Kevin]
> - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} callbacks from
>   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> - Include Kevin's "block: Fix use after free in blockdev_mark_auto_del()" to
>   fix a latent bug that was exposed by this series

I only just finished reviewing v4 when you had already sent v5, but it
hadn't arrived yet. I had a few more comments on what are now patches
17, 18, 19 and 21 in v5. I think they all still apply.

Kevin


