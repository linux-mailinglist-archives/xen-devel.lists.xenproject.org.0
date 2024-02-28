Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FC86B1E2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686677.1068972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfL04-0005ya-PI; Wed, 28 Feb 2024 14:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686677.1068972; Wed, 28 Feb 2024 14:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfL04-0005wX-Lj; Wed, 28 Feb 2024 14:33:36 +0000
Received: by outflank-mailman (input) for mailman id 686677;
 Wed, 28 Feb 2024 14:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A+G=KF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfL03-0005wR-Lq
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:33:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f297c6-d646-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 15:33:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CE10D4EE0737;
 Wed, 28 Feb 2024 15:33:33 +0100 (CET)
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
X-Inumbo-ID: 59f297c6-d646-11ee-afd8-a90da7624cb6
MIME-Version: 1.0
Date: Wed, 28 Feb 2024 15:33:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <b8bb4534-b11c-4fa6-a617-0460f494a626@suse.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
 <b8bb4534-b11c-4fa6-a617-0460f494a626@suse.com>
Message-ID: <4b8015c51f93ae05ad0748832e06cf8b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-26 11:51, Jan Beulich wrote:
> On 23.02.2024 08:58, Nicola Vetrini wrote:
>> On 2024-02-19 16:14, Nicola Vetrini wrote:
>>> The cache clearing and invalidation helpers in x86 and Arm didn't
>>> comply with MISRA C Rule 17.7: "The value returned by a function
>>> having non-void return type shall be used". On Arm they
>>> were always returning 0, while some in x86 returned -EOPNOTSUPP
>>> and in common/grant_table the return value is saved.
>>> 
>>> As a consequence, a common helper arch_grant_cache_flush that returns
>>> an integer is introduced, so that each architecture can choose 
>>> whether
>>> to
>>> return an error value on certain conditions, and the helpers have
>>> either
>>> been changed to return void (on Arm) or deleted entirely (on x86).
>>> 
>>> Signed-off-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> The original refactor idea came from Julien Grall in [1]; I edited 
>>> that
>>> proposal
>>> to fix build errors.
>>> 
>>> I did introduce a cast to void for the call to flush_area_local on 
>>> x86,
>>> because
>>> even before this patch the return value of that function wasn't 
>>> checked
>>> in all
>>> but one use in x86/smp.c, and in this context the helper (perhaps
>>> incidentally)
>>> ignored the return value of flush_area_local.
>>> 
>>> [1]
>>> https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
>>> ---
>>>  xen/arch/arm/include/asm/page.h     | 33 
>>> ++++++++++++++++++-----------
>>>  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
>>>  xen/common/grant_table.c            |  9 +-------
>>>  3 files changed, 34 insertions(+), 31 deletions(-)
>>> 
>> 
>> I'll put this patch in the backlog at the moment: too many intricacies
>> while trying to untangle xen/flushtlb from xen/mm.h, and there are
>> easier cases that can be done faster. If someone is interested I can
>> post the partial work I've done so far, even though it doesn't
>> build on x86.
> 
> This
> https://lists.xen.org/archives/html/xen-devel/2024-02/msg01513.html
> may be of interest to you in the context here.
> 

I'll take a look, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

