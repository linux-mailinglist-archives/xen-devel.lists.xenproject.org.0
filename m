Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78752D5A5
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333000.556776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgrE-0001O3-TF; Thu, 19 May 2022 14:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333000.556776; Thu, 19 May 2022 14:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgrE-0001KY-PT; Thu, 19 May 2022 14:10:28 +0000
Received: by outflank-mailman (input) for mailman id 333000;
 Thu, 19 May 2022 14:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R9RL=V3=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1nrgrC-0001KS-J0
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:10:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6caae4f6-d77d-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 16:10:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-ODLQJ5aDPW-6zvVOsjDIJQ-1; Thu, 19 May 2022 10:10:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F591C08968;
 Thu, 19 May 2022 14:10:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 342BE400E115;
 Thu, 19 May 2022 14:10:18 +0000 (UTC)
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
X-Inumbo-ID: 6caae4f6-d77d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652969423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N8kGEbTrTEeHt4NwMjp2TuqdkAELMIVAn53F1kvMq94=;
	b=ZEFG+x7IZSLbekc8T4tz5osOUuEXPzqHF+5LCgLksDDXq5e22Dfe7ILKqxl6nkHfDm3k/L
	Q5EkUMT34ZVy9VLa5MUiAzNC/w/71w5hIgMQshZLjLZBdsf9wrk6rZE4BCumqa750Xr5e/
	ETNGhqv0Rxt6va4qSKnaXJQGTWD+Rh0=
X-MC-Unique: ODLQJ5aDPW-6zvVOsjDIJQ-1
Date: Thu, 19 May 2022 09:10:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
Message-ID: <20220519141017.3xkntu4x7yslgpge@redhat.com>
References: <20220518130945.2657905-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2

On Wed, May 18, 2022 at 02:09:45PM +0100, Stefan Hajnoczi wrote:
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
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


