Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DC2C2EBC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36667.68660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcGY-0000At-0o; Tue, 24 Nov 2020 17:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36667.68660; Tue, 24 Nov 2020 17:38:09 +0000
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
	id 1khcGX-0000AK-TY; Tue, 24 Nov 2020 17:38:09 +0000
Received: by outflank-mailman (input) for mailman id 36667;
 Tue, 24 Nov 2020 17:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcGW-00008A-Uq
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:08 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c563e17d-b237-4aa3-a9e2-0f68e9b899b4;
 Tue, 24 Nov 2020 17:38:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d9so21472379qke.8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:05 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id i4sm12549778qti.78.2020.11.24.09.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:04 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcGW-00008A-Uq
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:08 +0000
X-Inumbo-ID: c563e17d-b237-4aa3-a9e2-0f68e9b899b4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c563e17d-b237-4aa3-a9e2-0f68e9b899b4;
	Tue, 24 Nov 2020 17:38:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d9so21472379qke.8
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E5yu6Z9CIGvjjdSWaM1JDiBNwd7R7l70HZvgJTMOMAo=;
        b=bP/UrEJdRXtdgl6ivVFuNIsepdmdiobKpEaoQqAkqVcxh4oLhWjED34HU2CgSOcS0r
         u8nX3lWOcITugT41Gz5ogHCeG5HvCzBWSnlVt6HFT/XLqvXGgBQUlkC2CFe4rQZ6Jdgz
         Xlh808EEDi3JUpO3tYkyT+AsuwhV2f7GO2Y1rVQbOYvLQXrbYCZEOEXyaM/QNly3oWKd
         nMDmSodcBiZ4nkTVRK5MN+HlnZkSvenRe7tY//FCQ2HZJpqhNw22PuiG5Df4AdGG0TX6
         9RHtJd4eQvkljDEZVlwbW5qc2pplOC6tGot90vCLquU/Y2qjjEP022211N4bqrY0nZQk
         Cpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=E5yu6Z9CIGvjjdSWaM1JDiBNwd7R7l70HZvgJTMOMAo=;
        b=jhroD8SSbR8NRIjoFVtpJ0qWuSUyq4sEwoMBAVlAXiVzEKuOYBOlEA4TQQ8MzUwCrE
         QmeOBq93P0WxMBUCu4JsYnj1vPr6qBv4nXd6l0xAUFQXcxB3rb0mLgFDn8rsRz7dn1Xd
         gGoClazOaRr+bxFt2Fj04KvYoY770kdrWK2Rue31QTVlXQlhbgbs6cFYYm3cYUHgHLRv
         dTUV3hUSA2qb01bdRsMjsZRMmxj3Nkm+lt+3royaiwt65lM6KopfAEOvuEQVQ1z2xyIp
         98ixnrxpTCweMZcFr9359woc3fd3ev8z2Zfbi8DaTi+wViZYznWbYiiExtgFQwfij3wJ
         k3Nw==
X-Gm-Message-State: AOAM530ANqlBcXXP5ZV9YhyxlGvODGAhSEpa4r5lAMzvDyxE5tYoVhdL
	RiWu9uzIWLeXY3Hz2XSYp3g=
X-Google-Smtp-Source: ABdhPJyi1T8dRX2wY3q65x2J+bQePuJjN+c8Pa1HrFeBbFFSDxXqbhzlU09MTDkUoIjmr+Nu4Id3fQ==
X-Received: by 2002:a37:7bc7:: with SMTP id w190mr5863735qkc.476.1606239484751;
        Tue, 24 Nov 2020 09:38:04 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id i4sm12549778qti.78.2020.11.24.09.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:38:04 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:37:42 -0500
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
Subject: Re: [PATCH 14/45] block: use disk_part_iter_exit in
 disk_part_iter_next
Message-ID: <X71E5ohZ7I/tDKWO@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-15-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:20PM +0100, Christoph Hellwig wrote:
> Call disk_part_iter_exit in disk_part_iter_next instead of duplicating
> the functionality.

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

