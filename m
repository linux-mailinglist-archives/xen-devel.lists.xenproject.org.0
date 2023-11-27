Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADF7FA86F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 18:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642385.1001826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7frb-0005mD-PA; Mon, 27 Nov 2023 17:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642385.1001826; Mon, 27 Nov 2023 17:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7frb-0005kY-MI; Mon, 27 Nov 2023 17:57:43 +0000
Received: by outflank-mailman (input) for mailman id 642385;
 Mon, 27 Nov 2023 17:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqC2=HI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r7fra-0005io-Dh
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 17:57:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 756193b2-8d4e-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 18:57:41 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D15D34EE0737;
 Mon, 27 Nov 2023 18:57:40 +0100 (CET)
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
X-Inumbo-ID: 756193b2-8d4e-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 18:57:40 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Xen Devel
 <xen-devel@lists.xenproject.org>
Subject: Re: MISRA: Compatible declarations for sort and bsearch
In-Reply-To: <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
 <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
 <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com>
Message-ID: <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-27 15:59, Jan Beulich wrote:
> On 27.11.2023 15:32, Nicola Vetrini wrote:
>> Still on the matter of Rule 8.4, though not related to bsearch or 
>> sort:
>> 
>> - the definition of do_mca in x86/cpu/mcheck/mca.c has the following
>> header:
>>    #include <xen/hypercall.h> /* for do_mca */
>>    which in turn leads to x86/include/asm/hypercall.h, which includes 
>> the
>> following:
>>    #include <public/arch-x86/xen-mca.h> /* for do_mca */
>> 
>>    where I can't see a declaration for do_mca, as I would have 
>> expected.
>> I'd like to understand what's going on here, since I may be missing 
>> some
>> piece of information (perhaps something is generated during the 
>> build).
> 
> It can't possibly live in the public header. The comment simply went
> stale with the auto-generation of headers; the decl is in 
> hypercall-defs.h
> now.
> 

Ok, thanks.

>> - x86/traps.c do_general_protection may want a declaration in
>> x86/include/asm/traps.h, or perhaps it should gain the asmlinkage
>> attribute, given that it's used only by asm and the TU that defines 
>> it.
> 
> Neither is really attractive imo.
> 
>> - function test and variable data in x86/efi/check.c look like they
>> should not be MISRA compliant, so they may be added to the
>> exclude-list.json
> 
> This file isn't contributing to the final binary.
> 

Then I'll exclude them

>> - given the comment in xen/common/page_alloc.c for first_valid_mfn
>> 
>> /*
>>   * first_valid_mfn is exported because it is use in ARM specific NUMA
>>   * helpers. See comment in arch/arm/include/asm/numa.h.
>>   */
>> mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
>> 
>> and the related ARM comment
>> 
>> /*
>>   * TODO: make first_valid_mfn static when NUMA is supported on Arm, 
>> this
>>   * is required because the dummy helpers are using it.
>>   */
>> extern mfn_t first_valid_mfn;
>> 
>> it should probably be deviated.
> 
> NUMA work is still in progress for Arm, I think, so I'd rather wait 
> with
> deviating.
> 

+Stefano

I can leave it as is, if that's indeed going to become static at some 
point.

>> - compat_set_{px,cx}_pminfo in x86/x86_64/cpufreq.c are perhaps 
>> declared
>> with an autogenerated header?
> 
> I don't think so. Only top-level hypercall handlers would be. This 
> works by
> (perhaps even unintentional) trickery: xen/pmstat.h is included only 
> after
> set_{c,p}x_pminfo are re-defined to compat_set_{c,p}x_pminfo, so the 
> same
> declarations happen to serve two purposes (but of course don't provide 
> the
> intended caller/callee agreement).
> 

I didn't understand your explanation fully; I see xen/pmstat.h in 
cpufreq.c included before
compat/platform.h which, as I understand it, redefines set_{c,p}x_pminfo 
to compat_set_{c,p}x_pminfo, therefore down below no declaration for 
compat_set_{c,p}x_pminfo is visible, triggering the violation.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

