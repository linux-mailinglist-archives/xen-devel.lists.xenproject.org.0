Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387E76E273
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576054.901767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTMM-0000vF-1m; Thu, 03 Aug 2023 08:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576054.901767; Thu, 03 Aug 2023 08:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTML-0000tF-V0; Thu, 03 Aug 2023 08:07:01 +0000
Received: by outflank-mailman (input) for mailman id 576054;
 Thu, 03 Aug 2023 08:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRme=DU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRTMK-0000t9-ND
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:07:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b846049c-31d4-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 10:06:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8A7EC4EE0737;
 Thu,  3 Aug 2023 10:06:58 +0200 (CEST)
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
X-Inumbo-ID: b846049c-31d4-11ee-b268-6b7b168915f2
MIME-Version: 1.0
Date: Thu, 03 Aug 2023 10:06:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] x86/mce: address MISRA C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2308021844020.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com>
 <52ec7caf08089e3aaaad2bcf709a7d387d55d58f.1690969271.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021844020.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <5c07fb2501c305db444d42eb280fab36@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 03:45, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> Suitable mechanical renames are made to avoid shadowing, thus
>> addressing violations of MISRA C:2012 Rule 5.3:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/cpu/mcheck/barrier.c | 8 ++++----
>>  xen/arch/x86/cpu/mcheck/barrier.h | 8 ++++----
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/xen/arch/x86/cpu/mcheck/barrier.c 
>> b/xen/arch/x86/cpu/mcheck/barrier.c
>> index a7e5b19a44..51a1d37a76 100644
>> --- a/xen/arch/x86/cpu/mcheck/barrier.c
>> +++ b/xen/arch/x86/cpu/mcheck/barrier.c
>> @@ -16,11 +16,11 @@ void mce_barrier_dec(struct mce_softirq_barrier 
>> *bar)
>>      atomic_dec(&bar->val);
>>  }
>> 
>> -void mce_barrier_enter(struct mce_softirq_barrier *bar, bool wait)
>> +void mce_barrier_enter(struct mce_softirq_barrier *bar, bool do_wait)
> 
> "wait" clashes with xen/common/sched/core.c:wait, which is globally
> exported, right?
> 
> I think it would be good to add this info to the commit message in this
> kind of patches.
> 

Correct, it's in 'xen/include/xen/wait.h' that makes it visible in the 
file modified
by the patch. I'll add it in v2.

>> -void mce_barrier_enter(struct mce_softirq_barrier *, bool wait);
>> -void mce_barrier_exit(struct mce_softirq_barrier *, bool wait);
>> +void mce_barrier_enter(struct mce_softirq_barrier *, bool do_wait);
>> +void mce_barrier_exit(struct mce_softirq_barrier *, bool do_wait);
> 
> You might as well add "bar" as first parameter?
> 
> 
>>  void mce_barrier(struct mce_softirq_barrier *);
>> 

Will do. I checked that this would not interfere with other patches
related to Rules 8.2 and 8.3.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

