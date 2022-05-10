Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FBC52136E
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325478.548055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNrU-0005aJ-Cc; Tue, 10 May 2022 11:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325478.548055; Tue, 10 May 2022 11:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNrU-0005Wv-9O; Tue, 10 May 2022 11:17:04 +0000
Received: by outflank-mailman (input) for mailman id 325478;
 Tue, 10 May 2022 11:17:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noNrT-0005Wp-El
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:17:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNrS-00041F-In; Tue, 10 May 2022 11:17:02 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNrS-0004l7-CR; Tue, 10 May 2022 11:17:02 +0000
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
	bh=mCxbbTQPQMhPyZIq4yEaMnbmrYRTVPLZu4+MspCr/eg=; b=xyJ71VTD0oVU/XVRZftsUoj1nZ
	buOGgSh3OWLek5qL0C1YxnIyWlRJBV8zMUpCiOxz41MYcPQ2/yl2+fy08cHwKHlK83ocmQPskj5FR
	89KUzYgl96mVHwqZzf5pVmuADqGaLJQLKBzD9I8numn/hbm/oEw8szVDCWA7sHNe1iYQ=;
Message-ID: <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
Date: Tue, 10 May 2022 12:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: Andrew Cooper <amc96@srcf.net>, Lin Liu <lin.liu@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/05/2022 12:09, Andrew Cooper wrote:
> On 10/05/2022 11:51, Julien Grall wrote:
>> On 10/05/2022 11:15, Lin Liu wrote:
>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>> index 4aae281e89..70d3be3be6 100644
>>> --- a/xen/common/device_tree.c
>>> +++ b/xen/common/device_tree.c
>>> @@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct
>>> dt_device_node *np,
>>>        if ( !val || len < sizeof(*out_value) )
>>>            return 0;
>>>    -    *out_value = be32_to_cpup(val);
>>> +    *out_value = be32_to_cpu(*val);
>>
>> This code has been taken from Linux and I would rather prefer to keep
>> the *cpup* helpers to avoid any changes when backporting.
> 
> I specifically requested that this be de-obfuscated.  Hiding indirection
> is a fantastic way to introduce bugs, and we've had XSAs in the past
> because of it (admittedly in libxl, but still...).

Care providing a link to those XSAs? But I don't really see what's the 
problem here, this is no better no worth than passing pointer to other 
functions...

> 
> This file is already Xen style, not Linux, so won't be taking backports
> directly, and the resulting compiler diagnostic will make it obvious
> what is going on. be32_to_cpu(*val) works fine on older versions of Xen too.
> 
> In this case, the cost of changing is well worth the improvements and
> simplifications gained.  See the 0/6 diffstat and see that the compiler
> can make better optimisations when it can see the builtin.

I take your point... However, the commit message provides virtually zero 
justification into why we should switch to be32_to_cpup(). So to me, the 
changes so far looks unwanted.

> 
>>
>>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>>> index 0a2b16d05d..16b2e6f5f0 100644
>>> --- a/xen/include/xen/unaligned.h
>>> +++ b/xen/include/xen/unaligned.h
>>> @@ -20,62 +20,62 @@
>>>      static inline uint16_t get_unaligned_be16(const void *p)
>>>    {
>>> -    return be16_to_cpup(p);
>>> +    return be16_to_cpu(*(const uint16_t *)p)
>>
>> I haven't checked the existing implementation of be16_to_cpup().
> 
> It's a plain dereference, just like this.  AFAICT, it wasn't unaligned
> safe before, either.

Well, technically an architecture could provide an override for the 
copy. I agree that arm32 is already bogus but...

> 
> It should be reasonably easy to fix in a followup patch.  Just memcpy()
> to/from the void pointer to a stack variable of the appropriate type.
... I disagree that it should be fixed in a follow-up patch. It should 
be fixed now as this is where the badness is spread to any architecture.

Cheers,

-- 
Julien Grall

