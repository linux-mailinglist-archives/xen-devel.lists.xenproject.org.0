Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9707557A9A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354919.582287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MD8-00077U-Nf; Thu, 23 Jun 2022 12:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354919.582287; Thu, 23 Jun 2022 12:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MD8-00074s-KC; Thu, 23 Jun 2022 12:45:26 +0000
Received: by outflank-mailman (input) for mailman id 354919;
 Thu, 23 Jun 2022 12:45:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4MD6-00074m-JY
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:45:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4MD5-0004uw-KS; Thu, 23 Jun 2022 12:45:23 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4MD5-0005Rt-EN; Thu, 23 Jun 2022 12:45:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vOj3x5eG7FKkJAAA0ZKuy5E0QU6ItYiViCuAxsdpCBE=; b=Xr296QODDGxAfE2eNydTLqgghu
	WvxN1akgMcmoK9im5zWxYzrCA4RR1Idj0yq5/RVTTaTgi1gOplOjYdfVwVzPPuWx14pyM+xs6qwL9
	d9K7fIfXY4WMogd1LH5tHsEur0MY7rfQhwjQkTXP8VbGVS4L2mPdlMfjSNNFmdU6yXBY=;
Message-ID: <04a16301-b7d0-3a62-7e71-0cfbfc74d377@xen.org>
Date: Thu, 23 Jun 2022 13:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20220623112407.13604-1-julien@xen.org>
 <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
 <1b0ea627-f325-b290-4159-57aa50d1f713@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1b0ea627-f325-b290-4159-57aa50d1f713@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 23/06/2022 13:41, Andrew Cooper wrote:
> On 23/06/2022 12:28, Juergen Gross wrote:
>> On 23.06.22 13:24, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, corrupt() is neither checking for allocation failure
>>> nor freeing the allocated memory.
>>>
>>> Harden the code by printing ENOMEM if the allocation failed and
>>> free 'str' after the last use.
>>>
>>> This is not considered to be a security issue because corrupt() should
>>> only be called when Xenstored thinks the database is corrupted. Note
>>> that the trigger (i.e. a guest reliably provoking the call) would be
>>> a security issue.
>>>
>>> Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic
>>> ability to recover from store")
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>    tools/xenstore/xenstored_core.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c
>>> b/tools/xenstore/xenstored_core.c
>>> index fa733e714e9a..b6279bdfe229 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -2065,7 +2065,11 @@ void corrupt(struct connection *conn, const
>>> char *fmt, ...)
>>>        va_end(arglist);
>>>          log("corruption detected by connection %i: err %s: %s",
>>> -        conn ? (int)conn->id : -1, strerror(saved_errno), str);
>>> +        conn ? (int)conn->id : -1, strerror(saved_errno),
>>> +        str ? str : "ENOMEM");
> 
> str ?: "ENOMEM"

Sure. I have updated the patch and committed it.

Cheers,

-- 
Julien Grall

