Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9058D6FD6
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 14:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734193.1140396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDOJJ-0003Pq-VX; Sat, 01 Jun 2024 12:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734193.1140396; Sat, 01 Jun 2024 12:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDOJJ-0003NJ-SO; Sat, 01 Jun 2024 12:58:13 +0000
Received: by outflank-mailman (input) for mailman id 734193;
 Sat, 01 Jun 2024 12:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDOJJ-0003ND-DZ
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 12:58:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a1d2f42-2016-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 14:58:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6CC624EE0737;
 Sat,  1 Jun 2024 14:58:11 +0200 (CEST)
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
X-Inumbo-ID: 9a1d2f42-2016-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Sat, 01 Jun 2024 14:58:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 5/5] xen: fix MISRA regressions on rule 20.9 and 20.12
In-Reply-To: <6ea1507d-25dc-4b3c-8c00-3b7b271e69a0@citrix.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <7d454066eb24e0515ff5b37864ed7a7ef5215dc5.1717236930.git.nicola.vetrini@bugseng.com>
 <6ea1507d-25dc-4b3c-8c00-3b7b271e69a0@citrix.com>
Message-ID: <00424ba7b8e418c497ccee25167320e1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-01 14:47, Andrew Cooper wrote:
> On 01/06/2024 11:16 am, Nicola Vetrini wrote:
>> ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of 
>> rearrangements")
>> introduced new violations on previously clean rules 20.9 and 20.12.
>> 
>> The first is introduced because CONFIG_CC_IS_CLANG in xen/self-tests.h 
>> is not
>> defined in the configuration under analysis. Using "defined()" instead 
>> avoids
>> relying on the preprocessor's behaviour upon encountering an 
>> undedfined identifier
>> and addresses the violation.
>> 
>> The violation of Rule 20.12 is due to "val" being used both as an 
>> ordinary argument
>> in macro RUNTIME_CHECK, and as a stringification operator.
>> 
>> No functional change.
>> 
>> Fixes: ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead 
>> of rearrangements")
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Thankyou for this patch.  I'd seen that I'd broken something.  
> (Entirely
> my fault - I've done a lot of testing in Gitlab for the series, but
> never manually ran the Eclair jobs.  I'll try to remember better next 
> time.)
> 
> One question though. 
> https://gitlab.com/xen-project/xen/-/jobs/6994213979 says:
> 
> Failure: 1 regressions found for clean guidelines
>   service MC3R1.R20.9: (required) All identifiers used in the
> controlling expression of `#if' or `#elif' preprocessing directives
> shall be #define'd before evaluation:
>    violation: 1
> 
> While there is a report for 20.12, it's not clean yet (so the first
> sentence wants adjusting), and RUNTIME_CHECK doesn't show up newly in 
> it.
> 
> So, while I agree that RUNTIME_CHECK() should be included in the 20.12
> exclusions, why is current Gitlab Run not reporting it?
> 
> ~Andrew

While Rule 20.12 wasn't clean on x86, but it was on arm, so in the arm64 
run it is reported as such

https://gitlab.com/xen-project/xen/-/jobs/6994213980

with the other patches in the series the rule should be clean on both 
architectures, so this imbalance should disappear rather shortly.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

