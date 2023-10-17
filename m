Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F37CC097
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618200.961570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshDA-0007EU-SI; Tue, 17 Oct 2023 10:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618200.961570; Tue, 17 Oct 2023 10:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshDA-0007CA-PV; Tue, 17 Oct 2023 10:22:04 +0000
Received: by outflank-mailman (input) for mailman id 618200;
 Tue, 17 Oct 2023 10:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pfz=F7=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qshD9-00073H-EB
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 10:22:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02aabe38-6cd7-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 12:22:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-XFVKNxzFMCyvX5vRUyqgBQ-1; Tue, 17 Oct 2023 06:21:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D99C41C0BB4B;
 Tue, 17 Oct 2023 10:21:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F17425C8;
 Tue, 17 Oct 2023 10:21:53 +0000 (UTC)
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
X-Inumbo-ID: 02aabe38-6cd7-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697538121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHoeF+Tw+4uA1IH9IkZxlHP/efhEWyeV18C1FTUIP+k=;
	b=gjOAPqI7RmiXFTk1Qb5ySiHOSX/HS3tAyMn2o3Ll9z5RNMlvBVhVQd+eysvjKwStLpNJt3
	5pOXQcTzN7JLF3aTDb0ETvwa1xYSjWcVuOW3qU/hNdPeE1DZpUyxwpUUKw4umuBFBG5ttA
	iRLdS0ZZkSSfbX1kQ/UIk1zvGe8pnW0=
X-MC-Unique: XFVKNxzFMCyvX5vRUyqgBQ-1
Date: Tue, 17 Oct 2023 12:21:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH 11/12] hw/xen: automatically assign device index to block
 devices
Message-ID: <ZS5gQL+KZjxOmUsk@redhat.com>
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-12-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016151909.22133-12-dwmw2@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Am 16.10.2023 um 17:19 hat David Woodhouse geschrieben:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no need to force the user to assign a vdev. We can automatically
> assign one, starting at xvda and searching until we find the first disk
> name that's unused.
> 
> This means we can now allow '-drive if=xen,file=xxx' to work without an
> explicit separate -driver argument, just like if=virtio.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

> @@ -34,6 +34,31 @@ static char *xen_block_get_name(XenDevice *xendev, Error **errp)
>      XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
>      XenBlockVdev *vdev = &blockdev->props.vdev;
>  
> +    if (blockdev->props.vdev.type == XEN_BLOCK_VDEV_TYPE_INVALID) {
> +        char name[11];
> +        int disk = 0;
> +        unsigned long idx;
> +
> +        /* Find an unoccupied device name */
> +        while (disk < (1 << 20)) {

I like your optimism that we can handle a million disks. :-)

I haven't reviewed the Xen part in detail, but the patch looks fine on
the block layer side.

Acked-by: Kevin Wolf <kwolf@redhat.com>


