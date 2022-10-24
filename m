Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45880609E7E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428797.679308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuIm-0003lP-FD; Mon, 24 Oct 2022 10:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428797.679308; Mon, 24 Oct 2022 10:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuIm-0003ik-CV; Mon, 24 Oct 2022 10:03:24 +0000
Received: by outflank-mailman (input) for mailman id 428797;
 Mon, 24 Oct 2022 10:03:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omuIl-0003ie-Fo
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:03:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omuIi-0008QT-79; Mon, 24 Oct 2022 10:03:20 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omuIh-0008Jw-Vf; Mon, 24 Oct 2022 10:03:20 +0000
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
	bh=KVGmDcLDALE1UjmcPsxOOf/Jnio0oRbU5tW5EsTX0O8=; b=mZU+VzJf/+pSrG62i9LDDOI8wD
	qkcp8e4OSjOnPRM5MdoWPbMmSyQqfJk+YMrJtZeSclj2CefCP1mnJHhs95BNjC4NZnoDnWQ3zz+zw
	e6bq1oD18J9ttfPIlhQH3zfpUiQMapdsv5zGoXWJ2toXIrecbjVRH/WBvn0XQqFsT+ok=;
Message-ID: <b9868745-8e8a-01f2-818b-2efe7b5df5cf@xen.org>
Date: Mon, 24 Oct 2022 11:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v2][4.17?] core-parking: fix build with gcc12 and
 NR_CPUS=1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
 <61e8475d-868d-3ff0-041f-8f6790990ce4@xen.org>
 <8b2d008b-526f-dc36-71d6-81b653bbf467@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8b2d008b-526f-dc36-71d6-81b653bbf467@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/10/2022 08:26, Jan Beulich wrote:
> On 22.10.2022 17:30, Julien Grall wrote:
>> Is this intended for 4.17?
> 
> Well, yes, it was meant to be - it has been ...
> 
>> On 09/09/2022 15:30, Jan Beulich wrote:
> 
> ... well over a month since it was sent.
> 
>>> --- a/xen/arch/x86/sysctl.c
>>> +++ b/xen/arch/x86/sysctl.c
>>> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>>>            long (*fn)(void *);
>>>            void *hcpu;
>>>    
>>> -        switch ( op )
>>> +        switch ( op | -(CONFIG_NR_CPUS == 1) )
>> This code is quite confusing to read and potentially risky as you are
>> are relying the top bit of 'op' to never be 1. While I am expecting this
>> will ever be the case, this will be a "fun" issue to debug if this ever
>> happen. So I would suggest to check CONFIG_NR_CPUS == 1 separately.
> 
> You're aware that we use this pattern in a few other places already (I
> guess in my local tree I have one or two which aren't upstream yet)? Just
> grep for "switch[^_].*[|]" to see them.

I could only spot two upstream in arch/x86/hvm/svm/svm.c and 
arch/x86/hvm/vmx/vmx.c.

But I am not convinced this is a good enough reason to continue to use 
this approach. There are a few bad code examples in Xen and we have been 
pushing against continue to spread certain construct.

> Also note that it's not just the
> top bit of "op" - we merely assume "op" will never be ~0.
Yes, I misread the code.

> Personally I
> prefer this way of coding the logic, but if at least one of the other x86
> maintainers agreed with you, I'd be okay to switch to using a separate
> if().

I am curious why, is it just a matter of taste?

If you really want to go down this route, then I think you should add 
"ASSERT(op != ~0U);" to catch someone introducing a value match that one 
we exclude.

Cheers,

-- 
Julien Grall

