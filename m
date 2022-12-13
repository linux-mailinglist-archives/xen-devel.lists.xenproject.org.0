Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855064BC8A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 19:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461086.719118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5AUP-0002H5-Ku; Tue, 13 Dec 2022 18:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461086.719118; Tue, 13 Dec 2022 18:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5AUP-0002EB-IA; Tue, 13 Dec 2022 18:58:53 +0000
Received: by outflank-mailman (input) for mailman id 461086;
 Tue, 13 Dec 2022 18:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mprF=4L=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p5AUN-0002E3-Sf
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 18:58:52 +0000
Received: from cow.elm.relay.mailchannels.net (cow.elm.relay.mailchannels.net
 [23.83.212.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb8d130-7b18-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 19:58:48 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id A9E0A3C193E
 for <xen-devel@lists.xenproject.org>; Tue, 13 Dec 2022 18:58:45 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 3F1F23C2162
 for <xen-devel@lists.xenproject.org>; Tue, 13 Dec 2022 18:58:45 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.123.200.72 (trex/6.7.1); Tue, 13 Dec 2022 18:58:45 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4NWnpD275xzhj
 for <xen-devel@lists.xenproject.org>; Tue, 13 Dec 2022 10:58:44 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0106 by kmjvbox (DragonFly Mail Agent v0.12);
 Tue, 13 Dec 2022 10:58:42 -0800
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
X-Inumbo-ID: 2bb8d130-7b18-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1670957925; a=rsa-sha256;
	cv=none;
	b=vbxmtodfxpAhP/S3TK48+NjWBYDR0OvBKkeJGv9vjJN66H8aXMUJXlj+07w2iX+OWz8cK0
	sxapHBK2uMRITvYyeGGu1s5USkxwWEDOXb0Q1a1SxXNhVAIEja49ZfTFT6yiz7ytrn5x/C
	1hTYZ1YCs61AT6PYZgXdD4H6JSZ0iczwAxA/35DCEtmBKIV230WtbSOALgT+qy32b2rHDn
	BL0xY+5qs4IDn9ADewDBuxdT7C44LFm3Unl/MDeHWGWCLcgC2ffp7hLYHUYll5NtE7urQy
	5M79SgMpwBgXR8GqOBuhUXVQUfjzBUtu0DEq6PenP7Ocr+P3yG0z2lXqlW0wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1670957925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=E0qUk9TTQJ05tyym3+Ykvnx/NywduTmX7ZoBw4ir51k=;
	b=NXSLQcRbT2saxtsgmEjKwf1sWyth/k73W2naGvnIqY+VdOZCauVYSIk9fsDLEISu7B4IDD
	Bmn+NlUxU3tKxi3Zc4Zp2h+XkogU3S08Irl8iIX/Q2EMeccsabaVKeLRWhli5tNNu/iQow
	LOeNWZgCMk0dwz1gCmzpwSbuRBlsknUviddq1Ipw0Vs6sO+1+Ti/VG7ShIHoRL83a3YEB3
	HxNVU4HWt64YupEtazTQVbTlnGp+a500CZ8XtXaOssb6D0KbH2QuNgrCqBAME197j0LglT
	uPBWtz9jOZ6mdJO+jkyIyGCOExvVBPHV/IBjXk76Il1AJbyCNPZcVQz0cRNeXg==
ARC-Authentication-Results: i=1;
	rspamd-85f95c7974-5pdxx;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Towering-Whispering: 3f7945cf58d1283b_1670957925521_3882195599
X-MC-Loop-Signature: 1670957925521:1036023872
X-MC-Ingress-Time: 1670957925521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1670957924;
	bh=E0qUk9TTQJ05tyym3+Ykvnx/NywduTmX7ZoBw4ir51k=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=HDlQsT9u0YLBXZPEfKIFYcff6girmqTtncfGBUnOmGwWXI8rggk9jNK67G3PGTWu9
	 ZA5nMtDJs5WyZ9/CSfZTiuoR1IPMmnkmhbYXgmL8zt9VQ3CFzueXSSGvUkUMrAQvXm
	 LYX/C+ss6rRjla0ibnVwKS78ieA28c89hHxwgV+w=
Date: Tue, 13 Dec 2022 10:58:42 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH linux-next v2] x86/xen/time: prefer tsc as clocksource
 when it is invariant
Message-ID: <20221213185842.GA1987@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
 <20221212155730.GA1973@templeofstupid.com>
 <20221212160524.GB1973@templeofstupid.com>
 <1eb6048b-bf23-78a0-9c3c-54bbd12c3864@suse.com>
 <20221212220519.GA1935@templeofstupid.com>
 <60582b25-4fb9-a2c8-9db3-9b5593f039c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60582b25-4fb9-a2c8-9db3-9b5593f039c1@suse.com>

On Tue, Dec 13, 2022 at 08:23:29AM +0100, Jan Beulich wrote:
> On 12.12.2022 23:05, Krister Johansen wrote:
> > On Mon, Dec 12, 2022 at 05:46:29PM +0100, Jan Beulich wrote:
> >> On 12.12.2022 17:05, Krister Johansen wrote:
> >>> Both the Intel SDM[4] and the Xen tsc documentation explain that marking
> >>> a tsc as invariant means that it should be considered stable by the OS
> >>> and is elibile to be used as a wall clock source.  The Xen documentation
> >>> further clarifies that this is only reliable on HVM and PVH because PV
> >>> cannot intercept a cpuid instruction.
> >>
> >> Without meaning to express a view on the argumentation as a whole, this
> >> PV aspect is suspicious. Unless you open-code a use of the CPUID insn
> >> in the kernel, all uses of CPUID are going to be processed by Xen by
> >> virtue of the respective pvops hook. Documentation says what it says
> >> for environments where this might not be the case.
> > 
> > Thanks, appreciate the clarification here. Just restating this for my
> > own understanding: your advice would be to drop this check below?
> 
> No, I'm unconvinced of if/where this transformation is really appropriate.

Ah, I see.  You're saying that you're not convinced that this code
should ever lower the priority of xen clocksource in favor of the tsc?
If so, are you willing to say a bit more about what you find to be
unconvincing?

In as much detail as I can muster: the impetus for the patch was that I
had a variety of different systems running as both kvm and xen guests.
Some of these guests had clocksource tunings in place as a result of
consulting the documentation linked in the patch.  But others didn't.
On kvm they had somehow done the "right" (?) thing.  Some systems had
tuning in place for xen, despite no longer being a xen guests.  Other
systems were running on xen and didn't have the recommended tuning
applied.  That's all sorted now, but it seemed like it might be nice to
eliminate the need for others to do this in future. With kvm doing
something similar, I thought there might be enough precedent to consider
this for xen guests.

> My comment was merely to indicate that the justification for ...
> 
> >>> +	if (!(xen_hvm_domain() || xen_pvh_domain()))
> >>> +		return 0;
> 
> ... this isn't really correct.

The rationale for this bit of code was the justification that turns
out to be incorrect.  That sounds to me like I have unnessary code,
unless I was right by mistake?

> > And then update the commit message to dispense with the distinction
> > between HVM, PV, and PVH?
> > 
> >>> +	cpuid(xen_cpuid_base() + 3, &eax, &ebx, &ecx, &edx);
> >>
> >> Xen leaf 3 has sub-leaves, so I think you need to set ecx to zero before
> >> this call.
> > 
> > The cpuid() inline in arch/x86/include/asm/processor.h assigns zero to
> > ecx prior to calling __cpuid.  In arch/x86/boot/cpuflags.c the macros
> > are a little different, but it looks like there too, the macro passes 0
> > as an input argument to cpuid_count which ends up being %ecx.  Happy to
> > fix this up if I'm looking at the wrong cpuid functions, though.
> 
> Oh, I didn't expect cpuid() to be more than a trivial wrapper around the
> the pvops hook, and I merely looked at native_cpuid() and xen_cpuid().
> I'm sorry for the noise then. Yet still, with there being sub-leaves, I'd
> recommend switching to cpuid_count() just for clarity.

No apology necessary.  I'm happy to modify this to use cpuid_count() for
clarity.

-K

