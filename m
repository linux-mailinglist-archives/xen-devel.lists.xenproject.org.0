Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BC780EF7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586396.917626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1GL-0000oz-IC; Fri, 18 Aug 2023 15:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586396.917626; Fri, 18 Aug 2023 15:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1GL-0000le-Eo; Fri, 18 Aug 2023 15:19:45 +0000
Received: by outflank-mailman (input) for mailman id 586396;
 Fri, 18 Aug 2023 15:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tvj9=ED=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qX1GJ-0000lR-Bs
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:19:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b38e55-3dda-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 17:19:41 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-VpOQ1T_ZOICmNKsOMHtpTw-1; Fri, 18 Aug 2023 11:19:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3D7585CBE0;
 Fri, 18 Aug 2023 15:19:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B4040C207B;
 Fri, 18 Aug 2023 15:19:32 +0000 (UTC)
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
X-Inumbo-ID: a6b38e55-3dda-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692371980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gFBq2wGBBrUe8nXH4yL+5rM1n+MrJZ5UlGLmB9Nu/Mc=;
	b=ZvZEXpuLkph063ujhWws3Boxk0E2snwvaSd1wwWSVU4pw/JsLoXBe9XHRBRES3kNFI+AMj
	yO8nYwotGZdHyyo21fe/eqCPDPkggF5vvS9kgj9LMJZfGD0YWahWhaZAWdtawCT11nMPe0
	ppu3EQ4ysjHx6VXlXnS+4MZfjJq4W14=
X-MC-Unique: VpOQ1T_ZOICmNKsOMHtpTw-1
Date: Fri, 18 Aug 2023 10:19:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	Anthony Perard <anthony.perard@citrix.com>, Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Julia Suvorova <jusual@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Ilya Maximets <i.maximets@ovn.org>
Subject: Re: [PATCH v2 4/4] virtio-blk: remove batch notification BH
Message-ID: <em632jvoci4rz6vmexpvn2lk6a74mnguxib5znlneyyw7xceip@75mou55janlx>
References: <20230817155847.3605115-1-stefanha@redhat.com>
 <20230817155847.3605115-5-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817155847.3605115-5-stefanha@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

On Thu, Aug 17, 2023 at 11:58:47AM -0400, Stefan Hajnoczi wrote:
> There is a batching mechanism for virtio-blk Used Buffer Notifications
> that is no longer needed because the previous commit added batching to
> virtio_notify_irqfd().
> 
> Note that this mechanism was rarely used in practice because it is only
> enabled when EVENT_IDX is not negotiated by the driver. Modern drivers
> enable EVENT_IDX.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 48 +--------------------------------
>  1 file changed, 1 insertion(+), 47 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


