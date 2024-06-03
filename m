Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA78D83C7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 15:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734930.1141069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE7cs-0006Tw-3w; Mon, 03 Jun 2024 13:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734930.1141069; Mon, 03 Jun 2024 13:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE7cs-0006Rm-1J; Mon, 03 Jun 2024 13:21:26 +0000
Received: by outflank-mailman (input) for mailman id 734930;
 Mon, 03 Jun 2024 13:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3ZA=NF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sE7cr-0006R7-2k
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 13:21:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2a8f35-21ac-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 15:21:23 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8B42E4EE0737;
 Mon,  3 Jun 2024 15:21:22 +0200 (CEST)
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
X-Inumbo-ID: 2c2a8f35-21ac-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 03 Jun 2024 15:21:22 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/5] xen/domain: deviate violation of MISRA C Rule
 20.12
In-Reply-To: <7e96b887-8fd3-4ecc-a23c-98a46ea1aa8c@suse.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <843540164f7e8f910226e1ded05e153cb04c519d.1717236930.git.nicola.vetrini@bugseng.com>
 <7e96b887-8fd3-4ecc-a23c-98a46ea1aa8c@suse.com>
Message-ID: <91e5a73aaa1abdaa7922774022843932@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-03 08:39, Jan Beulich wrote:
> On 01.06.2024 12:16, Nicola Vetrini wrote:
>> MISRA C Rule 20.12 states: "A macro parameter used as an operand to
>> the # or ## operators, which is itself subject to further macro 
>> replacement,
>> shall only be used as an operand to these operators".
>> 
>> In this case, builds where CONFIG_DEBUG_LOCK_PROFILE=y the domain_lock
>> macro is used both as a regular macro argument and as an operand for
>> stringification in the expansion of macro spin_lock_init_prof.
> 
> The shouldn't the marker be on the definition of spin_lock_init_prof(),
> rather than ...
> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -632,6 +632,7 @@ struct domain *domain_create(domid_t domid,
>> 
>>      atomic_set(&d->refcnt, 1);
>>      RCU_READ_LOCK_INIT(&d->rcu_lock);
>> +    /* SAF-6-safe Rule 20.12 expansion of macro domain_lock in debug 
>> builds */
>>      rspin_lock_init_prof(d, domain_lock);
>>      rspin_lock_init_prof(d, page_alloc_lock);
>>      spin_lock_init(&d->hypercall_deadlock_mutex);
> 
> ... actually just one of the two uses here (and presumably several more
> elsewhere)?
> 
> Jan

Actually it seems that this violation went away with some refactorings, 
so this patch is no longer needed other than for the addition to 
safe.json, so it can be folded into the next one.
I'll make the adjustment.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

