Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1834FD7F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 11:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103815.197971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRXYA-0000ji-Oz; Wed, 31 Mar 2021 09:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103815.197971; Wed, 31 Mar 2021 09:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRXYA-0000jL-LM; Wed, 31 Mar 2021 09:54:10 +0000
Received: by outflank-mailman (input) for mailman id 103815;
 Wed, 31 Mar 2021 09:54:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lRXY9-0000jG-15
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 09:54:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lRXY8-000836-Pt; Wed, 31 Mar 2021 09:54:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lRXY7-0003Rg-6S; Wed, 31 Mar 2021 09:54:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=IOUJe2tihTzla+erqhwVJsivSTtTbZipunSRUJNldxg=; b=xqBd6Phf53khymVT9bBW9mqPpg
	Q7xnmUNtiOmSWdc2/ZhmvS8FhE1jmkHyiS1hgGpn489LUaFVWuN21PP4Ej+6y0xOFFHRGhqFfuxCt
	+0gTxoywdW186zPAjmHRkbP6NBmP2V11sgmn2TZQdkO/G+fTWSHVNubgAV0ZEmIMsk/8=;
Message-ID: <fc88e9ebb902d7d4315202ec25d00506f433641c.camel@xen.org>
Subject: Re: [PATCH RESEND] Performance regression due to XSA-336
From: Hongyan Xia <hx242@xen.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	wl@xen.org, stephen.s.brennan@oracle.com
Date: Wed, 31 Mar 2021 10:53:49 +0100
In-Reply-To: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Thank you for the patch. We observed similar issues.

However, would you mind sharing more details on the test setup? We
tested the hypervisor after injecting XSA-336. There were regressions
in some benchmarks but far from being enough to raise a serious alarm.
In particular, we benchmarked CPU, disk I/O, network and timer
performance on VMs with 64 and even 128 vCPUs and the noticeable
regression was a 60% drop in the ACPI PM timer when all vCPUs are
actively accessing the timer. We did not see concerns in real-world
benchmarks so I am curious how the -40% was seen.

Is it possible that the guest itself was using ACPI timer as the
clocksource? That could explain a lot. It might also be useful to know
what OS that was and other specs around the -40%.

Thank you,
Hongyan

On Wed, 2021-03-24 at 17:05 -0400, Boris Ostrovsky wrote:
> (Re-sending with Stephen added)
> 
> 
> While running performance tests with recent XSAs backports to our
> product we've
> discovered significant regression in TPCC performance. With a
> particular guest
> kernel the numbers dropped by as much as 40%.
> 
> We've narrowed that down to XSA-336 patch, specifically to the
> pt_migrate rwlock,
> and even more specifically to this lock being taken in
> pt_update_irq().
> 
> We have quite a large guest (92 VCPUs) doing lots of VMEXITs and the
> theory is
> that lock's cnts atomic is starting to cause lots of coherence
> traffic. As a
> quick test of this replacing pt_vcpu_lock() in pt_update_irq() with
> just
> spin_lock(&v->arch.hvm_vcpu.tm_lock) gets us almost all performance
> back.
> 
> Stephen Brennan came up with new locking algorithm, I just coded it
> up.
> 
> A couple of notes:
> 
> * We have only observed the problem and tested this patch for
> performance on
>   a fairly old Xen version. However, vpt code is almost identical and
> I expect
>   upstream to suffer from the same issue.
> 
> * Stephen provided the following (slightly edited by me) writeup
> explaining the
>   locking algorithm. I would like to include it somewhere but not
> sure what the
>   right place would be. Commit message perhaps?
> 
> 
> Currently, every periodic_time is protected by locking the vcpu it is
> on. You
> can think of the per-vCPU lock (tm_lock) as protecting the fields of
> every
> periodic_time which is attached to that vCPU, as well as the list
> itself, and so
> it must be held when read or written, or when an object is added or
> removed
> to/from the list.
> 
> It seems that there are three types of access to the peridic_time
> objects:
> 
> 1. Functions which read (maybe write) all periodic_time instances
> attached to a
>    particular vCPU. These are functions which use pt_vcpu_lock()
> after the
>    commit, such as pt_restore_timer(), pt_save_timer(), etc.
> 2. Functions which want to modify a particular periodic_time object.
> These guys
>    lock whichever vCPU the periodic_time is attached to, but since
> the vCPU
>    could be modified without holding any lock, they are vulnerable to
> the bug.
>    Functions in this group use pt_lock(), such as pt_timer_fn() or
>    destroy_periodic_time().
> 3. Functions which not only want to modify the periodic_time, but
> also would
>    like to modify the =vcpu= fields. These are create_periodic_time()
> or
>    pt_adjust_vcpu(). They create the locking imbalance bug for group
> 2, but we
>    can't simply hold 2 vcpu locks due to the deadlock risk.
> 
> My proposed option is to add a per-periodic_time spinlock, which
> protects only
> the periodic_time.vcpu field. Whenever reading the vcpu field of a
> periodic_time
> struct, you must first take that lock. The critical sections of group
> 1 (your
> "fast path" functions) would look like this:
> 
> 1. lock vcpu
> 2. do whatever you want with pts currently on the vcpu. It is safe to
> read or write
>    fields of pt, because the vcpu lock protects those fields. You
> simply cannot
>    write pt->vcpu, because somebody holding the pt lock may already
> be spinning
>    waiting for your vcpu lock.
> 3. unlock vcpu
> 
> 
> Note that there is no additional locking in this fast path. For group
> 2
> functions (which are attempting to lock an individual periodic_time),
> the
> critical section would look like this:
> 
> 1. lock pt lock (stabilizing the vcpu field)
> 2. lock vcpu
> 3. feel free to modify any field of the periodic_time
> 4. unlock vcpu (due to the mutual exclusion of the pt lock, we know
> that we are
>    unlocking the correct vcpu -- we have not been migrated)
> 5. unlock pt
> 
> For functions in group 3, the critical section would be:
> 
> 1. lock pt (stabilizing the vcpu field)
> 2. lock current vcpu
> 3. remove from vcpu list
> 4. unlock vcpu. At this point, you're guaranteed that the vcpu
> functions
>    (callers of pt_vcpu_lock()) are not accessing your pt.
> 5. assign pt->vcpu  (we still have mutual exclusion against group 2
> functions)
> 6. lock destination vcpu
> 7. add to vcpu list
> 8. unlock destination vcpu
> 9. unlock pt
> 
> If functions from group 2 and 3 are less frequent, then you won't see
> too much
> added lock overhead in this situation! Plus, even if group 2 and 3
> are somewhat
> common, the performance overhead of an uncontented fine-grained lock
> is muuch
> smaller than the overhead of a heavily contended coarse-grained lock,
> like the
> per-domain rw lock.
> 
> 
> Boris Ostrovsky (1):
>   x86/vpt: Replace per-guest pt_migrate lock with per pt lock
> 
>  xen/arch/x86/emul-i8254.c     |   2 +
>  xen/arch/x86/hvm/hpet.c       |   1 +
>  xen/arch/x86/hvm/hvm.c        |   2 -
>  xen/arch/x86/hvm/rtc.c        |   1 +
>  xen/arch/x86/hvm/vlapic.c     |   1 +
>  xen/arch/x86/hvm/vpt.c        | 122 +++++++++++++++++++++++---------
> ----------
>  xen/include/asm-x86/hvm/vpt.h |   9 +---
>  7 files changed, 74 insertions(+), 64 deletions(-)
> 


