Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753D76EC5B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576427.902555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZDK-0007Bi-JW; Thu, 03 Aug 2023 14:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576427.902555; Thu, 03 Aug 2023 14:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZDK-00078q-Fu; Thu, 03 Aug 2023 14:22:06 +0000
Received: by outflank-mailman (input) for mailman id 576427;
 Thu, 03 Aug 2023 14:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRme=DU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRZDI-00078k-Vp
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:22:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e0d5c87-3209-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 16:22:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 32DA14EE0737;
 Thu,  3 Aug 2023 16:22:03 +0200 (CEST)
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
X-Inumbo-ID: 1e0d5c87-3209-11ee-b268-6b7b168915f2
MIME-Version: 1.0
Date: Thu, 03 Aug 2023 16:22:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
 <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 11:01, Jan Beulich wrote:
> On 03.08.2023 04:13, Stefano Stabellini wrote:
>> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>>> @@ -1169,8 +1170,6 @@ static void cf_check 
>>> irq_guest_eoi_timer_fn(void *data)
>>> 
>>>      switch ( action->ack_type )
>>>      {
>>> -        cpumask_t *cpu_eoi_map;
>> 
>> It is only used by case ACKTYPE_EOI so it can be moved there (with a 
>> new
>> block):
>> 
>> 
>>     case ACKTYPE_EOI:
>>     {
>>         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
>>         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
>>         spin_unlock_irq(&desc->lock);
>>         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
>>         return;
>>     }
>>     }
> 
> This pattern (two closing braces at the same level) is why switch scope
> variable declarations were introduced (at least as far as introductions
> by me go). If switch scope variables aren't okay (which I continue to
> consider questionable), then this stylistic aspect needs sorting first
> (if everyone else thinks the above style is okay - with the missing
> blank line inserted -, then so be it).
> 
> Jan

Actually, they can be deviated because they don't result in wrong code 
being generated.
This, modulo the review comments received, is what most of the code 
would look like if
they weren't, with the biggest pain point being that in many cases the 
choice is either
the pattern with blocks for certain clauses or moving them in the 
enclosing scope, which may
be several hundred lines above. If there's agreement on deviating them, 
I can drop the patches
dealing with switches and do a v2 with just the other modifications.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

