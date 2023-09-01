Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B078F8FA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 09:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594431.927751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyLm-0008Bh-8J; Fri, 01 Sep 2023 07:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594431.927751; Fri, 01 Sep 2023 07:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyLm-00088i-5j; Fri, 01 Sep 2023 07:13:50 +0000
Received: by outflank-mailman (input) for mailman id 594431;
 Fri, 01 Sep 2023 07:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qbyLl-00088c-1S
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 07:13:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1834af35-4897-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 09:13:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 457814EE0738;
 Fri,  1 Sep 2023 09:13:47 +0200 (CEST)
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
X-Inumbo-ID: 1834af35-4897-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 09:13:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
In-Reply-To: <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
 <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f96865f3d7a47e4d9d52ee13dea064e3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 28/08/2023 09:59, Jan Beulich wrote:
> On 25.08.2023 17:02, Nicola Vetrini wrote:
>> The common header file for ioreq should include the arch-specific one.
> 
> To be honest I'm not convinced of "should" here. There are two aspects
> to consider: On one hand it is good practice to do what you say. Otoh 
> it
> introduces a needless dependency, and it'll require new arch-es 
> (RISC-V,
> PPC at present) to introduce another dummy header just to satisfy the
> xen/ioreq.h use in common/memory.c. Therefore, _if_ we want to go this
> route, besides a wording change here I think ...
> 

Since including both <xen/ioreq.h> and the arch-specific one was 
requested to be changed
in previous series, I was trying to apply the same pattern here.
If you prefer not to change the current layout then the fix is even 
simpler: I'll just
include <asm/ioreq.h> in xen/arch/arm/ioreq.c, which is where it's 
missing.

>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -20,6 +20,7 @@
>>  #define __XEN_IOREQ_H__
>> 
>>  #include <xen/sched.h>
>> +#include <asm/ioreq.h>
> 
> ... this #include wants to be conditional upon CONFIG_IOREQ_SERVER 
> being
> defined. (I'm actually surprised that there's no respective #ifdef in
> that header, meaning types defined there are available even when the
> functionality was turned off.)
> 
> Jan

The two functions in question are actually guarded by an #ifdef 
CONFIG_IOREQ_SERVER
in arch/arm/include/asm/ioreq.h (in the #else branch some stubs are 
defined)


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

