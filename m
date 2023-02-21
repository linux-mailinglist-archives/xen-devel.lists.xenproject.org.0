Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AA69E5D8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499082.770102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWL7-0006og-P0; Tue, 21 Feb 2023 17:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499082.770102; Tue, 21 Feb 2023 17:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWL7-0006md-Lw; Tue, 21 Feb 2023 17:22:05 +0000
Received: by outflank-mailman (input) for mailman id 499082;
 Tue, 21 Feb 2023 17:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpaj=6R=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUWL6-0006mX-4o
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:22:04 +0000
Received: from fossa.birch.relay.mailchannels.net
 (fossa.birch.relay.mailchannels.net [23.83.209.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f30b637-b20c-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 18:22:00 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 19FAD100BDE
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 17:21:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id A3A9C100D49
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 17:21:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.107.134.126 (trex/6.7.1); Tue, 21 Feb 2023 17:21:57 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4PLmLD3KPszs2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 09:21:56 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0049 by kmjvbox (DragonFly Mail Agent v0.12);
 Tue, 21 Feb 2023 09:21:53 -0800
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
X-Inumbo-ID: 3f30b637-b20c-11ed-93b6-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677000117; a=rsa-sha256;
	cv=none;
	b=6LNeswM14LG7SEv4EJuJzbcPK9yxw2FjS8mK39q4oSvkJ2Ya6yHlBhgnhiIgCiLH19sJNA
	eTjJuazBcEjhOsWnk26Tx9G6G4u8CMzEIEoFEA39ZE4VjpGzMW/79VPlMudOUS+RORJZPG
	nfTdqXSxbDroc+Nb77kTOvSHdrQ23j7YVlL/BIH/JPkZqjgm057e/Dbi8UG+vmgEmmtf5p
	c0ACxiueVbw7MoR0QiyquLmdtsNka8w7LJBOQxIPIV+OWAm3ZUyrSQnzi02M9VCsI/Q31T
	T9SxvFwIIemm5or70jo+EGo45tUUcfyb5+iomzqtcs/aR75BghGtGsDEffVtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677000117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Ik/BxQVPULpYrwYc2hSx19d57QjiK1F7eWzQZ1uWOVk=;
	b=J4derqVFJoMoBMS/cOvGnTn+1pWG8PtkakqynpvlrMNI7DP8XPx22NbRhksWdA7Mz3US7t
	RXP1weVwGeCUrjhYnx584vnfuZwbuI1WsY2jnCQp+E96FLqX0uKvtwV6KxWp7txe6DQCNh
	jhWH6jBRFA1ufHME3j7WAlNeJwjsMKKtx9vbQZaxa1tOoefKz/Py6a+Gftljo2ey8tz5G/
	cSaVj/Pk5tU3wv80JVQijOrpiVbRZH6Er2VYnz1whEkFt3J6/VxKd9+oE5ej35izV93H5p
	vqgH2cWE3dHQmVVScySMf+WQlnxLiYNF5sKFGL0NPvGCRtaHtPWniXQE2ce6zQ==
ARC-Authentication-Results: i=1;
	rspamd-5db48964c-h5x86;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Reign-Belong: 345d51f47e06eb0c_1677000117906_2636194607
X-MC-Loop-Signature: 1677000117906:3418325762
X-MC-Ingress-Time: 1677000117905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677000116;
	bh=Ik/BxQVPULpYrwYc2hSx19d57QjiK1F7eWzQZ1uWOVk=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=gqF9568282uKRsEIEgA1nRl+jKjN+IosOQmmHCR/gPRbwLyXl2ITSNpOf7umXPYdF
	 u73Oxg7tU1yOpCAY7rg/bT5YAvg/eOIlyqKV4CizKqFDA7SQjMXbJH3nfWz5Elz71n
	 idH4kJJcLrOUw5dgnxgx03DDEjqg2oXoNYnz0oEY=
Date: Tue, 21 Feb 2023 09:21:53 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next 2/2] x86/xen/time: cleanup
 xen_tsc_safe_clocksource
Message-ID: <20230221172153.GA1958@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
 <20230221041440.GA1934@templeofstupid.com>
 <20230221055117.GA1934@templeofstupid.com>
 <871qmjpegh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qmjpegh.ffs@tglx>

On Tue, Feb 21, 2023 at 10:14:54AM +0100, Thomas Gleixner wrote:
> On Mon, Feb 20 2023 at 21:51, Krister Johansen wrote:
> > On Mon, Feb 20, 2023 at 08:14:40PM -0800, Krister Johansen wrote:
> >> > static bool __init xen_tsc_safe_clocksource(void)
> >> > {
> >> > 	u32 eax, ebx. ecx, edx;
> >> >  
> >> > 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> >> > 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> >> > 
> >> > 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> >> > }
> >> 
> >> I'm all for simplifying.  I'm happy to clean up that return to be more
> >> idiomatic.  I was under the impression, perhaps mistaken, though, that
> >> the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
> >> check_tsc_unstable() checks were actually serving a purpose: to ensure
> >> that we don't rely on the tsc in environments where it's being emulated
> >> and the OS would be better served by using a PV clock.  Specifically,
> >> kvmclock_init() makes a very similar set of checks that I also thought
> >> were load-bearing.
> >
> > Bah, what I meant to say was emulated, unstable, or otherwise unsuitable
> > for use as a clocksource.  IOW, even if TSC_MODE_NEVER_EMULATE is
> > set, it's possible that a user is attempting a migration from a cpu
> > that's not invariant, and we'd still want to check for that case and
> > fall back to a PV clocksource, correct?
> 
> Sure. But a life migration from a NEVER_EMULATE to a non-invariant host
> is a patently bad idea and has nothing to do with the __init function,
> which is gone at that point already.
> 
> What I wanted to say:
> 
> static bool __init xen_tsc_safe_clocksource(void)
> {
>         ......        
> 
> 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> 
> 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> }

Thanks, I'm happy to make it look like ^ that.  I should have thought to
do this myself. :/

I'll send out a v2 making this correction.

> I didn't have the full context and was just looking at the condition.
> Now I checked the full context and I think that except for the
> 
> 	if (check_tsc_unstable())
> 
> check everything else can go away unless you do not trust the hypervisor
> that it only sets the NEVER_EMULATE bit when CONSTANT and NONSTOP are
> set as well. But yeah, you might prefer to be paranoid. It's virt after
> all.

Unless there are objections, I think I'd prefer to err on the side of
paranoia here.  Sorry for the confusion.

-K

