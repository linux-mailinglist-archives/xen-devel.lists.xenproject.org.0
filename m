Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326092278E4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 08:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxltQ-00006H-JO; Tue, 21 Jul 2020 06:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxltP-00006C-35
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 06:36:47 +0000
X-Inumbo-ID: 8b919e48-cb1c-11ea-a087-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b919e48-cb1c-11ea-a087-12813bfff9fa;
 Tue, 21 Jul 2020 06:36:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40851B861;
 Tue, 21 Jul 2020 06:36:51 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
 <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
 <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
 <e15eb2d0-800f-4fbd-6d58-8bceb408593f@suse.com>
Message-ID: <9d5c7a0d-e34a-9fe4-c24d-871c4b5cb3d8@suse.com>
Date: Tue, 21 Jul 2020 08:36:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e15eb2d0-800f-4fbd-6d58-8bceb408593f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 18:27, Jan Beulich wrote:
> On 20.07.2020 17:28, Andrew Cooper wrote:
>> On 16/07/2020 11:06, Jan Beulich wrote:
>>> ACCESS_ONCE() guarantees single access, but doesn't guarantee that
>>> the compiler wouldn't split this single access into multiple insns.
>>
>> ACCESS_ONCE() does guarantee single accesses for any natural integer size.
>>
>> There is a section about this specifically in Linux's
>> memory-barriers.txt, and this isn't the first time I've pointed it out...
> 
> There indeed is text stating this, but I can't find any word on
> why they believe this is the case. My understanding of volatile
> is that it guarantees no more (and also no less) accesses to
> any single storage location than indicated by the source. But
> it doesn't prevent "tearing" of accesses. And really, how could
> it, considering that volatile can also be applied to types that
> aren't basic ones, and hence in particular to ones that can't
> possibly be accessed by a single insn?

To avoid a possible reference to *_ONCE() only accepting scalar
types - even the more explicit logic in the Linux constructs
permits "long long". Yet (I'm inclined to say of course) the
compiler makes no effort at all to carry out such a 64-bit
access as a single (atomic) insn on a 32-bit arch (i.e. cmpxchg8b
on ix86, if available). If there really was such a guarantee, it
surely would need to, or diagnose that it can't.

Furthermore I've looked at the current implementation of their
macros:

/*
 * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
 * atomicity or dependency ordering guarantees. Note that this may result
 * in tears!
 */
#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))

#define __READ_ONCE_SCALAR(x)						\
({									\
	__unqual_scalar_typeof(x) __x = __READ_ONCE(x);			\
	smp_read_barrier_depends();					\
	(typeof(x))__x;							\
})

#define READ_ONCE(x)							\
({									\
	compiletime_assert_rwonce_type(x);				\
	__READ_ONCE_SCALAR(x);						\
})

The difference between __READ_ONCE() and READ_ONCE() effectively
is merely the smp_read_barrier_depends() afaics. Hence to me the
"tears" in the comment can only refer to "tear drops", not to
"torn accesses". The comment ahead of
compiletime_assert_rwonce_type() is also "interesting":

/*
 * Yes, this permits 64-bit accesses on 32-bit architectures. These will
 * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
 * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
 * (e.g. a virtual address) and a strong prevailing wind.
 */

(I'm struggling to see what extra effects this construct has over
the type enforcement by __unqual_scalar_typeof().)

Jan

