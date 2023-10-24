Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F237D5208
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621978.969011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHdu-0001KT-D5; Tue, 24 Oct 2023 13:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621978.969011; Tue, 24 Oct 2023 13:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHdu-0001IB-AL; Tue, 24 Oct 2023 13:40:22 +0000
Received: by outflank-mailman (input) for mailman id 621978;
 Tue, 24 Oct 2023 13:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvHds-0001I3-Rg
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:40:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df5e3ff2-7272-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 15:40:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3C1D04EE0739;
 Tue, 24 Oct 2023 15:40:19 +0200 (CEST)
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
X-Inumbo-ID: df5e3ff2-7272-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 15:40:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 2/8] x86: add deviations for variables
 only used in asm code
In-Reply-To: <2f3850a7-f2a3-350f-b9b6-be0bde0d1a28@suse.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
 <2aaa0978-e28f-4151-f4ba-f2628f6d4677@suse.com>
 <ef7f5c65ad0b0129f6b6119b6ad7d506@bugseng.com>
 <2f3850a7-f2a3-350f-b9b6-be0bde0d1a28@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <53617132b87450fc385b2f5887bfe65f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 10:12, Jan Beulich wrote:
> On 24.10.2023 09:58, Nicola Vetrini wrote:
>> On 24/10/2023 09:32, Jan Beulich wrote:
>>> On 23.10.2023 11:56, Nicola Vetrini wrote:
>>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>>   * gets set up by the containing function.
>>>>   */
>>>>  #ifdef CONFIG_FRAME_POINTER
>>>> +/* SAF-1-safe */
>>>>  register unsigned long current_stack_pointer asm("rsp");
>>>>  # define ASM_CALL_CONSTRAINT , "+r" (current_stack_pointer)
>>>>  #else
>>> 
>>> SAF-1-safe is about symbols "used only by asm modules". This doesn't
>>> apply
>>> to the declaration here.
>>> 
>> 
>> The wording could change to "asm code" if that is deemed clearer.
> 
> Question is what would be meant by "asm code"; "asm modules" is quite
> clear.
> 

Well, I don't know. It's up to the community to decide that. It can be 
an ad-hoc
justification, but I don't see much value in doing so. What do you 
propose to get this patch
approved (at least on your account)?.

>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -75,6 +75,7 @@ static bool __initdata opt_invpcid = true;
>>>>  boolean_param("invpcid", opt_invpcid);
>>>>  bool __read_mostly use_invpcid;
>>>> 
>>>> +/* SAF-1-safe Only used in asm code and within this source file */
>>>>  unsigned long __read_mostly cr4_pv32_mask;
>>>> 
>>>>  /* **** Linux config option: propagated to domain0. */
>>>> @@ -147,12 +148,13 @@ cpumask_t __read_mostly cpu_present_map;
>>>>  unsigned long __read_mostly xen_phys_start;
>>>> 
>>>>  char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>>> -    cpu0_stack[STACK_SIZE];
>>>> +    cpu0_stack[STACK_SIZE]; /* SAF-1-safe Only used in asm code and
>>>> below */
>>> 
>>> Wasn't it that such comments need to live on the earlier line?
>> 
>> On the same line is fine as well. I personally found it less clear
>> putting that in the
>> line above.
> 
> But please recall that these comments are intended to cover other
> scanners as well. Iirc only Eclair accepts comments on the same line.
> Nevertheless I realize that putting the comment on the earlier line
> is problematic (and maybe also scanner dependent) when that ends up
> in the middle of a declaration / definition.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

