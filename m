Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22ED69DA0C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 05:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498510.769384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUK3I-0004ae-EG; Tue, 21 Feb 2023 04:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498510.769384; Tue, 21 Feb 2023 04:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUK3I-0004Xs-BH; Tue, 21 Feb 2023 04:14:52 +0000
Received: by outflank-mailman (input) for mailman id 498510;
 Tue, 21 Feb 2023 04:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpaj=6R=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUK3G-0004Wh-Qe
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 04:14:51 +0000
Received: from buffalo.birch.relay.mailchannels.net
 (buffalo.birch.relay.mailchannels.net [23.83.209.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c99ed3-b19e-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 05:14:47 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CB094920D9C
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 04:14:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 6A9C4921502
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 04:14:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.48.87 (trex/6.7.1); Tue, 21 Feb 2023 04:14:44 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4PLQsv3tn5zkr
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 20:14:43 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e009c by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 20 Feb 2023 20:14:40 -0800
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
X-Inumbo-ID: 45c99ed3-b19e-11ed-933d-83870f6b2ba8
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676952884; a=rsa-sha256;
	cv=none;
	b=Dcb93+Ix0KE5U69ERGMEFGNvx+cG1KWohtKFjaiZiWSP2Zfn5KOvZEihwtvMGT50P0KOsy
	IrW1+zBgoWxdg1hDOO2g/Sxl4nzazMGhLPnggvLyNZVzZ964I4IYR7pYGc+7qb4+3slyvw
	NgjjtwyxF/LOiNkPUhrUPXyJwneDmqxhlovH1Kk3H/ptmf4xn1a7y/NUeR8JcBvzFbic7z
	NYQyHSLxDUfLfHvVzm+yi94WME2vfNhQOKFc8ZDR5v6/sVfIe4/xybNFGOTbMUklFXgPqa
	VYknZc65LRVH9ias8iPuAbIr17EWkr1jWAZYN+RsSavaVMnqSrLr5TtrExWHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1676952884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ImnJPBdDN9t/YWBpOudrdBxjWvZR/5gNnDFra2E2Guo=;
	b=JnwHYpRJClI69omoN2UKoh2P9GKnV973fFh15ZaSDL/KU2RN9Tne9emix6eFrbelXubwUY
	1tSPu4BTxNaJtEPSwMwYL1X7wynHMG2em6d7bTxByczXAetuFlCBF2Lha4cqAGVNwYOGqB
	Tyv3fzPtDdsv5j5zCXYR7gdxlWp9H1+c33QYFAIghsFsWlIClRW8660QuMb4NdFBi92Lil
	FYFhzL2Fxr0Ja6gbqLksSm3xyFwZcKrSalTP6VFopIV4uSpM3wsu3eZMSqsivyd8KQia5l
	oxdts56v9hm+jWxdzR6VLbYGmZrYRDbk/WWHz4KHl7q/KhQMcIHeeK2sZS7Dsg==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-pxv92;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Army-Vacuous: 623ca1691d9b7218_1676952884663_3200941994
X-MC-Loop-Signature: 1676952884663:2113353332
X-MC-Ingress-Time: 1676952884663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1676952883;
	bh=ImnJPBdDN9t/YWBpOudrdBxjWvZR/5gNnDFra2E2Guo=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=k50CCeG1AwC0vdT3btOV+KuR/P19UQfyulQMidh855dABo99SvbqOYjlLia6T2Jq7
	 25IXt8VQFc6besORNDAPWD44BZBnVom61wSkATjq/E+342pQKcL794bjulfB8nX5hW
	 NQYr4v7daSO72mW0wgSYvqS3DWYURzi891BhbDgE=
Date: Mon, 20 Feb 2023 20:14:40 -0800
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
Message-ID: <20230221041440.GA1934@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
 <87h6vgov2p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6vgov2p.ffs@tglx>

On Mon, Feb 20, 2023 at 11:01:18PM +0100, Thomas Gleixner wrote:
> On Mon, Feb 20 2023 at 09:17, Krister Johansen wrote:
> > @@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
> >  	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> >  	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> >  
> > -	/* tsc_mode = no_emulate (2) */
> > -	if (ebx != 2)
> > +	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
> >  		return 0;
> >  
> >  	return 1;
> 
> What about removing more stupidity from that function?
> 
> static bool __init xen_tsc_safe_clocksource(void)
> {
> 	u32 eax, ebx. ecx, edx;
>  
> 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
> 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
> 
> 	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
> }

I'm all for simplifying.  I'm happy to clean up that return to be more
idiomatic.  I was under the impression, perhaps mistaken, though, that
the X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC, and
check_tsc_unstable() checks were actually serving a purpose: to ensure
that we don't rely on the tsc in environments where it's being emulated
and the OS would be better served by using a PV clock.  Specifically,
kvmclock_init() makes a very similar set of checks that I also thought
were load-bearing.

-K

