Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8F64CF11
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 19:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462475.720636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5W4r-0003ZM-C4; Wed, 14 Dec 2022 18:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462475.720636; Wed, 14 Dec 2022 18:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5W4r-0003Xa-7s; Wed, 14 Dec 2022 18:01:57 +0000
Received: by outflank-mailman (input) for mailman id 462475;
 Wed, 14 Dec 2022 18:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oonF=4M=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p5W4q-0003XU-6r
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 18:01:56 +0000
Received: from dog.birch.relay.mailchannels.net
 (dog.birch.relay.mailchannels.net [23.83.209.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 621237df-7bd9-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 19:01:52 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CD9895C1953
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 18:01:49 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 5B4B05C0E40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 18:01:49 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.58 (trex/6.7.1); Wed, 14 Dec 2022 18:01:49 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4NXNV46dFTzTh
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 10:01:48 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0042 by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 14 Dec 2022 10:01:47 -0800
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
X-Inumbo-ID: 621237df-7bd9-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1671040909; a=rsa-sha256;
	cv=none;
	b=KOXQpu/MCDoF8OavvYtI4yUGqWzUZwvgRAFLZms8+Wz0z2gP0bgnwiR+uCPMQaoIYVJrWZ
	+DgNBJlTzkmuWQQQMQGjwN2fTr1ztJFTxiIP1i0jcerAHCLsqxD7a2nwSsAYPucxgs847F
	u5HRpsCKP3u3PA3+/jnBU8WG1ITIJjCeXiTUJyShWmh8IQ4wNVxVt8coY8QCS66LI8100u
	R2gHO+XdMYDNE4pv/6xJ2zwdI9NpvZitkuq2pey2Wvlyj3yTeRGzOAZ5YP9eTjoR/LLoG5
	zY1yCrYsxuZj4glMjLMwS/ASm7x5uIpYTm/72FyTpcD7hMzfNDPmiJMbHPjWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1671040909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nzCxD9ep+HzlNnesq87i3wkKKSLnVJxdvoCsaYb8DkE=;
	b=EVHn8yeGHVF373vDppqxFAocgriXP9wkQO2gWgjfR8DBiyxTCXToikz0hnQmeStYR1fTYl
	WC2IB2/yNaipow3kBbqpLPS1elfShAZ5FCcDiFFeFrv8ma5YIIaeQS068BANtrQTkqnZ9r
	BaivQGNNWw9SPSlbLxtO7cgNb01IBHXvbU9A+ncls4X1HMYjVNGZcPBCn9GBzOsRVmlNRF
	fylijvsoLqknTjfajbIFTqIkrqcI6HELmKc1mKHO76Mz1ElZxivFRMbygyNziTn0kjAUp6
	IroiWoWRG2yUGIUfDzCvIpP6z5oPCmps5aCL9LRxgUa1cE7RDZroNKUgF9X4QQ==
ARC-Authentication-Results: i=1;
	rspamd-747d4f8b9f-rfb9v;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Supply-Dime: 2699dd4d1f0ea51e_1671040909616_1261819350
X-MC-Loop-Signature: 1671040909616:3174972027
X-MC-Ingress-Time: 1671040909615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1671040909;
	bh=nzCxD9ep+HzlNnesq87i3wkKKSLnVJxdvoCsaYb8DkE=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=OW9k8ELEAyWo+0pl83ai3xFagV5qPlnhBJEtud7VRNpzpUw4wqpMU8MMjnrnVczuo
	 JTzHJ6L0ry5Mc0/ItMtQ7l1hJfUYum5eDEp/MJzqTrNP7ctgqz2agBAj+5Zdw72tMj
	 AKsS43GKUbyW3dWNHcPVuW+wocpy+QINo+Q0VIvg=
Date: Wed, 14 Dec 2022 10:01:47 -0800
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
Message-ID: <20221214180147.GA1953@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
 <20221212155730.GA1973@templeofstupid.com>
 <20221212160524.GB1973@templeofstupid.com>
 <d1a2b785-edc7-b7da-d2f2-123d1555022e@oracle.com>
 <20221212220959.GB1935@templeofstupid.com>
 <9dfe87f0-fc95-6c28-6695-62f1f5403df6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dfe87f0-fc95-6c28-6695-62f1f5403df6@oracle.com>

On Tue, Dec 13, 2022 at 04:25:32PM -0500, Boris Ostrovsky wrote:
> 
> On 12/12/22 5:09 PM, Krister Johansen wrote:
> > On Mon, Dec 12, 2022 at 01:48:24PM -0500, Boris Ostrovsky wrote:
> > > On 12/12/22 11:05 AM, Krister Johansen wrote:
> > > > diff --git a/arch/x86/include/asm/xen/cpuid.h b/arch/x86/include/asm/xen/cpuid.h
> > > > index 6daa9b0c8d11..d9d7432481e9 100644
> > > > --- a/arch/x86/include/asm/xen/cpuid.h
> > > > +++ b/arch/x86/include/asm/xen/cpuid.h
> > > > @@ -88,6 +88,12 @@
> > > >     *             EDX: shift amount for tsc->ns conversion
> > > >     * Sub-leaf 2: EAX: host tsc frequency in kHz
> > > >     */
> > > > +#define XEN_CPUID_TSC_EMULATED       (1u << 0)
> > > > +#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
> > > > +#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
> > > > +#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
> > > > +#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
> > > > +#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)
> > > This file is a copy of Xen public interface so this change should go to Xen first.
> > Ok, should I split this into a separate patch on the linux side too?
> 
> Yes. Once the Xen patch has been accepted you will either submit the same patch for Linux or sync Linux file with Xen (if there are more differences).

Thanks.  Based upon the feedback I received from you and Jan, I may try
to shrink the check in xen_tsc_safe_clocksource() down a bit.  In that
case, I may only need to refer to a single field in the leaf that
provides this information.  In that case, are you alright with dropping
the change to the header and referring to the value directly, or would
you prefer that I proceed with adding these to the public API?

> > > > +static int __init xen_tsc_safe_clocksource(void)
> > > > +{
> > > > +	u32 eax, ebx, ecx, edx;
> > > > +
> > > > +	if (!(xen_hvm_domain() || xen_pvh_domain()))
> > > > +		return 0;
> > > > +
> > > > +	if (!(boot_cpu_has(X86_FEATURE_CONSTANT_TSC)))
> > > > +		return 0;
> > > > +
> > > > +	if (!(boot_cpu_has(X86_FEATURE_NONSTOP_TSC)))
> > > > +		return 0;
> > > > +
> > > > +	if (check_tsc_unstable())
> > > > +		return 0;
> > > > +
> > > > +	cpuid(xen_cpuid_base() + 3, &eax, &ebx, &ecx, &edx);
> > > > +
> > > > +	if (eax & XEN_CPUID_TSC_EMULATED)
> > > > +		return 0;
> > > > +
> > > > +	if (ebx != XEN_CPUID_TSC_MODE_NOEMULATE)
> > > > +		return 0;
> > > Why is the last test needed?
> > I was under the impression that if the mode was 0 (default) it would be
> > possible for the tsc to become emulated in the future, perhaps after a
> > migration.  The presence of the tsc_mode noemulate meant that we could
> > count on the falseneess of the XEN_CPUID_TSC_EMULATED check remaining
> > constant.
> 
> This will filter out most modern processors with TSC scaling support where in default mode we don't intercept RDTCS after migration. But I don't think we have proper interface to determine this so we don't have much choice but to indeed make this check.

Yes, if this remains a single boot-time check, I'm not sure that knowing
whether the processor supports tsc scaling helps us.  If tsc_mode is
default, there's always a possibility of the tsc becoming emulated later
on as part of migration, correct?

The other thing that might be possible here is to add a background
timer that periodically checks if the tsc is still not emulated, and if
it suddenly becomes so, change the rating again to prefer the xen
clocksource.  I had written this off initially as an impractical
solution, since it seemed like a lot more mechanism and because it meant
the performance characteristics of the system would change without user
intervention.  However, if this seems like a good idea, I'm not opposed
to giving it a try.

-K

