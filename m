Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877602C326F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 22:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36975.69094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfjB-0006zT-5F; Tue, 24 Nov 2020 21:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36975.69094; Tue, 24 Nov 2020 21:19:57 +0000
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
	id 1khfjB-0006z4-1i; Tue, 24 Nov 2020 21:19:57 +0000
Received: by outflank-mailman (input) for mailman id 36975;
 Tue, 24 Nov 2020 21:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khfj9-0006yv-9O
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:19:55 +0000
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80a224b5-d220-433c-b83b-4e8993cfc69c;
 Tue, 24 Nov 2020 21:19:54 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ec16so11400644qvb.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:19:54 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id l46sm308143qta.44.2020.11.24.13.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:19:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khfj9-0006yv-9O
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:19:55 +0000
X-Inumbo-ID: 80a224b5-d220-433c-b83b-4e8993cfc69c
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80a224b5-d220-433c-b83b-4e8993cfc69c;
	Tue, 24 Nov 2020 21:19:54 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ec16so11400644qvb.0
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A2Ux7RQ7mBCZEojzGvR0WDuZtfXBN33NUKSWm/nAx2s=;
        b=uiOjPjtUtQlGuTii+qORJIGUPOgnFY1nUtEhKLlffzZur6sGJm+gKH90kLKTftzjMY
         gUznZxSbf+gcBmxTds5RUXjrVxrE+Fq2EmBwcWZB+pJf3BS5L+QJ7kv+CxvIAOrqPzEX
         dMqmSibOB0dtykbXe/2E2zoCxbKuzPbH5RmI+Xfb2tQjieKxRGRgQgps4Mrmdf0e2l3a
         eNnhJnzPz0bblYg/4cAkndkSQkON8xjuTRqoNexKjm8D+3aqj4P9Sj0gjlauNmeONhmf
         5kvr4Ddaona2AGKfmkN2405koPZEL1O1mk4yy01pHWJJDJlpvcRl+PE1xhRDe1lIBY+4
         jUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=A2Ux7RQ7mBCZEojzGvR0WDuZtfXBN33NUKSWm/nAx2s=;
        b=WlipkRliA9Kg4Pw9P3xKbEVdxGmFxVsO3rhL66eGksgV9ix8W00tMhqSW2ArrJ1Kw2
         EhnbXhiQYb+l/EegK+KGWW+VgZ6w2ELfkWE42+AVojb3IyruGhfMFLmXe/l20GwW9uRZ
         GOxAj72jJ2MvnedoRqJwUFlU5p2JTh/yQKfMa/krq9HsRHeH+ddqML6nfCEyDyDynnUq
         ZfD1AYw+jgmTnmXT1+sTtmVsGiU3dBCeequlrT1jDdA734JvMrnSgZb8XC/gDOfH0Xkh
         cNw/kj0uVgMlUGci4p6MmOaVPDAGGgdhhpdWGoabkF4dQW4lcW4OJzq62SsUON++nlvI
         Ozyw==
X-Gm-Message-State: AOAM5333fsg+fdgghtHjjSIWIzBYKcOU3QLhj81DvNuueD7M+V6P9IuO
	gAVLNNjZMjCDZRDku0z1AVQ=
X-Google-Smtp-Source: ABdhPJxvWSMIcF1QvtVmsROEnFEfbgneWE4I12McWSmR7ItrCaZw+O6oSDwh472sj7fwnSIDMbgqhQ==
X-Received: by 2002:a05:6214:443:: with SMTP id cc3mr455144qvb.53.1606252794270;
        Tue, 24 Nov 2020 13:19:54 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id l46sm308143qta.44.2020.11.24.13.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:19:53 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 16:19:31 -0500
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
Subject: Re: [PATCH 26/45] block: remove ->bd_contains
Message-ID: <X7144xvjxqhopOck@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-27-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-27-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:32PM +0100, Christoph Hellwig wrote:
> Now that each hd_struct has a reference to the corresponding
> block_device, there is no need for the bd_contains pointer.  Add
> a bdev_whole() helper to look up the whole device block_device
> struture instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

