Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9078FA84
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 11:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594545.927898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc0DJ-0006g3-F5; Fri, 01 Sep 2023 09:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594545.927898; Fri, 01 Sep 2023 09:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc0DJ-0006dg-CO; Fri, 01 Sep 2023 09:13:13 +0000
Received: by outflank-mailman (input) for mailman id 594545;
 Fri, 01 Sep 2023 09:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qc0DI-0006da-2N
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 09:13:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c523b2a0-48a7-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 11:13:10 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 80EA14EE0737;
 Fri,  1 Sep 2023 11:13:09 +0200 (CEST)
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
X-Inumbo-ID: c523b2a0-48a7-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 11:13:09 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
In-Reply-To: <15eef072-d7a5-23a9-a7de-3c16fea49dd9@suse.com>
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
 <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
 <f96865f3d7a47e4d9d52ee13dea064e3@bugseng.com>
 <15eef072-d7a5-23a9-a7de-3c16fea49dd9@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <cf5f8c126cc6bb5564ac4cf214055df2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2023 09:36, Jan Beulich wrote:
> On 01.09.2023 09:13, Nicola Vetrini wrote:
>> On 28/08/2023 09:59, Jan Beulich wrote:
>>> On 25.08.2023 17:02, Nicola Vetrini wrote:
>>>> The common header file for ioreq should include the arch-specific 
>>>> one.
>>> 
>>> To be honest I'm not convinced of "should" here. There are two 
>>> aspects
>>> to consider: On one hand it is good practice to do what you say. Otoh
>>> it
>>> introduces a needless dependency, and it'll require new arch-es
>>> (RISC-V,
>>> PPC at present) to introduce another dummy header just to satisfy the
>>> xen/ioreq.h use in common/memory.c. Therefore, _if_ we want to go 
>>> this
>>> route, besides a wording change here I think ...
>>> 
>> 
>> Since including both <xen/ioreq.h> and the arch-specific one was
>> requested to be changed
>> in previous series, I was trying to apply the same pattern here.
>> If you prefer not to change the current layout then the fix is even
>> simpler: I'll just
>> include <asm/ioreq.h> in xen/arch/arm/ioreq.c, which is where it's
>> missing.
>> 
>>>> --- a/xen/include/xen/ioreq.h
>>>> +++ b/xen/include/xen/ioreq.h
>>>> @@ -20,6 +20,7 @@
>>>>  #define __XEN_IOREQ_H__
>>>> 
>>>>  #include <xen/sched.h>
>>>> +#include <asm/ioreq.h>
>>> 
>>> ... this #include wants to be conditional upon CONFIG_IOREQ_SERVER
>>> being
>>> defined. (I'm actually surprised that there's no respective #ifdef in
>>> that header, meaning types defined there are available even when the
>>> functionality was turned off.)
>> 
>> The two functions in question are actually guarded by an #ifdef
>> CONFIG_IOREQ_SERVER
>> in arch/arm/include/asm/ioreq.h (in the #else branch some stubs are
>> defined)
> 
> Well, I don't see how an #ifdef there helps with the aspect mentioned
> earlier (new arch-es needing to needlessly provide such a header as 
> long
> as the #include here is unconditional).
> 

As far as I can tell, including the asm header in the arm implementation 
file does not imply
that new archs will need such an header. Of course, if the solution 
proposed in the patch is
chosen then I agree with you.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

