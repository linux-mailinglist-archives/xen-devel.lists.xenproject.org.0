Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCF1F1DDE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiL1H-0003qQ-2z; Mon, 08 Jun 2020 16:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHR7=7V=amazon.com=prvs=42145175d=anchalag@srs-us1.protection.inumbo.net>)
 id 1jiL1F-0003pX-1c
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:53:05 +0000
X-Inumbo-ID: 848e6030-a9a8-11ea-b299-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 848e6030-a9a8-11ea-b299-12813bfff9fa;
 Mon, 08 Jun 2020 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1591635185; x=1623171185;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=rnDp5I6x3A3PSGWGNTcHDsvC0Hxz7VaObBC0sQPmk2o=;
 b=twU2fmUrnBpP6ZP4ZLcjRhEW4flqq+Xa+NF4TujYu+uonE9q0ekeBra2
 dMqLNP5SUmgdXobnJMe+dWlM/HKZ3mGx+c/FNlAIT6kSXXC2tySxi9aez
 lzU8+To5xiCL7TxyR8yqyxAESiWDSFNbXQe+8ZsibjlBFfeUNyFRbtUUE o=;
IronPort-SDR: MSGLE2U6Ywvdm0/7LZ2EFFZLSYATNkPwGtPzXiLLT7V5bdnlx5eTqZ85cjdTzmiDTvSDMabs5n
 CF2KXs+xJ+3A==
X-IronPort-AV: E=Sophos;i="5.73,487,1583193600"; d="scan'208";a="50682291"
Subject: Re: [PATCH 03/12] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 08 Jun 2020 16:53:01 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id B726EA221B; Mon,  8 Jun 2020 16:52:58 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Jun 2020 16:52:36 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Jun 2020 16:52:36 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Mon, 8 Jun 2020 16:52:36 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id C641640832; Mon,  8 Jun 2020 16:52:35 +0000 (UTC)
Date: Mon, 8 Jun 2020 16:52:35 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200608165235.GA1330@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <529f544a64bb93b920bf86b1d3f86d93b0a4219b.1589926004.git.anchalag@amazon.com>
 <72989b50-0c13-7a2b-19e2-de4a3646c83f@oracle.com>
 <20200604230307.GB25251@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <9644a5f1-e1f8-5fe1-3135-cc6b4baf893b@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9644a5f1-e1f8-5fe1-3135-cc6b4baf893b@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, bp@alien8.de, tglx@linutronix.de, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 05:39:54PM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 6/4/20 7:03 PM, Anchal Agarwal wrote:
> > On Sat, May 30, 2020 at 07:02:01PM -0400, Boris Ostrovsky wrote:
> >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>
> >>
> >>
> >> On 5/19/20 7:25 PM, Anchal Agarwal wrote:
> >>> Introduce a small function which re-uses shared page's PA allocated
> >>> during guest initialization time in reserve_shared_info() and not
> >>> allocate new page during resume flow.
> >>> It also  does the mapping of shared_info_page by calling
> >>> xen_hvm_init_shared_info() to use the function.
> >>>
> >>> Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
> >>> ---
> >>>  arch/x86/xen/enlighten_hvm.c | 7 +++++++
> >>>  arch/x86/xen/xen-ops.h       | 1 +
> >>>  2 files changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> >>> index e138f7de52d2..75b1ec7a0fcd 100644
> >>> --- a/arch/x86/xen/enlighten_hvm.c
> >>> +++ b/arch/x86/xen/enlighten_hvm.c
> >>> @@ -27,6 +27,13 @@
> >>>
> >>>  static unsigned long shared_info_pfn;
> >>>
> >>> +void xen_hvm_map_shared_info(void)
> >>> +{
> >>> +     xen_hvm_init_shared_info();
> >>> +     if (shared_info_pfn)
> >>> +             HYPERVISOR_shared_info = __va(PFN_PHYS(shared_info_pfn));
> >>> +}
> >>> +
> >>
> >> AFAICT it is only called once so I don't see a need for new routine.
> >>
> >>
> > HYPERVISOR_shared_info can only be mapped in this scope without refactoring
> > much of the code.
> 
> 
> Refactoring what? All am suggesting is
>
shared_info_pfn does not seem to be in scope here, it's scope is limited
to enlighten_hvm.c. That's the reason I introduced a new function there.

> --- a/arch/x86/xen/suspend.c
> +++ b/arch/x86/xen/suspend.c
> @@ -124,7 +124,9 @@ static void xen_syscore_resume(void)
>                 return;
> 
>         /* No need to setup vcpu_info as it's already moved off */
> -       xen_hvm_map_shared_info();
> +       xen_hvm_init_shared_info();
> +       if (shared_info_pfn)
> +               HYPERVISOR_shared_info = __va(PFN_PHYS(shared_info_pfn));
> 
>         pvclock_resume();
> 
> >> And is it possible for shared_info_pfn to be NULL in resume path (which
> >> is where this is called)?
> >>
> >>
> > I don't think it should be, still a sanity check but I don't think its needed there
> > because hibernation will fail in any case if thats the case.
> 
> 
> If shared_info_pfn is NULL you'd have problems long before hibernation
> started. We set it in xen_hvm_guest_init() and never touch again.
> 
> 
> In fact, I'd argue that it should be __ro_after_init.
> 
> 
I agree, and I should have mentioned that I will remove that check and its not
necessary as this gets mapped way early in the boot process.
> > However, HYPERVISOR_shared_info does needs to be re-mapped on resume as its been
> > marked to dummy address on suspend. Its also safe in case va changes.
> > Does the answer your question?
> 
> 
> I wasn't arguing whether HYPERVISOR_shared_info needs to be set, I was
> only saying that shared_info_pfn doesn't need to be tested.
> 
Got it. :)
> 
> -boris
> 
Thanks,
Anchal
> 

