Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E13641B2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 14:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112880.215211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYT24-0005DS-Cm; Mon, 19 Apr 2021 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112880.215211; Mon, 19 Apr 2021 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYT24-0005D3-9h; Mon, 19 Apr 2021 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 112880;
 Mon, 19 Apr 2021 12:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYT22-0005Cs-57
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 12:29:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6466cc0f-6eca-4514-8b69-a7efca784128;
 Mon, 19 Apr 2021 12:29:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D8BEB2F1;
 Mon, 19 Apr 2021 12:29:36 +0000 (UTC)
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
X-Inumbo-ID: 6466cc0f-6eca-4514-8b69-a7efca784128
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618835376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKVZCcur7dYkxqBWWCDRpG2QQQciZKjflbkXTg8Hxf0=;
	b=hn4D2UrMEduv0+1yXPwutQOdrobQAE28pVwxzpMXTeRzBOfx76Opk+JmKfQcVKNtZYvFGg
	KSewHtqBhdPLExvpViGrF4xv/c+dOTQaJOcVPGNTKQAAYgqiuZKaBVa53aGsTWxykRDKhM
	kATqjqaZxZV9aQQxW2YiIYgBSQqR06k=
Subject: Re: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <YH1KZhLrC6anI/Hm@Air-de-Roger>
 <1612e2ac-87ad-4f7f-aaed-05486365b9dc@suse.com>
 <YH1y7pFbtz/aWMJ2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c3fb7b9-2ca6-ade8-70b7-482822cc1c22@suse.com>
Date: Mon, 19 Apr 2021 14:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YH1y7pFbtz/aWMJ2@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.04.2021 14:09, Roger Pau Monné wrote:
> On Mon, Apr 19, 2021 at 01:46:02PM +0200, Jan Beulich wrote:
>> On 19.04.2021 11:16, Roger Pau Monné wrote:
>>> Adding Paul also for the Viridian part.
>>>
>>> On Fri, Apr 16, 2021 at 03:16:41PM +0200, Jan Beulich wrote:
>>>> Zapping leaf data for out of range leaves is just one half of it: To
>>>> avoid guests (bogusly or worse) inferring information from mere leaf
>>>> presence, also shrink maximum indicators such that the respective
>>>> trailing entry is not all blank (unless of course it's the initial
>>>> subleaf of a leaf that's not the final one).
>>>>
>>>> This is also in preparation of bumping the maximum basic leaf we
>>>> support, to ensure guests not getting exposed related features won't
>>>> observe a change in behavior.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
>>>>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
>>>> v2: New.
>>>>
>>>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>>>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>>>> @@ -8,10 +8,13 @@
>>>>  #include <err.h>
>>>>  
>>>>  #include <xen-tools/libs.h>
>>>> +#include <xen/asm/x86-defns.h>
>>>>  #include <xen/asm/x86-vendors.h>
>>>>  #include <xen/lib/x86/cpu-policy.h>
>>>>  #include <xen/domctl.h>
>>>>  
>>>> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
>>>> +
>>>>  static unsigned int nr_failures;
>>>>  #define fail(fmt, ...)                          \
>>>>  ({                                              \
>>>> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
>>>>      }
>>>>  }
>>>>  
>>>> +static void test_cpuid_maximum_leaf_shrinking(void)
>>>> +{
>>>> +    static const struct test {
>>>> +        const char *name;
>>>> +        struct cpuid_policy p;
>>>> +    } tests[] = {
>>>> +        {
>>>> +            .name = "basic",
>>>> +            .p = {
>>>> +                /* Very basic information only. */
>>>> +                .basic.max_leaf = 1,
>>>> +                .basic.raw_fms = 0xc2,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "cache",
>>>> +            .p = {
>>>> +                /* Cache subleaves present. */
>>>> +                .basic.max_leaf = 4,
>>>> +                .cache.subleaf[0].type = 1,
>>>
>>> On a private conversation with Andrew he raised the issue that the
>>> shrinking might be overly simplistic. For example if the x2APIC
>>> feature bit in leaf 1 is set then the max leaf should be at least 0xb
>>> in order to be able to fetch the x2APIC ID, even if it's 0.
>>
>> But in such a case the "type" field of leaf 0xb's first sub-leaf is
>> going to be non-zero, isn't it?
> 
> Right, as type 0 is invalid according to Intel SDM, so you will never
> be able to shrink below 0xb while having x2APIC set.
> 
> I still wonder however if there's any other such dependency, where
> shrinking the max cpuid leaf could force us to drop features exposed
> in inferior leaves.

My take is that, just like for the x2APIC case, such leaves won't be
all blank if the qualifying bit is set. Or if one ends up being all
blank, a bug likely sits elsewhere.

Jan

