Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E73BA328
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 18:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149223.275886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLuo-0008JO-4A; Fri, 02 Jul 2021 16:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149223.275886; Fri, 02 Jul 2021 16:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLuo-0008Hg-1F; Fri, 02 Jul 2021 16:21:18 +0000
Received: by outflank-mailman (input) for mailman id 149223;
 Fri, 02 Jul 2021 16:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8c6G=L2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1lzLum-0008HW-II
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:21:17 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5675a5e2-f293-45b3-8fc4-d5e4a817d9cc;
 Fri, 02 Jul 2021 16:21:13 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLtX-007r9Y-4l; Fri, 02 Jul 2021 16:20:02 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 65FA830007E;
 Fri,  2 Jul 2021 18:19:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 484942B759E47; Fri,  2 Jul 2021 18:19:56 +0200 (CEST)
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
X-Inumbo-ID: 5675a5e2-f293-45b3-8fc4-d5e4a817d9cc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1zeioteA+jdIxWL/dgp30Yr4n/h54VyVtqBx1y8dmpw=; b=fYXRPL+pdyd6pWTWgyqUpSCon6
	hVRsaqHU4sbIFMylpPESw6s1ds+Ne9pVmfvWssHCPh1tDhQ9NkyStK+h+EbWgWCnW12z5BtIVCdGe
	f+zT2Z6CPo0EeWU9hw197UGVVVwpfo/M/LWBBZmP19BuXpyZ9vOQSoLzX4yYf8flnCnzPjudhIe5I
	nAPW1UA4YFmGzh9Tr8facSLDTW5eGOBQNDmEGJQ9f2Ue8KDsvmGSbeYOcfg67qbyPcb5an5v85HpA
	uIFMkJLiWxHwoIg2+vPo84aLIc+3qyJICFoRdiDRt5ZJq1EXAve92cC7Nu/lybkzevKBEV34ZCENu
	mIazXrTg==;
Date: Fri, 2 Jul 2021 18:19:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joe Perches <joe@perches.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, pbonzini@redhat.com,
	bp@alien8.de, seanjc@google.com, vkuznets@redhat.com,
	wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
	weijiang.yang@intel.com, kan.liang@linux.intel.com,
	ak@linux.intel.com, wei.w.wang@intel.com, eranian@google.com,
	liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, like.xu.linux@gmail.com,
	Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <YN88rE+cxb7HrEtI@hirez.programming.kicks-ass.net>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>

On Fri, Jul 02, 2021 at 09:00:22AM -0700, Joe Perches wrote:
> On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> > On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
> > > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> []
> > > @@ -90,6 +90,27 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
> > >   */
> > >  DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_msrs);
> > >  
> > > 
> > > +DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
> > > +DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> > > +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
> > > +
> > > +void arch_perf_update_guest_cbs(void)
> > > +{
> > > +	static_call_update(x86_guest_state, (void *)&__static_call_return0);
> > > +	static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
> > > +	static_call_update(x86_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
> > > +
> > > +	if (perf_guest_cbs && perf_guest_cbs->state)
> > > +		static_call_update(x86_guest_state, perf_guest_cbs->state);
> > > +
> > > +	if (perf_guest_cbs && perf_guest_cbs->get_ip)
> > > +		static_call_update(x86_guest_get_ip, perf_guest_cbs->get_ip);
> > > +
> > > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > > +				   perf_guest_cbs->handle_intel_pt_intr);
> > > +}
> > 
> > Coding style wants { } on that last if().
> 
> That's just your personal preference.

As a maintainer, those carry weight, also that's tip rules:

  https://lore.kernel.org/lkml/20181107171149.165693799@linutronix.de/

