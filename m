Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A180A01C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650532.1016163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXds-00063Q-4D; Fri, 08 Dec 2023 09:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650532.1016163; Fri, 08 Dec 2023 09:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXds-00061F-10; Fri, 08 Dec 2023 09:59:32 +0000
Received: by outflank-mailman (input) for mailman id 650532;
 Fri, 08 Dec 2023 09:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qEM7=HT=redhat.com=rjones@srs-se1.protection.inumbo.net>)
 id 1rBXdq-000619-KS
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:59:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c6ee5a-95b0-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:59:29 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-WeSCDRK4Ni-DyZOFlBW-_A-1; Fri, 08 Dec 2023 04:59:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCAEF83106C;
 Fri,  8 Dec 2023 09:59:25 +0000 (UTC)
Received: from localhost (unknown [10.42.28.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF8C40C6EB9;
 Fri,  8 Dec 2023 09:59:25 +0000 (UTC)
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
X-Inumbo-ID: 79c6ee5a-95b0-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702029568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+KxdY+qCST9E8+OQxXVW2cgeDlhihThVwBNplCEp+Q=;
	b=JAki13Pi5vvgA1BHq+Dqtz88MCSxClDRPz7dEQYiNPXjTL08xqH1p2frnpzsXeVeoxRkD8
	yNKQiFHa2UGWqGClL/nbWHRGPwGodXWtgCZHXmeBvyGPt93iT5pXzqer/dNpYVkO13C3dV
	EnkfDO1qTr8fk+F0SBXDyJ2A4YPhrXE=
X-MC-Unique: WeSCDRK4Ni-DyZOFlBW-_A-1
Date: Fri, 8 Dec 2023 09:59:24 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Message-ID: <20231208095924.GB23257@redhat.com>
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <20231208084707.GA23257@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208084707.GA23257@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

On Fri, Dec 08, 2023 at 08:47:07AM +0000, Richard W.M. Jones wrote:
> (Adding Xen maintainers)
> 
> On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> > with errors like
> > ../hw/arm/xen_arm.c:74:5: error: ‘GUEST_VIRTIO_MMIO_SPI_LAST’ undeclared (first use in this function)
> >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > as there is an incorrect comparision in include/hw/xen/xen_native.h
> > which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> > aren't being defined for xen-4.18.0
> > 
> > Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
> 
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

I added this patch to Fedora, which has Xen 4.18 and where
builds were previously failing, and now it's working:

https://koji.fedoraproject.org/koji/taskinfo?taskID=110043878

So also adding:

Tested-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

> > ---
> >  include/hw/xen/xen_native.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> > index 6f09c48823..04b1ef4d34 100644
> > --- a/include/hw/xen/xen_native.h
> > +++ b/include/hw/xen/xen_native.h
> > @@ -532,7 +532,7 @@ static inline int xendevicemodel_set_irq_level(xendevicemodel_handle *dmod,
> >  }
> >  #endif
> >  
> > -#if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41700
> > +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 41700
> >  #define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> >  #define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> >  #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> libguestfs lets you edit virtual machines.  Supports shell scripting,
> bindings from many languages.  http://libguestfs.org
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


