Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBD6A0D80
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 17:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500552.772000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVE2c-00047Z-Cb; Thu, 23 Feb 2023 16:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500552.772000; Thu, 23 Feb 2023 16:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVE2c-00045p-9r; Thu, 23 Feb 2023 16:01:54 +0000
Received: by outflank-mailman (input) for mailman id 500552;
 Thu, 23 Feb 2023 16:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQ4Q=6T=redhat.com=mtosatti@srs-se1.protection.inumbo.net>)
 id 1pVE1O-0003ga-R5
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 16:00:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3335beee-b393-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 17:00:33 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607--1jXzU_7PRmVsIqEwn375g-1; Thu, 23 Feb 2023 11:00:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1014A85D18D;
 Thu, 23 Feb 2023 16:00:13 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-3.gru2.redhat.com [10.97.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7638B404BEC0;
 Thu, 23 Feb 2023 16:00:12 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
 id 46AF0400DC95C; Thu, 23 Feb 2023 11:34:06 -0300 (-03)
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
X-Inumbo-ID: 3335beee-b393-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677168031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vf5SCrPN7PXFqJ124Pgf7U6gRRFbIhLBQzEmAht0jJg=;
	b=LxAgFT6TtR/00NtWGtG4+E4/LNVEmgzM693KvN3b3UVWCWSG02E2M25lRjC8WRfOebO0IK
	XJskJ23o0f1ihglvdxxP3Y/Z/ZBWHDsCP/+Kfq3LzdYMz6B0t2rZQ0eyGpmy29AK5TVbIM
	uz76gVPxytcgJBSWHjLkImclSjkRbNU=
X-MC-Unique: -1jXzU_7PRmVsIqEwn375g-1
Date: Thu, 23 Feb 2023 11:34:06 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next 2/2] x86/xen/time: cleanup
 xen_tsc_safe_clocksource
Message-ID: <Y/d5XhtOaYkNRnpQ@tpad>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
 <20230221041440.GA1934@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221041440.GA1934@templeofstupid.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

On Mon, Feb 20, 2023 at 08:14:40PM -0800, Krister Johansen wrote:
> On Mon, Feb 20, 2023 at 11:01:18PM +0100, Thomas Gleixner wrote:
> > On Mon, Feb 20 2023 at 09:17, Krister Johansen wrote:
> > > @@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
> > >  	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > >  	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > >  
> > > -	/* tsc_mode = no_emulate (2) */
> > > -	if (ebx != 2)
> > > +	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
> > >  		return 0;
> > >  
> > >  	return 1;
> > 
> > What about removing more stupidity from that function?
> > 
> > static bool __init xen_tsc_safe_clocksource(void)
> > {
> > 	u32 eax, ebx. ecx, edx;
> >  
> > 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > 
> > 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> > }
> 
> I'm all for simplifying.  I'm happy to clean up that return to be more
> idiomatic.  I was under the impression, perhaps mistaken, though, that
> the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
> check_tsc_unstable() checks were actually serving a purpose: to ensure
> that we don't rely on the tsc in environments where it's being emulated
> and the OS would be better served by using a PV clock.  Specifically,
> kvmclock_init() makes a very similar set of checks that I also thought
> were load-bearing.

kvmclock_init will lower the rating of kvmclock so that TSC clocksource
can be used instead:

        /*
         * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
         * with P/T states and does not stop in deep C-states.
         *
         * Invariant TSC exposed by host means kvmclock is not necessary:
         * can use TSC as clocksource.
         *
         */
        if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
            boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
            !check_tsc_unstable())
                kvm_clock.rating = 299;




