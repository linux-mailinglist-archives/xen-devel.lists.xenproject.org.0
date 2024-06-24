Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3419156E4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 21:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746919.1154153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLozZ-0002n4-0y; Mon, 24 Jun 2024 19:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746919.1154153; Mon, 24 Jun 2024 19:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLozY-0002kc-UR; Mon, 24 Jun 2024 19:04:40 +0000
Received: by outflank-mailman (input) for mailman id 746919;
 Mon, 24 Jun 2024 19:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qxl8=N2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sLozX-0002kW-Ls
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 19:04:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 995b62c9-325c-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 21:04:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 002B84EE0738;
 Mon, 24 Jun 2024 21:04:35 +0200 (CEST)
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
X-Inumbo-ID: 995b62c9-325c-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 21:04:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Alessandro Zucchelli
 <alessandro.zucchelli@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC XEN PATCH] x86/mctelem: address violations of MISRA C: 2012
 Rule 5.3
In-Reply-To: <d3856651-f5a6-4c96-8afe-336af2a60231@suse.com>
References: <79eb2f12e521f96a53dd166eb7db485bb3d9d067.1718962824.git.nicola.vetrini@bugseng.com>
 <d3856651-f5a6-4c96-8afe-336af2a60231@suse.com>
Message-ID: <dfe9bd46708440db17d594c93d53b6fc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-24 11:00, Jan Beulich wrote:
> On 21.06.2024 11:50, Nicola Vetrini wrote:
>> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> 
>> This addresses violations of MISRA C:2012 Rule 5.3 which states as
>> following: An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope. In this case the shadowing is 
>> between
>> local variables "mctctl" and the file-scope static struct variable 
>> with the
>> same name.
>> 
>> No functional change.
>> 
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> RFC because I'm not 100% sure the semantics of the code is preserved.
>> I think so, and it passes gitlab pipelines [1], but there may be some 
>> missing
>> information.
> 
> Details as to your concerns would help. I see no issue, not even a 
> concern.
> 

That's reassuring. My main concern was that somehow the global (trough 
perhaps some macro expansion) would be updated instead of the local (or 
viceversa).

>> --- a/xen/arch/x86/cpu/mcheck/mctelem.c
>> +++ b/xen/arch/x86/cpu/mcheck/mctelem.c
>> @@ -168,14 +168,14 @@ static void mctelem_xchg_head(struct mctelem_ent 
>> **headp,
>>  void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
>>  {
>>  	struct mctelem_ent *tep = COOKIE2MCTE(cookie);
>> -	struct mc_telem_cpu_ctl *mctctl = &this_cpu(mctctl);
>> +	struct mc_telem_cpu_ctl *mctctl_cpu = &this_cpu(mctctl);
> 
> When possible (i.e. without loss of meaning) I'd generally prefer names 
> to
> be shortened. Wouldn't just "ctl" work here?

I can try. I do not expect shadowing with "ctl", but it may happen. I'll 
try and let you know.
> 
>> -	ASSERT(mctctl->pending == NULL || mctctl->lmce_pending == NULL);
>> +	ASSERT(mctctl_cpu->pending == NULL || mctctl_cpu->lmce_pending == 
>> NULL);
>> 
>> -	if (mctctl->pending)
>> -		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
>> +	if (mctctl_cpu->pending)
>> +		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
>>  	else if (lmce)
>> -		mctelem_xchg_head(&mctctl->lmce_pending, &tep->mcte_next, tep);
>> +		mctelem_xchg_head(&mctctl_cpu->lmce_pending, &tep->mcte_next, tep);
>>  	else {
>>  		/*
>>  		 * LMCE is supported on Skylake-server and later CPUs, on
>> @@ -186,10 +186,10 @@ void mctelem_defer(mctelem_cookie_t cookie, bool 
>> lmce)
>>  		 * moment. As a result, the following two exchanges together
>>  		 * can be treated as atomic.
>>  		 */
> 
> In the middle of this comment the variable is also mentioned, and hence
> also wants adjusting (twice).

Ok, will update.

> 
>> -		if (mctctl->lmce_pending)
>> -			mctelem_xchg_head(&mctctl->lmce_pending,
>> -					  &mctctl->pending, NULL);
>> -		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
>> +		if (mctctl_cpu->lmce_pending)
>> +			mctelem_xchg_head(&mctctl_cpu->lmce_pending,
>> +					  &mctctl_cpu->pending, NULL);
>> +		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
>>  	}
>>  }
>> 
>> @@ -213,7 +213,7 @@ void mctelem_process_deferred(unsigned int cpu,
>>  {
>>  	struct mctelem_ent *tep;
>>  	struct mctelem_ent *head, *prev;
>> -	struct mc_telem_cpu_ctl *mctctl = &per_cpu(mctctl, cpu);
>> +	struct mc_telem_cpu_ctl *mctctl_cpu = &per_cpu(mctctl, cpu);
>>  	int ret;
>> 
>>  	/*
>> @@ -232,7 +232,7 @@ void mctelem_process_deferred(unsigned int cpu,
>>  	 * Any MC# occurring after the following atomic exchange will be
>>  	 * handled by another round of MCE softirq.
>>  	 */
>> -	mctelem_xchg_head(lmce ? &mctctl->lmce_pending : &mctctl->pending,
>> +	mctelem_xchg_head(lmce ? &mctctl_cpu->lmce_pending : 
>> &mctctl_cpu->pending,
>>  			  &this_cpu(mctctl.processing), NULL);
> 
> By shortening the variable name here you'd also avoid going past line
> length limits.
> 

Ok.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

