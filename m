Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E885D7B2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683993.1063620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rclPC-00088G-8n; Wed, 21 Feb 2024 12:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683993.1063620; Wed, 21 Feb 2024 12:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rclPC-00085r-6D; Wed, 21 Feb 2024 12:08:54 +0000
Received: by outflank-mailman (input) for mailman id 683993;
 Wed, 21 Feb 2024 12:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QV5I=J6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rclPB-00085l-1q
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:08:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f33532-d0b1-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 13:08:51 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5BBD94EE0737;
 Wed, 21 Feb 2024 13:08:51 +0100 (CET)
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
X-Inumbo-ID: f9f33532-d0b1-11ee-8a53-1f161083a0e0
MIME-Version: 1.0
Date: Wed, 21 Feb 2024 13:08:51 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
 <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
Message-ID: <1743b4248d30a4e8b68a150c25724caa@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-20 09:14, Nicola Vetrini wrote:
> On 2024-02-20 08:45, Jan Beulich wrote:
>> On 19.02.2024 16:14, Nicola Vetrini wrote:
>>> The cache clearing and invalidation helpers in x86 and Arm didn't
>>> comply with MISRA C Rule 17.7: "The value returned by a function
>>> having non-void return type shall be used". On Arm they
>>> were always returning 0, while some in x86 returned -EOPNOTSUPP
>>> and in common/grant_table the return value is saved.
>>> 
>>> As a consequence, a common helper arch_grant_cache_flush that returns
>>> an integer is introduced, so that each architecture can choose 
>>> whether to
>>> return an error value on certain conditions, and the helpers have 
>>> either
>>> been changed to return void (on Arm) or deleted entirely (on x86).
>>> 
>>> Signed-off-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> The original refactor idea came from Julien Grall in [1]; I edited 
>>> that proposal
>>> to fix build errors.
>>> 
>>> I did introduce a cast to void for the call to flush_area_local on 
>>> x86, because
>>> even before this patch the return value of that function wasn't 
>>> checked in all
>>> but one use in x86/smp.c, and in this context the helper (perhaps 
>>> incidentally)
>>> ignored the return value of flush_area_local.
>> 
>> I object to such casting to void, at least until there's an overriding
>> decision that for Misra purposes such casts may be needed.
>> 
> 
> There are three choices here:
> 1. cast to void
> 2. deviation for flush_area_local, which for the case of the cache 
> helpers is what led to this patch; it may still be a viable option, if 
> other maintainers agree
> 3. refactor of flush_area_local; this is not viable here because the 
> return value is actually used and useful, as far as I can tell, in 
> smp.c
> 
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -123,6 +123,7 @@
>>> 
>>>  #ifndef __ASSEMBLY__
>>> 
>>> +#include <public/grant_table.h>
>> 
>> This is a no-go, imo (also on x86): Adding this include here 
>> effectively
>> means that nearly every CU will have a dependency on that header, no
>> matter that most are entirely agnostic of grants. Each arch has a
>> grant_table.h - is there any reason the new, grant-specific helper 
>> can't
>> be put there?
>> 
> 
> I would have to test, but I think that can be done
> 

The only blocker so far is that this triggers a build error due to a 
circular dependency between xen/mm.h and asm/flushtlb.h on x86. Also 
found some earlier evidence [1] that there are some oddities around 
asm/flushtlb's inclusion.

[1] 
https://lore.kernel.org/xen-devel/20200318210540.5602-1-andrew.cooper3@citrix.com/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

