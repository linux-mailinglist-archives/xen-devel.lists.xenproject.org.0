Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E7708CF0
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 02:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536613.835111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pznzU-00076f-JU; Fri, 19 May 2023 00:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536613.835111; Fri, 19 May 2023 00:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pznzU-00073W-GN; Fri, 19 May 2023 00:29:04 +0000
Received: by outflank-mailman (input) for mailman id 536613;
 Fri, 19 May 2023 00:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I2Cg=BI=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1pznzS-00073Q-PU
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 00:29:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26594b53-f5dc-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 02:29:01 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-tqpyHlUyPEW6dSc08Bg6qg-1; Thu, 18 May 2023 20:28:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35DB0185A7A4;
 Fri, 19 May 2023 00:28:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C9863F5F;
 Fri, 19 May 2023 00:28:54 +0000 (UTC)
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
X-Inumbo-ID: 26594b53-f5dc-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684456140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xeGWmHxXOnaXNqDj+FYNqz1jw8Uegaz/pUc2EBnBJJw=;
	b=Ku/z6UT3zS8cC+WxwXFZYn5o4HCfNwOew+j/3vsBkRzEx8jZvvJlbUfpZO0GhX29RS1KN6
	DkvyTKeKu2WtG99u+kZvDPRj0Ql8zs0Nv4nclUtj9tELS2WGWdBt9CpCTNaCxANyOVpLAr
	AB6sob4ASuXoLEZTlpwO6F6C5scs+34=
X-MC-Unique: tqpyHlUyPEW6dSc08Bg6qg-1
Date: Thu, 18 May 2023 19:28:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 5/6] block/linux-aio: convert to blk_io_plug_call() API
Message-ID: <a5ziex34rcalbgh5bmklgsac7m2yirfbrhjruvzh5nd2h5srt6@gqdom2tnxx3k>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517221022.325091-6-stefanha@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

On Wed, May 17, 2023 at 06:10:21PM -0400, Stefan Hajnoczi wrote:
> Stop using the .bdrv_co_io_plug() API because it is not multi-queue
> block layer friendly. Use the new blk_io_plug_call() API to batch I/O
> submission instead.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/raw-aio.h |  7 -------
>  block/file-posix.c      | 28 ----------------------------
>  block/linux-aio.c       | 41 +++++++++++------------------------------
>  3 files changed, 11 insertions(+), 65 deletions(-)
>

Nice to see that not only is it friendlier to multi-queue, it's also
fewer lines of code.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


