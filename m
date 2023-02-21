Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7169E5D6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499083.770113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWLE-00075k-1k; Tue, 21 Feb 2023 17:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499083.770113; Tue, 21 Feb 2023 17:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWLD-00072q-UK; Tue, 21 Feb 2023 17:22:11 +0000
Received: by outflank-mailman (input) for mailman id 499083;
 Tue, 21 Feb 2023 17:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpaj=6R=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUWLD-00072a-55
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:22:11 +0000
Received: from bumble.maple.relay.mailchannels.net
 (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44136aff-b20c-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 18:22:08 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 7E37E640D4C
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 17:22:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 172E4641123
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 17:22:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.109.138.62 (trex/6.7.1); Tue, 21 Feb 2023 17:22:06 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4PLmLN0f0Dzyl
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 09:22:03 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0049 by kmjvbox (DragonFly Mail Agent v0.12);
 Tue, 21 Feb 2023 09:22:00 -0800
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
X-Inumbo-ID: 44136aff-b20c-11ed-a089-e9535cc0f9c3
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677000126; a=rsa-sha256;
	cv=none;
	b=o9FVfGd+S5cbGE25X6uMiTupqVMxKNZq+be6g+k5TuI59ZyjSBvzerbgp5dhGpz5SBv+CJ
	4PteRvLicgDQqAdRvZX+xbsFJfycnpeh+YFS6Y79L8KllgMxpVFcEnaXbtvH2U4js9EMwa
	KtxGoYDXPbzZCHQ1qddQii6Nw70wZMZLEo5kRz1hBiTeFh/4jcbWzqqScjyeniEYpV5wW0
	sRoZw7PhGXhGCGBp11lXh4Q78Zh54+ykOAE/ohhHTnx6dVhvPnvNxFGftWHa4t2ojtbYU8
	xytaUgQzulG32eIchUArzigxGSqiM9ogRYjpqHcXtFSAfWf26WnpZXgs9GjgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677000126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=V/XcrwQCic125n2lnngmDNOBHq5WbsWAtWXZs/Ki6+I=;
	b=O58r4wR44Bi7btXXk0tmTJkuiA9es2N5rQNlo1qCWiHZWf/NVOQxVkIyg7xjkfyP9Lp2ER
	npFT/doMfOAKL3j6TQwMirKvsFjMlfQ8G5zqn4plqfYvPZxlxcKH+ox8o0CkLFLPXSzIRY
	uG62+cK64UcndoqXUuLqvn1pj0nk3qrzcpuVlXp7d0b6xn136Mppqgg3YvFIVSo8G6jz2t
	uwD1e1PQt7TcjD7i8p/Q4r8VNMdv7UJOnZmYWpG07ya7ZOVJGnvqfyfMSwWzM0Q1OzdzJp
	VAw4obKkV31Iwbayua2s92szIFCAUFpkIGdSkM3SA3Dp+R1lL+6m9BP7QhqT7g==
ARC-Authentication-Results: i=1;
	rspamd-5db48964c-ktlv5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Trade-Relation: 02c95bf72858f16f_1677000126326_4027845758
X-MC-Loop-Signature: 1677000126326:668681715
X-MC-Ingress-Time: 1677000126326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677000124;
	bh=V/XcrwQCic125n2lnngmDNOBHq5WbsWAtWXZs/Ki6+I=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=t38e3ebH6n0d5KAs1qjo+n9b7yYz904DV8k7Xm4gfAeAvlRyaKDDgF5f5myB4DFNz
	 GW/e+O3i5YqMryRYNEMlfdLI1G8jHb8ihCRKW5zanR4jwJU2dynL91n7DmCWMgQWcL
	 uJvrwUpSBfmIbAhMqrx8ptJvUv1RXb6kjneLFU9o=
Date: Tue, 21 Feb 2023 09:22:00 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Juergen Gross <jgross@suse.com>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Jan Beulich <jbeulich@suse.com>,
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
Message-ID: <20230221172200.GB1958@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
 <20230221041440.GA1934@templeofstupid.com>
 <20230221055117.GA1934@templeofstupid.com>
 <cd9acc63-c352-93c8-56bf-52ef69e5e124@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd9acc63-c352-93c8-56bf-52ef69e5e124@suse.com>

On Tue, Feb 21, 2023 at 09:47:24AM +0100, Juergen Gross wrote:
> On 21.02.23 06:51, Krister Johansen wrote:
> > On Mon, Feb 20, 2023 at 08:14:40PM -0800, Krister Johansen wrote:
> > > On Mon, Feb 20, 2023 at 11:01:18PM +0100, Thomas Gleixner wrote:
> > > > On Mon, Feb 20 2023 at 09:17, Krister Johansen wrote:
> > > > > @@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
> > > > >   	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > > > >   	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > > > > -	/* tsc_mode = no_emulate (2) */
> > > > > -	if (ebx != 2)
> > > > > +	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
> > > > >   		return 0;
> > > > >   	return 1;
> > > > 
> > > > What about removing more stupidity from that function?
> > > > 
> > > > static bool __init xen_tsc_safe_clocksource(void)
> > > > {
> > > > 	u32 eax, ebx. ecx, edx;
> > > > 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> > > > 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> > > > 
> > > > 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> > > > }
> > > 
> > > I'm all for simplifying.  I'm happy to clean up that return to be more
> > > idiomatic.  I was under the impression, perhaps mistaken, though, that
> > > the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
> > > check_tsc_unstable() checks were actually serving a purpose: to ensure
> > > that we don't rely on the tsc in environments where it's being emulated
> > > and the OS would be better served by using a PV clock.  Specifically,
> > > kvmclock_init() makes a very similar set of checks that I also thought
> > > were load-bearing.
> > 
> > Bah, what I meant to say was emulated, unstable, or otherwise unsuitable
> > for use as a clocksource.  IOW, even if TSC_MODE_NEVER_EMULATE is
> > set, it's possible that a user is attempting a migration from a cpu
> > that's not invariant, and we'd still want to check for that case and
> > fall back to a PV clocksource, correct?
> 
> But Thomas' suggestion wasn't changing any behavior compared to your
> patch. It just makes it easier to read.
> 
> If you are unsure your patch is correct, please verify the correctness
> before sending it.

Thanks, and apologies. I misunderstood and thought a more complex change
was requested.

-K

