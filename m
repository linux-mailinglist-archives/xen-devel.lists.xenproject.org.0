Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9B49E866
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261658.453227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Ge-0004G7-Ex; Thu, 27 Jan 2022 17:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261658.453227; Thu, 27 Jan 2022 17:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Ge-0004Dg-C0; Thu, 27 Jan 2022 17:09:04 +0000
Received: by outflank-mailman (input) for mailman id 261658;
 Thu, 27 Jan 2022 17:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoeX=SL=redhat.com=snitzer@srs-se1.protection.inumbo.net>)
 id 1nD8Gc-0004DY-OI
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:09:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d21c2c1f-7f93-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 18:09:01 +0100 (CET)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-IHRx5PcGO02aAYTFTYg3kw-1; Thu, 27 Jan 2022 12:08:58 -0500
Received: by mail-qk1-f199.google.com with SMTP id
 b189-20020a3780c6000000b0047b06f34f4cso2801843qkd.17
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 09:08:58 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52])
 by smtp.gmail.com with ESMTPSA id a141sm1694826qkc.73.2022.01.27.09.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:08:57 -0800 (PST)
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
X-Inumbo-ID: d21c2c1f-7f93-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
	b=QU+UARpVft1TH4Ycj9CFqX254OOzM8EVrl3ZtSl6Dm32JTefsVBZbhy/HPfFFespA+mbTR
	N92inGTPutQzpsDrmtG8FbGj739lvdaM7u5zo/Los13xUSThaZNJ09o4q0S2CfBUaczQ+J
	pX2caUc1wui+XiRXE/spsU6KvZ7L4xc=
X-MC-Unique: IHRx5PcGO02aAYTFTYg3kw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
        b=uOm8hPIyNsGPTnnkiH1HtqC61Uee4s/+tvm6Q/XbGf11JX5MgFFiau1Ay6X96AAqX0
         /DCdO8+NF1xcczqycXzppG5PJNyXfJc7XvPF7FNeIxD+Q6MUaHRJSLozDfNj70QH1IyQ
         sALYnl5cszxK0QybKJKzQSw4ZIcAeuldcPm0oGwE9rsCupB0HkKGsDl45he4AhbPlVws
         VTlaOijNi+FPzSwDMnbRR4v5H4gS5ey2QodC7UYyjt14Jc5zEoAmv4Nb2141GRdpdAaQ
         xASk0GSn7xDTvMFyvqcSlFnV1a6D4oAtd05fw3tLXJ8c2LFnH15mJYAqPTKcw+dRCXtW
         EaEg==
X-Gm-Message-State: AOAM533oHJZSwnx4ajNbtWRX0PFAE789z3nlOppn14M228txTfb/dsrn
	qd7SmYcSDo+YW8f4PyFbba7Ra0MJfcktuB5pCHUZn/q9b7VlrQw3nAprAGWyceNp6DvHwqBjYW7
	wOl/DUEBIy9RcE1fkzOYuBJb20Q==
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555329qto.524.1643303338471;
        Thu, 27 Jan 2022 09:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDu0k2yM0Z7B8jNmnNXJFkDazruS7TZzFMNaHKbWmY0JBs9tIC0IfQuLij5Gmty6LtXXG+Yw==
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555294qto.524.1643303338263;
        Thu, 27 Jan 2022 09:08:58 -0800 (PST)
Date: Thu, 27 Jan 2022 12:08:56 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Subject: Re: [PATCH 05/19] dm: bio_alloc can't fail if it is allowed to sleep
Message-ID: <YfLRqCMAhLH8xhDD@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-6-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Remove handling of NULL returns from sleeping bio_alloc calls given that
> those can't fail.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>


