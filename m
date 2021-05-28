Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825113940A4
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 12:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133869.249354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZPJ-0007BT-O7; Fri, 28 May 2021 10:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133869.249354; Fri, 28 May 2021 10:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZPJ-00078a-KQ; Fri, 28 May 2021 10:07:57 +0000
Received: by outflank-mailman (input) for mailman id 133869;
 Fri, 28 May 2021 10:07:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmZPI-00078U-74
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 10:07:56 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e59f9ad-a74f-461a-9295-ab9b8eb7908b;
 Fri, 28 May 2021 10:07:55 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61A3A218B0;
 Fri, 28 May 2021 10:07:54 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4E43911A98;
 Fri, 28 May 2021 10:07:54 +0000 (UTC)
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
X-Inumbo-ID: 2e59f9ad-a74f-461a-9295-ab9b8eb7908b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622196474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxygQ/7cUMd/a4ps4mLRCf93NjR5L7PGlVUYjXzH/Mw=;
	b=UIFzD18SUrp0CpzAhsVbfHNRGwI08R9Dm5/aRcZlk58W0KGfFMc5xwMZ51Qs/g0nh7MLrC
	jq4JhoXqcGYpZXbUXoAhUut8QCBDavQPGWgISDGKobzrEKzvHqjurutN+ZS8ZNe+y4IZlW
	1ZSkRcdBJ4Ze7LEJywHXAGnPLo+Au8U=
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
 <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
 <88f2f029-ad2b-4f0d-c683-7ae9d7c92dc6@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d41dd2c3-e204-ea53-f32e-6d6fd8f7615c@suse.com>
Date: Fri, 28 May 2021 12:07:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <88f2f029-ad2b-4f0d-c683-7ae9d7c92dc6@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.05.2021 11:59, Roberto Bagnara wrote:
> On 25/05/21 10:58, Jan Beulich wrote:
>> On 24.05.2021 06:29, Roberto Bagnara wrote:
>>> I stumbled upon parsing errors due to invalid uses of
>>> _Static_assert expanded from HASH_CALLBACKS_CHECK where
>>> the tested expression is not constant, as mandated by
>>> the C standard.
>>>
>>> Judging from the following comment, there is partial awareness
>>> of the fact this is an issue:
>>>
>>> #ifndef __clang__ /* At least some versions dislike some of the uses. */
>>> #define HASH_CALLBACKS_CHECK(mask) \
>>>       BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
>>>
>>> Indeed, this is not a fault of Clang: the point is that some
>>> of the expansions of this macro are not C.  Moreover,
>>> the fact that GCC sometimes accepts them is not
>>> something we can rely upon:
>>>
>>> $ cat p.c
>>> void f() {
>>> static const int x = 3;
>>> _Static_assert(x < 4, "");
>>> }
>>> $ gcc -c -O p.c
>>> $ gcc -c p.c
>>> p.c: In function ‘f’:
>>> p.c:3:20: error: expression in static assertion is not constant
>>> 3 | _Static_assert(x < 4, "");
>>> | ~^~
>>> $
>>
>> I'd nevertheless like to stick to this as long as not proven
>> otherwise by future gcc.
> 
> Just two observations:
> 
> 1) Violating the C standard makes MISRA complicance significantly
>     more difficult.  In addition, it complicates also compiler
>     qualification, for those who are required to do it.
> 
> 2) GCC is already proving otherwise: if you try compiling
>     without optimization, compilation fails.

I'm afraid we have other issues when building without optimization.

In any event - feel free to contribute a patch. As said, I'm not
the maintainer of that piece of code, and you may well find him
agreeing with such a change. He didn't reply yet on the earlier
mail, which would be a prereq to me possibly making a patch
myself.

Jan

