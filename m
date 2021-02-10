Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3177316BD7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 17:56:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83666.156295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9smT-00020h-9w; Wed, 10 Feb 2021 16:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83666.156295; Wed, 10 Feb 2021 16:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9smT-00020L-6Q; Wed, 10 Feb 2021 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 83666;
 Wed, 10 Feb 2021 16:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9smS-00020G-1b
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 16:55:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f145fcb5-7d0d-4417-b674-29d059e1a0a3;
 Wed, 10 Feb 2021 16:55:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 191BBB029;
 Wed, 10 Feb 2021 16:55:53 +0000 (UTC)
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
X-Inumbo-ID: f145fcb5-7d0d-4417-b674-29d059e1a0a3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612976153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vk4MoTQworBG1bMwX+SVQ2xKqRp4qXIzUfgmmm1+rEI=;
	b=nHMQaqB9XajicMz9N209FmqB3OnPTULDiI8uoFKUEfrsnFYsyTuUOm0QfRHzVCtXJQlje7
	fogZ4tRn6N8XMTnN362NNMo0bXgKctIWx6PFOpq55FPv+yXQPkNOycLFK1DBmskVRdD1FM
	ZilajOMSjhh8KA66bhilfFOsFWHRU50=
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
 <YCK3sH/4EVLzRfZ3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3b62090-fdb5-068b-93ab-63f8bebc9d2e@suse.com>
Date: Wed, 10 Feb 2021 17:55:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCK3sH/4EVLzRfZ3@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.02.2021 17:26, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/usercopy.c
>> +++ b/xen/arch/x86/usercopy.c
>> @@ -10,12 +10,19 @@
>>  #include <xen/sched.h>
>>  #include <asm/uaccess.h>
>>  
>> -unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
>> +#ifndef GUARD
>> +# define GUARD UA_KEEP
>> +#endif
>> +
>> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>>  {
>>      unsigned dummy;
>>  
>>      stac();
>>      asm volatile (
>> +        GUARD(
>> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
> 
> Don't you need to also take 'n' into account here to assert that the
> address doesn't end in hypervisor address space? Or that's fine as
> speculation wouldn't go that far?

Like elsewhere this leverages that the hypervisor VA range starts
immediately after the non-canonical hole. I'm unaware of
speculation being able to cross over that hole.

> I also wonder why this needs to be done in assembly, could you check
> the address(es) using C?

For this to be efficient (in avoiding speculation) the insn
sequence would better not have any conditional jumps. I don't
think the compiler can be told so.

>> --- a/xen/include/asm-x86/uaccess.h
>> +++ b/xen/include/asm-x86/uaccess.h
>> @@ -13,13 +13,19 @@
>>  unsigned copy_to_user(void *to, const void *from, unsigned len);
>>  unsigned clear_user(void *to, unsigned len);
>>  unsigned copy_from_user(void *to, const void *from, unsigned len);
>> +
>>  /* Handles exceptions in both to and from, but doesn't do access_ok */
>> -unsigned __copy_to_user_ll(void __user*to, const void *from, unsigned n);
>> -unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n);
>> +unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);
>> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n);
>> +unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
>> +unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
>>  
>>  extern long __get_user_bad(void);
>>  extern void __put_user_bad(void);
>>  
>> +#define UA_KEEP(args...) args
>> +#define UA_DROP(args...)
> 
> I assume UA means user access, and since you have dropped other uses
> of user and changed to guest instead I wonder if we should name this
> just A_{KEEP/DROP}.

Like in the name of the file I mean to see 'u' stand for "unsafe"
going forward. (A single letter name prefix would also seem more
prone to future collisions to me.)

Jan

