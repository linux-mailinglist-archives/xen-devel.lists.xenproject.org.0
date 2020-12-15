Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03B2DACC2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53124.92709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9CI-0003r4-6J; Tue, 15 Dec 2020 12:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53124.92709; Tue, 15 Dec 2020 12:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9CI-0003qf-3E; Tue, 15 Dec 2020 12:12:54 +0000
Received: by outflank-mailman (input) for mailman id 53124;
 Tue, 15 Dec 2020 12:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sb05=FT=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kp9CH-0003qa-Be
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 12:12:53 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e2194ff-25f3-4905-8daf-c337e1419cc2;
 Tue, 15 Dec 2020 12:12:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-DEshVlCCPQyfZLbZd14zsA-1; Tue, 15 Dec 2020 07:12:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB0E107ACE8;
 Tue, 15 Dec 2020 12:12:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22F819C44;
 Tue, 15 Dec 2020 12:12:34 +0000 (UTC)
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
X-Inumbo-ID: 1e2194ff-25f3-4905-8daf-c337e1419cc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608034371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=45SVj6ixW5BIwfPuD+NTgrB4YHCHNS+cRbjYLlCLdog=;
	b=bWZW8y9vqINuSHIE7ENz+xNkfRCMbSLg1e+CKvyDOe1kzsb30r+LAmloVqmLcjjeEf78co
	oicfYh+Ecd89iJasNRhwFx6dqHRPRZ4LNZHVRCq8m19mTcpIXlOmOgMEgZANT3rHIU9dyh
	5yYEiUrVTxM/faCdbMNwp+fVwGQH46Y=
X-MC-Unique: DEshVlCCPQyfZLbZd14zsA-1
Date: Tue, 15 Dec 2020 13:12:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201215121233.GD8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> While processing the parents of a BDS, one of the parents may process
> the child that's doing the tail recursion, which leads to a BDS being
> processed twice. This is especially problematic for the aio_notifiers,
> as they might attempt to work on both the old and the new AIO
> contexts.
> 
> To avoid this, add the BDS pointer to the ignore list, and check the
> child BDS pointer while iterating over the children.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/

What is the specific scenario where you saw this breaking? Did you have
multiple BdrvChild connections between two nodes so that we would go to
the parent node through one and then come back to the child node through
the other?

Maybe if what we really need to do is not processing every edge once,
but processing every node once, the list should be changed to contain
_only_ BDS objects. But then blk_do_set_aio_context() probably won't
work any more because it can't have blk->root ignored any more...

Anyway, if we end up changing what the list contains, the comment needs
an update, too. Currently it says:

 * @ignore will accumulate all visited BdrvChild object. The caller is
 * responsible for freeing the list afterwards.

Another option: Split the parents QLIST_FOREACH loop in two. First add
all parent BdrvChild objects to the ignore list, remember which of them
were newly added, and only after adding all of them call
child->klass->set_aio_ctx() for each parent that was previously not on
the ignore list. This will avoid that we come back to the same node
because all of its incoming edges are ignored now.

Kevin

>  block.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index f1cedac362..bc8a66ab6e 100644
> --- a/block.c
> +++ b/block.c
> @@ -6465,12 +6465,17 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>      bdrv_drained_begin(bs);
>  
>      QLIST_FOREACH(child, &bs->children, next) {
> -        if (g_slist_find(*ignore, child)) {
> +        if (g_slist_find(*ignore, child) || g_slist_find(*ignore, child->bs)) {
>              continue;
>          }
>          *ignore = g_slist_prepend(*ignore, child);
>          bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
>      }
> +    /*
> +     * Add a reference to this BS to the ignore list, so its
> +     * parents won't attempt to process it again.
> +     */
> +    *ignore = g_slist_prepend(*ignore, bs);
>      QLIST_FOREACH(child, &bs->parents, next_parent) {
>          if (g_slist_find(*ignore, child)) {
>              continue;
> -- 
> 2.26.2
> 


