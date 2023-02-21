Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299869DA81
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 06:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498520.769395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pULYn-0000on-Ea; Tue, 21 Feb 2023 05:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498520.769395; Tue, 21 Feb 2023 05:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pULYn-0000m6-B2; Tue, 21 Feb 2023 05:51:29 +0000
Received: by outflank-mailman (input) for mailman id 498520;
 Tue, 21 Feb 2023 05:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpaj=6R=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pULYl-0000lx-AE
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 05:51:27 +0000
Received: from bumble.birch.relay.mailchannels.net
 (bumble.birch.relay.mailchannels.net [23.83.209.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4557ade-b1ab-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 06:51:23 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 7126E6C14D2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 05:51:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id EEA9B6C13D7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 05:51:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.107.134.126 (trex/6.7.1); Tue, 21 Feb 2023 05:51:20 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4PLT1M3nCPz4f
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 21:51:19 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00f5 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 20 Feb 2023 21:51:17 -0800
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
X-Inumbo-ID: c4557ade-b1ab-11ed-93b5-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676958680; a=rsa-sha256;
	cv=none;
	b=P/LyeC5VJy2k15smy91wrTaCZPsx3iu4tVq3lIjboluvHkv0xcq39GNu0kfDijFfsHLf0p
	ULIXZxwyQYkAClvopN00WuZhlRclnlvezipw0h3qSBxH4CugmjEmg3nlgi/5huq/vZeqh7
	SeBDZDW1b6UcbdYxooVA4nW1yaj6/1C0/10shj4EHPgzNzKAb43ZBPpPoZt/7PPlmWs8gd
	kc+BH/vg9IERTZJw9pcdkU7jCyxp7yLrcXSMvDCZdRnqWEIWbqH7QhET9xajN/r8gekLmY
	lzCGnaL7vEYExdnOSsF3nea5sN3A4YjB9o1Bh8VYS8oQRs6YedqRO1UsafUStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1676958680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4Ryms4gHoy/MGnNprWGKzCdsTkn+W4ai7vFOzO+3AGw=;
	b=3P6hxWtKbaqG76Fh6IYONPJSCJYuOVJv2GC1nxO/in/eyXs9LZCqPLKd3d6SSK6cp99bUQ
	UFLoukSPM3nx4mDYL+Z3Usehjh1VBPC0v8ZD2Ob2QZZsjAnmtF/ra3hWek2fW55Wf0w3y4
	6fyd/PPoOGnWipC18REV7qgKVdMnNtDgYKklX30BC615KXDv0HN5L5XsxFu4I4o9YkF6Uz
	Szn5NnDbHQDbhKYyQj5uT3dvqfMlp0xzB+GBfg8jS4nxF/Sa/gxomFi03+SNeJEk+aHFCq
	qRkRP/eYRlzV8M+eQoCo4IWqx2ZLpFK8BOFI5QNL3vdTAp1ztpaYlsW9UgI7Sw==
ARC-Authentication-Results: i=1;
	rspamd-5db48964c-9hc9p;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Zesty-Invention: 543ef75e49736803_1676958680241_3740235661
X-MC-Loop-Signature: 1676958680241:2041868574
X-MC-Ingress-Time: 1676958680241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1676958679;
	bh=4Ryms4gHoy/MGnNprWGKzCdsTkn+W4ai7vFOzO+3AGw=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=ODo7CVzs5sFOwiyqDH58lvqtbRhN/pp+GDD4QD1mQcWjhYGj7KIwGzNCXNv05epkH
	 AHrXXdv5ri7R5VdJHLYFtSuAw+zt7Zc5ZYr9It1N2KHKsUuicchc0+223SRciI5eHi
	 bcysQHndCS0eGw34Z4+B0DZFd4J+TGPvdwlX+YZ4=
Date: Mon, 20 Feb 2023 21:51:17 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
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
Message-ID: <20230221055117.GA1934@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
 <20230221041440.GA1934@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221041440.GA1934@templeofstupid.com>

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

Bah, what I meant to say was emulated, unstable, or otherwise unsuitable
for use as a clocksource.  IOW, even if TSC_MODE_NEVER_EMULATE is
set, it's possible that a user is attempting a migration from a cpu
that's not invariant, and we'd still want to check for that case and
fall back to a PV clocksource, correct?

-K

