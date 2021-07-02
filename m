Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC93BA359
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 18:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149237.275919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMFR-0003Ui-IY; Fri, 02 Jul 2021 16:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149237.275919; Fri, 02 Jul 2021 16:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMFR-0003SE-FE; Fri, 02 Jul 2021 16:42:37 +0000
Received: by outflank-mailman (input) for mailman id 149237;
 Fri, 02 Jul 2021 16:42:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+naa=L2=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1lzMFQ-0003S8-2m
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:42:36 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce75d36e-57c0-44ea-883c-acb8a663e0c1;
 Fri, 02 Jul 2021 16:42:35 +0000 (UTC)
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id C507B180A9C91;
 Fri,  2 Jul 2021 16:42:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 10EBB20D764; 
 Fri,  2 Jul 2021 16:42:26 +0000 (UTC)
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
X-Inumbo-ID: ce75d36e-57c0-44ea-883c-acb8a663e0c1
Message-ID: <34a668a0606092990326207d2acc5441592756d6.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, pbonzini@redhat.com,
 bp@alien8.de,  seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com,  joro@8bytes.org,
 weijiang.yang@intel.com, kan.liang@linux.intel.com,  ak@linux.intel.com,
 wei.w.wang@intel.com, eranian@google.com,  liuxiangdong5@huawei.com,
 linux-kernel@vger.kernel.org, x86@kernel.org,  kvm@vger.kernel.org,
 like.xu.linux@gmail.com, Like Xu <like.xu@linux.intel.com>,  Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Guo Ren
 <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org,  linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Date: Fri, 02 Jul 2021 09:42:25 -0700
In-Reply-To: <YN88rE+cxb7HrEtI@hirez.programming.kicks-ass.net>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
	 <20210622094306.8336-2-lingshan.zhu@intel.com>
	 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
	 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
	 <YN88rE+cxb7HrEtI@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.40
X-Stat-Signature: ycuw4tc4dkddxofnskkdygh116nc5379
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 10EBB20D764
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18HOccKXnefKVhqRarv+ICfPC7oSScH3Ls=
X-HE-Tag: 1625244146-824246

On Fri, 2021-07-02 at 18:19 +0200, Peter Zijlstra wrote:
> On Fri, Jul 02, 2021 at 09:00:22AM -0700, Joe Perches wrote:
> > On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
> > > > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> > []
> > > > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > > > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > > > +				   perf_guest_cbs->handle_intel_pt_intr);
> > > > +}
> > > 
> > > Coding style wants { } on that last if().
> > 
> > That's just your personal preference.
> 
> As a maintainer, those carry weight, also that's tip rules:
> 
>   https://lore.kernel.org/lkml/20181107171149.165693799@linutronix.de/

Right, definitely so.

But merely referencing 'coding style' is ambiguous at best.

btw:

ASCII commonly refers to '{' and '}', the curly brackets, to be braces
and '[' and ']', the square brackets, to be brackets.

It might be clearer to use that terminology.

belts and braces, etc...

cheers, Joe

----------------

+Bracket rules
+^^^^^^^^^^^^^
+
+Brackets should be omitted only if the statement which follows 'if', 'for',
+'while' etc. is truly a single line::
+
+	if (foo)
+		do_something();
+
+The following is not considered to be a single line statement even
+though C does not require brackets::
+
+	for (i = 0; i < end; i++)
+		if (foo[i])
+			do_something(foo[i]);
+
+Adding brackets around the outer loop enhances the reading flow::
+
+	for (i = 0; i < end; i++) {
+		if (foo[i])
+			do_something(foo[i]);
+	}



