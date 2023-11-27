Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA37FA2CC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642169.1001455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ceb-0005BA-CU; Mon, 27 Nov 2023 14:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642169.1001455; Mon, 27 Nov 2023 14:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ceb-00059G-9n; Mon, 27 Nov 2023 14:32:05 +0000
Received: by outflank-mailman (input) for mailman id 642169;
 Mon, 27 Nov 2023 14:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqC2=HI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r7cea-0004g0-3N
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:32:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba94ded3-8d31-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:32:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 930AB4EE0737;
 Mon, 27 Nov 2023 15:32:01 +0100 (CET)
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
X-Inumbo-ID: ba94ded3-8d31-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 15:32:01 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jbeulich
 <jbeulich@suse.com>, Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien
 Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: MISRA: Compatible declarations for sort and bsearch
In-Reply-To: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
Message-ID: <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-24 10:40, Nicola Vetrini wrote:
> Hi all,
> 
> in xen/lib.h and xen/sort.h there are definitions of the functions 
> bsearch and sort that have no prior declarations, and therefore are 
> subject to a violation of MISRA C Rule 8.4.
> 
> I'm wondering whether it would be preferred
> 
> 1. to put a declaration just before the definition, in lib.h and sort.h
> 2. deviate these functions, as their signatures are well-known and 
> somewhat standardized
> 
> other resolution strategies are possible, but I think these are the 
> main ones.

Still on the matter of Rule 8.4, though not related to bsearch or sort:

- the definition of do_mca in x86/cpu/mcheck/mca.c has the following 
header:
   #include <xen/hypercall.h> /* for do_mca */
   which in turn leads to x86/include/asm/hypercall.h, which includes the 
following:
   #include <public/arch-x86/xen-mca.h> /* for do_mca */

   where I can't see a declaration for do_mca, as I would have expected. 
I'd like to understand what's going on here, since I may be missing some 
piece of information (perhaps something is generated during the build).

- x86/traps.c do_general_protection may want a declaration in 
x86/include/asm/traps.h, or perhaps it should gain the asmlinkage 
attribute, given that it's used only by asm and the TU that defines it.

- function test and variable data in x86/efi/check.c look like they 
should not be MISRA compliant, so they may be added to the 
exclude-list.json

- given the comment in xen/common/page_alloc.c for first_valid_mfn

/*
  * first_valid_mfn is exported because it is use in ARM specific NUMA
  * helpers. See comment in arch/arm/include/asm/numa.h.
  */
mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;

and the related ARM comment

/*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
  */
extern mfn_t first_valid_mfn;

it should probably be deviated.

- compat_set_{px,cx}_pminfo in x86/x86_64/cpufreq.c are perhaps declared 
with an autogenerated header?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

