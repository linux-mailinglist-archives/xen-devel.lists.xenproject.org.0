Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72B6A0E8F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 18:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500597.772073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVFFL-0007vu-7B; Thu, 23 Feb 2023 17:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500597.772073; Thu, 23 Feb 2023 17:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVFFL-0007sv-47; Thu, 23 Feb 2023 17:19:07 +0000
Received: by outflank-mailman (input) for mailman id 500597;
 Thu, 23 Feb 2023 17:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AoXJ=6T=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pVFFJ-0007sp-6q
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 17:19:05 +0000
Received: from caracal.birch.relay.mailchannels.net
 (caracal.birch.relay.mailchannels.net [23.83.209.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 291e0371-b39e-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 18:19:01 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 47F195C1787
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 17:18:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id C388B5C1867
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 17:18:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.37 (trex/6.7.1); Thu, 23 Feb 2023 17:18:58 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4PN09s2svGz1F
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 09:18:57 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0084 by kmjvbox (DragonFly Mail Agent v0.12);
 Thu, 23 Feb 2023 09:18:54 -0800
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
X-Inumbo-ID: 291e0371-b39e-11ed-a82a-c9ca1d2f71af
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677172737; a=rsa-sha256;
	cv=none;
	b=fmyLAAsEUuGbLGF9pjrJm06bn69Tkq5A/hhz4FxFqvdp7k38zbuLZZTDPlC8fRZOh+njMf
	57JCdO1D0lLc0fcgCkqv8IodEFiUdJnD4m8HUf/F45zphacBpRK0z7fMch2K8sRY4Fmeyf
	eLAtP02F4irsxKnwR2KuDv26oFA3e9UudMualONfkpRqUCAH/8+qG/SsiPTDj+2NyBQKGj
	Bemj6PB+Qpvdw7oO+LzwGDMewdhNqweYU3emhZq1tJTp1GxcyT4Gs2DTXJXbN17lbbHi5e
	TCmtRk5F0Zuu3ViW/1K6L5AUdDZLHRzchjhVlDVqWAUxIpaTtCQ4sxgRPkHEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677172737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=lRYce4KCQENlo/4Iyy0wDSPQmcZweRPYZ7BvHZ9CWRo=;
	b=V6BKmAHgsomefRwdKSThgaX2R7oGzr+lBxoYDj+3/vwtQlwE4SqkL+D6un6pZ8LA0Pa3au
	9aEAwuUWglj/11VDdegPoEPuA8tZdGcgxG/95rG0LQRYTSUepaLjyI0d0Is21KtjBM5kug
	c2hGZTcgVUHQSF+2QiLqIZKleCQ1sePjmS/bM9bwi1kFrDQF6a0fpXhJ/c0T7eN7bd7Uxp
	66qzCfZLLm/5SC2Ak6D4yAux+gNBeItjD6Eug1NQknMzKetn7Bw+GKfque3+rO1Sv9Bna/
	Tf4L3RoldC4tyHbwKbNRDbpiRPuBAFvAJtLeatJrYuAWwk6bdhR70XI3WeRLYQ==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-ll7r5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Troubled-Imminent: 6163f91c7fcb1717_1677172738116_3373059583
X-MC-Loop-Signature: 1677172738116:3732760560
X-MC-Ingress-Time: 1677172738116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677172737;
	bh=lRYce4KCQENlo/4Iyy0wDSPQmcZweRPYZ7BvHZ9CWRo=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=oPIxTFyZbMU3AEcozwC1RmCJGc00jusHFNFoQQEuMMaPyjzSDKAvMkKTIAJVzWzng
	 DZkvMkL0LeNHmwVu0fJkiqnT43AE8G/dQY83QZlEwNOFV5S/bKAcBW+5LtE+QN2Wnb
	 Ftx4k00m5JnHe3CXR598SkIRB4GertoqAtjZQMao=
Date: Thu, 23 Feb 2023 09:18:54 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
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
Message-ID: <20230223171854.GA1963@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
 <20230221041440.GA1934@templeofstupid.com>
 <Y/d5XhtOaYkNRnpQ@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/d5XhtOaYkNRnpQ@tpad>

Hi Marcelo,

On Thu, Feb 23, 2023 at 11:34:06AM -0300, Marcelo Tosatti wrote:
> On Mon, Feb 20, 2023 at 08:14:40PM -0800, Krister Johansen wrote:
> > On Mon, Feb 20, 2023 at 11:01:18PM +0100, Thomas Gleixner wrote:
> > > On Mon, Feb 20 2023 at 09:17, Krister Johansen wrote:
> > > > @@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
> > > >  	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > > >  	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > > >  
> > > > -	/* tsc_mode = no_emulate (2) */
> > > > -	if (ebx != 2)
> > > > +	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
> > > >  		return 0;
> > > >  
> > > >  	return 1;
> > > 
> > > What about removing more stupidity from that function?
> > > 
> > > static bool __init xen_tsc_safe_clocksource(void)
> > > {
> > > 	u32 eax, ebx. ecx, edx;
> > >  
> > > 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > > 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > > 
> > > 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> > > }
> > 
> > I'm all for simplifying.  I'm happy to clean up that return to be more
> > idiomatic.  I was under the impression, perhaps mistaken, though, that
> > the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
> > check_tsc_unstable() checks were actually serving a purpose: to ensure
> > that we don't rely on the tsc in environments where it's being emulated
> > and the OS would be better served by using a PV clock.  Specifically,
> > kvmclock_init() makes a very similar set of checks that I also thought
> > were load-bearing.
> 
> kvmclock_init will lower the rating of kvmclock so that TSC clocksource
> can be used instead:
> 
>         /*
>          * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
>          * with P/T states and does not stop in deep C-states.
>          *
>          * Invariant TSC exposed by host means kvmclock is not necessary:
>          * can use TSC as clocksource.
>          *
>          */
>         if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
>             boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
>             !check_tsc_unstable())
>                 kvm_clock.rating = 299;

Yes, I saw the change you made to the kvmclock to do this and was
inspired to try to do something similar for Xen:

https://lore.kernel.org/xen-devel/20221216162118.GB2633@templeofstupid.com/

Thanks,

-K

