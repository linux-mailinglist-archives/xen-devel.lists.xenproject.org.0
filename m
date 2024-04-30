Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CF8B7B64
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715009.1116437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pLq-0004RU-QS; Tue, 30 Apr 2024 15:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715009.1116437; Tue, 30 Apr 2024 15:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pLq-0004Pt-Nb; Tue, 30 Apr 2024 15:25:02 +0000
Received: by outflank-mailman (input) for mailman id 715009;
 Tue, 30 Apr 2024 15:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1pLp-0004PS-PS
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:25:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf4a3210-0705-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:25:00 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1A7F64EE0738;
 Tue, 30 Apr 2024 17:25:00 +0200 (CEST)
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
X-Inumbo-ID: cf4a3210-0705-11ef-909b-e314d9c70b13
MIME-Version: 1.0
Date: Tue, 30 Apr 2024 17:25:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Anthony PERARD <anthony@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/3] xen/unaligned: address violation of MISRA C
 Rule 20.7
In-Reply-To: <a3912e5a-1d97-4df6-8718-0bfdb1189f23@suse.com>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <ec56516020d15cf20419b8bdf6f01fc365c52126.1714487169.git.nicola.vetrini@bugseng.com>
 <a3912e5a-1d97-4df6-8718-0bfdb1189f23@suse.com>
Message-ID: <ca372123278bf8c8f4ceaac788ae7610@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-30 17:13, Jan Beulich wrote:
> On 30.04.2024 16:28, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Somewhat surprisingly, the change in the tools directory is also 
>> needed, otherwise
>> some CI build jobs fail (see e.g. [1]). This is not undefined 
>> behaviour
>> as long as the two definitions are kept in sync, following section
>> 6.10.3p2 of the C99 standard, but having the definition in 
>> common-macros.h
>> is still a potential problem.
>> 
>> [1] 
>> https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/6742878558
> 
> This is pretty absurd, and the use of the Xen header in
> xg_dom_decompress_unsafe_zstd.c should probably have gone away with the
> introduction of the unaligned macros into ...
> 

I agree. I assumed it was known/deliberate.

>> --- a/tools/include/xen-tools/common-macros.h
>> +++ b/tools/include/xen-tools/common-macros.h
>> @@ -102,7 +102,7 @@
>> 
>>  #define put_unaligned_t(type, val, ptr) do {                        \
>>      struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);        \
>> -    ptr_->x = val;                                                  \
>> +    ptr_->x = (val);                                                \
>>  } while (0)
>> 
>>  #define get_unaligned(ptr)      get_unaligned_t(typeof(*(ptr)), ptr)
> 
> ... here. We simply cannot assume the two definitions can indefinitely
> be kept in sync.
> 
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -19,7 +19,7 @@
>> 
>>  #define put_unaligned_t(type, val, ptr) do {				\
>>  	struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);	\
>> -	ptr_->x = val;							\
>> +	ptr_->x = (val);							\
> 
> Nit: One of the padding tabs then wants dropping.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

