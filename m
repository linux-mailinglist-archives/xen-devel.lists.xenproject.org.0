Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4E2C2EDB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36694.68709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcHk-0000gn-6x; Tue, 24 Nov 2020 17:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36694.68709; Tue, 24 Nov 2020 17:39:24 +0000
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
	id 1khcHk-0000gO-3W; Tue, 24 Nov 2020 17:39:24 +0000
Received: by outflank-mailman (input) for mailman id 36694;
 Tue, 24 Nov 2020 17:39:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcHi-0000bK-HM
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:39:22 +0000
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 230b7e5b-5347-43d0-a0c4-c605e6225d22;
 Tue, 24 Nov 2020 17:39:15 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l2so21564673qkf.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:39:15 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id o125sm13142963qke.56.2020.11.24.09.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:39:14 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcHi-0000bK-HM
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:39:22 +0000
X-Inumbo-ID: 230b7e5b-5347-43d0-a0c4-c605e6225d22
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 230b7e5b-5347-43d0-a0c4-c605e6225d22;
	Tue, 24 Nov 2020 17:39:15 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l2so21564673qkf.0
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1gf+uZOc59XzmKEaDiZtFHdLCUgfXw7pOt3g9dTtDNI=;
        b=M4BrkAkexyVnkGUjwXdFjVYmVA9LVLj6ookNf5Ar0M5rW60FOFaco8NOC5V53XdKf3
         QJEfLqRZiaD+6aOYpsb7R05SzbB3BGYlmBRdin+nnS7Rl2/BZJIjCGem3ORrY6o5M9QB
         v9ss2oYhE9tLgFZfLE3LUECIa1myAFcsarnIGBk9Ar+eH0Bp+cdl7ZRZkZZx50CbTsHE
         K2VguikHFXg5qBSb0ELsCBeZfhaX/wrxj8/wztYcWOB/MjJmdrILJmWyfS//vV8R3Onf
         0IRpZT97EaMt3VXXj+9C8TX6D4SZ8wZliFCO/qY/oBmhfCgjCD7BmPqTXEJzXRSaVyYm
         sdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1gf+uZOc59XzmKEaDiZtFHdLCUgfXw7pOt3g9dTtDNI=;
        b=E0mKGgEYeVJyrcMM9paX25EcismMipppn6x4Xma8suIW3ITolOs8K/wGVdyv/+Ep9s
         djtNuGZy7pWPa1izkLP1dwjwhaTvJvBkvG8IYFT9a8hp+3wyBGVdK3WXQqiHk307bFW/
         /slYD87yg8pFOatJERR3skZKruoDMQ9NCeCRjdCe2jbIugjBGwiWQqUb66fttTb/E80j
         +g7l5uCxnbfYPR/XtTKkrRh0aHbNODyX4rjkvyzsrXF43ipsj8mQZf8HzPH5v/1Oq+hB
         s1rpPypQ6B5qPOxMEOPFubK+DXOpoVA5Prwmd+jXPHNOgGcXpe99FOVRiBbQBPI/PVIZ
         UaVg==
X-Gm-Message-State: AOAM5313hurCb669JPPCOkoZYB9WeulKigR1kJoGn70t9HBzEuvF0EQa
	C4Qd/TYpbdg472HwwqaYshw=
X-Google-Smtp-Source: ABdhPJw/9uU36tM4rV+p5Q1FKg2O4RrQNewNe3FrRSf3D7AKvxn62XJtfvC4G0F74E53WmoixHdIOg==
X-Received: by 2002:a05:620a:569:: with SMTP id p9mr5395902qkp.119.1606239554812;
        Tue, 24 Nov 2020 09:39:14 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id o125sm13142963qke.56.2020.11.24.09.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:39:14 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:38:50 -0500
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
Subject: Re: [PATCH 18/45] init: refactor devt_from_partuuid
Message-ID: <X71FKqT9KtO4zTvw@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-19-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-19-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:24PM +0100, Christoph Hellwig wrote:
> The code in devt_from_partuuid is very convoluted.  Refactor a bit by
> sanitizing the goto and variable name usage.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

