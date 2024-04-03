Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E6896746
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700353.1093368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvPp-00088y-PF; Wed, 03 Apr 2024 07:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700353.1093368; Wed, 03 Apr 2024 07:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvPp-00086p-MK; Wed, 03 Apr 2024 07:52:13 +0000
Received: by outflank-mailman (input) for mailman id 700353;
 Wed, 03 Apr 2024 07:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5rf=LI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rrvPo-00086j-1G
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:52:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a10056-f18f-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 09:52:10 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 567724EE0739;
 Wed,  3 Apr 2024 09:52:10 +0200 (CEST)
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
X-Inumbo-ID: 13a10056-f18f-11ee-afe5-a90da7624cb6
MIME-Version: 1.0
Date: Wed, 03 Apr 2024 09:52:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, consulting@bugseng.com, George Dunlap
 <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, Dario Faggioli
 <dfaggioli@suse.com>
Subject: Re: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
In-Reply-To: <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com>
 <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com>
Message-ID: <0d0c8cd162a8bfed07dd374ef2dd62d4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-03 08:33, Jan Beulich wrote:
> On 02.04.2024 09:22, Federico Serafini wrote:
>> Use pseudo-keyword fallthrough to meet the requirements to deviate
>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>> terminate every switch-clause").
>> 
>> No functional change.
>> 
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>  xen/common/sched/credit2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
>> index c76330d79d..0962b52415 100644
>> --- a/xen/common/sched/credit2.c
>> +++ b/xen/common/sched/credit2.c
>> @@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
>>              printk(XENLOG_INFO "Disabling context switch rate 
>> limiting\n");
>>          prv->ratelimit_us = params->ratelimit_us;
>>          write_unlock_irqrestore(&prv->lock, flags);
>> +        fallthrough;
>> 
>> -    /* FALLTHRU */
>>      case XEN_SYSCTL_SCHEDOP_getinfo:
>>          params->ratelimit_us = prv->ratelimit_us;
>>          break;
> 
> Hmm, the description doesn't say what's wrong with the comment. 
> Furthermore
> docs/misra/rules.rst doesn't mention "fallthrough" at all, nor the
> alternative of using comments. I notice docs/misra/deviations.rst does, 
> and
> there the specific comment used here isn't covered. That would want 
> saying
> in the description.
> 
> Stefano (and others) - in this context it becomes noticeable that 
> having
> stuff scattered across multiple doc files isn't necessarily helpful. 
> Other
> permissible keywords are mentioned in rules.rst. The pseudo-keyword
> "fallthrough" as well as comments are mentioned on deviations.rst. 
> Could
> you remind me of the reason(s) why things aren't recorded in a single,
> central place?
> 
> Jan

If I recall correctly, the idea was to avoid rules.rst from getting too 
long and too specific about which patterns were deviated, while also 
having a precise record of the MISRA deviations that didn't live in 
ECLAIR-specific files. Maybe the use of the pseudo-keyword emerged after 
the rule was added to rules.rst, since deviations.rst is updated more 
frequently.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

