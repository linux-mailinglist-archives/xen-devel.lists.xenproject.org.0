Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A549E88B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261666.453250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Ij-0006C2-33; Thu, 27 Jan 2022 17:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261666.453250; Thu, 27 Jan 2022 17:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Ii-000699-Vd; Thu, 27 Jan 2022 17:11:12 +0000
Received: by outflank-mailman (input) for mailman id 261666;
 Thu, 27 Jan 2022 17:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoeX=SL=redhat.com=snitzer@srs-se1.protection.inumbo.net>)
 id 1nD8Ih-000690-E1
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:11:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f12f973-7f94-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 18:11:10 +0100 (CET)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-3NJ8pzutNG6bGdvbnKgABg-1; Thu, 27 Jan 2022 12:11:08 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 i26-20020a05620a075a00b0047ec29823c0so2854043qki.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 09:11:08 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52])
 by smtp.gmail.com with ESMTPSA id h6sm1661870qtx.43.2022.01.27.09.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:11:06 -0800 (PST)
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
X-Inumbo-ID: 1f12f973-7f94-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
	b=T+O7ZF/7JwGOGUIvTZg6eaQYi/o72n7QCPHbJSfgPmX6HDEXWnmZUPSVEdm8lDarNlmoJQ
	GhtzkmbItddRzZOso6KBieqZ7OBdv9/4kj0uaa5kTqtOwbux3JqkjCuyDbpdZkqKk5FAVM
	VrNTQbAElD3bR/3I/u1QNS555vRbMQw=
X-MC-Unique: 3NJ8pzutNG6bGdvbnKgABg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
        b=cNz83ebMVJDKka7OtkmkKjcypKnZWbrvxcoo2mbbJmRo4e1NRqAvPoKSE0Y+RBgfwG
         hsztCp/9Rtq1j5Gg7mg6vg1tz0/pE0zt2rblHh3P7paIun2A0N0rNXSSlBPJmxxM5KIL
         jvamVmcorr37AscJRpw/TraoDgT3sI+aQ6AoVxSY3i6al887cb/xMe0aDGokZ5f28zRh
         /Ejd/P+0l5317Pm90tyfvj8QGv7HjpqPYL/T3ylWxwGWaE6JVQWcv3N9jxDx8BZpv9H8
         W7dnvhj432qREY4n93PMP/U4nXPg1tp1SYRQrnVp2EZXwqS3P/rgSksVibCVcKNdt+4e
         tBmg==
X-Gm-Message-State: AOAM531MkI0SpZgOfgp9pVnzsYBj/prLEIzJQ3PJegnMPxe/MyYH6tyk
	9AtZRGilpecyaU2PWDf/dR1Ih/5JJYJWZdtOQeCTWktJ6a9gHhB7ReAgOYkhrXoBO6qgHkJSCWJ
	rkLgN7BDeCJdRaTZMS55YdwrIqw==
X-Received: by 2002:a05:6214:c2a:: with SMTP id a10mr4419652qvd.42.1643303467584;
        Thu, 27 Jan 2022 09:11:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQanMj7Y00ur/yzuLmY8gwfKPDXJeoixdwOU4KzNAVApl7lAtazZ8/rD9LIFjZrTulwd1nlg==
X-Received: by 2002:a05:6214:c2a:: with SMTP id a10mr4419637qvd.42.1643303467335;
        Thu, 27 Jan 2022 09:11:07 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:06 -0500
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
Subject: Re: [PATCH 07/19] dm-snap: use blkdev_issue_flush instead of open
 coding it
Message-ID: <YfLSKlF89y3Cbf+S@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-8-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct dm_snapshot.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>


