Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538277EF183
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635063.990788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wp4-00053n-Iu; Fri, 17 Nov 2023 11:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635063.990788; Fri, 17 Nov 2023 11:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wp4-00051j-En; Fri, 17 Nov 2023 11:15:42 +0000
Received: by outflank-mailman (input) for mailman id 635063;
 Fri, 17 Nov 2023 11:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3wp3-00051d-CJ
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:15:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a372c2d1-853a-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 12:15:39 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A88A94EE0744;
 Fri, 17 Nov 2023 12:15:38 +0100 (CET)
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
X-Inumbo-ID: a372c2d1-853a-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 12:15:38 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Consulting
 <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jbeulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Roger Pau
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
 <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
Message-ID: <7f4563916d287a461c7ae0378d97ecb0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-17 12:04, Andrew Cooper wrote:
> On 17/11/2023 10:17 am, Nicola Vetrini wrote:
>> Hi all,
>> 
>> As discussed in this thread [1], which is about complying with MISRA C
>> Rule 10.1,
>> a macro was introduced to encapsulate a well-known construct:
>> 
>> /*
>>  * Given an unsigned integer argument, expands to a mask where just
>> the least
>>  * significant nonzero bit of the argument is set, or 0 if no bits are
>> set.
>>  */
>> #define ISOLATE_LSB(x) ((x) & -(x))
>> 
>> This macro has a gained some calls in the subsequent patches in that
>> thread, but concerns were raised around the fact that it would be
>> better to devise a macro that evaluates its argument only once. A
>> proposed solution is this (thanks to Jan Beulich):
>> 
>> #define ISOLATE_LSB(x) ({ \
>>      typeof(x) x_ = (x); \
>>      x_ & -x_; \
>> })
> 
> Of course this was going to explode.
> 
> This isn't even the first time an unwise attempt to do 
> single-evaluation
> has needed to be reverted because it doesn't work with Integer Constant
> Expressions.
> 
> Switch it back to the first form.  It's obviously a macro to begin 
> with,
> and not likely to be used in cases that have side effects.
> 
> ~Andrew

Actually no usages of either forms are yet committed, just the 
definition of the first form, so nothing needs to be reverted. I should 
have clarified that, sorry. If the other patches in the series go in 
unmodified (modulo renaming, but that's trivial), they would use the 
first form.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

