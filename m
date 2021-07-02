Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB953BA369
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 18:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149252.275953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMTR-0005fE-6M; Fri, 02 Jul 2021 16:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149252.275953; Fri, 02 Jul 2021 16:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMTR-0005cd-3F; Fri, 02 Jul 2021 16:57:05 +0000
Received: by outflank-mailman (input) for mailman id 149252;
 Fri, 02 Jul 2021 16:57:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+naa=L2=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1lzMTP-0005cX-7b
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:57:03 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.146])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 859efe72-db56-11eb-83be-12813bfff9fa;
 Fri, 02 Jul 2021 16:57:02 +0000 (UTC)
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 1BBDF837F27E;
 Fri,  2 Jul 2021 16:57:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id D6515D1517; 
 Fri,  2 Jul 2021 16:56:52 +0000 (UTC)
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
X-Inumbo-ID: 859efe72-db56-11eb-83be-12813bfff9fa
Message-ID: <7a2ef915bd08a1c0277b9633e20905c0ca62c568.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Zhu Lingshan
 <lingshan.zhu@intel.com>,  wanpengli@tencent.com, Like Xu
 <like.xu@linux.intel.com>, eranian@google.com,  weijiang.yang@intel.com,
 Guo Ren <guoren@kernel.org>,  linux-riscv@lists.infradead.org, Will Deacon
 <will@kernel.org>,  kvmarm@lists.cs.columbia.edu,
 kan.liang@linux.intel.com, ak@linux.intel.com,  kvm@vger.kernel.org, Marc
 Zyngier <maz@kernel.org>, joro@8bytes.org,  x86@kernel.org,
 linux-csky@vger.kernel.org, wei.w.wang@intel.com, 
 xen-devel@lists.xenproject.org, liuxiangdong5@huawei.com, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,  linux-arm-kernel@lists.infradead.org,
 jmattson@google.com,  like.xu.linux@gmail.com, Nick Hu
 <nickhu@andestech.com>, seanjc@google.com,  linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, vkuznets@redhat.com
Date: Fri, 02 Jul 2021 09:56:51 -0700
In-Reply-To: <20210702163836.GB94260@C02TD0UTHF1T.local>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
	 <20210622094306.8336-2-lingshan.zhu@intel.com>
	 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
	 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
	 <20210702163836.GB94260@C02TD0UTHF1T.local>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.40
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D6515D1517
X-Stat-Signature: yfcchsbgyrrjqd9annscud3jta5gtkxi
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/FrPSf3Ewjv8gI9yMKoa9Lq2JHlpGAS2Q=
X-HE-Tag: 1625245012-826405

On Fri, 2021-07-02 at 17:38 +0100, Mark Rutland wrote:
> On Fri, Jul 02, 2021 at 09:00:22AM -0700, Joe Perches wrote:
> > On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
[]
> > > > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > > > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > > > +				   perf_guest_cbs->handle_intel_pt_intr);
> > > > +}
> > > 
> > > Coding style wants { } on that last if().
> > 
> > That's just your personal preference.
> > 
> > The coding-style document doesn't require that.
> > 
> > It just says single statement.  It's not the number of
> > vertical lines or characters required for the statement.
> > 
> > ----------------------------------
> > 
> > Do not unnecessarily use braces where a single statement will do.
> > 
> > .. code-block:: c
> > 
> > 	if (condition)
> > 		action();
> > 
> > and
> > 
> > .. code-block:: none
> > 
> > 	if (condition)
> > 		do_this();
> > 	else
> > 		do_that();
> > 
> > This does not apply if only one branch of a conditional statement is a single
> > statement; in the latter case use braces in both branches:
> 
> Immediately after this, we say:
> 
> > Also, use braces when a loop contains more than a single simple statement:
> > 
> > .. code-block:: c
> > 
> >         while (condition) {
> >                 if (test)
> >                         do_something();
> >         }
> > 
> 
> ... and while that says "a loop", the principle is obviously supposed to
> apply to conditionals too; structurally they're no different. We should
> just fix the documentation to say "a loop or conditional", or something
> to that effect.

<shrug>  Maybe.

I think there are _way_ too many existing obvious uses where the
statement that follows a conditional is multi-line.

	if (foo)
		printk(fmt,
		       args...);

where the braces wouldn't add anything other than more vertical space.

I don't much care one way or another other than Peter's somewhat ambiguous
use of the phrase "coding style".

checkpatch doesn't emit a message either way.
-----------------------------------------
$ cat t_multiline.c
// SPDX-License-Identifier: GPL-2.0-only

void foo(void)
{
	if (foo) {
		pr_info(fmt,
			args);
	}

	if (foo)
		pr_info(fmt,
			args);

	if (foo)
		pr_info(fmt, args);
}

$ ./scripts/checkpatch.pl -f --strict t_multiline.c
total: 0 errors, 0 warnings, 0 checks, 16 lines checked

t_multiline.c has no obvious style problems and is ready for submission.
-----------------------------------------

cheers, Joe



