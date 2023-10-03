Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BC7B62D2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612129.951963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaCe-0006Zm-RA; Tue, 03 Oct 2023 07:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612129.951963; Tue, 03 Oct 2023 07:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaCe-0006Wz-ON; Tue, 03 Oct 2023 07:52:24 +0000
Received: by outflank-mailman (input) for mailman id 612129;
 Tue, 03 Oct 2023 07:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g4lE=FR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnaCc-0006UU-Ry
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:52:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6dab3dc-61c1-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 09:52:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 421944EE0737;
 Tue,  3 Oct 2023 09:52:18 +0200 (CEST)
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
X-Inumbo-ID: c6dab3dc-61c1-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 03 Oct 2023 09:52:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 Henry.Wang@arm.com, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/7] xen: add declarations for variables where needed
In-Reply-To: <ZRvAOdKKD6T6l2cK@MacBookPdeRoger>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
 <357a35c3035d0f8659a64d767791bc41d57494d3.1696232393.git.nicola.vetrini@bugseng.com>
 <ZRqkbeVUZbjizjNv@MacBookPdeRoger>
 <872f44542c8df6dab79965375376010d@bugseng.com>
 <ZRvAOdKKD6T6l2cK@MacBookPdeRoger>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d9652187e9d0f15c5678273112c4ba56@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 03/10/2023 09:18, Roger Pau Monné wrote:
> On Tue, Oct 03, 2023 at 09:05:34AM +0200, Nicola Vetrini wrote:
>> On 02/10/2023 13:07, Roger Pau Monné wrote:
>> > On Mon, Oct 02, 2023 at 09:49:44AM +0200, Nicola Vetrini wrote:
>> > > Some variables with external linkage used in C code do not have
>> > > a visible declaration where they are defined. Providing such
>> > > declaration also resolves violations of MISRA C:2012 Rule 8.4.
>> > >
>> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> > > ---
>> > >  xen/arch/arm/include/asm/setup.h  |  3 +++
>> > >  xen/arch/arm/include/asm/smp.h    |  3 +++
>> > >  xen/arch/x86/cpu/mcheck/mce.c     |  6 +++---
>> > >  xen/arch/x86/include/asm/setup.h  |  3 +++
>> > >  xen/arch/x86/irq.c                |  2 +-
>> > >  xen/arch/x86/platform_hypercall.c |  3 ---
>> > >  xen/common/symbols.c              | 17 -----------------
>> > >  xen/include/xen/hypercall.h       |  3 +++
>> > >  xen/include/xen/symbols.h         | 18 ++++++++++++++++++
>> > >  9 files changed, 34 insertions(+), 24 deletions(-)
>> > >

>> > > diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
>> > > index f307dfb59760..12de5a69b5b1 100644
>> > > --- a/xen/include/xen/hypercall.h
>> > > +++ b/xen/include/xen/hypercall.h
>> > > @@ -24,6 +24,9 @@
>> > >  /* Needs to be after asm/hypercall.h. */
>> > >  #include <xen/hypercall-defs.h>
>> > >
>> > > +/* Declarations for items shared with the compat mode handler. */
>> > > +extern spinlock_t xenpf_lock;
>> >
>> > I'm confused about why this needs to be moved, AFAICT xenpf_lock is
>> > only used in platform_hypercall.c, and the declaration is
>> > unconditional, so there's no definition without declaration issue.
>> >
>> 
>> The violation was on ARM code, because of a slight inconsistency:
>> xen/arch/arm/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);
>> 
>> xen/arch/x86/platform_hypercall.c:extern spinlock_t xenpf_lock;
>> xen/arch/x86/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);
>> 
>> therefore, by moving the extern declaration to the common header there
>> should be no issue.
> 
> Just make xenpf_lock static on arm, that would be a better solution.
> The only need for the lock to be global is because of compat code, and
> arm doesn't seem to need it.
> 
> Thanks, Roger.

I'll do that, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

