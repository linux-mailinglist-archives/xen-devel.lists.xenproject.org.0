Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04489E40C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 22:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702812.1098370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHdi-0005XO-I8; Tue, 09 Apr 2024 20:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702812.1098370; Tue, 09 Apr 2024 20:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHdi-0005VC-FY; Tue, 09 Apr 2024 20:00:18 +0000
Received: by outflank-mailman (input) for mailman id 702812;
 Tue, 09 Apr 2024 20:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xQG8=LO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ruHdg-0005V6-T4
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 20:00:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7c51963-f6ab-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 22:00:14 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 697A64EE0739;
 Tue,  9 Apr 2024 22:00:14 +0200 (CEST)
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
X-Inumbo-ID: c7c51963-f6ab-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Tue, 09 Apr 2024 22:00:14 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com
Subject: Re: [XEN PATCH v2 7/9] xen/xsm: address violation of MISRA C Rule
 16.2
In-Reply-To: <543f34ed-48f3-4ce5-bd34-00c2cf176ba0@apertussolutions.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <7fbb80bf62fc2e5f91a89375134622366c0b3891.1712305581.git.nicola.vetrini@bugseng.com>
 <543f34ed-48f3-4ce5-bd34-00c2cf176ba0@apertussolutions.com>
Message-ID: <c364de9357b5f3419e592e7ad3bd307a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-09 16:02, Daniel P. Smith wrote:
> On 4/5/24 05:14, Nicola Vetrini wrote:
>> Refactor the switch so that a violation of
>> MISRA C Rule 16.2 is resolved (A switch label shall only be used
>> when the most closely-enclosing compound statement is the body of
>> a switch statement).
>> Note that the switch clause ending with the pseudo
>> keyword "fallthrough" is an allowed exception to Rule 16.3.
>> 
> 
> To give you a quick response, on cursory review, I do not believe the 
> two are equivalent. I have never been a fan of the Duff's device in use 
> here, as it makes reasoning about all the variations difficult. I 
> unrolled all of this once before, and I recall it being a bit more 
> intricate than this.
> 
> v/r,
> dps

Hi,

basically what I was trying to accomplish is this: XSM_TARGET will 
either enter the if and return, or fallthrough to XSM_XS_PRIV, but then 
it won't enter the if (as it did before because in order to reach this 
second case's if statement it had to also satisfy the first condition 
(evaluate_nospec(src == target)), which would then cause the XSM_TARGET 
phase to return 0). And then if either the action != XSM_XS_PRIV or the 
other condition is not satisfied we go down to XSM_DM_PRIV, just like 
before. I may have made a logical mistake somewhere, of course, but it 
seems the same thing semantically, by relying on the fact that

case XSM_TARGET:
if (...) {
   return 0;
case XSM_XS_PRIV:
    ...
}

can be rewritten as

case XSM_TARGET:
   if (...) { return 0; }
   fallthrough;
case XSM_XS_PRIV:
   if (action == XSM_XS_PRIV && ...) { ... }
case XSM_DM_PRIV:

because there wasn't other code after the closed bracket of the if in 
the XSM_XS_PRIV case (only a fallthough that remained as is).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

