Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB3809E79
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 09:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650428.1015934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWVz-0007fT-2S; Fri, 08 Dec 2023 08:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650428.1015934; Fri, 08 Dec 2023 08:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWVy-0007do-Vv; Fri, 08 Dec 2023 08:47:18 +0000
Received: by outflank-mailman (input) for mailman id 650428;
 Fri, 08 Dec 2023 08:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qEM7=HT=redhat.com=rjones@srs-se1.protection.inumbo.net>)
 id 1rBWVx-0007di-J5
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 08:47:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 625ddd7b-95a6-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 09:47:15 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Be8SVf9tMhmpLuV9zMNIHQ-1; Fri, 08 Dec 2023 03:47:09 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0AE985CEE5;
 Fri,  8 Dec 2023 08:47:08 +0000 (UTC)
Received: from localhost (unknown [10.42.28.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFAE6492BE6;
 Fri,  8 Dec 2023 08:47:08 +0000 (UTC)
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
X-Inumbo-ID: 625ddd7b-95a6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702025234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpJIDDxc9S/Oco94xRscgYkswaHQndmc7Po28fvIRaM=;
	b=RJa1Jxwvauj8MthslqUpJVvLGtGTCcf67VgUk2QlbqkE5w/OLTRhwl1VmveawZFsy09svc
	uX5/syUzzYb0kheu0e0CcPRY/WPkCAy0EXeIh5diodCSr/guFWwhNDoXNnJS6Ndg+qkk78
	0wvfB2Vo/7a9RZTptPSXp238IKFFzic=
X-MC-Unique: Be8SVf9tMhmpLuV9zMNIHQ-1
Date: Fri, 8 Dec 2023 08:47:07 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Message-ID: <20231208084707.GA23257@redhat.com>
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

(Adding Xen maintainers)

On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> with errors like
> ../hw/arm/xen_arm.c:74:5: error: ‘GUEST_VIRTIO_MMIO_SPI_LAST’ undeclared (first use in this function)
>    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> as there is an incorrect comparision in include/hw/xen/xen_native.h
> which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> aren't being defined for xen-4.18.0
> 
> Signed-off-by: Michael Young <m.a.young@durham.ac.uk>

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

> ---
>  include/hw/xen/xen_native.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> index 6f09c48823..04b1ef4d34 100644
> --- a/include/hw/xen/xen_native.h
> +++ b/include/hw/xen/xen_native.h
> @@ -532,7 +532,7 @@ static inline int xendevicemodel_set_irq_level(xendevicemodel_handle *dmod,
>  }
>  #endif
>  
> -#if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41700
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 41700
>  #define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
>  #define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
>  #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> -- 
> 2.43.0
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


