Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD42B79E3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29594.59126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJNp-0003Ap-Sl; Wed, 18 Nov 2020 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29594.59126; Wed, 18 Nov 2020 09:04:09 +0000
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
	id 1kfJNp-0003AT-Pf; Wed, 18 Nov 2020 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 29594;
 Wed, 18 Nov 2020 09:04:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJNn-0003AO-Ue
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:04:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6c6d9e-a49d-442d-a643-882295991118;
 Wed, 18 Nov 2020 09:04:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19B49B138;
 Wed, 18 Nov 2020 09:04:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJNn-0003AO-Ue
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:04:07 +0000
X-Inumbo-ID: 6a6c6d9e-a49d-442d-a643-882295991118
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6a6c6d9e-a49d-442d-a643-882295991118;
	Wed, 18 Nov 2020 09:04:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605690246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkhYOLJvmFdpwfgmCORfd6M3DajwjiKhI3bCgvrsEjU=;
	b=bmXyeILM/jFC2y7/cL8bo+i+qT42pSFQTqiJfE9lrw1eXqLr2D6ZDxQVQXD+H6sZYclscK
	41e7ZVfbBmnYeTwtVfb+7Gjw2bitCfE/o1RVw9BIO+YSUBtHEGFI6Iz3TDO51XM38Wl3km
	oroI4x9/8G6WspbnyxouqPKxYU34Y7M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19B49B138;
	Wed, 18 Nov 2020 09:04:05 +0000 (UTC)
Subject: Re: merge struct block_device and struct hd_struct
To: Christoph Hellwig <hch@lst.de>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Coly Li <colyli@suse.de>,
 Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Jens Axboe <axboe@kernel.dk>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
Date: Wed, 18 Nov 2020 10:04:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118085804.GA20384@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 09:58, Christoph Hellwig wrote:
> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
>> since this isn't the first series from you recently spamming
>> xen-devel, may I ask that you don't Cc entire series to lists
>> which are involved with perhaps just one out of the many patches?
>> IMO Cc lists should be compiled on a per-patch basis; the cover
>> letter may of course be sent to the union of all of them.
> 
> No way.  Individual CCs are completely broken as they don't provide
> the reviewer a context.

That's the view of some people, but not all. Context can be easily
established by those who care going to one of the many archives on
which the entire series lands. Getting spammed, however, can't be
avoided by the dozens or hundreds of list subscribers.

>  If you don't want xen-blkfront patches to
> go to xen-devel remove it from MAINTAINERS.

Patches to Xen drivers very much ought to go to xen-devel imo, so
no - removal is not an option.

Jan

