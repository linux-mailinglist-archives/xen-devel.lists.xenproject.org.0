Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDBE2B7A47
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29638.59211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJgx-0005wj-96; Wed, 18 Nov 2020 09:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29638.59211; Wed, 18 Nov 2020 09:23:55 +0000
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
	id 1kfJgx-0005wK-5a; Wed, 18 Nov 2020 09:23:55 +0000
Received: by outflank-mailman (input) for mailman id 29638;
 Wed, 18 Nov 2020 09:23:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJgv-0005wD-NT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:23:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 163ac367-22b2-438a-aa24-485afb418367;
 Wed, 18 Nov 2020 09:23:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 004B0ABDE;
 Wed, 18 Nov 2020 09:23:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJgv-0005wD-NT
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:23:53 +0000
X-Inumbo-ID: 163ac367-22b2-438a-aa24-485afb418367
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 163ac367-22b2-438a-aa24-485afb418367;
	Wed, 18 Nov 2020 09:23:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605691432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPuZTYIAwAqalq/3PBMt9FUGU5aCOv8nZscLB8ryTqE=;
	b=i0CTyeL1nWw+YANGFV2rMzpIxuK6HpHkslVxAt1+sbizisxFXYmthJpOtqYWv5OEwI8nEF
	5up2ifEYyQez4h2UgcHFo2aze20C95gWGI0urEOXhGszYfyJOCLUL6zcVAJa/mzXzhiIoD
	LlL4BiGABS8D6M/Aksgo6qs6jBauHxs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 004B0ABDE;
	Wed, 18 Nov 2020 09:23:51 +0000 (UTC)
Subject: Re: merge struct block_device and struct hd_struct
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Tejun Heo <tj@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
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
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com> <X7Tky/6dDN8+DrU7@kroah.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
Date: Wed, 18 Nov 2020 10:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X7Tky/6dDN8+DrU7@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 10:09, Greg KH wrote:
> On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
>> On 18.11.2020 09:58, Christoph Hellwig wrote:
>>> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
>>>> since this isn't the first series from you recently spamming
>>>> xen-devel, may I ask that you don't Cc entire series to lists
>>>> which are involved with perhaps just one out of the many patches?
>>>> IMO Cc lists should be compiled on a per-patch basis; the cover
>>>> letter may of course be sent to the union of all of them.
>>>
>>> No way.  Individual CCs are completely broken as they don't provide
>>> the reviewer a context.
>>
>> That's the view of some people, but not all. Context can be easily
>> established by those who care going to one of the many archives on
>> which the entire series lands. Getting spammed, however, can't be
>> avoided by the dozens or hundreds of list subscribers.
> 
> kernel patches are never "spam", sorry, but for developers to try to
> determine which lists/maintainers want to see the whole series and which
> do not is impossible.
> 
> Patches in a series are easily deleted from sane mail clients with a
> single click/keystroke all at once, they aren't a problem that needs to
> be reduced in volume.

This doesn't scale, neither in the dimension of recipients nor in
the dimension of possible sources of such series.

While it may seem small, it's also a waste of resources to have mails
sent to hundreds of even thousands of people. So while from a
technical content perspective I surely agree with you saying 'kernel
patches are never "spam"', they still are from the perspective of
what "spam mail" originally means: Mail the recipients did not want
to receive.

Jan

