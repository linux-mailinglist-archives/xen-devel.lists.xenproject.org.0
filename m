Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E03BA300
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 18:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149215.275865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLam-0005Tx-6u; Fri, 02 Jul 2021 16:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149215.275865; Fri, 02 Jul 2021 16:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLam-0005S8-3o; Fri, 02 Jul 2021 16:00:36 +0000
Received: by outflank-mailman (input) for mailman id 149215;
 Fri, 02 Jul 2021 16:00:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+naa=L2=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1lzLak-0005S2-Qz
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:00:34 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.36])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a21a0c34-db4e-11eb-83b7-12813bfff9fa;
 Fri, 02 Jul 2021 16:00:34 +0000 (UTC)
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 5E8CE181D207E;
 Fri,  2 Jul 2021 16:00:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 850751A29F9; 
 Fri,  2 Jul 2021 16:00:25 +0000 (UTC)
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
X-Inumbo-ID: a21a0c34-db4e-11eb-83b7-12813bfff9fa
Message-ID: <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Peter Zijlstra <peterz@infradead.org>, Zhu Lingshan
 <lingshan.zhu@intel.com>
Cc: pbonzini@redhat.com, bp@alien8.de, seanjc@google.com,
 vkuznets@redhat.com,  wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org,  weijiang.yang@intel.com, kan.liang@linux.intel.com,
 ak@linux.intel.com,  wei.w.wang@intel.com, eranian@google.com,
 liuxiangdong5@huawei.com,  linux-kernel@vger.kernel.org, x86@kernel.org,
 kvm@vger.kernel.org,  like.xu.linux@gmail.com, Like Xu
 <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Guo Ren <guoren@kernel.org>,  Nick Hu
 <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org,  linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Date: Fri, 02 Jul 2021 09:00:22 -0700
In-Reply-To: <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
	 <20210622094306.8336-2-lingshan.zhu@intel.com>
	 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 850751A29F9
X-Spam-Status: No, score=-1.40
X-Stat-Signature: shha9bwa3wcuy6qog6sh3abeec4qbbut
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18c3UUJH2LcjAG65GSZ68xha895S86OjZI=
X-HE-Tag: 1625241625-20610

On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
> > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
[]
> > @@ -90,6 +90,27 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
> >   */
> >  DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_msrs);
> >  
> > 
> > +DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
> > +DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> > +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
> > +
> > +void arch_perf_update_guest_cbs(void)
> > +{
> > +	static_call_update(x86_guest_state, (void *)&__static_call_return0);
> > +	static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
> > +	static_call_update(x86_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->state)
> > +		static_call_update(x86_guest_state, perf_guest_cbs->state);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->get_ip)
> > +		static_call_update(x86_guest_get_ip, perf_guest_cbs->get_ip);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > +				   perf_guest_cbs->handle_intel_pt_intr);
> > +}
> 
> Coding style wants { } on that last if().

That's just your personal preference.

The coding-style document doesn't require that.

It just says single statement.  It's not the number of
vertical lines or characters required for the statement.

----------------------------------

Do not unnecessarily use braces where a single statement will do.

.. code-block:: c

	if (condition)
		action();

and

.. code-block:: none

	if (condition)
		do_this();
	else
		do_that();

This does not apply if only one branch of a conditional statement is a single
statement; in the latter case use braces in both branches:



