Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59A2C312A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36962.69069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kheHR-0007A3-QO; Tue, 24 Nov 2020 19:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36962.69069; Tue, 24 Nov 2020 19:47:13 +0000
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
	id 1kheHR-00079e-N6; Tue, 24 Nov 2020 19:47:13 +0000
Received: by outflank-mailman (input) for mailman id 36962;
 Tue, 24 Nov 2020 19:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1kheHQ-00079Z-AX
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:47:12 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94d6033c-0b56-42f6-aaa0-f45425fd868e;
 Tue, 24 Nov 2020 19:47:11 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y197so22276243qkb.7
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 11:47:11 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id 137sm123792qkj.109.2020.11.24.11.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:47:10 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1kheHQ-00079Z-AX
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:47:12 +0000
X-Inumbo-ID: 94d6033c-0b56-42f6-aaa0-f45425fd868e
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 94d6033c-0b56-42f6-aaa0-f45425fd868e;
	Tue, 24 Nov 2020 19:47:11 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y197so22276243qkb.7
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V2TOjLdoUaYrySYqHg0oeA6ickZUCz64YonJi1MX7zw=;
        b=jOV4zvc5ykqwIR5EZxEdhoTt8gbdvwT6+6X/TSUVT/z8HYM0C2tjvbbgLMctpzeJXh
         RGgnK/f6uWChM4BxAbOX4p18Fwq1/chEXov7aPAYOwuKTjdA655sPluEae6103/B37UZ
         mtHW9DvASGebX6RreWH7qhpVzv5BxklJgKQSxfx5joha57iIHUUTiDQJHNfLS9atfGSt
         ExNgjoQWPu/xgn5sRgfmq3jVVaBwbHob8XGT+JoMXjhTpfpEBrU2/+S555WpdkNVIh4j
         Jpy0MqgRWGJT79DbBEN/JVT9ea84He6RSeOcPWGIlVmK+xMy8dzyAD0z3NQbnkk9QV/T
         mQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V2TOjLdoUaYrySYqHg0oeA6ickZUCz64YonJi1MX7zw=;
        b=dLxSsSEy2+QbBpZAI96+RpEfNVFV8BfdAh+9bBX4gqwJd8h3yiYITH1NMaXo0q9ti2
         7FajpOitIDFU8kjLoNb37pkwOZLTvikPzoV+NqMPEU/bOqIlKpvkdYWN1OCTTcP+qe+W
         m66tyX2wzUtwTqpePbSglTP2K6qhDjeoKSMDnYPCV6G6Zc72jKZiA8T4YMauQZQAK6bW
         +XrCMlB0Wcy9yc5XMNiUqd7Two9ZbDfBe5L828XiTK/9MIfAf0UnztfFZ0IdyAB88eAl
         VI0/c7HEEaXDWyB1gb0pxqUFIqj7z2zL0dk4FbtKKb+NxlHO+r50OJTD3T9q6cGextXm
         tNsQ==
X-Gm-Message-State: AOAM531ztIgjrHXbFQx0KAZG/PyOalerqqvebrYJDl0Gr/pqLu4aNyJ/
	eHBrO2VJZ+xJDZYCtN0wEXo=
X-Google-Smtp-Source: ABdhPJzCbEzsnsSHZbAP8aBMoagyKuXkYbNxYHgU470rrYkN9D5aTPe0QJyzDBb8iwv2DZpxdq68Ww==
X-Received: by 2002:a37:6cd:: with SMTP id 196mr3775536qkg.96.1606247231211;
        Tue, 24 Nov 2020 11:47:11 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id 137sm123792qkj.109.2020.11.24.11.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:47:10 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 14:46:47 -0500
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
Subject: Re: [PATCH 24/45] blk-cgroup: stop abusing get_gendisk
Message-ID: <X71jJywIZTSxLoqQ@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-25-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-25-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:30PM +0100, Christoph Hellwig wrote:
> Properly open the device instead of relying on deep internals by
> using get_gendisk.  Note that this uses FMODE_NDELAY without either
> FMODE_READ or FMODE_WRITE, which is a special open mode to allow
> for opening without media access, thus avoiding unexpexted interactions
> especially on removable media.

I'm not sure FMODE_NDELAY does that. e.g. sd_open() does media change check
and full revalidation including disk spin up regadless of NDELAY and it's
odd and can lead to nasty surprises to require cgroup configuration updates
to wait for SCSI EH.

Thanks.

-- 
tejun

