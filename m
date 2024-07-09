Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5992B4F7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 12:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756048.1164615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7t0-00031b-AN; Tue, 09 Jul 2024 10:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756048.1164615; Tue, 09 Jul 2024 10:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7t0-0002z6-7b; Tue, 09 Jul 2024 10:15:50 +0000
Received: by outflank-mailman (input) for mailman id 756048;
 Tue, 09 Jul 2024 10:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VCn=OJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sR7sy-0002z0-L1
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 10:15:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350ed704-3ddc-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 12:15:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CAA984EE0742;
 Tue,  9 Jul 2024 12:15:45 +0200 (CEST)
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
X-Inumbo-ID: 350ed704-3ddc-11ef-bbfb-fd08da9f4363
MIME-Version: 1.0
Date: Tue, 09 Jul 2024 12:15:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH for-4.19] xen/bitmap: amend MISRA C deviation for Rule
 20.7
In-Reply-To: <ecfef639-11ed-4f7c-81de-d1a6c230c465@suse.com>
References: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com>
 <ecfef639-11ed-4f7c-81de-d1a6c230c465@suse.com>
Message-ID: <2ff60858147e1dd501ec59c38a7a41b4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-09 11:40, Jan Beulich wrote:
> On 09.07.2024 11:34, Nicola Vetrini wrote:
>> As noticed in the gitlab analyses, deviating bitmap_switch
>> for Rule 20.7 in this way does not work for ECLAIR.
>> 
>> Instead, the deviation should be put in the macro invocation.
> 
> Why is this? I ask in particular because ...
> 
>> --- a/xen/include/xen/bitmap.h
>> +++ b/xen/include/xen/bitmap.h
>> @@ -103,18 +103,16 @@ extern int bitmap_allocate_region(unsigned long 
>> *bitmap, int pos, int order);
>>  #define bitmap_switch(nbits, zero, small, large)			  \
>>  	unsigned int n__ = (nbits);					  \
>>  	if (__builtin_constant_p(nbits) && !n__) {			  \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>  		zero;							  \
>>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>  		small;							  \
>>  	} else {							  \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>  		large;							  \
>>  	}
>> 
>>  static inline void bitmap_zero(unsigned long *dst, unsigned int 
>> nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = 0UL,
>>  		memset(dst, 0, bitmap_bytes(nbits)));
>> @@ -139,6 +137,7 @@ static inline void bitmap_fill(unsigned long *dst, 
>> unsigned int nbits)
>>  static inline void bitmap_copy(unsigned long *dst, const unsigned 
>> long *src,
>>  			unsigned int nbits)
>>  {
>> +        /* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = *src,
>>  		memcpy(dst, src, bitmap_bytes(nbits)));
>> @@ -147,6 +146,7 @@ static inline void bitmap_copy(unsigned long *dst, 
>> const unsigned long *src,
>>  static inline void bitmap_and(unsigned long *dst, const unsigned long 
>> *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = *src1 & *src2,
>>  		__bitmap_and(dst, src1, src2, nbits));
>> @@ -155,6 +155,7 @@ static inline void bitmap_and(unsigned long *dst, 
>> const unsigned long *src1,
>>  static inline void bitmap_or(unsigned long *dst, const unsigned long 
>> *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = *src1 | *src2,
>>  		__bitmap_or(dst, src1, src2, nbits));
>> @@ -163,6 +164,7 @@ static inline void bitmap_or(unsigned long *dst, 
>> const unsigned long *src1,
>>  static inline void bitmap_xor(unsigned long *dst, const unsigned long 
>> *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = *src1 ^ *src2,
>>  		__bitmap_xor(dst, src1, src2, nbits));
>> @@ -171,6 +173,7 @@ static inline void bitmap_xor(unsigned long *dst, 
>> const unsigned long *src1,
>>  static inline void bitmap_andnot(unsigned long *dst, const unsigned 
>> long *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = *src1 & ~*src2,
>>  		__bitmap_andnot(dst, src1, src2, nbits));
>> @@ -179,6 +182,7 @@ static inline void bitmap_andnot(unsigned long 
>> *dst, const unsigned long *src1,
>>  static inline void bitmap_complement(unsigned long *dst, const 
>> unsigned long *src,
>>  			unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,,
>>  		*dst = ~*src & BITMAP_LAST_WORD_MASK(nbits),
>>  		__bitmap_complement(dst, src, nbits));
>> @@ -187,6 +191,7 @@ static inline void bitmap_complement(unsigned long 
>> *dst, const unsigned long *sr
>>  static inline int bitmap_equal(const unsigned long *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,
>>  		return -1,
>>  		return !((*src1 ^ *src2) & BITMAP_LAST_WORD_MASK(nbits)),
>> @@ -196,6 +201,7 @@ static inline int bitmap_equal(const unsigned long 
>> *src1,
>>  static inline int bitmap_intersects(const unsigned long *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,
>>  		return -1,
>>  		return ((*src1 & *src2) & BITMAP_LAST_WORD_MASK(nbits)) != 0,
>> @@ -205,6 +211,7 @@ static inline int bitmap_intersects(const unsigned 
>> long *src1,
>>  static inline int bitmap_subset(const unsigned long *src1,
>>  			const unsigned long *src2, unsigned int nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,
>>  		return -1,
>>  		return !((*src1 & ~*src2) & BITMAP_LAST_WORD_MASK(nbits)),
>> @@ -213,6 +220,7 @@ static inline int bitmap_subset(const unsigned 
>> long *src1,
>> 
>>  static inline int bitmap_empty(const unsigned long *src, unsigned int 
>> nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,
>>  		return -1,
>>  		return !(*src & BITMAP_LAST_WORD_MASK(nbits)),
>> @@ -221,6 +229,7 @@ static inline int bitmap_empty(const unsigned long 
>> *src, unsigned int nbits)
>> 
>>  static inline int bitmap_full(const unsigned long *src, unsigned int 
>> nbits)
>>  {
>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>  	bitmap_switch(nbits,
>>  		return -1,
>>  		return !(~*src & BITMAP_LAST_WORD_MASK(nbits)),
> 
> ... having the same comment on every invocation is naturally quite a 
> bit
> less desirable. So far I was under the impression that macro-specific
> deviations can be dealt with by marking the macro definition 
> accordingly.

Not with a comment-based one, but one based on ECL.
As stated under the cut:
An alternative approach would be to use an ecl configuration, but that
would be tool-specific.

Stefano had a preference for a tool-agnostic SAF comment, so that's what 
I used.

> I've been assuming this is a general pattern. If it isn't, would you
> please first clarify what Eclair's specific requirements are for a SAF
> marker to take effect when involving a macro?
> 

it should be put directly above macro invocations. ECLAIR has a 
tool-specific comment-based deviation that essentially deviates a range 
of lines, but that is not supported by the SAF framework, so I avoided 
that.

Is it safe to say that the uses of bitmap_switch will likely not change 
much over time?

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

