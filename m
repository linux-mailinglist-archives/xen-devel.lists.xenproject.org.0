Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE802C259B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35903.67560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXOw-0002hw-1m; Tue, 24 Nov 2020 12:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35903.67560; Tue, 24 Nov 2020 12:26:30 +0000
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
	id 1khXOv-0002hX-Ul; Tue, 24 Nov 2020 12:26:29 +0000
Received: by outflank-mailman (input) for mailman id 35903;
 Tue, 24 Nov 2020 12:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khXOt-0002hQ-UQ
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:26:28 +0000
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50273573-a0da-4c5c-82a2-195c84ec28b4;
 Tue, 24 Nov 2020 12:26:27 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 7so15888720qtp.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 04:26:27 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id t2sm8643187qkb.2.2020.11.24.04.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 04:26:25 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khXOt-0002hQ-UQ
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:26:28 +0000
X-Inumbo-ID: 50273573-a0da-4c5c-82a2-195c84ec28b4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 50273573-a0da-4c5c-82a2-195c84ec28b4;
	Tue, 24 Nov 2020 12:26:27 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 7so15888720qtp.1
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3VmFnou2nD4lcYGUPrMqThXCue7L4UhclP4oij42Kbk=;
        b=Q2pmLjkQax53DfEJqAJ++rfXRuCUfTMdSrNvTnPX432cf0gQiAL3+rv3sWj3pG2My/
         oRdarF4chfZ/NGCWEsg2aUxLBAr7DM0+LX5j3dmwR37bMrIIw9a2t0+E+kgW+uzsRvYc
         g8kM86RUe+4+vv//4l1WUE0yyA289I+AFdLve44wNIShUP964g0YZBC6/O2hSjbZ07AU
         S+AiwdwqWWOpdsi3wwn8TVFeRWE/u7jWG4pRzv/CGg3KS5VD7Ier0L558UzN4+P3vh8c
         3eIrk+wHnJy7NT29VnOUcXmovGz+97HAGUQWfQatJC0i/4bkcHptLw7Lu0lLat1XLRR0
         0C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3VmFnou2nD4lcYGUPrMqThXCue7L4UhclP4oij42Kbk=;
        b=eps1XF5mtztgNbAmcgGlsB5qnHLn5DQ2RK5XsM4AENWTDvDNW/7m2SxpZMZA4cDOLA
         rpcQ2nVohvzfBxGNciubPNxxT2n3gVD7faIr3T7wNnku8bcvruOtQkFz3Nuy5zRaWzj/
         VvpYzK/Si0Ps62qjszDGvh+WDgwj6vdnV6Dkdc286QPT50iqUjqkzX1PVR5NNtHfP3rh
         F13WKVLvH/h/xT2ui8kQcHVQ7x96b0+rPSCxEdIth1ZHywLoMEYInEi4fhw6SnijjcRq
         lu1LbRXEfvBK9GfRmiiQ1fkB8yRW4TpbAh0Ma3YoH/ZLhIR82JzfmHpzRXokVOT6U98X
         YfvQ==
X-Gm-Message-State: AOAM531PGdcHRkffALkMejC+pSMIgCB4raEYuQ9mVEa24g/Q9pqrBMg4
	hvbgL7S60hqRnppGqXvvA6Y=
X-Google-Smtp-Source: ABdhPJzEc+iLQWYgDMndDYVqthGkMbJAnqvSsODxlzYXE5vX4s2url7RgqZoX9eivJ6nNv6zlRow0w==
X-Received: by 2002:aed:3c42:: with SMTP id u2mr4081287qte.159.1606220786736;
        Tue, 24 Nov 2020 04:26:26 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id t2sm8643187qkb.2.2020.11.24.04.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 04:26:25 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 07:26:03 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 01/20] blk-cgroup: fix a hd_struct leak in
 blkcg_fill_root_iostats
Message-ID: <X7z7215hVXzg3FGA@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-2-hch@lst.de>

On Wed, Nov 18, 2020 at 09:47:41AM +0100, Christoph Hellwig wrote:
> disk_get_part needs to be paired with a disk_put_part.
> 
> Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

