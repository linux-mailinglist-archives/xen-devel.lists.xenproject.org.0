Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885970F060
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538829.839099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jch-0006b8-1D; Wed, 24 May 2023 08:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538829.839099; Wed, 24 May 2023 08:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jcg-0006YC-Tz; Wed, 24 May 2023 08:13:30 +0000
Received: by outflank-mailman (input) for mailman id 538829;
 Wed, 24 May 2023 08:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1jcf-0006Xy-1f
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:13:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc68d831-fa0a-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:13:28 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-Sg2ppy_2P6Kiq07pUBPByQ-1; Wed, 24 May 2023 04:13:25 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3095483ea29so211965f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:13:25 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c378b00b003f195d540d9sm1466237wmr.14.2023.05.24.01.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:13:23 -0700 (PDT)
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
X-Inumbo-ID: dc68d831-fa0a-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684916007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pdqRwguXZFLYTV9FtQQFWD/FtkvuQeDoxuRVCDomYds=;
	b=ikeOwOrgm08Zrx0MECdmF7rufVAQt7xFiQvuNy+0qg0kmmjXGc4j7EvVCwcoFs25Kud2tN
	VFq6lD18kqJPYLyCykOnBgUK7Fw4wGHwMHcSs5hkkqbKiGRE/JXb9dBq38wi0wO7iH+By/
	FZgaLouB9kR4g2uqxqOY3athh7LyPHA=
X-MC-Unique: Sg2ppy_2P6Kiq07pUBPByQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916004; x=1687508004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdqRwguXZFLYTV9FtQQFWD/FtkvuQeDoxuRVCDomYds=;
        b=U09YoVqh6lDUN6/VGtu8Sehqh+05xKXIe8vPySD6GWXP2NqM6e8lZNrSLAoFr2CwcY
         U2d//4huOEGnrI1eg06cnbdDhrJidrr4LeccZs8ZO/Fdwi49quezc8dmAZTfAC7kUgmX
         Hl5drSs15hiw82jryucqR9fIsw9NfX85wmpgIdDKbik7Tn0nQb5SueOGItOsVl3Jm1Wr
         P0tCBTVMZAm08bt97WQH8YJlpn4GxoxBtY571nJvGbUlqiymJ8n1O7tZjwfjLAodx/dv
         1avUkwXmqCu1cRFXU1x7COKj0E9jce3kdnBCMC8WjAVfdKTyJ2mjvuyBkB5/BWy7AvoC
         BbPQ==
X-Gm-Message-State: AC+VfDxjcus0rJGtv8Qb+bJCjyKIS5cAQjHHn7TPvH4puUz8dhGW+ZQG
	y0PZCj2Irr0AA3IXdeGqpnWFI+SulG4+xBouuQ/IlP1qgHJ1NPUFJkZBRUl1Ht3jWvQOExYg2C1
	sEtg0rZbWD7cKUIOW+uvMgHvX5ZA=
X-Received: by 2002:adf:f74a:0:b0:306:342a:6a01 with SMTP id z10-20020adff74a000000b00306342a6a01mr11799940wrp.47.1684916004609;
        Wed, 24 May 2023 01:13:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ZnJ0/K9dDPiC0ZaAZ/7pQ5w7egHROoU20w4IJP/Gip9aXS3+Iv+Josl6t+iFMGZ+1JPC4Zw==
X-Received: by 2002:adf:f74a:0:b0:306:342a:6a01 with SMTP id z10-20020adff74a000000b00306342a6a01mr11799919wrp.47.1684916004329;
        Wed, 24 May 2023 01:13:24 -0700 (PDT)
Date: Wed, 24 May 2023 10:13:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 3/6] block/blkio: convert to blk_io_plug_call() API
Message-ID: <7nq4x6dcajbnjuoytz7g3egfipbq2y5hyadactbco7t4kr6gxt@g37bnv7sijh2>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-4-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-4-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:57PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
>v2
>- Add missing #include and fix blkio_unplug_fn() prototype [Stefano]
>---
> block/blkio.c | 43 ++++++++++++++++++++++++-------------------
> 1 file changed, 24 insertions(+), 19 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


