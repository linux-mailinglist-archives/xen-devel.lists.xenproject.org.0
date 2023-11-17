Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851127EF5FA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 17:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635306.991192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r41Vg-000378-6u; Fri, 17 Nov 2023 16:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635306.991192; Fri, 17 Nov 2023 16:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r41Vg-00034A-3m; Fri, 17 Nov 2023 16:16:00 +0000
Received: by outflank-mailman (input) for mailman id 635306;
 Fri, 17 Nov 2023 16:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r41Vd-000342-Sy
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 16:15:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96872186-8564-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 17:15:56 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3D6A34EE0744;
 Fri, 17 Nov 2023 17:15:56 +0100 (CET)
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
X-Inumbo-ID: 96872186-8564-11ee-98dc-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 17:15:56 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Consulting <consulting@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Roger Pau
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
Message-ID: <1bae6d3263ad8d8da75e13d48308875b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-17 11:17, Nicola Vetrini wrote:
> Hi all,
> 
> As discussed in this thread [1], which is about complying with MISRA C 
> Rule 10.1,
> a macro was introduced to encapsulate a well-known construct:
> 
> /*
>  * Given an unsigned integer argument, expands to a mask where just the 
> least
>  * significant nonzero bit of the argument is set, or 0 if no bits are 
> set.
>  */
> #define ISOLATE_LSB(x) ((x) & -(x))
> 
> This macro has a gained some calls in the subsequent patches in that 
> thread, but concerns were raised around the fact that it would be 
> better to devise a macro that evaluates its argument only once. A 
> proposed solution is this (thanks to Jan Beulich):
> 
> #define ISOLATE_LSB(x) ({ \
>      typeof(x) x_ = (x); \
>      x_ & -x_; \
> })
> 
> However, it can't be used in all call sites that the previous macro 
> would have once that series is committed, as can be seen in [2]. 
> Therefore, while the implementation looks ok,
> a case has been made to have separate macros, of which the latter form 
> is preferred.
> 
> The following points require some thought:
> 
> - where the single evaluation macro should be placed?
>   One proposed location is xen/include/xen/bitops.h
> - is the proposed form actually the best, or maybe it could be an 
> inline function?
> 
> Then testing can happen and a subsequent version of those uncommitted 
> patches introducing uses of either construct will be submitted, to 
> modify all the call sites only once in the commit history.
> 
> Let me know what you think of this.
> Regards,
> 
> [1] 
> https://lore.kernel.org/xen-devel/8a1313b3ab5ba6dd556cf37409e3b703@bugseng.com/T/#mdeb510325e1acacb6477a88de8577e9e87351ba5
> [2] https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/5423693947

I did a few tests; the only places where the first form can't be 
replaced are:

- inside BUILD_BUG_ON (two instances in x86/x86_64/mm.c)
- the definition of MASK_EXTR/MASK_INSR
- the definition of PDX_GROUP_COUNT

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

