Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9532FD2D3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71455.127970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EcS-0006jN-QN; Wed, 20 Jan 2021 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71455.127970; Wed, 20 Jan 2021 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EcS-0006ix-Mz; Wed, 20 Jan 2021 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 71455;
 Wed, 20 Jan 2021 14:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2EcR-0006is-VI
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:37:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41147ef4-6e62-4748-882b-9b68b5f569b5;
 Wed, 20 Jan 2021 14:37:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E31EADCD;
 Wed, 20 Jan 2021 14:37:58 +0000 (UTC)
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
X-Inumbo-ID: 41147ef4-6e62-4748-882b-9b68b5f569b5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611153478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXsF0fqiIHWmqnkg3pyZ7W7l886Xfshgy0aqkUvrN9M=;
	b=SgfScqFzkVPkpatFXvNoftOGSRhmibBo8EDmuDZxaczYnZ7D0Ylds7dguNNbCR8TPATyiq
	VpVS+KWnaFc5ZsQv06Cy+kn8t3GVs9mg6/pH6JjqiA0bpknHAIlateNp6pCJDOW1P5Qb8B
	H6PZ26zGtiucZYmRssmXd/2U0L4p5mA=
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe
 <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, Arthur Borsboom <arthurborsboom@gmail.com>
References: <20210119105727.95173-1-roger.pau@citrix.com>
 <CALUcmUkd9Eeau6tC9ZWHbLdvHTYfY34LvK6KKpOOxreYF67Myg@mail.gmail.com>
 <20210120143515.v2vgyhcxrhnnng6r@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83d1aca5-2637-f1f2-3006-69fc6ba76bb4@suse.com>
Date: Wed, 20 Jan 2021 15:37:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120143515.v2vgyhcxrhnnng6r@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.01.2021 15:35, Roger Pau Monné wrote:
> On Wed, Jan 20, 2021 at 03:23:30PM +0100, Arthur Borsboom wrote:
>> Hi Roger,
>>
>> I have set up a test environment based on Linux 5.11.0-rc4.
>> The patch did not apply clean, so I copied/pasted the patch manually.
>>
>> Without the patch the call trace (as reported) is visible in dmesg.
>> With the patch the call trace in dmesg is gone, but ... (there is always a
>> but) ...
>>
>> Now the discard action returns the following.
>>
>> [arthur@test-arch ~]$ sudo fstrim -v /
>> fstrim: /: the discard operation is not supported
>>
>> It might be correct, but of course I was hoping the Xen VM guest would pass
>> on the discard request to the block device in the Xen VM host, which is a
>> disk partition.
>> Any suggestions?
> 
> Hm, that's not what I did see on my testing, the operation worked OK,
> and that's what I would expect to happen in your case also, since I
> know the xenstore keys.

Does discard work on partitions (and not just on entire disks)?
It's been a while since I last had anything to do with this code,
so I may well misremember.

Jan

