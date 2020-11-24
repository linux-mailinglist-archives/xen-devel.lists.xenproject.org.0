Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F32C2F8F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 19:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36758.68785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khchj-00045z-4q; Tue, 24 Nov 2020 18:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36758.68785; Tue, 24 Nov 2020 18:06:15 +0000
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
	id 1khchj-00045a-1F; Tue, 24 Nov 2020 18:06:15 +0000
Received: by outflank-mailman (input) for mailman id 36758;
 Tue, 24 Nov 2020 18:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khchi-00045V-De
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:06:14 +0000
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bde8787d-613b-4136-afb9-58706ad8e155;
 Tue, 24 Nov 2020 18:06:13 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p12so16728144qtp.7
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:06:13 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s7sm13264706qkm.124.2020.11.24.10.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 10:06:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khchi-00045V-De
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:06:14 +0000
X-Inumbo-ID: bde8787d-613b-4136-afb9-58706ad8e155
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bde8787d-613b-4136-afb9-58706ad8e155;
	Tue, 24 Nov 2020 18:06:13 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p12so16728144qtp.7
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XGgWvl0Napb7ckr1b5Je/XF/vo+wq/s703ULFNCgBaI=;
        b=mFcTt0MgjM9IqQp5CjNn460f80WY5TgOpPJ6Ay4ntldAJKb6Rjl0HTJIZ+yFn5diNg
         Y9XgufAijyGSVMo3oa5mbzUjsTfdGF4klUksliDQRN3qDG0d8QMDnfA4E5LuG2LRxix9
         hartKdsjUyOnRZk1OwfqKdcIsVXRFfJDauC2DAxEf1EDFmBabgsDa0m7UqLxfYY5bZRj
         zYqj7h62Xy2JH5Y5YERtz3Jqa3G8xCCNygCgwbvWWscHLpe2a2ipXU92XYpjwaNY0VJ2
         iVk3YMDEtvOraBt/erbOI6z6NYw/s24zXpCk/3X14GTWVBM8KYbSPmvWGmoSgwz5tNpw
         HXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XGgWvl0Napb7ckr1b5Je/XF/vo+wq/s703ULFNCgBaI=;
        b=JgNbGZUy8GCrwGkV8nBo91HNNzKMtNDXbfa+JnOg3ZwX4R9BrylWBtLT9O+0/VXdvr
         bCfE4EKhPg9nQ85bf/AowcaFJA0ymTx8V0VLhwEgBKSuaY+CBndu1Vg2ryg/FV6Ysj62
         SuGszdT+HGuy96sKsViD/PpTVwCAHw7ZBf2Ly2on2ZN+9vQpHqWCJHbbv6CH4kSEdQ6m
         xnnCA/pFtJXpsM6loxgMJ5w3ZR5ZhD4OKcqT1fM/tozDczP1lFyrCD63d4xzhm3ChJ8/
         XV7wETA51MG5QrScedXB29/SCImE2WWyAXeQlgd1YPmNHyVhsEf6G6vP25stXu8b6Yxv
         BxhA==
X-Gm-Message-State: AOAM532FDhkokbwYi4ffcwDdff2rPXrooNt/gJqKxOmKhODCDv36Z7VU
	SDUBBUM2J9W082qPo+ATR9E=
X-Google-Smtp-Source: ABdhPJy4KzGqVN9OifimW7Bbj0BtBOYaib7uEK7t2ko3uV9boQAgproJwZycxdIrJmhhR00FFdaCLQ==
X-Received: by 2002:ac8:58c7:: with SMTP id u7mr5558192qta.54.1606241173470;
        Tue, 24 Nov 2020 10:06:13 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id s7sm13264706qkm.124.2020.11.24.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:06:12 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 13:05:50 -0500
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
Subject: Re: [PATCH 22/45] block: opencode devcgroup_inode_permission
Message-ID: <X71LfgUr2lIKqDx+@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-23-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-23-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:28PM +0100, Christoph Hellwig wrote:
> Just call devcgroup_check_permission to avoid various superflous checks
> and a double conversion of the access flags.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

