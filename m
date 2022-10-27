Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E191460F6F4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 14:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431027.683479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1oE-0001E0-VE; Thu, 27 Oct 2022 12:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431027.683479; Thu, 27 Oct 2022 12:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1oE-0001B5-SK; Thu, 27 Oct 2022 12:16:30 +0000
Received: by outflank-mailman (input) for mailman id 431027;
 Thu, 27 Oct 2022 12:16:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oo1oD-0001Az-Px
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 12:16:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo1oD-00028u-Gb; Thu, 27 Oct 2022 12:16:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo1oD-00058G-A3; Thu, 27 Oct 2022 12:16:29 +0000
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
	bh=FJJMI/vWB0SZNbUk42SkCM/ifuJWIC68Bm0gRG/TQo4=; b=EEJ4U8h+opf3MsuoZbb8P/3jbe
	3/1w2TN9j1vgWrUag4xIGYMpFkB4eT5eCRVDefyw8ktFedo0CLTg+9HxcrFerxriT29o53YHZNbvM
	XA6aenflD5yT9Z6rUX77u96xHc3tx9eok83432gcqVQgwSyLMo6fBEEgtBonncZMB89A=;
Message-ID: <917e09d6-ee94-2c85-c35a-2bb8a5bfc6f5@xen.org>
Date: Thu, 27 Oct 2022 13:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221025092112.50168-1-Henry.Wang@arm.com>
 <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
 <AS8PR08MB79915FB6F828D7650E85BDA092309@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79915FB6F828D7650E85BDA092309@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2022 01:24, Henry Wang wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
>>
>> Hi Henry,
>>
>> On 25/10/2022 10:21, Henry Wang wrote:
>>> This series is a backported series for XSA-409 fixes from master for
>>> 4.14 to 4.16, which cherry-picking commits:
>>> 3783e583319f arm/p2m: Rework p2m_init()
>>> c7cff1188802 xen/arm: p2m: Populate pages for GICv2 mapping in
>> p2m_init()
>>
>> I have merged the 2 patches in Xen 4.16, 4.15 and 4.14.
> 
> Thank you very much!
> 
>> I noticed that the "released-acked-by" tags were removed.
> 
> Yeah, I cannot find any "Release-acked-by" from all the backported
> patches so I removed that tag for convenience of the maintainer doing
> the backport.
> 
>>
>> We usually keep the commit message as-is (including tags). But I vaguely
>> remember that we may have stripped the "released-acked-by" tag in the
>> past. So I left it alone.
> 
> Thanks.
> 
>>
>> Also, it looks like the tools I am using to download the patches (b4)
>> decided to move the "cherry-picked ..." line before the tags. I am not
>> entirely sure why... So I have modified the commit message to re-add the
>> line where you initially added (this is the correct place!).
> 
> Hmmm this is strange...probably b4 thinks this "cherry picked commit" is
> some kind of unnecessary information which shouldn't appear in the commit
> message :)

I am guessing 'b4' is removing all the tags and then append them at the end.

> 
> My initial thought was adding the "cherry picked commit" would reduce
> the maintainer's workload so the patch can be applied without any modification
> but it seems that you still did some extra work....sorry about that.

You did the right thing to add the cherry-pick tag. This is more my 
workflow that is broken :). I will have a look if I can fix it.

Cheers,

-- 
Julien Grall

