Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C072C3F95
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37668.70123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtch-0007VI-32; Wed, 25 Nov 2020 12:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37668.70123; Wed, 25 Nov 2020 12:10:11 +0000
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
	id 1khtcg-0007Ut-Vz; Wed, 25 Nov 2020 12:10:10 +0000
Received: by outflank-mailman (input) for mailman id 37668;
 Wed, 25 Nov 2020 12:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khtcg-0007Uo-CH
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:10:10 +0000
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a6657f-6250-4cf0-9c57-083d71ccba7e;
 Wed, 25 Nov 2020 12:10:09 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id m9so1874232iox.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 04:10:09 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id v85sm1343250ilk.50.2020.11.25.04.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:10:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khtcg-0007Uo-CH
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:10:10 +0000
X-Inumbo-ID: e1a6657f-6250-4cf0-9c57-083d71ccba7e
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1a6657f-6250-4cf0-9c57-083d71ccba7e;
	Wed, 25 Nov 2020 12:10:09 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id m9so1874232iox.10
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Gu8dfUtFbW1JkuoI0JsJxuRwdXnhq5kHzNpgpg59Vg=;
        b=qBMGf8ZlpGBDrQf4OZ1U5hpBWVyNLxT8t7mb89EQfIXn+CYHj49+4NspUMpFZN+IBb
         ow2ADzA501Y4hGPFKjrnnAGIPGi9hyvAwwXtpDtFAkYj7ksmhQny5Q5+xlY6jtJjsSvN
         iA9i5fMRanrtfyZfe3+dWZgmeaV0x4lRD+7LgXZczkfB+RbnQDZrkTxOZ7Es8MQAef6B
         e5RRaQ3t+46Lg0Zd/h/8g8StzDseAQGAZgvUuKfsUJH8/o4saKvewPtw+57G9TyZa/BY
         /ViJEbywwBG8XKFF7bgqckI6jrquPx5+GfHPK5ghMTcJ5KumQuJnVjVzT50eAtnQOxE9
         Uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7Gu8dfUtFbW1JkuoI0JsJxuRwdXnhq5kHzNpgpg59Vg=;
        b=K0tMNVJhiLUX3qpanghMJXxk9RmpLVfWF82ac19liG/CVlGqGz9ujMz8vLqM38TdTX
         7i5ZL0uvAPnF3afBbkHyxX9CxwDBn2C30a1+GGYHMGj/DamU04Xs41q9NTrqrVdzboAA
         9rAYR0En2iRAAjnY8+Rd1eD9NY/lvGoj71UEDzXoQOOj7oKI5l3NSJ6RM6hsIuv6wCng
         674VLOq0AgC9RRsLWxfhXjDrC7TAK3BFZP6YNJLAaxt0doex3xd7sAUVP+OqfA61MkQs
         1NC0swpcOTIwsEmRhXXWjvZDPWkTNE9NYnzBLDtmuwodWEznbxWup1vPSDCJR6J0xXv4
         SJLw==
X-Gm-Message-State: AOAM531Kzf7KIHhjivKRtY1IiWOq2Uf+QhBNR59mKd2CCm/ak84hoqkV
	ejlZ8m/TuHoz9rYccO9ACZ0=
X-Google-Smtp-Source: ABdhPJzrP+6qlAsvVf6NJAz9IW3W/tDwuPyEzkZeYfjLrVcKdFZvzQhG4Xm+JItZe22HwNKBFUD46g==
X-Received: by 2002:a5e:8206:: with SMTP id l6mr2327550iom.126.1606306209079;
        Wed, 25 Nov 2020 04:10:09 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id v85sm1343250ilk.50.2020.11.25.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 04:10:08 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 25 Nov 2020 07:09:46 -0500
From: Tejun Heo <tj@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <X75JitlWvZieqIR3@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
 <X708BTJ5njtbC2z1@mtj.duckdns.org>
 <20201125114044.GC16944@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125114044.GC16944@quack2.suse.cz>

Hey, Jan,

On Wed, Nov 25, 2020 at 12:40:44PM +0100, Jan Kara wrote:
> > I don't think this is necessary now that the bdev and inode lifetimes are
> > one. Before, punching out the association early was necessary because we
> > could be in a situation where we can successfully look up a part from idr
> > and then try to pin the associated disk which may already be freed. With the
> > new code, the lookup is through the inode whose lifetime is one and the same
> > with gendisk, so use-after-free isn't possible and __blkdev_get() will
> > reliably reject such open attempts.
> 
> I think the remove_inode_hash() call is actually still needed. Consider a
> situation when the disk is unplugged, gendisk gets destroyed, bdev still
> lives on (e.g. because it is still open). Device gets re-plugged, gendisk
> for the same device number gets created. But we really need new bdev for
> this because from higher level POV this is completely new device. And the
> old bdev needs to live on as long as it is open. So IMO we still need to
> just unhash the inode and leave it lingering in the background.

You're absolutely right. I was only thinking about the lifetime problem
described in the comment. So, it just needs an updated comment there, I
think.

Thanks.

-- 
tejun

