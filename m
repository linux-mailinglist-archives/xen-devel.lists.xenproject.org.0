Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745A708CA2
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 02:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536595.835070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzncI-0002qN-VX; Fri, 19 May 2023 00:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536595.835070; Fri, 19 May 2023 00:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzncI-0002oP-Oz; Fri, 19 May 2023 00:05:06 +0000
Received: by outflank-mailman (input) for mailman id 536595;
 Fri, 19 May 2023 00:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I2Cg=BI=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1pzncG-0002oJ-TL
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 00:05:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc6634c7-f5d8-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 02:05:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Ql_NEbjYM2m2kNrCkzuzAg-1; Thu, 18 May 2023 20:04:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75D80185A790;
 Fri, 19 May 2023 00:04:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 811342026D25;
 Fri, 19 May 2023 00:04:54 +0000 (UTC)
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
X-Inumbo-ID: cc6634c7-f5d8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684454700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1bW03zBeN+IDObTz00Q0SyhMk0VOr4i17hlQ4QvYdg=;
	b=XNsg5tjHCKtRzRepCzd339kPCJ3A5bJljLlFNarEf6rO53B6hMQYg6zjJIe3vZs4lFyY5V
	2kWHlf5ELqK2BRTzCCmjuicQD8HwbhnmDfPcsT4b85VFunGisAON1viNdrt/c4dg8cVPEl
	NSEYFPgw9aqNCH0xD6fN0R8YXqyVy3k=
X-MC-Unique: Ql_NEbjYM2m2kNrCkzuzAg-1
Date: Thu, 18 May 2023 19:04:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: add blk_io_plug_call() API
Message-ID: <7bsmwvpfmf6kelaxv32p6nhqcx2f2um2vqhvhu6uw5cooztrhe@oijddrxc2ysx>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517221022.325091-2-stefanha@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Wed, May 17, 2023 at 06:10:17PM -0400, Stefan Hajnoczi wrote:
> Introduce a new API for thread-local blk_io_plug() that does not
> traverse the block graph. The goal is to make blk_io_plug() multi-queue
> friendly.
> 
> Instead of having block drivers track whether or not we're in a plugged
> section, provide an API that allows them to defer a function call until
> we're unplugged: blk_io_plug_call(fn, opaque). If blk_io_plug_call() is
> called multiple times with the same fn/opaque pair, then fn() is only
> called once at the end of the function - resulting in batching.
> 
> This patch introduces the API and changes blk_io_plug()/blk_io_unplug().
> blk_io_plug()/blk_io_unplug() no longer require a BlockBackend argument
> because the plug state is now thread-local.
> 
> Later patches convert block drivers to blk_io_plug_call() and then we
> can finally remove .bdrv_co_io_plug() once all block drivers have been
> converted.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

> +++ b/block/plug.c
> +
> +/**
> + * blk_io_plug_call:
> + * @fn: a function pointer to be invoked
> + * @opaque: a user-defined argument to @fn()
> + *
> + * Call @fn(@opaque) immediately if not within a blk_io_plug()/blk_io_unplug()
> + * section.
> + *
> + * Otherwise defer the call until the end of the outermost
> + * blk_io_plug()/blk_io_unplug() section in this thread. If the same
> + * @fn/@opaque pair has already been deferred, it will only be called once upon
> + * blk_io_unplug() so that accumulated calls are batched into a single call.
> + *
> + * The caller must ensure that @opaque is not be freed before @fn() is invoked.

s/be //

> + */
> +void blk_io_plug_call(void (*fn)(void *), void *opaque)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


