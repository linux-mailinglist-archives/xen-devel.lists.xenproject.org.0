Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070232C48EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 21:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38056.70676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki1HW-0005ZY-2G; Wed, 25 Nov 2020 20:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38056.70676; Wed, 25 Nov 2020 20:20:50 +0000
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
	id 1ki1HV-0005Z9-VY; Wed, 25 Nov 2020 20:20:49 +0000
Received: by outflank-mailman (input) for mailman id 38056;
 Wed, 25 Nov 2020 20:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1ki1HU-0005Yz-7M
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:20:48 +0000
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e260a64-25ce-4e96-aa1e-779f61da8b9b;
 Wed, 25 Nov 2020 20:20:47 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id n9so1555651qvp.5
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 12:20:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y44sm486168qtb.50.2020.11.25.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:20:46 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1ki1HU-0005Yz-7M
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:20:48 +0000
X-Inumbo-ID: 8e260a64-25ce-4e96-aa1e-779f61da8b9b
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8e260a64-25ce-4e96-aa1e-779f61da8b9b;
	Wed, 25 Nov 2020 20:20:47 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id n9so1555651qvp.5
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WSMpmf065AQQA16C6I8/f4Nb2MRTg2VCPV1Y+4Omok0=;
        b=aJS9gum5t6FoUnqNb5tw+YGyXQwCcI0whcaK5FVUTCKP/Za8Nic1QhStF8Oo0uQqh3
         L0EDWq8ANbf//uV8OcD8fNbj84N8b+UQW4VBsfkFxUd2wm2oiv8y2r+1szMOd2mKe/Fb
         jB/Rs1PwcZGahhDQ4EgDOj2cTvwscYJwDpscmIsBSgDUECsxq7ybIy99pl7t6EZACtmJ
         OQNz/R2bfBUvVHHvYpCiFswvCFs5ojv+6B+BefCSzh9yvMi9oo4QZXO9E+nIcmmPD3xg
         TfQqkbB+/KLVpkZTEMiMjSIt1e2srUeyrPlr4iowCq3gB3eKpa4DgFQSorpcJb38qFDX
         0fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WSMpmf065AQQA16C6I8/f4Nb2MRTg2VCPV1Y+4Omok0=;
        b=dZ0D/X+2pdQFvXcTrZJombVHA9WRn6V1xG/Cs69J9Int12Zay5I2MzP8awqRccM4Aw
         LBV17PhTNJMjXAsisoW7LoN009vLIBjfkDBPrfxcEQCLzaLrzYy7wrKSArNSvJ69J3NC
         25inv1/ogchdg8QxuNeqPw9d4R0L096nDVjI0YJK4R+9QdZvcErrhqTlsaxCRVkLwOtz
         kriI7RkWZMZ2X+tchFKbd+rkO3ZOtcscFSZcWdav6t9WiFzgQrnH5raYNwVjIy/Yxl9F
         XAQoO9liGyngVwRm/44Y+zFEgWJFzHmhuEhWK/2x1dWPxJLDwvS1L2H1FIluoeje+IKQ
         KK3g==
X-Gm-Message-State: AOAM533TaGj+idaIbUUxFtVarD0hidJVdl5U+2v3KXMv5HEyZpD/wk93
	mT7zy4ePZj5ypLzvrTBnnnA=
X-Google-Smtp-Source: ABdhPJxGb7WJXeWnQukVsz1bsvc4/cmOCaTprUECQMhH8XohgWi8umM00Y/Xc9aCwh7r/SWLyDpYFQ==
X-Received: by 2002:a0c:b505:: with SMTP id d5mr4999671qve.59.1606335647135;
        Wed, 25 Nov 2020 12:20:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id y44sm486168qtb.50.2020.11.25.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 12:20:46 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 25 Nov 2020 15:20:23 -0500
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
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <X768hzEnD/ySog5b@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de>
 <X714udEyPuGarVYp@mtj.duckdns.org>
 <20201125164515.GB1975@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125164515.GB1975@lst.de>

Hello,

On Wed, Nov 25, 2020 at 05:45:15PM +0100, Christoph Hellwig wrote:
> On Tue, Nov 24, 2020 at 04:18:49PM -0500, Tejun Heo wrote:
> > Hello,
> > 
> > Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
> > on the previous version.
> 
> Thanks, I've addressed the mapping_set_gfp mask nit and updated the
> commit log.  As Jan pointed also pointed out I think we do need the
> remove_inode_hash.

Agreed. It'd be nice to replace the stale comment.

> > Also, would it make sense to separate out lookup_sem removal? I *think* it's
> > there to ensure that the same bdev doesn't get associated with old and new
> > gendisks at the same time but can't wrap my head around how it works
> > exactly. I can see that this may not be needed once the lifetimes of gendisk
> > and block_devices are tied together but that may warrant a bit more
> > explanation.
> 
> Jan added lookup_sem in commit 56c0908c855afbb to prevent a three way
> race between del_gendisk and blkdev_open due to the weird bdev vs
> gendisk lifetime rules.  None of that can happen with the new lookup
> scheme.

Understood. I think it'd be worthwhile to note that in the commit log.

Thanks.

-- 
tejun

