Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1377B73A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 13:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583544.913779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVVKU-0004u7-5O; Mon, 14 Aug 2023 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583544.913779; Mon, 14 Aug 2023 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVVKU-0004rW-2l; Mon, 14 Aug 2023 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 583544;
 Mon, 14 Aug 2023 11:01:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVVKT-0004rQ-1N
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 11:01:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVVKP-0004BB-Jt; Mon, 14 Aug 2023 11:01:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVVKP-0007rP-EH; Mon, 14 Aug 2023 11:01:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=np1smFiQUqiwl3wpzguDn2GPK8DNcvLvotZAk03PP5M=; b=PJehCxmq45XmmKVunKkHE1PFh0
	Ugz3Zm9pflcBo3KZ1/R6fjRl1DHvqMUPTx5cyFaEOAcpjqT2ja2iJlDYWm85H1oVWtOnBFGGkEvbi
	x0qxnYqcMdBUZJ8w/bEFYv6mEnyOgcbr5O3uip1MCpgVlf4+S5WORNcTPENbzwq0vgeA=;
Message-ID: <935367a1-7fc1-4df6-901a-e25e983aeed6@xen.org>
Date: Mon, 14 Aug 2023 12:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <30d1ef98-d847-b0ca-6771-4bc0abcdb214@suse.com>
 <808999f0142825bebfdbe16a309d529f@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <808999f0142825bebfdbe16a309d529f@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 11:33, Nicola Vetrini wrote:
> On 14/08/2023 09:39, Jan Beulich wrote:
>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>> The missing header included by this patch provides declarations for
>>> the functions 
>>> 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
>>> that are defined in the source file. This also resolves violations
>>> of MISRA C:2012 Rule 8.4.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs 
>>> and p2m_vm_event_fill_regs")
>>> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
>>> Fixes: 9864841914c2 ("x86/vm_event: add support for 
>>> VM_EVENT_REASON_INTERRUPT")
>>
>> It's hard to see how it can be three commit here. The oldest one is at
>> fault, I would say.
> 
> Since the patch is concerned with more than one function then in a sense 
> I agree
> with you (the headers should have been included in the proper way the 
> first time around), but
> then more definitions have been added by adc75eba8b15 and 9864841914c2, 
> and these should have
> triggered a refactoring too. I can leave just 975efd3baa8d in the Fixes 
> if the preferred way is to list just the first problematic commit 
> (perhaps with a little explanation after --- ).

To be honest, I don't exactly see the value of using Fixes tag for those 
patches. I agree they are technically issues, but they are unlikely 
going to be backported.

So if it were me, I would just drop all the Fixes tags for missing 
includes unless there is an actual bug associated
with them (e.g. a caller was miscalling the function because the
prototype was incorrect).

Cheers,

-- 
Julien Grall

