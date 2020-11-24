Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E22C3274
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 22:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36994.69129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfkX-0007zi-0j; Tue, 24 Nov 2020 21:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36994.69129; Tue, 24 Nov 2020 21:21:20 +0000
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
	id 1khfkW-0007zL-To; Tue, 24 Nov 2020 21:21:20 +0000
Received: by outflank-mailman (input) for mailman id 36994;
 Tue, 24 Nov 2020 21:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khfkW-0007zC-1D
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:21:20 +0000
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73cd1ab5-2ab9-4c81-b0f1-cc732fa222ea;
 Tue, 24 Nov 2020 21:21:19 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l2so591706qkf.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:21:19 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y44sm292925qtb.50.2020.11.24.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:21:18 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khfkW-0007zC-1D
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:21:20 +0000
X-Inumbo-ID: 73cd1ab5-2ab9-4c81-b0f1-cc732fa222ea
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 73cd1ab5-2ab9-4c81-b0f1-cc732fa222ea;
	Tue, 24 Nov 2020 21:21:19 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l2so591706qkf.0
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Y3MLcmrdxWQffIhMnyKnSmG7B3ov7cDZAqFDsa+q7k=;
        b=JkzooPxJ8GeNrayRsu98YvwsNpW2uc9rVRoj4imwYpA6JzY+Piu1EJS2IziPBdeDkF
         Ow5qmzMcHaeZs2+oG1fSVsEAssWG0DO4F1vW/5P9q+2+DEbGyYUH1jozKg00Go0h3+ja
         YVkgi/EGLciFHd/Iul8YpgRz7FCu1kfvXaFXbSFsbyZTqz8JAJ48o8dWwKmdI5uElByj
         9UjvAnbnEBhxu3Tw7tEroOvSCxNENuu6nvEC1MTUGX0lcXIIF4ARzithi6KpCvnT/fAl
         Mp0ipaM81mRq+veWggOWfzfqSyIb3Y60deO3bam/RyYuBfYbgPa2E9CAR1VR8pj1MpV8
         kFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7Y3MLcmrdxWQffIhMnyKnSmG7B3ov7cDZAqFDsa+q7k=;
        b=sapBRPxW25vntiprHFfjliKzvrOl5d23wO85/EVC1KSlEiM5zR7xFz5ndnvHpGi7OQ
         r0vugT3JS8i4HnG+bAWvwDubKF7tqmL6iUesvNi8KYboz27ZWiQF2ddDcCrDbDKVDxHo
         cKLiWMkS+57NZVn2HIHetqFspIDjdajF//BhPbXZAs00DnxtD8tiubVGqMomGnuX1eJ9
         FXPN/240YjN2VcXPr5OwwlEKHCuuiP3YPSt1lkFkMEfYh8gmYRSm68Naswuoq6JmdD+C
         y9gvYyheG8f9rAQHYwX+bxcSvQc9kvPMWqV3RsbujxIl5wmYX3cPUNNYrn9n1WjEqtx+
         XRmA==
X-Gm-Message-State: AOAM532QpjKbwJYN5jR7leaCJF5YLzJufV2HgNgY/BwOQhZutdip+z/i
	XHZ1B5+DRVkiwNPBz6SC0VM=
X-Google-Smtp-Source: ABdhPJx26oBT8NwtvheSnoKT8jLyoQC45bZaDNVCxy9rquKXHNVFfdT0K9nlXQGVBdDZtOMR/OxmVA==
X-Received: by 2002:a37:9ed3:: with SMTP id h202mr199931qke.126.1606252879118;
        Tue, 24 Nov 2020 13:21:19 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id y44sm292925qtb.50.2020.11.24.13.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:21:18 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 16:20:56 -0500
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
Subject: Re: [PATCH 29/45] block: initialize struct block_device in bdev_alloc
Message-ID: <X715OP+dR8KzH1wA@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-30-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-30-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:35PM +0100, Christoph Hellwig wrote:
> Don't play tricks with slab constructors as bdev structures tends to not
> get reused very much, and this makes the code a lot less error prone.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

