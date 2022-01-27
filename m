Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4649E896
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261670.453261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8JG-0006jk-Dm; Thu, 27 Jan 2022 17:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261670.453261; Thu, 27 Jan 2022 17:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8JG-0006hJ-95; Thu, 27 Jan 2022 17:11:46 +0000
Received: by outflank-mailman (input) for mailman id 261670;
 Thu, 27 Jan 2022 17:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoeX=SL=redhat.com=snitzer@srs-se1.protection.inumbo.net>)
 id 1nD8JF-0006cx-Il
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:11:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a248b6-7f94-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 18:11:44 +0100 (CET)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-zrwZWRM7P4S01hhQ_Am24A-1; Thu, 27 Jan 2022 12:11:42 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 a127-20020a37b185000000b004789e386256so2851887qkf.8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 09:11:42 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52])
 by smtp.gmail.com with ESMTPSA id w8sm119796qti.21.2022.01.27.09.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:11:41 -0800 (PST)
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
X-Inumbo-ID: 33a248b6-7f94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
	b=LN8FAamK45sm6noJKUN6tg+JuKEjFXTHjCz0Gz3hQXd7xEnG8vCRHb6CYG8/0sito9KieR
	EoA3uFroRZoPvlL+SDdS4cbDbrpWlWUd6YK5HZdf/U3wzh4GlyqcSS/9tB/oQEndPVNawx
	37imUkamyk+Z/2GOH1G55UuYiAToeOc=
X-MC-Unique: zrwZWRM7P4S01hhQ_Am24A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
        b=i0AGaALR64Rz/J4cgq0x0M8XciwHId0mkXXWw7GkbcY7px6G4NSd89rW6AWf4eB1vl
         Ys8fkYg+1LWwqMZVTKqMbZq4wmSQJk7/N+QiKY+vyvhOnxd0KzRPswh/U7ViF/gHNVlb
         n3/K+hWhAkJiB8F9Qp9lNI3XBlMyLk0RcxgPyGSNpA6kV6hEyQwPMtEUfztAg7t7a+2p
         h2dpD9SoKzzHY4U4BGcr5y6mscdfDj9OHVlO7fSMUIro6LqLl8ZOwbIIMQmB1PqVm8uU
         u449gDXnPhSZJ4xVqntIoImRLBUYQ8JlewezcVeT6GFHQrmn4yKAwpMi1rkMaxI4bOmQ
         +jKg==
X-Gm-Message-State: AOAM530w0sGN+INcBVl0ArWpDv1I3io738tdmHDpk/3UScRZIYeLCNGX
	hBw5/ayEIZYHsLXqtldw9fY9XNO5uuV8Zrt49woNpREVhKAdiZUVVsqcMlWwb/Fpm7HRtBIB7FY
	3m94w1OkyfocQZ8dmhuzvgrmeVg==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808178qvb.80.1643303501894;
        Thu, 27 Jan 2022 09:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPCW/ls/HGsD9xe/WMaahh4UjrJsfEVpwqwRI5tHMnXcgyiZLuuvrhgvmY/MRUsNQeYYfvQ==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808154qvb.80.1643303501730;
        Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:40 -0500
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
Subject: Re: [PATCH 08/19] dm-thin: use blkdev_issue_flush instead of open
 coding it
Message-ID: <YfLSTPB7UUZKqQKL@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-9-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>


