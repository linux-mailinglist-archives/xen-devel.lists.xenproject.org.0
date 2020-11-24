Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E22C2EF5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36714.68734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcJn-0001iN-04; Tue, 24 Nov 2020 17:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36714.68734; Tue, 24 Nov 2020 17:41:30 +0000
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
	id 1khcJm-0001hy-Sc; Tue, 24 Nov 2020 17:41:30 +0000
Received: by outflank-mailman (input) for mailman id 36714;
 Tue, 24 Nov 2020 17:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcJl-0001hs-58
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:41:29 +0000
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dad49d7-7816-41fd-8c7c-a87c31be0a37;
 Tue, 24 Nov 2020 17:41:28 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so6922343qkf.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:41:28 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y3sm7003885qkl.110.2020.11.24.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:41:27 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcJl-0001hs-58
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:41:29 +0000
X-Inumbo-ID: 0dad49d7-7816-41fd-8c7c-a87c31be0a37
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0dad49d7-7816-41fd-8c7c-a87c31be0a37;
	Tue, 24 Nov 2020 17:41:28 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so6922343qkf.3
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4ibQynBLG5sCe4CZqYbUkQUaNNDbglWF2wLslYnfqek=;
        b=jYivczMQqsxh7yyiSCMC+J2uq1jjrgFqCn4zGdT7y8l1tR+lBZj0zWSEvbd0W8jl8w
         Gi4Cj5Zx4gKHsuI0fIL4rp4709gHxtA9wRWySVLNwDnlcHxfBP3hG6ecjPkRXqH0UxZp
         xk0pqka3Sqe63I6EZOHEKoOfA/4WJiEaugJWCMjne3X9nHRMXe7fYlZPuOXRYu6gUE1t
         VJ+e81XD/b5aNX2a+wyW4GmbUwrk6CKBJ/6iNXNyc9y/IvYXsxz32um6sHRBVWQzYyqm
         IRQIL0vettN12q9xzjv+kftrmu3uKde1tlzjzfXundOzi243rFxdMC5NVy5kvvEXsk4Q
         MK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4ibQynBLG5sCe4CZqYbUkQUaNNDbglWF2wLslYnfqek=;
        b=Fpo9vTLP9TYoJyn2u6xpMZOXj/vE2BF3eCBbpG67NywIcYbN5ERXLaFoD+wGtz3T3Y
         TyvuIabATMOGMC2g5/u5DLAUQAwl+vRvH0PmsjOtTIPJqTepqXOl7WMds9kUCjGnr6Uy
         O2HQnH98iHcpP/KemJD6IkAL2vwnk292GbIZCu3lCWjU0c2UHp3ETGPRX/wHvOuwyFSl
         YM4oavfRHIXEt7mbouu1pp0NkHkgGtR0YQwvwPZnv3w1ZUuUcGMEBCCPhK6JwLzxCpTE
         AbLWbkqR+mcydpDKhwvpFxLcqYR9V/kBdM+t1t2KeDq2YX9kqbWW5CmcCxCsJWaGNQrZ
         efeA==
X-Gm-Message-State: AOAM530BE2unpmDAuyK1lWHaIcuerqzaqOq0iehbv1l3jetjcbb9USQt
	4l+zdLxzX3ix896ks+4JQ6c=
X-Google-Smtp-Source: ABdhPJwbAXPcygkLKUFdmjuytzuRV0DzFXM5PwNCTshXeMizxUWtjVUL4UzMNPmTvdVp88+fUo1SSg==
X-Received: by 2002:a37:8c41:: with SMTP id o62mr5500995qkd.240.1606239688196;
        Tue, 24 Nov 2020 09:41:28 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id y3sm7003885qkl.110.2020.11.24.09.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:41:27 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:41:05 -0500
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
Subject: Re: [PATCH 20/45] block: refactor __blkdev_put
Message-ID: <X71FsRDFtHWxVJOg@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-21-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-21-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:26PM +0100, Christoph Hellwig wrote:
> Reorder the code to have one big section for the last close, and to use
> bdev_is_partition.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

