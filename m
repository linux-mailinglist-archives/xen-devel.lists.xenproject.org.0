Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632D2DAC7B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53111.92691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8yK-0001y6-GG; Tue, 15 Dec 2020 11:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53111.92691; Tue, 15 Dec 2020 11:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8yK-0001xh-Ci; Tue, 15 Dec 2020 11:58:28 +0000
Received: by outflank-mailman (input) for mailman id 53111;
 Tue, 15 Dec 2020 11:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sb05=FT=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kp8yI-0001xc-Ra
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:58:27 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 643bcf3b-e98c-4f86-83e4-897b92f4d13e;
 Tue, 15 Dec 2020 11:58:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-IpJsG-4QN5y60YuRWvO2tg-1; Tue, 15 Dec 2020 06:58:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD3371922961;
 Tue, 15 Dec 2020 11:58:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A94AB10074EF;
 Tue, 15 Dec 2020 11:58:06 +0000 (UTC)
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
X-Inumbo-ID: 643bcf3b-e98c-4f86-83e4-897b92f4d13e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608033504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQncgaDlvRlYMFtHSjAoEgnBxR0gZjfPlDQMbTR0GW8=;
	b=Vtf2QS7zXIeMqfWFTrp3Ypd1Dkn0zi727Ud279DitTMh7Q013ESDBK37hJ6T7ksPzUF568
	y6ew2gI3OguIRSYrtv5J1rtrfeVCwsVyykIS543jK9S+pQ2upRTNb70t/NPkrMm1fjstX1
	HQbAZg7KMSUs4F1eA7hgx5MVWZsZmv0=
X-MC-Unique: IpJsG-4QN5y60YuRWvO2tg-1
Date: Tue, 15 Dec 2020 12:58:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 1/4] block: Honor blk_set_aio_context() context
 requirements
Message-ID: <20201215115804.GC8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-2-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> The documentation for bdrv_set_aio_context_ignore() states this:
> 
>  * The caller must own the AioContext lock for the old AioContext of bs, but it
>  * must not own the AioContext lock for new_context (unless new_context is the
>  * same as the current context of bs).
> 
> As blk_set_aio_context() makes use of this function, this rule also
> applies to it.
> 
> Fix all occurrences where this rule wasn't honored.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


