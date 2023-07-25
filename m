Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E680761E40
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569832.890978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKit-00040W-Me; Tue, 25 Jul 2023 16:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569832.890978; Tue, 25 Jul 2023 16:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKit-0003xt-J7; Tue, 25 Jul 2023 16:17:19 +0000
Received: by outflank-mailman (input) for mailman id 569832;
 Tue, 25 Jul 2023 16:17:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Iib=DL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOKir-0003xh-TP
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:17:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8271c40-2b06-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 18:17:15 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id E338E4EE0738;
 Tue, 25 Jul 2023 18:17:13 +0200 (CEST)
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
X-Inumbo-ID: b8271c40-2b06-11ee-8613-37d641c3527e
Message-ID: <f67b89a1-6479-922b-0991-2af6f8a3802e@bugseng.com>
Date: Tue, 25 Jul 2023 18:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0b489f53751f8f7e80a7be85eb832f90bcadcbb0.1690272371.git.nicola.vetrini@bugseng.com>
 <8a30cc1f-79fb-f202-a602-3645de619825@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <8a30cc1f-79fb-f202-a602-3645de619825@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/07/23 16:52, Jan Beulich wrote:
> On 25.07.2023 11:08, Nicola Vetrini wrote:
>> @@ -99,14 +99,15 @@ static void sched_set_affinity(
>>       struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>>   
>>   static struct sched_resource *cf_check
>> -sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
>> +sched_idle_res_pick(
>> +    const struct scheduler *ops, const struct sched_unit *unit)
>>   {
>>       return unit->res;
>>   }
>>   
>>   static void *cf_check
>> -sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>> -                       void *dd)
>> +sched_idle_alloc_udata(
>> +    const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>   {
>>       /* Any non-NULL pointer is fine here. */
>>       return ZERO_BLOCK_PTR;
> 
> These look like stray changes, presumably resulting from you not fully
> undoing earlier changes.
> 

You're right, they were the byproduct of an earlier edit to this patch.

>> --- a/xen/common/sched/credit2.c
>> +++ b/xen/common/sched/credit2.c
>> @@ -3809,7 +3809,8 @@ csched2_dump(const struct scheduler *ops)
>>       struct list_head *iter_sdom;
>>       struct csched2_private *prv = csched2_priv(ops);
>>       unsigned long flags;
>> -    unsigned int j, loop;
>> +    unsigned int loop;
>> +    int j;
> 
> This looks like a stray change too, just that it's unclear where it is
> coming from.
> 

I thought I added a note to the commit, but I probably did some mistake.
That's why I changed it:

Note: local variable 'j' in xen/common/sched/credit2.c:3888' should
probably be unsigned as well, but I saw while editing the patch
that it's used as a parameter to 'dump_pcpu', which takes an int.
Changing the types of parameters used in these calls is
probably a good target for another patch, as it's not relevant
to Rule 5.3

>> @@ -3884,7 +3885,7 @@ csched2_dump(const struct scheduler *ops)
>>       list_for_each_entry ( rqd, &prv->rql, rql )
>>       {
>>           struct list_head *iter, *runq = &rqd->runq;
>> -        int loop = 0;
>> +        loop = 0;
>>   
>>           /* We need the lock to scan the runqueue. */
>>           spin_lock(&rqd->lock);
> 
> With the switch from declaration to statement, a blank line wants
> inserting (to separate the remaining declaration from the
> statements).
> 

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

