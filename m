Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91941C378E
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 13:04:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYsp-0000Be-S9; Mon, 04 May 2020 11:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wWN=6S=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jVYso-0000BV-QT
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 11:03:34 +0000
X-Inumbo-ID: e5b10ebc-8df6-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b10ebc-8df6-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pl1JyEmI8kJpZFr3F+5sLPnq+7U81PdGVp1RtwwgB3A=; b=LPax6YDSThI3eBFzrLXQ/Z0g5v
 fJJ6MKWVAH0LjIo3aJhv68o0/xMOOumcSCjZqMI/dzeYog0sbbYuk73u1AWdH4qlX/rx+WWm+V8MV
 sFfqoTXSEDo0FgSu95mCgkjUc8erbB+tFrKQ4AKngDGQeLptpilvp6KxZeWn3qRTZPzc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jVYsm-0006ZE-TQ; Mon, 04 May 2020 11:03:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jVYsm-0001wn-MJ; Mon, 04 May 2020 11:03:32 +0000
Subject: Re: [PATCH for-4.14 3/3] xen/x86: atomic: Don't allow to write
 atomically in a pointer to const
To: Jan Beulich <jbeulich@suse.com>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-4-julien@xen.org>
 <9270c034-4a12-19b4-459f-45c95c9a5c48@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <154a6790-3c9a-ed2b-e4df-9fb5c9315d9e@xen.org>
Date: Mon, 4 May 2020 12:03:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9270c034-4a12-19b4-459f-45c95c9a5c48@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 04/05/2020 11:47, Jan Beulich wrote:
> On 02.05.2020 18:07, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, write_atomic() will happily write to a pointer to const.
>> While there are no use in Xen, it would be best to catch them at
>> compilation time.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
>> --- a/xen/include/asm-x86/atomic.h
>> +++ b/xen/include/asm-x86/atomic.h
>> @@ -63,6 +63,8 @@ void __bad_atomic_size(void);
>>   
>>   #define write_atomic(p, x) ({                             \
>>       typeof(*(p)) __x = (x);                               \
>> +    /* Check that the pointer is not const */             \
>> +    void *__maybe_unused p_ = &__x;                       \
> 
> ... along the lines of the similar case with guest handles I'd
> like to suggest for the comment to be more precise: It's not
> the pointer's const-ness you're after, but the pointed to
> object's. Maybe "Check that the pointer is not to a const
> type" or even just "Check that the pointer is not to const"?

I am happy with "Check that the pointer is not to a const type".

Cheers,

-- 
Julien Grall

