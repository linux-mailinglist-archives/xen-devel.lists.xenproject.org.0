Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF180D407
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652447.1018293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkCq-0002bP-BP; Mon, 11 Dec 2023 17:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652447.1018293; Mon, 11 Dec 2023 17:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkCq-0002Yk-8Z; Mon, 11 Dec 2023 17:36:36 +0000
Received: by outflank-mailman (input) for mailman id 652447;
 Mon, 11 Dec 2023 17:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCkCp-0002Ye-7r
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:36:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ac8a9c-984b-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:36:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4A6E24EE073E;
 Mon, 11 Dec 2023 18:36:33 +0100 (CET)
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
X-Inumbo-ID: d3ac8a9c-984b-11ee-98e8-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 11 Dec 2023 18:36:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <95690c3a-92c5-4e05-856b-088133b87650@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <c77560d6044700f10a8b149d539a95d1@bugseng.com>
 <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org>
 <95690c3a-92c5-4e05-856b-088133b87650@xen.org>
Message-ID: <920a835236ff8cf922e515c5082770b7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-11 17:05, Julien Grall wrote:
> On 11/12/2023 15:59, Julien Grall wrote:
>> Hi Nicola,
>> 
>> On 11/12/2023 14:54, Nicola Vetrini wrote:
>>> On 2023-12-11 13:32, Julien Grall wrote:
>>>> Hi,
>>>> 
>>>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>>>> The branches of the switch after a call to 'do_unexpected_trap'
>>>>> cannot return, but there is one path that may return, hence
>>>>> only some clauses are marked with ASSERT_UNREACHABLE().
>>>> I don't understand why this is necessary. The code should never be 
>>>> reachable because do_unexpected_trap() is a noreturn().
>>>> 
>>>> Cheers,
>>> 
>>> It was meant as a safeguard against mistakes.
>> 
>> I am confused about which mistakes you are trying to prevent. Are you 
>> saying you are not trusting the noreturn attribute?
>> 
>> And if so, are you intending to add ASSERT_UNREACHABLE() after every 
>> single call to noreturn functions?
> 
> Replying to myself. What's confusing the most is that in [1], you 
> decided to not add the ASSERT_UNREACHABLE(). Yet the problem is 
> similar.
> 
> I'd also like to point out that by removing the "break", then if the 
> 'noreturn' function turns out to return, then in prod build you would 
> fallthrough to the next case. And who knows what's going to happen...
> 
> All of this really adds some confusion...
> 

I should have checked before responding: do_trap_hyp_sync is not afaik 
noreturn. Specifically, do_trap_brk may return. If I worked under the 
wrong assumption, then certainly the ASSERT_UNREACHABLE-s should be 
dropped.

>> 
>>> There are MISRA rules that deal with this aspect (e.g., a noreturn 
>>> function should not return), but they are not in Amendment 2, which 
>>> is what Xen is following.
>> Do you mind providing a bit more details about the rules you are 
>> talking about? At least the numbers would be helpful.
> 
> [1] 
> https://lore.kernel.org/xen-devel/c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com/
> 
> Cheers,

Sure. Here are the rules concerned with _Noreturn:

R17.9: A function declared with a _Noreturn function specifier shall not 
return to its caller
R17.10: A function declared with a _Noreturn function specifier shall 
have void return type
R17.11: A function that never returns should be declared with a 
_Noreturn function specifier

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

