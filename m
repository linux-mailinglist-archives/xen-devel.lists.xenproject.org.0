Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6672C2EB8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36653.68637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcFz-0008Ni-DR; Tue, 24 Nov 2020 17:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36653.68637; Tue, 24 Nov 2020 17:37:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcFz-0008NB-A5; Tue, 24 Nov 2020 17:37:35 +0000
Received: by outflank-mailman (input) for mailman id 36653;
 Tue, 24 Nov 2020 17:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcFx-0008Mt-Gw
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:33 +0000
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 747fdc6e-a7a4-4059-9226-8b6e5d5c4f04;
 Tue, 24 Nov 2020 17:37:32 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id n9so4712222qvp.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:32 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id k70sm13834520qke.46.2020.11.24.09.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:31 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcFx-0008Mt-Gw
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:33 +0000
X-Inumbo-ID: 747fdc6e-a7a4-4059-9226-8b6e5d5c4f04
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 747fdc6e-a7a4-4059-9226-8b6e5d5c4f04;
	Tue, 24 Nov 2020 17:37:32 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id n9so4712222qvp.5
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NMx3wGtNfY3eeaXC4utlwl41yJ4qPilA6BGetqYUorY=;
        b=ttWPoi7SbGNczr/1HSKQP13JwOnnq6d51NvgAXrXOVbFUHDENikis8wgWQ/ICO4vWD
         QXvXHNRrjPvcjtbRUNuU5kihbWk0IwxLYcoiLDd6H0sLjKI3e2qbtU5af/N7pFoOqAgC
         h3xBKCRJvq/QDtB6ihgsX92WTCe21la5HoXVw91eRC04tEZopSMLMnfWKE1wWDcnWaYf
         S2KXfW3yg0N/7LpsJ40fmTrf9EG2F6mG56V6rpZ8GyEnO0Ym+iYS/n4CBM7mxtRyxGrg
         uQLw/J+qnYSYcVKcO0TGKVFY752sD2m6oYXQvW4fux2BOd14a3jTxvr52rzBLO0HCBoZ
         teng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NMx3wGtNfY3eeaXC4utlwl41yJ4qPilA6BGetqYUorY=;
        b=X/T5cX186uzlWtYQGGz4C6xycMaMn171WBzn68045o/balRttyztESbiKbSyf3M/sx
         T3Qm8ixwkEyxpBlW5TfvSvOl3guLV9tb8x5JJ8zuAi5C/uFsksIIMpV3IrkQ4WqF6o3U
         MDCZUdD+/8jJ+UQh1SxXz0QHp4CrWib3M3LkJXGBgVRz75cy8dwWuJInJbaahh2nvUuD
         VlQuBWDDz3605Ec/30R3udXwLwIhaN9tK+IwNyxuJfYnZX77tGBdCLHdZmsy7bHP1Osa
         +I16j0xh9tZCOXSSixJQmCBC8l2soKzsEAArfPMyiEDhIpOsv1dWTsuAIY3dqUPn8ydV
         KcOw==
X-Gm-Message-State: AOAM533HGxf+hQFL8E9D4ZYsPgxtSeDcmXwwdvwizJ8rUG02Ug/mrplY
	BvmBrp9xHXhnSjqUYjPbLL4=
X-Google-Smtp-Source: ABdhPJzX+Vh2Egxjq814YfOpUGajTbbALAhbpqH5gqFyQRlGy9nqyUOsvItkj0Gt+6yRJDRCbrF4QA==
X-Received: by 2002:a05:6214:4e5:: with SMTP id cl5mr5723077qvb.42.1606239452550;
        Tue, 24 Nov 2020 09:37:32 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id k70sm13834520qke.46.2020.11.24.09.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:37:31 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:37:09 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 12/45] block: remove a superflous check in blkpg_do_ioctl
Message-ID: <X71ExfXNm5IC7xMq@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-13-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-13-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:18PM +0100, Christoph Hellwig wrote:
> sector_t is now always a u64, so this check is not needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

