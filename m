Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156453DDFFF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 21:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163177.298971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAdaK-0007Yk-JN; Mon, 02 Aug 2021 19:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163177.298971; Mon, 02 Aug 2021 19:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAdaK-0007Vu-GI; Mon, 02 Aug 2021 19:26:48 +0000
Received: by outflank-mailman (input) for mailman id 163177;
 Mon, 02 Aug 2021 19:26:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAdaJ-0007Vo-1d
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 19:26:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAdaG-0005AA-Eq; Mon, 02 Aug 2021 19:26:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAdaG-0007ax-7m; Mon, 02 Aug 2021 19:26:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=yLymr9H1OCvndWN80GmoyzBo94ja/hRSde4G9P4ta2E=; b=d8jZc1tvzuI0veWjzeUuB7Se0L
	hN+28bgqiVufZsOUo00chLbRSZu32rlK/lvL3+4zo74I6jHJ3ML5yjqva9R4WLZ6f/Rbv1LfLUR/W
	XHZiiqUxO2Lj/fgh3v17fWmrmzI3MfaJ821LgPmLLVTA8oKbwSrVhM0jhw/gBAOFx0zU=;
Subject: Re: [PATCH v3 1/3] xen/blkfront: read response from backend only once
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Jan Beulich <jbeulich@suse.com>
References: <20210730103854.12681-1-jgross@suse.com>
 <20210730103854.12681-2-jgross@suse.com>
 <ce79a0a8-128d-1d50-d160-f612fbd52101@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <feabcdc6-4166-86d9-b449-42b4abd7e4ec@xen.org>
Date: Mon, 2 Aug 2021 20:26:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ce79a0a8-128d-1d50-d160-f612fbd52101@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 02/08/2021 15:06, Oleksandr Andrushchenko wrote:
> On 30.07.21 13:38, Juergen Gross wrote:
>> In order to avoid problems in case the backend is modifying a response
>> on the ring page while the frontend has already seen it, just read the
>> response into a local buffer in one go and then operate on that buffer
>> only.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>    drivers/block/xen-blkfront.c | 35 ++++++++++++++++++-----------------
>>    1 file changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
>> index d83fee21f6c5..15e840287734 100644
>> --- a/drivers/block/xen-blkfront.c
>> +++ b/drivers/block/xen-blkfront.c
>> @@ -1496,7 +1496,7 @@ static bool blkif_completion(unsigned long *id,
>>    static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>>    {
>>    	struct request *req;
>> -	struct blkif_response *bret;
>> +	struct blkif_response bret;
>>    	RING_IDX i, rp;
>>    	unsigned long flags;
>>    	struct blkfront_ring_info *rinfo = (struct blkfront_ring_info *)dev_id;
>> @@ -1513,8 +1513,9 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>>    	for (i = rinfo->ring.rsp_cons; i != rp; i++) {
>>    		unsigned long id;
>>    
>> -		bret = RING_GET_RESPONSE(&rinfo->ring, i);
>> -		id   = bret->id;
>> +		RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
> 
> As per my understanding copying is still not an atomic operation as the request/response
> 
> are multi-byte structures in general. IOW, what prevents the backend from modifying the ring while
> 
> we are copying?

Nothing and, I believe, you are never going to be able to ensure 
atomicity with large structure (at least between entity that doesn't 
trust each other).

However, what you can do is copying the response once, check that it is 
consistent and then use it. If it is not consistent, then you can report 
an error.

This is better than what's currently in tree. IOW we may have multiple 
read so the code is prone to TOCTOU.

Cheers,

-- 
Julien Grall

