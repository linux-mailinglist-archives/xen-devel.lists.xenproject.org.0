Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68B84F8E8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 16:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678753.1056257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYTAf-0003Mo-Ik; Fri, 09 Feb 2024 15:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678753.1056257; Fri, 09 Feb 2024 15:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYTAf-0003LI-G3; Fri, 09 Feb 2024 15:52:09 +0000
Received: by outflank-mailman (input) for mailman id 678753;
 Fri, 09 Feb 2024 15:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFPS=JS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rYTAd-0003LC-Dc
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 15:52:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bf907fc-c763-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 16:52:05 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 917894EE0739;
 Fri,  9 Feb 2024 16:52:04 +0100 (CET)
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
X-Inumbo-ID: 2bf907fc-c763-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 16:52:04 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Consulting <consulting@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jbeulich
 <jbeulich@suse.com>, Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Return type of clean_and_invalidate_dcache_va_range
Message-ID: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

In the context of violations of MISRA C:2012 Rule 17.7: "The value 
returned by a function having non-void return type shall be used", I was 
looking at the function "clean_and_invalidate_dcache_va_range". It has 
the following signature on both arm and x86:

static inline int clean_and_invalidate_dcache_va_range
     (const void *p, unsigned long size)

The commit that introduced it for Arm ~9 years ago (71d64afe3e12: "arm: 
return int from *_dcache_va_range") [1] mentions that on Arm it can't 
fail, but supposedly it can on x86.

However, as far as I can tell, for both arch-es the implementation now 
always returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 
is no longer true (I wasn't able to reconstruct if there was a time at 
which this was true, even in the same commit that changed the return 
type to int).

The question is: should the return type be void, since it appears that 
every user is ignoring the returned value (violating the rule), except 
the one in common/grant_table.c [4]?

The other two resolution paths are either allowing this function's 
result to be ignored or cast all ignored invocations to void, with the 
first being cleaner from a code readability perspective.

[1] These functions cannot really fail on ARM, but their x86 equivalents 
can (-EOPNOTSUPP). Change the prototype to return int.
[2] 
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/include/asm/page.h#L218
[3] 
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/x86/include/asm/flushtlb.h#L188
[4] 
https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/grant_table.c#L3576

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

