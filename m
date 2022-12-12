Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35664A9FC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 23:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459952.717743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4qzw-00041L-3q; Mon, 12 Dec 2022 22:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459952.717743; Mon, 12 Dec 2022 22:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4qzv-0003yn-Vy; Mon, 12 Dec 2022 22:10:07 +0000
Received: by outflank-mailman (input) for mailman id 459952;
 Mon, 12 Dec 2022 22:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bIl=4K=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p4qzu-0003u7-Gl
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 22:10:06 +0000
Received: from cyan.elm.relay.mailchannels.net
 (cyan.elm.relay.mailchannels.net [23.83.212.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba364a09-7a69-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 23:10:05 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CC3E6140683
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 22:10:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 69AE8140EB6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 22:10:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.126.30.15 (trex/6.7.1); Mon, 12 Dec 2022 22:10:02 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4NWG5P5YM9zSJ
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 14:10:01 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0085 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 12 Dec 2022 14:09:59 -0800
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
X-Inumbo-ID: ba364a09-7a69-11ed-8fd2-01056ac49cbb
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1670883002; a=rsa-sha256;
	cv=none;
	b=YoLZwX4mOUX9eh/2XaOTwUNPVz34o9Ef5VjM/mI7KJCTW7d72OMPEXzj3LjuAYNK/k4nBx
	XQ57e18xd6MbdMjDs2XO7eklFkRpHQvQ2j+1W+vq/VkeXJFov8i5pmoGJlVnjHa6HgZUS3
	ZIp4N7+whK/u8M6g9kJwz+X6uqhcNvYUq7YG3LMkQ7w06IYPlBnAl0Nyii7cRcCA8cdYfF
	0IDbXv3fpFymiiksZ/Y26Y7thTd7+mmNMPnqjngw4quEgykW2GLNl/sJy3x4wv8Hd7gmB0
	oTmhYyS/3MHixELnrMe0OUk+JQtsGuxWel0UDXV7oIJS9UMFpe7NOFiCz7u1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1670883002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=pm5eqDMj3rjNgwZzS8R4PcNizlLd7CBAVERWYcW9iw4=;
	b=ficQm+9VUbqGrpoAthl6W4v++XofTw0CBjXSVT+ow7EPIsFiQt5/BgOEwMVv8aaoen71WV
	KAsTgsQ0bEKpoKDILPbrvgmTTWOp59Zd58CZtz4NWxW/jNDoVBJ2AagEzKYJpoz8VzSZuu
	PWCEOV15g6Hda2O1s2uzaYDk19AYMrOwvFbt4pb4GU4QsU6iCKOfhzRsd2F0HA0NMCoPGb
	Ks0k9Ve3ibMHzjZVZY4nVakYFMQLi+V6rkifrtbSDoAN79r9oSwVqK4+/fGgchTsjVGcci
	BMLe6ITP5xhEREEeQVEUa/bzFov2JT1VYketvHZtiIiApe6EVLNxWgxDlUuIFg==
ARC-Authentication-Results: i=1;
	rspamd-d48c5ddb-fm2bt;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Shoe-Shade: 413473be1f418294_1670883002664_1077170803
X-MC-Loop-Signature: 1670883002664:3068330651
X-MC-Ingress-Time: 1670883002664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1670883001;
	bh=pm5eqDMj3rjNgwZzS8R4PcNizlLd7CBAVERWYcW9iw4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=f9hSBodhCnCMpYIiSsG8QLdPAzLYTZ5bzy4zI0VIMnlbZDqxmnP5CgZslJn9VF2St
	 t0hhglW3mSrJgJLRCw9L7LX0Z5YSLRYQVDEN4mZZ5Kd9Ht4PFuZv3x+XURi/eONFKt
	 lKcybtBYxxFSmWg+nH1cieN9Xrhs8usIGK78YYzM=
Date: Mon, 12 Dec 2022 14:09:59 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next v2] x86/xen/time: prefer tsc as clocksource
 when it is invariant
Message-ID: <20221212220959.GB1935@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
 <20221212155730.GA1973@templeofstupid.com>
 <20221212160524.GB1973@templeofstupid.com>
 <d1a2b785-edc7-b7da-d2f2-123d1555022e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a2b785-edc7-b7da-d2f2-123d1555022e@oracle.com>

On Mon, Dec 12, 2022 at 01:48:24PM -0500, Boris Ostrovsky wrote:
> 
> On 12/12/22 11:05 AM, Krister Johansen wrote:
> > 
> > diff --git a/arch/x86/include/asm/xen/cpuid.h b/arch/x86/include/asm/xen/cpuid.h
> > index 6daa9b0c8d11..d9d7432481e9 100644
> > --- a/arch/x86/include/asm/xen/cpuid.h
> > +++ b/arch/x86/include/asm/xen/cpuid.h
> > @@ -88,6 +88,12 @@
> >    *             EDX: shift amount for tsc->ns conversion
> >    * Sub-leaf 2: EAX: host tsc frequency in kHz
> >    */
> > +#define XEN_CPUID_TSC_EMULATED       (1u << 0)
> > +#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
> > +#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
> > +#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
> > +#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
> > +#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)
> 
> This file is a copy of Xen public interface so this change should go to Xen first.

Ok, should I split this into a separate patch on the linux side too?

> > +static int __init xen_tsc_safe_clocksource(void)
> > +{
> > +	u32 eax, ebx, ecx, edx;
> > +
> > +	if (!(xen_hvm_domain() || xen_pvh_domain()))
> > +		return 0;
> > +
> > +	if (!(boot_cpu_has(X86_FEATURE_CONSTANT_TSC)))
> > +		return 0;
> > +
> > +	if (!(boot_cpu_has(X86_FEATURE_NONSTOP_TSC)))
> > +		return 0;
> > +
> > +	if (check_tsc_unstable())
> > +		return 0;
> > +
> > +	cpuid(xen_cpuid_base() + 3, &eax, &ebx, &ecx, &edx);
> > +
> > +	if (eax & XEN_CPUID_TSC_EMULATED)
> > +		return 0;
> > +
> > +	if (ebx != XEN_CPUID_TSC_MODE_NOEMULATE)
> > +		return 0;
> 
> Why is the last test needed?

I was under the impression that if the mode was 0 (default) it would be
possible for the tsc to become emulated in the future, perhaps after a
migration.  The presence of the tsc_mode noemulate meant that we could
count on the falseneess of the XEN_CPUID_TSC_EMULATED check remaining
constant.

-K

