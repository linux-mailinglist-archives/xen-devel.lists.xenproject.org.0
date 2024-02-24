Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F2862490
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 12:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685073.1065421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdqO2-000322-KQ; Sat, 24 Feb 2024 11:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685073.1065421; Sat, 24 Feb 2024 11:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdqO2-000303-H8; Sat, 24 Feb 2024 11:40:10 +0000
Received: by outflank-mailman (input) for mailman id 685073;
 Sat, 24 Feb 2024 11:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s0+h=KB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdqO0-0002w3-9a
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2024 11:40:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73a45d8f-d309-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 12:40:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CF8E24EE0739;
 Sat, 24 Feb 2024 12:40:03 +0100 (CET)
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
X-Inumbo-ID: 73a45d8f-d309-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Sat, 24 Feb 2024 12:40:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <alpine.DEB.2.22.394.2402231502540.754277@ubuntu-linux-20-04-desktop>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
 <alpine.DEB.2.22.394.2402231502540.754277@ubuntu-linux-20-04-desktop>
Message-ID: <fb460b92d758891c1de42f7e588d5ffb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 2024-02-24 00:05, Stefano Stabellini wrote:
> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
>> On 2024-02-19 16:14, Nicola Vetrini wrote:
>> > The cache clearing and invalidation helpers in x86 and Arm didn't
>> > comply with MISRA C Rule 17.7: "The value returned by a function
>> > having non-void return type shall be used". On Arm they
>> > were always returning 0, while some in x86 returned -EOPNOTSUPP
>> > and in common/grant_table the return value is saved.
>> >
>> > As a consequence, a common helper arch_grant_cache_flush that returns
>> > an integer is introduced, so that each architecture can choose whether to
>> > return an error value on certain conditions, and the helpers have either
>> > been changed to return void (on Arm) or deleted entirely (on x86).
>> >
>> > Signed-off-by: Julien Grall <julien@xen.org>
>> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> > ---
>> > The original refactor idea came from Julien Grall in [1]; I edited that
>> > proposal
>> > to fix build errors.
>> >
>> > I did introduce a cast to void for the call to flush_area_local on x86,
>> > because
>> > even before this patch the return value of that function wasn't checked in
>> > all
>> > but one use in x86/smp.c, and in this context the helper (perhaps
>> > incidentally)
>> > ignored the return value of flush_area_local.
>> >
>> > [1]
>> > https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
>> > ---
>> >  xen/arch/arm/include/asm/page.h     | 33 ++++++++++++++++++-----------
>> >  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
>> >  xen/common/grant_table.c            |  9 +-------
>> >  3 files changed, 34 insertions(+), 31 deletions(-)
>> >
>> 
>> I'll put this patch in the backlog at the moment: too many intricacies 
>> while
>> trying to untangle xen/flushtlb from xen/mm.h, and there are easier 
>> cases that
>> can be done faster. If someone is interested I can post the partial 
>> work I've
>> done so far, even though it doesn't
>> build on x86.
> 
> I understand that the blocker is:
> 
> diff --git a/xen/arch/arm/include/asm/page.h 
> b/xen/arch/arm/include/asm/page.h
> index 69f817d1e6..e90c9de361 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -123,6 +123,7 @@
> 
>  #ifndef __ASSEMBLY__
> 
> +#include <public/grant_table.h>
>  #include <xen/errno.h>
>  #include <xen/types.h>
>  #include <xen/lib.h>
> 
> 
> And the headers disentagling required to solve it, right?
> 
> 
> Let me ask a silly question. public/grant_table.h seems needed by
> arch_grant_cache_flush. Can we move arch_grant_cache_flush somewhere
> else? It is not like page.h is a perfect fit for it anyway.
> 
> For instance, can we move it to
> 
> xen/arch/arm/include/asm/grant_table.h
> 
> ?

Yes, this is what was suggested and what I was trying to accomplish.
Basically my plan is:

1. move the arch_grant_cache_flush helper to asm/grant_table.h for both 
architectures
2. pull out of xen/mm.h this hunk (note the inclusion of asm/flushtlb in 
the middle of the file) because there is a build error on 
tlbflush_current_time() induced in some .c file (don't remember which) 
by the earlier movement

-#include <asm/flushtlb.h>
-
-static inline void accumulate_tlbflush(bool *need_tlbflush,
-                                       const struct page_info *page,
-                                       uint32_t *tlbflush_timestamp)
-{
-    if ( page->u.free.need_tlbflush &&
-         page->tlbflush_timestamp <= tlbflush_current_time() &&
-         (!*need_tlbflush ||
-          page->tlbflush_timestamp > *tlbflush_timestamp) )
-    {
-        *need_tlbflush = true;
-        *tlbflush_timestamp = page->tlbflush_timestamp;
-    }
-}
-
-static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
-{
-    cpumask_t mask;
-
-    cpumask_copy(&mask, &cpu_online_map);
-    tlbflush_filter(&mask, tlbflush_timestamp);
-    if ( !cpumask_empty(&mask) )
-    {
-        perfc_incr(need_flush_tlb_flush);
-        arch_flush_tlb_mask(&mask);
-    }
-}
-

which is going to be in a new header xen/flushtlb.h
3. replace various inclusions the previously relied on the fact that 
xen/mm.h included asm/flushtlb.h (some even stating this as evidenced 
from the hunk below)

diff --git a/xen/arch/x86/cpu/microcode/amd.c 
b/xen/arch/x86/cpu/microcode/amd.c
index 75fc84e445ce..91ee7e6ec39e 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -15,8 +15,8 @@
   */

  #include <xen/err.h>
+#include <xen/flushtlb.h>
  #include <xen/init.h>
-#include <xen/mm.h> /* TODO: Fix asm/tlbflush.h breakage */

and then make everything build.
However, the dependencies tied to xen/mm.h are quite numerous on x86, 
and I'm not seeing an obvious way to avoid touching xen/mm.h. See this 
tree [1] for the latest state of the patch.

If anyone has an idea how to tackle this in a smarter way, I'm open to 
suggestions.
Specifically in step (2) there might be a way to avoid doing that 
modification, perhaps.

[1] 
https://gitlab.com/xen-project/people/bugseng/xen/-/commits/cache_helpers

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

