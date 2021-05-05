Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEA37364F
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122922.231911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCxs-0003sM-Qb; Wed, 05 May 2021 08:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122922.231911; Wed, 05 May 2021 08:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCxs-0003pU-M9; Wed, 05 May 2021 08:33:04 +0000
Received: by outflank-mailman (input) for mailman id 122922;
 Wed, 05 May 2021 08:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leCxr-0003pM-8W
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:33:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8c7a540-229e-4ab4-9cd8-039ab2f05fb9;
 Wed, 05 May 2021 08:33:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49963AEAA;
 Wed,  5 May 2021 08:33:01 +0000 (UTC)
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
X-Inumbo-ID: e8c7a540-229e-4ab4-9cd8-039ab2f05fb9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620203581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fIrYYZIsuD5cDHv/EswPEc6D4K2Envn/oR6SbwpRTs=;
	b=Gke1c/b3xJY5JU1zy933eVVCgT4FPF6ociC1hEr6SvHur2OXRqRRAsW2j96xDYKZiIQY92
	4M7N5wz7KYZR2Maxo/8F82agfDp59Qjc8RBzhMqEqAiGito9bTLZhW3RFi5K7f73csYIKR
	VAd2QDGeh3W+qD9yzqGRnbypUV2KvSg=
Subject: Re: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-6-andrew.cooper3@citrix.com>
 <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
 <1279476a-f99d-59a4-7fed-1aee37dbe204@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d951dc24-e613-8a1d-13ea-b1e439048165@suse.com>
Date: Wed, 5 May 2021 10:33:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1279476a-f99d-59a4-7fed-1aee37dbe204@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 16:17, Andrew Cooper wrote:
> On 04/05/2021 13:56, Jan Beulich wrote:
>> On 03.05.2021 17:39, Andrew Cooper wrote:
>>> +unsigned int xstate_compressed_size(uint64_t xstates)
>>> +{
>>> +    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
>>> +
>>> +    xstates &= ~XSTATE_FP_SSE;
>>> +    for_each_set_bit ( i, &xstates, 63 )
>>> +    {
>>> +        if ( test_bit(i, &xstate_align) )
>>> +            size = ROUNDUP(size, 64);
>>> +
>>> +        size += xstate_sizes[i];
>>> +    }
>>> +
>>> +    /* In debug builds, cross-check our calculation with hardware. */
>>> +    if ( IS_ENABLED(CONFIG_DEBUG) )
>>> +    {
>>> +        unsigned int hwsize;
>>> +
>>> +        xstates |= XSTATE_FP_SSE;
>>> +        hwsize = hw_compressed_size(xstates);
>>> +
>>> +        if ( size != hwsize )
>>> +            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
>>> +                        __func__, xstates, size, hwsize);
>>> +        size = hwsize;
>> To be honest, already on the earlier patch I was wondering whether
>> it does any good to override size here: That'll lead to different
>> behavior on debug vs release builds. If the log message is not
>> paid attention to, we'd then end up with longer term breakage.
> 
> Well - our options are pass hardware size, or BUG(), because getting
> this wrong will cause memory corruption.

I'm afraid I'm lost: Neither passing hardware size nor BUG() would
happen in a release build, so getting this wrong does mean memory
corruption there. And I'm of the clear opinion that debug builds
shouldn't differ in behavior in such regards.

If there wasn't an increasing number of possible combinations I
would be inclined to suggest that in all builds we check during
boot that calculation and hardware provided values match for all
possible (valid) combinations.

> The BUG() option is a total pain when developing new support - the first
> version of this patch did use BUG(), but after hitting it 4 times in a
> row (caused by issues with constants elsewhere), I decided against it.

I can fully understand this aspect. I'm not opposed to printk_once()
at all. My comment was purely towards the override.

> If we had something which was a mix between WARN_ONCE() and a proper
> printk() explaining what was going on, then I would have used that. 
> Maybe it's time to introduce one...

I don't think there's a need here - what you have in terms of info
put into the log is imo sufficient.

Jan

