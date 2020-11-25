Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907C2C38FE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 07:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37304.69593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kho35-0004aP-UI; Wed, 25 Nov 2020 06:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37304.69593; Wed, 25 Nov 2020 06:13:03 +0000
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kho35-0004Zz-Qd; Wed, 25 Nov 2020 06:13:03 +0000
Received: by outflank-mailman (input) for mailman id 37304;
 Wed, 25 Nov 2020 06:13:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
 id 1kho34-0004Zu-Lu
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:13:02 +0000
Received: from szxga05-in.huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f5b77e3-1700-4700-99a3-6e83c2ff9c5c;
 Wed, 25 Nov 2020 06:12:59 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgrCH57LvzLtxm;
 Wed, 25 Nov 2020 14:12:27 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:12:51 +0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
	id 1kho34-0004Zu-Lu
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:13:02 +0000
X-Inumbo-ID: 1f5b77e3-1700-4700-99a3-6e83c2ff9c5c
Received: from szxga05-in.huawei.com (unknown [45.249.212.191])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1f5b77e3-1700-4700-99a3-6e83c2ff9c5c;
	Wed, 25 Nov 2020 06:12:59 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgrCH57LvzLtxm;
	Wed, 25 Nov 2020 14:12:27 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:12:51 +0800
Subject: Re: [PATCH 43/45] f2fs: remove a few bd_part checks
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Coly Li <colyli@suse.de>, "Mike
 Snitzer" <snitzer@redhat.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, Johannes Thumshirn
	<johannes.thumshirn@wdc.com>, <dm-devel@redhat.com>, Richard Weinberger
	<richard@nod.at>, Jan Kara <jack@suse.com>, <linux-block@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-bcache@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-44-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2c7a8f2a-37a3-38c2-9256-6aae2c7a45c1@huawei.com>
Date: Wed, 25 Nov 2020 14:12:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-44-hch@lst.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected

On 2020/11/24 21:27, Christoph Hellwig wrote:
> bd_part is never NULL for a block device in use by a file system, so
> remove the checks.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

