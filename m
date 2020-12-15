Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75362DB02C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 16:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54329.94326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCLa-0004OH-Af; Tue, 15 Dec 2020 15:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54329.94326; Tue, 15 Dec 2020 15:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCLa-0004Ns-7F; Tue, 15 Dec 2020 15:34:42 +0000
Received: by outflank-mailman (input) for mailman id 54329;
 Tue, 15 Dec 2020 15:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sb05=FT=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kpCLY-0004Nn-2D
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:34:40 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0313667e-2a1d-4491-8ab0-c5aa8646a448;
 Tue, 15 Dec 2020 15:34:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-mB2UIrCmOIiyNDQ8CYSesw-1; Tue, 15 Dec 2020 10:34:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13D2F81CB08;
 Tue, 15 Dec 2020 15:34:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E72060854;
 Tue, 15 Dec 2020 15:34:07 +0000 (UTC)
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
X-Inumbo-ID: 0313667e-2a1d-4491-8ab0-c5aa8646a448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608046477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JGAmSk/5NnCmnaOU3RbF+dwSsWHRiNNwBCIq+AYP6jw=;
	b=PhE6w4KWWN2LfiRWpdmF+aJF6pN0oNjuQs+Ftei7VZ7CYlEqZx3OGj9yzdrDajjRbYZX+I
	3kUq3GrHhVbAiSlTST91eZlcy3NlLDNrjGtLadOMQ5KTC4vXfSXWxI8hG/hnCtB8we2qOS
	1PGWLSwDmRDAJNtxIFEx2Na97jknEpw=
X-MC-Unique: mB2UIrCmOIiyNDQ8CYSesw-1
Date: Tue, 15 Dec 2020 16:34:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 4/4] block: Close block exports in two steps
Message-ID: <20201215153405.GF8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-5-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-5-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> There's a cross-dependency between closing the block exports and
> draining the block layer. The latter needs that we close all export's
> client connections to ensure they won't queue more requests, but the
> exports may have coroutines yielding in the block layer, which implies
> they can't be fully closed until we drain it.

A coroutine that yielded must have some way to be reentered. So I guess
the quesiton becomes why they aren't reentered until drain. We do
process events:

    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));

So in theory, anything that would finalise the block export closing
should still execute.

What is the difference that drain makes compared to a simple
AIO_WAIT_WHILE, so that coroutine are reentered during drain, but not
during AIO_WAIT_WHILE?

This is an even more interesting question because the NBD server isn't a
block node nor a BdrvChildClass implementation, so it shouldn't even
notice a drain operation.

Kevin

> To break this cross-dependency, this change adds a "bool wait"
> argument to blk_exp_close_all() and blk_exp_close_all_type(), so
> callers can decide whether they want to wait for the exports to be
> fully quiesced, or just return after requesting them to shut down.
> 
> Then, in bdrv_close_all we make two calls, one without waiting to
> close all client connections, and another after draining the block
> layer, this time waiting for the exports to be fully quiesced.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  block.c                   | 20 +++++++++++++++++++-
>  block/export/export.c     | 10 ++++++----
>  blockdev-nbd.c            |  2 +-
>  include/block/export.h    |  4 ++--
>  qemu-nbd.c                |  2 +-
>  stubs/blk-exp-close-all.c |  2 +-
>  6 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/block.c b/block.c
> index bc8a66ab6e..41db70ac07 100644
> --- a/block.c
> +++ b/block.c
> @@ -4472,13 +4472,31 @@ static void bdrv_close(BlockDriverState *bs)
>  void bdrv_close_all(void)
>  {
>      assert(job_next(NULL) == NULL);
> -    blk_exp_close_all();
> +
> +    /*
> +     * There's a cross-dependency between closing the block exports and
> +     * draining the block layer. The latter needs that we close all export's
> +     * client connections to ensure they won't queue more requests, but the
> +     * exports may have coroutines yielding in the block layer, which implies
> +     * they can't be fully closed until we drain it.
> +     *
> +     * Make a first call to close all export's client connections, without
> +     * waiting for each export to be fully quiesced.
> +     */
> +    blk_exp_close_all(false);
>  
>      /* Drop references from requests still in flight, such as canceled block
>       * jobs whose AIO context has not been polled yet */
>      bdrv_drain_all();
>  
>      blk_remove_all_bs();
> +
> +    /*
> +     * Make a second call to shut down the exports, this time waiting for them
> +     * to be fully quiesced.
> +     */
> +    blk_exp_close_all(true);
> +
>      blockdev_close_all_bdrv_states();
>  
>      assert(QTAILQ_EMPTY(&all_bdrv_states));
> diff --git a/block/export/export.c b/block/export/export.c
> index bad6f21b1c..0124ebd9f9 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -280,7 +280,7 @@ static bool blk_exp_has_type(BlockExportType type)
>  }
>  
>  /* type == BLOCK_EXPORT_TYPE__MAX for all types */
> -void blk_exp_close_all_type(BlockExportType type)
> +void blk_exp_close_all_type(BlockExportType type, bool wait)
>  {
>      BlockExport *exp, *next;
>  
> @@ -293,12 +293,14 @@ void blk_exp_close_all_type(BlockExportType type)
>          blk_exp_request_shutdown(exp);
>      }
>  
> -    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
> +    if (wait) {
> +        AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
> +    }
>  }
>  
> -void blk_exp_close_all(void)
> +void blk_exp_close_all(bool wait)
>  {
> -    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX);
> +    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX, wait);
>  }
>  
>  void qmp_block_export_add(BlockExportOptions *export, Error **errp)
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index d8443d235b..d71d4da7c2 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -266,7 +266,7 @@ void qmp_nbd_server_stop(Error **errp)
>          return;
>      }
>  
> -    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD);
> +    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD, true);
>  
>      nbd_server_free(nbd_server);
>      nbd_server = NULL;
> diff --git a/include/block/export.h b/include/block/export.h
> index 7feb02e10d..71c25928ce 100644
> --- a/include/block/export.h
> +++ b/include/block/export.h
> @@ -83,7 +83,7 @@ BlockExport *blk_exp_find(const char *id);
>  void blk_exp_ref(BlockExport *exp);
>  void blk_exp_unref(BlockExport *exp);
>  void blk_exp_request_shutdown(BlockExport *exp);
> -void blk_exp_close_all(void);
> -void blk_exp_close_all_type(BlockExportType type);
> +void blk_exp_close_all(bool wait);
> +void blk_exp_close_all_type(BlockExportType type, bool wait);
>  
>  #endif
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index a7075c5419..928f4466f6 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -1122,7 +1122,7 @@ int main(int argc, char **argv)
>      do {
>          main_loop_wait(false);
>          if (state == TERMINATE) {
> -            blk_exp_close_all();
> +            blk_exp_close_all(true);
>              state = TERMINATED;
>          }
>      } while (state != TERMINATED);
> diff --git a/stubs/blk-exp-close-all.c b/stubs/blk-exp-close-all.c
> index 1c71316763..ecd0ce611f 100644
> --- a/stubs/blk-exp-close-all.c
> +++ b/stubs/blk-exp-close-all.c
> @@ -2,6 +2,6 @@
>  #include "block/export.h"
>  
>  /* Only used in programs that support block exports (libblockdev.fa) */
> -void blk_exp_close_all(void)
> +void blk_exp_close_all(bool wait)
>  {
>  }
> -- 
> 2.26.2
> 


