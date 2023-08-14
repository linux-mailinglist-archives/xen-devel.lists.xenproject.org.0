Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F62F77B912
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 14:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583628.913879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVX4O-00045w-Vf; Mon, 14 Aug 2023 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583628.913879; Mon, 14 Aug 2023 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVX4O-00042Z-SL; Mon, 14 Aug 2023 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 583628;
 Mon, 14 Aug 2023 12:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVX4N-00042T-NM
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 12:53:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88342dc0-3aa1-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 14:53:14 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 30F1A4EE0737;
 Mon, 14 Aug 2023 14:53:14 +0200 (CEST)
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
X-Inumbo-ID: 88342dc0-3aa1-11ee-b289-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 14:53:14 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, xen-devel@lists.xenproject.org, tamas@tklengyel.com,
 aisaila@bitdefender.com, ppircalabu@bitdefender.com
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
In-Reply-To: <935367a1-7fc1-4df6-901a-e25e983aeed6@xen.org>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <30d1ef98-d847-b0ca-6771-4bc0abcdb214@suse.com>
 <808999f0142825bebfdbe16a309d529f@bugseng.com>
 <935367a1-7fc1-4df6-901a-e25e983aeed6@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <87c7a0fa02066c65e5e80830d6868014@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 13:01, Julien Grall wrote:
> Hi,
> 
> On 14/08/2023 11:33, Nicola Vetrini wrote:
>> On 14/08/2023 09:39, Jan Beulich wrote:
>>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>>> The missing header included by this patch provides declarations for
>>>> the functions 
>>>> 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
>>>> that are defined in the source file. This also resolves violations
>>>> of MISRA C:2012 Rule 8.4.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs 
>>>> and p2m_vm_event_fill_regs")
>>>> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
>>>> Fixes: 9864841914c2 ("x86/vm_event: add support for 
>>>> VM_EVENT_REASON_INTERRUPT")
>>> 
>>> It's hard to see how it can be three commit here. The oldest one is 
>>> at
>>> fault, I would say.
>> 
>> Since the patch is concerned with more than one function then in a 
>> sense I agree
>> with you (the headers should have been included in the proper way the 
>> first time around), but
>> then more definitions have been added by adc75eba8b15 and 
>> 9864841914c2, and these should have
>> triggered a refactoring too. I can leave just 975efd3baa8d in the 
>> Fixes if the preferred way is to list just the first problematic 
>> commit (perhaps with a little explanation after --- ).
> 
> To be honest, I don't exactly see the value of using Fixes tag for
> those patches. I agree they are technically issues, but they are
> unlikely going to be backported.
> 
> So if it were me, I would just drop all the Fixes tags for missing
> includes unless there is an actual bug associated
> with them (e.g. a caller was miscalling the function because the
> prototype was incorrect).
> 
> Cheers,

Adding those tags for this kind of situation was requested on the 
previous discussion [1],
so in this series I kept the same strategy (though probably here I put 
too many of them).

[1] 
https://lore.kernel.org/xen-devel/cfbc7569-3714-2200-054c-49ba593d6903@suse.com/


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

