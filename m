Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6D532A91
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 14:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336540.560880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntTsr-0004Fy-3u; Tue, 24 May 2022 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336540.560880; Tue, 24 May 2022 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntTsr-0004DE-10; Tue, 24 May 2022 12:43:33 +0000
Received: by outflank-mailman (input) for mailman id 336540;
 Tue, 24 May 2022 12:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Jap=WA=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1ntTsp-0004Cy-MY
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 12:43:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c7c044e-db5f-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 14:43:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-xJjodX4yMc-LC26ReejQ4A-1; Tue, 24 May 2022 08:43:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D978041A1;
 Tue, 24 May 2022 12:43:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D4841410DD5;
 Tue, 24 May 2022 12:43:21 +0000 (UTC)
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
X-Inumbo-ID: 1c7c044e-db5f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653396208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvjonPMdU3Q2Eys184azXHIieZoVxARFVSVOm508iYw=;
	b=SKklheyTcLq1hOwqOobpWD/IbevuLhHfMiM6b2mJM69moMLWwjTaDuXcdfAX4gGKsPrvyL
	GHI1OsJgFt5288Biz1vm7/Iou2Bfp8zkBseX2jDp4wUEUrnT80UnPzgXi+spLWxijhHYoO
	mVByhiIWqj9kL9pDvfe9V0hKE4JGKiA=
X-MC-Unique: xJjodX4yMc-LC26ReejQ4A-1
Date: Tue, 24 May 2022 14:43:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
	Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
Message-ID: <YozS5C5Y+9NWUUhR@redhat.com>
References: <20220518130945.2657905-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

Am 18.05.2022 um 15:09 hat Stefan Hajnoczi geschrieben:
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
> 
>   At this point, the field is set by the device emulation, but completely
>   ignored by the block layer.
> 
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
> 
> This value has not been used since 2013. Get rid of it.
> 
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin


