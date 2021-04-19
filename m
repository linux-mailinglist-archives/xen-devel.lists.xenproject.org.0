Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4E3640C4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112849.215175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSLr-0001Jr-A2; Mon, 19 Apr 2021 11:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112849.215175; Mon, 19 Apr 2021 11:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSLr-0001JS-6W; Mon, 19 Apr 2021 11:46:03 +0000
Received: by outflank-mailman (input) for mailman id 112849;
 Mon, 19 Apr 2021 11:46:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYSLp-0001JN-Fu
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:46:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9d57a44-3484-4d8d-9d6a-6a11bfb2aa53;
 Mon, 19 Apr 2021 11:46:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D16DDAF3D;
 Mon, 19 Apr 2021 11:45:59 +0000 (UTC)
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
X-Inumbo-ID: c9d57a44-3484-4d8d-9d6a-6a11bfb2aa53
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618832759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCGs1l9yEBWDJEBTNgcVgb5Q71nS/XvSkI1mkCSsAA8=;
	b=LVDFerTI8469gRHj4hzcbwcQUL8frE9UaEqFmCqv7aZvm/sE4Q05u7jXaMbQOyclMMAMAH
	suv843QFWKY0jiwrsbN4SpHLfjlFt9nV/1KdekRPKJt/Gr6foVOTeNrJU3k355km94oG/S
	aj5jWIkSY0HS6CfwMjaM2qeyre3VF2E=
Subject: Re: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <YH1KZhLrC6anI/Hm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1612e2ac-87ad-4f7f-aaed-05486365b9dc@suse.com>
Date: Mon, 19 Apr 2021 13:46:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YH1KZhLrC6anI/Hm@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.04.2021 11:16, Roger Pau Monné wrote:
> Adding Paul also for the Viridian part.
> 
> On Fri, Apr 16, 2021 at 03:16:41PM +0200, Jan Beulich wrote:
>> Zapping leaf data for out of range leaves is just one half of it: To
>> avoid guests (bogusly or worse) inferring information from mere leaf
>> presence, also shrink maximum indicators such that the respective
>> trailing entry is not all blank (unless of course it's the initial
>> subleaf of a leaf that's not the final one).
>>
>> This is also in preparation of bumping the maximum basic leaf we
>> support, to ensure guests not getting exposed related features won't
>> observe a change in behavior.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
>>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
>> v2: New.
>>
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -8,10 +8,13 @@
>>  #include <err.h>
>>  
>>  #include <xen-tools/libs.h>
>> +#include <xen/asm/x86-defns.h>
>>  #include <xen/asm/x86-vendors.h>
>>  #include <xen/lib/x86/cpu-policy.h>
>>  #include <xen/domctl.h>
>>  
>> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
>> +
>>  static unsigned int nr_failures;
>>  #define fail(fmt, ...)                          \
>>  ({                                              \
>> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
>>      }
>>  }
>>  
>> +static void test_cpuid_maximum_leaf_shrinking(void)
>> +{
>> +    static const struct test {
>> +        const char *name;
>> +        struct cpuid_policy p;
>> +    } tests[] = {
>> +        {
>> +            .name = "basic",
>> +            .p = {
>> +                /* Very basic information only. */
>> +                .basic.max_leaf = 1,
>> +                .basic.raw_fms = 0xc2,
>> +            },
>> +        },
>> +        {
>> +            .name = "cache",
>> +            .p = {
>> +                /* Cache subleaves present. */
>> +                .basic.max_leaf = 4,
>> +                .cache.subleaf[0].type = 1,
> 
> On a private conversation with Andrew he raised the issue that the
> shrinking might be overly simplistic. For example if the x2APIC
> feature bit in leaf 1 is set then the max leaf should be at least 0xb
> in order to be able to fetch the x2APIC ID, even if it's 0.

But in such a case the "type" field of leaf 0xb's first sub-leaf is
going to be non-zero, isn't it?

> I also wonder if we are shrinking the leaves too much, for example we
> should always report up to 0x40000000 (or 0x40000100) plus the Xen
> leaves, as we never hide those and it's also documented in the public
> headers?

Not sure I follow - I'm likely confused by you quoting 0x40000000
and 0x40000100 rather than 0x400000nn and 0x400001nn, as elsewhere
you suggested we may not want to clip sub-leaves there. Can you
clarify whether you really mean only the first sub-leaves (each)
here, and if so why you say "up to"? Furthermore for the Xen leaves
I don't think I do excessive clipping ...

Jan

