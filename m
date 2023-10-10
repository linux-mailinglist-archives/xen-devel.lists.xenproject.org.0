Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74187BF752
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 11:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614635.955838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq94z-0004G9-NT; Tue, 10 Oct 2023 09:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614635.955838; Tue, 10 Oct 2023 09:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq94z-0004Dg-Kf; Tue, 10 Oct 2023 09:31:05 +0000
Received: by outflank-mailman (input) for mailman id 614635;
 Tue, 10 Oct 2023 09:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qq94x-0004DY-Er
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 09:31:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1a13c3-674f-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 11:31:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5B5074EE0742;
 Tue, 10 Oct 2023 11:31:01 +0200 (CEST)
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
X-Inumbo-ID: ba1a13c3-674f-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 11:31:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: MISRA C:2012 D4.11 caution on staging
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

as you can see from [1], there's a MISRA C guideline, D4.11, that is 
supposed to be clean
(i.e., have no reports), but has a caution on an argument to memcpy
(the second argument might be null according to the checker, given a set 
of assumptions on
the control flow). To access the report just click on the second link in 
the log, which should take you to a webpage with a list of
MISRA guidelines. Click on D4.11 and you'll see the full report, which I 
pasted below for convenience.

If the finding is genuine, then some countermeasure needs to be taken 
against this
possible bug, otherwise it needs to be motivated why the field 
config->handle can't
be null at that point.
The finding is likely the result of an improvement made to the checker, 
because the first
analysis I can see that spots it happened when rc1 has been tagged, but 
that commit does not
touch the involved files.

[1] https://gitlab.com/xen-project/xen/-/jobs/5251222578

  caution for MC3R1.D4.11 untagged
xen/common/domain.c:758.27-758.40:
[59] null pointer passed as 2nd argument to memory copy function
xen/common/domain.c:590.10-590.15:
[1] assuming 'config' is null
xen/common/domain.c:593.10-593.44:
[2] assuming the condition is false; taking false branch
<preprocessed xen/common/domain.c>:11332.10-11332.50:
preprocessed tokens
xen/include/xen/types.h:31.23:
expanded from macro `NULL'
xen/common/domain.c:603.12-603.27:
[3] '?' condition is true
<preprocessed xen/common/domain.c>:11336.37-11336.52:
preprocessed tokens
xen/include/xen/compiler.h:21.43:
expanded from macro `unlikely'
xen/include/xen/lib.h:26.15-26.28:
expanded from macro `ASSERT'
xen/include/xen/lib.h:26.26:
expanded from macro `ASSERT'
xen/common/domain.c:603.5-603.65:
[4] taking false branch
<preprocessed xen/common/domain.c>:11336.10-11336.11:
preprocessed tokens
xen/include/xen/lib.h:26.10-26.11:
expanded from macro `ASSERT'
xen/common/domain.c:603.5-603.65:
[5] loop condition is false:  exiting loop
<preprocessed xen/common/domain.c>:11336.5-11336.6:
preprocessed tokens
xen/include/xen/lib.h:26.5-26.6:
expanded from macro `ASSERT'
xen/common/domain.c:605.10-605.15:
[6] 'config' is null
xen/common/domain.c:605.5-605.6:
[7] taking false branch
xen/common/domain.c:615.10-615.14:
[8] 'domid' is not equal to 0
xen/common/domain.c:615.24-615.28:
[9] 'domid' is not equal to hardware_domid
xen/common/domain.c:615.5-615.6:
[10] taking false branch
xen/common/domain.c:624.5-624.44:
[11] taking false branch
<preprocessed xen/common/domain.c>:11356.10-11356.11:
preprocessed tokens
xen/include/xen/trace.h:86.9-86.10:
expanded from macro `TRACE_varD'
xen/include/xen/trace.h:94.5-94.22:
expanded from macro `TRACE_1D'
xen/common/domain.c:624.5-624.44:
[12] loop condition is false:  exiting loop
<preprocessed xen/common/domain.c>:11356.5-11356.6:
preprocessed tokens
xen/include/xen/trace.h:85.5-85.6:
expanded from macro `TRACE_varD'
xen/include/xen/trace.h:94.5-94.22:
expanded from macro `TRACE_1D'
xen/common/domain.c:630.5-630.39:
[13] assuming 'prof' is null; taking true branch
<preprocessed xen/common/domain.c>:11362.111-11362.115:
preprocessed tokens
xen/include/xen/spinlock.h:114.14-114.18:
expanded from macro `spin_lock_init_prof'
xen/common/domain.c:630.5-630.39:
[14]  execution continues on line 631
<preprocessed xen/common/domain.c>:11363.104-11363.108:
preprocessed tokens
xen/include/xen/spinlock.h:119.13-119.17:
expanded from macro `spin_lock_init_prof'
xen/common/domain.c:631.5-631.43:
[15] assuming 'prof' is null; taking true branch
<preprocessed xen/common/domain.c>:11367.115-11367.119:
preprocessed tokens
xen/include/xen/spinlock.h:114.14-114.18:
expanded from macro `spin_lock_init_prof'
xen/common/domain.c:631.5-631.43:
[16]  execution continues on line 632
<preprocessed xen/common/domain.c>:11368.112-11368.116:
preprocessed tokens
xen/include/xen/spinlock.h:119.13-119.17:
expanded from macro `spin_lock_init_prof'
xen/common/domain.c:642.24-642.36:
[17] '?' condition is true
<preprocessed xen/common/domain.c>:11377.92:
preprocessed tokens
xen/include/xen/bitmap.h:97.9:
expanded from macro `BITMAP_LAST_WORD_MASK'
xen/include/xen/nodemask.h:238.29-238.63:
expanded from macro `NODE_MASK_LAST_WORD'
xen/include/xen/nodemask.h:244.43-244.61:
expanded from macro `NODE_MASK_ALL'
xen/common/domain.c:662.5-662.6:
[18] taking false branch

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

