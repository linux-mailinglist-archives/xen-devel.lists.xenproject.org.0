Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484E49E871
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261662.453238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8HK-0004oQ-Oa; Thu, 27 Jan 2022 17:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261662.453238; Thu, 27 Jan 2022 17:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8HK-0004md-LT; Thu, 27 Jan 2022 17:09:46 +0000
Received: by outflank-mailman (input) for mailman id 261662;
 Thu, 27 Jan 2022 17:09:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoeX=SL=redhat.com=snitzer@srs-se1.protection.inumbo.net>)
 id 1nD8HJ-0004ZA-6q
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:09:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eace3e4f-7f93-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 18:09:43 +0100 (CET)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-vcqnUuqAN4qzlNijow4jkg-1; Thu, 27 Jan 2022 12:09:37 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 iv13-20020ad45ced000000b004248c87cc4cso3750898qvb.10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 09:09:37 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52])
 by smtp.gmail.com with ESMTPSA id i8sm1628636qti.52.2022.01.27.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:09:36 -0800 (PST)
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
X-Inumbo-ID: eace3e4f-7f93-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
	b=iqZwwK30l7CDia1+L6TyOX78TJGh777QRB7HIqQCgyBv2L68CLt4FXEBkuy9Eu2uBf8uV5
	QT1RNH9hptiXMInzgIqbnfWB9aj+Mu9pqkX9ntG7/TWIM+/Ffqvyweq73ETk4A5QybIiGB
	CiGgb7wr5SfeI0CpBNG+8U/3Oce9ZOc=
X-MC-Unique: vcqnUuqAN4qzlNijow4jkg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
        b=Gb7uOtbah0rJl37WBGqf4yLNC/j6vtvDhSTNDJkB52p3HRF6nO3NAJqtItBA4gRoZd
         gUsExzphGf5r7FRCiamLd71auuYbDZDppP8Zm9ZKOBvDR3RD4swi21Drf5rGaHctMkyq
         8y8eSIdVF1ziUBhyyfBJyryobKWSMdQaBKbGrV+wREL7ZdO2on1X6VcJORbV5/mPq4SD
         MhU4Euhm3kYx3gwGMDAlLdEohlyUGZnHRLpSbqdYZ9k00xBM//wFTyptBMD+8b4QmlIf
         yutavk7vyfs7G31H0Jmd6rCYCeyUj4vzybMU3xg5/sl9PDogIOWBltfo6iRDY59P4pc5
         XTmA==
X-Gm-Message-State: AOAM533f8v4bZs0KgbRLvqf9wcLyRF5g5gTZ4qvI54y+/tWbsRHVq705
	C9+izHoI4xGMXjf53yHcMGBiHyphu4G8fJqgysmggYiQh3Qnhv0XpCpqRwY8wMhCpksntb5hoeu
	lOB9/bwVeUH4SoO5A/+HBHsoPLg==
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr3422679qko.683.1643303377469;
        Thu, 27 Jan 2022 09:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyie4bqi26jfgNY8Cjw+Pn5xYBOKV6NvnkIoBYF0/ZaizWWrCUD9ZTrfOlIA4zvFGF0i2/RFw==
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr3422658qko.683.1643303377286;
        Thu, 27 Jan 2022 09:09:37 -0800 (PST)
Date: Thu, 27 Jan 2022 12:09:36 -0500
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
Subject: Re: [PATCH 06/19] dm-crypt: remove clone_init
Message-ID: <YfLR0DPcDOYO65Hp@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-7-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Just open code it next to the bio allocations, which saves a few lines
> of code, prepares for future changes and allows to remove the duplicate
> bi_opf assignment for the bio_clone_fast case in kcryptd_io_read.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>


