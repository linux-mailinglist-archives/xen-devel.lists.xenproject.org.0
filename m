Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371270F058
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538825.839089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jad-0005zS-LT; Wed, 24 May 2023 08:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538825.839089; Wed, 24 May 2023 08:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jad-0005xn-Hz; Wed, 24 May 2023 08:11:23 +0000
Received: by outflank-mailman (input) for mailman id 538825;
 Wed, 24 May 2023 08:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1jab-0005xh-MY
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:11:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f8404a3-fa0a-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:11:19 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-ikgPTjepOnaVOThyTc337A-1; Wed, 24 May 2023 04:11:16 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30959544cbdso223068f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:11:16 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adfce8e000000b00306c5900c10sm13683435wrn.9.2023.05.24.01.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:11:14 -0700 (PDT)
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
X-Inumbo-ID: 8f8404a3-fa0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684915878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/7YN0/EgAQNZhcWOzYnQDnc6s/74LmWiJRQZI2Rysc=;
	b=g6atmp3WFlWkhSeqVvj1QRj3Be8+aEeMrcm6KD2cyvmEvZx9f04jWHTkUHuYlhd3gZxM0q
	Xazp+7WVxVofacPeRzGZbo9+Y3CNipmgxQfu9fes74TVD73uuOOi7PYkMYbbry9DyBkwph
	o5vy4gOogqFrexE4GT4tNHfKgdHfMT0=
X-MC-Unique: ikgPTjepOnaVOThyTc337A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684915875; x=1687507875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/7YN0/EgAQNZhcWOzYnQDnc6s/74LmWiJRQZI2Rysc=;
        b=E7HI3zeCO8jinugRpW1f2JGv+Ve7F5NCfeRgVhzfDORiHHE5A7HjSzCcxI2ZnMniTl
         iJwlHE6C0a9mlx1zF4ffgsA1GDyNbPxSZdwBD3QekjJaHlOVEstJxUTsESj2CDLI/Fpi
         xMI3Pu3JTTs3JTJ8ISKiVc7hlgPo3mGMN/pvU5Wm1i0sRBUyicZoGcrAOOrZ1aCwpRJ2
         GUydF0iVesEZAELdNUpp7hYPBhooVKLxx98VOatQDdVki+2gfeqKof+DIOPkZt/4tzdk
         /cbLdxthIHwhmYDqVdcyduUzBKeACD3OlScDj8xT19cSuQLKne6vnM7G3OeLPcsadP5F
         rfqQ==
X-Gm-Message-State: AC+VfDwt42C/O/9gL11nBKgNp98KyHMkgTXDMzF07Fe9ApjZ62WRJuzZ
	LPYrrupOh+8nEKCSf62l/vqQy+NKCqythylOuC9vslm2tvR8oeQUnRhLIz+ZElwn3gLacXlKT6O
	4MqfWIfJsPuHpKCZFCiLK0EyOFx0=
X-Received: by 2002:a5d:5291:0:b0:307:f75:f581 with SMTP id c17-20020a5d5291000000b003070f75f581mr11985751wrv.18.1684915875676;
        Wed, 24 May 2023 01:11:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ577uGe1zMc+ifh7kvZp70XkqxdzoAHp3sJz16D+lvdNzKzMhD8u7jKwCYMRYhN9TscLAWlwA==
X-Received: by 2002:a5d:5291:0:b0:307:f75:f581 with SMTP id c17-20020a5d5291000000b003070f75f581mr11985721wrv.18.1684915875357;
        Wed, 24 May 2023 01:11:15 -0700 (PDT)
Date: Wed, 24 May 2023 10:11:11 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/6] block/nvme: convert to blk_io_plug_call() API
Message-ID: <5xfhgfmpnjorl4fxzm5b7ow2nijsz4qx27otj7d6jgzpca26st@jg3ah6u46cqq>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-3-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:56PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
>v2
>- Remove unused nvme_process_completion_queue_plugged trace event
>  [Stefano]
>---
> block/nvme.c       | 44 ++++++++++++--------------------------------
> block/trace-events |  1 -
> 2 files changed, 12 insertions(+), 33 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


