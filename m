Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183670F17C
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538896.839249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kEb-0000NQ-5S; Wed, 24 May 2023 08:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538896.839249; Wed, 24 May 2023 08:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kEb-0000LK-1R; Wed, 24 May 2023 08:52:41 +0000
Received: by outflank-mailman (input) for mailman id 538896;
 Wed, 24 May 2023 08:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1kEa-0000Ky-0r
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:52:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b02e66-fa10-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:52:39 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-NzXqVvZhNByjNFXUNYOTFQ-1; Wed, 24 May 2023 04:52:34 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f60911a417so2638465e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:52:34 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0ac800b003f4285629casm1515371wmr.42.2023.05.24.01.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:52:32 -0700 (PDT)
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
X-Inumbo-ID: 55b02e66-fa10-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684918358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kcVMQ7kvj0Iz6K5ZAjc8mmj/6YQBshqNuaYR17461o=;
	b=hgGcRmNAlUBciCHcGzA5HuoKMZYIbdmOU/NkprZKd7/QpBd8Tk7pUwjMSf+d0w8lGcCi/K
	O3Z6Nc89x8i5lM7UJaV3hLpdWI/oGWNjr6e8PP0O7zl5KL4sUzIDH8/h4NtaIWOjOGogPu
	QeTW8Q+MYI8kJsVSYbCgvAL71suW/zI=
X-MC-Unique: NzXqVvZhNByjNFXUNYOTFQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918353; x=1687510353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kcVMQ7kvj0Iz6K5ZAjc8mmj/6YQBshqNuaYR17461o=;
        b=Kk6P9VTemsx+snlZ9wyTf5Da4h/YGdR41yJsIqmYHkU87E2TfY6qd5xWFSqRYlUw7U
         EaKXH65VqpGe2rQxJCpBWtEc2TjZgcLiGfk/fxMM261eRDgaNBQZnuRmMNbi9r/AnUoA
         a5kaoFisWwriOHh44oGgKK9SvvzUNA6DpFdTVDt+4bdZpA7xKcC0NBQlT7u1JD1eWTey
         FRsTTOMRj4puquTxFv5G3pDrip6VmBiCz8gITUZc2ESE9VR2JytiACDVvS8q9A63SGXA
         DuV+s8xtqAeAHc3DqaCMrrwPgsVltQGR/3+Q/kAh1qcWZ21Ue8ZxTtjMS9z54VuKWknF
         igTQ==
X-Gm-Message-State: AC+VfDxNMIUZXM/4lVH0M620KLiJrq3uYX+9tPqNK84dltpgRSmhK4ir
	x/mnHH1XqEQDyBiEHXskn2JC6Ie7O3/KoVTKFdqgEfw55D1R8NUUHW8tPn2Bn0f1+29IkSRJvZH
	2neMbQp7Oo0kNVuSifQXGPcYE6iQ=
X-Received: by 2002:a7b:cd8a:0:b0:3f6:a66:a372 with SMTP id y10-20020a7bcd8a000000b003f60a66a372mr3673523wmj.1.1684918353366;
        Wed, 24 May 2023 01:52:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TQg7OL7OGuh6V7LESCC2zr/IQghY3wNUBo+TQKydHcYVu7y54l8KC2f19D6VPXvGmoMotOg==
X-Received: by 2002:a7b:cd8a:0:b0:3f6:a66:a372 with SMTP id y10-20020a7bcd8a000000b003f60a66a372mr3673507wmj.1.1684918353149;
        Wed, 24 May 2023 01:52:33 -0700 (PDT)
Date: Wed, 24 May 2023 10:52:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 6/6] block: remove bdrv_co_io_plug() API
Message-ID: <yosdxsqcqcj4utt4dwmfgfdsgnmduu6avjc7wrd33bxzs3vds4@wossen4sa7ve>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-7-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-7-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:13:00PM -0400, Stefan Hajnoczi wrote:
>No block driver implements .bdrv_co_io_plug() anymore. Get rid of the
>function pointers.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
> include/block/block-io.h         |  3 ---
> include/block/block_int-common.h | 11 ----------
> block/io.c                       | 37 --------------------------------
> 3 files changed, 51 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


